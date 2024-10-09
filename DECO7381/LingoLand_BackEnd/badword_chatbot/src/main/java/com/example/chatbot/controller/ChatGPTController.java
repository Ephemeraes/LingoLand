package com.example.chatbot.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import okhttp3.OkHttpClient;
import okhttp3.Response;

/**
 * ChatGPTController is responsible for managing interactions with OpenAI's ChatGPT API.
 * It exposes RESTful endpoints to send user messages to the GPT-3.5 model and handle the conversation history.
 */
@RestController
@RequestMapping("/api/chatgpt")
public class ChatGPTController {

    // OkHttpClient instance used to make HTTP requests to the ChatGPT API
    private final OkHttpClient client;

    // Map to hold conversation history for different topics, where each topic has a unique conversation history
    private final Map<String, JSONArray> conversationTopics; // Stores conversation history for each topic

    // OpenAI ChatGPT API endpoint URL
    private static final String API_URL = "https://api.openai.com/v1/chat/completions";

    // Constructor that initialises the OkHttpClient and conversation history map
    public ChatGPTController() {
        this.client = new OkHttpClient(); // Initialise OkHttp client for sending HTTP requests
        this.conversationTopics = new HashMap<>(); // Map to store conversation history for different topics
    }

    /**
     * Handles POST requests to the /send endpoint.
     * It sends the user's message to the ChatGPT API and returns the assistant's response.
     *
     * @param requestBody The request body contains the user's message, a topic ID to track the conversation, and an optional "newTopic" flag.
     * @return A map containing the assistant's response or an error if the request fails.
     * @throws IOException If there is a problem making the API request.
     */
    @PostMapping("/send")
    public Map<String, Object> sendMessage(@RequestBody Map<String, String> requestBody) throws IOException {
        // Extract the user's message and the topic ID from the request body
        String userMessage = requestBody.get("message"); // User's input message
        String topicId = requestBody.get("topicId");  // A unique ID for each conversation topic
        boolean isNewTopic = Boolean.parseBoolean(requestBody.getOrDefault("newTopic", "false"));  // Flag to check if this is a new topic

        // If it's a new topic, initialise a new conversation by clearing any existing history
        if (isNewTopic) {
            JSONArray newMessages = new JSONArray(); // Array to hold the new conversation messages
            JSONObject systemMessage = new JSONObject(); // System message that defines the conversation context
            systemMessage.put("role", "system");
            systemMessage.put("content", "You are an intelligent assistant helping users with English grammar learning and practice.");
            newMessages.put(systemMessage); // Add system message to the conversation
            conversationTopics.put(topicId, newMessages); // Save the new conversation in the map with the topicId

        }

        // Retrieve the conversation history for the specified topic, or create a new one if it doesn't exist
        JSONArray messages = conversationTopics.getOrDefault(topicId, new JSONArray());

        // Add the user's message to the conversation history
        JSONObject userMessageObj = new JSONObject();
        userMessageObj.put("role", "user"); // The user's role in the conversation
        userMessageObj.put("content", userMessage); // The content of the user's message
        messages.put(userMessageObj); // Add the user's message to the conversation history

        // Prepare the JSON payload to send to the ChatGPT API, including the full conversation history
        JSONObject json = new JSONObject();
        json.put("model", "gpt-3.5-turbo"); // Specify the model to be used
        json.put("messages", messages); // Include the conversation history in the API request

        // Create an OkHttp request object with the JSON payload to send to the ChatGPT API
        okhttp3.RequestBody body = okhttp3.RequestBody.create(
                json.toString(), okhttp3.MediaType.parse("application/json; charset=utf-8"));

        // The OpenAI API key (Replace this with a valid API key)
        String apiKey = "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";
        okhttp3.Request request = new okhttp3.Request.Builder()
                .url(API_URL) // OpenAI API endpoint
                .header("Authorization", "Bearer " + apiKey) // Add the API key in the request header
                .post(body) // Set the HTTP method to POST and include the request body
                .build();

        // Execute the request and capture the response from the ChatGPT API
        String responseBody;
        try (Response response = client.newCall(request).execute()) {
            responseBody = response.body().string();
            if (!response.isSuccessful()) {
                throw new IOException("Unexpected code " + response); // Throw an error if the API call fails
            }
        }

        // Parse the assistant's response from the API response body
        JSONObject assistantMessage = new JSONObject();
        assistantMessage.put("role", "assistant"); // The assistant's role in the conversation
        assistantMessage.put("content", new JSONObject(responseBody)
                .getJSONArray("choices")
                .getJSONObject(0)
                .getJSONObject("message")
                .getString("content")); // Extract the assistant's reply content
        messages.put(assistantMessage);  // Add the assistant's reply to the conversation history

        // Prepare the response to return to the user
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("status", "success"); // Indicate that the request was successful
        responseMap.put("response", assistantMessage.getString("content")); // Include the assistant's reply

        return responseMap; // Return the assistant's reply to the user
    }
}

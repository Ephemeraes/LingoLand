package com.example.badwords.controller;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * The BadwordsController class handles bad words management and provides RESTful API
 * endpoints for detecting, adding, removing, and checking bad words in a text.
 */
@RestController
@RequestMapping("/api/badwords")
public class BadwordsController {

    // Singleton instance to ensure only one instance of BadwordsController exists
    private static BadwordsController instance;

    // JSONObject to hold the list of bad words read from the JSON file
    private JSONObject jsonObject;

    // Private constructor to initialise the bad words list from a JSON file on application startup
    private BadwordsController() {
        JSONParser parser = new JSONParser();
        try {
            // Parse the bad words from a JSON file located in the "src/badwords/words.json" path
            Object obj = parser.parse(new FileReader("C:\\DECO7381\\LingoLand_BackEnd\\badword_chatbot\\src\\badwords\\words.json"));
            jsonObject = (JSONObject) obj;
        } catch (IOException | ParseException ex) {
            Logger.getLogger(BadwordsController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Method to return the singleton instance of BadwordsController
    public static BadwordsController getInstance() {
        if (instance == null) {
            instance = new BadwordsController();
        }
        return instance;
    }

    /**
     * API Endpoint to retrieve all bad words.
     *
     * @return A list of all bad words in JSON format.
     */
    @GetMapping("/list")
    public Map<String, Object> showBadWords() {
        JSONArray badWordsList = (JSONArray) jsonObject.get("bad");
        Map<String, Object> response = new HashMap<>();
        response.put("badWords", badWordsList);
        return response;
    }

    /**
     * API Endpoint to add new bad words to the list.
     *
     * @param requestBody A string of space-separated words to be added to the bad words list.
     * @return A success message after adding the words, or an error message if the operation fails.
     */
    @PostMapping("/edit")
    public Map<String, String> editBadWords(@RequestBody Map<String, String> requestBody) {
        String words = requestBody.get("words");
        // Split the input string into an array of words
        String[] wordArray = words.trim().split(" ");
        JSONArray badWordsList = (JSONArray) jsonObject.get("bad");

        // Add each new word to the bad words list
        for (String word : wordArray) {
            badWordsList.add(word);
        }

        // Update the JSON object and write the changes back to the file
        jsonObject.put("bad", badWordsList);
        try (FileWriter file = new FileWriter("src/badwords/words.json")) {
            file.write(jsonObject.toJSONString());
            file.flush();
        } catch (IOException e) {
            Logger.getLogger(BadwordsController.class.getName()).log(Level.SEVERE, null, e);
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("message", "Error updating bad words");
            return errorResponse;
        }

        // Return a success message
        Map<String, String> response = new HashMap<>();
        response.put("message", "Bad words updated successfully");
        return response;
    }

    /**
     * API Endpoint to delete bad words from the list.
     *
     * @param requestBody A string containing space-separated bad words to be removed.
     * @return A success message if the words are removed, or an error message if the operation fails.
     */
    @DeleteMapping("/delete")
    public Map<String, String> deleteBadWords(@RequestBody Map<String, String> requestBody) {
        String words = requestBody.get("words");
        // Split the input string into an array of words
        String[] wordArray = words.trim().split(" ");
        JSONArray badWordsList = (JSONArray) jsonObject.get("bad");

        // Remove each word from the bad words list
        for (String word : wordArray) {
            badWordsList.removeIf(badWord -> ((String) badWord).equalsIgnoreCase(word));
        }

        // Update the JSON object and write the changes back to the file
        jsonObject.put("bad", badWordsList);
        try (FileWriter file = new FileWriter("src/badwords/words.json")) {
            file.write(jsonObject.toJSONString());
            file.flush();
        } catch (IOException e) {
            Logger.getLogger(BadwordsController.class.getName()).log(Level.SEVERE, null, e);
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("message", "Error deleting bad words");
            return errorResponse;
        }

        // Return a success message
        Map<String, String> response = new HashMap<>();
        response.put("message", "Bad words deleted successfully");
        return response;
    }

    /**
     * API Endpoint to check if the input string contains any bad words.
     *
     * @param requestBody A string input to be checked for bad words.
     * @return A response indicating whether the input contains bad words.
     */
    @PostMapping("/check")
    public Map<String, Object> containsBadWord(@RequestBody Map<String, String> requestBody) {
        String input = requestBody.get("input");
        JSONArray badWordsList = (JSONArray) jsonObject.get("bad");

        boolean containsBadWord = false;
        // Iterate through the bad words list and check if the input contains any bad word
        Iterator<String> iterator = badWordsList.iterator();
        while (iterator.hasNext()) {
            if (input.contains(iterator.next())) {
                containsBadWord = true;
                break;
            }
        }

        // Return whether bad words were found
        Map<String, Object> response = new HashMap<>();
        response.put("containsBadWord", containsBadWord);
        return response;
    }

    /**
     * API Endpoint to count how many bad words are in the input string.
     *
     * @param requestBody A string input to be checked.
     * @return The count of bad words found in the input string.
     */
    @PostMapping("/count")
    public Map<String, Object> countBadWords(@RequestBody Map<String, String> requestBody) {
        String input = requestBody.get("input");
        int count = 0;
        JSONArray badWordsList = (JSONArray) jsonObject.get("bad");

        // Count the number of bad words found in the input string
        Iterator<String> iterator = badWordsList.iterator();
        while (iterator.hasNext()) {
            if (input.contains(iterator.next())) {
                count++;
            }
        }

        // Return the count of bad words
        Map<String, Object> response = new HashMap<>();
        response.put("badWordCount", count);
        return response;
    }

    /**
     * API Endpoint to remove or replace bad words from the input string.
     * Bad words are replaced with asterisks by default.
     *
     * @param requestBody A JSON object containing the input string to be modified.
     * @return The modified string with bad words removed or replaced.
     */
    @PostMapping("/remove")
    public Map<String, Object> removeBadWords(@RequestBody Map<String, String> requestBody) {
        String input = requestBody.get("input");
        JSONArray badWordsList = (JSONArray) jsonObject.get("bad");

        // Iterate through the bad words list and replace them in the input string
        Iterator<String> iterator = badWordsList.iterator();
        while (iterator.hasNext()) {
            String badWord = iterator.next();
            if (input.contains(badWord)) {
                // Replace bad words with asterisks (you can replace with an empty string if needed)
                input = input.replaceAll(badWord, "*".repeat(badWord.length()));
            }
        }

        // Return the modified string
        Map<String, Object> response = new HashMap<>();
        response.put("modifiedInput", input);
        return response;
    }
}

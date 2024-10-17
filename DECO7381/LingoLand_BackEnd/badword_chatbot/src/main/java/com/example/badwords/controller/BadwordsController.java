package com.example.badwords.controller;

import com.example.badwords.model.BadWord;
import com.example.badwords.repository.BadWordRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * The BadwordsController class handles bad words management and provides RESTful API
 * endpoints for detecting, adding, removing, and checking bad words in a text.
 */
@RestController
@RequestMapping("/api/badwords")
@CrossOrigin(origins = "http://localhost:8082")
public class BadwordsController {

    @Autowired
    private BadWordRepository badWordRepository;

    /**
     * API Endpoint to retrieve all bad words for a specific user and the default list (userId=0).
     *
     * @param userId The ID of the user whose bad words are being retrieved.
     * @return A list of all bad words for the specified user and the default list.
     */
    @GetMapping("/list")
    public Map<String, Object> showBadWords(@RequestParam("userId") String userId) {
        int userIdInt = Integer.parseInt(userId);

        // Retrieve both user-specific and default bad words (userId = 0)
        List<BadWord> badWordsList = badWordRepository.findByUserIdOrUserId(userIdInt, 0);

        Map<String, Object> response = new HashMap<>();
        response.put("badWords", badWordsList); // Return all fields from the table
        return response;
    }

    /**
     * API Endpoint to check if the input string contains any bad words for a specific user.
     * It will check both the user-specific bad words and the default list (userId = 0).
     *
     * @param input  The input text to be checked.
     * @param userId The user ID for whom the bad words are being checked.
     * @return A response indicating whether the input contains bad words.
     */
    @PostMapping("/check")
    public Map<String, Object> containsBadWord(@RequestParam("input") String input, @RequestParam("userId") String userId) {
        int userIdInt = Integer.parseInt(userId);

        // Retrieve both user-specific and default bad words (userId = 0)
        List<BadWord> badWordsList = badWordRepository.findByUserIdOrUserId(userIdInt, 0);

        boolean containsBadWord = badWordsList.stream()
                .anyMatch(badWord -> input.contains(badWord.getWord()));

        Map<String, Object> response = new HashMap<>();
        response.put("containsBadWord", containsBadWord);
        return response;
    }

    /**
     * API Endpoint to count how many bad words are in the input string for a specific user.
     * It will count words from both the user-specific bad words and the default list (userId = 0).
     *
     * @param input  The input text to be counted.
     * @param userId The user ID for whom the bad words are being counted.
     * @return The count of bad words found in the input string.
     */
    @PostMapping("/count")
    public Map<String, Object> countBadWords(@RequestParam("input") String input, @RequestParam("userId") String userId) {
        int userIdInt = Integer.parseInt(userId);

        // Retrieve both user-specific and default bad words (userId = 0)
        List<BadWord> badWordsList = badWordRepository.findByUserIdOrUserId(userIdInt, 0);

        int count = 0;
        for (BadWord badWord : badWordsList) {
            if (input.contains(badWord.getWord())) {
                count++;
            }
        }

        Map<String, Object> response = new HashMap<>();
        response.put("badWordCount", count);
        return response;
    }

    /**
     * API Endpoint to add new bad words for a specific user.
     * Only operates on user-specific bad words, does not affect the default list.
     *
     * @param words  The words to be added.
     * @param userId The user ID to whom the bad words are being added.
     * @return A success message after adding the words.
     */
    @PostMapping("/add")
    public Map<String, String> addBadWords(@RequestParam("words") String words, @RequestParam("userId") String userId) {
        int userIdInt = Integer.parseInt(userId);
        String[] wordArray = words.trim().split(" ");

        // Save each word in the database for the user
        for (String word : wordArray) {
            BadWord badWord = new BadWord(word, userIdInt);
            badWordRepository.save(badWord);
        }

        Map<String, String> response = new HashMap<>();
        response.put("message", "Bad words added successfully");
        return response;
    }

    /**
     * API Endpoint to edit bad words for a specific user.
     * Only operates on user-specific bad words, does not affect the default list.
     *
     * @param badWordsId The ID of the bad word to edit.
     * @param newWord    The new word to replace the old one.
     * @return A success message after updating the word.
     */
    @PutMapping("/edit")
    public Map<String, String> editBadWords(@RequestParam("badWordsId") String badWordsId, @RequestParam("word") String newWord) {

        // Find the bad word entry by id and update it
        Optional<BadWord> badWordOptional = badWordRepository.findById(Integer.parseInt(badWordsId));
        if (badWordOptional.isPresent()) {
            BadWord badWord = badWordOptional.get();
            badWord.setWord(newWord);
            badWordRepository.save(badWord);
        }

        Map<String, String> response = new HashMap<>();
        response.put("message", "Bad word updated successfully");
        return response;
    }

    /**
     * API Endpoint to delete specific bad words for a user.
     * Only operates on user-specific bad words, does not affect the default list.
     *
     * @param words bad word to delete.
     * @param userId The user ID from which to delete the bad words.
     * @return A JSON string containing a success message after deletion.
     * @throws JsonProcessingException If there is an error during JSON processing.
     */
    @DeleteMapping("/delete")
    public String deleteBadWords(@RequestParam("words") String words, @RequestParam("userId") String userId) throws JsonProcessingException {
        int userIdInt = Integer.parseInt(userId);
        
        // Find records matching the given words and userId
        List<BadWord> badWordsList = badWordRepository.findByWordAndUserId(words, userIdInt);
        Map<String, String> response = new HashMap<>();
        ObjectMapper jsonObjectMapper = new ObjectMapper();
        if (badWordsList.isEmpty()) {
            response.put("code", String.valueOf(0));
            response.put("message", "Bad word(s) deleted failed");
            String responseJson = "";
            responseJson = jsonObjectMapper.writeValueAsString(response);
            return responseJson;
        }

        // Delete matching records
        badWordRepository.deleteAll(badWordsList);

        response.put("code", String.valueOf(1));
        response.put("message", "Bad word(s) deleted successfully");
        String responseJson = "";
        responseJson = jsonObjectMapper.writeValueAsString(response);
        return responseJson;
    }
}

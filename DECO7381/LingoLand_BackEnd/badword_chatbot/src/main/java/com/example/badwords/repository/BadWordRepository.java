package com.example.badwords.repository;

import com.example.badwords.model.BadWord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository // Marks this interface as a Spring repository, which will be used for data access operations
public interface BadWordRepository extends JpaRepository<BadWord, Integer> {

    // Query for both the user's custom bad words and the default bad words (where userId = 0)
    List<BadWord> findByUserIdOrUserId(int userId, int defaultUserId);

    List<BadWord> findByWordAndUserId(String words, int userIdInt);
}

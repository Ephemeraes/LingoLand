package com.lingoland.springbootmybatis.controller;

import com.lingoland.springbootmybatis.common.AjaxResult;
import com.lingoland.springbootmybatis.pojo.*;
import com.lingoland.springbootmybatis.service.*;
import com.lingoland.springbootmybatis.utils.MD5Utils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;

@Api(tags = "user controller")
@RestController
@RequestMapping("/user")
@CrossOrigin(origins = "http://localhost:8082")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserLoginLogService userLoginLogService;

    @Autowired
    private WordService wordService;

    @Autowired
    private VocabularyBookService vocabularyBookService;

    @Autowired
    private GrammarService grammarService;

    @Autowired
    private GrammarRecordService grammarRecordService;

    // Log in functionality
    @ApiOperation("login")
    @PostMapping("/login")
    // reference: https://blog.csdn.net/justry_deng/article/details/80972817
    public AjaxResult login(@RequestBody User user) {
        // Get user information
        if (user.getName() == null) {
            return AjaxResult.error("user name required");
        } else if (user.getPassword() == null) {
            return AjaxResult.error("password required");
        }
        User us = userService.selectUserByName(user.getName());
        if (us == null) {
            return AjaxResult.error("Invalid log in");
        }
        //encode password and pass to database
        if (!MD5Utils.decryptByMd5(user.getPassword(), us.getPassword())) {
            return AjaxResult.error("Invalid log in");
        }
        // study level

        // add log in history
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String time = format.format(new Date());
        UserLoginLog userLoginLog = new UserLoginLog();
        userLoginLog.setUserId(us.getId());
        userLoginLog.setStudyLevel(us.getStudyLevel());
        userLoginLog.setLoginTime(time);
        Integer count = userLoginLogService.selectUserLoginLogCount(userLoginLog);
        if (count == 0) {
            userLoginLogService.insertUserLoginLog(userLoginLog);
        }
        return AjaxResult.success(us);
    }

    // register
    @ApiOperation("register")
    @PostMapping("/register")
    public AjaxResult register(@RequestBody User user) {
        // Get user information
        if (user.getName() == null) {
            return AjaxResult.error("username required");
        }else if (user.getPassword() == null) {
            return AjaxResult.error("password required");
        }else if (user.getParentControlPassword() == null) {
            return AjaxResult.error("parental control password required");
        }
        User us = userService.selectUserByName(user.getName());
        if (us != null) {
            return AjaxResult.error("user already existed");
        }
        user.setPassword(MD5Utils.encodeByMd5(user.getPassword()));
        user.setParentControlPassword(MD5Utils.encodeByMd5(user.getParentControlPassword()));
        user.setLevel(1);
        if (user.getStudyLevel() == null) {
            user.setStudyLevel("junior");
        }else {
            user.setStudyLevel(user.getStudyLevel());
        }
        user.setAvatar(user.getAvatar());
        userService.insertUser(user);
        return AjaxResult.success();
    }

    //save user's learning words and scanned words to vocabulary word
    //reference: https://docs.spring.io/spring-framework/reference/data-access/transaction/declarative/annotations.html
    @Transactional
    @ApiOperation("add to vocabulary book")
    @PostMapping("/save/vocabularyBook")
    public AjaxResult vocabularyBook(@RequestBody VocabularyBook vocabularyBook) {
        // vocabulary word information
        if (vocabularyBook.getUserId() == null) {
            return AjaxResult.error("user id required");
        } else if (vocabularyBook.getWordId() == null) {
            return AjaxResult.error("word id required");
        } else if (vocabularyBook.getStudyLevel() == null || vocabularyBook.getStudyLevel() == "") {
            return AjaxResult.error("study level required");
        }
        // get user information
        User user = userService.selectUserById(vocabularyBook.getUserId());
        if (user == null) {
            return AjaxResult.error("invalid user");
        }
        // renew vocabulary information
        VocabularyBook vb = vocabularyBookService.selectVocabularyBookByUserIdAndWordIdAndStudyLevel(vocabularyBook);
        if (vb != null) {
            return AjaxResult.error("vocabulary already added");
        }
        vocabularyBook.setCreateTime(new Date());
        vocabularyBookService.insertVocabularyBook(vocabularyBook);
        // level up if finished all study task
        List<VocabularyBook> vocabularyBooks = vocabularyBookService.selectVocabularyBookListByUserIdAndStudyLevel(user.getId(), user.getStudyLevel());
//        if (vocabularyBooks.size() / 5 == 0 && vocabularyBooks.size() != 0) {
//            //Can front end level up the user?
//            user.setLevel(user.getLevel() + 1);
//            userService.updateUser(user);
//        }
        return AjaxResult.success(vocabularyBooks.size());
    }

    // save user's learned grammars
    @ApiOperation("add to grammar record")
    @PostMapping("/save/grammarRecord")
    public AjaxResult grammarRecord(@RequestBody GrammarRecord grammarRecord) {
        if (grammarRecord.getUserId() == null) {
            return AjaxResult.error("user id required");
        } else if (grammarRecord.getQuestionId() == null) {
            return AjaxResult.error("question id required");
        }
        User user = userService.selectUserById(grammarRecord.getUserId());
        if (user == null) {
            return AjaxResult.error("invalid user");
        }
        GrammarRecord grammarReco = grammarRecordService.checkGrammarRecord(user.getId(), grammarRecord.getQuestionId());
        if (grammarReco != null) {
            return AjaxResult.error("grammar record already added");
        }
        grammarRecord.setFinishTime(new Date());
        grammarRecordService.insertGrammarRecord(grammarRecord);
        List<GrammarRecord> grammarRecords = grammarRecordService.listGrammarRecordByUser(user.getId());
        return AjaxResult.success(grammarRecords.size());
    }

    // return the vocabulary notebook for specific user
@ApiOperation("get vocabulary book by user id")
@GetMapping("/vocabularyBook/list/{userId}")
public AjaxResult vocabularyBookList(@PathVariable Integer userId) {
    List<VocabularyBook> vocabularyBookList = vocabularyBookService.selectVocabularyListByUserId(userId);
    List<Word> vocabularyWords = new ArrayList<>();
    for (VocabularyBook book: vocabularyBookList) {
        String table = book.getStudyLevel();
        if (table.equals("junior")) {
            table = "juniorData";
        } else if (table.equals("middle")) {
            table = "middleData";
        } else {
            table = "seniorData";
        }
        Integer id = book.getWordId();
        Word word = wordService.findById(table, id);
        vocabularyWords.add(word);
    }
    return AjaxResult.success(vocabularyWords);
}

    // return the words data for gamification system
@ApiOperation("get daily task words by user id")
@GetMapping("/gamificationWord/{userId}")
public AjaxResult findWord(@PathVariable Integer userId) {
    User user = userService.selectUserById(userId);
    System.out.println(user);
    if (user == null) {
        return AjaxResult.error("invalid user");
    }
    
    // Log in record
    List<UserLoginLog> userLoginLogs = userLoginLogService.selectUserLoginLogListByUserIdAndStudyLevel(userId, user.getStudyLevel());
    Integer pageNum = 0;
    Integer pageSize = 4;
    boolean isReviewDay = false; 
    if (userLoginLogs != null && userLoginLogs.size() > 0) {
        // The third day (review day)
        if (userLoginLogs.size() % 3 == 0) {
            pageSize = 8;
            pageNum = (userLoginLogs.size() / 3 - 1) * pageSize;
            isReviewDay = true;
        } else {
            pageNum = (userLoginLogs.size() - 1 - Integer.valueOf(userLoginLogs.size() / 3)) * pageSize;
        }
    }

    // Select table based on user study level
    String table = "juniordata";
    if (user.getStudyLevel().equals("middle")) {
        table = "middledata";
    } else if (user.getStudyLevel().equals("senior")) {
        table = "seniordata";
    }

    // Retrieve words
    List<Word> words = wordService.findWordLimit(table, pageNum, pageSize);
    Map<String, Object> result = new HashMap<>();
    result.put("isReviewDay", isReviewDay);
    
    // Review day logic
    if (words.size() == 8) {
        List<Word> randomWords = new ArrayList<>();
        Random random = new Random();
        while (randomWords.size() < 4) {
            int index = random.nextInt(words.size());
            Word word = words.get(index);
            if (!randomWords.contains(word)) {
                randomWords.add(word);
            }
        }
        result.put("words", randomWords);
    } else {
        result.put("words", words);
    }

    return AjaxResult.success(result);
}


    // return grammar data for gamification system
@ApiOperation("get daily grammar tasks by user id")
@GetMapping("/gamificationGrammar/{userId}")
public AjaxResult findGrammar(@PathVariable Integer userId) {
    User user = userService.selectUserById(userId);
    System.out.println(user);
    if (user == null) {
        return AjaxResult.error("invalid user");
    }

    // Log in record
    List<UserLoginLog> userLoginLogs = userLoginLogService.selectUserLoginLogListByUserIdAndStudyLevel(userId, user.getStudyLevel());
    Integer pageNum = 0;
    Integer pageSize = 2;
    boolean isReviewDay = false;
    if (userLoginLogs != null && userLoginLogs.size() > 0) {
        // The third day (review day)
        if (userLoginLogs.size() % 3 == 0) {
            pageSize = 4;
            pageNum = (userLoginLogs.size() / 3 - 1) * pageSize;
            isReviewDay = true;
        } else {
            pageNum = (userLoginLogs.size() - 1 - Integer.valueOf(userLoginLogs.size() / 3)) * pageSize;
        }
    }

    // Retrieve grammar data
    List<Grammar> grammars = grammarService.findGrammarLimit(pageNum, pageSize);
    Map<String, Object> result = new HashMap<>();
    result.put("isReviewDay", isReviewDay);

    if (grammars.size() == 4) {
        List<Grammar> randomGrammars = new ArrayList<>();
        Random random = new Random();
        while (randomGrammars.size() < 2) {
            int index = random.nextInt(grammars.size());
            Grammar grammar = grammars.get(index);
            if (!randomGrammars.contains(grammar)) {
                randomGrammars.add(grammar);
            }
        }
        result.put("grammars", randomGrammars);
    } else {
        result.put("grammars", grammars);
    }

    return AjaxResult.success(result);
}

    // return user information
    //reference: https://stackoverflow.com/questions/57905483/combining-pathvariable-and-requestbody
    @ApiOperation("Get User Info by ID")
    @GetMapping("/info/{id}")
    public AjaxResult info(@PathVariable Integer id) {
        User user = userService.selectUserById(id);
        return AjaxResult.success(user);
    }

    // update user information
    @ApiOperation("update")
    @PostMapping("/update")
    public AjaxResult update(@RequestBody User user) {
        userService.updateUser(user);
        return AjaxResult.success();
    }

    @ApiOperation("get last vocabulary book")
    @GetMapping("/vocabularyBook/last/{userId}")
    public AjaxResult lastVocabulary(@PathVariable Integer userId) {
        VocabularyBook vocabularyBook = vocabularyBookService.selectLastVocabularyBookByUserId(userId);
        return AjaxResult.success(vocabularyBook.getCreateTime());
    }

    @ApiOperation("get achievement record")
    @GetMapping("/achievement/{userId}")
    public AjaxResult achievement(@PathVariable Integer userId) {
        Integer wordsLearned = vocabularyBookService.selectVocabularyListByUserId(userId).size();
        Integer logInDays = userLoginLogService.selecTotaltUserLoginLogCount(userId);
        Integer userLevel = userService.selectUserById(userId).getLevel();
        List<Integer> achievement = new ArrayList<>();
        achievement.add(logInDays);
        achievement.add(wordsLearned);
        achievement.add(userLevel);
        return AjaxResult.success(achievement);
    }

    @ApiOperation("validate parental password")
    @GetMapping("/validate/parentalPassword")
    public AjaxResult achievement(@RequestParam String parentalPassword, @RequestParam Integer userId) {
        User us = userService.selectUserById(userId);
        if (!MD5Utils.decryptByMd5(parentalPassword, us.getPassword())) {
            return AjaxResult.error("Invalid Parent Password");
        }
        return AjaxResult.success(us);
    }
}

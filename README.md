# LingoLand

This project includes a React Native-based front-end application and a Java Maven back-end service, designed to provide language learners with an interactive and personalized learning experience.

## Project Overview

LingoLand aims to make learning languages fun and efficient through a variety of interactive modules, such as daily tasks, word spelling exercises, grammar lessons, and personalised progress tracking. The front-end is built with React Native to support cross-platform development for iOS and Android; The backend is built with Java for database management and API interface provision.

## Project Structure

### Overall Structure

LingoLand/
│
├── [README.md](README.md) # Project documentation
│
├── LingoLand/ # Front-end project folder
│ ├── [assets/](DECO7381/LingoLand/assets/) # Static resources, such as images and fonts
│ ├── [src/](DECO7381/LingoLand/src/) # Application source code
│ │ ├── [components/](DECO7381/LingoLand/src/components/) # Reusable React components
│ │ └── [pages/](DECO7381/LingoLand/src/pages/) # Various pages/interfaces of the application
│ ├── [ios/](DECO7381/LingoLand/ios/) # iOS specific code and configuration
│ ├── [app.json](DECO7381/LingoLand/app.json) # Expo configuration file
│ ├── [babel.config.js](DECO7381/LingoLand/babel.config.js) # Babel compiler configuration
│ ├── [metro.config.js](DECO7381/LingoLand/metro.config.js) # Metro packaging tool configuration
│ ├── [index.js](DECO7381/LingoLand/index.js) # Application entry file
│ ├── [package.json](DECO7381/LingoLand/package.json) # Project dependencies and scripts
│ └── [yarn.lock](DECO7381/LingoLand/yarn.lock) # Dependency version lock file
│
└── LingoLand_BackEnd/ # Backend project folder
├── [badword_chatbot/](DECO7381/LingoLand_BackEnd/badword_chatbot/) # ChatBot module for filtering bad words
├── [LingoLandVersion/](DECO7381/LingoLand_BackEnd/LingoLandVersion/) # Backend version implementation
├── [src/](DECO7381/LingoLand_BackEnd/LingoLandVersion/src/) # Back-end Java source code
├── [target/](DECO7381/LingoLand_BackEnd/badword_chatbot/target/) # Maven build output
└── [pom.xml](DECO7381/LingoLand_BackEnd/LingoLandVersion/pom.xml) # Maven project configuration file

## Tools/Technologies Used

1.	Front-end

a.	Technology: React Native

b.	Description:

i.	React Native allows for the development of cross-platform mobile applications, ensuring consistent performance across both iOS and Android platforms.

ii.	It facilitates the easy integration of functionality by separating development tasks by pages.

2.	Back-end

a.	Technology: Spring Boot

b.	Description: Spring Boot provides a wide range of community-supported libraries, offering strong support for back-end development.

3.	Database

a.	Technology: MySQL

b.	Description:

i.	MySQL has powerful querying capabilities, ensuring efficient data retrieval.

ii.	All sensitive word data and user IDs are stored in MySQL, ensuring consistent and personalized data management.

4.	Testing

a.	Technologies: Swagger, Postman

b.	Description: Swagger and Postman are used for testing and validating back-end APIs, allowing for testing without configuring complex environments.

5.	Third-party APIs

a.	Tesseract OCR API: The open-sourced Tesseract OCR engine is used for text recognition, allowing users to extract text from images by either capturing or uploading them. It supports the implementation of translation functionality.

b.	Google Cloud Translation API: Google Cloud Translation API uses advanced machine learning algorithms to ensure the accuracy and reliability of translation results.

6.	Open-sourced Datasets

a.	Source: GitHub

b.	Description: We have used open-sourced datasets from GitHub for learning tasks, dictionaries, and sensitive word management. The learning tasks dataset contains English vocabulary from Chinese English textbooks used in grades 3 to 9. In the future, upon receiving permission from Australian publishers, we will replace this content with Australian English textbooks.

## Frontend Overview

The front-end is built with React Native and Expo in order to achieve a cross-platform user experience for iOS and Android users.

1.	Components: Reusable components, such as buttons, titles, and input boxes.
2.	Pages: Various pages of the app, such as HomeScreen, LoginScreen, ProfileScreen, and WordSpellScreen.
3.	Expo: Testing and deploying mobile applications.

Note: For all fetch and get requests in the front-end interfaces, please change the default server address to your own IP address.

## Backend Overview

The backend is built with Java and Maven in order to provide an API interface for interaction with the front end, and includes the following features:

1.	User authentication: Secure login and registration.
2.	Data management: User data processing, progress tracking and content management.
3.	ChatBot: A chat module that provides further learning support.
4.	Database: Contains SQL scripts for setting up the database.

### Function

1.	Interactive learning: Daily tasks, grammar exercises, word spelling and quizzes, etc.
2.	Progress tracking: Users are able to view and track their learning progress and achievements.
3.	ChatBot support: Provide assistance and ensure the security of the conversation content.
4.	Personal data management: Allows users to update personal settings and information.
5.	Cross-platform support: Utilise Expo to run on both iOS and Android.

## Installation and Setup

### Prerequisite

1.	Node.js and npm are used to run the front-end.
2.	Java JDK (17 and above) and Maven are used for the backend. 
3.	Expo Go application: Designed to test the front-end on mobile devices.

### Frontend Settings (After Backend Setting)

1.	Clone repository: git clone https://github.com/Ephemeraes/LingoLand.git cd LingoLand. And change the IP address (use Global Replacement in VS code, search http and change the four numbers IP, like 198.128.0.1) which is showed on the terminal when you run npm start. (remember your phone should access the Internet with your computer). 
2.	Install dependencies: npm install. Use npm install --legacy-peer-deps instead if there are errors.
3.	Run the application: Open Expo Developer Tools. Run npm start and then yes(8082 port) and s(--expo) (remember turn off firewall). 
4.	Mobile terminal test: Open the Expo Go app and scan the QR code in the developer tools/Expo Go. 

### Backend Settings (Before Frontend Setting) 

For every back-end project 

1.	Add maven resources Go to the pom.xml and download maven sources, download terseract and change the path in ocrServiceImpl. 
2.	Reload the Project. 
3.	Change database settings: Run the SQL script in the database folder to create the necessary tables. 
4.	Link your database Change the settings of sql in pom.xml to your local database. 

### Run the Complete Application

1.	Ensure that both the front-end and back-end services have been started.
2.	The baseUrl in the new front-end configuration matches the address of the backend server.

## Problem Background

Children from non-English-speaking backgrounds face numerous challenges in learning English after relocating to Australia. These difficulties are further intensified by the current education system's expectations of a basic proficiency in English. The system can only be effective if students invest significant time and effort into their learning.

LingoLand is dedicated to enhancing children’s real-time learning outcomes using English in everyday situations, aiming to deliver more tangible results. This approach not only motivates students but also accelerates their integration into society. 

### Essential Features  

1.	English scanning and translation:

Frontend:

const openCamera = async () => {
    const result = await ImagePicker.launchCameraAsync({ mediaTypes: ImagePicker.MediaTypeOptions.Images });
    if (!result.canceled) {
        const formData = new FormData();
        formData.append('file', { uri: result.assets[0].uri, type: result.assets[0].mimeType, name: 'image.jpg' });

        const translation = await fetch('http://your-backend-url/ocr/uploadImage', {
            method: 'POST',
            headers: { 'Content-Type': 'multipart/form-data' },
            body: formData
        });
        const data = await translation.json();
        setTranslatedData(data);
    }
};

const openImageLibrary = async () => {
    const result = await ImagePicker.launchImageLibraryAsync({ mediaTypes: ImagePicker.MediaTypeOptions.Images });
    if (!result.canceled) {
        const formData = new FormData();
        formData.append('file', { uri: result.assets[0].uri, type: result.assets[0].mimeType, name: 'image.jpg' });

        const translation = await fetch('http://your-backend-url/ocr/uploadImage', {
            method: 'POST',
            headers: { 'Content-Type': 'multipart/form-data' },
            body: formData
        });
        const data = await translation.json();
        setTranslatedData(data);
    }
};

Backend:

@ApiOperation("uploadImage")
@PostMapping("/uploadImage")
public Map<String, String> ImagetoString(@RequestParam("file") MultipartFile file) throws TesseractException {
    File newFile = new File(System.getProperty("java.io.tmpdir") + "/" + file.getOriginalFilename());
    try {
        file.transferTo(newFile);  // Save the uploaded file to a temporary directory
    } catch (IOException e) {
        throw new RuntimeException(e);  // Handle file transfer exceptions
    }
    
    // Convert the image to text
    String words = ocr.imageToString(newFile);
    
    // Check if the text contains sensitive words
    boolean sensitive = ocr.sensitiveWords(words);
    
    // Translate the extracted text from English to Chinese
    String result = ocr.translatation("en", "zh", words);
    
    // Return the original text, translated text, and whether it contains sensitive words
    Map<String, String> resMap = new HashMap<>();
    resMap.put("ori", words);
    resMap.put("des", result);
    resMap.put("sensitive", String.valueOf(sensitive));
    
    return resMap;
}

2.	English dictionary: 

Frontend:

<TouchableOpacity
  onPress={() => {
    navigation.navigate('WordDetail', { word: item });  // Navigate to WordDetail page
  }}
>
  <Text>{item.word}</Text>
  <Text>{item.trans}</Text>
</TouchableOpacity>

Backend:

@ApiOperation("get dictionary")
@GetMapping("/dictionary")
public AjaxResult getDictionary() {
    return AjaxResult.success(wordService.getDictionary());
}

3.	Spelling and grammar checking:

Frontend:

const handleNextPress = () => {
    if (userInput.toUpperCase() === word.toUpperCase()) {
        setShowCorrectModal(true);  // Show the correct answer modal if the spelling is correct
    } else {
        setShowIncorrectModal(true);  // Show the incorrect answer modal if the spelling is wrong
    }
};

Backend:

@ApiOperation("search word by dictionary")
@GetMapping("/findByWord")
public AjaxResult findByWord(String word) {
    return AjaxResult.success(wordService.findByWord(word));
}

4.	Actionable learning outcomes:

Frontend:

useEffect(() => {
    if (isReviewingWords) {
        navigation.navigate('WordSpell', {
            word: words?.[currentWordIndex]?.word,
            translation: words?.[currentWordIndex]?.trans,
            explanation: words?.[currentWordIndex]?.explanation,
            onComplete: handleCorrectAnswer,
            isReviewMode: true,
            currentWordIndex: currentWordIndex
        });
    } else if (!isReviewingWords && currentGrammarIndex < grammarQuestions?.length) {
        navigation.navigate('GrammerTopic', {
            grammarQuestions: [grammarQuestions?.[currentGrammarIndex]],
            onComplete: handleCorrectAnswer,
            isReviewMode: true,
            currentGrammarIndex: currentGrammarIndex,
            totalGrammarQuestions: grammarQuestions.length
        });
    } else if (!isReviewingWords && currentGrammarIndex >= grammarQuestions?.length) {
        navigation.navigate('DailyTaskComplete');
    }
}, [isReviewingWords, currentWordIndex, currentGrammarIndex]);

Backend:

@ApiOperation("get daily task words by user id")
@GetMapping("/gamificationWord/{userId}")
public AjaxResult findWord(@PathVariable Integer userId) {
    User user = userService.selectUserById(userId);
    
    // Select the appropriate word table based on the user's study level
    String table = "juniordata";
    if (user.getStudyLevel().equals("middle")) {
        table = "middledata";
    } else if (user.getStudyLevel().equals("senior")) {
        table = "seniordata";
    }
    
    // Get the user's daily word tasks
    List<Word> words = wordService.findWordLimit(table, 0, 4);
    Map<String, Object> result = new HashMap<>();
    result.put("words", words);
    return AjaxResult.success(result);
}

5.	Daily tasks:  

Frontend:

<TouchableOpacity
    onPress={() => navigation.navigate('WordFirstExplanation', {
        word: word.word,
        translation: word.trans,
        onComplete,
        isReviewMode: false
    })}
>
    <Image
        source={require('../../assets/Interface/Daily Task/word.png')}
        style={styles.centeredImage}
    />
</TouchableOpacity>

Backend:

@ApiOperation("get daily grammar tasks by user id")
@GetMapping("/gamificationGrammar/{userId}")
public AjaxResult findGrammar(@PathVariable Integer userId) {
    User user = userService.selectUserById(userId);
    if (user == null) {
        return AjaxResult.error("invalid user");
    }

    List<UserLoginLog> userLoginLogs = userLoginLogService.selectUserLoginLogListByUserIdAndStudyLevel(userId, user.getStudyLevel());
    Integer pageNum = 0, pageSize = 2;
    boolean isReviewDay = false;

    if (userLoginLogs != null && userLoginLogs.size() > 0) {
        if (userLoginLogs.size() % 3 == 0) {
            pageSize = 4;
            pageNum = (userLoginLogs.size() / 3 - 1) * pageSize;
            isReviewDay = true;
        } else {
            pageNum = (userLoginLogs.size() - 1 - Integer.valueOf(userLoginLogs.size() / 3)) * pageSize;
        }
    }

    List<Grammar> grammars = grammarService.findGrammarLimit(pageNum, pageSize);
    
    Map<String, Object> result = new HashMap<>();
    result.put("isReviewDay", isReviewDay);
    result.put("grammars", isReviewDay && grammars.size() == 4 ? randomGrammars(grammars, 2) : grammars);

    return AjaxResult.success(result);
}

6.	Learning reminders:  

Frontend:

<View style={styles.detailSection}>
    <View style={styles.detailRow}>
        <Text style={styles.label}>Notifications:</Text>
        <Switch
            trackColor={{false: '#767577', true: '#A3D9A5'}}
            thumbColor={isEnabled ? '#115700' : '#f4f3f4'}
            onValueChange={toggleSwitch}
            value={isEnabled}
            style={styles.switch}
        />
        <View style={styles.spacer}/>

        {/* Button to edit notification settings */}
        <TouchableOpacity onPress={() => handleEdit('notifications')}>
            <Image source={require('../../assets/Interface/Setting/icon-notification.png')} style={styles.icon}/>
        </TouchableOpacity>
    </View>
</View>

Backend:

@GetMapping("/gamificationGrammar/{userId}")
public AjaxResult findGrammar(@PathVariable Integer userId) {
    // Query user login history
    List<UserLoginLog> userLoginLogs = userLoginLogService.selectUserLoginLogListByUserIdAndStudyLevel(userId, user.getStudyLevel());
    boolean isReviewDay = false;
    if (userLoginLogs != null && userLoginLogs.size() > 0) {
        // Every third day is a review day
        if (userLoginLogs.size() % 3 == 0) {
            isReviewDay = true;
        }
    }

    List<Grammar> grammars = grammarService.findGrammarLimit(pageNum, pageSize);
    Map<String, Object> result = new HashMap<>();
    result.put("isReviewDay", isReviewDay);
    result.put("grammars", grammars);
    return AjaxResult.success(result);
}

7.	Gamification elements:

Frontend:

if (grammarQuestionIndex < totalGrammarQuestions - 1) {
    console.log(`Grammar question ${grammarQuestionIndex + 1} of ${totalGrammarQuestions}`);
} else {
    completedIslands[6] = true;
    await AsyncStorage.setItem(`completedIslands_${userId}`, JSON.stringify(completedIslands));
    navigation.navigate('DailyTaskComplete');
}

Backend:

@ApiOperation("get achievement record")
@GetMapping("/achievement/{userId}")
public AjaxResult achievement(@PathVariable Integer userId) {
    Integer wordsLearned = vocabularyBookService.selectVocabularyListByUserId(userId).size();
    Integer logInDays = userLoginLogService.selecTotaltUserLoginLogCount(userId);
    Integer userLevel = userService.selectUserById(userId).getLevel();

    // Return achievement information: login days, words learned, and current level
    List<Integer> achievement = new ArrayList<>();
    achievement.add(logInDays);
    achievement.add(wordsLearned);
    achievement.add(userLevel);
    return AjaxResult.success(achievement);
}

8.	Safety alerts:

Frontend:

// Function to load user data from AsyncStorage
const loadUserData = async () => {
    try {
        const userDataString = await AsyncStorage.getItem('userData');
        if (userDataString) {
            const Data = JSON.parse(userDataString);
            setUserData(Data);
        } else {
            console.error('No user data found');
        }
    } catch (error) {
        console.error('Error loading user data from AsyncStorage:', error);
    }
};

Backend:

@PostMapping("/check")
public Map<String, Object> containsBadWord(@RequestParam("input") String input, @RequestParam("userId") String userId) {
    int userIdInt = Integer.parseInt(userId);

    // Retrieve both user-specific and default bad words (userId = 0)
    List<BadWord> badWordsList = badWordRepository.findByUserIdOrUserId(userIdInt, 0);

    boolean containsBadWord = badWordsList.stream()
            .anyMatch(badWord -> input.contains(badWord.getWord()));

    Map<String, Object> response = new HashMap<>();
    response.put("containsBadWord", containsBadWord);  // This can be used to trigger a safety alert
    return response;
}

9.	Parental controls:

Frontend:

<TouchableOpacity 
    style={{ width: '85%', height: '70%', backgroundColor: '#FFF3DA', justifyContent: 'center', alignItems: 'center' }} 
    onPress={() => navigation.navigate('SensitiveWords')}  // Navigate to SensitiveWords screen
>
    <Text style={{ fontSize: 24, textAlign: 'center', color: '#115700' }}>Sensitive words Management</Text>
    <Image source={require('../../assets/Interface/Parental Model/sensitive-icon.gif')} style={{ width: '60%', height: '60%' }} />
</TouchableOpacity>

<ImageBackground
    source={require('../../assets/Interface/Profile Interface/background.jpg')}
    style={{ width: '100%', height: '100%' }}
>
    {/* Header */}
    <Header title="Parental Model" goToScreen="Profile" />

    {/* Main content */}
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        {/* Sensitive words management button */}
    </View>
</ImageBackground>

Backend:

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

### Optional Features  

1.	AI chatbot.  
2.	Learning progress reports.  

## For the Future

Planned future additions and improvements include:

1.	Enhanced gamification elements.
2.	Speech recognition for additional interaction.

## Usage Method

1.	Registration/Login: Create a new account or log in with an existing account.
2.	Learning: Engage in learning modules such as word spelling, daily tasks, and grammar exercises.
3.	Progress tracking: View your learning progress and achievements on your profile page.
4.	ChatBot: Get further personalised learning help and guidance.
5.	Personal information management: Update user personal settings and information.

## Contribution

1.	Fork the repository.
2.	Create a new branch:
git checkout -b feature/your-feature-name
3.	Submit changes:
git commit -m "Add new feature"
4.	Push to branch:
git push origin feature/your-feature-name
5.	Create a Pull Request.

## Team Members

1.  Yue Yang
2.  Haitao Zhao
3.  Langdi Li
4.  Xianglong Lin
5.  Jiaqi Zhang
6.  Yiqing Sheng

For any questions, suggestions, or issues, please contact the team.

## References

1.	APIs:

tesseract-ocr. (n.d.). Tesseract OCR. GitHub. https://github.com/tesseract-ocr/tesseract

Google Cloud. (n.d.). Cloud Translation. https://cloud.google.com/translate/?hl=zh_cn

2.	Datasets:

SpaceGather. (n.d.). Worldwide sensitive word collection: Pornography. GitHub. https://github.com/SpaceGather/worldwide-sensitive-word-collection/blob/main/en/pornography.csv

web-mech. (n.d.). Badwords. GitHub. https://github.com/web-mech/badwords/blob/main/src/lang.json

kajweb. (n.d.). Dict. GitHub. https://github.com/kajweb/dict


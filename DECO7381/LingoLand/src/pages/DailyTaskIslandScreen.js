import React, { useState, useEffect } from 'react';
import { View, StyleSheet, ImageBackground, Image, Dimensions, TouchableOpacity } from 'react-native';
import Header from '../components/Header';
import { useNavigation, useFocusEffect } from '@react-navigation/native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import moment from 'moment'

/**
 * DailyTaskIslandScreen component: displays an island screen for daily tasks, 
 * where the user can click on the corresponding island to start a word or grammar task.
 * 
 * - On entry to the page, loads the current user's task progress from `AsyncStorage` 
 *  and checks to see if the page has already been visited that day.
 * - Resets the island status if it is the first visit of the day. When a user clicks 
 *  on an island, the appropriate task is launched based on the island ID.
 * 
 * @returns {React.Component} Returns the DailyTaskIslandScreen interface.
 */
export default function DailyTaskIslandScreen() {
    const navigation = useNavigation();
    const [completedIslands, setCompletedIslands] = useState([false, false, false, false, false, false, false]);
    const [currentIsland, setCurrentIsland] = useState(1);
    const [words, setWords] = useState([]);
    const [grammars, setGrammars] = useState([]);
    const [userId, setUserId] = useState(null);
    const { width, height } = Dimensions.get('window');
    const styles = getStyles(width, height);

    /**
    * Reloads data on page entry. Includes user task progress and task data.
    */
    useFocusEffect(
        React.useCallback(() => {
            const loadData = async () => {
                try {
                    // Get user data from AsyncStorage
                    const storedUserDataString = await AsyncStorage.getItem('userData');

                    if (!storedUserDataString) {
                        console.error('User data not found!');
                        return;
                    }

                    const storedUserData = JSON.parse(storedUserDataString);
                    const userId = storedUserData?.id;

                    if (!userId) {
                        console.error('User ID not found!');
                        return;
                    }

                    console.log('Retrieved userId:', userId);
                    setUserId(userId);

                    // Check date of last visit
                    const lastVisitDate = await AsyncStorage.getItem(`lastVisitDate_${userId}`);
                    // Get the current date
                    const today = moment().format('YYYY-MM-DD');

                    console.log(`Last visit time: ${lastVisitDate}, Today: ${today}`);

                    // Reset island status if last access date is not today
                    if (!lastVisitDate || lastVisitDate !== today) {
                        console.log('Different dates, reset island status');
                        await resetIslands(userId);
                    } else {
                        console.log('Date of todays visit, does not reset island status');
                    }

                    // Get the Word of the Day and Grammar
                    const storedWords = await AsyncStorage.getItem('dailyWords');
                    const storedGrammars = await AsyncStorage.getItem('dailyGrammars');
                    // Get the status of the completed island based on the userId.
                    const storedCompletedIslands = await AsyncStorage.getItem(`completedIslands_${userId}`);

                    console.log('Recaptured words:', JSON.parse(storedWords));
                    console.log('Recaptured grammer:', JSON.parse(storedGrammars));

                    // Setting the acquired words and syntax
                    if (storedWords) {
                        setWords(JSON.parse(storedWords));
                    }
                    if (storedGrammars) {
                        setGrammars(JSON.parse(storedGrammars));
                    }

                    // Setting up the completed island status
                    if (storedCompletedIslands) {
                        const completedIslands = JSON.parse(storedCompletedIslands);
                        setCompletedIslands(completedIslands);

                        // Find the next unfinished island, set currentIsland to the current island
                        const nextIncompleteIsland = completedIslands.findIndex(completed => !completed) + 1;
                        // If all are done, set to 7.
                        setCurrentIsland(nextIncompleteIsland > 0 ? nextIncompleteIsland : 7);
                    }
                } catch (error) {
                    console.error('Error loading data from AsyncStorage:', error);
                }
            };

            loadData();
        }, []) // Triggered every time the page is accessed
    );

    /**
     * Resets the island status to unfinished and sets the current island as the first.
     * 
     * @param {string} userId - User ID for distinguishing the progress of different users.
     */
    const resetIslands = async (userId) => {
        const initialIslands = [false, false, false, false, false, false, false]; // Initial island state
        setCompletedIslands(initialIslands);
        setCurrentIsland(1); // The cat returns to the first island.
        await AsyncStorage.setItem(`completedIslands_${userId}`, JSON.stringify(initialIslands));

        const resetTime = moment().format('YYYY-MM-DD HH:mm:ss');
        console.log(`Island status has been reset, reset time: ${resetTime}`);
    };

    /**
     * Handles users clicking on a particular island.
     * - Jump to the appropriate task page based on the island ID.
     * - If the clicked island is not unlocked, the click is invalid.
     * 
     * @param {number} islandId - The island number that the user clicked on.
     */
    const handleIslandPress = (islandId) => {
        // Prohibits the user from clicking on other islands than the current one
        if (islandId > currentIsland) {
            return;
        }

        if (islandId >= 1 && islandId <= 4) {
            // Pass the appropriate words to islands 1 through 4.
            const wordData = words[islandId - 1];
            console.log('Incoming words.', islandId, wordData);

            if (wordData) {
                console.log(`island ${islandId} - word:`, wordData);
                // If the first island is clicked, update the visit date
                if (islandId === 1) {
                    updateLastVisitDate();
                }
                navigation.navigate('DailyTaskWordStart', {
                    islandId,
                    word: wordData,
                    onComplete: () => handleComplete(islandId),
                });
            }
        } else if (islandId === 5 || islandId === 6) {
            // Pass the appropriate grammar questions to Islands 5 and 6.
            const grammarData = grammars[islandId - 5];
            if (grammarData) {
                console.log(`Island ${islandId} - Grammar Data:`, grammarData);
                navigation.navigate('DailyTaskGrammerStart', {
                    islandId,
                    grammar: grammarData,
                    onComplete: () => handleComplete(islandId),
                });
            }
        } else if (islandId === 7) {
            // Pass all word and grammar questions to the island 7
            console.log(`Island 7 - All Words and Grammars:`, { words, grammars });
            navigation.navigate('DailyTaskReview', {
                islandId,
                words,
                grammars,
                onComplete: () => handleComplete(islandId),
            });
        }
    };

    /**
     * Updated with latest access times.
     */
    const updateLastVisitDate = async () => {
        // Get today's date
        const today = moment().format('YYYY-MM-DD');
        // Update access time
        await AsyncStorage.setItem(`lastVisitDate_${userId}`, today);
        const updateTime = moment().format('YYYY-MM-DD HH:mm:ss');
        console.log(`The latest visit has been updated to today, updated at: ${updateTime}`);
    };

    /**
     * When the task is completed, the island status is updated and progress is stored.
     * 
     * @param {number} islandId - Completed island numbers.
     */
    const handleComplete = async (islandId) => {
        if (!userId) {
            console.error("User ID is not loaded, unable to save progress.");
            return;
        }

        const newCompleted = [...completedIslands];
        // Mark the current island as completed
        newCompleted[islandId - 1] = true;
        setCompletedIslands(newCompleted);

        // Save the completion state to AsyncStorage, differentiate the progress of different users according to their userId.
        await AsyncStorage.setItem(`completedIslands_${userId}`, JSON.stringify(newCompleted));

        const updateTime = moment().format('YYYY-MM-DD HH:mm:ss');
        console.log(`island ${islandId} Completed, updated on:${updateTime}`);

        if (islandId < 7) {
            // Move the kitten to the next island
            setCurrentIsland(islandId + 1);
        } else {
            // Deal with the seventh island, and when you're done, the cat disappears and a star is displayed.
            setCurrentIsland(null);
            console.log("All islands completed.");
            navigation.navigate('DailyTaskComplete');
        }
    };

    return (
        <View style={styles.container}>

            {/* Header*/}
            <Header title="Daily Task" goToScreen="Home" />

            {/* Background */}
            <ImageBackground
                source={require('../../assets/Interface/Daily Task/islandbackground.jpg')}
                style={styles.backgroundImage}
            >
                <Image
                    source={require('../../assets/Interface/Daily Task/cloud.png')}
                    style={styles.cloudImage}
                />

                {/* Dynamically generated island button list */}
                {completedIslands.map((completed, index) => (
                    <TouchableOpacity
                        key={index}
                        style={[
                            styles.island,
                            styles[`island${index + 1}`],
                            currentIsland === index + 1 ? null : { backgroundColor: '#B0E0E6' }
                        ]}
                        onPress={() => handleIslandPress(index + 1)} // 点击处理：触发 handleIslandPress 函数并传递岛屿编号
                    >
                        {completed ? ( // Completed island with star icon
                            <Image source={require('../../assets/Interface/Daily Task/star.png')} style={styles.starImage} />
                        ) : currentIsland === index + 1 ? (// The current island displays the cat icon
                            <Image source={require('../../assets/Interface/Daily Task/cat.png')} style={styles.catImage} />
                        ) : (// Unfinished islands show empty island view (unclickable islands)
                            <View style={styles.islandView} />
                        )}
                    </TouchableOpacity>
                ))}
            </ImageBackground>
        </View>
    );
}

/**
 * Responsive Style
 * 
 * @param {number} width Width of the device
 * @param {number} height Height of the device
 * @returns {Object} Returns the object containing the style
 */
const getStyles = (width, height) => StyleSheet.create({
    container: {
        flex: 1
    },
    backgroundImage: {
        flex: 1,
        width: '100%',
        height: '100%',
        resizeMode: 'cover'
    },
    island: {
        position: 'absolute',
        width: width * 0.265,
        height: width * 0.265,
        borderRadius: width * 0.15,
        justifyContent: 'center',
        alignItems: 'center'
    },
    starImage: {
        width: width * 0.36,
        height: width * 0.36,
        resizeMode: 'contain'
    },
    catImage: {
        width: width * 0.44,
        height: width * 0.44,
        resizeMode: 'contain'
    },
    islandView: {
        width: '100%',
        height: '100%',
        borderRadius: width * 0.15
    },
    island1: {
        top: height * 0.1,
        left: width * 0.7
    },
    island2: {
        top: height * 0.15,
        left: width * 0.35
    },
    island3: {
        top: height * 0.25,
        left: width * 0.05
    },
    island4: {
        top: height * 0.35,
        left: width * 0.35
    },
    island5: {
        top: height * 0.4,
        left: width * 0.7
    },
    island6: {
        top: height * 0.53,
        left: width * 0.45
    },
    island7: {
        top: height * 0.65,
        left: width * 0.25
    }
});

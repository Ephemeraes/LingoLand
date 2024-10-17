import React, { useEffect } from 'react';
import { View, StyleSheet, ImageBackground, Image, Dimensions, TouchableOpacity } from 'react-native';
import Header from '../components/Header';
import { useNavigation } from '@react-navigation/native';
import AsyncStorage from '@react-native-async-storage/async-storage';

const { width, height } = Dimensions.get('window');

/**
 * DailyTaskCompleteScreen component: 
 * displays the completion screen after the user completes the daily task and handles the data upload.
 *
 * @returns {React.Component} Back to Main Page
 */
export default function DailyTaskCompleteScreen() {
    const navigation = useNavigation();

    /**
     * saveCompletedTasks function: 
     * extracts the user's completed words and grammar questions data from AsyncStorage and sends them to the server one by one.
     * 
     * @async
     * @returns {Promise<void>} Save word and grammar question records to the back-end
     */
    const saveCompletedTasks = async () => {
        try {
            // Extracting Daily Completed Word and Grammar Questions Data from AsyncStorage
            const completedWords = await AsyncStorage.getItem('dailyWords');
            const completedGrammars = await AsyncStorage.getItem('dailyGrammars');

            const words = completedWords ? JSON.parse(completedWords) : [];
            const grammars = completedGrammars ? JSON.parse(completedGrammars) : [];

            console.log('Words:', words);
            console.log('Grammars:', grammars);

            // Get user data to extract userId and studyLevel
            const userDataString = await AsyncStorage.getItem('userData');
            const userData = userDataString ? JSON.parse(userDataString) : null;

            if (!userData || !userData.id) {
                console.error('User data is missing or invalid:', userData);
                return;
            }

            const userId = userData.id;
            const studyLevel = userData.studyLevel; //

            // Send the word data one by one to the server-side backend
            for (const word of words) {
                const wordData = {
                    wordId: word.id,
                    userId: userId,
                    studyLevel: studyLevel,
                    createTime: new Date().toISOString(),
                };

                console.log('Word to Save:', wordData);

                const vocabularyBookResponse = await fetch('http://10.71.95.219:8081/user/save/vocabularyBook', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(wordData),
                });

                if (!vocabularyBookResponse.ok) {
                    const errorResponse = await vocabularyBookResponse.text();
                    console.error('Failed to save vocabulary book. Status:', vocabularyBookResponse.status, 'Response Text:', errorResponse);
                } else {
                    const successResponse = await vocabularyBookResponse.json();
                    console.log('Vocabulary book saved successfully:', successResponse);
                }
            }

            // Send grammar questions to the backend one by one
            for (const grammar of grammars) {
                const grammarData = {
                    question_id: grammar.id,
                    userId: userId,
                    finishTime: new Date().toISOString(),
                };

                console.log('Grammar to Save:', grammarData);

                const grammarRecordResponse = await fetch('http://10.71.95.219:8081/user/save/grammarRecord', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(grammarData),
                });

                if (!grammarRecordResponse.ok) {
                    const errorResponse = await grammarRecordResponse.text(); y
                    console.error('Failed to save grammar record. Status:', grammarRecordResponse.status, 'Response Text:', errorResponse);
                } else {
                    const successResponse = await grammarRecordResponse.json();
                    console.log('Grammar record saved successfully:', successResponse);
                }
            }
        } catch (error) {
            console.error('Error while saving completed tasks:', error);
        }
    };


    return (
        <View style={styles.container}>
            {/* Header */}
            <View style={styles.headerContainer}>
                <Header title="Daily Task" goToScreen="Home" />
            </View>

            {/* Background */}
            <View style={styles.backgroundContainer}>
                <ImageBackground
                    source={require('../../assets/Interface/Daily Task/complete.jpg')}
                    style={styles.backgroundImage}
                >
                    {/* Exit button */}
                    <TouchableOpacity
                        style={styles.centeredImageContainer}
                        onPress={async () => {
                            await saveCompletedTasks();
                            navigation.navigate('Home');
                        }}
                    >
                        <Image
                            source={require('../../assets/Interface/Daily Task/exit.png')}
                            style={styles.centeredImage}
                        />
                    </TouchableOpacity>
                </ImageBackground>
            </View>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
    },
    headerContainer: {
        backgroundColor: '#fff',
    },
    backgroundContainer: {
        flex: 1,
    },
    backgroundImage: {
        width: '100%',
        height: '100%',
        resizeMode: 'cover',
    },
    centeredImageContainer: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: 100,
    },
    centeredImage: {
        width: width * 0.4,
        height: height * 0.3,
        bottom: "-7%",
        resizeMode: 'contain',
    },
});

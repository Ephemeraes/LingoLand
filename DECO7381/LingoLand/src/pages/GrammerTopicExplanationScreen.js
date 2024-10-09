import React, { useEffect } from 'react';
import { View, StyleSheet, ImageBackground, Text, Dimensions, TouchableOpacity } from 'react-native';
import Header from '../components/Header';
import { useNavigation, useRoute } from '@react-navigation/native';
import AsyncStorage from '@react-native-async-storage/async-storage';

/**
 * GrammarTopicExplanationScreen component: 
 * displays the user's selected answer, the correct answer, and an explanation, 
 * updating the progress when completed.
 * 
 * @returns {React.Component} 返回语法题目的解释页面。
 */
export default function GrammarTopicExplanationScreen() {
    const navigation = useNavigation();
    const route = useRoute();
    const { width, height } = Dimensions.get('window');
    const styles = getStyles(width, height);

    const selectedOption = route.params?.selectedOption;
    const onComplete = route.params?.onComplete;
    const isReviewMode = route.params?.isReviewMode;

    // Current Grammar Questions
    const grammarQuestion = route.params?.grammarQuestions || {};
    const correctAnswer = grammarQuestion?.answer;
    const explanation = grammarQuestion?.explanation;

    /**
     * Handling the Next button click event：
     */
    const handleNextPress = async () => {
        // Update Progress
        if (typeof onComplete === 'function') {
            await onComplete();
        }

        // Review mode checks to see if this is the last question, and if so, marks the island as complete.
        if (isReviewMode) {
            try {
                // Get userId
                const userDataString = await AsyncStorage.getItem('userData');
                const userData = JSON.parse(userDataString);
                const userId = userData?.id;

                if (!userId) {
                    console.error('User ID not found.');
                    return;
                }

                // Get the current topic index
                const grammarQuestionIndex = route.params?.currentGrammarIndex || 0;
                // Total number of topics
                const totalGrammarQuestions = route.params?.totalGrammarQuestions || 2;

                // If the topic is completed in its entirety, mark the seventh island (review island) as completed。
                if (grammarQuestionIndex < totalGrammarQuestions - 1) {

                    // The topic has not been fully completed, do not perform any jump logic
                    console.log(`Grammar question ${grammarQuestionIndex + 1} of ${totalGrammarQuestions}`);
                } else {

                    // All topics completed, mark island complete
                    const storedCompletedIslands = await AsyncStorage.getItem(`completedIslands_${userId}`);
                    const completedIslands = storedCompletedIslands ? JSON.parse(storedCompletedIslands) : [false, false, false, false, false, false, false];

                    //ark the seventh island (review island) as completed, indexed as 6
                    completedIslands[6] = true;

                    // Saving the completion state to AsyncStorage
                    await AsyncStorage.setItem(`completedIslands_${userId}`, JSON.stringify(completedIslands));
                    console.log(`Marked island 7 as complete for user ${userId}`);

                    navigation.navigate('DailyTaskComplete');
                }
            } catch (error) {
                console.error('Error marking island complete:', error);
            }
        } else {
            navigation.navigate('DailyTaskIsland');
        }
    };

    return (
        <ImageBackground
            source={require('../../assets/Interface/Daily Task/background.jpg')}
            style={styles.fullScreen}
        >
            <View style={styles.container}>

                {/* Header */}
                <View style={styles.headerContainer}>
                    <Header title="Grammar Explanation" goToScreen="DailyTaskIsland" />
                </View>

                <View style={styles.contentContainer}>

                    {/* Show current grammar topics */}
                    <Text style={styles.questionText}>{grammarQuestion?.question || 'Loading question...'}</Text>

                    {/* Displays user-selected and other options */}
                    {grammarQuestion?.optionA && (
                        <>
                            <View style={[styles.option, { backgroundColor: selectedOption === 'A' ? '#bde0fe' : '#fff' }]}>
                                <Text style={styles.optionText}>A. {grammarQuestion.optionA}</Text>
                            </View>
                            <View style={[styles.option, { backgroundColor: selectedOption === 'B' ? '#bde0fe' : '#fff' }]}>
                                <Text style={styles.optionText}>B. {grammarQuestion.optionB}</Text>
                            </View>
                            <View style={[styles.option, { backgroundColor: selectedOption === 'C' ? '#bde0fe' : '#fff' }]}>
                                <Text style={styles.optionText}>C. {grammarQuestion.optionC}</Text>
                            </View>
                        </>
                    )}

                    {/* Show correct answers and explanations */}
                    <View style={styles.answerContainer}>
                        <Text style={styles.answerLabel}>Correct Answer:</Text>
                        <Text style={styles.answerText}> {correctAnswer}</Text>
                        <Text style={styles.explanationLabel}>Explanation:</Text>
                        <Text style={styles.explanationText}>{explanation}</Text>
                    </View>

                    {/* Next button */}
                    <TouchableOpacity style={styles.nextButton} onPress={handleNextPress}>
                        <Text style={styles.nextButtonText}>Next</Text>
                    </TouchableOpacity>
                </View>
            </View>
        </ImageBackground>
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
    fullScreen: {
        width: '100%',
        height: '100%',
        resizeMode: 'cover',
    },
    container: {
        flex: 1,
    },
    headerContainer: {
        backgroundColor: '#fff',
    },
    contentContainer: {
        padding: width * 0.05,
        borderRadius: 30,
        alignSelf: 'center',
        marginTop: height * 0.05,
        marginBottom: height * 0.05,
        width: width * 0.9,
        height: height * 0.68,
        backgroundColor: '#FFFFE0',
    },
    questionText: {
        fontSize: width * 0.085,
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
        fontWeight: 'bold',
        marginBottom: height * 0.02,
    },
    answerContainer: {
        width: '100%',
        marginTop: height * 0.02,
    },
    answerLabel: {
        fontSize: width * 0.07,
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
        fontWeight: 'bold',
        marginBottom: height * 0.015,
    },
    answerText: {
        fontSize: width * 0.06,
        color: '#115700',
        fontFamily: 'Pilsner_Regular',
        marginBottom: height * 0.02,
    },
    explanationLabel: {
        fontSize: width * 0.07,
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
        fontWeight: 'bold',
        marginBottom: height * 0.015,
    },
    explanationText: {
        fontSize: width * 0.06,
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
        marginBottom: height * 0.02,
    },
    option: {
        width: '100%',
        paddingVertical: height * 0.013,
        paddingHorizontal: width * 0.03,
        borderWidth: 1,
        borderColor: '#ccc',
        borderRadius: 30,
        marginBottom: height * 0.01,
        backgroundColor: '#fff',
    },
    optionText: {
        fontSize: width * 0.07,
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
        fontWeight: 'bold',
    },
    nextButton: {
        backgroundColor: '#B0E0E6',
        paddingVertical: height * 0.012,
        paddingHorizontal: width * 0.02,
        borderRadius: 30,
        alignSelf: 'flex-end',
        width: width * 0.22,
        marginTop: height * 0.01,
    },
    nextButtonText: {
        fontSize: width * 0.05,
        color: '#fff',
        fontWeight: 'bold',
        textAlign: 'center',
    },
});

import React, { useState, useEffect } from 'react';
import { View, StyleSheet, ImageBackground, Image, Dimensions, TouchableOpacity } from 'react-native';
import Header from '../components/Header';
import { useNavigation, useRoute, useFocusEffect } from '@react-navigation/native';

/**
 * DailyReviewScreen component:
 * This is the main page of the daily review for reviewietween words and grammar questions. The user needs to review the words and answer the grammar questions until tng bhe task is completed.
 * 
 * @returns {React.Component} Returns a page containing word and grammar review tasks.
 */
export default function DailyReviewScreen() {
    const navigation = useNavigation();
    const route = useRoute();
    const { width, height } = Dimensions.get('window');
    const styles = getStyles(width, height);

    const { words = [], grammars: grammarQuestions = [] } = route.params || {};

    // Printing incoming data
    useEffect(() => {
        console.log('Received words:', words);
        console.log('Received grammarQuestions:', grammarQuestions);
    }, [words, grammarQuestions]);

    // Index of words and grammar questions currently being reviewed
    const [currentWordIndex, setCurrentWordIndex] = useState(0);
    const [currentGrammarIndex, setCurrentGrammarIndex] = useState(0);
    // Whether the control is reviewing vocabulary or grammar questions
    const [isReviewingWords, setIsReviewingWords] = useState(true);

    // Use useFocusEffect to ensure that the index and review states are reset when the page is focused.
    useFocusEffect(
        React.useCallback(() => {
            setCurrentWordIndex(0);
            setCurrentGrammarIndex(0);
            setIsReviewingWords(true);
        }, [])
    );

    /**
     * handleCorrectAnswer function
     */
    const handleCorrectAnswer = () => {
        if (isReviewingWords) {
            // Calculate the next word index to see if there are any words remaining
            const nextIndex = currentWordIndex + 1;
            if (nextIndex < words?.length) {
                setCurrentWordIndex(nextIndex);
            } else {
                // When you have finished reviewing the vocabulary, switch to reviewing the grammar questions
                setIsReviewingWords(false);
                setCurrentGrammarIndex(0);
            }
        } else {
            // Calculate the next grammar question index to see if there are any remaining grammar questions
            const nextGrammarIndex = currentGrammarIndex + 1;
            if (nextGrammarIndex < grammarQuestions?.length) {
                setCurrentGrammarIndex(nextGrammarIndex);
            } else {
                // Done in full
                console.log('Review complete, navigating to DailyTaskCompleteScreen.');
                navigation.navigate('DailyTaskComplete');
            }
        }
    };
    /**
     * useEffect listens for changes in review status
     */
    useEffect(() => {
        console.log('useEffect triggered with isReviewingWords:', isReviewingWords, 'currentWordIndex:', currentWordIndex);

        // Check if the word is being reviewed
        if (isReviewingWords) {
            navigation.navigate('WordSpell', {
                word: words?.[currentWordIndex]?.word,
                translation: words?.[currentWordIndex]?.trans,
                explanation: words?.[currentWordIndex]?.explanation,
                onComplete: handleCorrectAnswer,
                isReviewMode: true,
                currentWordIndex: currentWordIndex
            });
            console.log('Navigating to WordSpell for word index:', currentWordIndex);

            // Switch to Grammar Questions Review
        } else if (!isReviewingWords && currentGrammarIndex < grammarQuestions?.length) {
            navigation.navigate('GrammerTopic', {
                grammarQuestions: [grammarQuestions?.[currentGrammarIndex]], // Packing into an array
                onComplete: handleCorrectAnswer,
                isReviewMode: true,
                currentGrammarIndex: currentGrammarIndex,
                totalGrammarQuestions: grammarQuestions.length
            });
            console.log('Navigating to GrammerTopic with:', {
                grammarQuestions: [grammarQuestions?.[currentGrammarIndex]], // Make sure pass an array
                onComplete: handleCorrectAnswer,
                isReviewMode: true,
                currentGrammarIndex: currentGrammarIndex,
                totalGrammarQuestions: grammarQuestions.length
            });

            // Grammar questions are reviewed and navigated to the completion page
        } else if (!isReviewingWords && currentGrammarIndex >= grammarQuestions?.length) {
            navigation.navigate('DailyTaskComplete');
            console.log('Navigating to DailyTaskComplete');
        }
    }, [isReviewingWords, currentWordIndex, currentGrammarIndex]);

    return (
        <View style={styles.container}>
            {/* Header */}
            <Header title="Review Task" goToScreen="DailyTaskIsland" />
            <ImageBackground
                source={require('../../assets/Interface/Daily Task/background.jpg')}
                style={styles.backgroundImage}
            >
                <TouchableOpacity onPress={() => isReviewingWords && handleCorrectAnswer()}>
                    <Image
                        source={require('../../assets/Interface/Daily Task/timetoreview.png')}
                        style={styles.centeredImage}
                    />
                </TouchableOpacity>
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
        width: '100%',
        height: '100%',
        resizeMode: 'cover'
    },
    centeredImage: {
        width: width * 1.1,
        height: height * 1.1,
        resizeMode: 'contain',
        top: -20
    },
});
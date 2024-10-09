import React from 'react';
import { View, StyleSheet, ImageBackground, TouchableOpacity, Text, Dimensions } from 'react-native';
import Header from '../components/Header';
import { useNavigation, useRoute } from '@react-navigation/native';


/**
 * WordExplanationScreen component: 
 * displays an explanation of the word and the user can choose 
 * to return to the spelling or go to the next word.
 * 
 * @returns {React.Component} Return to Word Explanation page
 */
export default function WordExplanationScreen() {
    const navigation = useNavigation();
    const route = useRoute();
    const { width, height } = Dimensions.get('window');
    const { word, translation, onComplete, isReviewMode, currentWordIndex } = route.params;

    // Dynamically adjusts the font size according to the translation and the length of the word
    const chineseFontSize = translation.length > 3 ? width * 0.18 : width * 0.28;
    const englishFontSize = word.length > 9 ? width * 0.21 : width * 0.27;

    const styles = getStyles(width, height);

    /**
         * Handling click events with the Next button
         */
    const handleNextPress = () => {
        if (typeof onComplete === 'function') {
            onComplete();
        }
        navigation.navigate('DailyTaskIsland');
    };

    /**
    * Handling click events with the Back button
    */
    const handleBackPress = () => {
        navigation.navigate('WordSpell', {
            word: word,
            translation: translation,
            onComplete: onComplete,
            isReviewMode: false,
            currentWordIndex: currentWordIndex
        });
    };

    return (
        <View style={styles.container}>
            {/* Header */}
            <View style={styles.headerContainer}>
                <Header title="Word Castle" goToScreen="DailyTaskIsland" />
            </View>

            {/* Background */}
            <View style={styles.backgroundContainer}>
                <ImageBackground
                    source={require('../../assets/Interface/Daily Task/background.jpg')}
                    style={styles.backgroundImage}
                >
                    {/* Main content area for displaying word and its explanation */}
                    <View style={styles.wordBox}>
                        <Text style={[styles.chineseWord, { fontSize: chineseFontSize, fontFamily: 'Pilsner_Regular', }]}>
                            {translation}
                        </Text>
                        <Text style={[styles.englishWord, { fontSize: englishFontSize, fontFamily: 'Pilsner_Regular', }]}>
                            {word}
                        </Text>
                    </View>

                    {/* Buttons for navigation */}
                    <View style={styles.buttonContainer}>
                        <TouchableOpacity style={styles.button} onPress={handleBackPress}>
                            <Text style={styles.buttonText}>Back</Text>
                        </TouchableOpacity>
                        <TouchableOpacity style={styles.button} onPress={handleNextPress}>
                            <Text style={styles.buttonText}>Next</Text>
                        </TouchableOpacity>
                    </View>
                </ImageBackground>
            </View>
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
        flex: 1,
    },
    backgroundImage: {
        width: '100%',
        height: '100%',
        resizeMode: 'cover',
    },
    wordBox: {
        width: width * 1,
        height: height * 0.45,
        backgroundColor: '#FFFFE0',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 40,
        top: height * 0.035,
    },
    englishWord: {
        color: '#115700',
        marginBottom: height * 0.02,
        textAlign: 'center',
    },
    chineseWord: {
        color: '#115700',
        textAlign: 'center',
    },
    buttonContainer: {
        position: 'absolute',
        bottom: height * 0.31,
        flexDirection: 'row',
        justifyContent: 'space-around',
        width: '100%',
    },
    button: {
        backgroundColor: '#FFFFE0',
        paddingVertical: height * 0.02,
        paddingHorizontal: width * 0.07,
        borderRadius: 20,
    },
    buttonText: {
        color: '#115700',
        fontSize: width * 0.1,
        fontFamily: 'Pilsner_Regular',
        fontWeight: "bold",
    },
});



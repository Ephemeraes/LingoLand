import React from 'react';
import { View, StyleSheet, ImageBackground, Dimensions, TouchableOpacity, Text } from 'react-native';
import Header from '../components/Header';
import { useNavigation, useRoute } from '@react-navigation/native';


/**
 * WordFirstExplanation component: Used to display words and their translations
 * 
 * @returns {React.Component} Return to Word Explanation page
 */
export default function WordFirstExplanation() {
    const navigation = useNavigation();
    const route = useRoute();
    const { width, height } = Dimensions.get('window');
    const styles = getStyles(width, height);

    const { word, translation, onComplete, isReviewMode, currentWordIndex } = route.params;

    // Adjust font size based on the length of the translation
    const chineseFontSize = translation.length > 3 ? width * 0.18 : width * 0.28;
    const englishFontSize = word.length > 9 ? width * 0.21 : width * 0.27;

    /**
     * Handles the Next button click event
     */
    const handleNextPress = () => {
        navigation.navigate('WordSpell', {
            word: word,
            translation: translation,
            onComplete: onComplete,
            isReviewMode: isReviewMode,
            currentWordIndex: currentWordIndex
        });
    };

    return (
        <View style={styles.container}>

            {/* Header */}
            <Header title="Word Castle" goToScreen="DailyTaskIsland" />

            {/* Background */}
            <ImageBackground
                source={require('../../assets/Interface/Daily Task/background.jpg')}
                style={styles.backgroundImage}
            >
                {/* Word display area */}
                <View style={styles.wordBox}>

                    {/* Chinese translation */}
                    <Text style={[styles.chineseWord, { fontSize: chineseFontSize, fontFamily: 'Pilsner_Regular', }]}>
                        {translation}
                    </Text>

                    {/* English word */}
                    <Text style={[styles.englishWord, { fontSize: englishFontSize, fontFamily: 'Pilsner_Regular', }]}>
                        {word}
                    </Text>
                    {/* Next button */}
                    <TouchableOpacity
                        style={styles.nextButton}
                        onPress={handleNextPress}
                    >
                        <Text style={styles.nextButtonText}>Next</Text>
                    </TouchableOpacity>
                </View>
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
    nextButton: {
        backgroundColor: '#FFFFE0',
        paddingVertical: height * 0.02,
        paddingHorizontal: width * 0.07,
        borderRadius: 20,
        position: 'absolute',
        bottom: height * -0.11,
        right: width * 0.05,
    },
    nextButtonText: {
        color: '#115700',
        fontSize: width * 0.1,
        fontFamily: 'Pilsner_Regular',
        fontWeight: "bold",
    },
});

import React, { useState } from 'react';
import { View, StyleSheet, ImageBackground, Dimensions, TouchableOpacity, Text, TextInput, Modal, Image } from 'react-native';
import Header from '../components/Header';
import { useNavigation, useRoute, useFocusEffect } from '@react-navigation/native';

/**
 * WordSpellScreen Component: 
 * word spelling task interface where the user enters the spelling of a word and gets feedback.
 * 
 * @returns {React.Component} Return to Word Spelling Tasks page
 */
export default function WordSpellScreen() {
    const navigation = useNavigation();
    const route = useRoute();
    const [userInput, setUserInput] = useState('');
    const [showCorrectModal, setShowCorrectModal] = useState(false);
    const [showIncorrectModal, setShowIncorrectModal] = useState(false);
    const { width, height } = Dimensions.get('window');

    const { word, translation, onComplete, isReviewMode, currentWordIndex } = route.params || {};

    // Clear user input each time the page focuses
    useFocusEffect(
        React.useCallback(() => {
            setUserInput('');
        }, [currentWordIndex])
    );

    /**
     * Handling the click event of the Next button
     */
    const handleNextPress = () => {
        if (userInput.toUpperCase() === word.toUpperCase()) {
            setShowCorrectModal(true);
        } else {
            setShowIncorrectModal(true);
        }
    };

    /**
     * Handling the click event of the correct answer popup box
     */
    const handleCorrectModalPress = () => {
        setShowCorrectModal(false);
        if (isReviewMode) {
            if (typeof onComplete === 'function') {
                onComplete();
            }
        } else {
            if (typeof onComplete === 'function') {
                onComplete();
            }
            navigation.navigate('DailyTaskIsland');
        }
    };

    /**
     * Handling the click event of the wrong answer popup box
     */
    const handleIncorrectModalPress = () => {
        setShowIncorrectModal(false);
        if (isReviewMode) {
            navigation.navigate('WordFirstExplanation', {
                word: word,
                translation: translation,
                onComplete: onComplete,
                isReviewMode: true,
                currentWordIndex: currentWordIndex
            });
        } else {
            navigation.navigate('WordExplanation', {
                word: word,
                translation: translation,
                onComplete: onComplete,
                isReviewMode: false,
                currentWordIndex: currentWordIndex
            });
        }
    };

    // Adjust font size according to translation length
    const chineseWordFontSize = translation.length > 3 ? width * 0.18 : width * 0.28;
    const inputFontSize = word.length > 6 ? width * 0.2 : width * 0.27;
    const styles = getStyles(width, height, chineseWordFontSize, inputFontSize);

    return (
        <View style={styles.container}>
            {/* Header */}
            <Header title="Word Castle" goToScreen="DailyTaskIsland" />

            {/* Background */}
            <ImageBackground
                source={require('../../assets/Interface/Daily Task/background.jpg')}
                style={styles.backgroundImage}
            >

                {/* Spelling area */}
                <View style={styles.wordBox}>
                    <Text style={styles.chineseWord}>{translation}</Text>

                    {/* User input box */}
                    <TextInput
                        style={styles.input}
                        onChangeText={setUserInput}
                        value={userInput}
                        autoCapitalize="none"
                    />

                    {/* Next button */}
                    <TouchableOpacity style={styles.nextButton} onPress={handleNextPress}>
                        <Text style={styles.nextButtonText}>Next</Text>
                    </TouchableOpacity>
                </View>
            </ImageBackground>

            {/* Correct Answer Popup Box */}
            {showCorrectModal && (
                <View style={styles.overlay}>
                    <Modal
                        animationType="slide"
                        transparent={true}
                        visible={showCorrectModal}
                        onRequestClose={() => setShowCorrectModal(false)}
                    >
                        <TouchableOpacity style={styles.modalView} onPress={handleCorrectModalPress}>
                            <Image
                                source={require('../../assets/Interface/Daily Task/RIghtpopup.png')}
                                style={styles.modalcorrectImage}
                            />
                        </TouchableOpacity>
                    </Modal>
                </View>
            )}

            {/* Wrong answer pop-up box */}
            {showIncorrectModal && (
                <View style={styles.overlay}>
                    <Modal
                        animationType="slide"
                        transparent={true}
                        visible={showIncorrectModal}
                        onRequestClose={() => setShowIncorrectModal(false)}
                    >
                        <TouchableOpacity style={styles.modalView} onPress={handleIncorrectModalPress}>
                            <Image
                                source={require('../../assets/Interface/Daily Task/Spelling-mistake.png')}
                                style={styles.modalmistakeImage}
                            />
                        </TouchableOpacity>
                    </Modal>
                </View>
            )}
        </View>
    );
}

/**
 * Responsive Style
 * 
 * @param {number} width Width of the device
 * @param {number} height Height of the device
 * @param {number} chineseWordFontSize Font size of Chinese words
 * @param {number} inputFontSize Font size of the user input box
 * @returns {Object} Returns the object containing the style
 */
const getStyles = (width, height, chineseWordFontSize, inputFontSize) => StyleSheet.create({
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
    chineseWord: {
        fontSize: chineseWordFontSize,
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
        marginBottom: height * 0.03,
        textAlign: 'center',
    },
    input: {
        height: height * 0.13,
        borderColor: 'gray',
        borderWidth: 1,
        width: '80%',
        paddingHorizontal: width * 0.02,
        fontSize: inputFontSize,
        fontFamily: 'Pilsner_Regular',
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
        fontFamily: 'Pilsner_Regular',
        fontSize: width * 0.1,
        fontWeight: "bold",
    },
    modalView: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: height * 0.01,
    },
    modalcorrectImage: {
        width: width * 1.128,
        height: height * 1.128,
        resizeMode: 'contain',
    },
    modalmistakeImage: {
        width: width * 1.11,
        height: height * 1.11,
        resizeMode: 'contain',
    },
    overlay: {
        position: 'absolute',
        width: '100%',
        height: '100%',
        backgroundColor: 'rgba(0, 0, 0, 0.5)',
        justifyContent: 'center',
        alignItems: 'center',
    },
});

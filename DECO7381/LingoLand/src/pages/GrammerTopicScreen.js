import React, { useState, useEffect } from 'react';
import { View, StyleSheet, ImageBackground, Text, Dimensions, TouchableOpacity, Modal, Image } from 'react-native';
import Header from '../components/Header';
import { useNavigation, useRoute } from '@react-navigation/native';

/**
 * GrammerTopicScreen component: 
 * displays the grammar topic, with a correct or incorrect pop-up window after the user selects the answer.
 *
 * @returns {React.Component} Return to the Grammar Multiple Choice Questions page
 */
export default function GrammerTopicScreen() {
    const navigation = useNavigation();
    const route = useRoute();
    const { width, height } = Dimensions.get('window');
    const styles = getStyles(width, height);
    const { onComplete, isReviewMode, grammarQuestions, currentGrammarIndex } = route.params || {};

    const [selectedOption, setSelectedOption] = useState(null);
    const [showCorrectModal, setShowCorrectModal] = useState(false);
    const [showIncorrectModal, setShowIncorrectModal] = useState(false);

    /**
     * Reset option state when new parameters are received
     */
    useEffect(() => {
        console.log('Received grammarQuestions:', grammarQuestions);
        setSelectedOption(null);
    }, [route.params]);

    // Get the current grammar topic
    const currentQuestion = grammarQuestions && grammarQuestions.length > 0 ? grammarQuestions[0] : null;

    /**
     * Handling of user-clicked option events
     *
     * @param {string} optionId ID of the option clicked by the user ('A', 'B', 'C')
     */
    const handleOptionPress = (optionId) => {
        setSelectedOption(optionId);

        const correctAnswer = currentQuestion?.answer;

        if (optionId === correctAnswer) {
            setShowCorrectModal(true);
        } else {
            setShowIncorrectModal(true);
        }
    };

    /**
     * Handling of the user clicking on the correct answer pop-up event
     */
    const handleCorrectModalPress = () => {
        setShowCorrectModal(false);
        navigation.navigate('GrammerTopicExplanation', {
            selectedOption: selectedOption,
            grammarQuestions: currentQuestion,
            isReviewMode: isReviewMode,
            onComplete: onComplete,
            currentGrammarIndex: currentGrammarIndex,
        });
    };

    /**
     * Handling of the user clicking on the incorrect answer pop-up event
     */
    const handleIncorrectModalPress = () => {
        setShowIncorrectModal(false);
        navigation.navigate('GrammerTopicExplanation', {
            selectedOption: selectedOption,
            grammarQuestions: currentQuestion,
            isReviewMode: isReviewMode,
            onComplete: onComplete,
            currentGrammarIndex: currentGrammarIndex,
        });
    };

    return (
        <ImageBackground
            source={require('../../assets/Interface/Daily Task/background.jpg')}
            style={styles.fullScreen}

        >{/* Header */}
            <View style={styles.container}>
                <Header title="Grammar Castle" goToScreen="DailyTaskIsland" />
                <View style={styles.questionContainer}>

                    {/* Show current topic */}
                    <Text style={styles.questionText}>
                        {currentQuestion?.question || "Loading question..."}
                    </Text>

                    {/* Display options for the current topic */}
                    {currentQuestion?.optionA && (
                        <TouchableOpacity
                            style={[styles.option, { backgroundColor: selectedOption === 'A' ? '#bde0fe' : '#fff' }]}
                            onPress={() => handleOptionPress('A')}
                        >
                            <Text style={styles.optionText}>A. {currentQuestion.optionA}</Text>
                        </TouchableOpacity>
                    )}
                    {currentQuestion?.optionB && (
                        <TouchableOpacity
                            style={[styles.option, { backgroundColor: selectedOption === 'B' ? '#bde0fe' : '#fff' }]}
                            onPress={() => handleOptionPress('B')}
                        >
                            <Text style={styles.optionText}>B. {currentQuestion.optionB}</Text>
                        </TouchableOpacity>
                    )}
                    {currentQuestion?.optionC && (
                        <TouchableOpacity
                            style={[styles.option, { backgroundColor: selectedOption === 'C' ? '#bde0fe' : '#fff' }]}
                            onPress={() => handleOptionPress('C')}
                        >
                            <Text style={styles.optionText}>C. {currentQuestion.optionC}</Text>
                        </TouchableOpacity>
                    )}
                </View>

                {/* Correct Answer Popup */}
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

                {/* Wrong answer pop-up */}
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
                                    source={require('../../assets/Interface/Daily Task/gmp.png')}
                                    style={styles.modalmistakeImage}
                                />
                            </TouchableOpacity>
                        </Modal>
                    </View>
                )}
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
    questionContainer: {
        padding: width * 0.05,
        borderRadius: 20,
        alignSelf: 'center',
        marginTop: height * 0.05,
        marginBottom: height * 0.05,
        width: width * 0.9,
        backgroundColor: '#FFFFE0',
    },
    questionText: {
        fontSize: width * 0.11,
        fontFamily: 'Pilsner_Regular',
        marginBottom: height * 0.02,
        textAlign: 'center',
        color: '#115700',
        fontWeight: 'bold',
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
    modalView: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: height * 0.01,
    },
    modalcorrectImage: {
        width: width * 1.1,
        height: height * 1.1,
        resizeMode: 'contain',
    },
    modalmistakeImage: {
        width: width * 1.1,
        height: height * 1.1,
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

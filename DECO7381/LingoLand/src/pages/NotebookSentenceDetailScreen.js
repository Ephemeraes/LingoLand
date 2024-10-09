import React from 'react';
import { View, Text, StyleSheet, Dimensions, ScrollView, ImageBackground, Image, TouchableOpacity } from 'react-native';
import Header from '../components/Header';
import { Alert } from 'react-native';

/**
 * SentenceDetailScreen Component: 
 * Displays a page with details of the sentence selected by the user and its translation.
 * 
 * @param {Object} route - Routing parameter containing the data passed to the page (e.g. sentence details).
 * @param {Object} navigation - An object used for page navigation.
 * @returns {React.Component} Returns a page with sentence details
 */
export default function SentenceDetailScreen({ route, navigation }) {
    const { createTime, oriWords, translatedWords, userId, wordsId } = route.params.sentence;
    const { width, height } = Dimensions.get('window');
    const styles = getStyles(width, height);
    const handleChatHistory = async (wordsId) => {
        const response = await fetch('http://192.168.31.40:8081/ocr/getChatBot?wordsId=${wordsId}')
        const data = await response.json();
        // If has chat history
        if (Array.isArray(data) && data.length > 0) {
            navigation.navigate('ChatHistory', data);
        } else {
            // If no chat history
            Alert.alert('No chat history');
        }
    }

    return (
        <ImageBackground
            source={require('../../assets/Interface/Note Book/sentencebackground.jpg')}
            style={styles.backgroundImage}
        >
            {/* Header */}
            <Header title="Sentence Detail" goToScreen="Home" />

            {/* Container for the content */}
            <View style={styles.container}>
                {/* Original Sentence */}
                <View style={styles.section}>
                    <Text style={styles.sectionTitle}>Original Text</Text>
                    <View style={styles.detailContainer}>
                        <ScrollView>
                            <Text style={styles.textStyle}>{oriWords}</Text>
                        </ScrollView>
                    </View>
                </View>

                {/* Translation */}
                <View style={styles.section}>
                    <Text style={styles.sectionTitle}>Translation</Text>
                    <View style={styles.detailContainer}>
                        <ScrollView>
                            <Text style={styles.textStyle}>
                                {translatedWords}
                            </Text>
                        </ScrollView>
                    </View>
                </View>

                {/* Prompt Image */}
                <Image
                    source={require('../../assets/Interface/Note Book/prompt.png')}
                    style={styles.promptImage}
                />

                {/* Chatbox Image */}
                <TouchableOpacity
                    onPress={() => {
                        handleChatHistory(wordsId);
                    }}>
                    <Image
                        source={require('../../assets/Interface/Note Book/chatbox.png')}
                        style={styles.chatboxImage}
                    />
                </TouchableOpacity>
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
    backgroundImage: {
        width: '100%',
        height: '100%',
        resizeMode: 'cover',
    },
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'space-between',
        paddingTop: height * 0.02,
    },
    section: {
        width: width * 0.9,
        height: height * 0.28,
        marginBottom: height * 0.02,
    },
    detailContainer: {
        backgroundColor: '#FFF',
        borderRadius: width * 0.05,
        padding: width * 0.05,
        flex: 1,
    },
    sectionTitle: {
        fontSize: width * 0.08,
        fontFamily: 'Pilsner_Regular',
        fontWeight: 'bold',
        marginBottom: height * 0.01,
    },
    textStyle: {
        fontSize: width * 0.05,
        fontFamily: 'Pilsner_Regular',
    },
    promptImage: {
        width: width * 0.6,
        height: height * 0.08,
        right: width * 0.03,
        bottom: height * 0.01,
        resizeMode: 'contain',
    },
    chatboxImage: {
        width: width,
        height: height * 0.17,
        right: -width * 0.35,
        bottom: height * 0.08,
        resizeMode: 'contain',
    },
});

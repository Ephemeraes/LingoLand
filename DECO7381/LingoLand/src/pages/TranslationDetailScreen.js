import React from 'react';
import { useNavigation } from '@react-navigation/native';
import { View, Text, StyleSheet, Dimensions, ScrollView, ImageBackground, Image, TouchableOpacity } from 'react-native';
import Header from '../components/Header';

/**
 * TranslationDetailScreen component: 
 * Displays the translation details page: original text and translated text.
 * Users can access the chat function at the click of a button to ask further questions.
 * 
 * @param {Object} route - Route object containing the passed parameters
 * @param {string} route.params.oriWords - Original text
 * @param {string} route.params.translatedWords - Translation of the text
 * @param {number} route.params.userId - The ID of the user
 * @returns {React.Component} Return to Translation Details page
 */
export default function TranslationDetailScreen({ route }) {
    const navigation = useNavigation();
    const { oriWords, translatedWords, userId } = route.params;
    const { width, height } = Dimensions.get('window');
    const styles = getStyles(width, height);

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

                {/* Prompts for chatbox */}
                <TouchableOpacity onPress={() => navigation.navigate('ChatBox', route.params)}>
                    <Image
                        source={require('../../assets/Interface/Translation Detail/askChat.png')}
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
        borderRadius: 20,
        padding: width * 0.05,
        flex: 1,
    },
    sectionTitle: {
        fontSize: width * 0.1,
        fontFamily: 'Pilsner_Regular',
        fontWeight: 'bold',
        marginBottom: height * 0.01,
    },
    textStyle: {
        fontSize: width * 0.08,
        fontFamily: 'Pilsner_Regular',
    },
    chatboxImage: {
        width: width,
        height: height * 0.25,
        bottom: height * 0.04,
        resizeMode: 'contain',
    },
});

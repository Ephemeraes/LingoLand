import React, { useEffect, useState } from 'react';
import { View, StyleSheet, ImageBackground, Image, Dimensions, TouchableOpacity, ActivityIndicator } from 'react-native';
import Header from '../components/Header';
import { useNavigation, useRoute } from '@react-navigation/native';


/**
 * DailyTaskWordStartScreen component: Used to display the start screen of the word task
 *
 * @returns {React.Component} Return to the Word Tasks Start page
 */
export default function DailyTaskWordStartScreen() {
    const navigation = useNavigation();
    const route = useRoute();
    const { word, onComplete } = route.params || {};
    const [loading, setLoading] = useState(false);
    const { width, height } = Dimensions.get('window');
    const styles = getStyles(width, height);


    // Loading
    useEffect(() => {
        setLoading(false);
    }, []);


    if (loading) {
        return (
            <View style={styles.loadingContainer}>
                <ActivityIndicator size="large" color="#0000ff" />
            </View>
        );
    }

    return (
        <View style={styles.container}>

            {/* Header */}
            <View style={styles.headerWrapper}>
                <Header title="Word Castle" goToScreen="DailyTaskIsland" />
            </View>

            {/* Background */}
            <ImageBackground
                source={require('../../assets/Interface/Daily Task/background.jpg')}
                style={styles.backgroundImage}
            >
                {/* Middle button */}
                <View style={styles.centeredImageContainer}>
                    <TouchableOpacity
                        onPress={() => navigation.navigate('WordFirstExplanation', {
                            word: word.word,
                            translation: word.trans,
                            onComplete,
                            isReviewMode: false
                        })}
                    >
                        {/* Castle Pictures */}
                        <Image
                            source={require('../../assets/Interface/Daily Task/word.png')}
                            style={styles.centeredImage}
                        />
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
    headerWrapper: {
        position: 'absolute',
        top: 0,
        width: '100%',
        zIndex: 10,
    },
    loadingContainer: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
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

        zIndex: 1,
    },
    centeredImage: {
        top: height * -0.01,
        width: width * 1.1,
        height: height * 1,
        resizeMode: 'contain',
    },
});
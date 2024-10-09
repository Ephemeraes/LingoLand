import React, { useEffect, useState } from 'react';
import { View, StyleSheet, ImageBackground, Image, Dimensions, TouchableOpacity, ActivityIndicator } from 'react-native';
import Header from '../components/Header';
import { useNavigation, useRoute } from '@react-navigation/native';

/**
 * DailyTaskGrammerStartScreen component: 
 * the user selects the start screen of the grammar task and clicks 
 * on it to go to the grammar question screen.
 *
 * @returns {React.Component} Return to the grammar task start page
 */
export default function DailyTaskGrammerStartScreen() {
    const navigation = useNavigation();
    const route = useRoute();
    const { onComplete, grammar } = route.params || {};
    const isReviewMode = false;
    const [loading, setLoading] = useState(false);
    const { width, height } = Dimensions.get('window');
    const styles = getStyles(width, height);

    const grammarQuestions = grammar ? [grammar] : [];

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
            <View style={styles.backgroundContainer}>
                <ImageBackground
                    source={require('../../assets/Interface/Daily Task/background.jpg')}
                    style={styles.backgroundImage}
                >
                    {/* Center Image */}
                    <View style={styles.centeredImageContainer}>
                        <TouchableOpacity
                            onPress={() => navigation.navigate('GrammerTopic', {
                                grammarQuestions,
                                onComplete: onComplete,
                                isReviewMode
                            })}
                        >
                            <Image
                                source={require('../../assets/Interface/Daily Task/grammer.png')}
                                style={styles.centeredImage}
                            />
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
    headerWrapper: {
        position: 'absolute',
        top: 0,
        width: '100%',
        zIndex: 10,
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
        marginTop: height * 0.1,
    },
    centeredImage: {
        top: height * -0.05,
        width: width * 1.1,
        height: height * 1,
        resizeMode: 'contain',
    },
});


import React, { useEffect } from 'react';
import { View, StyleSheet, ImageBackground, Image, Dimensions, TouchableOpacity } from 'react-native';
import Header from '../components/Header';
import { useNavigation, useRoute } from '@react-navigation/native';

/**
 * DailyTaskReviewScreen component: Startup page showing daily review tasks
 * 
 * @returns {React.Component} Return to the Daily Review Task Launch page.
 */
export default function DailyTaskReviewScreen() {
    const navigation = useNavigation();
    const route = useRoute();
    const { width, height } = Dimensions.get('window');
    const styles = getStyles(width, height);

    const { words, grammars, onComplete } = route.params || { words: [], grammars: [] };

    // Use useEffect to print received data.
    useEffect(() => {
        console.log('Received words:', words);
        console.log('Received grammars:', grammars);
        console.log('Received onComplete function:', onComplete);
    }, [words, grammars, onComplete]);

    /**
     * handleReviewPress function
     */
    const handleReviewPress = () => {
        console.log('Navigating to DailyReview with:');
        console.log('Words:', words);
        console.log('Grammars:', grammars);
        console.log('onComplete function:', onComplete);

        navigation.navigate('DailyReview', {
            words,
            grammars,
            onComplete,
        });
    };

    return (
        <View style={styles.container}>

            {/* Header */}
            <View style={styles.headerContainer}>
                <Header title="Daily Review" goToScreen="DailyTaskIsland" />
            </View>

            {/* Background */}
            <View style={styles.backgroundContainer}>
                <ImageBackground
                    source={require('../../assets/Interface/Daily Task/background.jpg')}
                    style={styles.backgroundImage}
                >
                    <View style={styles.centeredImageContainer}>

                        {/* Picture button */}
                        <TouchableOpacity onPress={handleReviewPress}>
                            <Image
                                source={require('../../assets/Interface/Daily Task/timetoreview.png')}
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
    headerContainer: {
        backgroundColor: '#fff',
        zIndex: 1,
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
    },
    centeredImage: {
        width: width * 1.1,
        height: height * 1.1,
        resizeMode: 'contain',
        top: -20,
    },
});

import React from 'react';
import { View, Text, Image, ImageBackground, StyleSheet, useWindowDimensions, TouchableOpacity } from 'react-native';
import Header from '../components/Header';
import { useNavigation } from '@react-navigation/native';


/**
 * ParentalModelScreen Component: 
 * Provides a parental mode administration interface that allows users 
 * to manage content such as sensitive words.
 * 
 * Includes a button to jump to the sensitive words management page.
 * 
 * @returns {React.Component} Return to Parental Mode Management page
 */
export default function ParentalModelScreen() {
    const navigation = useNavigation();
    const { width, height } = useWindowDimensions();
    const styles = getStyles(width, height);

    return (
        <ImageBackground
            source={require('../../assets/Interface/Profile Interface/background.jpg')}
            style={styles.backgroundImage}
        >
            <View style={styles.headerWrapper}>
                <Header title="Parental Model" goToScreen="Profile" />
            </View>
            {/* Main content */}
            <View style={styles.mainContainer}>
                {/* Sensitive words management button */}
                <TouchableOpacity style={styles.contentBox} onPress={() => navigation.navigate('SensitiveWords')}>
                    <Text style={styles.contentText}>Sensitive words Management</Text>
                    <Image source={require('../../assets/Interface/Parental Model/sensitive-icon.gif')} style={styles.characterImage} />
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
    headerWrapper: {
        position: 'absolute',
        top: 0,
        width: '100%',
        zIndex: 10,
    },
    mainContainer: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: height * -0.03,
    },
    contentBox: {
        width: width * 0.85,
        height: width * 1.1,
        backgroundColor: '#FFF3DA',
        borderRadius: 20,
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: height * 0.02,
    },
    contentText: {
        fontSize: width * 0.12,
        textAlign: 'center',
        fontFamily: 'Pilsner_Regular',
        top: height * -0.035,
        color: '#115700',
    },
    characterImage: {
        width: width * 0.6,
        height: width * 0.6,
        marginTop: height * -0.005,
    },
});

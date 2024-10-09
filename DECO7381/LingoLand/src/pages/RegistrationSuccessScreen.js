import React from 'react';
import { StyleSheet, TouchableOpacity, ImageBackground } from 'react-native';
import { useNavigation } from '@react-navigation/native';

/**
 * RegistrationSuccessScreen Component: Used to display a prompt page for successful user registration.
 * The user will be redirected to the login page after tapping the entire screen.
 * 
 * @returns {React.Component} Return to the registration success page
 */
export default function RegistrationSuccessScreen() {
    const navigation = useNavigation();

    return (
        <TouchableOpacity
            style={styles.fullScreenButton}
            activeOpacity={1}
            onPress={() => navigation.navigate('Login')}
        >
            <ImageBackground
                source={require('../../assets/Interface/Register/success.jpg')}
                style={styles.background}
                resizeMode="cover"
            >
            </ImageBackground>
        </TouchableOpacity>
    );
}

/**
 * Style design
 */
const styles = StyleSheet.create({
    fullScreenButton: {
        flex: 1,
        width: '100%',
        height: '100%',
    },
    background: {
        flex: 1,
        width: '100%',
        height: '100%',
        justifyContent: 'center',
        alignItems: 'center',
    },
});

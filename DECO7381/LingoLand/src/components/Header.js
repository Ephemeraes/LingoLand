import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet, Dimensions } from 'react-native';
import { useNavigation } from '@react-navigation/native';

// Get the screen dimensions to dynamically size components
const { width, height } = Dimensions.get('window');


const Header = ({ title, goToScreen }) => {
    // Get the screen dimensions to dynamically size components
    const navigation = useNavigation();

    // Handle back button press
    const handleBackPress = () => {
        // Navigate to a specified screen if provided, otherwise go back to the previous screen
        if (goToScreen) {
            navigation.navigate(goToScreen);
        } else {
            navigation.goBack();
        }
    };

    return (
        <View style={styles.header}>
            <TouchableOpacity onPress={handleBackPress} style={styles.backButton}>
                <Text style={styles.backButtonText}>←</Text>
            </TouchableOpacity>
            <Text style={styles.title}>{title}</Text>
        </View>
    );
};

// Styles for the header component
const styles = StyleSheet.create({
    header: {
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'flex-start',
        paddingTop: height * 0.05, // Adapt status bar height
        paddingHorizontal: width * 0.05,
        backgroundColor: '#FFF3DA', // Background Color
        height: height * 0.12, // Header height
    },
    backButton: {
        marginRight: width * 0.02,
    },
    backButtonText: {
        fontSize: 24,
        fontWeight: 'bold',
        color: '#000',
    },
    title: {
        fontSize: 28,
        fontWeight: 'bold',
        color: '#115700',
        marginLeft: width * 0.03,
    },
});

export default Header;

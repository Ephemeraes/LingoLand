import React, { useState, useEffect } from 'react';
import { View, Text, ImageBackground, useWindowDimensions, StyleSheet, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Header from '../components/Header';

/**
 * AchievementScreen component: Used to display the user's achievement information.
 *Display the number of consecutive login days, the number of words learnt, 
 and the level of rewards earned through data obtained from the server.
 * 
 * @returns {React.Component} Return to Achievement Page Components
 */
export default function AchievementScreen() {
    const [achievementData, setAchievementData] = useState(null);
    const [userId, setUserId] = useState(null);
    const { width, height } = useWindowDimensions();
    const styles = getStyles(width, height);

    /**
     * useEffect hook: get user ID on component loading
     * Reads user information from AsyncStorage, extracts and sets the user ID.
     * 
     * @throws Throws an error and displays an appropriate prompt when data reading fails.
     */
    useEffect(() => {
        const fetchUserDataAndAchievements = async () => {
            try {
                // Getting and setting stored user data from AsyncStorage
                const userDataString = await AsyncStorage.getItem('userData');
                if (userDataString) {
                    const userData = JSON.parse(userDataString);
                    setUserId(userData.id);

                    // Call the API to get user achievement data if userId is set
                    const response = await fetch(`http://192.168.31.40:8081/user/achievement/${userData.id}`);
                    const result = await response.json();

                    if (result.code === 200 && result.data) {
                        // Store the acquired achievement data in the state
                        setAchievementData(result.data);
                    } else {
                        Alert.alert('Error', 'Failed to fetch achievement data');
                    }
                } else {
                    Alert.alert('Error', 'No user data found');
                }
            } catch (error) {
                console.error('Failed to load user data or achievement data', error);
                Alert.alert('Error', 'Something went wrong');
            }
        };

        fetchUserDataAndAchievements();
    }, []); // This will run only once when the component is mounted.


    return (
        <ImageBackground
            source={require('../../assets/Interface/Achievement/background.jpg')}
            style={styles.background}
        >
            <View style={styles.container}>
                {/* Header */}
                <Header title="Achievement Record" goToScreen="Profile" />

                {/* Achievement information */}
                {achievementData ? (
                    <View style={styles.recordContainer}>
                        <Text style={styles.recordText}>Consecutive Days Logged In:</Text>
                        <Text style={styles.recordValue}>{achievementData[0]} Days</Text>
                        <Text style={styles.recordText}>Words Learned:</Text>
                        <Text style={styles.recordValue}>{achievementData[1]} Words</Text>
                        <Text style={styles.recordText}>Rewards Earned:</Text>
                        <Text style={styles.recordValue}>Level {achievementData[2]}</Text>
                    </View>
                ) : (
                    <Text style={styles.recordText}>No achievement data available</Text>
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
    background: {
        flex: 1,
        width: '100%',
        height: '100%',
    },
    container: {
        flex: 1,
    },
    recordContainer: {
        width: width * 0.9,
        alignItems: 'center',
        left: width * 0.05,
    },
    recordText: {
        fontSize: width * 0.13,
        fontFamily: 'Pilsner_Regular',
        fontWeight: 'bold',
        color: '#115700',
        textAlign: 'center',
        marginTop: height * 0.013,
    },
    recordValue: {
        fontSize: width * 0.075,
        fontFamily: 'Pilsner_Regular',
        color: '#7CCD7C',
    },
});
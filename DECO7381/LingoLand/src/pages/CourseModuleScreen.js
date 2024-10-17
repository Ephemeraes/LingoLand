import React, { useState, useEffect } from 'react';
import { View, Text, TouchableOpacity, StyleSheet, useWindowDimensions, ImageBackground, Image, Alert, ActivityIndicator } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Header from '../components/Header';

/**
 * CourseModuleScreen component: 
 * allows the user to select different course modules (Beginner, Intermediate, Advanced) and 
 * updates the user's learning progress based on the selection.
 * 
 * @returns {React.Component} Return to Course Module Page Components
 */
export default function CourseModuleScreen() {
    const [user, setUser] = useState(null);
    const { width, height } = useWindowDimensions();
    const styles = getStyles(width, height);

    /**
     * Retrieve user data from AsyncStorage and set to component state.
     * Use the useEffect hook to ensure that data is automatically loaded when the component is loaded.
     */
    useEffect(() => {
        const loadUserData = async () => {
            try {
                const userDataString = await AsyncStorage.getItem('userData');
                if (userDataString) {
                    const userData = JSON.parse(userDataString);
                    setUser(userData);
                } else {
                    Alert.alert('Error', 'No user data found');
                }
            } catch (error) {
                console.error('Failed to load user data from AsyncStorage', error);
                Alert.alert('Error', 'Unable to load user data');
            }
        };
        loadUserData();
    }, []);

    /**
     * Confirmation of Learning Level Change: 
     * A pop-up box prompts the user to confirm whether to change the learning level.
     * 
     * @param {string} newLevel - A new learning level selected by the user.
     */
    const confirmStudyLevelChange = (newLevel) => {
        Alert.alert(
            'Confirm Change',
            'Are you sure you want to change the study level? This will reset your progress on the islands.',
            [
                { text: 'Cancel', style: 'cancel' },
                { text: 'OK', onPress: () => updateStudyLevel(newLevel) }
            ]
        );
    };

    /**
     * Update Learning Level and Reset Island Status: 
     * Updates the user's learning level to the server and resets learning progress.
     * 
     * @param {string} newLevel - A new learning level selected by the user.
     */
    const updateStudyLevel = async (newLevel) => {
        let updatedUser = { ...user, studyLevel: newLevel };

        try {
            // Send an update request to the server
            const response = await fetch('http://10.71.95.219:8081/user/update', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(updatedUser)
            });

            const result = await response.json();

            if (response.ok && result.code === 200) {
                // Updating Local User Status and AsyncStorage
                setUser(updatedUser);
                await AsyncStorage.setItem('userData', JSON.stringify(updatedUser));

                // Calling the logic to reset the island state
                await resetIslandsProgress(updatedUser.id);
                Alert.alert('Success', 'Study level updated successfully!');
            } else {
                Alert.alert('Error', `Update failed: ${result.message || 'Unknown error'}`);
            }
        } catch (error) {
            console.error('Failed to update study level', error);
            Alert.alert('Error', 'Unable to connect to the server');
        }
    };

    /**
     * Reset Island Status to Incomplete:
     * resets the user's learning progress to its initial state, with all islands marked as incomplete.
     * 
     * @param {number} userId - The unique identifier (ID) of the current user.
     */
    const resetIslandsProgress = async (userId) => {
        const initialIslands = [false, false, false, false, false, false, false];

        try {
            // Reset island state and store to AsyncStorage
            await AsyncStorage.setItem(`completedIslands_${userId}`, JSON.stringify(initialIslands));
            console.log('Island progress reset for user:', userId);
        } catch (error) {
            console.error('Failed to reset island progress', error);
        }
    };

    /**
     * ModuleOption component: used to display course module options.
     * 
     * @param {Object} props - The props parameter of the component.
     * @param {string} props.title - Module Name.
     * @param {string} props.id - The unique identifier of the module.
     * @returns {React.Component} Return to the Course Module Options button.
     */
    const ModuleOption = ({ title, id }) => (
        <TouchableOpacity
            style={[styles.moduleOption, user && user.studyLevel === id && styles.selectedModule]}
            onPress={() => confirmStudyLevelChange(id)}
        >
            <Text style={styles.moduleText}>{title}</Text>
            {user && user.studyLevel === id && (
                <Image
                    source={require('../../assets/Interface/Course Module/V.gif')}
                    style={styles.checkIcon}
                />
            )}
        </TouchableOpacity>
    );

    // If user data has not yet been loaded, display the load indicator
    if (!user) {
        return (
            <View style={styles.loadingContainer}>
                <ActivityIndicator size="large" color="#0000ff" />
            </View>
        );
    }

    return (
        <ImageBackground
            source={require('../../assets/Interface/Course Module/background.jpg')}
            style={styles.backgroundImage}
        >
            <View style={styles.container}>
                {/* Header */}
                <Header title="Course Module" goToScreen="Profile" />

                {/* Course Module Options */}
                <View style={styles.container}>
                    <ModuleOption title="Junior" id="junior" />
                    <ModuleOption title="Intermediate" id="middle" />
                    <ModuleOption title="Advanced" id="senior" />
                </View>
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
    container: {
        flex: 1,
    },
    backgroundImage: {
        flex: 1,
        width: width,
        height: height,
    },
    moduleOption: {
        backgroundColor: '#FFF8DC',
        borderRadius: width * 0.09,
        padding: width * 0.065,
        marginTop: height * 0.04,
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        width: width * 1,
        alignSelf: 'center',
    },
    selectedModule: {
        borderColor: '#115700',
        borderWidth: 2,
    },
    moduleText: {
        fontSize: width * 0.1,
        fontWeight: 'bold',
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
    },
    checkIcon: {
        width: width * 0.2,
        height: width * 0.2,
    },
    loadingContainer: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
    },
});

import React, {useCallback, useState} from 'react';
import {View, Text, Image, TouchableOpacity, StyleSheet, ImageBackground, Alert, Switch, useWindowDimensions} from 'react-native';
import {useNavigation, useFocusEffect} from '@react-navigation/native';
import Header from '../components/Header';
import AsyncStorage from "@react-native-async-storage/async-storage";

// The main component for the Settings screen
export default function SettingScreen() {
    const [userData, setUserData] = useState(null);
    const [isEnabled, setIsEnabled] = useState(false); 
    const {width, height} = useWindowDimensions();
    const styles = getStyles(width, height);
    const navigation = useNavigation();

    // Function to load user data from AsyncStorage
    const loadUserData = async () => {
        try {
            const userDataString = await AsyncStorage.getItem('userData');
            if (userDataString) {
                const Data = JSON.parse(userDataString);
                setUserData(Data);
            } else {
                console.error('No user data found');
            }
        } catch (error) {
            console.error('Error loading user data from AsyncStorage:', error);
        }
    };

    // Use useFocusEffect to ensure data is reloaded when the screen is focused
    useFocusEffect(
        useCallback(() => {
            loadUserData();
        }, [])
    );

    // Toggle the state of the notification switch
    const toggleSwitch = () => setIsEnabled(previousState => !previousState);

    // Handle the logout button press
    const handleLogout = () => {
        Alert.alert('Logout', 'Are you sure you want to logout?', [
            {text: 'Cancel', style: 'cancel'},
            {text: 'Logout', onPress: () => navigation.navigate('LoginScreen')},
        ]);
    };

    // Placeholder function for handling edits (e.g., user name)
    function handleEdit(parmas) {
        return undefined;
    }

    return (
        <ImageBackground
            source={require('../../assets/Interface/Profile Interface/background.jpg')}
            style={styles.backgroundImage}
        >
            <View style={styles.container}>
                {/* Header component with a back button leading to the "Profile" screen */}
                <Header title="Setting" goToScreen="Profile"/>

                {/* Section to display and change the user's avatar */}
                <View style={styles.avatarSection}>
                    <Image source={require('../../assets/Interface/Avatars/boy.gif')} style={styles.avatar}/>
                    <Text style={styles.changeAvatarText}>Change Avatar</Text>
                </View>

                {/* User details section (e.g., name) */}
                <View style={styles.detailSection}>
                    <View style={styles.detailRow}>
                        <Text style={styles.label}>Name:</Text>

                        {/* Display user name if available */}
                        {userData && <Text style={styles.value}>{userData.name}</Text>}
                        <View style={styles.spacer}/>

                        {/* Button to edit the user's name */}
                        <TouchableOpacity onPress={() => handleEdit('name')}>
                            <Image source={require('../../assets/Interface/Setting/icon-edit.png')} style={styles.icon}/>
                        </TouchableOpacity>
                    </View>
                </View>

                {/* Notifications toggle section */}
                <View style={styles.detailSection}>
                    <View style={styles.detailRow}>
                        <Text style={styles.label}>Notifications:</Text>
                        <Switch
                            trackColor={{false: '#767577', true: '#A3D9A5'}}
                            thumbColor={isEnabled ? '#115700' : '#f4f3f4'}
                            onValueChange={toggleSwitch}
                            value={isEnabled}
                            style={styles.switch}
                        />
                        <View style={styles.spacer}/>

                         {/* Button to edit notification settings */}
                        <TouchableOpacity onPress={() => handleEdit('notifications')}>
                            <Image source={require('../../assets/Interface/Setting/icon-notification.png')} style={styles.icon}/>
                        </TouchableOpacity>
                    </View>
                </View>

                {/* Section for navigating to 'About Customer Service' */}
                <TouchableOpacity onPress={() => navigation.navigate('AboutCustomer')}>
                    <View style={styles.detailSection}>
                        <View style={styles.detailRow}>
                            <Text style={styles.label}>About Customer Service</Text>
                            <View style={styles.spacer}/>
                            <Image source={require('../../assets/Interface/Setting/icon-customer.png')} style={styles.icon}/>
                        </View>
                    </View>
                </TouchableOpacity>

                {/* Section for navigating to 'Terms and Privacy Policy' */}
                <TouchableOpacity onPress={() => navigation.navigate('TermsPrivacyPolicy')}>
                    <View style={styles.detailSection}>
                        <View style={styles.detailRow}>
                            <Text style={styles.label}>Terms, Privacy Policy</Text>
                            <View style={styles.spacer}/>
                            <Image source={require('../../assets/Interface/Setting/term-icon.png')} style={styles.icon}/>
                        </View>
                    </View>
                </TouchableOpacity>

                {/* Section for navigating to 'Create Team' */}
                <TouchableOpacity onPress={() => navigation.navigate('CreateTeam')}>
                    <View style={styles.detailSection}>
                        <View style={styles.detailRow}>
                            <Text style={styles.label}>Create Team</Text>
                            <View style={styles.spacer}/>
                            <Image source={require('../../assets/Interface/Setting/icon-team.png')} style={styles.icon}/>
                        </View>
                    </View>
                </TouchableOpacity>

                {/* Logout button */}
                <TouchableOpacity style={styles.logoutButton} onPress={handleLogout}>
                    <Text style={styles.logoutText}>Logout</Text>
                </TouchableOpacity>
            </View>
        </ImageBackground>
    );
}

// Function to create responsive styles based on screen dimensions
const getStyles = (width, height) => StyleSheet.create({
    backgroundImage: {
        flex: 1,
        width: '100%',
        height: '100%',
    },

    container: {
        flex: 1,
    },

    avatarSection: {
        alignItems: 'center',
        marginVertical: height * 0.03,
    },

    avatar: {
        width: width * 0.3,
        height: width * 0.3,
        borderRadius: width * 0.15,
        backgroundColor: "#FFF3DA",
    },

    changeAvatarText: {
        fontSize: width * 0.09,
        fontWeight: 'bold',
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
    },

    detailSection: {
        paddingHorizontal: width * 0.05,
        backgroundColor: '#FFF3DA',
        borderRadius: 100,
        paddingVertical: height * 0.01,
        marginVertical: height * 0.01,
    },

    detailRow: {
        flexDirection: 'row',
        alignItems: 'center',
    },

    label: {
        fontSize: width * 0.09,
        fontWeight: 'bold',
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
        marginLeft: width * 0.08,
    },

    value: {
        fontSize: width * 0.09,
        fontWeight: 'bold',
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
        marginLeft: width * 0.02,
    },

    switch: {
        marginLeft: width * 0.02,
    },

    spacer: {
        flex: 1, 
    },
    icon: {
        width: width * 0.09,
        height: width * 0.09,
        resizeMode: 'contain',

    },
    logoutButton: {
        width: '40%',
        marginTop: height * 0.05,
        backgroundColor: '#A3D9A5',
        paddingVertical: height * 0.02,
        borderRadius: 20,
        alignSelf: 'center', 
    },
    logoutText: {
        fontSize: width * 0.09,
        fontWeight: 'bold',
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
        textAlign: 'center',
    },
});

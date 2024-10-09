import React, { useState, useEffect } from 'react';
import {
    View, Text, TextInput, TouchableOpacity, StyleSheet, ImageBackground, Image, ScrollView, Switch, Modal, Alert, useWindowDimensions,
} from 'react-native';
import RNPickerSelect from 'react-native-picker-select';
import { Ionicons } from '@expo/vector-icons';
import { useNavigation } from '@react-navigation/native';
import * as Notifications from 'expo-notifications';
import AsyncStorage from '@react-native-async-storage/async-storage';
import * as Crypto from 'expo-crypto';

/**
 * RegisterScreen Component: 
 * Provides user registration functionality, including choosing an avatar, 
 * notification settings, and so on.
 * 
 * @returns {React.Component} Return to the registration page
 */
export default function RegisterScreen() {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [parentalPassword, setParentalPassword] = useState('');
    const [courseModule, setCourseModule] = useState('');
    const [notificationsEnabled, setNotificationsEnabled] = useState(false);
    const [modalVisible, setModalVisible] = useState(false);
    const [selectedAvatar, setSelectedAvatar] = useState(null);

    const navigation = useNavigation();

    const { width, height } = useWindowDimensions();

    const styles = React.useMemo(() => getStyles(width, height), [width, height]);

    /**
     * handleNotificationSwitch function: handle notification switch state switching
     * 
     * @param {boolean} value - Notification of the new state of the switch (on or off)
     * @returns {void} Updating Notification Status in AsyncStorage
     */
    const handleNotificationSwitch = async (value) => {
        setNotificationsEnabled(value);

        const userDataString = await AsyncStorage.getItem('userData');
        let userData = userDataString ? JSON.parse(userDataString) : {};
        userData.notificationsEnabled = value;

        // Save updated data back to AsyncStorage
        try {
            await AsyncStorage.setItem('userData', JSON.stringify(userData));
        } catch (error) {
            console.error('Failed to save notifications preference', error);
        }
    };

    /**
     * handleRegister function: 
     * Checks user input and displays an avatar selection popup when all required fields are completed.
     * 
     * @returns {void} If all inputs are filled in, an avatar selection popup is displayed, otherwise an error message is displayed.
     */
    const handleRegister = () => {
        if (username && password && parentalPassword && courseModule) {
            // Show avatar selection popup
            setModalVisible(true);
        } else {
            Alert.alert("Error", "Please fill all fields");
        }
    };

    // Avatar mapping for ID matching 
    const avatarMapping = {
        'boy': '1',
        'boy-2': '2',
        'girl': '3',
        'girl-2': '4',
    };

    /**
     * handleAvatarSelect function: 
     * handles the avatar selection, storing the user's selected avatar in the state
     * 
     * @param {string} avatar - Selected avatar name
     * @returns {void} Setting the selected avatar
     */
    const handleAvatarSelect = (avatar) => {
        setSelectedAvatar(avatarMapping[avatar]);
    };

    /**
     * handleConfirm function: 
     * confirms registration, handles password encryption, and sends the data to the backend for registration.
     * 
     * @returns {void} Sends user data to the server and saves it to AsyncStorage
     */
    const handleConfirm = async () => {
        if (selectedAvatar) {
            setModalVisible(false);

            // Hash passwords and parental control passwords
            const hashedPassword = await Crypto.digestStringAsync(
                Crypto.CryptoDigestAlgorithm.SHA256,
                password
            );

            const hashedParentalPassword = await Crypto.digestStringAsync(
                Crypto.CryptoDigestAlgorithm.SHA256,
                parentalPassword
            );

            const userData = {
                name: username,
                studyLevel: courseModule,
                avatar: selectedAvatar,
                notificationsEnabled: notificationsEnabled,
            };

            try {
                // Send registration information to the backend
                const response = await fetch('http://192.168.31.40:8081/user/register', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        ...userData,
                        password: hashedPassword,
                        parentControlPassword: hashedParentalPassword,
                    }),
                });

                const result = await response.json();

                if (response.ok) {
                    // Successful registration, save user data to AsyncStorage
                    try {
                        await AsyncStorage.setItem('userData', JSON.stringify(userData));
                    } catch (error) {
                        console.error('Failed to save user data', error);
                    }

                    navigation.navigate('RegistrationSuccess');
                } else {
                    Alert.alert('Registration Failed', result.message || 'Please try again.');
                }
            } catch (error) {
                Alert.alert('Error', 'Something went wrong. Please try again later.');
            }
        } else {
            Alert.alert("Select avatar", "Please select an avatar first to continue registration.");
        }
    };

    return (
        <ImageBackground
            source={require('../../assets/Interface/Register/background.jpg')}  // 背景图片
            style={styles.background}
            resizeMode="cover"
        >
            <ScrollView contentContainerStyle={styles.contentContainer}>
                <Text style={styles.title}>Sign up</Text>

                {/* User name input box */}
                <TextInput
                    style={styles.input}
                    placeholder="User Name"
                    value={username}
                    onChangeText={setUsername}
                />
                {/* Password input box */}
                <TextInput
                    style={styles.input}
                    placeholder="Password"
                    value={password}
                    onChangeText={setPassword}
                    secureTextEntry
                />
                {/* Parental mode password entry box */}
                <TextInput
                    style={styles.input}
                    placeholder="Password for Parental mode"
                    value={parentalPassword}
                    onChangeText={setParentalPassword}
                    secureTextEntry
                />

                {/* Course Selection */}
                <View style={styles.pickerContainer}>
                    <RNPickerSelect
                        onValueChange={(value) => setCourseModule(value)}
                        items={[
                            { label: 'Junior', value: 'junior' },
                            { label: 'Intermediate', value: 'middle' },
                            { label: 'Advanced', value: 'senior' },
                        ]}
                        placeholder={{
                            label: 'Select Your Course Module',
                            value: '',
                        }}
                        style={{
                            inputIOS: styles.pickerInput,
                            inputAndroid: styles.pickerInput,
                        }}
                    />
                    <Ionicons name="arrow-down" size={width * 0.06} color="#ccc" style={styles.iconStyle} />
                </View>

                {/* Notification Switch */}
                <View style={styles.switchContainer}>
                    <Text style={styles.notificationText}>Notification</Text>
                    <Switch onValueChange={handleNotificationSwitch} value={notificationsEnabled} />
                </View>

                {/* Register button */}
                <View style={styles.buttonContainer}>
                    <TouchableOpacity style={styles.button} onPress={handleRegister}>
                        <Image
                            source={require('../../assets/Interface/Register/RegisterButton.png')}
                            style={styles.buttonImage}
                        />
                    </TouchableOpacity>
                </View>

                {/* Avatar selection pop-up */}
                <Modal
                    animationType="slide"
                    transparent={true}
                    visible={modalVisible}
                    onRequestClose={() => {
                        Alert.alert("Modal has been closed.");
                        setModalVisible(!modalVisible);
                    }}
                >
                    <View style={styles.centeredView}>
                        <View style={styles.modalView}>
                            <Text style={styles.modalText}>Choose Your Avatar</Text>
                            <View style={styles.avatarContainer}>
                                {/* Avatar Selection Button */}
                                <TouchableOpacity onPress={() => handleAvatarSelect('boy')}
                                    style={[styles.avatar, selectedAvatar === '1' ? styles.selectedAvatar : null]}>
                                    <Image source={require('../../assets/Interface/Avatars/boy.gif')} style={styles.avatarImage} />
                                </TouchableOpacity>
                                <TouchableOpacity onPress={() => handleAvatarSelect('boy-2')}
                                    style={[styles.avatar, selectedAvatar === '2' ? styles.selectedAvatar : null]}>
                                    <Image source={require('../../assets/Interface/Avatars/boy-2.gif')} style={styles.avatarImage} />
                                </TouchableOpacity>
                                <TouchableOpacity onPress={() => handleAvatarSelect('girl')}
                                    style={[styles.avatar, selectedAvatar === '3' ? styles.selectedAvatar : null]}>
                                    <Image source={require('../../assets/Interface/Avatars/girl.gif')} style={styles.avatarImage} />
                                </TouchableOpacity>
                                <TouchableOpacity onPress={() => handleAvatarSelect('girl-2')}
                                    style={[styles.avatar, selectedAvatar === '4' ? styles.selectedAvatar : null]}>
                                    <Image source={require('../../assets/Interface/Avatars/girl-2.gif')} style={styles.avatarImage} />
                                </TouchableOpacity>
                            </View>
                            <View style={styles.buttonRow}>
                                <TouchableOpacity
                                    style={[styles.modalButton, styles.cancelButton]}
                                    onPress={() => setModalVisible(false)}
                                >
                                    <Text style={styles.buttonText}>Cancel</Text>
                                </TouchableOpacity>
                                <TouchableOpacity
                                    style={[styles.modalButton, styles.confirmButton]}
                                    onPress={handleConfirm}
                                >
                                    <Text style={styles.buttonText}>Confirm</Text>
                                </TouchableOpacity>
                            </View>
                        </View>
                    </View>
                </Modal>
            </ScrollView>
        </ImageBackground>
    );
}

/**
 * 样式生成函数，动态根据屏幕大小生成样式。
 * 
 * @param {number} width - 屏幕宽度
 * @param {number} height - 屏幕高度
 * @returns {object} 返回样式对象
 */
const getStyles = (width, height) => StyleSheet.create({
    background: {
        flex: 1,
        width: '100%',
        height: '100%',
    },
    contentContainer: {
        flexGrow: 1,
        paddingHorizontal: width * 0.05,
        paddingVertical: height * 0.03,
        paddingTop: height * 0.1,
        alignItems: 'center',
        justifyContent: 'center',
    },
    title: {
        fontWeight: 'bold',
        marginBottom: height * 0.03,
        fontSize: width * 0.1,
        fontFamily: 'Pilsner_Regular',
        marginTop: height * 0.07,
    },
    input: {
        width: '90%',
        backgroundColor: 'white',
        borderWidth: 1,
        borderColor: '#ccc',
        marginVertical: height * 0.01,
        height: height * 0.06,
        paddingVertical: height * 0.015,
        paddingHorizontal: width * 0.05,
        borderRadius: width * 0.05,
        fontSize: width * 0.06,
        fontFamily: 'Pilsner_Regular',
        marginTop: height * 0.02,
    },
    pickerContainer: {
        width: '90%',
        marginVertical: height * 0.01,
        position: 'relative',
    },
    pickerInput: {
        fontSize: width * 0.06,
        fontFamily: 'Pilsner_Regular',
        height: height * 0.06,
        paddingVertical: height * 0.015,
        paddingHorizontal: width * 0.05,
        borderWidth: 1,
        borderColor: "#ccc",
        borderRadius: width * 0.05,
        paddingRight: width * 0.08,
        marginTop: height * 0.02,
        backgroundColor: 'white',
    },
    iconStyle: {
        position: 'absolute',
        right: width * 0.05,
        top: height * 0.03,
        marginTop: height * 0.02,
        transform: [{ translateY: -height * 0.015 }],
    },
    switchContainer: {
        width: '90%',
        height: height * 0.06,
        paddingVertical: height * 0.015,
        paddingHorizontal: width * 0.05,
        borderWidth: 1,
        borderColor: '#ccc',
        backgroundColor: 'white',
        borderRadius: width * 0.05,
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between',
        marginTop: height * 0.02,
    },
    notificationText: {
        color: 'black',
        fontWeight: 'bold',
        fontSize: width * 0.06,
        fontFamily: 'Pilsner_Regular',
    },
    buttonContainer: {
        width: '100%',
        alignItems: 'center',
    },
    button: {
        width: '90%',
        height: undefined,
        aspectRatio: 2,
        justifyContent: 'center',
        alignItems: 'center',
        overflow: 'hidden',
        borderRadius: width * 0.05,
    },
    buttonImage: {
        width: '100%',
        height: '100%',
        resizeMode: 'contain',
    },
    centeredView: {
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
    },
    modalView: {
        width: '90%',
        backgroundColor: "white",
        borderRadius: width * 0.05,
        padding: width * 0.05,
        alignItems: "center",
        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 2,
        },
        shadowOpacity: 0.25,
        shadowRadius: 4,
        elevation: 5,
    },
    avatarContainer: {
        flexDirection: 'row',
        justifyContent: 'space-around',
        width: '100%',
        marginVertical: height * 0.02,
    },
    avatar: {
        width: '20%',
        aspectRatio: 1,
        borderRadius: 999,
        margin: width * 0.02,
        justifyContent: 'center',
        alignItems: 'center',
    },
    avatarImage: {
        width: '100%',
        height: '100%',
    },
    selectedAvatar: {
        backgroundColor: '#d3d3d3',
    },
    modalText: {
        marginBottom: height * 0.02,
        textAlign: "center",
        fontWeight: 'bold',
        fontSize: width * 0.08,
        fontFamily: 'Pilsner_Regular',
    },
    buttonRow: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        marginTop: height * 0.01,
        width: '100%',
    },
    modalButton: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        paddingVertical: height * 0.015,
        marginHorizontal: width * 0.02,
        borderRadius: width * 0.025,
    },
    cancelButton: {
        backgroundColor: '#b2fab4',
    },
    confirmButton: {
        backgroundColor: '#b2fab4',
    },
    buttonText: {
        color: '#2e8b57',
        fontWeight: 'bold',
        fontSize: width * 0.07,
        fontFamily: 'Pilsner_Regular',
    },
});

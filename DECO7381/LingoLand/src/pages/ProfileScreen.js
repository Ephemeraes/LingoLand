import React, { useState, useEffect } from 'react';
import { View, Text, Image, TouchableOpacity, StyleSheet, Dimensions, ImageBackground, Modal, TextInput, Alert } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import * as Crypto from 'expo-crypto';
import Header from '../components/Header';

const { width, height } = Dimensions.get('window');

/**
 * ProfileScreen component: 
 * Displays the user's personal information and authentication for setting parental control passwords.
 * 
 * It also contains a modal box for entering and validating parental control passwords.
 * 
 * @returns {React.Component} Return to Profile Page Components
 */
export default function ProfileScreen() {
    const navigation = useNavigation();
    const [modalVisibleParentalModel, setModalVisibleParentalModel] = useState(false);
    const [password, setPassword] = useState('');
    const [userData, setUserData] = useState(null);
    const [parentControlPassword, setParentControlPassword] = useState(null);
    const styles = getStyles(width, height);

    // Loading user data from AsyncStorage, including parental control passwords
    useEffect(() => {
        const loadUserData = async () => {
            try {
                const userDataString = await AsyncStorage.getItem('userData');
                if (userDataString) {
                    const data = JSON.parse(userDataString);
                    setUserData(data);
                    setParentControlPassword(data.parentControlPassword);
                } else {
                    console.error('No user data found');
                }
            } catch (error) {
                console.error('Error loading user data from AsyncStorage:', error);
            }
        };
        loadUserData();
    }, []);

    /**
    * Displays an avatar based on the user's avatar value.
    *
    * @param {string} avatar - The identifier of the user's avatar, of string type.
    * @returns {number|null} Returns the path to the source file of the corresponding avatar, or null if it doesn't match.
    */
    const getAvatarSource = (avatar) => {
        switch (String(avatar)) {
            case '1':
                return require('../../assets/Interface/Avatars/boy.gif');
            case '2':
                return require('../../assets/Interface/Avatars/boy-2.gif');
            case '3':
                return require('../../assets/Interface/Avatars/girl.gif');
            case '4':
                return require('../../assets/Interface/Avatars/girl-2.gif');
        }
    };

    /**
     * Verify that the password entered matches the stored parental control password.
     *
     * @returns {Promise<void>} Returns a Promise representing the result of password verification.
     */
    const handlePasswordSubmit = async () => {
        if (password.trim() === '') {
            Alert.alert('Error', 'Password cannot be empty.');
            return;
        }

        try {
            // Hash the input password
            const hashedInputPassword = await Crypto.digestStringAsync(
                Crypto.CryptoDigestAlgorithm.SHA256,
                password
            );

            const userId = userData?.id;
            const apiUrl = `http://192.168.31.40:8081/user/validate/parentalPassword?parentalPassword=${hashedInputPassword}&userId=${userId}`;

            // Send a GET request to verify the parental control password
            const response = await fetch(apiUrl, {
                method: 'GET'
            });

            const result = await response.json();

            if (response.ok && result.code === 200) {
                // Get the parental control password from the database and check if it matches.
                const fetchedParentControlPassword = result.data.parentControlPassword;
                if (fetchedParentControlPassword === parentControlPassword) {
                    setModalVisibleParentalModel(false);
                    setPassword('');
                    navigation.navigate('ParentalModel');
                } else {
                    Alert.alert('Error', 'Incorrect password, please try again.');
                    setPassword('');
                }
            } else {
                Alert.alert('Error', result.msg || 'Something went wrong, please try again later.');
                setPassword('');
            }
        } catch (error) {
            Alert.alert('Error', 'Something went wrong, please try again later.');
            setPassword('');
        }
    };

    return (
        <ImageBackground
            source={require('../../assets/Interface/Profile Interface/background.jpg')}
            style={styles.backgroundImage}
        >
            <Header title="Profile" goToScreen="Home" />

            {/* User Section */}
            <View style={styles.userSection}>
                <Image source={getAvatarSource(userData?.avatar)} style={styles.avatar} />
                <Text style={styles.userName}>{userData?.name || 'Unknown User'}</Text>
                <Text style={styles.userLevel}>{`Lv. ${userData?.level || 'Unknown'} ★`}</Text>
            </View>

            {/* Menu Section */}
            <View style={styles.menuSection}>
                <TouchableOpacity style={styles.menuButton} onPress={() => navigation.navigate('Achievements')}>
                    <Text style={styles.menuText}>Achievement</Text>
                </TouchableOpacity>

                <TouchableOpacity style={styles.menuButton} onPress={() => setModalVisibleParentalModel(true)}>
                    <Text style={styles.menuText}>Parental Model</Text>
                </TouchableOpacity>

                <TouchableOpacity style={styles.menuButton} onPress={() => navigation.navigate('CourseModule')}>
                    <Text style={styles.menuText}>Course Module Level</Text>
                </TouchableOpacity>

                <TouchableOpacity style={styles.menuButton} onPress={() => navigation.navigate('ChatBox')}>
                    <Text style={styles.menuText}>Chat Box</Text>
                </TouchableOpacity>
            </View>

            {/* Modal for Parental Model Password Input */}
            <Modal
                animationType="slide"
                transparent={true}
                visible={modalVisibleParentalModel}
                onRequestClose={() => {
                    setModalVisibleParentalModel(false);
                    setPassword('');
                }}
            >
                <View style={styles.modalView}>
                    <View style={styles.modalContent}>
                        <Text style={styles.modalTitle}>Please Enter your password</Text>

                        {/* Password Input */}
                        <TextInput
                            style={styles.input}
                            placeholder="Password"
                            secureTextEntry={true}
                            value={password}
                            onChangeText={setPassword}
                        />

                        {/* Buttons in a row */}
                        <View style={styles.buttonRow}>
                            <TouchableOpacity
                                style={[styles.modalButton, styles.cancelButton]}
                                onPress={() => {
                                    setModalVisibleParentalModel(false);
                                    setPassword('');
                                }}
                            >
                                <Text style={styles.buttonText}>Cancel</Text>
                            </TouchableOpacity>

                            <TouchableOpacity
                                style={[styles.modalButton, styles.confirmButton]}
                                onPress={handlePasswordSubmit}
                            >
                                <Text style={styles.buttonText}>Confirm</Text>
                            </TouchableOpacity>
                        </View>
                    </View>
                </View>
            </Modal>

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
        flex: 1,
        width: '100%',
        height: '100%',
    },
    userSection: {
        justifyContent: 'center',
        alignItems: 'center',
        marginVertical: height * 0.03,
    },
    avatar: {
        width: width * 0.3,
        height: width * 0.3,
        borderRadius: width * 0.15,
        resizeMode: 'cover',
        backgroundColor: "#FFF3DA",
    },
    userName: {
        fontSize: width * 0.09,
        fontWeight: 'bold',
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
        marginTop: height * 0.01,
    },
    userLevel: {
        fontSize: width * 0.05,
        color: '#555',
    },
    menuSection: {
        flex: 1,
        paddingHorizontal: width * 0.05,
    },
    menuButton: {
        backgroundColor: '#FFF3DA',
        paddingVertical: height * 0.02,
        marginVertical: height * 0.01,
        borderRadius: 30,
        justifyContent: 'center',
        alignItems: 'center',
    },
    menuText: {
        fontSize: width * 0.075,
        fontWeight: 'bold',
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
    },
    modalView: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'rgba(0, 0, 0, 0.5)',
    },
    modalContent: {
        backgroundColor: '#FFF3DA',
        padding: width * 0.05,
        borderRadius: 30,
        alignItems: 'center',
        width: width * 0.80,
        height: height * 0.35,
    },
    modalTitle: {
        fontSize: width * 0.07,
        fontWeight: 'bold',
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
        marginTop: height * 0.016,
        marginBottom: height * 0.05,
    },
    input: {
        backgroundColor: '#fff',
        width: '85%',
        height: '22%',
        borderRadius: 30,
        marginBottom: height * 0.065,
        borderColor: '#ccc',
        borderWidth: 2,
        textAlign: 'center',
    },
    buttonRow: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        width: '100%',
    },
    modalButton: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        paddingVertical: height * 0.017,
        marginHorizontal: width * 0.027,
        borderRadius: 30,
        backgroundColor: '#A3D9A5',
    },
    buttonText: {
        color: '#FFF',
        fontWeight: 'bold',
        fontFamily: 'Pilsner_Regular',
        fontSize: width * 0.065,
    },
    loadingContainer: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
    }
});

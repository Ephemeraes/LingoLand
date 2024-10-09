import React from 'react';
import { View, Text, TouchableOpacity, Image, StyleSheet, Dimensions, ImageBackground, Alert, Modal } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import * as ImagePicker from 'expo-image-picker';
import Header from '../components/Header';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { useState } from 'react';


/**
 * PhotoTranslationScreen Component: 
 * handles the selection of photos from the camera or gallery and sends them to the backend for translation.
 *
 * @returns {React.Component} Return to Photo Translation page
 */
export default function PhotoTranslationScreen() {
    const navigation = useNavigation();
    const [modalVisible, setModalVisible] = useState(false);
    const [translatedData, setTranslatedData] = useState(null);
    const { width, height } = Dimensions.get('window');
    const styles = getStyles(width, height);

    /**
     * openCamera function: 
     * request camera permission and open the camera, 
     * capture photos and upload them to the server for translation.
     * 
     * @throws Throws an error and displays an appropriate prompt when the 
     * camera cannot be accessed or when uploading photos fails.
     */
    const openCamera = async () => {
        // Request camera privileges
        const { status } = await ImagePicker.requestCameraPermissionsAsync();
        if (status !== 'granted') {
            Alert.alert('Requires camera privileges', 'We need camera permissions to continue using this feature.');
            return;
        }
        // Launches the camera
        const result = await ImagePicker.launchCameraAsync({
            mediaTypes: ImagePicker.MediaTypeOptions.Images,
            allowsEditing: true,
            base64: true
        });
        // Getting user data
        const userDataString = await AsyncStorage.getItem('userData');
        const userData = JSON.parse(userDataString);
        const userId = userData.id;

        // If the user has not taken a photo, it returns directly
        if (result.canceled) {
            return;
        }
        // Prepare data to be sent to the backend
        const formData = new FormData();
        const fileName = 'image.jpg';
        const type = result.assets[0].mimeType;
        const uri = result.assets[0].uri;
        formData.append('file', {
            uri: uri,
            type: type,
            name: fileName,
        });

        try {
            // Upload images to the backend for translation
            const translation = await fetch('http://192.168.31.40:8081/ocr/uploadImage', {
                method: 'POST',
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
                body: formData
            })
            const data = await translation.json();
            // Recording of translation results
            setTranslatedData(data);

            try {
                let words;
                // If no sensitive terms are included, the translation data is saved
                if (data.sensitive === 'false') {
                    words = {
                        oriWords: data.ori,
                        translatedWords: data.des,
                        userId: userId,
                    };
                    // Saving translation data to the backend
                    if (words) {
                        const saveWords = await fetch('http://192.168.31.40:8081/ocr/insertWords', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify(words),
                        });
                        navigation.navigate('TranslationDetail', words);
                    }
                }
                // Pop-up alert if it contains sensitive words
                if (data.sensitive === 'true') {
                    setModalVisible(true);
                }
            } catch (error) {
                console.error('Cannot store data', error);
                Alert.alert('Store Failed', 'There was an error when storing the image.');
            }
        } catch (error) {
            console.error('Image upload failed:', error);
            Alert.alert('Upload failed', 'There was an error uploading the image.');
        }
    };

    /**
     * openImageLibrary function: 
     * request permission to access the library and open the library, 
     * select images and upload them to the server for translation.
     * 
     * @throws Throws an error and displays appropriate prompts when 
     * the gallery cannot be accessed or when uploading photos fails.
     */
    const openImageLibrary = async () => {
        // Request access to albums
        const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
        if (status !== 'granted') {
            Alert.alert('Requires album permissions', 'We need album permissions to continue using this feature.');
            return;
        }
        // Getting user data
        const userDataString = await AsyncStorage.getItem('userData');
        const userData = JSON.parse(userDataString);
        const userId = userData.id;

        // Launching an album
        const result = await ImagePicker.launchImageLibraryAsync({
            mediaTypes: ImagePicker.MediaTypeOptions.Images,
            allowsEditing: true,
            base64: true
        });

        // If the user has not selected an image, it is returned directly
        if (result.canceled) {
            return;
        }

        // Prepare data to be sent to the backend
        const formData = new FormData();
        const fileName = 'image.jpg';
        const type = result.assets[0].mimeType;
        const uri = result.assets[0].uri;
        formData.append('file', {
            uri: uri,
            type: type,
            name: fileName,
        });

        try {
            // Upload images to the backend for translation
            const translation = await fetch('http://192.168.31.40:8081/ocr/uploadImage', {
                method: 'POST',
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
                body: formData
            })
            const data = await translation.json();
            // Recording of translation results
            setTranslatedData(data);

            try {
                let words;
                // If no sensitive terms are included, the translation data is saved
                if (data.sensitive === 'false') {
                    words = {
                        oriWords: data.ori,
                        translatedWords: data.des,
                        userId: userId,
                    };
                    // Saving translation data to the backend
                    if (words) {
                        const saveWords = await fetch('http://192.168.31.40:8081/insertWords', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify(words),
                        });
                        navigation.navigate('TranslationDetail', words);
                    }
                }
                // Pop-up alert if it contains sensitive words
                if (data.sensitive === 'true') {
                    setModalVisible(true);
                }
            } catch (error) {
                console.error('Cannot store data', error);
                Alert.alert('Store Failed', 'There was an error when storing the image.');
            }
        } catch (error) {
            console.error('Image upload failed:', error);
            Alert.alert('Upload failed', 'There was an error uploading the image.');
        }
    }

    /**
     * handleConfirm function: 
     * when the translation content contains sensitive words, 
     * the translation data will be saved after confirmation by parents.
     * 
     * @param {Object} data Includes translated original and translated content
     * @throws When saving data fails, throws an error and displays an appropriate prompt.
     */
    const handleConfirm = async (data) => {
        // Getting user data
        const userDataString = await AsyncStorage.getItem('userData');
        const userData = JSON.parse(userDataString);
        const userId = userData.id;

        // Preparing data for saving to the backend
        const words = {
            oriWords: data.ori,
            translatedWords: data.des,
            userId: userId,
        };

        if (words) {
            try {
                // Save translation data to the backend
                const saveWords = await fetch('http://192.168.31.40:8081/ocr/insertWords', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(words),
                });
                navigation.navigate('TranslationDetail', words);
            } catch (error) {
                console.error('Error saving words:', error);
            }
        }
    };

    return (
        <ImageBackground
            source={require('../../assets/Interface/Profile Interface/background.jpg')}
            style={styles.backgroundImage}
        >
            {/* Header */}
            <Header title="Photo Translation" goToScreen="Home" />

            {/* Functional areas */}
            <View style={styles.mainSection}>
                {/* Button to switch on the camera */}
                <TouchableOpacity style={styles.button} onPress={openCamera}>
                    <Text style={styles.buttonText}>Camera</Text>
                    <Image source={require('../../assets/Interface/Photo translation interface/camera.gif')} style={styles.icon} />
                </TouchableOpacity>

                {/* Button for uploading images */}
                <TouchableOpacity style={styles.button} onPress={openImageLibrary}>
                    <Text style={styles.buttonText}>Upload Image</Text>
                    <Image source={require('../../assets/Interface/Photo translation interface/upload-icon.gif')} style={styles.icon} />
                </TouchableOpacity>
            </View>

            {/* Sensitive word alert pop-up */}
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
                        <Text style={styles.modalText}>Translated content involves sensitive vocabulary, please watch with your parents</Text>
                        <View style={styles.monsterContainer}>
                            <Image source={require('../../assets/Interface/Sensitive Warning/sensitive-icon.gif')}
                                style={styles.monsterImage} />
                        </View>

                        <View style={styles.buttonRow}>
                            <TouchableOpacity
                                style={[styles.modalButton, styles.cancelButton]}
                                onPress={() => setModalVisible(false)}
                            >
                                <Image
                                    source={require('../../assets/Interface/Sensitive Warning/back.png')}
                                    style={styles.imageButton}
                                />
                            </TouchableOpacity>
                            <TouchableOpacity
                                style={[styles.modalButton, styles.confirmButton]}
                                onPress={() => {
                                    setModalVisible(false);
                                    handleConfirm(translatedData);
                                }}
                            >
                                <Image
                                    source={require('../../assets/Interface/Sensitive Warning/next.gif')}
                                    style={styles.imageButton}
                                />
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
    modalView: {
        width: '80%',
        height: "75%",
        left: '10%',
        top: '30%',
        backgroundColor: "#F4E7D4",
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
    modalText: {
        fontSize: width * 0.09,
        fontFamily: 'Pilsner_Regular',
        fontWeight: 'bold',
        color: '#115700',
    },
    monsterImage: {
        width: width * 0.4,
        marginTop: height * -0.055,
        resizeMode: 'contain',
    },
    buttonRow: {
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between',
        marginTop: height * -0.04,
    },
    imageButton: {
        width: width * 0.3,
        resizeMode: 'contain',
    },
    backgroundImage: {
        flex: 1,
        width: '100%',
        height: '100%',
    },
    mainSection: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
    },
    button: {
        backgroundColor: '#F4E7D4',
        top: height * -0.03,
        width: width * 0.8,
        paddingVertical: height * 0.03,
        marginVertical: 20,
        borderRadius: 20,
        justifyContent: 'center',
        alignItems: 'center',
    },
    icon: {
        width: width * 0.4,
        height: height * 0.15,
        marginBottom: 10,
    },
    buttonText: {
        fontSize: width * 0.1,
        fontFamily: 'Pilsner_Regular',
        fontWeight: 'bold',
        color: '#115700',
    },
});
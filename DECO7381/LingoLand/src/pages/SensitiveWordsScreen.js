import React, {useCallback, useState} from 'react';
import {View, Text, FlatList, TouchableOpacity, StyleSheet, Dimensions, ImageBackground, Modal, TextInput, Alert} from 'react-native';
import {useFocusEffect} from '@react-navigation/native';
import Header from '../components/Header';
import AsyncStorage from "@react-native-async-storage/async-storage";


/**
 * SensitiveWordsScreen Component: displaying and managing the list of sensitive words
 *
 * @returns {React.Component} Return to Sensitive Word Management page
 */
export default function SensitiveWordsScreen() {
    const [words, setWords] = useState([]);
    const [modalVisible, setModalVisible] = useState(false);
    const [confirmDeleteVisible, setConfirmDeleteVisible] = useState(false);
    const [newWord, setNewWord] = useState('');
    const [wordToDelete, setWordToDelete] = useState('');
    const [userId, setUserId] = useState(null);
    const {width, height} = Dimensions.get('window');
    const styles = getStyles(width, height);

    useFocusEffect(
        useCallback(() => {
            const fetchUserDataAndWords = async () => {
                try {
                    // Getting and setting stored user data from AsyncStorage
                    const userDataString = await AsyncStorage.getItem('userData');
                    if (userDataString) {
                        const userData = JSON.parse(userDataString);
                        setUserId(userData.id);

                        // Call the API to get user achievement data if userId is set
                        const response = await fetch(`http://10.71.95.219:8083/api/badwords/list?userId=${userData.id}`, {
                            method: 'GET',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                        });

                        if (response.ok) {
                            const data = await response.json();
                            // Extract words from the response data
                            const fetchedWords = data.badWords.map(badWord => badWord.word);
                            setWords(fetchedWords); // Save words in the state
                        } else {
                            console.error('Failed to fetch bad words', response.status);
                            Alert.alert('Error', 'Failed to fetch data');
                        }
                    } else {
                        Alert.alert('Error', 'No user data found');
                    }
                } catch (error) {
                    console.error('Failed to load user data or bad words data', error);
                    Alert.alert('Error', 'Something went wrong');
                }
            };

            fetchUserDataAndWords();

            // Optional cleanup function if needed
            return () => {
                // Clean up any state or subscriptions here if needed
            };
        }, []) // Empty dependency array to ensure this only runs when the screen is focused
    );

    /**
     * Functions to add sensitive words
     *
     * When the user enters a new word and clicks Add, the word is
     * added to the current list of sensitive words
     */
    const addWord = async () => {
        if (newWord.trim()) {
            const trimmedWord = newWord.trim();
            try {
                // Assume `userId` is available in your component's state
                const response = await fetch(`http://10.71.95.219:8083/api/badwords/add?words=${encodeURIComponent(trimmedWord)}&userId=${userId}`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    }
                });

                // Handle the response from the server
                if (response.ok) {
                    const data = await response.json();
                    // console.log('Server response:', data.message);
                    // Update the local words state with the new word
                    setWords([...words, trimmedWord]);
                    setNewWord('');
                    setModalVisible(false);
                } else {
                    console.error('Failed to add word', response.status);
                    console.error('Failed to add word', response);
                    Alert.alert('Error', 'Failed to add the word');
                }
            } catch (error) {
                console.error('Error adding word:', error);
                Alert.alert('Error', 'Something went wrong while adding the word');
            }
        }
    };


    /**
     * Confirmation function for removing sensitive words
     *
     * Remove a term from the list after confirming its deletion
     */
    const confirmDeleteWord = async () => {
        try {
            const response = await fetch(`http://10.71.95.219:8083/api/badwords/delete?words=${encodeURIComponent(wordToDelete)}&userId=${userId}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            if (response.ok) {
                const data = await response.json();
                if (data.code === "1") {
                    // 更新本地状态，移除已删除的单词
                    setWords(words.filter(w => w !== wordToDelete));
                    setConfirmDeleteVisible(false);
                } else {
                    console.log('Server response:', data.message);
                    Alert.alert('Error', data.message);
                }
            } else {
                console.error('Failed to delete word', response.status);
                Alert.alert('Error', 'Failed to delete the word');
            }
        } catch (error) {
            console.error('Error deleting word:', error);
            Alert.alert('Error', 'Something went wrong while deleting the word');
        }
    };


    /**
     * Functions to display the deletion confirmation popup
     *
     * When the delete button is clicked, a confirmation pop-up window is displayed.
     *
     * @param {string} word Sensitive words to be deleted
     */
    const showDeleteConfirmation = (word) => {
        setWordToDelete(word); //
        setConfirmDeleteVisible(true);
    };

    const closeModal = () => {
        setModalVisible(false)
        setNewWord('')
    }

    return (
        <ImageBackground
            source={require('../../assets/Interface/Profile Interface/background.jpg')}
            style={styles.backgroundImage}
        >
            <Header title="Sensitive words" goToScreen="ParentalModel"/>

            {/* Sensitive words list */}
            <View style={styles.listContainer}>
                <FlatList
                    data={words}
                    renderItem={({item}) => (
                        <View style={styles.wordItem}>
                            <Text style={styles.wordText}>• {item}</Text>
                            {/* Delete button for each word */}
                            <TouchableOpacity onPress={() => showDeleteConfirmation(item)}>
                                <Text style={styles.deleteIcon}>✖</Text>
                            </TouchableOpacity>
                        </View>
                    )}
                    keyExtractor={(item, index) => index.toString()}
                />
                {/* Buttons on the bottom */}
                <View style={styles.buttonsContainer}>
                    <TouchableOpacity style={styles.button} onPress={() => setModalVisible(true)}>
                        <Text style={styles.buttonText}>Add</Text>
                    </TouchableOpacity>
                </View>
            </View>

            {/* Add new word modal */}
            <Modal
                animationType="slide"
                transparent={true}
                visible={modalVisible}
                onRequestClose={() => setModalVisible(false)}
            >
                <View style={styles.modalView}>
                    <View style={styles.modalContent}>
                        <Text style={styles.modalTitle}>Enter a new sensitive word</Text>
                        <TextInput
                            style={styles.input}
                            placeholder="New word"
                            value={newWord}
                            onChangeText={setNewWord}
                        />
                        <View style={styles.modalButtons}>
                            <TouchableOpacity style={styles.modalButton} onPress={closeModal}>
                                <Text style={styles.modalButtonText}>Cancel</Text>
                            </TouchableOpacity>
                            <TouchableOpacity style={styles.modalButton} onPress={addWord}>
                                <Text style={styles.modalButtonText}>Add</Text>
                            </TouchableOpacity>
                        </View>
                    </View>
                </View>
            </Modal>

            {/* Confirm deletion of modal */}
            <Modal
                animationType="slide"
                transparent={true}
                visible={confirmDeleteVisible}
                onRequestClose={() => setConfirmDeleteVisible(false)}
            >
                <View style={styles.modalView}>
                    <View style={styles.modalContent}>
                        <Text style={styles.modalTitle}>Are you sure you want to delete "{wordToDelete}"?</Text>
                        <View style={styles.modalButtons}>
                            <TouchableOpacity style={styles.modalButton} onPress={() => setConfirmDeleteVisible(false)}>
                                <Text style={styles.modalButtonText}>Cancel</Text>
                            </TouchableOpacity>
                            <TouchableOpacity style={styles.modalButton} onPress={confirmDeleteWord}>
                                <Text style={styles.modalButtonText}>Delete</Text>
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
        width: '100%',
        height: '100%',
        resizeMode: 'cover',
    },
    listContainer: {
        flex: 1,
        height: height * 0.6,
        paddingHorizontal: width * 0.05,
        marginVertical: height * 0.03,
        backgroundColor: '#FFF3DA',
        borderRadius: width * 0.05,
    },
    wordItem: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        paddingVertical: height * 0.015,
        borderBottomWidth: 1,
        borderBottomColor: '#ccc',
    },
    wordText: {
        fontSize: width * 0.09,
        fontFamily: 'Pilsner_Regular',
        color: '#115700',
    },
    deleteIcon: {
        fontSize: width * 0.08,
        fontFamily: 'Pilsner_Regular',
        color: '#ff0000',
        marginLeft: width * 0.02,
    },
    buttonsContainer: {
        flexDirection: 'row',
        justifyContent: 'center',
        marginBottom: height * 0.03,
    },
    button: {
        backgroundColor: '#A3D9A5',
        paddingVertical: height * 0.02,
        paddingHorizontal: width * 0.08,
        borderRadius: width * 0.04,
    },
    buttonText: {
        fontSize: width * 0.085,
        fontFamily: 'Pilsner_Regular',
        fontWeight: 'bold',
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
        padding: height * 0.03,
        borderRadius: width * 0.04,
        alignItems: 'center',
        width: width * 0.8,
    },
    modalTitle: {
        fontSize: width * 0.1,
        fontFamily: 'Pilsner_Regular',
        fontWeight: 'bold',
        marginBottom: height * 0.02,
        color: '#115700',
        textAlign: 'center',
    },
    input: {
        width: '100%',
        padding: height * 0.015,
        borderColor: '#ccc',
        borderWidth: 1,
        borderRadius: width * 0.03,
        marginBottom: height * 0.03,
        textAlign: 'center',
    },
    modalButtons: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        width: '100%',
    },
    modalButton: {
        backgroundColor: '#A3D9A5',
        paddingVertical: height * 0.015,
        paddingHorizontal: width * 0.06,
        borderRadius: width * 0.03,
        marginHorizontal: width * 0.02,
    },
    modalButtonText: {
        fontSize: width * 0.08,
        fontFamily: 'Pilsner_Regular',
        fontWeight: 'bold',
        color: '#115700',
    },
});
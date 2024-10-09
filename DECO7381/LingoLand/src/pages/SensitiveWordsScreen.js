import React, { useState } from 'react';
import { View, Text, FlatList, TouchableOpacity, StyleSheet, Dimensions, ImageBackground, Modal, TextInput } from 'react-native';
import Header from '../components/Header';



/**
 * SensitiveWordsScreen Component: displaying and managing the list of sensitive words
 * 
 * @returns {React.Component} Return to Sensitive Word Management page
 */
export default function SensitiveWordsScreen() {
  const [words, setWords] = useState(['Fuck', 'Shit', 'Bomb', 'Kill', 'Hate']);
  const [modalVisible, setModalVisible] = useState(false);
  const [confirmDeleteVisible, setConfirmDeleteVisible] = useState(false);
  const [newWord, setNewWord] = useState('');
  const [wordToDelete, setWordToDelete] = useState('');
  const { width, height } = Dimensions.get('window');
  const styles = getStyles(width, height);

  /**
   * Functions to add sensitive words
   * 
   * When the user enters a new word and clicks Add, the word is 
   * added to the current list of sensitive words
   */
  const addWord = () => {
    if (newWord.trim()) {
      setWords([...words, newWord.trim()]);
      setNewWord('');
      setModalVisible(false);
    }
  };

  /**
   * Confirmation function for removing sensitive words
   * 
   * Remove a term from the list after confirming its deletion
   */
  const confirmDeleteWord = () => {
    setWords(words.filter(w => w !== wordToDelete));
    setConfirmDeleteVisible(false);
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

  return (
    <ImageBackground
      source={require('../../assets/Interface/Profile Interface/background.jpg')}
      style={styles.backgroundImage}
    >
      <Header title="Sensitive words" goToScreen="ParentalModel" />

      {/* Sensitive words list */}
      <View style={styles.listContainer}>
        <FlatList
          data={words}
          renderItem={({ item }) => (
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
              <TouchableOpacity style={styles.modalButton} onPress={addWord}>
                <Text style={styles.modalButtonText}>Add</Text>
              </TouchableOpacity>
              <TouchableOpacity style={styles.modalButton} onPress={() => setModalVisible(false)}>
                <Text style={styles.modalButtonText}>Cancel</Text>
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
              <TouchableOpacity style={styles.modalButton} onPress={confirmDeleteWord}>
                <Text style={styles.modalButtonText}>Delete</Text>
              </TouchableOpacity>
              <TouchableOpacity style={styles.modalButton} onPress={() => setConfirmDeleteVisible(false)}>
                <Text style={styles.modalButtonText}>Cancel</Text>
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
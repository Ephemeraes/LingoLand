import React, { useState, useEffect } from 'react';
import { View, Text, TouchableOpacity, StyleSheet, Dimensions, ImageBackground, Image, TextInput, FlatList, Alert, ActivityIndicator } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Header from '../components/Header';


/**
 * NoteBookScreen Component: Used to display the user's list of words and sentences.
 * Users can switch between words and sentences with search filters and choose to view details.
 * 
 * @returns {React.Component} Return to Notebook Page
 */
export default function NoteBookScreen() {
  const [searchText, setSearchText] = useState('');
  const [showSentences, setShowSentences] = useState(false);
  const [sentences, setSentences] = useState([]);
  const [words, setWords] = useState([]);
  const [userId, setUserId] = useState(null);
  const [loading, setLoading] = useState(true);
  const { width, height } = Dimensions.get('window');
  const styles = getStyles(width, height);
  const navigation = useNavigation();

  /**
   * fetchUserId Function: 
   * Get the user ID from AsyncStorage and call the API to load the word and sentence data.
   * 
   * @throws Throws an error and displays an error message when user data loading fails.
   */
  const fetchUserId = async () => {
    try {
      const storedUser = await AsyncStorage.getItem('userData');
      if (storedUser) {
        const parsedUser = JSON.parse(storedUser);
        setUserId(Number(parsedUser.id));
        console.log(userId);
        fetchWords(Number(parsedUser.id));
        fetchSentences(Number(parsedUser.id));
      }
    } catch (error) {
      console.error('Error fetching user data:', error);
    }
  };

  /**
   * useEffect hook: 
   * Get user ID on first load and reload data when page gets focus.
   */
  useEffect(() => {
    fetchUserId();
    const unsubscribe = navigation.addListener('focus', () => {
      fetchUserId();
    });

    return unsubscribe;
  }, [navigation]);

  /**
   * fetchWords function: fetch a list of words from the API based on the user ID.
   * 
   * @param {number} userId Unique identifier for the user
   * @throws Throws an error and displays an alert when word data loading fails.
   */
  const fetchWords = async (userId) => {
    setLoading(true);
    try {
      const response = await fetch(`http://192.168.31.40:8081/user/vocabularyBook/list/${userId}`);
      const data = await response.json();

      if (response.ok && data && data.data && data.data.length > 0) {
        setWords(data.data);
      } else {
        Alert.alert('Info', 'No vocabulary found in the book.');
        setWords([]);
      }
    } catch (error) {
      Alert.alert('Error', 'Failed to load vocabulary');
    } finally {
      setLoading(false);
    }
  };

  /**
   * fetchSentences function: fetch the list of sentences from the API based on the user ID.
   * 
   * @param {number} userId Unique identifier for the user
   * @throws Throws an error and displays an alert when sentence data loading fails.
   */
  const fetchSentences = async (userId) => {
    setLoading(true);
    try {
      const response = await fetch(`http://192.168.31.40:8081/ocr/getAllResult?userId=${userId}`);
      const data = await response.json();
      if (data) {
        console.log('sentences log has items:', data);
        setSentences(data);
      } else {
        Alert.alert('Info', 'No sentences found in the book.');
        setSentences([]);
      }
    } catch (error) {
      console.error('Error fetching sentences:', error);
      Alert.alert('Error', 'Failed to load sentences');
    } finally {
      setLoading(false);
    }
  };

  /**
   * Filter search text to return matching words or sentences
   */
  const filteredWords = words.filter(word =>
    word.word && word.word.toLowerCase().includes(searchText.toLowerCase())  // Filter matching words
  );
  const filteredSentences = sentences.filter(sentence =>
    sentence.oriWords.toLowerCase().includes(searchText.toLowerCase())  // Filter matching sentences
  );

  /**
   * handlePrint function: handle printing operations.
   * 
   * @returns {void} Printing the operation log
   */
  const handlePrint = () => {
    console.log('Generating PDF...');
  };

  /**
   * toggleDisplayMode function: toggle display mode (word/sentence).
   * 
   * @returns {void} Toggles the content displayed by the component
   */
  const toggleDisplayMode = () => {
    setShowSentences(!showSentences);
  };

  return (
    <ImageBackground
      source={require('../../assets/Interface/Note Book/background.jpg')}
      style={styles.backgroundImage}
    >
      {/* Header */}
      <Header title="Notebook" goToScreen="Home" />
      {loading ? (
        <View style={styles.loadingContainer}>
          <ActivityIndicator size="large" color="#0000ff" />
          <Text>Loading...</Text>
        </View>
      ) : (
        <>
          <View style={styles.searchContainer}>
            <TextInput
              style={styles.searchInput}
              placeholder="Search..."
              value={searchText}
              onChangeText={setSearchText}
            />
            {/* Print button */}
            <TouchableOpacity onPress={handlePrint}>
              <Image
                source={require('../../assets/Interface/Note Book/print-icon.gif')}
                style={styles.printIcon}
              />
            </TouchableOpacity>
          </View>

          {/* Word list */}
          <View style={styles.listWrapper}>
            <FlatList
              // Sentence or word display depending on switching state
              data={showSentences ? filteredSentences : filteredWords}
              renderItem={({ item }) => (
                <TouchableOpacity
                  style={styles.wordItem}
                  onPress={() => {
                    if (showSentences) {
                      navigation.navigate('NotebookSentenceDetail', { sentence: item, fromScreen: 'NoteBook' });
                    } else {
                      navigation.navigate('WordDetail', { word: item, fromScreen: 'NoteBook' });
                    }
                  }}
                >
                  {/* Show original sentence or word */}
                  <Text style={styles.wordText}>
                    {showSentences ? item.oriWords : item.word}
                  </Text>
                  {console.log('trans:', item.translatedWords)}
                  {/* Show translation */}
                  <Text style={styles.chineseText}>{showSentences ? item.translatedWords : item.trans}</Text>
                </TouchableOpacity>
              )}
              keyExtractor={(item, index) => index.toString()}
              style={styles.listContainer}
            />
          </View>

          {/* Toggle button */}
          <View style={styles.toggleContainer}>
            <TouchableOpacity style={styles.toggleButton} onPress={toggleDisplayMode}>
              {/* Toggle display text */}
              <Text style={styles.toggleButtonText}>
                {showSentences ? 'Words' : 'Sentences'}
              </Text>
            </TouchableOpacity>
          </View>
        </>
      )}
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
  searchContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: height * -0.01,
  },
  searchInput: {
    width: width * 0.75,
    height: height * 0.06,
    backgroundColor: '#FFF',
    borderRadius: height * 0.03,
    paddingLeft: width * 0.04,
    marginTop: height * 0.02,
    marginLeft: width * 0.1,
    borderColor: '#ccc',
    borderWidth: 1,
  },
  printIcon: {
    width: width * 0.26,
    height: width * 0.26,
    top: height * 0.01,
    right: width * 0.01
  },
  listWrapper: {
    height: height * 0.38,
    justifyContent: 'center',
    top: height * -0.02
  },
  listContainer: {
    paddingHorizontal: width * 0.05,
    marginVertical: height * 0.02,
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
    fontSize: width * 0.08,
    fontFamily: 'Pilsner_Regular',
    color: '#115700',
  },
  chineseText: {
    fontSize: width * 0.042,
    fontFamily: 'Pilsner_Regular',
    color: '#115700',
    textAlign: 'right',
  },
  toggleContainer: {
    position: 'absolute',
    bottom: height * 0.26,
    right: width * 0.05,
    alignItems: 'center',
  },
  toggleButton: {
    backgroundColor: '#B0E0E6',
    paddingVertical: height * 0.015,
    paddingHorizontal: width * 0.04,
    borderRadius: 10,
  },
  toggleButtonText: {
    fontSize: width * 0.065,
    fontFamily: 'Pilsner_Regular',
    color: '#fff',
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

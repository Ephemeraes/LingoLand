import React, { useState, useEffect } from 'react';
import { View, Text, FlatList, TouchableOpacity, StyleSheet, Dimensions, TextInput, ImageBackground, Alert, ActivityIndicator } from 'react-native';
import Header from '../components/Header';
import { useNavigation } from '@react-navigation/native';

const { width, height } = Dimensions.get('window');

/**
 * DictionaryScreen component: 
 * Used to display the user's dictionary, including a search function 
 * and a list of words to click on to view details.
 * 
 * @returns {React.Component} Return to the Dictionary screen
 */
export default function DictionaryScreen() {
  const [searchText, setSearchText] = useState('');
  const [words, setWords] = useState(null);
  const [loading, setLoading] = useState(true);
  const navigation = useNavigation();
  const styles = getStyles(width, height);

  /**
   * useEffect hook: get vocabulary data from server on load.
   */
  useEffect(() => {
    const fetchVocabularyData = async () => {
      try {
        const response = await fetch('http://192.168.31.40:8081/word/dictionary/');
        const result = await response.json();
        if (response.ok && result.code === 200) {
          setWords(result.data);
        } else {
          Alert.alert('Error', `Failed to load vocabulary data: ${result.message}`);
        }
      } catch (error) {
        console.error('Error fetching vocabulary data:', error);
        Alert.alert('Error', 'Unable to load vocabulary data');
      } finally {
        setLoading(false);
      }
    };

    fetchVocabularyData();
  }, []);

  /**
   * Filter term list: Filter the term list based on the search terms entered by the user.
   * 
   * @returns {Array} Returns a list of terms that match the search criteria.
   */
  const filteredWords = words ? words.filter(word =>
    word.word.toLowerCase().includes(searchText.toLowerCase()) || // Match by word
    word.trans.toLowerCase().includes(searchText.toLowerCase())   // Match by translation
  ) : [];

  /**
   * If vocabulary data is being loaded, the loading indicator is displayed.
   */
  if (loading) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator size="large" color="#0000ff" />
      </View>
    );
  }

  return (
    <ImageBackground
      source={require('../../assets/Interface/Profile Interface/background.jpg')}
      style={styles.backgroundImage}
    >
      {/* Header */}
      <Header title="Dictionary book" goToScreen="Home" />

      {/* Search box */}
      <View style={styles.searchContainer}>
        <TextInput
          style={styles.searchInput}
          placeholder="Search..."
          value={searchText}
          onChangeText={setSearchText}
        />
      </View>

      {/* Docabulary list */}
      <View style={styles.listContainer}>
        {filteredWords.length > 0 ? (
          <FlatList
            data={filteredWords}
            renderItem={({ item }) => (
              <TouchableOpacity
                style={styles.wordItem}
                onPress={() => {
                  navigation.navigate('WordDetail', { word: item, fromScreen: 'Dictionary' });
                }}
              >
                <Text style={styles.wordText}>• {item.word}</Text>
                <Text style={styles.chineseText}>{item.trans}</Text>
              </TouchableOpacity>
            )}
            keyExtractor={(item, index) => index.toString()}
          />
        ) : (
          <Text style={styles.noResultsText}>Sorry, the word is not found in the dictionary.</Text>
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
  backgroundImage: {
    width: '100%',
    height: '100%',
    resizeMode: 'cover',
  },
  searchContainer: {
    alignItems: 'center',
    justifyContent: 'center',
  },
  searchInput: {
    width: '90%',
    height: height * 0.05,
    backgroundColor: '#FFF',
    borderRadius: height * 0.03,
    paddingLeft: width * 0.05,
    marginTop: height * 0.02,
    borderColor: '#ccc',
    borderWidth: 1,
  },
  listContainer: {
    flex: 1,
    paddingHorizontal: width * 0.05,
    marginVertical: height * 0.01,
    maxHeight: height * 0.44,
  },
  wordItem: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingVertical: height * 0.011,
    borderBottomWidth: 1,
    borderBottomColor: '#ccc',
  },
  wordText: {
    fontSize: width * 0.075,
    fontFamily: 'Pilsner_Regular',
    color: '#115700',
  },
  chineseText: {
    fontSize: width * 0.047,
    fontFamily: 'Pilsner_Regular',
    color: '#115700',
    textAlign: 'right',
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  noResultsText: {
    fontSize: width * 0.1,
    fontFamily: 'Pilsner_Regular',
    color: '#115700',
    textAlign: 'center',
    marginTop: height * 0.05,
  },
});

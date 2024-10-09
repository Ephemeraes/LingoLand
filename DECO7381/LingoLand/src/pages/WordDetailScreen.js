import React, { useState, useEffect } from 'react';
import { View, Text, StyleSheet, Dimensions, ImageBackground, Alert, ActivityIndicator, ScrollView } from 'react-native';
import Header from '../components/Header';

/**
 * WordDetailScreen Component: Used to display detailed information
 * 
 * @param {Object} route - Routing parameters: word data and source page.
 * @returns {React.Component} Returns the word details page
 */
export default function WordDetailScreen({ route }) {
  const { word, fromScreen } = route.params;
  const [loading, setLoading] = useState(true);
  const { width, height } = Dimensions.get('window');
  const styles = getStyles(width, height);
  const wordFontSize = word.word.length > 11 ? width * 0.14 : width * 0.2;

  // Decide which page to return
  const goToScreen = fromScreen === 'Dictionary' ? 'Dictionary' : 'NoteBook';

  /**
   * useEffect hook: 
   * check if the incoming word data exists when the component is mounted and set the loading state.
   */
  useEffect(() => {
    if (word) {
      console.log("Word data received in detail page:", word);
      setLoading(false);
    } else {
      console.error("Word data is missing in the detail page.");
      Alert.alert('Error', 'No word data available.');
      setLoading(false);
    }
  }, [word]);

  /**
   * If the word data is loading, the loading animation is displayed.
   */
  if (loading) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator size="large" color="#0000ff" />
      </View>
    );
  }

  /**
   * If there is no word data, display a prompt
   */
  if (!word) {
    return (
      <View style={styles.loadingContainer}>
        <Text>No word details available</Text>
      </View>
    );
  }

  return (
    <ImageBackground
      source={require('../../assets/Interface/Profile Interface/background.jpg')}
      style={styles.backgroundImage}
    >
      {/* Header */}
      <Header title="Word Detail" goToScreen={goToScreen} />

      <View style={styles.headerContainer}>
        {/*Dynamically adjusts font size based on word length */}
        <Text style={[styles.wordTitle, { fontSize: wordFontSize }]}>{word.word}</Text>
      </View>
      <View style={styles.detailContainer}>
        <ScrollView>
          {/* Chinese translation */}
          <Text style={styles.chineseText}>{word.trans}</Text>

          {/* US Phone */}
          {word.usphone ? (
            <>
              <Text style={styles.sectionTitle}>Pronunciation (US)</Text>
              <Text style={styles.definitionText}>{word.usphone}</Text>
            </>
          ) : null}

          {/* Part of Speech */}
          {word.po ? (
            <>
              <Text style={styles.sectionTitle}>Part of Speech</Text>
              <Text style={styles.definitionText}>{word.po}</Text>
            </>
          ) : null}

          {/* Definition */}
          {word.tranOther ? (
            <>
              <Text style={styles.sectionTitle}>Definition</Text>
              <Text style={styles.definitionText}>{word.tranOther}</Text>
            </>
          ) : null}

          {/* Example Sentence */}
          {word.scontent ? (
            <>
              <Text style={styles.sectionTitle}>Example Sentence</Text>
              <Text style={styles.definitionText}>
                {word.scontent}
                {'\n'}
                {word.scn}
              </Text>
            </>
          ) : null}
        </ScrollView>
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
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  backgroundImage: {
    width: '100%',
    height: '100%',
    resizeMode: 'cover',
  },
  headerContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: width * 0.05,
    paddingTop: height * 0.015,
  },
  wordTitle: {
    fontFamily: 'Pilsner_Regular',
    color: '#115700',
  },
  detailContainer: {
    backgroundColor: '#FFF',
    borderRadius: width * 0.03,
    padding: width * 0.05,
    margin: width * 0.05,
    marginTop: height * 0.02,
    height: height * 0.6,
  },
  chineseText: {
    fontSize: width * 0.08,
    fontFamily: 'Pilsner_Regular',
    fontWeight: 'bold',
    color: '#115700',
    textAlign: 'left',
    marginBottom: height * 0.02,
  },
  sectionTitle: {
    fontSize: width * 0.07,
    fontFamily: 'Pilsner_Regular',
    fontWeight: 'bold',
    marginBottom: height * 0.01,
    color: '#115700',
  },
  definitionText: {
    fontSize: width * 0.06,
    fontFamily: 'Pilsner_Regular',
    marginBottom: height * 0.02,
  },
});

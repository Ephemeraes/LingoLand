import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet, ImageBackground, Image, Dimensions } from 'react-native';

// Get the width and height of the screen
const { width, height } = Dimensions.get('window');

/**
 * StartScreen : 
 * the welcome page of the application, showing the application 
 * title and a button for navigating to the login page.
 * 
 * @param {object} props -Parameters of the component: navigation object, used for page jumping
 * @returns {React.Component} Returns a welcome page with a background image, header and buttons
 */
export default function StartScreen({ navigation }) {
  const styles = getStyles(width, height);

  return (
    // Background image
    <ImageBackground
      source={require('../../assets/Interface/Welcome page/background.jpg')}
      style={styles.background}
      resizeMode="cover"
    >
      <View style={styles.container}>
        {/* Header */}
        <Text style={styles.title}>LingoLand</Text>

        {/* Buttons to navigate to the login page */}
        <TouchableOpacity
          style={styles.startButton}
          onPress={() => navigation.navigate('Login')}
        >
          {/* Button Picture */}
          <Image
            source={require('../../assets/Interface/Welcome page/start-button.gif')}
            style={styles.buttonImage}
          />
        </TouchableOpacity>
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
  background: {
    flex: 1,
    width: '100%',
    height: '100%',
    position: 'absolute',
    top: 0,
    left: 0,
  },
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  title: {
    fontSize: width * 0.15,
    fontWeight: 'bold',
    marginBottom: height * 0.01,
    fontFamily: 'Pilsner_Regular',
    color: '#000000',
  },
  buttonImage: {
    width: width * 1.5,
    height: height * 0.3,
    resizeMode: 'contain',
  },
});


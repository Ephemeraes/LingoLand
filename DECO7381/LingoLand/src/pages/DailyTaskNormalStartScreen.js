import React from 'react';
import { View, StyleSheet, ImageBackground, Image, Dimensions, TouchableOpacity } from 'react-native';
import Header from '../components/Header';
import { useNavigation } from '@react-navigation/native';

/**
 * DailyTaskNormalStartScreen component: displays the start screen of the daily task.
 * Users can click the ‘Start’ button to access the island selection page for daily tasks.
 * 
 * @returns {React.Component} Returns to the Daily Tasks start screen.
 */
export default function DailyTaskNormalStartScreen() {
  const navigation = useNavigation();
  const { width, height } = Dimensions.get('window');
  const styles = getStyles(width, height);

  return (
    <View style={styles.container}>
      {/* Header */}
      <View style={styles.headerContainer}>
        <Header title="Daily Task" goToScreen="Home" />
      </View>

      {/* Background */}
      <View style={styles.backgroundContainer}>
        <ImageBackground
          source={require('../../assets/Interface/Daily Task/normaltask.jpg')}
          style={styles.backgroundImage}
        >
          {/* Start button */}
          <TouchableOpacity style={styles.centeredImageContainer} onPress={() => navigation.navigate('DailyTaskIsland')}>
            <Image
              source={require('../../assets/Interface/Daily Task/start.png')}
              style={styles.centeredImage}
            />
          </TouchableOpacity>
        </ImageBackground>
      </View>
    </View>
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
  container: {
    flex: 1,
  },
  headerContainer: {
    backgroundColor: '#fff',
  },
  backgroundContainer: {
    flex: 1,
  },
  backgroundImage: {
    width: '100%',
    height: '100%',
    resizeMode: 'cover',
  },
  centeredImageContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    marginTop: height * 0.12,
  },
  centeredImage: {
    width: width * 0.5,
    height: height * 0.3,
    resizeMode: 'contain',
  },
});

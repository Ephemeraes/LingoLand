import React, { useState } from 'react';
import {
  View, Text, TextInput, TouchableOpacity, ImageBackground, Image, Alert, ScrollView, StyleSheet, useWindowDimensions
} from 'react-native';
import { useNavigation } from '@react-navigation/native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import * as Crypto from 'expo-crypto';

/**
 * LoginScreen component: used for user login.
 * Includes user name and password entry boxes and login and registration functions.
 * 
 * @returns {React.Component} Return to Login Page Components
 */
export default function LoginScreen() {
  const { width, height } = useWindowDimensions();
  const navigation = useNavigation();
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const styles = getStyles(width, height);

  /**
    * Handles login operations: sends username and password to the backend for authentication
    */
  const handleLogin = async () => {
    // SHA256 hashing of passwords
    const hashedPassword = await Crypto.digestStringAsync(
      Crypto.CryptoDigestAlgorithm.SHA256,
      password
    );
    // Send the username and hashed password to the server
    fetch('http://192.168.31.40:8081/user/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        name: username,
        password: hashedPassword,
      }),
    })
      .then((response) => response.json())
      .then(async (data) => {
        if (data.code === 200) {
          try {
            // Process the server response, on success store the user data to AsyncStorage and jump to the homepage
            await AsyncStorage.setItem('userData', JSON.stringify(data.data));
            navigation.navigate('HomeTabs');
          } catch (error) {
            console.error('Failed to save user data', error);
            Alert.alert('Error', 'Unable to save user data');
          }
        } else {
          Alert.alert('Login Failed', data.message || 'An error occurred');
        }
      })
      .catch((error) => {
        Alert.alert('Login Error', 'Unable to connect to the server');
      });
  };

  return (
    <ImageBackground
      source={require('../../assets/Interface/Welcome page/background.jpg')}
      style={styles.background}
      resizeMode="cover"
    >
      <ScrollView contentContainerStyle={styles.scrollContainer}>
        <View style={styles.container}>
          {/* User name label and input box */}
          <Text style={styles.label}>Username</Text>
          <TextInput
            style={styles.input}
            placeholder="Username"
            value={username}
            onChangeText={setUsername}
            placeholderTextColor="#888"
          />

          {/* Password label and input box */}
          <Text style={styles.label}>Password</Text>
          <TextInput
            style={styles.input}
            placeholder="Password"
            value={password}
            onChangeText={setPassword}
            secureTextEntry
            placeholderTextColor="#888"
          />

          {/* Registration tips and button */}
          <View style={styles.textContainer}>
            <Text style={styles.infoText}>Not have an account?</Text>
            <TouchableOpacity onPress={() => navigation.navigate('RegisterScreen')}>
              <Text style={styles.infoText}>Let's Register!</Text>
            </TouchableOpacity>
          </View>

          {/* Log in button */}
          <TouchableOpacity style={styles.loginButton} onPress={handleLogin}>
            <Image
              source={require('../../assets/Interface/Login/button.png')}
              style={styles.buttonImage}
            />
          </TouchableOpacity>
        </View>
      </ScrollView>
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
  },
  scrollContainer: {
    flexGrow: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  container: {
    width: '100%',
    alignItems: 'center',
    paddingHorizontal: width * 0.02,

  },
  label: {
    alignSelf: 'flex-start',
    marginLeft: width * 0.1,
    marginBottom: height * 0.03,
    color: '#000',
    fontSize: width * 0.075,
    fontWeight: 'bold',
    fontFamily: 'Pilsner_Regular',
  },
  input: {
    height: height * 0.07,
    paddingHorizontal: width * 0.04,
    borderRadius: width * 0.03,
    width: width * 0.8,
    backgroundColor: '#FFF',
    marginBottom: height * 0.008,
    borderWidth: 1,
    borderColor: '#ccc',
  },
  textContainer: {
    width: width * 0.75,
    alignItems: 'flex-start',
    marginBottom: height * 0.1,
  },
  infoText: {
    color: '#888',
    textAlign: 'left',
    marginTop: height * 0.01,
    fontSize: width * 0.04,
  },
  loginButton: {
    marginTop: height * -0.09,
    alignItems: 'center',
    width: width * 0.8,
  },
  buttonImage: {
    width: width * 0.75,
    height: height * 0.075,
    borderRadius: width * 0.125,
    overflow: 'hidden',
  }
});

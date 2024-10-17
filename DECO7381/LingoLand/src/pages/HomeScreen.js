import React, { useEffect, useState } from 'react';
import { View, Image, TouchableOpacity, StyleSheet, ImageBackground, Dimensions, Alert, ActivityIndicator } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import AsyncStorage from '@react-native-async-storage/async-storage';

const { width, height } = Dimensions.get('window');

/**
 * HomeScreen component: the home screen of the application.
 * Includes multiple entrances to functional modules such as Photo Translation, 
 * Dictionary, Daily Tasks and more.
 * 
 * @returns {React.Component} Return to Home Page Components
 */
export default function HomeScreen() {
    const navigation = useNavigation();
    const [user, setUser] = useState(null);
    const [isLoading, setIsLoading] = useState(true);

    /**
     * Getting stored user data from AsyncStorage
     * Use useEffect to be called automatically when the component is loaded, 
     * ensuring that user data is loaded before the interface is rendered.
     * 
     * @throws A warning is thrown when data loading fails and an error popup box is displayed.
     */
    useEffect(() => {
        const loadUserData = async () => {
            try {
                // Reading user data from AsyncStorage
                const userDataString = await AsyncStorage.getItem('userData');
                if (userDataString) {
                    // Parses the string into JSON and stores it in the state
                    const userData = JSON.parse(userDataString);
                    setUser(userData);
                } else {
                    Alert.alert('Error', 'No user data found');
                }
            } catch (error) {
                Alert.alert('Error', 'Unable to load user data');
            } finally {
                // Data loading is complete, set loading status to false
                setIsLoading(false);
            }
        };

        // Calling the Load User Data function
        loadUserData();
    }, []);

    /**
     * Handling of daily task button click events
     */
    const handleDailyTaskPress = async () => {
        if (!user) {
            console.error('User data not found');
            return;
        }

        try {
            // Get Word of the Day data from the server
            const wordsResponse = await fetch(`http://10.71.95.219:8081/user/gamificationWord/${user.id}`);
            const wordsData = await wordsResponse.json();
            const { words, isReviewDay: isReviewDayWords } = wordsData.data;

            // Getting Daily Grammar Data from the Server
            const grammarResponse = await fetch(`http://10.71.95.219:8081/user/gamificationGrammar/${user.id}`);
            const grammarData = await grammarResponse.json();
            const { grammars, isReviewDay: isReviewDayGrammar } = grammarData.data;

            // Determine if it is a review day
            const isReviewDay = isReviewDayWords || isReviewDayGrammar;
            console.log('Is it review day?', isReviewDay);

            // Storing Word and Grammar Data to AsyncStorage
            await AsyncStorage.setItem('dailyWords', JSON.stringify(words));
            await AsyncStorage.setItem('dailyGrammars', JSON.stringify(grammars));

            // Read and print stored word and grammar data from AsyncStorage
            const storedDailyWords = await AsyncStorage.getItem('dailyWords');
            const storedDailyGrammars = await AsyncStorage.getItem('dailyGrammars');

            // Navigate to different task screens depending on whether or not it is a revision day
            if (isReviewDay) {
                navigation.navigate('DailyTaskReviewStart', { words, grammars });
            } else {
                navigation.navigate('DailyTaskNormalStart', { words, grammars });
            }
        } catch (error) {
            console.error('Error fetching daily task data:', error);
        }
    };

    /**
     * Show load indicator during data loading process
     */
    if (isLoading) {
        return (
            <View style={styles.loadingContainer}>
                <ActivityIndicator size="large" color="#0000ff" />
            </View>
        );
    }

    return (
        <View style={styles.container}>
            {/* Top area: cloud and avatar */}
            <View style={styles.topSection}>
                <Image source={require('../../assets/Interface/home page/cloud.gif')} style={styles.cloudImage} />
                <Image source={require('../../assets/Interface/home page/P.gif')} style={styles.avatar} />
            </View>

            {/* Welcome information */}
            <View style={styles.welcomeSection}>
                <Image source={require('../../assets/Interface/home page/Welcome.gif')} style={styles.welcomeImage} />
            </View>

            {/* Main function button */}
            <View style={styles.bigFrame}>
                {/* First row of buttons: photo translation and dictionary */}
                <View style={styles.mainGrid}>
                    <TouchableOpacity style={styles.gridButton} onPress={() => navigation.navigate('PhotoTranslate')}>
                        <ImageBackground
                            source={require('../../assets/Interface/home page/photo-translate.gif')}
                            style={styles.gridIcon}
                            resizeMode="cover"
                        />
                    </TouchableOpacity>

                    <TouchableOpacity style={styles.gridButton} onPress={() => navigation.navigate('Dictionary')}>
                        <ImageBackground
                            source={require('../../assets/Interface/home page/vocabulary.gif')}
                            style={styles.gridIcon}
                            resizeMode="cover"
                        />
                    </TouchableOpacity>
                </View>

                {/* Second row of buttons: daily tasks and notebook */}
                <View style={styles.mainGrid}>
                    <TouchableOpacity style={styles.gridButton} onPress={handleDailyTaskPress}>
                        <ImageBackground
                            source={require('../../assets/Interface/home page/Daily-Task.gif')}
                            style={styles.gridIcon}
                            resizeMode="cover"
                        />
                    </TouchableOpacity>

                    <TouchableOpacity style={styles.gridButton} onPress={() => navigation.navigate('NoteBook')}>
                        <ImageBackground
                            source={require('../../assets/Interface/home page/Notebook.gif')}
                            style={styles.gridIcon}
                            resizeMode="cover"
                        />
                    </TouchableOpacity>
                </View>
            </View>
        </View>
    );
}

/**
 * Responsive Style
 */
const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#DEF9C4',
        padding: width * 0.05,
    },
    topSection: {
        marginTop: height * 0.03,
        marginBottom: height * -0.01,
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
    },
    cloudImage: {
        width: width * 0.55,
        height: height * 0.1,
    },
    avatar: {
        width: width * 0.2,
        height: height * 0.1,
        borderRadius: 30,
        marginRight: width * 0.04,
    },
    welcomeSection: {
        justifyContent: 'center',
        alignItems: 'center',
        marginVertical: height * 0.02,
    },
    welcomeImage: {
        width: width * 1.10,
        height: height * 0.35,
    },
    bigFrame: {
        flex: 1,
        padding: width * 0.03,
        borderRadius: 20,
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: height * 0.028,
    },
    mainGrid: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        marginBottom: height * 0.02,
        marginTop: height * -0.03,
    },
    gridIcon: {
        flex: 1,
        width: '100%',
        height: '100%',
        justifyContent: 'center',
        alignItems: 'center',
    },
    gridButton: {
        width: width * 0.40,
        height: height * 0.20,
        overflow: 'hidden',
        justifyContent: 'center',
        alignItems: 'center',
        marginHorizontal: width * 0.025,
    },
});

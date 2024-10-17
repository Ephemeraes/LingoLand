// Import the necessary libraries and components
import 'react-native-gesture-handler';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, ActivityIndicator } from 'react-native';
import * as React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator, TransitionPresets } from '@react-navigation/stack';
import StartScreen from './StartScreen';
import LoginScreen from './LoginScreen';
import RegisterScreen from './RegisterScreen';
import RegistrationSuccessScreen from './RegistrationSuccessScreen';
import HomeScreen from './HomeScreen';
import ProfileScreen from './ProfileScreen';
import NoteBookScreen from './NoteBookScreen';
import NotebookSentenceDetailScreen from './NotebookSentenceDetailScreen';
import AchievementScreen from './AchievementScreen';
import CourseModuleScreen from './CourseModuleScreen';
import ChatBoxScreen from './ChatBoxScreen';
import ChatBoxHistoryScreen from './ChatBoxHistoryScreen';
import PhotoTranslationScreen from './PhotoTranslationScreen';
import ParentalModelScreen from './ParentalModelScreen';
import SensitiveWordsScreen from './SensitiveWordsScreen';
import TranslationDetailScreen from './TranslationDetailScreen';
import DictionaryScreen from './DictionaryScreen';
import WordDetailScreen from './WordDetailScreen';
import DailyTaskNormalStartScreen from './DailyTaskNormalStartScreen';
import DailyTaskReviewStartScreen from './DailyTaskReviewStartScreen';
import DailyTaskIslandScreen from './DailyTaskIslandScreen';
import DailyTaskWordStartScreen from './DailyTaskWordStartScreen';
import DailyTaskGrammerStartScreen from './DailyTaskGrammerStartScreen';
import DailyTaskReviewScreen from './DailyTaskReviewScreen';
import WordSpellScreen from './WordSpellScreen';
import WordFirstExplanationScreen from './WordFirstExplanationScreen';
import WordExplanationScreen from './WordExplanationScreen';
import DailyReviewScreen from './DailyReviewScreen';
import GrammerTopicScreen from './GrammerTopicScreen';
import GrammerTopicExplanationScreen from './GrammerTopicExplanationScreen';
import DailyTaskCompleteScreen from './DailyTaskCompleteScreen';
import SettingScreen from './SettingScreen';
import { useFonts } from 'expo-font';
import * as SplashScreen from 'expo-splash-screen';
import { useEffect } from 'react';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { Ionicons } from '@expo/vector-icons';
import {Image,ImageBackground} from 'react-native';
import homeIcon from '../../assets/Interface/home page/home.png';
import barIcon from '../../assets/Interface/home page/bar.gif';
import cameraIcon from '../../assets/Interface/home page/camera.gif';
import noteIcon from '../../assets/Interface/home page/nn.png';
import dictionaryIcon from '../../assets/Interface/home page/note.gif';
import profileIcon from '../../assets/Interface/home page/Profile-button.gif';

SplashScreen.preventAutoHideAsync();
const Stack = createStackNavigator();
const Tab = createBottomTabNavigator();

/**
 * App main component that handles navigation, font loading, and initial setup of the app
 */
export default function App() {
  const [loaded, error] = useFonts({
    'Pilsner_Regular': require('../../assets/fonts/Pilsner_Regular.ttf'),
  });

  // Use Effect to handle the logic of hiding the splash screen after the font is loaded.
  useEffect(() => {
    if (loaded || error) {
      SplashScreen.hideAsync();
    }
  }, [loaded, error]);

  // If the font has not been loaded and there are no errors, return null without rendering any content
  if (!loaded && !error) {
    return null;
  }

  /**
   * MyTabs component: bottom tab navigator for switching between multiple main functions
   * @returns {React.Component} Back to the bottom navigation bar
   */
  function MyTabs() {
    return (
      <Tab.Navigator
        initialRouteName="Home"
        screenOptions={({ route }) => ({
          tabBarIcon: ({ focused, color, size }) => {
            let iconName;

            if (route.name === 'Home') {
              iconName = homeIcon;
            } else if (route.name === 'Dictionary') {
              iconName = dictionaryIcon;
            } else if (route.name === 'NoteBook') {
              iconName = noteIcon;
            } else if (route.name === 'Profile') {
              iconName = profileIcon;
            } else if (route.name === 'CourseModule') {
              iconName = focused ? 'document' : 'document-outline';
            } else if (route.name === 'ChatBox') {
              iconName = focused ? 'chatbubble' : 'chatbubble-outline';
            } else if (route.name === 'PhotoTranslate') {
              iconName = cameraIcon;
            }

            return <Image source = {iconName} style={{width:40,height:50}}/>;
          },    
          tabBarShowLabel: false,      
          tabBarBackground: () => (<ImageBackground source = {barIcon} style={{width:'100%',height:'100%'}}
          />
          ),
          tabBarActiveTintColor: 'tomato',
          tabBarInactiveTintColor: 'gray',
          tabBarStyle: { display: 'flex' },
        })}
      >
        {/* These pages will be displayed in the bottom navigation bar */}
        <Tab.Screen name="PhotoTranslate" component={PhotoTranslationScreen} options={{ headerShown: false }} />
        <Tab.Screen name="Dictionary" component={DictionaryScreen} options={{ headerShown: false }} />
        <Tab.Screen name="Home" component={HomeScreen} options={{ headerShown: false }} />
        <Tab.Screen name="NoteBook" component={NoteBookScreen} options={{ headerShown: false }} />
        <Tab.Screen name="Profile" component={ProfileScreen} options={{ headerShown: false }} />

        {/* These pages do not appear in the bottom navigation bar */}
        <Tab.Screen name="DailyTaskNormalStart" component={DailyTaskNormalStartScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="DailyTaskReviewStart" component={DailyTaskReviewStartScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="DailyTaskIsland" component={DailyTaskIslandScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="DailyTaskWordStart" component={DailyTaskWordStartScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="DailyTaskGrammerStart" component={DailyTaskGrammerStartScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="DailyTaskReview" component={DailyTaskReviewScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="WordSpell" component={WordSpellScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="WordExplanation" component={WordExplanationScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="WordFirstExplanation" component={WordFirstExplanationScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="GrammerTopic" component={GrammerTopicScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="GrammerTopicExplanation" component={GrammerTopicExplanationScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="DailyReview" component={DailyReviewScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="DailyTaskComplete" component={DailyTaskCompleteScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="CourseModule" component={CourseModuleScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="ChatBox" component={ChatBoxScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="ChatBoxHistory" component={ChatBoxHistoryScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="ParentalModel" component={ParentalModelScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="SensitiveWords" component={SensitiveWordsScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="WordDetail" component={WordDetailScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="TranslationDetail" component={TranslationDetailScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="NotebookSentenceDetail" component={NotebookSentenceDetailScreen} options={{ headerShown: false, tabBarButton: () => null }} />
        <Tab.Screen name="SettingScreen" component={SettingScreen} options={{ headerShown: false, tabBarButton: () => null }} />
      </Tab.Navigator>
    );
  }

  /**
   * App's main navigation container, including stack navigation and bottom tab navigation
   * @returns {React.Component} Return to Navigation Container
   */
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Start" screenOptions={{
        ...TransitionPresets.SlideFromRightIOS,
      }}>
        {/* Pages for stack navigation */}
        <Stack.Screen name="Start" component={StartScreen} options={{ headerShown: false }} />
        <Stack.Screen name="Login" component={LoginScreen} options={{ headerShown: false }} />
        <Stack.Screen name="RegisterScreen" component={RegisterScreen} options={{ headerShown: false }} />
        <Stack.Screen name="RegistrationSuccess" component={RegistrationSuccessScreen} options={{ headerShown: false }} />
        <Stack.Screen name="Achievements" component={AchievementScreen} options={{ headerShown: false }} />
        {/* The MyTabs component will manage the pages navigated by the bottom tabs */}
        <Stack.Screen name="HomeTabs" component={MyTabs} options={{ headerShown: false }} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#E8F5E9',
  },
  title: {
    fontFamily: 'Pilsner_Regular',
    fontSize: 40,
  },
  text: {
    fontFamily: 'Pilsner_Regular',
    fontSize: 16,
  }
});

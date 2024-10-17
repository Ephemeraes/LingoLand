import React, { useState, useEffect } from 'react';
import { View, Text, TextInput, TouchableOpacity, StyleSheet, Dimensions, ImageBackground, FlatList, Image, KeyboardAvoidingView, Platform } from 'react-native';
import { useNavigation, useFocusEffect } from '@react-navigation/native';
import AsyncStorage from '@react-native-async-storage/async-storage';

/**
 * ChatBoxScreen component: 
 * the chat box page where the user interacts with the chatbot.
 *
 * @returns {React.Component} Return to User Interface with Chat
 */
export default function ChatBoxScreen({route}) {
    const { oriWords, translatedWords, userId} = route.params;
    const [isNewTopic, setIsNewTopic] = useState("true");
    const [userName, setUserName] = useState('');
    const navigation = useNavigation();
    const [message, setMessage] = useState('');
    const [messages, setMessages] = useState([]);
    const { width, height } = Dimensions.get('window');
    const styles = getStyles(width, height);

    /**
     * useEffect hook: 
     * get the username from AsyncStorage on component load and set it to the userName state.
     */
    useEffect(() => {
        const fetchUserName = async () => {
            try {
                const userDataString = await AsyncStorage.getItem('userData');
                const userData = userDataString ? JSON.parse(userDataString) : null;
                if (userData && userData.name) {
                    setUserName(userData.name);
                }
            } catch (error) {
                console.error('Failed to load user data', error);
            }
        };

        fetchUserName();
    }, []);

    useEffect(() => {
        const initialMessage = "原文是: " + oriWords + "，翻译是: " + translatedWords + "，请你优化这个翻译结果，给出不同语境情况下的各种翻译情况。";
        sendMessage(initialMessage);  
    }, [oriWords, translatedWords]);
    
    /**
     * useFocusEffect hook: 
     * reset the message list every time the page is focused and set to a new topic.
     */
    useFocusEffect(
        React.useCallback(() => {
            setMessages([
                {id:1, text:'What can I help with?', sender:'bot'}
            ]);
            setIsNewTopic("true");
        }, [])
    );

    /**
     * sendMessage function: 
     * sends the user's message to the backend, receives the bot's reply, and updates the message list.
     */
    const sendMessage = (messageToSend = '') => {
        let messageContent = ""
        if(message){
            messageContent =  message
        }else{    
            messageContent = messageToSend;
        }  
        console.log(messageContent)
        if (typeof messageContent === 'string' && messageContent.trim() !== '') {
            fetch('http://10.71.95.219:8083/api/chatgpt/send', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    message: messageContent,
                    topicId: 'topic-123',
                    newTopic: isNewTopic,
                }),
            })
            .then((response) => response.json())
            .then((data) => {
                if (data.status === 'success') {
                    setMessages((prevMessages) => [
                        ...prevMessages,
                        { id: prevMessages.length + 1, text: messageContent, sender: 'user' },
                        { id: prevMessages.length + 2, text: data.response, sender: 'bot' },
                    ]);
                    setIsNewTopic("false");

                    //store history to chatbot DB
                    fetch('http://10.71.95.219:8081/ocr/postChatBot', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({
                            wordsId: userId,
                            content:messageContent,
                            contentType: 1,
                        }),
                    })
                    fetch('http://10.71.95.219:8081/ocr/postChatBot', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({
                            wordsId: userId,
                            content:data.response,
                            contentType: 2,
                        }),
                    })
                }
            })
            .catch((error) => console.error('Error:', error));
    
            setMessage(''); 
        }
    };
    return (
        <ImageBackground
            source={require('../../assets/Interface/Profile Interface/background.jpg')}
            style={styles.backgroundImage}
        >
            {/* Top navigation bar */}
            <View style={styles.header}>
                <TouchableOpacity onPress={() => navigation.navigate('Profile')}>
                    <Image source={require('../../assets/Interface/Asset/return-button.gif')} style={styles.icon} />
                </TouchableOpacity>
                <View style={styles.headerContainer}>
                    <Text style={styles.headerText}>Chat Bot</Text>
                    <Image source={require('../../assets/Interface/Chat Box/robot.gif')} style={styles.icon} />
                </View>
                <Image source={require('../../assets/Interface/Asset/setting.gif')} style={styles.icon} />
            </View>
            {/* User Name Display */}
            <Text style={styles.subHeaderText}>Dear {userName}</Text>
            {/* Chat content display area */}
            <KeyboardAvoidingView behavior={Platform.OS === 'ios' ? 'padding' : 'height'} style={{ flex: 1 }}>
                <View style={styles.chatContainer}>
                    <FlatList
                        data={messages}
                        keyExtractor={(item) => item.id.toString()}
                        renderItem={({ item }) => (
                            <View
                                style={[
                                    styles.messageContainer,
                                    item.sender === 'user' ? styles.userMessageContainer : styles.botMessageContainer,
                                ]}
                            >
                                <Text
                                    style={[
                                        styles.messageText,
                                        item.sender === 'user' ? styles.userMessageText : styles.botMessageText,
                                    ]}
                                >
                                    {item.text}
                                </Text>
                            </View>
                        )}
                        style={styles.messageList}
                        contentContainerStyle={{ paddingBottom: 20 }}
                    />
                    {/* Message input and send buttons */}
                    <View style={styles.inputSection}>
                        <TextInput
                            style={styles.input}
                            value={message}
                            onChangeText={(text) => setMessage(text)}
                            placeholder="Type your message..."
                            placeholderTextColor="#888"
                        />
                        <TouchableOpacity style={styles.sendButton} onPress={sendMessage}>
                            <Text style={styles.sendButtonText}>Send</Text>
                        </TouchableOpacity>
                    </View>
                </View>
            </KeyboardAvoidingView>
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
        flex: 1,
        width: '100%',
        height: '100%',
        resizeMode: 'cover',
    },
    header: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        paddingHorizontal: width * 0.05,
        paddingTop: height * 0.05,
        backgroundColor: '#e1f5c4',
        height: height * 0.12,
    },
    icon: {
        width: width * 0.08,
        height: height * 0.05,
    },
    headerContainer: {
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'center',
    },
    headerText: {
        fontSize: width * 0.08,
        fontFamily: 'Pilsner_Regular',
        fontWeight: 'bold',
        color: '#115700',
        fontFamily: 'Cochin',
    },
    subHeaderText: {
        fontSize: width * 0.07,
        fontFamily: 'Pilsner_Regular',
        fontWeight: 'bold',
        color: '#115700',
        paddingLeft: width * 0.05,
        marginVertical: height * 0.01,
    },
    messageList: {
        paddingHorizontal: width * 0.05,
    },
    chatContainer: {
        flex: 1,
        justifyContent: 'space-between',
    },
    messageContainer: {
        marginVertical: height * 0.015,
        maxWidth: '75%',
        padding: width * 0.03,
        borderRadius: 20,
    },
    userMessageContainer: {
        alignSelf: 'flex-end',
        backgroundColor: '#e0f7fa',
    },
    botMessageContainer: {
        alignSelf: 'flex-start',
        backgroundColor: '#FFF3DA',
    },
    messageText: {
        fontSize: width * 0.06,
        fontFamily: 'Pilsner_Regular',
        lineHeight: height * 0.03,
    },
    userMessageText: {
        color: '#115700',
        fontWeight: 'bold',
    },
    botMessageText: {
        color: '#115700',
    },
    inputSection: {
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between',
        paddingHorizontal: width * 0.05,
        paddingVertical: height * 0.015,
        borderTopWidth: 1,
        borderTopColor: '#ccc',
        backgroundColor: '#FFF3DA',
    },
    input: {
        flex: 1,
        backgroundColor: '#f1f1f1',
        padding: width * 0.03,
        borderRadius: 25,
        fontSize: width * 0.06,
        fontFamily: 'Pilsner_Regular',
    },
    sendButton: {
        backgroundColor: '#e0f7fa',
        paddingHorizontal: width * 0.06,
        paddingVertical: height * 0.015,
        borderRadius: 25,
        marginLeft: width * 0.03,
    },
    sendButtonText: {
        color: '#115700',
        fontSize: width * 0.06,
        fontFamily: 'Pilsner_Regular',
    },
});


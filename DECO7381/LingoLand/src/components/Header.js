import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet, Dimensions } from 'react-native';
import { useNavigation } from '@react-navigation/native';

const { width, height } = Dimensions.get('window');

const Header = ({ title, goToScreen }) => {
    const navigation = useNavigation();

    const handleBackPress = () => {
        if (goToScreen) {
            navigation.navigate(goToScreen);
        } else {
            navigation.goBack();
        }
    };

    return (
        <View style={styles.header}>
            <TouchableOpacity onPress={handleBackPress} style={styles.backButton}>
                <Text style={styles.backButtonText}>←</Text>
            </TouchableOpacity>
            <Text style={styles.title}>{title}</Text>
        </View>
    );
};

const styles = StyleSheet.create({
    header: {
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'flex-start',
        paddingTop: height * 0.05, // 适配状态栏高度
        paddingHorizontal: width * 0.05,
        backgroundColor: '#FFF3DA', // 背景颜色
        height: height * 0.12, // Header 的高度
    },
    backButton: {
        marginRight: width * 0.02,
    },
    backButtonText: {
        fontSize: 24,
        fontWeight: 'bold',
        color: '#000',
    },
    title: {
        fontSize: 28,
        fontWeight: 'bold',
        color: '#115700',
        marginLeft: width * 0.03,
    },
});

export default Header;

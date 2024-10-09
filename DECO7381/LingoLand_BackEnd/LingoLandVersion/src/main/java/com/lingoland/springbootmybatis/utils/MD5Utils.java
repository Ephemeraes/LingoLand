package com.lingoland.springbootmybatis.utils;

import java.security.MessageDigest;
import java.util.Base64;

public class MD5Utils {

    public static String encodeByMd5(String string) {
        try {
            //reference: https://blog.csdn.net/shangshanzixu/article/details/107944518
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            Base64.Encoder base64Encoder = Base64.getEncoder();
            return base64Encoder.encodeToString(md5.digest(string.getBytes("utf-8")));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Boolean decryptByMd5(String password, String realPassword) {
        try {
            password = encodeByMd5(password);
            if (password.equals(realPassword)) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author joseph
 */
public class CheckSpecialCharacters {
    
    public int onlyLettersAndSpace(String s) {
        int res = 0;
        if (s == null || s.trim().isEmpty()) {
            System.out.println("Incorrect format of string");
            return 0;
        }
        Pattern p = Pattern.compile("[^A-Za-z ]");
        Matcher m = p.matcher(s);
        // boolean b = m.matches();
        boolean b = m.find();
        if (b) {
            System.out.println("There is a special character in my string ");
            res += 1;
        } else {
            System.out.println("There is no special char.");
            res += 0;
        }
        return res;
    }

    public int getSpecialCharacterCount(String s) {
        int res = 0;
        if (s == null || s.trim().isEmpty()) {
            System.out.println("Incorrect format of string");
            return 0;
        }
        Pattern p = Pattern.compile("[^A-Za-z0-9 ]");
        Matcher m = p.matcher(s);
        // boolean b = m.matches();
        boolean b = m.find();
        if (b) {
            System.out.println("There is a special character in my string ");
            res += 1;
        } else {
            System.out.println("There is no special char.");
            res += 0;
        }
        return res;
    }
    
    public int getSpecialCharacterCountWithSlash(String s) {
        int res = 0;
        if (s == null || s.trim().isEmpty()) {
            System.out.println("Incorrect format of string");
            return 0;
        }
        Pattern p = Pattern.compile("[^A-Z0-9\\/]*$");
        Matcher m = p.matcher(s);
        // boolean b = m.matches();
        boolean b = m.find();
        if (b) {
            System.out.println("There is a special character in my string ");
            res += 1;
        } else {
            System.out.println("There is no special char.");
            res += 0;
        }
        return res;
    }
}

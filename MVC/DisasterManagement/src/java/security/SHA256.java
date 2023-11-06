/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package security;

import java.security.MessageDigest;



/**
 *
 * @author Macdonald
 */
public class SHA256 {

    public SHA256() {
    }

    public static String getHash(String pass) {

        byte buf[] = pass.getBytes();
        byte[] digest = null;
        String hexStr = "";
        MessageDigest algorithm = null;
        try {
            algorithm = MessageDigest.getInstance("SHA-256");

            algorithm.reset();
            algorithm.update(buf);
            digest = algorithm.digest();
            // get the hex string
            for (int i = 0; i < digest.length; i++) {
                hexStr += Integer.toString((digest[i] & 0xff) + 0x100, 16).substring(1);
            }
        } catch (Exception ex) {
           
            return "";
        } finally {
            algorithm = null;
            digest = null;
            buf = null;

        }
        return hexStr.toString();
    }
}

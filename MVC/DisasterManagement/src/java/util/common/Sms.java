//package util.common;
//
//import java.net.HttpURLConnection;
//import java.net.URL;
//import java.net.URLEncoder;
//import java.util.Properties;
//import javax.net.ssl.SSLContext;
//import javax.net.ssl.TrustManager;
//import javax.net.ssl.X509TrustManager;
//import model.CustomizedHostnameVerifier;
//import javax.net.ssl.HttpsURLConnection;
//
//public class Sms {
//
//    // OLD SMS START
//    public String sendSMS(String mobileno, String message, String templateid) {
//        String res = "";
//        try {
//            Properties prop = new Properties();
//            prop.load(Sms.class.getClassLoader().getResourceAsStream("EmailSMS.properties"));
//
//            String username = prop.getProperty("sms.username");
//            String password = prop.getProperty("sms.password");
//            String send = prop.getProperty("sms.senderid");
//            String localHost = prop.getProperty("sms.host");
//            String dltid = prop.getProperty("sms.dltid");
//
////            System.out.println(localHost + "username=" + username + "&pin=" + password + "&message=" + message + "&mnumber=" + mobileno + "&signature=" + send + "&dlt_entity_id=" + dltid + "&dlt_template_id=" + templateid);
//
////            System.out.println("username : "+username);    
////            System.out.println("password : "+password);    
////            System.out.println("send : "+send);    
////            System.out.println("localHost : "+localHost);                
////            String username = "pgmeg.auth";
////            String password = "Hs@%23123K";
////            String send = "PGMEGH";
////            String localHost = "https://smsgw.sms.gov.in/failsafe/HttpLink?";
//            // Create a trust manager that does not validate certificate chains
//            TrustManager[] trustAllCerts = new TrustManager[]{
//                new X509TrustManager() {
//                    public java.security.cert.X509Certificate[] getAcceptedIssuers() {
//                        return null;
//                    }
//
//                    public void checkClientTrusted(
//                            java.security.cert.X509Certificate[] certs, String authType) {
//                    }
//
//                    public void checkServerTrusted(
//                            java.security.cert.X509Certificate[] certs, String authType) {
//                    }
//                }
//            };
//            //Install the all-trusting trust manager
//            SSLContext sc = SSLContext.getInstance("SSL");
//            sc.init(null, trustAllCerts, new java.security.SecureRandom());
//            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
//
//            message = URLEncoder.encode(message, "UTF-8");
//            String localuri = localHost + "username=" + username + "&pin=" + password + "&message=" + message + "&mnumber=" + mobileno + "&signature=" + send + "&dlt_entity_id=" + dltid + "&dlt_template_id=" + templateid;
////            System.out.println("localuri " + localuri);
//            HttpsURLConnection connection = (HttpsURLConnection) new URL(localuri).openConnection();
//            connection.setHostnameVerifier(new CustomizedHostnameVerifier());
//            res = connection.getResponseMessage();
//            int code = connection.getResponseCode();
//            if (code == 200) {
//                connection.disconnect();
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
////            System.out.println(" POLL MONITOR SMS ERROR : Exception thrown by " + this.getClass() + " Error Message is " + e.getMessage());
//        }
//
//        return res;
//    }
//    //OLD SMS END
//
//    public String sendSMSSandes(String mobileno, String message) {
//        String res = "";
//        try {
//            Properties prop = new Properties();
//            prop.load(Sms.class.getClassLoader().getResourceAsStream("EmailSMS.properties"));
////            String localHost = "http://localhost:8021/send?";
//            String localHost = prop.getProperty("sandes.host");
//            message = URLEncoder.encode(message, "UTF-8");
////            System.out.println("Local Host = " + localHost);
//            String localuri = localHost + "receiverid=" + mobileno + "&msg=" + message;
////            System.out.println("Local URI: " + localuri);
//            HttpURLConnection connection = (HttpURLConnection) new URL(localuri).openConnection();
//            res = connection.getResponseMessage();
//            int code = connection.getResponseCode();
//            if (code == 200) {
//                connection.disconnect();
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return res;
//    }
//
//    public String sendSMS2(String mobileno, String message, String templateid) {
//        String res = "";
//        try {
//            Properties prop = new Properties();
//            prop.load(Sms.class.getClassLoader().getResourceAsStream("EmailSMS.properties"));
//
//            String username = prop.getProperty("test.username");
//            String password = prop.getProperty("test.password");
//            String send = prop.getProperty("test.senderid");
//            String localHost = prop.getProperty("test.host");
//            String dltid = prop.getProperty("test.dltid");
//
////            System.out.println(localHost + "username=" + username + "&pin=" + password + "&message=" + message + "&mnumber=" + mobileno + "&signature=" + send + "&dlt_entity_id=" + dltid + "&dlt_template_id=" + templateid);
//
////            System.out.println("username : "+username);    
////            System.out.println("password : "+password);    
////            System.out.println("send : "+send);    
////            System.out.println("localHost : "+localHost);                
////            String username = "pgmeg.auth";
////            String password = "Hs@%23123K";
////            String send = "PGMEGH";
////            String localHost = "https://smsgw.sms.gov.in/failsafe/HttpLink?";
//            // Create a trust manager that does not validate certificate chains
//            TrustManager[] trustAllCerts = new TrustManager[]{
//                new X509TrustManager() {
//                    public java.security.cert.X509Certificate[] getAcceptedIssuers() {
//                        return null;
//                    }
//
//                    public void checkClientTrusted(
//                            java.security.cert.X509Certificate[] certs, String authType) {
//                    }
//
//                    public void checkServerTrusted(
//                            java.security.cert.X509Certificate[] certs, String authType) {
//                    }
//                }
//            };
//            //Install the all-trusting trust manager
//            SSLContext sc = SSLContext.getInstance("SSL");
//            sc.init(null, trustAllCerts, new java.security.SecureRandom());
//            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
//
//            message = URLEncoder.encode(message, "UTF-8");
//            String localuri = localHost + "username=" + username + "&pin=" + password + "&message=" + message + "&mnumber=" + mobileno + "&signature=" + send + "&dlt_entity_id=" + dltid + "&dlt_template_id=" + templateid;
////            System.out.println("localuri " + localuri);
//            HttpsURLConnection connection = (HttpsURLConnection) new URL(localuri).openConnection();
//            connection.setHostnameVerifier(new CustomizedHostnameVerifier());
//            res = connection.getResponseMessage();
//            int code = connection.getResponseCode();
//            if (code == 200) {
//                connection.disconnect();
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
////            System.out.println(" POLL MONITOR SMS ERROR : Exception thrown by " + this.getClass() + " Error Message is " + e.getMessage());
//        }
//
//        return res;
//    }
//}

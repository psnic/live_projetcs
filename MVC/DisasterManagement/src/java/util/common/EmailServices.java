//package util.common;
//
//
//
//
//import java.util.Date;
//import java.util.Properties;
//import org.apache.commons.mail.DefaultAuthenticator;
//import org.apache.commons.mail.SimpleEmail;
//
//
//public class EmailServices {
//    
//    public static void sendEmail(String emailidto,String nameto,String emailSubject,String emailDescription)
//    {
//         try 
//         {                      
//            Properties prop = new Properties();
//            prop.load(EmailServices.class.getClassLoader().getResourceAsStream("EmailSMS.properties"));                             
//            
//            String SMTP_PORT = prop.getProperty("email.port");
//            String HOST_NAME = prop.getProperty("email.hostname");  
//            String FROM_NAME = prop.getProperty("email.fromname");  
//            String FROM_ID   = prop.getProperty("email.fromid");                    
//            String AUTH_USER = prop.getProperty("email.user");            
//            String AUTH_PASS = prop.getProperty("email.password");                                                                 
//                       
////            System.out.println("SMTP_PORT : "+SMTP_PORT);
////            System.out.println("HOST_NAME : "+HOST_NAME);
////            System.out.println("FROM_ID : "+FROM_ID);
////            System.out.println("AUTH_USER : "+AUTH_USER);
////            System.out.println("AUTH_PASS : "+AUTH_PASS);
//                               
////            String SMTP_PORT = "465";
////            String HOST_NAME = "smtp.gmail.com";  
////            String FROM_NAME = "Dert"; 
////            String FROM_ID =  "megdeled@gmail.com";                    
////            String AUTH_USER = "megdeled@gmail.com";            
////            String AUTH_PASS = "dert@123";                                                               
//            
//            
//            SimpleEmail email = new SimpleEmail();
//            email.setHostName(HOST_NAME);
//            email.setSmtpPort(Integer.valueOf(SMTP_PORT));
//            email.setAuthenticator(new DefaultAuthenticator(AUTH_USER,AUTH_PASS));
//            email.setSSLOnConnect(true);
//            email.setFrom(FROM_ID,FROM_NAME);
//            email.setSubject(emailSubject);
//            email.setMsg(emailDescription);
//            email.addTo(emailidto);
//            email.send();            
//            
//            
//         } catch (Exception ex) {
//            System.out.println("Error in Email.sendEmail(String emailidto,String nameto,String emailSubject,String emailDescription) : "+ex);
//         }    
//    }     
//    
//    public static void main(String[] args) {
////        String emailidto="gulrezsohliya@gmail.com";
//        String emailidto="avijitdebnath@gmail.com";
//        String nameto="";
//        String emailSubject="Email Testing...!";
//        String emailDescription="Dert mail testing...date : "+new Date();
//        sendEmail(emailidto,nameto,emailSubject,emailDescription);
//    }
//}

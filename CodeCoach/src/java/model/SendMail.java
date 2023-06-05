/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.PrintWriter;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail {

    public static void SendMail(String to, String sub,
            String msg, final String user, final String pass) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html");
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

 

    public static void sendMailFunction(String den, String tieuDe, String noiDung) {
        String noiDungF = ""
                + "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <title>Tks</title>\n"
                + "</head>\n"
                + "<body>\n"
                + "    \n" + noiDung
                + "</body>\n"
                + "</html>";
        SendMail(den, tieuDe, noiDungF, "codecoachsp@gmail.com", "fbpczxgebgfbclny");
    }

    
    public static String generateRandomCode(){
        Random random = new Random();
        int code = random.nextInt(900000) + 100000;
        return String.valueOf(code);
    }
    public static void main(String[] args) {
        sendMailFunction("hoangkiet2107@gmail.com", "Verify Your Email", generateRandomCode());
    }
}

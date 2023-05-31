/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 *
 * @author Duy Thai
 */
public class EmailSender {

    public static void sendEmail(String recipient, String subject, String body) {
        // Set the SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp-relay.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Set the sender's credentials
        final String senderEmail = "codecoach.project@gmail.com";
        final String senderPassword = "bbuefxcdsvagzuqe";

        // Create a session with the SMTP server
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            // Create a MimeMessage object
            Message message = new MimeMessage(session);

            // Set the sender and recipient addresses
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

            // Set the email subject and body
            message.setSubject(subject);
            message.setText(body);

            // Send the email
            Transport.send(message);
            System.out.println("Email sent successfully!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        String recipient = "dduythai.ddt@gmail.com";
        String subject = "Hello";
        String body = "This is a test email.";

        sendEmail(recipient, subject, body);
    }

}

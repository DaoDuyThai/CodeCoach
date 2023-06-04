package controller;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import java.util.Random;

public class EmailSender {

    public EmailSender() {
    }
    
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    } 

    public void sendEmail(String receiverEmail, String otp) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("codecoach.project@gmail.com", "phtycutgjbgukddr");
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress("codecoach.project@gmail.com"));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiverEmail));
        message.setSubject("One-Time Password (OTP) Verification");
        String mess = "Dear " + receiverEmail + ",\n"
                        + "\n"
                        + "Thank you for using our system. To proceed with your request, please use the following One-Time Password (OTP):\n"
                        + "\n"
                        + "OTP: "+otp+"\n"
                        + "\n"
                        + "Please do not share this OTP with anyone.\n"
                        + "\n"
                        + "If you did not initiate this request, please ignore this email.\n"
                        + "\n"
                        + "Thank you,\n"
                        + "CodeCoach\n"
                        + "\n"
                        + "Note: This is an automated email. Please do not reply.";
        message.setText(mess);

        Transport.send(message);
        System.out.println("Email sent successfully to " + receiverEmail);
    }

    public static void main(String[] args) {
        EmailSender es = new EmailSender();
        try {
            es.sendEmail("nguyenldhe176088@fpt.edu.vn", "123456");
        } catch (Exception e) {
        }

    }

}

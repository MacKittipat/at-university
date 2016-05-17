/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package jMail;

// ถ้าตรงนี้ error ให้ add Library เข้าไปด้วย
// ใช้ชื่อLibว่า JavaMail ประกอบไปด้วย
//                 -  activation.jar
//                 -  dsn.jar
//                 -  imap.jar
//                 -  mail.jar
//                 -  mailapi.jar
//                 -  pop3.jar
//                 -  smtp.jar
// แต่พลว่ามันใช้ไม่ครบหรอก pop3 คงไม่ได้ใช้ แต่ add ไว้เผื่อ
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

/**
 *
 * @author Ponlavat
 */

public class Mail {
    private String to;
    private String from;
    private String message;
    private String subject;
    private String smtpServ;

    /**
     * @return the to
     */
    public String getTo() {
        return to;
    }

    /**
     * @param to the to to set
     */
    public void setTo(String to) {
        this.to = to;
    }

    /**
     * @return the from
     */
    public String getFrom() {
        return from;
    }

    /**
     * @param from the from to set
     */
    public void setFrom(String from) {
        this.from = from;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message){
        this.message = message;
    }

    /**
     * @return the subject
     */
    public String getSubject() {
        return subject;
    }

    /**
     * @param subject the subject to set
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * @return the smtpServ
     */
    public String getSmtpServ() {
        return smtpServ;
    }

    /**
     * @param smtpServ the smtpServ to set
     */
    public void setSmtpServ(String smtpServ) {
        this.smtpServ = smtpServ;
    }

    public int sendMail(){
        try {
            Properties props = System.getProperties(); // -- Attaching to default Session, or we could start a new one --
            props.put("mail.transport.protocol", "smtp" );
            props.put("mail.smtp.starttls.enable","true" );
            props.put("mail.smtp.host",smtpServ);
            props.put("mail.smtp.auth", "true" );
            //บรรทัดนี้ไว้แก้เวลาบล๊อก port 25
            props.put("mail.smtp.port", "587" );
            props.put("mail.smtp.starttls.enable","true");
            //
            Authenticator auth = new SMTPAuthenticator();
            Session session = Session.getInstance(props, auth); // -- Create a new message --
            MimeMessage msg = new MimeMessage(session); // -- Set the FROM and TO fields --
            msg.setFrom(new InternetAddress(from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            msg.setSubject(subject,"utf-8");

            // ใช้อันใดอันหนึ่งก็พอ
            //msg.setText(message,"utf-8"); // -- Set some other header information --
            msg.setContent(message,"text/html; charset=utf-8"); // ใช้อันนี้เพราะ ส่งเป็น html ไปได้
            //
            msg.setHeader("MyMail", "Mr. XYZ" );
            msg.setSentDate(new Date()); // -- Send the message --
            
            Transport.send(msg); System.out.println("Message sent to"+to+" OK." );
            return 0;
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception "+ex);
            return -1;
        }
    } // Also include an inner class that is used for authentication purposes
    private class SMTPAuthenticator extends javax.mail.Authenticator {
        @Override public PasswordAuthentication getPasswordAuthentication() {
            //String username = "Java.Mail.CA@gmail.com"; // specify your email id here (sender's email id)
            String username = "efitness.admin@gmail.com"; // นี่คือเมล์ที่จะใช้ส่งนะ พลสมัครแล้ว
            //String password = "javamail"; // specify your password here
            String password = "kmutt2009"; // password ก็ตามนี้เลยไม่ต้องแก้นะ
            return new PasswordAuthentication(username, password);
        }
    }
}

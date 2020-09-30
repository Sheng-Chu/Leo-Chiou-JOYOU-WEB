package joyou.Members.controller;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class TestMail {

	public String sendMail(String mailAddress) {
		String host = "smtp.gmail.com";
		int port = 587;
		final String username = "eeit117G1@gmail.com";
//		final String username = "eeit117G2@gmail.com";
		final String password = "java11736";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			int rand1000to9999 = (int) (Math.random() * (9999 - 1000 + 1)) + 1000;
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("internet"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailAddress));
			message.setSubject("JoYou驗證信");
			message.setText("驗證碼:" + rand1000to9999 + "\r\n");

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			Transport.send(message);

			System.out.println("寄送email結束.");
			return String.valueOf(rand1000to9999);
		} catch (MessagingException e) {
			throw new RuntimeException(e);

		}

	}

}

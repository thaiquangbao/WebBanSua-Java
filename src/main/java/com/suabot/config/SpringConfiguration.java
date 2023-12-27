package com.suabot.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class SpringConfiguration {
	@Bean
	public JavaMailSender getMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("icgaming26zs@gmail.com");
		mailSender.setPassword("kjllyszbpzehdwal");
		Properties javaProperties= new Properties();
		javaProperties.put("mail.smtp.starttls.enable", "true");
		javaProperties.put("mail.smtp.auth", "true");
		
		mailSender.setJavaMailProperties(javaProperties);
		return mailSender;
	}
}

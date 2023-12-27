package com.suabot.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.suabot.constant.SystemConstant;
import com.suabot.dto.UserDTO;
import com.suabot.service.IUserService;
@RestController(value = "signup")
public class SignupAPI {
	@Autowired
	MailSender mailSender;
	@Autowired
	private IUserService userService;
	@PostMapping(value = "/guest/laylaimk")
	public UserDTO layLai(@RequestBody UserDTO userDTO) {
		
		UserDTO mess = new UserDTO();
		UserDTO findUser = userService.findOne(userDTO.getUserName());
		if (findUser.getEmail().equals(userDTO.getEmail())) {
			String pass = userService.repassword(userDTO.getUserName());
					sendEmail("Lấy lại mật khẩu",userDTO.getEmail(), "Mật khẩu mới của bạn là :" + pass);
					mess.setErrorMessage(200);
			}
			
		
		else {
			mess.setErrorMessage(503);
			
		}
		return mess;
		
	}
	@PostMapping(value = "/guest/repass/checkUserName")
	public UserDTO check(@RequestBody UserDTO userDTO) {
		boolean checkuser = userService.findUserName(userDTO.getUserName());
		UserDTO mess = new UserDTO();
		
		if (checkuser) {
			mess.setErrorMessage(200);
		}
		else {
			mess.setErrorMessage(500);
		}
		return mess;
	}
	@PostMapping(value = "/guest/signup/create")
	public UserDTO signPage(@RequestBody UserDTO user) {
	String findUserName = user.getUserName();
	String findEmail = user.getEmail();
	boolean checkEmail = userService.findEmail(findEmail);
	boolean checkUserName = userService.findUserName(findUserName);
	if (checkUserName) {
		UserDTO mess1 = new UserDTO();
		mess1.setErrorMessage(1);
		return mess1;
	}
	else if(checkEmail) {
		UserDTO mess2 = new UserDTO();
		mess2.setErrorMessage(2);
		return mess2;
	}
	else {
		
		sendEmail("Đăng ký thành công",findEmail,"Chúc mừng "+user.getFullName()+" đã trở thành viên của đại gia đình sữa bột \n"
				+ "Mời bạn click vào đường link để đăng nhập vào website \n"+"<http://localhost:8080/suabot/guest/login>");
		user.setStatus(SystemConstant.ACTIVE_STATUS);
		return userService.create(user);
	}
	 
		  
	}
	public void sendEmail(String tieuDe,String toEmail,String noiDung) {
		
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setFrom("icgaming26zs@gmail.com");
		mailMessage.setTo(toEmail);
		mailMessage.setSubject(tieuDe);
		mailMessage.setText(noiDung);
		mailSender.send(mailMessage);
	}
}

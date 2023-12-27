package com.suabot.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.suabot.dto.UserDTO;
import com.suabot.service.IUserService;

@RestController(value = "userAPI")
public class UserAPI {
	@Autowired
	private IUserService userService;
	
	@PutMapping(value = "/admin/account/update/email/{userName}")
	public UserDTO updateEmailPage(@RequestBody UserDTO userDTO ,@PathVariable String userName)
	{
		
		
			return userService.updateEmail(userName, userDTO.getEmail());
		
	}
	@PostMapping(value = "/admin/account/checkEmail")
	public UserDTO checkEmailPage(@RequestBody UserDTO userDTO)
	{
		boolean checkEmail = userService.findEmail(userDTO.getEmail());
		UserDTO mess = new UserDTO();
		if (checkEmail) {
			
			mess.setErrorMessage(1);
			
		}
		else {
			mess.setErrorMessage(0);
		}
		return mess;
	}
	@PutMapping(value = "/admin/account/update/profile/{userName}")
	public UserDTO updateProFile(@RequestBody UserDTO userDTO ,@PathVariable String userName) {
		return userService.uppdateProFile(userName, userDTO);
	}
	@PutMapping(value = "/admin/account/update/password/{userName}")
	public UserDTO updatePassWord(@RequestBody UserDTO userDTO ,@PathVariable String userName) {
		return userService.updatePassword(userName, userDTO);
	}
	@PostMapping(value = "/admin/account/checkPassword/{userName}")
	public UserDTO checkPassWordPage(@RequestBody UserDTO userDTO, @PathVariable String userName)
	{
		boolean checkPassWord = userService.checkPass(userName,userDTO);
		UserDTO mess = new UserDTO();
		if (checkPassWord) {
			
			mess.setErrorMessage(0);
			
		}
		else {
			mess.setErrorMessage(1);
		}
		return mess;
	}
	@PostMapping(value = "/admin/uploadFile/{userName}")
	public UserDTO uploadFilePage(@RequestBody UserDTO userDTO,@PathVariable String userName) {
		
		return userService.updateIMG(userName, userDTO);
		       
		     
		 
		
	}
	/* User */
	@PutMapping(value = "/account/update/email/{userName}")
	public UserDTO updateEmailPageUser(@RequestBody UserDTO userDTO ,@PathVariable String userName)
	{
		
		
			return userService.updateEmail(userName, userDTO.getEmail());
		
	}
	@PostMapping(value = "/account/checkEmail")
	public UserDTO checkEmailPageUser(@RequestBody UserDTO userDTO)
	{
		boolean checkEmail = userService.findEmail(userDTO.getEmail());
		UserDTO mess = new UserDTO();
		if (checkEmail) {
			
			mess.setErrorMessage(1);
			
		}
		else {
			mess.setErrorMessage(0);
		}
		return mess;
	}
	@PutMapping(value = "/account/update/profile/{userName}")
	public UserDTO updateProFileUser(@RequestBody UserDTO userDTO ,@PathVariable String userName) {
		return userService.uppdateProFile(userName, userDTO);
	}
	@PutMapping(value = "/account/update/password/{userName}")
	public UserDTO updatePassWordUser(@RequestBody UserDTO userDTO ,@PathVariable String userName) {
		return userService.updatePassword(userName, userDTO);
	}
	@PostMapping(value = "/account/checkPassword/{userName}")
	public UserDTO checkPassWordPageUser(@RequestBody UserDTO userDTO, @PathVariable String userName)
	{
		boolean checkPassWord = userService.checkPass(userName,userDTO);
		UserDTO mess = new UserDTO();
		if (checkPassWord) {
			
			mess.setErrorMessage(0);
			
		}
		else {
			mess.setErrorMessage(1);
		}
		return mess;
	}
	@PostMapping(value = "/uploadFile/{userName}")
	public UserDTO uploadFilePageUser(@RequestBody UserDTO userDTO,@PathVariable String userName) {
		
		return userService.updateIMG(userName, userDTO);
	}
	@DeleteMapping(value = "/deleteUser/{userName}/{id}")
	public UserDTO deleteUser(@PathVariable String userName,@PathVariable Long id ) {
		boolean deleted = userService.deleteUse(id);
		UserDTO mess = new UserDTO();
		if (deleted) {
			mess.setErrorMessage(1);
			return mess;
		}
		else {
			mess.setErrorMessage(0);
			return mess;
		}
	}
	@PatchMapping(value = "/updateImg/{id}")
	public UserDTO updateImg(@PathVariable long id) {
		boolean deleteAnh = userService.deleteAvatar(id);
		UserDTO mess = new UserDTO();
		if (deleteAnh) {
			mess.setErrorMessage(1);
			
		}
		else {
			mess.setErrorMessage(0);
			
		}
		return mess;
	}
	@PatchMapping(value = "/admin/users/delete/{id}")
	public UserDTO deleteOneUser(@PathVariable long id) {
		UserDTO user = userService.deleteUser(id);
		UserDTO mess = new UserDTO();
		if (user != null) {
			mess.setErrorMessage(1);
			return mess;
		}
		else {
			mess.setErrorMessage(0);
			return mess;
		}
	}
	@PatchMapping(value = "/admin/users/deleteAll")
	public void deleteAllUser(@RequestBody long[] ids) {
		userService.deleteAllUser(ids);
		
	}
	@PatchMapping(value = "/admin/users/trash/restore/{id}")
	public UserDTO restoreOneUser(@PathVariable long id) {
		UserDTO user = userService.restoreUser(id);
		UserDTO mess = new UserDTO();
		if (user != null) {
			mess.setErrorMessage(1);
			return mess;
		}
		else {
			mess.setErrorMessage(0);
			return mess;
		}
	}
	@PatchMapping(value = "/admin/users/trash/restoreAll")
	public void restoreAllUser(@RequestBody Long[] ids) {
		userService.restoreAllUser(ids);
		
	}
	@DeleteMapping(value = "/admin/users/trash/deleteAllUser")
	public void destroyAllUser(@RequestBody Long[] ids ) {
		 userService.destroyAllUser(ids);
		
	}
	@PutMapping(value = "/admin/users/update/{id}")
	public UserDTO updateUser(@PathVariable Long id, @RequestBody UserDTO user) {
		UserDTO update = userService.updateUser(id, user);
		UserDTO mess = new UserDTO();
		if (update != null) {
			mess.setErrorMessage(1);
			return mess;
		}
		else {
			mess.setErrorMessage(0);
			return mess;
		}
	}
	@GetMapping(value = "/admin/users/getUser/{userName}")
	public String destroyAllUser(@PathVariable String userName ) {
		String test = userService.testRoles(userName);
		return test;
	}
	



	

}

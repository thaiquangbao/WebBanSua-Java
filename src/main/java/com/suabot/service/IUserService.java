package com.suabot.service;

import java.util.List;

import com.suabot.dto.HoaDonDTO;
import com.suabot.dto.UserDTO;



public interface IUserService {
	List<UserDTO> findAll();
	List<UserDTO> findAllTrash();
	UserDTO findById(Long id);
	UserDTO create(UserDTO userDTO) ;
	boolean deleteUse(Long id);
	boolean findUserName(String userName);
	boolean findEmail(String email);
	UserDTO updateEmail(String username, String email);
	UserDTO findOne(String userName);
	UserDTO uppdateProFile(String username, UserDTO userDTO);
	UserDTO updatePassword(String username, UserDTO userDTO);
	boolean checkPass(String username, UserDTO userDTO);
	UserDTO updateIMG(String username, UserDTO userDTO);
	boolean deleteAvatar(long id);
	UserDTO deleteUser(long id);
	void deleteAllUser(long[] ids);
	void destroyAllUser(Long[] ids);
	UserDTO restoreUser(Long id);
	void restoreAllUser(Long[] ids);
	UserDTO updateUser(Long id,UserDTO userDTO);
	int getToTal();
	String testRoles(String userName);
	List<HoaDonDTO> findHoaDonDaDat(String userName);
	String repassword(String userName);
	int countDonDanhUser(long id);
}

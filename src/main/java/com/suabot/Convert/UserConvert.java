package com.suabot.Convert;

import org.springframework.stereotype.Component;

import com.suabot.dto.UserDTO;
import com.suabot.entity.UserEntity;

@Component
public class UserConvert {
	public UserDTO toDTO(UserEntity userEntity) {
		UserDTO userDTO = new UserDTO();
		userDTO.setId(userEntity.getId());
		userDTO.setUserName(userEntity.getUserName());
		userDTO.setPassWord(userEntity.getPassWord());
		userDTO.setFullName(userEntity.getFullName());
		userDTO.setStatus(userEntity.getStatus());
		userDTO.setDiaChi(userEntity.getDiaChi());
		userDTO.setGioiTinh(userEntity.getGioiTinh());
		userDTO.setEmail(userEntity.getEmail());
		userDTO.setDateOfBirth(userEntity.getDateOfBirth());
		userDTO.setPhone(userEntity.getPhone());
		userDTO.setAvartar(userEntity.getAvatar());
		;
		return userDTO;
		
	}
	public UserDTO toDTOHaveRole(UserEntity userEntity,String role) {
		UserDTO userDTO = new UserDTO();
		userDTO.setId(userEntity.getId());
		userDTO.setUserName(userEntity.getUserName());
		userDTO.setPassWord(userEntity.getPassWord());
		userDTO.setFullName(userEntity.getFullName());
		userDTO.setStatus(userEntity.getStatus());
		userDTO.setDiaChi(userEntity.getDiaChi());
		userDTO.setGioiTinh(userEntity.getGioiTinh());
		userDTO.setEmail(userEntity.getEmail());
		userDTO.setDateOfBirth(userEntity.getDateOfBirth());
		userDTO.setPhone(userEntity.getPhone());
		userDTO.setAvartar(userEntity.getAvatar());
		userDTO.setRole(role);
		return userDTO;
		
	}
	public UserEntity toEntity(UserDTO userDTO) {
		UserEntity  userEntity = new UserEntity();
		userEntity.setUserName(userDTO.getUserName());
		userEntity.setPassWord(userDTO.getPassWord());
		userEntity.setFullName(userDTO.getFullName());
		userEntity.setStatus(userDTO.getStatus());
		userEntity.setDiaChi(userDTO.getDiaChi());
		userEntity.setGioiTinh(userDTO.getGioiTinh());
		userEntity.setEmail(userDTO.getEmail());
		userEntity.setDateOfBirth(userDTO.getDateOfBirth());
		userEntity.setPhone(userDTO.getPhone());
		userEntity.setAvatar(userDTO.getAvartar());
		return userEntity;
		
	}
	public UserEntity oldToNew(UserEntity userEntity,UserDTO userDTO) {
		
		userEntity.setUserName(userDTO.getUserName());
		userEntity.setPassWord(userDTO.getPassWord());
		userEntity.setFullName(userDTO.getFullName());
		userEntity.setStatus(userDTO.getStatus());
		userEntity.setDiaChi(userDTO.getDiaChi());
		userEntity.setGioiTinh(userDTO.getGioiTinh());
		userEntity.setEmail(userDTO.getEmail());
		userEntity.setDateOfBirth(userDTO.getDateOfBirth());
		userEntity.setPhone(userDTO.getPhone());
		userEntity.setAvatar(userDTO.getAvartar());
		return userEntity;
		
	}
}

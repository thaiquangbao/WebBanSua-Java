package com.suabot.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.suabot.constant.SystemConstant;
import com.suabot.dto.MyUser;
import com.suabot.entity.RoleEntity;
import com.suabot.entity.UserEntity;
import com.suabot.repository.UserRepository;
@Service
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findOneByUserNameAndStatus(username, SystemConstant.ACTIVE_STATUS);
		if (userEntity == null) { // Nếu như tài khoản bị sai
			throw new UsernameNotFoundException("USER not exist");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(RoleEntity role : userEntity.getRoles())
		{
			authorities.add(new SimpleGrantedAuthority(role.getCode()));
		}
		// put thông tin vào security duy trì thông báo khi user login vào hệ thống
		MyUser myUser = new MyUser(userEntity.getUserName(), userEntity.getPassWord(), true, true, true, true, authorities);
		
		myUser.setFullName(userEntity.getFullName());
		myUser.setDateOfBirth(userEntity.getDateOfBirth());
		myUser.setDiaChi(userEntity.getDiaChi());
		myUser.setEmail(userEntity.getEmail());
		myUser.setPhone(userEntity.getPhone());
		myUser.setGioiTinh(userEntity.getGioiTinh());
		myUser.setAvatar(userEntity.getAvatar());
		return myUser;
	}

}

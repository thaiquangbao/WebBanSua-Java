package com.suabot.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.suabot.Convert.HoaDonConvert;
import com.suabot.Convert.UserConvert;
import com.suabot.dto.HoaDonDTO;
import com.suabot.dto.UserDTO;
import com.suabot.entity.ChiTietHoaDonEntity;
import com.suabot.entity.HoaDonEntity;
import com.suabot.entity.RoleEntity;
import com.suabot.entity.UserEntity;
import com.suabot.repository.ChiTietHoaDonRepository;
import com.suabot.repository.HoaDonRepository;
import com.suabot.repository.RoleRepository;
import com.suabot.repository.UserRepository;
import com.suabot.service.IUserService;
import java.security.SecureRandom;
@Service
public class UserService implements IUserService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired 
	private UserConvert userConvert;
	
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private HoaDonRepository hoaDonRepository;
	@Autowired
	private HoaDonConvert hoaDonConvert;
	@Autowired
	private ChiTietHoaDonRepository chiTietHoaDonRepository;
	@Override
	public List<UserDTO> findAll() {
		List<UserDTO> models = new ArrayList<>();
		List<UserEntity> userEntity = userRepository.findAll();
		for (UserEntity user : userEntity) {
			if (!user.isDeleted()) {
				UserDTO userDTO = userConvert.toDTO(user);
				String role= testRoles(user.getUserName());
				if (role != null) {
					if (role.equals("[ADMIN]")) {
						userDTO.setRole("ADMIN");
					}
					else {
						userDTO.setRole("KHÁCH HÀNG");
					}
				}
				

				models.add(userDTO);
			}
		}
		return models;
	}



	@Override
	public UserDTO findById(Long id) {
		UserEntity entity = userRepository.findOne(id);
		List<String> authorities = new ArrayList<>();
		
		for(RoleEntity role : entity.getRoles())
		{
			authorities.add(role.getName());
		}
		String roled = authorities.toString();
		return userConvert.toDTOHaveRole(entity, roled);
	}



	@Override
	@Transactional
	public UserDTO create(UserDTO userDTO) {
		userDTO.setPassWord(BCrypt.hashpw(userDTO.getPassWord(), BCrypt.gensalt(10)));
		
		UserEntity userEntity = userConvert.toEntity(userDTO);
		userEntity.setAvatar("https://res.cloudinary.com/dk41ftplg/image/upload/v1688965244/Teach-Node/wkz0upebb9k3danolvbc.png");
		userEntity = userRepository.save(userEntity);
		  RoleEntity role = roleRepository.findOne(2L);
		  if (role != null) {
		        userEntity.getRoles().add(role);
		        
		        userEntity = userRepository.save(userEntity); // Lưu lại để cập nhật mối quan hệ
		    }
		return userConvert.toDTO(userEntity);
	}



	@Override
	@Transactional
	public boolean deleteUse(Long id) {
		List<HoaDonEntity> list_hoadon= hoaDonRepository.findOneByUser_Id(id);
		
		list_hoadon.forEach(e ->{
			if (e.getUser().getId() == id) {
				Long id_hd = e.getId();
				List<ChiTietHoaDonEntity> list_chiTietHD = chiTietHoaDonRepository.findOneByHoaDon_Id(id_hd);
				list_chiTietHD.forEach(cthd ->{
					chiTietHoaDonRepository.delete(cthd);
				});
				hoaDonRepository.delete(e);
				
			}
		});
		userRepository.delete(id);
		return true;
	}



	@Override
	public boolean findUserName(String userName) {
		
		return userRepository.existsByUserName(userName);
	}



	
	  @Override 
	  public boolean findEmail(String email) {
	  
	  return userRepository.existsByEmail(email); }



	@Override
	@Transactional
	public UserDTO updateEmail(String username, String email) {
		UserEntity entity = userRepository.findOneByUserName(username);
		entity.setEmail(email);
		UserEntity update = userRepository.save(entity);
		
		return userConvert.toDTO(update);
	}



	@Override
	public UserDTO findOne(String userName) {
		UserEntity entity = userRepository.findOneByUserName(userName);
			
		
		return userConvert.toDTO(entity);
	}



	@Override
	@Transactional
	public UserDTO uppdateProFile(String username, UserDTO userDTO) {
		UserEntity entity = userRepository.findOneByUserName(username);
		entity.setFullName(userDTO.getFullName());
		entity.setGioiTinh(userDTO.getGioiTinh());
		entity.setDateOfBirth(userDTO.getDateOfBirth());
		entity.setDiaChi(userDTO.getDiaChi());
		entity.setPhone(userDTO.getPhone());
		UserEntity update = userRepository.save(entity);
		return userConvert.toDTO(update);
	}
	


	@Override
	@Transactional
	public UserDTO updatePassword(String username, UserDTO userDTO) {
		UserEntity entity = userRepository.findOneByUserName(username);
		
			entity.setPassWord(BCrypt.hashpw(userDTO.getPassWord(), BCrypt.gensalt(10)) );
			UserEntity update = userRepository.save(entity);
			return userConvert.toDTO(update);
		
		
	}
	


	@Override
	public boolean checkPass(String username, UserDTO userDTO) {
		UserEntity entity = userRepository.findOneByUserName(username);
		boolean checkPass = BCrypt.checkpw(userDTO.getPassWord(), entity.getPassWord());
		 if (checkPass) {
			 return true;
		 }
		 else {
			 return false;
		 }
		
	}



	@Override
	@Transactional
	public UserDTO updateIMG(String username, UserDTO userDTO) {
		UserEntity entity = userRepository.findOneByUserName(username);
		entity.setAvatar(userDTO.getAvartar());
		UserEntity update = userRepository.save(entity);
		return userConvert.toDTO(update);
	}



	@Override
	@Transactional
	public boolean deleteAvatar(long id) {
		UserEntity ma = userRepository.findOne(id);
		if (ma != null) {
			
				ma.setAvatar("https://res.cloudinary.com/dk41ftplg/image/upload/v1688965244/Teach-Node/wkz0upebb9k3danolvbc.png");
				userConvert.toDTO(userRepository.save(ma));
				return true;
			
		}
		else {
			return false;
		}
		
	}



	@Override
	@Transactional
	public void deleteAllUser(long[] ids) {
		for (long id : ids) {
			UserEntity entity = userRepository.findOne(id);
			if (entity != null) {
				entity.setDeleted(true);
				entity.setStatus(0);
				userConvert.toDTO(userRepository.save(entity));
				
			}
			
		}
		
	}



	


	@Override
	@Transactional
	public UserDTO restoreUser(Long id) {
		UserEntity entity = userRepository.findOne(id);
		if (entity != null) {
			entity.setDeleted(false);
			entity.setStatus(1);
			return userConvert.toDTO(userRepository.save(entity));
		}
		else {
			return null;
		}
	}
	@Override
	@Transactional
	public void restoreAllUser(Long[] ids) {
		for (long id : ids) {
			UserEntity entity = userRepository.findOne(id);
			if (entity != null) {
				entity.setDeleted(false);
				entity.setStatus(1);
				userConvert.toDTO(userRepository.save(entity));
				
			}
			
		}
		
	}



	@Override
	@Transactional
	public UserDTO deleteUser(long id) {
		UserEntity entity = userRepository.findOne(id);
		if (entity != null) {
			entity.setDeleted(true);
			entity.setStatus(0);
			return userConvert.toDTO(userRepository.save(entity));
		}
		else {
			return null;
		}
		
	}



	@Override
	@Transactional
	public UserDTO updateUser(Long id, UserDTO userDTO) {
		UserEntity entity = userRepository.findOne(id);
		if (entity != null) {
			entity.setFullName(userDTO.getFullName());
			entity.setGioiTinh(userDTO.getGioiTinh());
			entity.setDateOfBirth(userDTO.getDateOfBirth());
			entity.setDiaChi(userDTO.getDiaChi());
			entity.setPhone(userDTO.getPhone());
			entity.setEmail(userDTO.getEmail());
			entity.setAvatar(userDTO.getAvartar());
			UserEntity update = userRepository.save(entity);
			return userConvert.toDTO(update);
			
		}		else{
			return null;
		}
		
	}



	@Override
	@Transactional
	public void destroyAllUser(Long[] ids) {
		for (Long id : ids) {
			List<HoaDonEntity> list_hoadon= hoaDonRepository.findOneByUser_Id(id);
			
			list_hoadon.forEach(e ->{
				if (e.getUser().getId() == id) {
					Long id_hd = e.getId();
					List<ChiTietHoaDonEntity> list_chiTietHD = chiTietHoaDonRepository.findOneByHoaDon_Id(id_hd);
					list_chiTietHD.forEach(cthd ->{
						chiTietHoaDonRepository.delete(cthd);
					});
					hoaDonRepository.delete(e);
					
				}
			});
			userRepository.delete(id);
			
		}
		
	}



	@Override
	public List<UserDTO> findAllTrash() {
		List<UserDTO> models = new ArrayList<>();
		List<UserEntity> userEntity = userRepository.findAll();
		for (UserEntity user : userEntity) {
			if (user.isDeleted()) {
				UserDTO userDTO = userConvert.toDTO(user);
				String role= testRoles(user.getUserName());
				if (role != null) {
					if (role.equals("[ADMIN]")) {
						userDTO.setRole("ADMIN");
					}
					else {
						userDTO.setRole("KHÁCH HÀNG");
					}
				}
	           
				models.add(userDTO);
			}
		}
		return models;
	}



	@Override
	public int getToTal() {
		int deletedCount = userRepository.countByDeleted(true);
		
		return deletedCount;
		
	}



	@Override
	public String testRoles(String userName) {
		List<String> authorities = new ArrayList<>();
		UserEntity userEntity = userRepository.findOneByUserName(userName);
		for(RoleEntity role : userEntity.getRoles())
		{
			authorities.add(role.getCode());
		}
		return authorities.toString();
	}



	@Override
	public List<HoaDonDTO> findHoaDonDaDat(String userName) {
		List<HoaDonDTO> models = new ArrayList<>();
		List<HoaDonEntity> hoaDons = hoaDonRepository.findAll();
		for (HoaDonEntity hoaDonDTO : hoaDons) {
			String findID = hoaDonDTO.getUser().getUserName();
			if (findID.equals(userName) ) {
				HoaDonDTO hoaDon = hoaDonConvert.toDto(hoaDonDTO);
				models.add(hoaDon);
			}
		}
		return models;
	}



	@Override
	@Transactional
	public String repassword(String userName) {
	    // Kiểm tra xem user có tồn tại không
	    UserEntity entity = userRepository.findOneByUserName(userName);

	    if (entity != null) {
	        // Tạo mật khẩu mới, có thể sử dụng thư viện để tạo mật khẩu ngẫu nhiên
	        String newPassword = generateRandomPassword();

	        // Mã hóa mật khẩu mới
	        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	        String encodedPassword = passwordEncoder.encode(newPassword);

	        // Cập nhật mật khẩu mới vào đối tượng UserEntity
	        entity.setPassWord(encodedPassword);

	        // Lưu vào cơ sở dữ liệu
	        userRepository.save(entity);

	        // Trả về mật khẩu mới
	        return newPassword;
	    } else {
	        // User không tồn tại, có thể xử lý tùy ý hoặc trả về giá trị thích hợp
	        return "User không tồn tại";
	    }
	}

	private String generateRandomPassword() {
		int passwordLength = 8;

	    // Dùng java.util.Random để tạo mật khẩu ngẫu nhiên
	    String allowedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    SecureRandom random = new SecureRandom();
	    StringBuilder password = new StringBuilder(passwordLength);

	    for (int i = 0; i < passwordLength; i++) {
	        int randomIndex = random.nextInt(allowedChars.length());
	        password.append(allowedChars.charAt(randomIndex));
	    }

	    return password.toString();
	}



	@Override
	public int countDonDanhUser(long id) {
		
		List<HoaDonEntity> hoaDons = hoaDonRepository.findOneByUser_Id(id);
		
		
		return hoaDons.size();
	}



	



	
	 
}

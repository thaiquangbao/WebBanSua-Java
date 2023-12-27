package com.suabot.repository;



import org.springframework.data.jpa.repository.JpaRepository;


import com.suabot.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long>{
	// thay cho câu lệnh viết jdbc thường để lấy ra username,password và status
	UserEntity findOneByUserNameAndStatus (String username, int status);
	UserEntity findOneByUserName(String username);
	boolean existsByUserName (String userName);
	boolean existsByEmail (String email);
	int countByDeleted(boolean deleted);
}

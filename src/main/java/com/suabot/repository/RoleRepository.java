package com.suabot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.suabot.entity.RoleEntity;

public interface RoleRepository extends JpaRepository<RoleEntity, Long>{

}

package com.suabot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.suabot.entity.FeedBackEntity;

public interface FeedBackRepository  extends JpaRepository<FeedBackEntity, Long>{
	int countByDeleted(boolean deleted);
}

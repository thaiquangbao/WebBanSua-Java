package com.suabot.service;

import java.util.List;

import com.suabot.dto.FeedBackDTO;

public interface IFeedBackService {
	List<FeedBackDTO> findAll();
	List<FeedBackDTO> findAllTrash();
	FeedBackDTO create(FeedBackDTO feedBackDTO);
	FeedBackDTO update(FeedBackDTO feedBackDTO,Long id);
	FeedBackDTO findByID(Long id);
	FeedBackDTO deleteOne(Long id);
	void deleteAll(Long[] ids);
	int getTotal();
	void destroy(Long id);
	void destroyAll(Long[] ids);
	FeedBackDTO restoreOne(Long id);
	void restoreAll(Long[] ids);
}

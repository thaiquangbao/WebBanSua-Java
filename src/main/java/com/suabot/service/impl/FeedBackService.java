package com.suabot.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suabot.Convert.FeedBackConvert;
import com.suabot.dto.FeedBackDTO;
import com.suabot.entity.FeedBackEntity;
import com.suabot.entity.UserEntity;
import com.suabot.repository.FeedBackRepository;
import com.suabot.repository.UserRepository;
import com.suabot.service.IFeedBackService;
@Service
public class FeedBackService implements IFeedBackService  {
	@Autowired
	private FeedBackRepository feedBackRepository;
	@Autowired
	private FeedBackConvert feedBackConvert;
	@Autowired
	private UserRepository userRepository;

	@Override
	public List<FeedBackDTO> findAll() {
		List<FeedBackDTO> dtos = new ArrayList<>();
		List<FeedBackEntity> entities = feedBackRepository.findAll();
			for (FeedBackEntity feedBackEntity : entities) {
				if (!feedBackEntity.isDeleted()) {
					FeedBackDTO dto = feedBackConvert.toDto(feedBackEntity);
					dtos.add(dto);
				}
				
				
			}
		
		return dtos;
	}

	@Override
	public List<FeedBackDTO> findAllTrash() {
		List<FeedBackDTO> dtos = new ArrayList<>();
		List<FeedBackEntity> entities = feedBackRepository.findAll();
			for (FeedBackEntity feedBackEntity : entities) {
				if (feedBackEntity.isDeleted()) {
					FeedBackDTO dto = feedBackConvert.toDto(feedBackEntity);
					dtos.add(dto);
				}
				
				
			}
		
		return dtos;
	}

	@Override
	@Transactional
	public FeedBackDTO create(FeedBackDTO feedBackDTO) {
		
		UserEntity userEntity=userRepository.findOneByUserName(feedBackDTO.getUserName());
		FeedBackEntity feedBackEntity=feedBackConvert.toEntity(feedBackDTO, userEntity);
		FeedBackEntity add=feedBackRepository.save(feedBackEntity);
		return feedBackConvert.toDto(add);
	}

	@Override
	@Transactional
	public FeedBackDTO update(FeedBackDTO feedBackDTO, Long id) {
		FeedBackEntity old=feedBackRepository.findOne(id);
		if(old!=null) {
			UserEntity userEntity=userRepository.findOneByUserName(feedBackDTO.getUserName());
			feedBackConvert.oldToNew(feedBackDTO, old, userEntity);
			FeedBackEntity updated =feedBackRepository.save(old);
			return feedBackConvert.toDto(updated);
		}
		else {
			return null;
		}
	}

	@Override
	public FeedBackDTO findByID(Long id) {
		FeedBackEntity feedBackEntity=feedBackRepository.findOne(id);
		return feedBackConvert.toDto(feedBackEntity);
		
	}

	@Override
	@Transactional
	public FeedBackDTO deleteOne(Long id) {
		FeedBackEntity entity = feedBackRepository.findOne(id);
		if (entity != null) {
			entity.setDeleted(true);
			
			feedBackRepository.save(entity);
			return feedBackConvert.toDto(entity);
		}
		else {
			return null;
		}
	}

	@Override
	@Transactional
	public void deleteAll(Long[] ids) {
		for (long id: ids) {
			FeedBackEntity entity = feedBackRepository.findOne(id);
			entity.setDeleted(true);
			FeedBackEntity upDelete = feedBackRepository.save(entity);
			feedBackConvert.toDto(upDelete);
		}
		
	}

	@Override
	public int getTotal() {
		int deletedCount = feedBackRepository.countByDeleted(true);
		return deletedCount;
	}

	@Override
	@Transactional
	public void destroy(Long id) {
		feedBackRepository.delete(id);
		
	}

	@Override
	@Transactional
	public void destroyAll(Long[] ids) {
		for (Long id : ids) {
			feedBackRepository.delete(id);
		}
		
	}

	@Override
	@Transactional
	public FeedBackDTO restoreOne(Long id) {
		FeedBackEntity feedBackEntity = feedBackRepository.findOne(id);
		if (feedBackEntity != null) {
			feedBackEntity.setDeleted(false);
			FeedBackEntity newDeleted = feedBackRepository.save(feedBackEntity);
			return feedBackConvert.toDto(newDeleted);
		}
		else {
			return null;
		}
		
	}

	@Override
	@Transactional
	public void restoreAll(Long[] ids) {
		for (Long id : ids) {
			FeedBackEntity feedBackEntity = feedBackRepository.findOne(id);
			feedBackEntity.setDeleted(false);
			FeedBackEntity newDeleted = feedBackRepository.save(feedBackEntity);
			feedBackConvert.toDto(newDeleted);
		}
	}

}

package com.suabot.Convert;

import org.springframework.stereotype.Component;

import com.suabot.dto.FeedBackDTO;
import com.suabot.entity.FeedBackEntity;
import com.suabot.entity.UserEntity;

@Component
public class FeedBackConvert {
	public FeedBackDTO toDto(FeedBackEntity entity) {
		FeedBackDTO dto = new FeedBackDTO();
		dto.setId(entity.getId());
		dto.setNoiDung(entity.getNoiDung());
		dto.setUserID(entity.getUser().getId());
		dto.setNgayGui(entity.getNgayGui());
		dto.setUserName(entity.getUser().getUserName());
		dto.setTieuDe(entity.getTieuDe());
		dto.setDeleted(entity.isDeleted());
		return dto;
	}
	public FeedBackEntity toEntity(FeedBackDTO dto,UserEntity userEntity) {
		FeedBackEntity entity = new FeedBackEntity();
		entity.setNoiDung(dto.getNoiDung());
		entity.setUser(userEntity);
		entity.setTieuDe(dto.getTieuDe());
		entity.setNgayGui(dto.getNgayGui());
		entity.setDeleted(dto.isDeleted());
		return entity;
	}
	public FeedBackEntity oldToNew(FeedBackDTO dto,FeedBackEntity entity,UserEntity userEntity) {
		entity.setNoiDung(dto.getNoiDung());
		entity.setUser(userEntity);
		entity.setTieuDe(dto.getTieuDe());
		entity.setNgayGui(dto.getNgayGui());
		entity.setDeleted(dto.isDeleted());
		return entity;
	}
}

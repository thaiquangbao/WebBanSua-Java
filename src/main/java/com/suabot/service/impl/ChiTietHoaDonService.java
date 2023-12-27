package com.suabot.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suabot.Convert.ChiTietHoaDonConvert;
import com.suabot.dto.ChiTietHoaDonDTO;
import com.suabot.entity.ChiTietHoaDonEntity;
import com.suabot.entity.HoaDonEntity;
import com.suabot.entity.ProductEntity;
import com.suabot.repository.ChiTietHoaDonRepository;
import com.suabot.repository.HoaDonRepository;
import com.suabot.repository.ProductRepository;
import com.suabot.service.IChiTietHoaDonService;
@Service
public class ChiTietHoaDonService implements IChiTietHoaDonService{
	@Autowired
	private ChiTietHoaDonRepository chiTietHoaDonRepository;
	@Autowired
	private ChiTietHoaDonConvert chiTietHoaDonConvert;
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private HoaDonRepository hoaDonRepository;
	
	@Override
	public List<ChiTietHoaDonDTO> findAll() {
		List<ChiTietHoaDonDTO> models = new ArrayList<>();
		List<ChiTietHoaDonEntity> entities = chiTietHoaDonRepository.findAll();
		for (ChiTietHoaDonEntity chiTietHoaDonEntity : entities) {
			if (!chiTietHoaDonEntity.isDeleted()) {
				ChiTietHoaDonDTO chiTietHoaDonDTO = chiTietHoaDonConvert.toDto(chiTietHoaDonEntity);
				models.add(chiTietHoaDonDTO);
			}
		}
		return models;
	}

	@Override
	public List<ChiTietHoaDonDTO> findAllTrash() {
		List<ChiTietHoaDonDTO> models = new ArrayList<>();
		List<ChiTietHoaDonEntity> entities = chiTietHoaDonRepository.findAll();
		for (ChiTietHoaDonEntity chiTietHoaDonEntity : entities) {
			if (chiTietHoaDonEntity.isDeleted()) {
				ChiTietHoaDonDTO chiTietHoaDonDTO = chiTietHoaDonConvert.toDto(chiTietHoaDonEntity);
				models.add(chiTietHoaDonDTO);
			}
		}
		return models;
	}

	@Override
	@Transactional
	public ChiTietHoaDonDTO create(ChiTietHoaDonDTO chiTietHoaDonDTO) {
		HoaDonEntity hoaDon = hoaDonRepository.findOne(chiTietHoaDonDTO.getHoaDonID());
		ProductEntity product=productRepository.findOne(chiTietHoaDonDTO.getProductID());
		ChiTietHoaDonEntity chiTietHoaDonEntity=chiTietHoaDonConvert.toEntity(chiTietHoaDonDTO,product, hoaDon);
		ChiTietHoaDonEntity add= chiTietHoaDonRepository.save(chiTietHoaDonEntity);
		return chiTietHoaDonConvert.toDto(add);
	}

	@Override
	@Transactional
	public ChiTietHoaDonDTO update(ChiTietHoaDonDTO chiTietHoaDonDTO, Long id) {
		ChiTietHoaDonEntity old = chiTietHoaDonRepository.findOne(id);
		if (old != null) {
			HoaDonEntity hoaDonEntity=hoaDonRepository.findOne(chiTietHoaDonDTO.getHoaDonID());
			ProductEntity productEntity=productRepository.findOne(chiTietHoaDonDTO.getProductID());
			chiTietHoaDonConvert.oldToNew(old, chiTietHoaDonDTO, hoaDonEntity, productEntity);
			ChiTietHoaDonEntity updated = chiTietHoaDonRepository.save(old);
			return chiTietHoaDonConvert.toDto(updated);
		}
		else {
			return null;
		}
	}

	@Override
	public ChiTietHoaDonDTO findByID(Long id) {
		ChiTietHoaDonEntity chiTietHoaDonEntity=chiTietHoaDonRepository.findOne(id);
		return chiTietHoaDonConvert.toDto(chiTietHoaDonEntity);
	}

	@Override
	@Transactional
	public ChiTietHoaDonDTO deleteOne(Long id) {
		ChiTietHoaDonEntity chiTietHoaDonEntity=chiTietHoaDonRepository.findOne(id);
		if (chiTietHoaDonEntity !=null) {
			chiTietHoaDonEntity.setDeleted(true);
			return chiTietHoaDonConvert.toDto(chiTietHoaDonRepository.save(chiTietHoaDonEntity));
		} else {
			return null;
		}
	}

	@Override
	@Transactional
	public void deleteAll(Long[] ids) {
		for (Long long1 : ids) {
			ChiTietHoaDonEntity entity=chiTietHoaDonRepository.findOne(long1);
			entity.setDeleted(true);
			chiTietHoaDonConvert.toDto(chiTietHoaDonRepository.save(entity));
		}
		
	}

	@Override
	public int getTotal() {
		int deletedCount = chiTietHoaDonRepository.countByDeleted(true);
		return deletedCount;
	}

	@Override
	@Transactional
	public int destroy(Long id) {
		ChiTietHoaDonEntity entity = chiTietHoaDonRepository.findOne(id);
		if (entity!=  null) {
			long idHD = entity.getHoaDon().getId();
			
			if (entity.getHoaDon().getId() != 0) {
				hoaDonRepository.delete(entity.getHoaDon().getId());
			}
			chiTietHoaDonRepository.delete(id);
			return 200;
		}
		else {
			return 500;
		}
	}

	@Override
	@Transactional
	public void destroyAll(Long[] ids) {
		for (Long id : ids) {
			ChiTietHoaDonEntity entity = chiTietHoaDonRepository.findOne(id);
			if (entity != null) {
				chiTietHoaDonRepository.delete(id);
			}
			else {
				System.out.println("Không tìm thấy sản phẩm" + entity);
			}
		}
		
	}

	@Override
	@Transactional
	public void restoreOne(Long id) {
		ChiTietHoaDonEntity entity = chiTietHoaDonRepository.findOne(id);
		if (entity != null) {
			entity.setDeleted(false);
			chiTietHoaDonConvert.toDto(chiTietHoaDonRepository.save(entity));
		}
		
		
	}

	@Override
	@Transactional
	public void restoreAll(Long[] ids) {
		for (Long id : ids) {
			ChiTietHoaDonEntity entity = chiTietHoaDonRepository.findOne(id);
			entity.setDeleted(false);
			chiTietHoaDonConvert.toDto(chiTietHoaDonRepository.save(entity));
		}
		
	}

	

}

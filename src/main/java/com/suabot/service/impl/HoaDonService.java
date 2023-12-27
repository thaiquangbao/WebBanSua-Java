package com.suabot.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suabot.Convert.HoaDonConvert;
import com.suabot.dto.HoaDonDTO;
import com.suabot.entity.ChiTietHoaDonEntity;
import com.suabot.entity.HoaDonEntity;
import com.suabot.entity.ProductEntity;
import com.suabot.entity.UserEntity;
import com.suabot.repository.ChiTietHoaDonRepository;
import com.suabot.repository.HoaDonRepository;
import com.suabot.repository.ProductRepository;
import com.suabot.repository.UserRepository;
import com.suabot.service.IHoaDonService;
@Service
public class HoaDonService implements IHoaDonService{
	@Autowired
	private HoaDonRepository hoaDonRepository;
	@Autowired
	private HoaDonConvert hoaDonConvert;

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ChiTietHoaDonRepository chiTietHoaDonRepository;
	@Autowired
	private ProductRepository productRepository;
	@Override
	public List<HoaDonDTO> findAll() {
		List<HoaDonDTO> models = new ArrayList<>();
		List<HoaDonEntity> entities = hoaDonRepository.findAll();
		for (HoaDonEntity hoaDonEntity : entities) {
			if (!hoaDonEntity.isDeleted()) {
				HoaDonDTO hoaDonDTO = hoaDonConvert.toDto(hoaDonEntity);
				models.add(hoaDonDTO);
			}
		}
		return models;
	}

	@Override
	public List<HoaDonDTO> findAllTrash() {
		List<HoaDonDTO> models = new ArrayList<>();
		List<HoaDonEntity> entities = hoaDonRepository.findAll();
		for (HoaDonEntity hoaDonEntity : entities) {
			if (hoaDonEntity.isDeleted()) {
				HoaDonDTO hoaDonDTO = hoaDonConvert.toDto(hoaDonEntity);
				models.add(hoaDonDTO);
			}
		}
		return models;
	}

	@Override
	@Transactional
	public HoaDonDTO create(HoaDonDTO hoaDonDTO) {
		
		UserEntity user=userRepository.findOne(hoaDonDTO.getUserID());
		hoaDonDTO.setTrangThai("Chờ xác nhận");
		HoaDonEntity hoaDonEntity=hoaDonConvert.toEntity(hoaDonDTO,  user);
		HoaDonEntity add=hoaDonRepository.save(hoaDonEntity);
	return hoaDonConvert.toDto(add);
	}

	@Override
	@Transactional
	public HoaDonDTO update(HoaDonDTO hoaDonDTO, Long id) {
		HoaDonEntity old = hoaDonRepository.findOne(id);
		if (old != null) {
			
			UserEntity user=userRepository.findOne(hoaDonDTO.getUserID());
			hoaDonConvert.oldtoNew(hoaDonDTO, old,  user);
			HoaDonEntity updated = hoaDonRepository.save(old);
			return hoaDonConvert.toDto(updated);
		}
		else {
			return null;
		}
	}

	@Override
	public HoaDonDTO findByID(Long id) {
		HoaDonEntity hoaDonEntity=hoaDonRepository.findOne(id);
		return hoaDonConvert.toDto(hoaDonEntity);
	}

	@Override
	@Transactional
	public HoaDonDTO deleteOne(Long id) {
		HoaDonEntity hoaDonEntity=hoaDonRepository.findOne(id);
		if (hoaDonEntity !=null) {
			hoaDonEntity.setDeleted(true);
			return hoaDonConvert.toDto(hoaDonRepository.save(hoaDonEntity));
		} else {
			return null;
		}
	}

	@Override
	@Transactional
	public void deleteAll(Long[] ids) {
		for (Long long1 : ids) {
			HoaDonEntity entity=hoaDonRepository.findOne(long1);
			entity.setDeleted(true);
			hoaDonConvert.toDto(hoaDonRepository.save(entity));
		}
	}

	@Override
	public long getTotal() {
		long deletedCount = hoaDonRepository.count();
		return deletedCount;
	}

	@Override
	@Transactional
	public int destroy(Long id) {
		HoaDonEntity hoaDonEntity = hoaDonRepository.findOne(id);
	    if (hoaDonEntity != null) {
	        List<ChiTietHoaDonEntity> chiTietHoaDonEntities = chiTietHoaDonRepository.findOneByHoaDon_Id(id);
	        if (!chiTietHoaDonEntities.isEmpty()) {
	            for (ChiTietHoaDonEntity chiTietHoaDonEntity : chiTietHoaDonEntities) {
	                chiTietHoaDonRepository.delete(chiTietHoaDonEntity);
	            }
	            hoaDonRepository.delete(hoaDonEntity);
	        }
	        
	        return 200; // Trạng thái xóa thành công
	    } else {
	        return 500; 
	    }
	}

	@Override
	@Transactional
	public void destroyAll(Long[] ids) {
		for (Long id : ids) {
			HoaDonEntity hoaDonEntity = hoaDonRepository.findOne(id);
		    if (hoaDonEntity != null) {
		        List<ChiTietHoaDonEntity> chiTietHoaDonEntities = chiTietHoaDonRepository.findOneByHoaDon_Id(id);
		        if (!chiTietHoaDonEntities.isEmpty()) {
		            for (ChiTietHoaDonEntity chiTietHoaDonEntity : chiTietHoaDonEntities) {
		                chiTietHoaDonRepository.delete(chiTietHoaDonEntity);
		            }
		        }
		        hoaDonRepository.delete(hoaDonEntity);
		        
		    }
		}
	}

	@Override
	@Transactional
	public void restoreOne(Long id) {
		HoaDonEntity entity = hoaDonRepository.findOne(id);
		if (entity != null) {
			entity.setDeleted(false);
			hoaDonConvert.toDto(hoaDonRepository.save(entity));
		}
	}

	@Override
	@Transactional
	public void restoreAll(Long[] ids) {
		for (Long id : ids) {
			HoaDonEntity entity = hoaDonRepository.findOne(id);
			entity.setDeleted(false);
			hoaDonConvert.toDto(hoaDonRepository.save(entity));
		}	
		}

	@Override
	@Transactional
	public HoaDonDTO createhoaDon(String[] tenProducts,String userName) {
		
		return null;
	}

	@Override
	@Transactional
	public void xacNhan(Long id) {
		HoaDonEntity entity = hoaDonRepository.findOne(id);
		if (entity != null) {
			entity.setTrangThai("Đã xác nhận");
			hoaDonRepository.save(entity);
		}
		
	}

	@Override
	public long countNameUser() {
		
		return userRepository.count();
	}

	@Override
	public long countDaDuyet() {
		long soDon = hoaDonRepository.countByTrangThai("Đã xác nhận");
		
		return soDon;
	}

	@Override
	public long countChuaDuyet() {
		// TODO Auto-generated method stub
		return hoaDonRepository.countByTrangThai("Chờ xác nhận");
	}

	@Override
	public long tongDoanhthu() {
		List<HoaDonEntity> hoaDons = hoaDonRepository.findAll();
		long tong = 0;
		for (HoaDonEntity hoaDonEntity : hoaDons) {
			if (hoaDonEntity.getTrangThai().equals("Đã xác nhận")) {
				int tongTien = hoaDonEntity.getTongTien();
				tong +=	tongTien;
			}
		}
		return tong;
	}



	@Override
	public long countHangTon() {
		List<ProductEntity> products = productRepository.findAll();
		long tongSPCB = 0;
		for (ProductEntity productEntity : products) {
			tongSPCB += productEntity.getSoLuong();
		}
		return tongSPCB;
	}

	@Override
	public long soSanPhamDaBan() {
		List<ProductEntity> products = productRepository.findAll();
		long tongSPDB = 0;
		for (ProductEntity productEntity : products) {
			tongSPDB += productEntity.getDaBan();
		}
		return tongSPDB;
	}
}

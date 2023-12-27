package com.suabot.controller.guess;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suabot.dto.CategoryDTO;
import com.suabot.dto.ProductDTO;
import com.suabot.service.ICategoryService;
import com.suabot.service.IProductService;

@Controller(value = "sanPhamControllerGuest")
public class SanPhamController {
	@Autowired
	private IProductService productService;
	@Autowired
	private ICategoryService categoryService;
	@RequestMapping(value = "/guest/sanpham", method = RequestMethod.GET)
	   public ModelAndView homePage(@ModelAttribute("modelProduct") ProductDTO productDTO,@ModelAttribute("modelCate") CategoryDTO categoryDTO ) {
	      ModelAndView mav = new ModelAndView("guest/sanpham/sanpham");
	      
	      List<Map<String, Object>> maps = new ArrayList<>();
	      categoryService.findAll().forEach(item -> {
	    	  Map<String,Object> map = new HashMap<>();
	    	  List<ProductDTO> productsDtos = new ArrayList<>();
	    	  productService.findAll().forEach(p -> {
	    		  if (item.getId() == p.getCategoryID()) {
	    			  productsDtos.add(p);
	    		  }
	    	  });
	    	  map.put("cate_id", item.getId());
	    	  map.put("cate_name", item.getCategoryName());
	    	  map.put("cate_banner", item.getAnhBanner());
	    	  map.put("list_product", productsDtos);
	    	  maps.add(map);
	    	  
	      });
	      
	      mav.addObject("listProductByCate", maps);


	      return mav;
	   }
	@RequestMapping(value = "/guest/sanpham/{tenProduct}", method = RequestMethod.GET)
	   public ModelAndView chiTietSanPhamPage(@ModelAttribute("modelProduct") ProductDTO productDTO,@PathVariable String tenProduct) {
	      ModelAndView mav = new ModelAndView("guest/chiTietSanPham");
	       ProductDTO product= productService.findNameProduct(productDTO.getTenProduct());
	      mav.addObject("modelProduct", product);
	     

	      return mav;
	   }

}

package com.suabot.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.suabot.dto.FeedBackDTO;
import com.suabot.service.IFeedBackService;

@RestController(value = "feedbackAPI")
public class FeedBackAPI {
	@Autowired
	private IFeedBackService feedBackService;

	@PostMapping(value = "/admin/feedback/create")
	public FeedBackDTO createFeedBack(@RequestBody FeedBackDTO feedBackDTO) {
		FeedBackDTO createFB=feedBackService.create(feedBackDTO);
		return createFB;
		
		
	}
	@PostMapping(value = "/feedback/create")
	public FeedBackDTO createFeedBackU(@RequestBody FeedBackDTO feedBackDTO) {
		FeedBackDTO createFB=feedBackService.create(feedBackDTO);
		return createFB;
		
		
	}
	@PutMapping(value = "/admin/feedback/{id}/update")
	public FeedBackDTO updateFeedBack(@RequestBody FeedBackDTO feedBackDTO,@PathVariable Long id) {
		FeedBackDTO update = feedBackService.update(feedBackDTO, id);
		return update;
	}
	@PatchMapping(value = "/admin/feedback/deleteFB/{id}")
	public FeedBackDTO deleteFeedBack(@PathVariable Long id) {
		return feedBackService.deleteOne(id);
	}
	@PatchMapping(value = "/admin/feedback/deleteAllFB")
	public void deleteAllFeedBack(@RequestBody Long[] ids) {
		feedBackService.deleteAll(ids);
	}
	@PatchMapping(value = "/admin/feedback/restoreFB/{id}")
	public FeedBackDTO restoreFeedBack(@PathVariable Long id) {
		return feedBackService.restoreOne(id);
		
	}
	@PatchMapping(value = "/admin/feedback/restoreAllFB")
	public void restoreAllFeedBack(@RequestBody Long[] ids) {
		feedBackService.restoreAll(ids);
	}
	@DeleteMapping(value = "/admin/feedback/destroyFB/{id}")
	public void destroyFeedBack(@PathVariable Long id) {
		feedBackService.destroy(id);
	}
	@DeleteMapping(value = "/admin/feedback/destroyAllFB")
	public void destroyAllFeedBack(@RequestBody Long[] ids) {
		feedBackService.destroyAll(ids);
	}
}

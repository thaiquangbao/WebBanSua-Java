package com.suabot.security;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.suabot.until.SecurityUntil;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	// xử lý sau khi đăng nhập thành công thì sẽ phân quyền
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {
		String targetUrl = determineTargetUrl(authentication); // định tuyến (route)
		if (response.isCommitted()) {
			return;
		}
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}
	private String determineTargetUrl(Authentication authentication) {
		String url = "";
		// redirect tới trang web tùy thuộc vào role
		List<String> roles = SecurityUntil.getAuthorities();
		if (isAdmin(roles)) {
			url = "/admin/trang-chu";
		}
		else if(isUser(roles)){
			url = "/trang-chu";
		}
		return url;
	}
	public RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}
	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}
	private boolean isAdmin(List<String> roles)
	{
		if (roles.contains("ADMIN")) {
			return true;
		}
		return false;
	}
	private boolean isUser(List<String> roles)
	{
		if (roles.contains("USER")) {
			return true;
		}
		return false;
	}
}

package com.v1.tourapp.security;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class LoginFilter implements Filter {

    @Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void destroy() {
	}
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        
        boolean isLoggedIn = (session != null && session.getAttribute("userName") != null);

        String path = req.getRequestURI();

        List<String> publicUrls = Arrays.asList(
                req.getContextPath()+"",
                req.getContextPath()+"/",
                req.getContextPath()+"/dashboard",
                req.getContextPath()+"/dashboard/",
                req.getContextPath()+"/dashboard/login",
                req.getContextPath()+"/dashboard/package-details",
                req.getContextPath()+"/api/login",
                req.getContextPath()+"/dashboard/home",
                req.getContextPath()+"/dashboard/blog-list",
                req.getContextPath()+"/static",
                req.getContextPath()+"/api/get-all-categories",
                req.getContextPath()+"/api/get-all-packages",
                req.getContextPath()+"/api/save-package-inquiry",
                req.getContextPath()+"/api/get-all-activities-by-packageId",
                req.getContextPath()+"/api/get-packages-by-id",
                req.getContextPath()+"/dashboard/package-list"
        );

        boolean isPublic = publicUrls.stream().anyMatch(path::startsWith);

        if (!isLoggedIn && !isPublic) {
            res.sendRedirect(req.getContextPath() + "/dashboard/login");
            return;
        }
        chain.doFilter(request, response);
    }
}

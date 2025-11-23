package com.v1.tourapp.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        
        boolean isLoggedIn = (session != null && session.getAttribute("userName") != null);

        String path = req.getRequestURI();

        boolean isPublic = path.contains("login") 
                        || path.contains("static")
                        || path.contains("home");

        // if(path.contains("logout")){
        //     res.sendRedirect(req.getContextPath() + "/dashboard/home");
        //     return;
        // }
        if (!isLoggedIn && !isPublic) {
            res.sendRedirect(req.getContextPath() + "/dashboard/login");
            return;
        }

        chain.doFilter(request, response);
    }
}

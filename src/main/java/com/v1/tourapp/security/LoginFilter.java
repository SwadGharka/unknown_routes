// package com.v1.tourapp.security;

// import java.io.IOException;
// import java.util.Arrays;
// import java.util.List;
// import javax.servlet.Filter;
// import javax.servlet.FilterChain;
// import javax.servlet.FilterConfig;
// import javax.servlet.ServletException;
// import javax.servlet.ServletRequest;
// import javax.servlet.ServletResponse;
// import javax.servlet.annotation.WebFilter;
// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
// import javax.servlet.http.HttpSession;

// @WebFilter("/*")
// public class LoginFilter implements Filter {

//     @Override
// 	public void init(FilterConfig filterConfig) throws ServletException {

// 	}

// 	@Override
// 	public void destroy() {
// 	}
    
//     @Override
//     public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//             throws IOException, ServletException {

//         HttpServletRequest req = (HttpServletRequest) request;
//         HttpServletResponse res = (HttpServletResponse) response;

//         HttpSession session = req.getSession(false);
        
//         boolean isLoggedIn = (session != null && session.getAttribute("userName") != null);

//         String path = req.getRequestURI();

//         List<String> publicUrls = Arrays.asList(
//                 "/dashboard/login",
//                     "/dashboard/package-details",
//                     "/api/login",
//                     "/dashboard/home",
//                     "/static",
//                     "/api/get-all-categories",
//                     "/api/get-all-packages",
//                     "/api/save-package-inquiry",
//                     "/api/get-all-activities-by-packageId",
//                     "/api/get-packages-by-id"
//         );
//         if (path.contains("WEB-INF") || path.contains("/static") || path.endsWith(".jsp")) {
//             chain.doFilter(request, response);
//             return;
//         }
//         boolean isPublic = publicUrls.stream().anyMatch(path::contains);

//         if (!isLoggedIn && !isPublic) {
//             res.sendRedirect(req.getContextPath() + "/dashboard/login");
//             return;
//         }
//         chain.doFilter(request, response);
//     }
// }

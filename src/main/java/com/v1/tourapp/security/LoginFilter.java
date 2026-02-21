// package com.v1.tourapp.security;

// import java.io.IOException;
// import java.util.Arrays;
// import java.util.HashSet;
// import java.util.List;
// import java.util.Set;

// import jakarta.servlet.Filter;
// import jakarta.servlet.FilterChain;
// import jakarta.servlet.FilterConfig;
// import jakarta.servlet.ServletException;
// import jakarta.servlet.ServletRequest;
// import jakarta.servlet.ServletResponse;
// import jakarta.servlet.annotation.WebFilter;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import jakarta.servlet.http.HttpSession;

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

//         String contextPath = req.getContextPath();
//         String path = req.getRequestURI();
//         String appPath = path.startsWith(contextPath) ? path.substring(contextPath.length()) : path;

//         Set<String> publicExactUrls = new HashSet<>(Arrays.asList(
//                 "/dashboard/login",
//                 "/dashboard/package-details",
//                 "/api/login",
//                 "/dashboard/home",
//                 "/dashboard/error",
//                 "/api/get-all-categories",
//                 "/api/get-all-packages",
//                 "/api/save-package-inquiry",
//                 "/api/get-all-activities-by-packageId",
//                 "/api/get-packages-by-id"
//         ));

//         List<String> publicPrefixes = Arrays.asList(
//                 "/dashboard/view-blog/",
//                 "/attachments/",
//                 "/static/"
//         );

//         boolean isPublic = publicExactUrls.contains(appPath)
//                 || publicPrefixes.stream().anyMatch(appPath::startsWith);
//         // if(!isPublic){
//         //     res.sendRedirect(req.getContextPath() + "/dashboard/error");
//         //     return;
//         // }
//         if (!isLoggedIn && !isPublic) {

//             String ajaxHeader = req.getHeader("X-Requested-With");
//             boolean isAjax = "XMLHttpRequest".equals(ajaxHeader);

//             if (isAjax) {

//                 res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
//                 res.setContentType("application/json");
//                 res.setCharacterEncoding("UTF-8");

//                 res.getWriter().write(
//                     "{\"status\":401,\"message\":\"Session Expired\"}"
//                 );
//                 return;

//             } else {

//                 res.sendRedirect(req.getContextPath() + "/dashboard/login");
//                 return;
//             }
//         }
//         chain.doFilter(request, response);
//     }
// }

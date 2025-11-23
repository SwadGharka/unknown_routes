package com.v1.tourapp.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Component
public class SessionUtil {
    public static HttpServletRequest getServletRequest() {
		try{
			RequestAttributes attribs = RequestContextHolder.getRequestAttributes();
			if (attribs instanceof NativeWebRequest) {
				HttpServletRequest request = (HttpServletRequest) ((NativeWebRequest) attribs).getNativeRequest();
				return request;
			}else{
				ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
				return attr.getRequest();
			}
		}catch(Exception e){

		}
		return null;
	}

    public String getContextPath(HttpServletRequest req ) {
		try {
			String contextPath = req.getContextPath();
			return contextPath + "/";
		} catch (Exception e) {
			return "/";
		}
	}

	public String getContextPath() {
		try {
			HttpServletRequest req = getServletRequest();
			return getContextPath(req);
		} catch (Exception e) {
			return "/";
		}
	}

    public String getBaseUrl(HttpServletRequest req ) {
		if(req!=null){
			String scheme = req.getScheme();
			String serverName = req.getServerName();
			if(serverName.contains("ngrok") || serverName.contains("staging") ){
				scheme="https";
			}
            int serverPort = req.getServerPort();
			return scheme + "://"+ serverName + ":" + serverPort;
		}
		return StringUtils.EMPTY;
	}

	public String getBaseUrl() {
		HttpServletRequest req = getServletRequest();
		return getBaseUrl(req);
	}

    public String getBaseUrlWithContextPath(){
        HttpServletRequest req = getServletRequest();
        return getBaseUrl(req)+getContextPath(req);
    }

	public HttpSession getSession() {
		return getServletRequest().getSession(true);
	}
}

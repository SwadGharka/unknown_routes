<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${title eq "" || title eq null ? "OOO Trips Blogs" : title}</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/viewBlog.css">
        <meta name="keywords" content="${seoTags.keyword!=null?seoTags.keyword:'Tour and Trip'}" />
        <meta name="description" content="${seoTags.description!=null?seoTags.description:'Tour and trip'}">
        <%@ include file="../common/commonScript.jsp" %>
        <style>
            .container-fluid{
                padding: 13px 20px;
                background: linear-gradient(135deg, #667eeaab, #764ba29e);
            }
        </style>
    </head>
    <body>
        <div class="blog-page" style="margin-top: 5%;">
            <div class="header">
                <%@ include file="../header.jsp"%>
            </div>
            <c:if test="${not empty blog.coverImage}">
                <div class="blog-cover">
                    <img src="${blog.coverImage}" alt="${blog.title}">
                </div>
            </c:if>

            <article class="blog-article">
                <h1 class="blog-title">${blog.title}</h1>
                <div class="blog-meta">
                    <span>OOO Trips</span>
                    <span>•</span>
                    <span>${blog.publishedAt}</span>
                </div>
                <c:if test="${not empty blog.excerpt}">
                    <p class="blog-excerpt">${blog.excerpt}</p>
                </c:if>
                <div class="blog-content">
                    <c:out value="${blog.content}" escapeXml="false"/>
                </div>
            </article>
        </div>

    </body>
</html>
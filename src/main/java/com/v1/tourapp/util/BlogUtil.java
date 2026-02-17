package com.v1.tourapp.util;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.Date;
import java.util.UUID;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.v1.tourapp.entity.Blog;
import com.v1.tourapp.service.BlogService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BlogUtil {
    

    @Value("${BLOG_FILE_UPLOAD}")
    private String BLOG_FILE_UPLOAD;

    @Value("${DEVELOPMENT_MODE}")
    private String DEVELOPMENT_MODE;

    @Autowired
    BlogService blogService;

    @Autowired
    SessionUtil sessionUtil;

    public JSONObject saveBlog(String payload) {
        JSONObject response = new JSONObject();
        try {
            JSONObject request = new JSONObject(payload);
            String title = request.optString("title");
            String slug = request.optString("slug");
            String excerpt = request.optString("excerpt");
            String content = request.optString("content");
            String status = request.optString("status");
            Integer blogId = request.optInt("blogId");
            String coverImageUrl = request.optString("coverImageUrl");
            Blog blog = null;
            boolean isUpdate = ValidatorUtil.isValid(blogId);

            if (isUpdate) {
                blog = blogService.getBlogById(blogId);

                if (blog == null) {
                    response.put("status", 0);
                    response.put("message", "Blog not found");
                    return response;
                }

                if (!blog.getSlug().equalsIgnoreCase(slug)
                        && blogService.isSlugExists(slug)) {

                    response.put("status", 0);
                    response.put("message", "Blog slug already exists");
                    return response;
                }

            } else {
                // create new blog
                if (blogService.isSlugExists(slug)) {
                    response.put("status", 0);
                    response.put("message", "Blog slug already exists");
                    return response;
                }
                blog = new Blog();
            }

            blog.setTitle(title);
            blog.setSlug(slug);
            blog.setExcerpt(excerpt);
            blog.setContent(content);
            blog.setStatus(status);
            blog.setCoverImage(coverImageUrl);
            if(status.equalsIgnoreCase("published")){
                blog.setPublishedAt(new Date());
            }
            blogService.save(blog);
            response.put("status", 1);
            response.put("message", "Blog added successfully");
        } catch (Exception e) {
            log.info("Exception cought in saveBlog ::", e);
            response.put("status", 0);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    }

    public JSONObject checkSlugIsExist(String payload) {
        JSONObject response = new JSONObject();
        try {
            JSONObject request = new JSONObject(payload);
            String slug = request.optString("slug");
            if (blogService.isSlugExists(slug)) {
                response.put("slug", true);
            }else {
                response.put("slug", false);
            }
            response.put("status", 1);
            response.put("message", "slug found successfully");
        } catch (Exception e) {
            log.info("Exception cought in checkSlugIsExist ::", e);
            response.put("status", 0);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    }

    public JSONObject getAllBlogList(){
        JSONObject response = new JSONObject();
        try {
            // JSONObject request = new JSONObject(payload);
            response.put("blogList", blogService.getAllBlogList(Arrays.asList("DRAFT", "PUBLISHED")));
            response.put("status", 1);
            response.put("message", "Blog list found successfully");
        } catch (Exception e) {
            
        }
        return response;
    }

    public JSONObject updateBlogImage(MultipartFile file) {
        JSONObject response = new JSONObject();
        try {
            if (file == null || file.isEmpty()) {
                response.put("status", 0);
                response.put("message", "Attachment is empty");
                return response;
            }
            String original = file.getOriginalFilename().replaceAll("\\s+", "-").toLowerCase();

            if (!original.endsWith(".jpg") &&
                !original.endsWith(".jpeg") &&
                !original.endsWith(".png") &&
                !original.endsWith(".webp")) {

                response.put("status", 0);
                response.put("message", "Invalid file type");
                return response;
            }

            long maxSize = 5 * 1024 * 1024;
            if (file.getSize() > maxSize) {
                response.put("status", 0);
                response.put("message", "File size exceeds 5MB");
                return response;
            }
            Files.createDirectories(Paths.get(BLOG_FILE_UPLOAD));
            String fileName = UUID.randomUUID() + "-" + original;
            Path path = Paths.get(BLOG_FILE_UPLOAD, fileName);
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
            String url =  sessionUtil.getBaseUrlWithContextPath() + BLOG_FILE_UPLOAD + "/" + fileName;
            response.put("status", 1);
            response.put("url", url);
            response.put("name", fileName);
            response.put("message", "Image uploaded successfully");
        } catch (Exception e) {
            log.error("Exception in updateBlogImage ::", e);
            response.put("status", 0);
            response.put("message", "Technical error while uploading image");
        }
        return response;
    }

    public Blog getBlogBySlug(String slug) {
        return blogService.getBySlug(slug);
    }

    public JSONObject updateBlogStatus(String payload) { 
        JSONObject response = new JSONObject();
        try {
            JSONObject request = new JSONObject(payload);
            Integer blogId = request.optInt("blogId");
            String status = request.optString("status");
            Blog blog = blogService.getBlogById(blogId);
            if(blog == null){
                response.put("status", 0);
                response.put("message", "Blog not found");
                return response;
            }
            blog.setStatus(status);
            blogService.save(blog);
            response.put("status", 1);
            response.put("message", "Blog updated successfully");
        } catch (Exception e) {
            log.error("Exception cought in updateBlogStatus :: ", e);
            response.put("status", 0);
            response.put("message", "Sorry for inconvenience, system has encountered technical glitch.");
        }
        return response;
    }

     public JSONObject getBlogById(String payload) {
        JSONObject response = new JSONObject();
        JSONObject request = new JSONObject(payload);
        Integer editBlogId = request.optInt("editBlogId");
        if(!ValidatorUtil.isValid(editBlogId)){
            response.put("status", 0);
            response.put("message", "Blog not found");
            return response;
        }
        Blog blog = blogService.getBlogById(editBlogId);
        if(blog == null){
            response.put("status", 0);
            response.put("message", "Blog not found");
            return response;
        }
        JSONObject blogData = new JSONObject();
        blogData.put("id", blog.getId());
        blogData.put("title", blog.getTitle());
        blogData.put("slug", blog.getSlug());
        blogData.put("excerpt", blog.getExcerpt());
        blogData.put("content", blog.getContent());
        blogData.put("status", blog.getStatus()); // DRAFT / PUBLISHED
        blogData.put("coverImageUrl", blog.getCoverImage());
        response.put("blogData", blogData);
        response.put("status", 1);
        response.put("message", "Blog found successfully");
        return response;
    }
}

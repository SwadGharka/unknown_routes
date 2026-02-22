package com.v1.tourapp.util;

import java.util.UUID;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
@Service
@Slf4j
public class AttachmentUtil {

    @Autowired
    private S3Client s3Client;

    @Value("${aws.s3.bucket}")
    private String bucketName;

    @Value("${DEVELOPMENT_MODE}")
    private String DEVELOPMENT_MODE;

    public JSONObject uploadFile(MultipartFile file, String folderName) {

        JSONObject response = new JSONObject();

        try {

            if (file == null || file.isEmpty()) {
                response.put("status", 0);
                response.put("message", "File is empty");
                return response;
            }

            String original = file.getOriginalFilename()
                    .replaceAll("\\s+", "-")
                    .toLowerCase();

            // Allowed extensions
            if (!original.endsWith(".jpg") &&
                !original.endsWith(".jpeg") &&
                !original.endsWith(".png") &&
                !original.endsWith(".webp")) {

                response.put("status", 0);
                response.put("message", "Invalid file type");
                return response;
            }

            long maxSize = 5 * 1024 * 1024; // 5MB

            if (file.getSize() > maxSize) {
                response.put("status", 0);
                response.put("message", "File size exceeds 5MB");
                return response;
            }

            String fileName = UUID.randomUUID() + "-" + original;

            String key = DEVELOPMENT_MODE + "/" + folderName + "/" + fileName;

            PutObjectRequest putObjectRequest =
                    PutObjectRequest.builder()
                            .bucket(bucketName)
                            .key(key)
                            .contentType(file.getContentType())
                            .build();

            s3Client.putObject(
                    putObjectRequest,
                    RequestBody.fromInputStream(
                            file.getInputStream(),
                            file.getSize()
                    )
            );

            String fileUrl = s3Client.utilities()
                    .getUrl(builder -> builder.bucket(bucketName)
                            .key(key))
                    .toExternalForm();

            response.put("status", 1);
            response.put("url", fileUrl);
            response.put("name", fileName);
            response.put("message", "File uploaded successfully");

        } catch (Exception e) {
            log.error("Exception caught in uploadFile :: ", e);
            response.put("status", 0);
            response.put("message", "Error while uploading file");
        }

        return response;
    }
}

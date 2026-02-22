package com.v1.tourapp.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;

@Configuration
public class S3Config {

    @Value("${AWS_UPLOAD_PUBLIC_ATTACHMENTS_ASSECC_KEY}")
    private String accessKey;

    @Value("${AWS_UPLOAD_PUBLIC_ATTACHMENTS_SECRET_KEY}")
    private String secretKey;

    @Value("${AWS_REGION}")
    private String region;

    @Bean
    public S3Client s3Client() {

        if (accessKey != null && !accessKey.isEmpty()) {

            AwsBasicCredentials awsCreds =
                    AwsBasicCredentials.create(accessKey, secretKey);

            return S3Client.builder()
                    .region(Region.of(region))
                    .credentialsProvider(
                            StaticCredentialsProvider.create(awsCreds)
                    )
                    .build();
        }

        return S3Client.builder()
                .region(Region.of(region))
                .build();
    }
}
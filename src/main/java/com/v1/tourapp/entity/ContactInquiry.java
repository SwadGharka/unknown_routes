package com.v1.tourapp.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@Table(name = "CONTACT_INQUIRY")
public class ContactInquiry {
    
    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "EMAIL")
    private String email;

    @Column(name = "NUMBER", length = 12)
    private String number;

    @Column(name = "PERSION_COUNT")
    private Integer persionCount;

    @Column(name = "MESSAGE")
    private String message;

    @Column(name = "INQUIRY_CODE", length = 20)
    private String inquiryCode;

    @Column(name = "PACKAGE_ID")
    private Long packageId;

}

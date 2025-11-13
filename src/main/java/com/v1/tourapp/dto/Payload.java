package com.v1.tourapp.dto;

import java.net.URLDecoder;

import org.apache.commons.lang3.StringUtils;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class Payload {
	private String payload;

	public String getPayload() {

		try {
			String payloadDecode = payload.replaceAll(" ", "+");
			payloadDecode = new String(java.util.Base64.getDecoder().decode(payload));
			payloadDecode = URLDecoder.decode(payloadDecode, "UTF-8");
			return payloadDecode;
		} catch (Exception e) {
			e.printStackTrace();
			return StringUtils.EMPTY;
		}
	}

	public void setPayload(String payload) {
		this.payload = payload;
	}

}

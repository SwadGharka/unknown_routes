package com.v1.tourapp.dto;

import java.net.URLDecoder;

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

		String payloadDecode = payload.replaceAll(" ", "+");
		payloadDecode = new String(java.util.Base64.getDecoder().decode(payload));
		try {
			payloadDecode = URLDecoder.decode(payloadDecode, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return payloadDecode;
	}

	public void setPayload(String payload) {
		this.payload = payload;
	}

}

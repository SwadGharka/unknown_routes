package com.v1.tourapp.util;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

public class ValidatorUtil {

    @Autowired
    SessionUtil sessionUtil;
    
    public static String stringvlue(Object value) {
        if(value != null && !(value.equals("") || value.toString().equalsIgnoreCase("undefined") || value.toString().equalsIgnoreCase("null"))) {
            return (value.toString()).trim();
        }else{
            return "";
        }

    }
    public static Long longvalue(Object value) {
        if(value instanceof String){
            String stringvalue = value.toString();
        }
        if ((value.equals("") || value == "" ||value == "0" || value == null || value.toString().equalsIgnoreCase("undefined") || value.toString().equalsIgnoreCase("null"))) {
            return 0l;
        }
        return (long)(int)(Integer)value;
    }

    public static Boolean booleanvalue(Object value){
        if(!(value.toString().equals("") || value == null || value.toString().equalsIgnoreCase("null") || !(Boolean)value)){
            return true;
        }else{
            return false;
        }
    }

    public static String getDateTimeByFormat(String dateFormat, Date date){
        if(!stringvlue(date).equals("")){
            return new SimpleDateFormat(dateFormat).format(date);
        }else{
            Date d = new Date();
            return new SimpleDateFormat(dateFormat).format(d);
        }
    }

    public static Date getDateTimeofDateTypeByFormat(String dateFormat, Date date){
        try{
            if(!stringvlue(date).equals("")){
                String strDate = new SimpleDateFormat(dateFormat).format(date);
                return new SimpleDateFormat(dateFormat).parse(strDate);
            }else{
                LocalDateTime currentDateTime = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);
                String formattedDateTime = currentDateTime.format(formatter);
                return new SimpleDateFormat(dateFormat).parse(formattedDateTime);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public static Date getCurrentDateTimeOfDateTypeByFormat(String dateFormat){
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);
        String formattedDateTime = currentDateTime.format(formatter);
        Date date = null;
        try {
            date = new SimpleDateFormat(dateFormat).parse(formattedDateTime);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    public static Date getChangeDateFormat(String dateFormat, String stringDate){
        Date date1 = null;
        try{
            date1 = new SimpleDateFormat(dateFormat).parse(stringDate);
        }catch (Exception e){
            e.printStackTrace();
        }
        return date1;
    }

    public static String getDateTimeByFormat(String requiredFormat, String givenFormat, String date){
        return getDateTimeByFormat(requiredFormat, getChangeDateFormat(givenFormat,date));
    }

    public static boolean isValid(final Object value) {
		return value != null;
	}
	public static boolean isValid(final double value) {
		return value > 0;
	}
	public static boolean isValid(final Double value) {
		return value != null && value > 0;
	}

	public static boolean isValid(final float value) {
		return value > 0;
	}

	public static boolean isValid(final Float value) {
		return value != null && value > 0;
	}

	public static boolean isValid(final BigDecimal value) {
		return value != null;
	}

	public static boolean isValid(final Integer value) {
		return value != null && value > 0;
	}

	public static boolean isValid(final Long value) {
		return value != null && value > 0;
	}

	public static boolean isValid(final String value) {
		return StringUtils.isNotBlank(value) && !"0".equalsIgnoreCase(value) && !"null".equalsIgnoreCase(value) && !"N/A".equalsIgnoreCase(value);
	}

    public static String generatePackageCode(String text, Boolean withRandomNumer) {
        LocalDate date = LocalDate.now();
        String datePart = date.format(DateTimeFormatter.ofPattern("yyMMdd"));
        if(withRandomNumer){
            int random = (int)(Math.random() * 9000) + 1000;
            return text.toUpperCase() + "-" + datePart + "-" + random;
        }
        return text.toUpperCase() + "-" + datePart;
    }
    public static String generateInquiryCode(String text) {
        LocalDateTime dt = LocalDateTime.now();
        String HH = dt.format(DateTimeFormatter.ofPattern("HH"));
        String mm = dt.format(DateTimeFormatter.ofPattern("mm"));
        String ss = dt.format(DateTimeFormatter.ofPattern("ss"));
        String DD = dt.format(DateTimeFormatter.ofPattern("dd"));
        String MM = dt.format(DateTimeFormatter.ofPattern("MM"));
        String yy = dt.format(DateTimeFormatter.ofPattern("yy"));
        return text.toUpperCase() + "-" + HH + mm + ss + MM + DD + yy;
    }

    static String valueCheck(Object[] value, Integer index, String defaultValue){
		try{
			return value != null && value[index]!=null ? value[index].toString() : defaultValue;
		}catch(ArrayIndexOutOfBoundsException e){
			System.err.println("Exception caught in String valueCheck: " + e);
			System.err.println("Invalid index " + index + " for array: " + Arrays.toString(value));
		}
		return defaultValue;
	}

	static Integer valueCheck(Object[] value, Integer index, Integer defaultValue){
		try{
			return value != null && value[index]!=null ? Integer.parseInt(value[index].toString()) : defaultValue;
		}catch(ArrayIndexOutOfBoundsException e){
			System.err.println("Exception caught in Integer valueCheck: " + e);
			System.err.println("Invalid index " + index + " for array: " + Arrays.toString(value));
		}
		return defaultValue;
	}

	static Long valueCheck(Object[] value, Integer index, Long defaultValue){
		try{
			return value != null && value[index]!=null ? Long.parseLong(value[index].toString()) : defaultValue;
		}catch(ArrayIndexOutOfBoundsException e){
			System.err.println("Exception caught in String valueCheck: " + e);
			System.err.println("Invalid index " + index + " for array: " + Arrays.toString(value));
		}
		return defaultValue;
	}

	static Double valueCheck(Object[] value, Integer index, Double defaultValue){
		try{
			return value != null && value[index]!=null ? Double.parseDouble(value[index].toString()) : defaultValue;
		}catch(ArrayIndexOutOfBoundsException e){
			System.err.println("Exception caught in Double valueCheck: " + e);
			System.err.println("Invalid index " + index + " for array: " + Arrays.toString(value));
		}
		return defaultValue;
	}

	static Float valueCheck(Object[] value, Integer index, Float defaultValue) {
		try {
			return value != null && value[index] != null ? Float.parseFloat(value[index].toString()) : defaultValue;
		} catch (ArrayIndexOutOfBoundsException e) {
			System.err.println("Exception caught in Float valueCheck: " + e);
			System.err.println("Invalid index " + index + " for array: " + Arrays.toString(value));
		}
		return defaultValue;
	}

    public static String getEncryption(String input)
    {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        }
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public static String payloadDecode(String payload){
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

}

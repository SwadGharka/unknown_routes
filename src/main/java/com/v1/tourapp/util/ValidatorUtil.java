package com.v1.tourapp.util;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

public class ValidatorUtil {
    
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

    static boolean isValid(final Object value) {
		return value != null;
	}
	static boolean isValid(final double value) {
		return value > 0;
	}
	static boolean isValid(final Double value) {
		return value != null && value > 0;
	}

	static boolean isValid(final float value) {
		return value > 0;
	}

	static boolean isValid(final Float value) {
		return value != null && value > 0;
	}

	static boolean isValid(final BigDecimal value) {
		return value != null;
	}

	static boolean isValid(final Integer value) {
		return value != null && value > 0;
	}

	static boolean isValid(final Long value) {
		return value != null && value > 0;
	}

	static boolean isValid(final String value) {
		return StringUtils.isNotBlank(value) && !"0".equalsIgnoreCase(value) && !"null".equalsIgnoreCase(value) && !"N/A".equalsIgnoreCase(value);
	}

    public static String generatePackageCode(String text) {
    LocalDate date = LocalDate.now();
    String datePart = date.format(DateTimeFormatter.ofPattern("yyMMdd"));
    int random = (int)(Math.random() * 9000) + 1000;
    return text.toUpperCase() + "-" + datePart + "-" + random;
}

}

package com.devpro.shop16.conf;

import javax.servlet.http.HttpServletRequest;
import java.util.Random;

public class Config {

    public static final String vnp_TmnCode = "2QXUI4J4";
    public static final String vnp_HashSecret = "YOUR_VNP_HASH_SECRET";
    public static final String vnp_PayUrl = "YOUR_VNP_PAY_URL";

    // Phương thức để tạo số ngẫu nhiên với độ dài cho trước
    public static String getRandomNumber(int length) {
        Random random = new Random();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }

    // Phương thức để lấy địa chỉ IP từ yêu cầu HttpServletRequest
    public static String getIpAddress(HttpServletRequest request) {
        String ipAddress = request.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null) {
            ipAddress = request.getRemoteAddr();
        }
        return ipAddress;
    }
}

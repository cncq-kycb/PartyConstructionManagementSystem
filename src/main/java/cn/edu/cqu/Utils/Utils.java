package cn.edu.cqu.Utils;

import org.apache.commons.codec.binary.Base64;

public class Utils {

	public static String security_coding(String string) {
		byte[] str = string.getBytes();
		return Base64.encodeBase64String(str);
	}
	
}

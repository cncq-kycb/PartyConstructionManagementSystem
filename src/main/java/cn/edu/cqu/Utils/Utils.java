package cn.edu.cqu.Utils;

import java.util.Arrays;
import java.util.List;

import org.apache.commons.codec.binary.Base64;

public class Utils {

	public static String security_coding(String string) {
		byte[] str = string.getBytes();
		return Base64.encodeBase64String(str);
	}

	public static List<String> splitByComma(String input) {
		List<String> result = Arrays.asList(input.split(","));
		return result;
	}

}

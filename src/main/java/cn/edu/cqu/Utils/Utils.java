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

	public static String option_transform(String option) {
		switch (option) {
		case "A":
			return "1";
		case "B":
			return "2";
		case "C":
			return "3";
		case "D":
			return "4";
		case "1":
			return "A";
		case "2":
			return "B";
		case "3":
			return "C";
		case "4":
			return "D";
		default:
			return "";
		}
	}

}

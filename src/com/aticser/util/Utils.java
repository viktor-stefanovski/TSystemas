package com.aticser.util;

import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.web.multipart.MultipartFile;

import com.aticser.model.Ciutada;

public class Utils {

	public static String getHashString(String input) throws NoSuchAlgorithmException {

		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(input.getBytes());

		byte byteData[] = md.digest();

		// convert the byte to hex format method 1
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}

		// System.out.println("Hex format : " + sb.toString());

		// convert the byte to hex format method 2
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			String hex = Integer.toHexString(0xff & byteData[i]);
			if (hex.length() == 1)
				hexString.append('0');
			hexString.append(hex);
		}
		// System.out.println("Hex format : " + hexString.toString());
		return hexString.toString();

	}

	public static boolean contains(final int[] array, final int key) {
		return ArrayUtils.contains(array, key);
	}

	public static String toStringControl(Ciutada ciut) {
		return "\"" + ciut.getCiutada_id() + "\";" + "\"" + ciut.getId_Campagna() + "\";" + "\""
				+ ciut.getHashGenerado() + "\";" + "\"" + ciut.getMailEnviado() + "\";" + "\"" + ciut.getEntrado()
				+ "\";" + "\"" + ciut.getIsValidacion() + "\";" + "\"" + ciut.getIsBaja() + "\";" + "\""
				+ ciut.getVerificado() + "\";" + "\"" + ciut.getEncuestado() + "\";" + "\""
				+ ciut.getEncuestadoConExito() + "\"";
	}

	public static String toStringHashLink(Ciutada ciut) {
		return "\"" + ciut.getNom_ciutada() + "\";" + "\"" + ciut.getPrimer_cognom_ciutada() + "\";" + "\""
				+ ciut.getEmail() + "\";" + "\"" + ciut.getHashLink() + "\"";
	}

	public static String toStringHashLinkPdf(Ciutada ciut) {
		return "\"" + ciut.getNom_ciutada() + "\";" + "\"" + ciut.getPrimer_cognom_ciutada() + "\";" + "\""
				+ ciut.getEmail() + "\";" + "\"" + ciut.getHashLinkPdf() + "\"";
	}

	public static File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException {
		File convFile = new File(multipart.getOriginalFilename());
		multipart.transferTo(convFile);
		return convFile;
	}

	public static String transformFormatDate(String birthDate) {
		String year = birthDate.substring(6);

		String month = birthDate.substring(3, 5);

		String day = birthDate.substring(0, 2);

		String dateOfBirth = year + "-" + month + "-" + day;

		System.out.println("Date now is: " + dateOfBirth);

		return dateOfBirth;
	}

}

package controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public abstract class Cripto {
	
	public static String criptografar(String senha) {
		
		MessageDigest md;
		
		try {
			md = MessageDigest.getInstance("MD5");
			
		} catch(NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
		
		BigInteger hash = new BigInteger(1, md.digest(senha.getBytes()));
		
        return hash.toString(16);
	}
}

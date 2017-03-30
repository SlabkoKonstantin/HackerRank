package ru.sirkot.hackerranke;

import java.util.Arrays;
import java.util.Scanner;

public class solution {

	static String getSorted(String a) {
		char[] aArray = a.toLowerCase().toCharArray();    	    	
    	Arrays.sort(aArray);
    	return new String(aArray);		
	}
	
    static boolean isAnagram(String a, String b) {
    	String aSorted = getSorted(a).toLowerCase();    	
    	String bSorted = getSorted(b).toLowerCase();   	
		return aSorted.equals(bSorted);
    }	
	
	public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String a = sc.next();
        String b = sc.next();
        boolean ret = isAnagram(a, b);
        System.out.println( (ret) ? "Anagrams" : "Not Anagrams" );        
        sc.close();
	}

}

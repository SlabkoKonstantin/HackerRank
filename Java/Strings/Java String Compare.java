package ru.sirkot.hackerranke;

import java.util.Scanner;

public class solution {

	public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String str = sc.next();
        int len = sc.nextInt();
        String min = "";
        String max = "";

        for (int i = 0; i <= str.length() - len; i++) {
            String substr = str.substring(i,  i + len);
            if (substr.compareTo(min) < 0 || min.isEmpty()) {
                min = substr;
            }
            if (substr.compareTo(max) > 0 || max.isEmpty()) {
                max = substr;
            }
        }

        System.out.println(min);
        System.out.println(max);
        
        sc.close();
	}

}

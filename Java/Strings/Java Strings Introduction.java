package ru.sirkot.hackerranke;

import java.util.Scanner;

public class solution {

	public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String A=sc.next();
        String B=sc.next();
        
        // 1
        int len = A.length() + B.length();        
        System.out.println(len);
        
        // 2
        if (A.compareTo(B)>0) {
        	System.out.println("Yes");
        }
        else {
        	System.out.println("No");
        }
        
        // 3
        A = A.substring(0, 1).toUpperCase() + A.substring(1);
        B = B.substring(0, 1).toUpperCase() + B.substring(1);
        System.out.println(A+" "+B);
        
        sc.close();
	}

}

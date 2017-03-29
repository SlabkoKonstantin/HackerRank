package ru.sirkot.hackerranke;

import java.util.Scanner;

public class solution {

	public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String src = sc.nextLine();
        
        StringBuilder sb = new StringBuilder();
        sb.append(src);
        sb.reverse();
        
        String trg = sb.toString();

        if (src.equals(trg)) {
        	System.out.println("Yes");	
        }
        else {
        	System.out.println("No");
        }
        
        sc.close();
	}

}

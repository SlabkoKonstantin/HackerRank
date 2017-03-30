package ru.sirkot.hackerranke;

import java.util.Scanner;

public class solution {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String a = sc.nextLine().trim();
		String[] arr = a.split("[ !,?._'@]+");

		if(arr.length == 1 && arr[0].equals("")){
			System.out.println(0);
		}
		else {
			System.out.println(arr.length);
			for (String item : arr) {
				System.out.println(item);
			}	
		}
		sc.close();
	}

}

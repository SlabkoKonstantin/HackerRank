import java.util.Scanner;

public class Solution {

	public static void main(String[] args) {
	    Scanner sc = new Scanner(System.in);
	    int lineNum = 1;    
	    
	    while (sc.hasNextLine() == true) {
	    if (sc.hasNext() == true) {
	        System.out.println(lineNum + " " + sc.nextLine());
	        lineNum++;
	    }
	    }
		sc.close();
	}
}

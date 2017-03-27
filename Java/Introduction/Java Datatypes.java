import java.util.Scanner;

public class Solution {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cnt = sc.nextInt();
		String tests[] = new String[cnt];

		sc.nextLine(); // past nextInt;

		// read input into array
		for (int i = 0; i < cnt; i++) {
			tests[i] = sc.nextLine();
		}

		for (String test : tests) {
			try {
				long l = Long.parseLong(test);
				System.out.println(test + " can be fitted in:");

				if (l <= 127 && l >= -128) {
					System.out.println("* byte \n* short \n* int \n* long");
				} else if (l <= 32767 && l >= -32768) {
					System.out.println("* short \n* int \n* long");
				} else if (l <= 2147483647 && l >= -2147483648) {
					System.out.println("* int \n* long");
				} else if (l <= 9223372036854775807l && l >= -9223372036854775808l) {
					System.out.println("* long");
				}

			} catch (NumberFormatException e) {
				System.out.println(test + " can't be fitted anywhere.");
			}
		}

		sc.close();
	}
}

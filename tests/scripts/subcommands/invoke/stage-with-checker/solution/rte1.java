import java.util.Scanner;

class add1 {
	public static void main(String... args) {
		Scanner sc = new Scanner(System.in);
		int a = sc.nextInt();
		int b = sc.nextInt();
		if (a > 10)
			System.exit(20);
		System.out.println(a+b);
	}
}

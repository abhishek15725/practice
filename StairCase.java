import java.util.*;
public class StairCase {
    public static void main (String[]args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter any positive whole number");
        int n = sc.nextInt();
        int i,j;
        for (j = 0; j<n; j++) {
            for (i =n; i >j; i--) {
                System.out.print(" ");
            }
            for(int k=0;k<=j;k++){
                System.out.print("#");
            }
            System.out.println();
        }
    }
}

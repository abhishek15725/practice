import java.util.*;
public class BigSum {
    public static void main(String[]args){

        Scanner sc = new Scanner(System.in);
        int n=sc.nextInt();
        System.out.println(n);
        long[] ar=new long[n];
        long sum = 0;
        for (int i = 0; i < n; i++) {
            ar[i] = sc.nextLong();
            sum = sum + ar[i];
        }
        System.out.println(sum);
    }
}

import java.util.*;
import java.math.*;
import java.io.*;
import java.util.Arrays;
public class MinMax {
    public static void main(String[]args){
        Scanner sc=new Scanner(System.in);
        long sum=0;
        long min=0;
        long max=0;
        long sub=0;
        long []ar=new long[5];
        long []arr=new long[5];
        for(int i=0;i<5;i++){
            arr[i]=sc.nextInt();
        }
        for(int j=0;j<5;j++) {
            sum = sum + arr[j];
        }
        for(int k=0;k<5;k++){
            sub=sum-arr[k];
            ar[k] = sub;
        }
        Arrays.sort(ar);
        System.out.println(Arrays.toString(ar));
        min=ar[0];
        max=ar[4];
        System.out.println(min+" "+max);
        }
    }

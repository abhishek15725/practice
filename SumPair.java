import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    // Complete the divisibleSumPairs function below.
    public static void main(String[]args){
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int k=sc.nextInt();
        int sum=0;
        int count=0;
        int[] ar=new int[n];
        int[] arr=new int[2];
        for(int i=0;i<n;i++){
            ar[i]=sc.nextInt();
        }
        for(int i=0;i<ar.length;i++){
            for(int j=0;j<ar.length;j++){
                if(i<j){
                    sum=ar[i]+ar[j];
                    //System.out.println(arr[j]);
                    if(sum%k==0){
                        count++;
                    }
                }
            }
        }
        System.out.println(count);
    }
}



import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {
    public static void main(String[]args){
        Scanner sc=new Scanner(System.in);
        int s=sc.nextInt();
        int t=sc.nextInt();
        int a=sc.nextInt();
        int b=sc.nextInt();
        int m=sc.nextInt();
        int n=sc.nextInt();
        int c=0;
        int d=0;
        
        int[]arr=new int[m];
        int[]brr=new int[n];
        for(int i=0;i<m;i++){
            arr[i]=sc.nextInt();
            
        }
        for(int j=0;j<n;j++){
            brr[j]=sc.nextInt();
        }
        for(int i=0;i<m;i++){
            arr[i]=arr[i]+a;
            if(s<=arr[i]&& arr[i]<=t){
                c++;
            }
        }
        for(int j=0;j<n;j++){
            brr[j]=brr[j]+b;
            if(s<=brr[j]&& brr[j]<=t){
                d++;
            }
        }
        System.out.println(c);
        System.out.println(d);
        
    }

}

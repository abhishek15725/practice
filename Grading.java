import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Result {
    public static void main(String[]args){
        int a=0;
        int b=0;
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int [] arr=new int[n];
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }
        for(int j=0;j<n;j++){
            double x=arr[j]/5;
            a=((int)Math.floor(x)*5)+5;
            b=a-arr[j];
            if(b<3&&arr[j]>=38){
                System.out.println(a);
            }
            else if(b>=3&&arr[j]>=38){
                System.out.println(arr[j]);
            }
            else if(arr[j]<=38){
                System.out.println(arr[j]);
            }
                
        }
    }
    
}

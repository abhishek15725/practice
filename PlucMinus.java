import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {
    public static void main(String[]args){

    // Complete the plusMinus function below.
    Scanner scanner=new Scanner(System.in);
   int n=scanner.nextInt();
   int[] arr=new int[n];
        double p=0.0;
        double ne=0.0;
        double z=0.0;
        double pp=0.0;
        double nee=0.0;
        double zz=0.0;
        for(int i=0;i<n;i++){
            arr[i]=scanner.nextInt();
        }
        for(int j=0;j<arr.length;j++){
            if(arr[j]>0){
                p=p+1.0;
                pp=p/n;
            }
            else if(arr[j]<0){
                ne=ne+1.0;
                nee=ne/n;
            }
            else if(arr[j]==0){
                z=z+1.0;
                zz=z/n;
            }
        }
        
        
        
        System.out.println(pp);
        System.out.println(nee);
        System.out.println(zz);

    }
}

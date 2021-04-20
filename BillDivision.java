import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    // Complete the bonAppetit function below.
    public static void main(String[]args){
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int k=sc.nextInt();
        int[] bill=new int[n];
        for(int i=0;i<n;i++){
            bill[i]=sc.nextInt();
        }
        int b=sc.nextInt();
        int sum=0;
    
        for(int i=0;i<n;i++){
            sum=sum+bill[i];
        }
        int charged=(sum-bill[k])/2;
        
        if(charged==b){
            System.out.println("Bon Appetit");
        }
        else {
            System.out.println(b-charged);
        }
    
        
        
    }
}

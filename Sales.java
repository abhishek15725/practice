import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    // Complete the sockMerchant function below.
    public static void main(String[]args){
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[] ar=new int[n];
          for(int i=0;i<n;i++){
            ar[i]=sc.nextInt();
        }
        Set<Integer> hs=new HashSet<Integer>();
       int pair=0;
       for(int i=0;i<n;i++){
           if(!hs.contains(ar[i])){
               hs.add(ar[i]);
           }
           else{
               pair++;
               hs.remove(ar[i]);
           }
       }
       System.out.println(pair);
    }
}

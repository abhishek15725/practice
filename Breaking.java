import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    // Complete the breakingRecords function below.
    public static void main(String[]args){
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[] s=new int[n];
        int min=0;
        int max=0;
        int high;
        int low;
        for(int i=0;i<n;i++)
        {
            s[i]=sc.nextInt();
        }
        high=s[0];
        low=s[0];
        
            for(int i=0;i<n;i++){
                
            if(s[i]>high){
                high=s[i];
                max++;
            }
            else if(s[i]<low){
                low=s[i];
                min++;//System.out.println(low);
            }//System.out.println(s[i]);
    }
    System.out.println(max+" "+min);
}
}

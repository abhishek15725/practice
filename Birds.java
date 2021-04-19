import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    // Complete the migratoryBirds function below.
    public static void main(String[]args){
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[] count=new int[5];
        int[] arr=new int[n];
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }
        //Arrays.sort(arr);
        //System.out.println(Arrays.toString(arr));
        for(int i=0;i<5;i++){
            for(int j=0;j<arr.length;j++){
                if(i+1==arr[j]){
                    count[i]=count[i]+1;
                    //System.out.println(arr[j]);
                }
            }
        
        }
        //System.out.println(Arrays.toString(count));
        int max=0;
        int maxpos=0;
        for(int i=0;i<count.length;i++){
                //Arrays.sort(count);
                //System.out.println(count[i]);
                if(count[i]>max){
                    max=count[i];
                    maxpos=i;
                    
                }
            
        }
        System.out.println(maxpos+1);
    }
}

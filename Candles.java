import java.util.*;

public class Candles {

    public static void main(String[]args){
        Scanner sc=new Scanner(System.in);
        int count=0;
        int n= sc.nextInt();
        int[] arr=new int[n];
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }
        Arrays.sort(arr);
        
        for(int j=0;j<n;j++){
            if(arr[n-1]==arr[j]){
                count++;
            }
        }
        System.out.println(count);
        
    }
}

import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    // Complete the catAndMouse function below.
    public static void main(String[]args){
        Scanner scanner=new Scanner(System.in);
            int n=scanner.nextInt();
    for(int i=0;i<n;i++){
        int x=scanner.nextInt();
        int y=scanner.nextInt();
        int z=scanner.nextInt();
    
    if(Math.abs(z-y)==Math.abs(z-x)){
        System.out.println("Mouse C");
    }
    else if(Math.abs(z-y)>Math.abs(z-x))
    {
      System.out.println("Cat A");  
    }
    else if(Math.abs(z-y)<Math.abs(z-x)){
        System.out.println("Cat B"); 
    }
    }
    }
}

import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Result {

    /*
     * Complete the 'countingValleys' function below.
     *
     * The function is expected to return an INTEGER.
     * The function accepts following parameters:
     *  1. INTEGER steps
     *  2. STRING path
     */
public static void main(String[]args){
    Scanner sc=new Scanner(System.in);
    int step=sc.nextInt();
    
    int lvl=0;
    int v=0;
    String path=sc.next();
    for(char c:path.toCharArray()){
        if(c=='U') lvl++;
        if(c=='D') lvl--;
        if(lvl==0&&c=='U') v++;
        
        /*if(c==charAt(i+1)){
        
        }*/
    }  System.out.println(v); 
}
}

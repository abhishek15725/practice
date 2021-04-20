import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    // Complete the dayOfProgrammer function below.
    public static void main(String[]args){
        Scanner sc=new Scanner(System.in);
        int year=sc.nextInt();
        int dd=0;
        int mm=9;
         if (year==1918){
            dd=26;
            System.out.println(dd+"."+"0"+mm+"."+year);
        }
        else if(((year <= 1917) && (year%4 == 0)) || ((year > 1918) && (year%400 == 0 || ((year%4 == 0) && (year%100 != 0))))){
            dd=256-244;
            System.out.println(dd+"."+"0"+mm+"."+year);
        }
        else{
            dd=256-243;
            System.out.println(dd+"."+"0"+mm+"."+year);
        }
    }
   
} 

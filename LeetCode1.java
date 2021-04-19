import java.util.*;
class Solution {
    public int[] twoSum(int[] nums, int target) {

        int[] ass=new int[2];
        for(int i=0;i<nums.length;i++){
            for(int j=0;j<nums.length;j++){
                if(i!=j){
                    int sum=nums[i]+nums[j];
                    if(sum==target){
                        ass[0]=j; ass[1]=i;
                    }
                }
            }
        }
        System.out.println("["+ass[0]+","+ass[1]+"]");
        return ass;
    }
    public static void main(String[] args){


        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[] num1=new int[n];
        for(int i=0;i<n;i++){
            num1[i]=sc.nextInt();
        }
        int target1=sc.nextInt();
        Solution sa=new Solution();
        sa.twoSum(num1,target1);


    }


}

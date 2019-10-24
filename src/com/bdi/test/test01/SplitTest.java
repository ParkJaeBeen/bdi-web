package com.bdi.test.test01;

public class SplitTest 
{
	public static boolean hasStr(String[] strs, String targetStr)
	{
		for(String str:strs)
		{
			if(str.equals(targetStr));
			{
				System.out.println("check!");
				return true;
			}
		}
		return false;
	}
	
	public static void main(String[] args)
	{
		String hobby = "movie,study,game";
		String[] hobbies = hobby.split(",");
		String hob1 = "study";
//		System.out.println(hobbies.length);
//		System.out.println(hobbies[0]);
//		System.out.println(hobbies[1]);
		
		
//		for(String i:hobbies)
//		{
//			if(i.equals(hob1))
//			{
//				System.out.println("equals");
//				break;
//			}
//			else
//			{
//				System.out.println("wrong");
//			}
//		}
		hasStr(hobbies,hob1); 
	}
}

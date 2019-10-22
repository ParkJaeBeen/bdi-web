package com.bdi.test.test01;

import java.util.ArrayList;
import java.util.List;

public class Execute 
{
	public static void main(String[] args)
	{
		List<Food> cl = new ArrayList<Food>();		//0.cl 이라는 새 List 생성
		Food.addMenu(cl,"치킨",20000,"JMT");			//1.Food class 에 있는 addMenu 라는 method 에 값을 지정
		Food.addMenu(cl,"생맥주",5000,"500cc");
		Food.addMenu(cl,"소주",4000,"한병");
		
		for(Food f : cl)
		{
			System.out.println(f);					//출력
		}
	}
}

package com.bdi.test.test01;

import java.util.ArrayList;
import java.util.List;

public class Food 		//Food class 생성
{
	private String name;		//각각의 변수 선언
	private int price;
	private String etc;
	
	public Food(String name, int price, String etc)		//생성자의 매개변수에 값을 받아올 수 있도록 변수선언
	{
		this.name = name;								//4. 2의 private 변수를 사용하기 위해 매개변수 내에 받아온 값을 private 변수에 대입
		this.price = price;
		this.etc = etc;
	}
	
	public String toString()				//메모리주소가 나오지 않도록 toString 을 overRide
	{
		return "[name = " + name + " price = " + price + " etc = " + etc + "]"; 	//이 값을 리턴
	}
	public static void addMenu(List<Food> menu, String name, int price, String etc)		//addMenu라는 method 생성,매개변수에 Food class 내의 값을 사용하는 List인 menu 를 지정
	{											//2.addMenu에 Execute class 의 main method 에서 지정한 값 Food.addMenu(cl,"치킨",20000,"JMT")가 대입
		Food f = new Food(name,price,etc);		//3. 위에 class food 에 생성한 생성자를 호출
		menu.add(f);							//7. list인 menu 에 생성자로 호출된 2번변수 내에 선언되어있는 값을 추가 (list.add() method)
	}
}

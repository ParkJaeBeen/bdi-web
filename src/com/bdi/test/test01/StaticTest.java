package com.bdi.test.test01;

class Test
{
	static
	{
		System.out.println(5);
	}
	
	Test()
	{
		System.out.println(1);
	}
}

public class StaticTest extends Test
{
	StaticTest()
	{
		System.out.println(7);
	}
	
	public static void main(String[] args)
	{
		new Test();
		new Test();
//		System.out.println(test.a);
//		StaticTest st = new StaticTest();
	}
}

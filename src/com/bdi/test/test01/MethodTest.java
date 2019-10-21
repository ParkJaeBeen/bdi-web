package com.bdi.test.test01;

class Mother
{
	Mother()
	{
		System.out.println("123");
	}
	int a = 3;
	
	public void test()
	{
		System.out.println("mother");
	}
}

public class MethodTest extends Mother
{
	MethodTest()
	{
		System.out.println("456");
	}
	
	int a = 123;
//	public void test(int a, int b)
//	{
//		System.out.println(a*b);
//	}
//	
//	public void test(int a, String b)
//	{
//		System.out.println(a+b);
//	}
//	
//	public void test(String b, int a)
//	{
//		System.out.println(a+b);
//	}
//	
	public void test()
	{
		System.out.println("son");
	}
	public static void main(String[] args)
	{
		Mother mt = new MethodTest();
//		mt.test(2, 3);
//		mt.test(2, "3");
//		mt.test("3",2);
//		mt.test();
//		System.out.println(mt.a);
	}
}

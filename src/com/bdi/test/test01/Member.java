package com.bdi.test.test01;

import java.util.ArrayList;
import java.util.List;

public class Member //1. class Member 생성
{
	int a; 					//2. int형변수 a선언

	public static void changeMember(Member m) //6. 5번에서 호출한 changeMember()
	{
		m = new Member();					//7. Member class 메모리생성을 하는것이 아닌, changeMember() method 내의 매개변수 안에 있는 Member m 을 새로 생성
		m.a = 10;							//8. 7번에 새로 생성된 메모리 m 의 a 변수에 10을 대입
//		System.out.println(m.a);			//9. 7번의 새로 생성된 메모리는 changeMember() method 내에서 존재하고 끝났을 때 사라짐 
	}
	
	public static void main(String[] args)
	{
		Member m = new Member();	//3. 메모리생성, Member 에 있는 값을 읽어옴
//		System.out.println(m.a);	//4. 메모리 생성시 Member 안에 있는 int a 변수에 값을 0으로 초기화함
//		changeMember(m);			//5. changeMember() method 호출
//		System.out.println(m.a);	//10. 7번에 대입된 메모리 안의 m.a 의 10이 출력되는것이 아니라, 3번에 생성한 메모리 m 에 있는 a = 10이 출력 
		List<Member> mList = new ArrayList<Member>();
		m.a = 10;
		mList.add(m);
		m.a = 20;
		mList.add(m);
		m.a = 30;
		mList.add(m);
		
		for(int i = 0;i < mList.size();i++)
		{
			System.out.println(mList.get(i).a);
		}
	}
}
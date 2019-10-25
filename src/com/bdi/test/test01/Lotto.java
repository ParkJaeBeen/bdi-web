package com.bdi.test.test01;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class Lotto 
{
	public List<Integer> getLotto()
	{
		List<Integer> lotto = new ArrayList<Integer>();
		
		Random r = new Random();
		
		for(int i = 0; i<6; i++)
		{
			int rNum = r.nextInt(45) + 1;
			if(lotto.indexOf(rNum) == -1)		//lotto.indexOf() 가 -1일때 /indexOf() 에 list 에 없는 숫자를 넣었을 때 값은 -1이 나온다
			{
				lotto.add(rNum);				//lotto list 에 rNum 이란 숫자가 없을때만 add를 해준다
			}
			else
			{
				i--;
			}
			Collections.sort(lotto);
		}
		return lotto;
	}
}

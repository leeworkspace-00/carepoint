package com.aws.team.service;

import java.util.ArrayList;
import com.aws.team.domain.FoodVo;

public interface FoodService {
	
	public ArrayList<FoodVo> getFoodSearch(String menu);


}

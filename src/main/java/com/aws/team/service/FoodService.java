package com.aws.team.service;

import java.util.List;
import com.aws.team.domain.FoodVo;


public interface FoodService {
	
    // 여러 개의 FoodVo 객체를 반환하도록 메서드 api용 메서드
    List<FoodVo> getFoodInfo(String foodName);


}



package com.aws.team.persistance;
import com.aws.team.domain.FoodVo;

public interface FoodMapper {
	
    public int foodInsert(FoodVo foodVo); // food 테이블에 Insert
    public int foodListInsert(FoodVo menuItem); // foodlist 테이블에 Insert

}

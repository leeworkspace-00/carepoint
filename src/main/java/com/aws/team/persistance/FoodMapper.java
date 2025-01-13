package com.aws.team.persistance;
import org.apache.ibatis.annotations.Param;

import com.aws.team.domain.FoodVo;

public interface FoodMapper {
	
    public int foodInsert(FoodVo foodVo); // food 테이블에 Insert
    public int foodListInsert(FoodVo menuItem); // foodlist 테이블에 Insert
    
    // 부모 데이터 존재 여부 확인 메서드 추가
    public int isFoodExists(@Param("user_pk") int user_pk,
                     @Param("selectDate") java.sql.Date selectDate,
                     @Param("foodType") String foodType);

}

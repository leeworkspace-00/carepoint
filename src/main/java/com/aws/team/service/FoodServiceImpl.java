package com.aws.team.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.aws.team.domain.FoodVo;

@Service
public class FoodServiceImpl implements FoodService {
	
	

    private static final String API_URL = "http://openapi.foodsafetykorea.go.kr/api/S15Q20+eKCS9XCxG+BSU/yMA3XAfmRYgzURInD+A5qWVaViHx2JBGK2G8g7S8F2cipeL1lLYJoFto1DX2FxpNw==/I2790/json/1/10?DESC_KOR=";
	
	
    @Override
    public ArrayList<FoodVo> getFoodSearch(String menu) {
        RestTemplate restTemplate = new RestTemplate();
        String url = API_URL + menu;

        ArrayList<FoodVo> foodList = new ArrayList<>();

        try {
            // RestTemplate으로 API 호출 및 HashMap 변환
            @SuppressWarnings("unchecked")
			HashMap<String, Object> response = restTemplate.getForObject(url, HashMap.class);
            
            // 디버깅: 응답 데이터 출력
            System.out.println("API Response: " + response);

            // 최상위 JSON 객체에서 "I2790" 키 추출
            @SuppressWarnings("unchecked")
			HashMap<String, Object> body = (HashMap<String, Object>) response.get("I2790");
            
            // 디버깅: body 데이터 출력
            System.out.println("Body: " + body);

            // "row" 배열 추출
            @SuppressWarnings("unchecked")
			ArrayList<HashMap<String, Object>> rows = (ArrayList<HashMap<String, Object>>) body.get("row");

            // 각 row를 FoodVo로 변환
            for (HashMap<String, Object> foodData : rows) {
                FoodVo foodVo = new FoodVo();
                foodVo.setDescKor((String) foodData.get("DESC_KOR")); // 음식 이름
                foodVo.setNutrCont1((String) foodData.getOrDefault("NUTR_CONT1", "0")); // 칼로리
                foodVo.setNutrCont2((String) foodData.getOrDefault("NUTR_CONT2", "0")); // 탄수화물
                foodVo.setNutrCont3((String) foodData.getOrDefault("NUTR_CONT3", "0")); // 단백질

                foodList.add(foodVo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return foodList;
    }
}
	
	
	


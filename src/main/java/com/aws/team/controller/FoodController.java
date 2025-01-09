package com.aws.team.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.aws.team.domain.FoodVo;
import com.aws.team.service.FoodService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value="/food/")
public class FoodController {
	

	
    @Autowired
    private FoodService foodService;
	

	@RequestMapping(value= "foodRecom.aws", method=RequestMethod.GET)
	public String foodRecom() {
		
		return "WEB-INF/food/foodRecom";
	}

	@RequestMapping(value= "foodDetail.aws", method=RequestMethod.GET)
	public String foodDetail() {
		
		return "WEB-INF/food/foodDetail";
	}
	
	
	// �떒�닚�엳 �솕硫대쭔 �쓣�썙二쇰뒗 硫붿꽌�뱶
	@RequestMapping(value = "foodMain.aws", method = RequestMethod.GET)
	public String foodMain() {
	    return "WEB-INF/food/foodMain"; // �솕硫� �젋�뜑留�
	}


	
	@RequestMapping(value = "foodMainAction.aws", produces = "application/json; charset=UTF-8") 
	@ResponseBody
	public List<FoodVo> getFoodInfo(@RequestParam(value = "foodName", required = false, defaultValue = "") String foodName) {
	    // 요청 매핑 설정:
	    // - URL: "foodMainAction.aws"로 매핑
	    // - JSON 형식의 응답을 UTF-8 인코딩으로 반환

	    // @ResponseBody:
	    // - 메서드의 반환 값을 HTTP 응답 본문으로 변환하여 클라이언트에 전달

	    // @RequestParam:
	    // - HTTP 요청 파라미터 "foodName"을 메서드 파라미터에 매핑
	    // - 필수 값이 아니며, 값이 없으면 기본값("") 사용

	    if (foodName.isEmpty()) { 
	        // foodName이 비어있거나 null일 경우 로그를 출력하고 빈 리스트 반환
	        System.out.println("foodName is empty or null");
	        return new ArrayList<>(); // 빈 리스트 반환
	    }

	    // 서비스 호출:
	    // - foodService의 getFoodInfo 메서드를 호출하여 음식 정보 리스트 가져오기
	    List<FoodVo> foodList = foodService.getFoodInfo(foodName);

	    if (foodList != null && !foodList.isEmpty()) {
	        // foodList에 데이터가 있는 경우 로그 출력
	        System.out.println("Returned Food Info List: " + foodList);
	    } else {
	        // foodList가 비어있거나 null일 경우 로그 출력
	        System.out.println("No data found for foodName: " + foodName);
	    }

	    // 결과 반환:
	    // - 음식 정보를 담은 리스트를 클라이언트에 반환
	    return foodList;
	}



	





	
	
	



}

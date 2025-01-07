package com.aws.team.controller;


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
	
	
	// 단순히 화면만 띄워주는 메서드
	@RequestMapping(value = "foodMain.aws", method = RequestMethod.GET)
	public String foodMain() {
	    return "WEB-INF/food/foodMain"; // 화면 렌더링
	}

//	// 검색 기능을 담당하는 메서드
//	@RequestMapping(value = "foodMainAction.aws")
//	public String getFoodInfo(@RequestParam(value = "foodName") String foodName, Model model) {
//	    // foodName에 따라 검색 처리
//	    FoodVo foodInfo = foodService.getFoodInfo(foodName);
//	    System.out.println("Food Info: " + foodInfo); // 디버깅용 출력 vo에 잘 들어갔다. 완료
//	    model.addAttribute("foodInfo", foodInfo);
//	    
//	    System.out.println("Menu Name: " + foodInfo.getMenuName());
//	    System.out.println("Calories: " + foodInfo.getCalorie());
//	    System.out.println("Protein: " + foodInfo.getProtein());
//	    System.out.println("Fat: " + foodInfo.getFat());
//	    System.out.println("Carbs: " + foodInfo.getCarb()); //정상적으로 들어감
//	    
//	    System.out.println("Model contains 'foodInfo': " + model.containsAttribute("foodInfo"));
//
//	    // 검색 결과를 포함하여 동일한 화면을 렌더링
//	    return "WEB-INF/food/foodMain";
//	}
	
	

	@RequestMapping(value = "foodMainAction.aws", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public FoodVo getFoodInfo(@RequestParam(value = "foodName") String foodName) {
	    System.out.println("Received foodName: " + foodName); // 디버깅용 출력
	    return foodService.getFoodInfo(foodName); // FoodVo 객체를 JSON 형식으로 반환
	}





	
	
	



}

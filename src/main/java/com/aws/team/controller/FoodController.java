package com.aws.team.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
	
	
	// 식단 메인화면
	@RequestMapping(value = "foodMain.aws", method = RequestMethod.GET)
	public String foodMain() {
	    return "WEB-INF/food/foodMain";
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
	
	   	
	
	@RequestMapping(value = "foodWriteAction.aws", method = RequestMethod.POST)
	public String foodWriteAction(
	        @ModelAttribute FoodVo foodVo,
	        @RequestParam("menu_B[]") List<String> menuB,
	        @RequestParam("kcal_B[]") List<Integer> kcalB,
	        @RequestParam("menu_L[]") List<String> menuL,
	        @RequestParam("kcal_L[]") List<Integer> kcalL,
	        @RequestParam("menu_D[]") List<String> menuD,
	        @RequestParam("kcal_D[]") List<Integer> kcalD,
	        @RequestParam("selectdate") String selectDate,
	        HttpServletRequest request,
	        RedirectAttributes rttr
	) {
	    // 날짜를 java.sql.Date로 변환
	    java.sql.Date sqlDate = java.sql.Date.valueOf(selectDate);
	    
	    String user_pk = request.getSession().getAttribute("user_pk").toString();
	    int user_pk_int = Integer.parseInt(user_pk);

	    // 메뉴 리스트 생성
	    List<FoodVo> menuList = new ArrayList<>();

	    // 아침 식단 처리
	    for (int i = 0; i < menuB.size(); i++) {
	        FoodVo menu = new FoodVo();
	        menu.setUser_pk(user_pk_int);
	        menu.setFoodtype("B");
	        menu.setMenu(menuB.get(i));
	        menu.setKcal(kcalB.get(i));
	        menu.setSelectdate(sqlDate);
	        menuList.add(menu);
	    }

	    // 점심 식단 처리
	    for (int i = 0; i < menuL.size(); i++) {
	        FoodVo menu = new FoodVo();
	        menu.setUser_pk(user_pk_int);
	        menu.setFoodtype("L");
	        menu.setMenu(menuL.get(i));
	        menu.setKcal(kcalL.get(i));
	        menu.setSelectdate(sqlDate);
	        menuList.add(menu);
	    }

	    // 저녁 식단 처리
	    for (int i = 0; i < menuD.size(); i++) {
	        FoodVo menu = new FoodVo();
	        menu.setUser_pk(user_pk_int);
	        menu.setFoodtype("D");
	        menu.setMenu(menuD.get(i));
	        menu.setKcal(kcalD.get(i));
	        menu.setSelectdate(sqlDate);
	        menuList.add(menu);
	    }

	    // 각 식단 데이터를 데이터베이스에 저장
	    int value = 0;

	    for (FoodVo menu : menuList) {
	        // 부모 데이터 확인 및 삽입
	        boolean isFoodExists = foodService.isFoodExists(user_pk_int, sqlDate, menu.getFoodtype());
	        
	        if (!isFoodExists) {
	            foodService.insertParentFood(menu); // 부모 테이블 데이터 삽입
	        }

	        // 자식 데이터 삽입
	        value += foodService.foodInsert(menu, Arrays.asList(menu));
	    }

	    String path;

	    // 성공 여부에 따른 경로 설정
	    if (value > 0) {
	        rttr.addFlashAttribute("msg", "저장이 성공했습니다.");
	        path = "redirect:/food/foodMain.aws";
	    } else {
	        rttr.addFlashAttribute("msg", "입력이 잘못되었습니다.");
	        path = "redirect:/food/foodMain.aws";
	    }
	    
	    return path;
	}

    
    
}
	




	





	
	
	





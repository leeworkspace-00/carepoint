package com.aws.team.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

//	@RequestMapping(value= "foodMain.aws", method=RequestMethod.GET)
//	public String foodMain() {
//		
//		return "WEB-INF/food/foodMain";
//	}
	
		
	@RequestMapping(value= "foodMain.aws", method=RequestMethod.GET)
	public String foodMain(@RequestParam(value="menu", required=false) String menu, Model model) {
	    if (menu != null && !menu.isEmpty()) {
	        ArrayList<FoodVo> foodSearchResults = foodService.getFoodSearch(menu);
	        
	        // 디버깅: 검색 결과 출력
	        System.out.println("Search Results: " + foodSearchResults);
	        model.addAttribute("foodSearchResults", foodSearchResults);
	    }
	    return "WEB-INF/food/foodMain";
	}

	
	
	



}

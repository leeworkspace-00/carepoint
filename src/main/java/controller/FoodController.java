package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/food/")
public class FoodController {
	
	
	@RequestMapping(value= "foodRecom.aws", method=RequestMethod.GET)
	public String foodRecom() {
		
		return "WEB-INF/food/foodRecom";
	}
	
	
	@RequestMapping(value= "foodDetail.aws", method=RequestMethod.GET)
	public String foodDetail() {
		
		return "WEB-INF/food/foodDetail";
	}
	
	
	@RequestMapping(value= "foodMain.aws", method=RequestMethod.GET)
	public String foodMain() {
		
		return "WEB-INF/food/foodMain";
	}

}

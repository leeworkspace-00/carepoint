package com.aws.team.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/exercise/")
public class ExericesController {
	
	
	@RequestMapping(value="exerciseMain.aws", method=RequestMethod.GET)
	public String exerciseMain() {
		
		return "WEB-INF/exercise/exerciseMain"; 
	}
	
	@RequestMapping(value="bmi.aws", method=RequestMethod.GET)
	public String bmi() {
		
		return "WEB-INF/exercise/bmi"; 
	}
	
	@RequestMapping(value="calculateBMI.aws", method=RequestMethod.POST)
    public String calculateBMI(@RequestParam double height, @RequestParam double weight, Model model) {


		double heightInMeters = height / 100.0;
        double bmi = weight / (heightInMeters * heightInMeters);
        double standardWeight = (height - 100) * 0.9;

        String bmiCategory;
        if (bmi < 18.5) {
            bmiCategory = "저체중";
        } else if (bmi < 23) {
            bmiCategory = "보통";
        } else if (bmi < 25) {
            bmiCategory = "과체중";
        } else {
            bmiCategory = "비만";
        }

        model.addAttribute("bmi", String.format("%.2f", bmi));
        model.addAttribute("standardWeight", String.format("%.2f", standardWeight));
        model.addAttribute("bmiCategory", bmiCategory);

        return "WEB-INF/exercise/bmi";
    }

	@ResponseBody
	@RequestMapping(value = "SampleCalendarList")
	public Map<String,Object> sampleCalanderList(final @RequestParam Map<String, Object> param
	        , final HttpServletRequest request
	        , final HttpServletResponse response
	        , final ModelMap model
	        ) throws Exception {
	        System.out.println("캘린더 통신 성공");
	        System.out.println(param);
	        param.put("start", "2021-12-25");
	        param.put("end", "2021-12-26");
	        param.put("title", "2021-12-25");
	        System.out.println(param);
	    return param;
	}
	
	@RequestMapping(value="calendarTest.aws", method=RequestMethod.GET)
	public String calendarTest() {
		
		return "WEB-INF/exercise/calendarTest"; 
	}
	
	
	
	
	
}

package com.aws.team.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping(value = "saveSuccess.aws", method = RequestMethod.POST)
    public void saveSuccess(@RequestBody RequestData data, HttpServletResponse response) throws IOException {
	 	
	 	System.out.println("saveSuccess.aws 들어옴(controller)");
        System.out.println("요청된 날짜: " + data.getDate());

        String imageUrl = "/resources/image/success.png";
        String jsonResponse = "{\"success\": true, \"imageUrl\": \"" + imageUrl + "\"}";

        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().write(jsonResponse);
       
    }

    public static class RequestData {
        private String date;

        public String getDate() {
            return date;
        }

        public void setDate(String date) {
            this.date = date;
        }
    }
	
	
	
	
	
	
}

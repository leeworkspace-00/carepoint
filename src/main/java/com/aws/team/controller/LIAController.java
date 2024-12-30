package com.aws.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/LIA/")
public class LIAController {
	
	private static final Logger logger = LoggerFactory.getLogger(LIAController.class);
	
	@RequestMapping(value="freeBoardList.aws", method=RequestMethod.GET)
	public String freeBoardList() {
		
		return "WEB-INF/LIA/freeBoardList"; 
	}
	
	@RequestMapping(value="qnaBoardList.aws", method=RequestMethod.GET)
	public String qnaBoardList() {
		
		return "WEB-INF/LIA/qnaBoardList"; 
	}
	
	@RequestMapping(value="noticeBoardList.aws", method=RequestMethod.GET)
	public String noticeBoardList() {
		
		return "WEB-INF/LIA/noticeBoardList"; 
	}
	
	@RequestMapping(value="exerciseMain.aws", method=RequestMethod.GET)
	public String exerciseMain() {
		
		return "WEB-INF/LIA/exerciseMain"; 
	}
	
	@RequestMapping(value="bmi.aws", method=RequestMethod.GET)
	public String bmi() {
		
		return "WEB-INF/LIA/bmi"; 
	}
	
	@RequestMapping(value="calculateBMI.aws", method=RequestMethod.POST)
    public String calculateBMI(@RequestParam double height, @RequestParam double weight, Model model) {
        // Ű�� ���� ������ ��ȯ
		double heightInMeters = height / 100.0; // Ű(cm) -> m ��ȯ
        double bmi = weight / (heightInMeters * heightInMeters);
        double standardWeight = (height - 100) * 0.9;

        String bmiCategory;
        if (bmi < 18.5) {
            bmiCategory = "��ü��";
        } else if (bmi < 23) {
            bmiCategory = "����";
        } else if (bmi < 25) {
            bmiCategory = "��ü��";
        } else {
            bmiCategory = "��";
        }

        model.addAttribute("bmi", String.format("%.2f", bmi));
        model.addAttribute("standardWeight", String.format("%.2f", standardWeight));
        model.addAttribute("bmiCategory", bmiCategory);

        // ��� ������ ��ȯ
        return "WEB-INF/LIA/bmi";
    }

	
	 

}

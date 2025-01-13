package com.aws.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aws.team.domain.ExerciseVo;
import com.aws.team.domain.GraphVo;
import com.aws.team.service.ExerciseService;

@Controller
@RequestMapping(value="/exercise/")
public class ExericesController {
	
	@Autowired(required=false)
    private ExerciseService exerciseService;
	
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

            bmiCategory = "정상";

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
	@RequestMapping(value="saveExercise.aws", method=RequestMethod.POST)
	public ResponseEntity<?> saveExercise(@RequestBody ExerciseVo ev) {
        try {
            // 유효성 검사
            if (ev.getHour() < 0 || ev.getMinute() < 0 || ev.getMinute() >= 60) {
                return ResponseEntity.badRequest().body("{\"success\": false, \"message\": \"Invalid time values.\"}");
            }

            exerciseService.saveExercise(ev);
            
            return ResponseEntity.ok("{\"success\": true}");
            
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"success\": false, \"message\": \"Server error.\"}");
        }
    }
	
 	@RequestMapping(value="calendar-events.aws", method=RequestMethod.GET)
    public ResponseEntity<List<Map<String, Object>>> getCalendarEvents() {
		
		// DB에서 저장된 운동 기록 가져오기
        List<ExerciseVo> ev = exerciseService.getAllExercises();
        
        // FullCalendar 형식에 맞게 변환
        List<Map<String, Object>> events = ev.stream().map(exercise -> {
            Map<String, Object> event = new HashMap<>();           
            event.put("title", "운동 시간 : " + exercise.getHour() + "시간 " + exercise.getMinute() + "분");
            event.put("start", exercise.getSelectdate());
            event.put("extendedProps", Map.of("eventType", "exercise"));
            return event;
        }).collect(Collectors.toList());

        return ResponseEntity.ok(events);
    }
 	
 	@RequestMapping(value="graphInsert.aws", method=RequestMethod.POST)
 	public String graphInsert(
 			@RequestParam String blood_sugar, 
            @RequestParam String blood_press, 
            @RequestParam String weight,
 			GraphVo gv,
 			HttpServletRequest request,
			RedirectAttributes rttr) {
 		
 		System.out.println("controller 들어옴");
 		
 		String user_pk = request.getSession().getAttribute("user_pk").toString();
		int user_pk_int = Integer.parseInt(user_pk); // 회원번호를 숫자형으로 추출
		
		int blood_sugar_int = Integer.parseInt(blood_sugar);
		int blood_press_int = Integer.parseInt(blood_press);
		int weight_int = Integer.parseInt(weight);
		
		gv.setBlood_sugar(blood_sugar_int);
		gv.setBlood_press(blood_press_int);
		gv.setWeight(weight_int);
		gv.setUser_pk(user_pk_int);
		
		System.out.println("혈당: " + gv.getBlood_sugar());
	    System.out.println("혈압: " + gv.getBlood_press());
	    System.out.println("몸무게: " + gv.getWeight());
	    System.out.println("user_pk: " + gv.getUser_pk());
		
		int value = exerciseService.graphInsert(gv);
		
		String path="";
		if (value == 1) { 
			rttr.addFlashAttribute("msg", "오늘의 수치가 저장되었습니다.");
			path = "redirect:/exercise/exerciseMain.aws"; 
		}
		
 		return path;
 	}
 	
 	
 	
}

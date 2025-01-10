package com.aws.team.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aws.team.domain.FoodVo;
import com.aws.team.persistance.FoodMapper;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class FoodServiceImpl implements FoodService {
	
	private FoodMapper fm;
	
	@Autowired(required=false) /* 주입시킨다 */  
	public FoodServiceImpl(SqlSession sqlSession) {
		this.fm = sqlSession.getMapper(FoodMapper.class); /* 꼭 뒤에 클래스가 붙어야한다. */ 
	}
	

	    @Override
	    public List<FoodVo> getFoodInfo(String foodName) {
	        // 결과를 담을 리스트 생성
	        List<FoodVo> foodList = new ArrayList<>();

	        // HTTP 클라이언트를 생성하고, try-with-resources로 자동으로 닫히도록 설정
	        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
	            // 음식 이름을 URL에 맞게 인코딩
	            String encodedFoodName = URLEncoder.encode(foodName, "UTF-8");
	            
	            // API 요청 URL을 구성 (서비스 키와 음식 이름 포함)
	            String url = "https://apis.data.go.kr/1471000/FoodNtrCpntDbInfo01/getFoodNtrCpntDbInq01" +
	                         "?serviceKey=S15Q20%2BeKCS9XCxG%2BBSU%2FyMA3XAfmRYgzURInD%2BA5qWVaViHx2JBGK2G8g7S8F2cipeL1lLYJoFto1DX2FxpNw%3D%3D" +
	                         "&FOOD_NM_KR=" + encodedFoodName +
	                         "&numOfRows=15&pageNo=1&type=json";

	            // HTTP GET 요청 객체 생성
	            HttpGet request = new HttpGet(url);
	            // HTTP 요청 실행
	            CloseableHttpResponse response = httpClient.execute(request);

	            // 응답 상태 코드 확인
	            int statusCode = response.getStatusLine().getStatusCode();
	            if (statusCode == 200) { // 상태 코드가 200이면 성공
	                // 응답 데이터를 문자열로 변환
	                String json = EntityUtils.toString(response.getEntity());
	                // JSON 데이터를 처리하기 위해 ObjectMapper 생성
	                ObjectMapper mapper = new ObjectMapper();
	                // JSON 문자열을 JsonNode 객체로 변환
	                JsonNode rootNode = mapper.readTree(json);

	                // 필요한 데이터 위치 (body > items)로 접근
	                JsonNode itemsNode = rootNode.path("body").path("items");

	                // items 노드가 존재하고 배열일 경우 처리
	                if (!itemsNode.isMissingNode() && itemsNode.isArray()) {
	                    int count = 0; // 최대 15개의 데이터만 처리하기 위해 카운터 변수 추가
	                    for (JsonNode item : itemsNode) {
	                        if (count >= 15) break; // 15개를 초과하면 루프 종료

	                        // FoodVo 객체 생성 및 데이터 설정
	                        FoodVo fv = new FoodVo();
	                        fv.setMenuName(item.path("FOOD_NM_KR").asText()); // 메뉴 이름
	                        fv.setCalorie(item.path("AMT_NUM1").asDouble()); // 칼로리
	                        fv.setProtein(item.path("AMT_NUM3").asDouble()); // 단백질
	                        fv.setFat(item.path("AMT_NUM4").asDouble()); // 지방
	                        fv.setCarb(item.path("AMT_NUM7").asDouble()); // 탄수화물

	                        // FoodVo 객체를 리스트에 추가
	                        foodList.add(fv);
	                        count++; // 카운터 증가
	                    }
	                }
	            }
	        } catch (Exception e) {
	            // 예외 발생 시 스택 트레이스를 출력
	            e.printStackTrace();
	        }

	        // 결과 리스트 반환
	        return foodList;
	    }
	    
	    
	    @Override
	    @Transactional
	    public int foodInsert(FoodVo foodVo, List<FoodVo> menuList) {
	        // 1. Food 테이블에 Insert or Update
	        int result = fm.foodInsert(foodVo);

	        // 2. 메뉴 데이터 삽입
	        if (result > 0) {
	            for (FoodVo menuItem : menuList) {
	                menuItem.setFoodPk(foodVo.getFoodPk());
	                fm.foodListInsert(menuItem);
	            }
	        }
	        return result;
	    }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	}






	
	
	


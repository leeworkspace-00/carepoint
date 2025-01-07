package com.aws.team.service;

import java.net.URLEncoder;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;
import com.aws.team.domain.FoodVo;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class FoodServiceImpl implements FoodService {
	

	@Override
	public FoodVo getFoodInfo(String foodName) {
	    FoodVo foodVo = new FoodVo();

	    try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
	        String encodedFoodName = URLEncoder.encode(foodName, "UTF-8");
	        String url = "https://apis.data.go.kr/1471000/FoodNtrCpntDbInfo01/getFoodNtrCpntDbInq01" +
	                     "?serviceKey=S15Q20%2BeKCS9XCxG%2BBSU%2FyMA3XAfmRYgzURInD%2BA5qWVaViHx2JBGK2G8g7S8F2cipeL1lLYJoFto1DX2FxpNw%3D%3D"+
	                     "&FOOD_NM_KR=" + encodedFoodName +
	                     "&numOfRows=10&pageNo=1&type=json";

	        System.out.println("Generated URL: " + url); // 디버깅용 출력

	        HttpGet request = new HttpGet(url);
	        CloseableHttpResponse response = httpClient.execute(request);

	        int statusCode = response.getStatusLine().getStatusCode();
	        System.out.println("Status Code: " + statusCode); // 상태 코드 확인 200 완료

	        if (statusCode == 200) {
	            String json = EntityUtils.toString(response.getEntity());
	            System.out.println("Response JSON: " + json); // 응답 출력 정상출력 완료

	            ObjectMapper mapper = new ObjectMapper();
	            JsonNode rootNode = mapper.readTree(json);

	            JsonNode itemsNode = rootNode.path("body").path("items"); // items 배열로 바로 접근

	            if (!itemsNode.isMissingNode() && itemsNode.isArray() && itemsNode.size() > 0) {
	                JsonNode firstItem = itemsNode.get(0); // 첫번째 아이템 가져오기
	                
	                // 디버깅용 출력
	                System.out.println("FOOD_NM_KR: " + firstItem.path("FOOD_NM_KR").asText());
	                System.out.println("AMT_NUM1 (Calories): " + firstItem.path("AMT_NUM1").asText());
	                System.out.println("AMT_NUM3 (Protein): " + firstItem.path("AMT_NUM3").asText());
	                System.out.println("AMT_NUM4 (Fat): " + firstItem.path("AMT_NUM4").asText());
	                System.out.println("AMT_NUM7 (Carbs): " + firstItem.path("AMT_NUM7").asText());
	                
	                foodVo.setMenuName(firstItem.path("FOOD_NM_KR").asText());
	                foodVo.setCalorie(firstItem.path("AMT_NUM1").asDouble());
	                foodVo.setProtein(firstItem.path("AMT_NUM3").asDouble());
	                foodVo.setFat(firstItem.path("AMT_NUM4").asDouble());
	                foodVo.setCarb(firstItem.path("AMT_NUM7").asDouble());
	            
	            } else {
	            	System.out.println("No valid data found in the response.");
	            }
	        } else {
	            System.out.println("Response Body (Error): " + EntityUtils.toString(response.getEntity()));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return foodVo;
	}

}



	
	
	


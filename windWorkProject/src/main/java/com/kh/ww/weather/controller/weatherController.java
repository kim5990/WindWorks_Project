package com.kh.ww.weather.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.ww.weather.model.weatherVo;

@Controller
public class weatherController {
	public static final String SERVICE_KEY = "jLS77SV9j24p0UBPRNFQBXYUGk0OaCCTk6wb%2FDrIDsz6jSdLU8tRjsLNTwJIWf7qGfrBJJ72sCNTJCwXDiSKzQ%3D%3D";
	
	@ResponseBody  
	@RequestMapping(value="weatherView.we", produces="application/json; charset=UTF-8")
	public String weatherView(String todayDate, String todayTime) throws IOException  {
		System.out.println(todayDate);
		System.out.println(todayTime);
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
		url += "?serviceKey=" + SERVICE_KEY;
		url += "&pageNo=1&numOfRows=809&dataType=JSON";
		url += "&base_date=" + todayDate;
		url += "&base_time=" + todayTime;
		url += "&nx=61&ny=125";
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
//		JsonObject totalObj = JsonParser.parseString(responseText).getAsJsonObject();
//		System.out.println(totalObj);
//		
//		JsonObject responseObj = totalObj.getAsJsonObject("response"); // response속성에 접근 : {} JsonObject
//		System.out.println(responseObj);
//		
//		JsonObject bodyObj = responseObj.getAsJsonObject("body"); // body속성에 접근 : {} JsonObject
//		System.out.println(bodyObj);
//		
//		int totalCount = bodyObj.get("totalCount").getAsInt();
//		System.out.println(totalCount);
//		
//		JsonArray itemArr = bodyObj.getAsJsonArray("items"); // items속성 접근 : [] JsonArray
//		System.out.println(itemArr);
//		
//		ArrayList<weatherVo> list = new ArrayList();
//		for (int i = 0; i < itemArr.size(); i++) {
//			JsonObject item = itemArr.get(i).getAsJsonObject();
//			
//			weatherVo weather = new weatherVo();
//			
//			weather.setFcstTime(item.get("fcstTime").getAsString());
//			weather.setCategory(item.get("category").getAsString());
//			weather.setFcstValue(item.get("fcstValue").getAsString());
//			
//			
//			list.add(weather);
//		}
		
		br.close();
		urlConnection.disconnect();
		
		return responseText;
	}
	 
	
}

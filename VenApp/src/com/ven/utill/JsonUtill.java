package com.ven.utill;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

public class JsonUtill {
private static ObjectMapper mapper=null;
static{
	mapper=new ObjectMapper();
}
public static String convertJavaToJson(Object obj){
	String jsonResponse="";
	try {
		jsonResponse=mapper.writeValueAsString(obj);
	} catch (JsonGenerationException e) {
		jsonResponse="Unable to process your request";
		e.printStackTrace();
	} catch (JsonMappingException e) {
		jsonResponse="Unable to process your request";
		e.printStackTrace();
	} catch (IOException e) {
		jsonResponse="Unable to process your request";
		e.printStackTrace();
	}
	return jsonResponse;
}
}

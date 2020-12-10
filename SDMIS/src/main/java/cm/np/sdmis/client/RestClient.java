package cm.np.sdmis.client;

import java.util.Arrays;

import org.jboss.jandex.Main;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.np.sdmis.dto.APIDto;

public class RestClient {
	
	 public static void main( String[] args )
	    {
		 getSchool( "16030601902" );
	    }
	public static APIDto getSchool(String udiseCode) {
		
		APIDto response = new APIDto();
		try {
			String url = "https://api.udiseplus.gov.in/v1/public/schoolMaster/byUdiseCode?udiseCode=" + udiseCode;
			HttpHeaders httpHeaders = new HttpHeaders();
			httpHeaders.setContentType(MediaType.APPLICATION_JSON);
			httpHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			HttpEntity entity = new HttpEntity(httpHeaders);
			RestTemplate restTemplate = new RestTemplate();
			String response1 = restTemplate.getForObject(url, String.class);
			// LOGGER.info( "Before convert Response1:: " + response1 );
			ObjectMapper mapper = new ObjectMapper();
			APIDto data = mapper.readValue(response1, APIDto.class);
			response = data;
			System.out.println("Data: " + data);

		} catch (Exception e) {
			e.printStackTrace();
			// response.setStatusCode( CRMServiceCode.CRM300.getStatusCode() );
			// response.setStatusDesc( CRMServiceCode.CRM300.getStatusDesc() );
			// response.setApiErrorCode( e.getMessage() );
			// return response;
			// TODO Auto-generated catch block
		}
		return response;
	}

}

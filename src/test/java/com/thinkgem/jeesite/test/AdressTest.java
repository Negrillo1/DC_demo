package com.thinkgem.jeesite.test;

import java.io.UnsupportedEncodingException;

import org.junit.Test;

import com.thinkgem.jeesite.common.utils.address.AddressUtils;

import net.sf.json.JSONObject;

public class AdressTest {

	@Test
	public void getAddressByIp() throws Exception {
		// 参数ip
		String ip = "219.136.134.157";
		// json_result用于接收返回的json数据
		String json_result = null;
		try {
			json_result = AddressUtils.getAddresses("ip=" + ip, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		JSONObject json = JSONObject.fromObject(json_result);
		System.out.println("json数据： " + json);
		String country = JSONObject.fromObject(json.get("data")).get("country").toString();
		String region = JSONObject.fromObject(json.get("data")).get("region").toString();
		String city = JSONObject.fromObject(json.get("data")).get("city").toString();
		String county = JSONObject.fromObject(json.get("data")).get("county").toString();
		String isp = JSONObject.fromObject(json.get("data")).get("isp").toString();
		String area = JSONObject.fromObject(json.get("data")).get("area").toString();
		System.out.println("国家： " + country);
		System.out.println("地区： " + area);
		System.out.println("省份: " + region);
		System.out.println("城市： " + city);
		System.out.println("区/县： " + county);
		System.out.println("互联网服务提供商： " + isp);
		
		String address = country + "/";
		address += region + "/";
		address += city + "/";
		address += county;
		System.out.println(address);
	}
}

package com.sdmis.constant;

import lombok.Getter;

@Getter
public enum ResponceCode {

	
	App001("APP001","Request successfully processed"),
	App002("APP002","Unable to process your request"),
	App003("APP003","No record found"),
	App004("APP004","Please enter a valid OTP"),
	App005("APP005","User already exist"),
	App006("APP006","User not verified"),
	App007("APP007","Invalid Request"),
	App008("APP008","Password Mismatch or login with New user"),
	App009("APP009","Invalid Otp or login with New user."),
	App010("APP010","Teacher Profile not found with given details"),
    App011("APP011","Meeting link not yet activated.");
    
	
		
	private ResponceCode(String statusCode, String statusDesc) {
		this.statusCode = statusCode;
		this.statusDesc = statusDesc;
	}
	private String statusCode;
	private String statusDesc;
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public String getStatusDesc() {
		return statusDesc;
	}
	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}
	
	
	
	
	
	
}



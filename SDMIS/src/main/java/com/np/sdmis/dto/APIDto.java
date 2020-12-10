package com.np.sdmis.dto;

import java.io.Serializable;

public class APIDto implements Serializable {



	 private String apiId;
	 private String apiName;
	 private String apiVersion;
	 private String developedBy;
	 private String method;
	 private String releasedDate;
	 private String requestedTime;
	 private String requestedBy;
	 private String authenticationType;
	 private float responseId;
	 Data DataObject;
	 private float statusCode;
	 private String statusMessage;


	 // Getter Methods 

	 public String getApiId() {
	  return apiId;
	 }

	 public String getApiName() {
	  return apiName;
	 }

	 public String getApiVersion() {
	  return apiVersion;
	 }

	 public String getDevelopedBy() {
	  return developedBy;
	 }

	 public String getMethod() {
	  return method;
	 }

	 public String getReleasedDate() {
	  return releasedDate;
	 }

	 public String getRequestedTime() {
	  return requestedTime;
	 }

	 public String getRequestedBy() {
	  return requestedBy;
	 }

	 public String getAuthenticationType() {
	  return authenticationType;
	 }

	 public float getResponseId() {
	  return responseId;
	 }

	 public Data getData() {
	  return DataObject;
	 }

	 public float getStatusCode() {
	  return statusCode;
	 }

	 public String getStatusMessage() {
	  return statusMessage;
	 }

	 // Setter Methods 

	 public void setApiId(String apiId) {
	  this.apiId = apiId;
	 }

	 public void setApiName(String apiName) {
	  this.apiName = apiName;
	 }

	 public void setApiVersion(String apiVersion) {
	  this.apiVersion = apiVersion;
	 }

	 public void setDevelopedBy(String developedBy) {
	  this.developedBy = developedBy;
	 }

	 public void setMethod(String method) {
	  this.method = method;
	 }

	 public void setReleasedDate(String releasedDate) {
	  this.releasedDate = releasedDate;
	 }

	 public void setRequestedTime(String requestedTime) {
	  this.requestedTime = requestedTime;
	 }

	 public void setRequestedBy(String requestedBy) {
	  this.requestedBy = requestedBy;
	 }

	 public void setAuthenticationType(String authenticationType) {
	  this.authenticationType = authenticationType;
	 }

	 public void setResponseId(float responseId) {
	  this.responseId = responseId;
	 }

	 public void setData(Data dataObject) {
	  this.DataObject = dataObject;
	 }

	 public void setStatusCode(float statusCode) {
	  this.statusCode = statusCode;
	 }

	 public void setStatusMessage(String statusMessage) {
	  this.statusMessage = statusMessage;
	 }

	@Override
	public String toString() {
		return "APIDto [apiId=" + apiId + ", apiName=" + apiName + ", apiVersion=" + apiVersion + ", developedBy="
				+ developedBy + ", method=" + method + ", releasedDate=" + releasedDate + ", requestedTime="
				+ requestedTime + ", requestedBy=" + requestedBy + ", authenticationType=" + authenticationType
				+ ", responseId=" + responseId + ", DataObject=" + DataObject + ", statusCode=" + statusCode
				+ ", statusMessage=" + statusMessage + "]";
	}

}

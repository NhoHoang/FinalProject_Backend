package com.vti.exam.response;


public class ObjectResponse {
	int code;
	String mes;
	Object data;
	public ObjectResponse(int code, String mes, Object data) {
		super();
		this.code = code;
		this.mes = mes;
		this.data = data;
	}
	public ObjectResponse(int code, String mes) {
		super();
		this.code = code;
		this.mes = mes;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMes() {
		return mes;
	}
	public void setMes(String mes) {
		this.mes = mes;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	

	

	
	

	



}

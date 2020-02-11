package com.example.demo.uitils;

/**
 * 统一接口返回格式
 * **/

public class ResHelper<T> {
	
	public T data;
	public int code;
	public String message;
	
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public void success() {
		this.message = "Success";
		this.code = 200;
	}
	
	public void error(String error) {
		this.pushMessage(error);
		this.code = 500;
	}
	public void pushMessage(String message) {
		if(this.message == null) this.message = "";
		this.message += " " + message;
	}
	
}

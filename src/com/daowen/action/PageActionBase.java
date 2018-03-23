package com.daowen.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.runner.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



//****����������

public abstract class PageActionBase{
	
    public HttpServletResponse response;
    
    public HttpServletRequest  request;
    
	public abstract  void save(); 
	
	public abstract  void update(); 
	
	public abstract  void delete(); 
	
	public abstract  void binding(); 
	
	public abstract  void load(); 
	
	
	public void loadMethod(HttpServletRequest request,HttpServletResponse response){
		
		System.out.println("ִ�в���");
		this.request=request;
		this.response=response;
		String actiontype = request.getParameter("actiontype");
		if (actiontype == null)
			return ;
		// ����ǻ�ȡ������
		if (actiontype.equals("get") || actiontype.equals("search")) {
			binding();
		}
		// ����
		if (actiontype.equals("load")) {
			load();
		}
		if (actiontype.equals("delete")) {
			delete();
		}
		// �������
		if (actiontype.equals("save")) {
			save();
		}
		// ���в���
		if (actiontype.equals("update")) {
			update();
		}
		onLoad();
		
		
	}
	public void  onLoad(){
		
	}
	
	
	/***********************************
	 * *********************************
	 * �ַ��������
	 
	 */
	public  void  dispatchParams(HttpServletRequest request,HttpServletResponse response){
		Enumeration  params=request.getParameterNames();
		while (params.hasMoreElements())
		{
		   String paramname=params.nextElement().toString();
		   String value=request.getParameter(paramname);
		   request.setAttribute(paramname, value);
	   
		   
		}
	}
	
	
	
	
	

	
}

package com.daowen.action;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SQLQuery;
import org.hibernate.Query;
import org.springframework.stereotype.Controller;

import com.daowen.dal.*;
import com.daowen.bll.*;
import com.daowen.entity.*;

import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.MessageFormat;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.util.PagerMetal;
/**************************
 * 
 * @author daowen
 * 
 * 会员类型控制
 *
 */
@Controller
public class HytypeAction extends  PageActionBase{
    
	@RequestMapping("/admin/hytypemanager.do")
    public void  execute(HttpServletRequest request,HttpServletResponse response){
		loadMethod(request, response);
		
	}
	
	@Override
	public void  onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return ;
	}
    /********************************************************
    ******************信息注销监听支持*****************************
    *********************************************************/
	public void delete() {
		String id=request.getParameter("id");
		DALBase.delete("hytype", " where id="+id);
		binding();
	}
    /*************************************************************
     ****************保存动作监听支持******************************
    **************************************************************/
	public void save() {
			String forwardurl=request.getParameter("forwardurl");
			//验证错误url
			String errorurl=request.getParameter("errorurl");
				        String name=request.getParameter("name");
		     SimpleDateFormat  sdfhytype=new SimpleDateFormat("yyyy-MM-dd");
             Hytype hytype=new Hytype();
				        hytype.setName(name==null?"":name);
		    //产生验证
		     Boolean validateresult=saveValidate( "where name='"+name+"'");
		     if(validateresult){
			 try {
					request.setAttribute("errormsg","<label class='error'>已存在的类型名</label>");
					request.setAttribute("hytype", hytype);
					request.setAttribute("actiontype", "save");
					request.getRequestDispatcher(errorurl).forward(request, response);
				} catch (Exception e) {
						e.printStackTrace();
				}
				return;
			}
		  DALBase.save(hytype);
		 if(forwardurl==null){
			forwardurl="/admin/hytypemanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	   //新增验证
	   private  boolean  saveValidate(String filter){
		   return	DALBase.isExist("hytype", filter);
	   }
	/******************************************************
	***********************内部附件支持*********************
	*******************************************************/
	public void attachments(String belongid) {
		DALBase.delete("attachement", MessageFormat.format(
				" where belongid=''{0}'' and belongtable=''hytype'' ", belongid));
		String[] photos = request.getParameterValues("fileuploaded");
		if (photos == null)
			return;
		for (int i = 0; i < photos.length; i++) {
			Attachement a = new Attachement();
			a.setType("images");
			a.setPubtime(new Date());
			a.setBelongfileldname("id");
			a.setFilename(photos[i]);
			a.setBelongid(belongid);
			a.setBelongtable("hytype");
			a.setUrl(SystemParam.getSiteRoot()+"/upload/temp/" + a.getFilename());
			a.setTitle(a.getFilename());
			DALBase.save(a);
		}
	}
   	/******************************************************
	***********************更新内部支持*********************
	*******************************************************/
	public void update() {
           String forwardurl=request.getParameter("forwardurl");
		   String id=request.getParameter("id");
		   if(id==null)
			   return;
		   Hytype  hytype=(Hytype)DALBase.load(Hytype.class,new Integer(id));
		    if(hytype==null)
			   return;
				       String name=request.getParameter("name");
			  SimpleDateFormat  sdfhytype=new SimpleDateFormat("yyyy-MM-dd");
					        hytype.setName(name);
		    DALBase.update(hytype);
			 if(forwardurl==null){
				forwardurl="/admin/hytypemanager.do?actiontype=get";
			}
			try {
				response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
			} catch (Exception e) {
				e.printStackTrace();
			} 
	}
   	/******************************************************
	***********************加载内部支持*********************
	*******************************************************/
	public void load() {
	        //
		    String id=request.getParameter("id");
		    String actiontype="save";
		    dispatchParams(request, response);
			if(id!=null) 
			{
			   Hytype  hytype=(Hytype)DALBase.load("hytype","where id="+id);
				if(hytype!=null) 
				{
				    request.setAttribute("hytype", hytype);
				}
				actiontype="update";
				request.setAttribute("id", id);
			}
		    request.setAttribute("actiontype", actiontype);
		    String forwardurl=request.getParameter("forwardurl");
		    System.out.println("forwardurl="+forwardurl);
		    if(forwardurl==null){
		     	forwardurl="/admin/hytypeadd.jsp";
		   }
		    try {
				request.getRequestDispatcher(forwardurl).forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
   	/******************************************************
	***********************数据绑定内部支持*********************
	*******************************************************/
	public void   binding(){
		 String filter="where 1=1 ";
String name=request.getParameter("name");
	              if(name!=null)
	                     filter+="  and name like '%"+name+"%'  ";
		 //
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Hytype> listhytype = DALBase.getPageEnity("hytype", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("hytype",
				filter == null ? "" : filter);
		request.setAttribute("listhytype", listhytype);
		PagerMetal pm = new PagerMetal(recordscount);
		//设置尺寸
		pm.setPagesize(pagesize);
		//设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		//分发请求参数
		dispatchParams(request, response);
		String forwardurl=request.getParameter("forwardurl");
		System.out.println("forwardurl="+forwardurl);
		if(forwardurl==null){
			forwardurl="/admin/hytypemanager.jsp";
		}
		try {
			request.getRequestDispatcher(forwardurl).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

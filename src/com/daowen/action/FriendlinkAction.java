﻿package com.daowen.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.dal.*;
import com.daowen.bll.*;
import com.daowen.entity.*;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.MessageFormat;

import com.daowen.util.PagerMetal;


@Controller
public class FriendlinkAction extends PageActionBase {

	@RequestMapping("/admin/friendlinkmanager.do")
    public void  execute(HttpServletRequest request,HttpServletResponse response){
		loadMethod(request, response);
		
	}
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;

	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("friendlink", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String title = request.getParameter("title");
		String href = request.getParameter("href");
		SimpleDateFormat sdffriendlink = new SimpleDateFormat("yyyy-MM-dd");
		Friendlink friendlink = new Friendlink();
		friendlink.setTitle(title == null ? "" : title);
		friendlink.setHref(href == null ? "" : href);
		DALBase.save(friendlink);

		// 绑定数据
		binding();
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Friendlink friendlink = (Friendlink) DALBase.load(Friendlink.class,
				new Integer(id));
		if (friendlink == null)
			return;
		String title = request.getParameter("title");
		String href = request.getParameter("href");
		SimpleDateFormat sdffriendlink = new SimpleDateFormat("yyyy-MM-dd");
		friendlink.setTitle(title);
		friendlink.setHref(href);
		DALBase.update(friendlink);

		binding();
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Friendlink friendlink = (Friendlink) DALBase.load("friendlink",
					"where id=" + id);
			if (friendlink != null) {
				request.setAttribute("friendlink", friendlink);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		try {
			request.getRequestDispatcher("friendlinkadd.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void binding() {
		String filter = "";
		//

		String title = request.getParameter("title");
		if (title != null)
			filter = "  where title like '%" + title + "%'  ";
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
		List<Friendlink> listfriendlink = DALBase.getPageEnity("friendlink",
				filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("friendlink",
				filter == null ? "" : filter);
		request.setAttribute("listfriendlink", listfriendlink);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		try {
			request.getRequestDispatcher("/admin/friendlinkmanager.jsp")
					.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

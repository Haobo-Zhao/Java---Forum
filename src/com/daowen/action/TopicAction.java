package com.daowen.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.dal.*;
import com.daowen.bll.*;
import com.daowen.entity.*;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.MessageFormat;

import com.daowen.util.PagerMetal;

/**************************
 * 
 * @author daowen
 * 
 * 帖子控制
 * 
 */
@Controller
public class TopicAction extends PageActionBase {
	
	
	@RequestMapping("/admin/topicmanager.do")
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
		DALBase.delete("topic", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String bkid = request.getParameter("bkid");
		String bkname = request.getParameter("bkname");
		String clickcount = request.getParameter("clickcount");
		String istopic = request.getParameter("istopic");
		String lastreplyor = request.getParameter("lastreplyor");
		String lastreplytime = request.getParameter("lastreplytime");
		String replycount = request.getParameter("replycount");
		String replyid = request.getParameter("replyid");
		String dcontent = request.getParameter("dcontent");
		SimpleDateFormat sdftopic = new SimpleDateFormat("yyyy-MM-dd");
		Topic topic = new Topic();
		topic.setTitle(title == null ? "" : title);
		topic.setPubren(pubren == null ? "" : pubren);
		if (pubtime != null) {
			try {
				topic.setPubtime(sdftopic.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			topic.setPubtime(new Date());
		}
		topic.setBkid(bkid == null ? 0 : new Integer(bkid));
		topic.setBkname(bkname == null ? "" : bkname);
		topic.setClickcount(clickcount == null ? 0 : new Integer(clickcount));
		topic.setIstopic(istopic == null ? 0 : new Integer(istopic));
		topic.setLastreplyor(lastreplyor == null ? "" : lastreplyor);
		if (lastreplytime != null) {
			try {
				topic.setLastreplytime(sdftopic.parse(lastreplytime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			topic.setLastreplytime(new Date());
		}
		topic.setReplycount(replycount == null ? 0 : new Integer(replycount));
		topic.setReplyid(replyid == null ? 0 : new Integer(replyid));
		topic.setDcontent(dcontent == null ? "" : dcontent);
		DALBase.save(topic);
		
		if (forwardurl == null) {
			forwardurl = "/admin/topicmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/******************************************************
	 *********************** 内部附件支持*********************
	 *******************************************************/
	public void attachments(String belongid) {
		DALBase.delete("attachement", MessageFormat.format(
				" where belongid=''{0}'' and belongtable=''topic'' ", belongid));
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
			a.setBelongtable("topic");
			a.setUrl(SystemParam.getSiteRoot() + "/upload/temp/"
					+ a.getFilename());
			a.setTitle(a.getFilename());
			DALBase.save(a);
		}
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Topic topic = (Topic) DALBase.load(Topic.class, new Integer(id));
		if (topic == null)
			return;
		String title = request.getParameter("title");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String bkid = request.getParameter("bkid");
		String bkname = request.getParameter("bkname");
		String clickcount = request.getParameter("clickcount");
		String istopic = request.getParameter("istopic");
		String lastreplyor = request.getParameter("lastreplyor");
		String lastreplytime = request.getParameter("lastreplytime");
		String replycount = request.getParameter("replycount");
		String replyid = request.getParameter("replyid");
		String dcontent = request.getParameter("dcontent");
		SimpleDateFormat sdftopic = new SimpleDateFormat("yyyy-MM-dd");
		topic.setTitle(title);
		topic.setPubren(pubren);
		if (pubtime != null) {
			try {
				topic.setPubtime(sdftopic.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		topic.setBkid(bkid == null ? 0 : new Integer(bkid));
		topic.setBkname(bkname);
		topic.setClickcount(clickcount == null ? 0 : new Integer(clickcount));
		topic.setIstopic(istopic == null ? 0 : new Integer(istopic));
		topic.setLastreplyor(lastreplyor);
		if (lastreplytime != null) {
			try {
				topic.setLastreplytime(sdftopic.parse(lastreplytime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		topic.setReplycount(replycount == null ? 0 : new Integer(replycount));
		topic.setReplyid(replyid == null ? 0 : new Integer(replyid));
		topic.setDcontent(dcontent);
		DALBase.update(topic);
	
		if (forwardurl == null) {
			forwardurl = "/admin/topicmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
			Topic topic = (Topic) DALBase.load("topic", "where id=" + id);
			if (topic != null) {
				request.setAttribute("topic", topic);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/topicadd.jsp";
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
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void binding() {
		String filter = "where 1=1 ";
		String title = request.getParameter("title");
		String pubren=request.getParameter("pubren");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		//
		if(pubren!=null)
			filter+=" and pubren='"+pubren+"'";
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
		List<Topic> listtopic = DALBase.getPageEnity("topic", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("topic", filter == null ? ""
				: filter);
		request.setAttribute("listtopic", listtopic);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/topicmanager.jsp";
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

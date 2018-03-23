package com.daowen.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SQLQuery;
import org.hibernate.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.dal.*;
import com.daowen.bll.*;
import com.daowen.entity.*;

import java.io.IOException;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.MessageFormat;

@Controller
public class BankuaiAction extends PageActionBase {
	
	
	@RequestMapping("/admin/bankuaimanager.do")
	public void execute(HttpServletRequest request,HttpServletResponse response) {
		
		
		  loadMethod(request, response);
	}

	
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		
		if(actiontype==null)
			return ;
			
		
	}

	
	
	public void delete() {
		String id = request.getParameter("id");
				
		deleteBlock(new Integer(id));
	}
	
	
   private  void deleteBlock(int bkid)
   {
	
		DALBase.delete("topic","where bkid="+bkid);
		
	   List<Topic> topicList=DALBase.getEntity("topic", "where bkid='"+bkid+"'");
		
	   for(Topic t1 : topicList)
	   {
		   deleteTopic(t1.getId());
	   }
	   ForumBlockTree blockTree=new ForumBlockTree();
	   blockTree.deleteLeafNode("bankuai", bkid);
	   
	
   }
	
   public void   deleteTopic(int topicid)
	{
		
		DALBase.delete("topic","where id="+topicid);
		
		DALBase.delete("attachement", MessageFormat.format(
				" where belongid=''{0}'' and belongtable=''topic'' ",
				topicid));
		
	    List<Topic> list=DALBase.getEntity("topic", "where replyid='"+topicid+"'");
	    
	    for(Topic topic : list)
	    {
	    	DALBase.delete("attachement", MessageFormat.format(
					" where belongid=''{0}'' and belongtable=''topic'' ",
					topic.getId()));
	    	DALBase.delete(topic);
	    }
		
		
		
		
	}

	public void save() {
		
		String name = request.getParameter("name");
		String forwardurl=request.getParameter("forwardurl");
		String creator = request.getParameter("creator");
	
		String des = request.getParameter("des");
		
		String parentid = request.getParameter("parentid");
		String isshow=request.getParameter("isshow");
		SimpleDateFormat sdfbankuai = new SimpleDateFormat("yyyy-MM-dd");
		Bankuai bankuai = new Bankuai();
		bankuai.setName(name);
	    bankuai.setCreator(creator);	
		bankuai.setCreatetime(new Date());
		bankuai.setIshow(isshow==null?1:new Integer(isshow));
		bankuai.setDes(des);
		
		bankuai.setIsleaf(1);
		if(parentid!=null)
			bankuai.setParentid(new Integer(parentid));
		ForumBlockTree blockTree =new ForumBlockTree();
		blockTree.saveTreeNode(bankuai);
		
	
		try {
			response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
		
	}

	private void attachements(String belongid) {
		DALBase.delete("attachement", MessageFormat.format(
						" where belongid=''{0}'' and belongtable=''bankuai'' ",
						belongid));
		String[] photos = request.getParameterValues("fileuploaded");
		String id = request.getParameter("id");
		if (photos == null)
			return;
		for (int i = 0; i < photos.length; i++) {
			Attachement a = new Attachement();
			a.setType("images");
			a.setPubtime(new Date());
			a.setBelongfileldname("id");
			a.setFilename(photos[i]);
			a.setBelongid(belongid);
			a.setBelongtable("bankuai");
			a.setUrl(SystemParam.getSiteRoot() + "/upload/temp/"
					+ a.getFilename());
			a.setTitle(a.getFilename());
			DALBase.save(a);
		}
	}

	


	public void update() {
		String id = request.getParameter("id");
		String forwardurl=request.getParameter("forwardurl");
		if (id == null)
			return;
		Bankuai bankuai = (Bankuai) DALBase.load(Bankuai.class, new Integer(id));
		if (bankuai == null)
			return;
		String name = request.getParameter("name");
		String creator = request.getParameter("creator");
		
		String des = request.getParameter("des");
	
		SimpleDateFormat sdfbankuai = new SimpleDateFormat("yyyy-MM-dd");
		String isshow=request.getParameter("ishow");
		bankuai.setName(name);

		bankuai.setDes(des);
		bankuai.setCreator(creator);
		
		bankuai.setIshow(isshow==null?1:new Integer(isshow));

		DALBase.update(bankuai);
		
		try {
			response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}

	public void load(){
       String id = request.getParameter("id");
		
		String parentid = request.getParameter("parentid");
		if (parentid != null) {

			ForumBlockTree blocktree = new ForumBlockTree();
			int tempid = new Integer(parentid);
            String showtext=blocktree.getShowText("bankuai", tempid);
            System.out.print("showtext="+showtext);
			request.setAttribute("parenttext", showtext);
			request.setAttribute("parentid", parentid);

		} else {
			request.setAttribute("parentid", 0);
			request.setAttribute("parenttext", "°å¿é¸ù·ÖÀà");
		}
	
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Bankuai bankuai = (Bankuai) DALBase.load("bankuai","where id=" + id);
			if (bankuai != null) {
				request.setAttribute("bankuai", bankuai);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/bankuaiadd.jsp";
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

	
	public void binding(){
		
		ForumBlockTree  blocktree=new ForumBlockTree();
		List<Bankuai> listbankuai=blocktree.getTree("bankuai", 0);
		
		request.setAttribute("listbankuai", listbankuai);
		
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/bankuaimanager.jsp";
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

package com.daowen.bll;

import java.text.MessageFormat;
import java.util.List;

import com.daowen.entity.Bankuai;
import com.daowen.entity.Topic;


public class ForumBuilder {

	public static String buildForum(int bkid) {

		StringBuffer sb = new StringBuffer();
		ForumBLL forumbll = new ForumBLL();
		// 查询符合板块
		List<Bankuai> listbankuai = forumbll.getBankuais(0);
		for (Bankuai tembankuai : listbankuai) {

			sb.append("<div class=\"mainbox forumlist\">");
			//展开操作
			sb.append(" <span class=\"headactions\">");
			sb.append(MessageFormat.format(" <img blockid=\"Block{0}\" class=\"collapsed\" title=\"收起/展开\"  alt=\"收起/展开\" src=\"images/collapsed_no.gif\">\r\n",tembankuai.getId()));
                   
			sb.append("</span>");
			
			sb.append(MessageFormat.format("<h3>{0}</h3>",tembankuai.getName()));
			
			sb.append(MessageFormat.format(" <table  id=\"Block{0}\" cellspacing=\"0\"  cellpadding=\"0\">",tembankuai.getId()));
			sb.append("<thead class=\"category\">");
			sb.append("<tr>");
			sb.append(" <th>block</th>");
			sb.append(" <td class=\"nums\">topic</td>");
			sb.append(" <td class=\"nums\">post</td>");
			sb.append(" <td class=\"lastpost\"> last post</td>");
			sb.append("</tr>");
			sb.append("</head>");
			
			sb.append("<tbody>");
			
			 List<Bankuai> subforumlist= forumbll.getBankuais(tembankuai.getId());
             
             for(Bankuai  subforum : subforumlist)
             {
			    sb.append(" <tr>");
			    
			    sb.append(" <th class=\"new\">");
			    sb.append("<h2>");
			    sb.append(MessageFormat.format("<a href=\"topiclist.jsp?bankuaiid={0}\">{1}</a>",subforum.getId(),subforum.getName()));
			    sb.append(MessageFormat.format("<em>(today: {0})</em>",forumbll.getTodayPostcount(subforum.getId())));
			    sb.append("</h2>");
			    sb.append("</th>");
			    sb.append(MessageFormat.format("<td class=\"nums\">{0}</td>",forumbll.getTopiccount(subforum.getId())));
			    
			    sb.append(MessageFormat.format("<td class=\"nums\">{0}</td>",forumbll.getPostcount(subforum.getId())));
			    
			    Topic lasttopic =forumbll.getLastTopic(subforum.getId());
                sb.append(" <td class=\"lastpost\">");
                if(lasttopic!=null)
                {  
                   
                   sb.append(MessageFormat.format("{0}",lasttopic.getTitle()));
                   sb.append(MessageFormat.format("<cite>by:{0}-{1}</cite>",lasttopic.getPubren(),lasttopic.getPubtime().toLocaleString()));
                }else {
                	sb.append(" 板块暂无发表主题");
    			    
				}
                sb.append("</td>");
                
			    sb.append("</tr>");
             }
             sb.append("</tbody>");
			
			
			sb.append("</table>");
			sb.append("</div>");
			

		}

		return sb.toString();
	}

}

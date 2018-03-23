<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.daowen.bll.*"%>
<%@ page import="com.daowen.entity.*" %>
<%@page import="com.daowen.dal.DALBase"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    List<Object> xtype_datasource=DALBase.getEntity("hytype","");
    request.setAttribute("xtype_datasource",xtype_datasource);
    if( id!=null)
    {
      
      Huiyuan temobjhuiyuan=(Huiyuan)DALBase.load("huiyuan"," where id="+ id);
      request.setAttribute("huiyuan",temobjhuiyuan);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>会员信息查看</title>
   	 <link href="<%=SystemParam.getSiteRoot() %>/admin/css/common.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.9.0.js"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>   
</head>
<body >

	<div class="search-title">
		<h2>会员升级</h2>
		<div class="description"></div>
	</div>
   <form name="huiyuanform"  method="post" action="<%=SystemParam.getSiteRoot()%>/admin/huiyuanmanager.do"  id="huiyuanForm">
	    <input type="hidden" name="id" value="<%=id %>" />
		<input type="hidden" name="actiontype" value="shengji" />
		
	   <input type="hidden" name="forwardurl" value="/admin/huiyuanmanager.do?actiontype=get" />
		
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td align="right" class="title">用户名:</td>
			<td>
				${requestScope.huiyuan.accountname}(${requestScope.huiyuan.nickname})
			</td>
			<td colspan="2" rowspan="6"><img id="imgTouxiang" width="200px"
				height="200px" src="${requestScope.huiyuan.touxiang}" /></td>
		</tr>

		<tr>
			<td align="right" class="title">会员类型:</td>
			<td>${requestScope.huiyuan.xtype}</td>
		</tr>

		<tr>
			<td align="right" class="title">注册时间:</td>
			<td><fmt:formatDate value="${requestScope.huiyuan.regdate}" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<td align="right" class="title">登录次数:</td>
			<td>${requestScope.huiyuan.logtimes}</td>
		</tr>

		<tr>
			<td align="right" class="title">邮箱:</td>
			<td>${requestScope.huiyuan.email}</td>
		</tr>
		<tr>
			<td align="right" class="title">移动电话:</td>
			<td>${requestScope.huiyuan.mobile}</td>
		</tr>
		
		<tr>
			<td align="right" class="title">地址:</td>
			<td>${requestScope.huiyuan.address}</td>
			<td align="right" class="title">状态:</td>
			<td>${requestScope.huiyuan.status==1?"正常":"禁用"}</td>
		</tr>
		<tr>
			
			<td align="right" class="title">姓名:</td>
			<td>${requestScope.huiyuan.name}</td>
		
			<td align="right" class="title">职业:</td>
			<td>${requestScope.huiyuan.zhiye}</td>

		
		</tr>
		<tr>
			<td align="right">会员类型:</td>
			<td><web:dropdownlist name="xtype" id="xtype"
					cssclass="dropdown" value="${requestScope.huiyuan.xtype}"
					datasource="${xtype_datasource}" textfieldname="name"
					valuefieldname="name">
				</web:dropdownlist> <input id="hidname" name="name" type="hidden"
				vlaue="${requestScope.huiyuan.name}" /></td>
		</tr>

		<tr>
			<td colspan="4">
				
					<button class="orange-button">
						<i class="icon-ok icon-white"></i>升级
					</button>
				
			</td>
		</tr>




	</table>
	</form>
	
</body>
</html>

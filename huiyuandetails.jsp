<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.daowen.bll.*"%>
<%@ page import="com.daowen.entity.*" %>
<%@page import="com.daowen.dal.DALBase"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
   
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
</head>
<body >

	<div class="search-title">
		<h2>会员查看</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="15%" align="right" class="title">用户名:</td>
			<td width="35%">
				${requestScope.huiyuan.accountname}(${requestScope.huiyuan.nickname})
			</td>
			<td width="*" colspan="2" rowspan="6"><img id="imgTouxiang" width="200px"
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
		
	</table>
</body>
</html>

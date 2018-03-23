<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.daowen.bll.*"%>
<%@ page import="com.daowen.entity.*" %>
<%@page import="com.daowen.dal.DALBase"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>板块</title>
  
  
    
   <link href="<%=SystemParam.getSiteRoot()%>/admin/css/web2table.css"
	rel ="stylesheet" type="text/css" />
   

    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/admin/css/common.css" type="text/css"></link>

    <link href="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.9.0.js"></script>

    <script src="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>

    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
   <script type="text/javascript">
       
        function initControl(){
          
           $("input[type=radio][name=ishow][value=${requestScope.bankuai.ishow}]").attr("checked",true);   
			
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr", "validate");
            var v = $("#bankuaiForm").validate();
        });  
    </script>
</head>
<body >
	
	
	<div class="search-title">
		<h2>new forum block</h2>
		<div class="description"></div>
	</div>
	<form name="bankuaiform" method="post"
		action="<%=SystemParam.getSiteRoot()%>/admin/bankuaimanager.do"
		id="bankuaiForm">
		<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="forwardurl" value="/admin/bankuaimanager.do?actiontype=get" />
			
			  <input type="hidden" name="parentid" value="${parentid}" />
             <input type="hidden" name="creator" value="${adminuser.username}"/>
	  
		
		<table border="0"  class="grid" cellpadding="0"
			width="100%" >

			<tr>
				<td align="right">belong to block :</td>
				<td>${requestScope.parenttext}</td>
			</tr>

			<tr>
				<td  height="30" align="right">block name:</td>
				<td >
				
				<input name="name"  class="input-txt"
					value="${requestScope.bankuai.name}" type="text" id="txtName"
					ltype="text" validate="{required:true}" /></td>
			</tr>
			
			<tr>
				<td  height="30" align="right">is display:</td>
				<td >
				
				<input name="ishow" value="1"
					type="radio" checked="checked" />show 
					
				 <input name="ishow" value="0"
					type="radio" />hide
				</td>
			</tr>
			

			<tr>
				<td align="right">block description:</td>
				<td colspan="3">   
				      <textarea name="des"
						class="l-textarea" id="txtDes" style="width:300px;height:120px;">${requestScope.bankuai.des}</textarea>
				</td>
			</tr>
			<tr>
			    <td colspan="2">
			        <input type="submit" value="submit"  class="orange-button" />
			    </td>
			</tr>
		</table>
		
	</form>
</body>
</html>

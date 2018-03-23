<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.daowen.bll.*,com.daowen.util.PagerMetal"%>
<%@ page import="com.daowen.entity.*" %>
<%@page import="com.daowen.dal.DALBase"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>帖子信息</title>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot()%>/webui/combo/combo.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           top.$.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             top.$.dialog.confirm("are you sure delete topics?", function(){
				             window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/topicmanager.do?forwardurl=/admin/topicmanager.jsp&actiontype=delete&id='+id);
				         });
			        });
			    });
			    $("#btnCheckAll").click(function(){
			           var ischeck=false;
			           $(".check").each(function(){
			               if($(this).is(":checked"))
			               {
			                  $(this).prop("checked","");
			                  ischeck=false;
			                }
			               else
			               {
			                  $(this).prop("checked","true");
			                  ischeck=true;
			                }
			           });
			           if($(this).text()=="选择记录")
			              $(this).text("取消选择");
			           else
			              $(this).text("选择记录");
			    })
			});
       </script>
	</head>
	 <body >
	<div class="search-title">
		<h2>topics manager</h2>
		<div class="description">
			
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="<%=SystemParam.getSiteRoot() %>/admin/topicmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>title <input name="title" value="${title}" class="input-txt"
							type="text" id="title" /> <input type="hidden"
							name="actiontype" value="search" /> <input type="hidden"
							name="seedid" value="${seedid}" /> <input type="hidden"
							name="forwardurl" value="/admin/topicmanager.jsp" />
							
								<button class="orange-button">search</button>
							
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	<div class="action-details">
		<a href="#" class="btn btn-success" id="btnCheckAll"
			class="action-button">check in</a> <a id="btnDelete" class="action-btn"
			href="#"> <em class="icon-delete"></em> <b>delete</b>
		</a>
	</div>
	<table id="topic" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>check</th>
				<th><b>title</b></th>
				<th><b>Publisher</b></th>
				<th><b>publish time</b></th>
				
				<th><b>block name</b></th>
				<th><b>view times</b></th>
				<th><b>is topic</b></th>
				
				<th>operations</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listtopic== null || fn:length(listtopic) == 0}">
				<tr>
					<td colspan="20">no related topic </td>
				</tr>
			</c:if>
			<%	
								        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listtopic")!=null)
								      {
									  List<Topic> listtopic=( List<Topic>)request.getAttribute("listtopic");
								     for(Topic  temtopic  :  listtopic)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=temtopic.getId()%>" class="check"
					name="chk<%=temtopic.getId()%>" type="checkbox"
					value='<%=temtopic.getId()%>'>
				</td>
				<td><%=temtopic.getTitle()%></td>
				<td><%=temtopic.getPubren()%></td>
				<td><%=sdf.format(temtopic.getPubtime())%></td>
				
				<td><%=temtopic.getBkname()%>-<%=temtopic.getBkid()%></td>
				<td><%=temtopic.getClickcount()%></td>
				<td><%=temtopic.getIstopic()%></td>
			
				<td>
					<a class="orange-href"
					href="<%=SystemParam.getSiteRoot() %>/admin/topicdetails.jsp?id=<%=temtopic.getId()%>">View</a>
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>

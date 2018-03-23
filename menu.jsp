<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.daowen.bll.*" %>
<script type="text/javascript">
   $(function(){
	   $(".accordion-item .leftMenus dd").click(function(){
	    	  $(".accordion-item .leftMenus dd").removeClass("current");
	    	  $(this).addClass("current");
	   });
   })
</script>
<div class="accordion-group">
	<div
		style="height: 600px; background: url(images/content.gif) repeat-y; display: none;"
		class="accordion-item">
		
		
		
		<h3>BBS management</h3>
		<div class="leftMenus">
		    <dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/bankuaimanager.do?actiontype=get">forum block manager</a>
			</dd>
			<dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/topicmanager.do?actiontype=get">topics manager</a>
			</dd>
			
			
			
			
		</div>
		
	   <h3>site setting</h3>
		<div class="leftMenus">
		   
			<dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/sitenavmanager.do?actiontype=get">site nav manager</a>
			</dd>
			
			<dd>
				<a   target="main" href="<%=SystemParam.getSiteRoot() %>/admin/noticemanager.do?actiontype=get">system notice manage</a>
			</dd>
			
			
			 <dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/jiaodiantumanager.do?actiontype=get">index carousel manage</a>
			</dd>
			
			<dd>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/friendlinkmanager.do?actiontype=get&seedid=306">friend links manage</a>
			</dd>
			
		 </div>
		 
	
		
		<h3>account setting</h3>
		<div class="leftMenus">
		
			
		      <dd>
                  <a target="main"  href="<%=SystemParam.getSiteRoot() %>/admin/huiyuanmanager.do?actiontype=get">Member manager</a>
              </dd>
              
            
              <dd>
				<a target="main"  href="<%=SystemParam.getSiteRoot() %>/admin/usersmanager.do?actiontype=get&seedid=101">Administrators manager</a>
			  </dd>
		     <dd>
				<a  href="<%=SystemParam.getSiteRoot() %>/admin/modifypw.jsp"
					target="main">modify  password</a>
			</dd>
			<dd>
				<a  href="<%=SystemParam.getSiteRoot() %>/admin/accountinfo.jsp"
					target="main"> account information</a>
			</dd>
			<dd>
				<a  href="<%=SystemParam.getSiteRoot() %>/admin/modifyinfo.jsp"
					target="main">modify  account</a>
			</dd>
		</div>
		
		
	</div>
</div>

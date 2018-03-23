<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.daowen.bll.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link href="<%=SystemParam.getSiteRoot() %>/admin/css/layout.css" rel="stylesheet" type="text/css" />
<link href="<%=SystemParam.getSiteRoot() %>/admin/css/login.css" rel="stylesheet" type="text/css" />
<link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />

<script type="text/javascript"> 
  
      
       if(top.window!=window)
    	   top.location.href="login.jsp";
 </script>



</head>
<body>
	<div class="wrap">
        <form method="post" action="<%=SystemParam.getSiteRoot() %>/admin/login.do" id="loginForm">
           
           <input type="hidden" name="actiontype" value="login" />
           <input name="usertype" value="0" type="hidden" >
         
		<div style="width:500px; margin-top:110px; margin-left:200px;">

			<div class="whitebox">

				<h1>fourm site background login</h1>


				<div class="reg-box">


					<div class="reg-content">


						<dl>

                            ${errmsg}

						</dl>

						<dl>
							<dt>account name:</dt>
							<dd>
								<input type="text" class="ui-input" value="${username}" id="txtUsername"
									name="username"> <i></i>

							</dd>

						</dl>
						
						<dl>
							<dt>password:</dt>
							<dd>

								<input type="password" class="ui-input" id="txtPassword"
									name="password"> <i> </i>

							</dd>

						</dl>
						
					
                        <dl>
							<dt> 
							
								 <img id="vcodeimg" src="../plusin/image.jsp" style="cursor: hand" onclick="this.src='../plusin/image.jsp?time=' + Math.random()"
                                title="点击刷新验证码" align="absMiddle" src="" />

							 
							 </dt>
							<dd>
						    
							<input type="text" name="validcode" id="txtTextcode" autocomplete="off"  class="ui-input">
                        

							</dd>

						</dl>

						<dl>
							<dt></dt>
							<dd>

								<input type="submit" class="orange-button" id="btnLogin" value="Login"
									name="btnLogin">

							</dd>

						</dl>


					</div>


				</div>


			</div>


		</div>
       </form>

	</div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link rel="stylesheet" type="text/css" href="css/public.css" />
<link rel="stylesheet" type="text/css" href="css/page.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/public.js"></script>
</head>
<body>

<form action="servlet/LoginService" method="post">
<!-- 登录body -->
	<div class="logDiv">
		<img class="logBanner" src="img/logBanner.png" />
		<div class="logGet">
			<!-- 头部提示信息 -->
			<div class="logD logDtip">
				<p class="p1">登录</p>
			</div>
			<!-- 输入框 -->
			<div class="lgD">
				<img class="img1" src="img/logName.png" /><input type="text" name="username" 
					placeholder="输入用户名" />
			</div>
			<div class="lgD">
				<img class="img1" src="img/logPwd.png" /><input type="password" name="password"
					placeholder="输入用户密码" />
			</div>
			<div class="logC">
				<a href="index_home.jsp" target="_self"><button>登 录</button></a>
			</div>
		</div>
	</div>
	<!-- 登录body  end -->
</form>
	

	<!-- 登录页面底部 -->
	<div class="logFoot">
		<p class="p1">版权所有：安徽公司公司</p>
		<p class="p2">123456789</p>
	</div>
	<!-- 登录页面底部end -->
   
</body>
</html>


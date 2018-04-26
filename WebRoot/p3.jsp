<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="generator" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
<link href="css/haiersoft.css" rel="stylesheet" type="text/css"
	media="screen,print" />
<link href="css/print.css" rel="stylesheet" type="text/css"
	media="print" />
<script src="js/jquery-1.10.1.min.js"></script>
<script src="js/side.js" type="text/javascript"></script>

<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
</head>

<body>

	<%
		//驱动程序名 
		String driverName = "com.mysql.jdbc.Driver";
		//数据库用户名 
		String userName = "mydeerlet";
		//密码 
		String userPasswd = "123456....";
		//数据库名 
		String dbName = "car66";
		//表名 
		String tableName = "second_car";
		//联结字符串 
		String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="
				+ userName + "&password=" + userPasswd;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection(url);
		Statement statement = connection.createStatement();
		String sql = "SELECT * FROM " + tableName;
		ResultSet rs = statement.executeQuery(sql);
	%>

	<!-- MainForm -->
	<div id="MainForm">
		<div class="form_boxA">
			<h2>二手车分期会员表</h2>
			<table cellpadding="0" cellspacing="0">

				<tr>
					<th>序号</th>
					<th>姓名</th>
					<th>电话</th>
					<th>身份证号</th>
					<th>婚否（元）</th>
					<th>车型</th>
					<th>单位</th>
					<th>操作</th>
				</tr>

				<%
					while (rs.next()) {
				%>
				<tr>
					<td>1</td>
					<td> <% out.print(rs.getString(1)); %> </td>
					<td><% out.print(rs.getString(2)); %></td>
					<td><% out.print(rs.getString(3)); %></td>
					<td><% out.print(rs.getString(4)); %></td>
					<td><% out.print(rs.getString(5)); %></td>
					<td><% out.print(rs.getString(6)); %></td>
					<td><a href="#">查看</a> | <a href="#">操作</a></td>
				</tr>

				<%
					}
				%>
			</table>
			<p class="msg">共找到47条会员记录，当前显示从第1条至第10条</p>
		</div>
	</div>
	<!-- /MainForm -->


	<%
		rs.close();
		statement.close();
		connection.close();
	%>
</body>
</html>





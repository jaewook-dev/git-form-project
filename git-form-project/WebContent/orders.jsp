<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String orderDate = request.getParameter("orderDate");
	System.out.println(orderDate);
	
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "root";
	String dbPass = "java0000";

	Connection conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM orders where order_date = ?");
	pstmt.setString(1, orderDate);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()) {
		if(rs.getString("amount").equals("0")) {
			out.println("매진");
		} else {
			out.println("접수 완료");
		}
	}
%>
</body>
</html>
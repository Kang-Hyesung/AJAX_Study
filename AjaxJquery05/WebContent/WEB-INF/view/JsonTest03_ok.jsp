<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int result = (Integer)request.getAttribute("result");
	
	String abc = "{\"result\":" + "\"" + result + "\"}"; 
	
	out.println(abc);
%>
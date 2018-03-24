<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="update" method="post">
LocID  :<input name="locId" value="${editLoc.locId}">
LocName:<input name="locName" value="${editLoc.locName}">
<c:choose>
<c:when test="${editLoc.locType eq 'urban'}">
LocType:<input type="radio" name="locType" value="rural"/> Rural  <input type="radio" name="locType" value="urban" checked="checked"/> Urban
</c:when>
<c:otherwise>
LocType:<input type="radio" name="locType" value="rural" checked="checked"/> Rural <input type="radio" name="locType" value="urban"/>  Urban
</c:otherwise>
</c:choose>
<input type="submit" value="update"/>
</form>
</body>
</html>
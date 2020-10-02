<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete a contact</title>
<link href="style1.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="header">
  		<a href="#default" class="logo">CONTACT LIST DATABASE</a>
  		<div class="header-right">
    		<a class="active" href="home.jsp">Click to go back</a>
    		<a class="active" href="viewtable.jsp">Click to view records</a>
  		</div>
	</div>
<%
int contactid=0;
	try{
	contactid = Integer.parseInt(request.getParameter("cid_del"));
	}catch(Exception e){
		out.println("<b> Contact ID cannot be empty!</b>");
	}
if(contactid==0){
	out.println("<b> Contact ID missing!<br> Contact cannot be deleted!</b>");
}else{
Connection conn;
Statement st;
String sql1="delete from Address where Contact_id="+contactid+"";
String sql2="delete from Phone where Contact_id="+contactid+"";
String sql3="delete from Datetable where Contact_id="+contactid+"";
String sql4="delete from Contact where Contact_id="+contactid+"";
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/contactdb","user1","root");
	st=conn.createStatement();
	st.executeUpdate(sql1);
	st.executeUpdate(sql2);
	st.executeUpdate(sql3);
	st.executeUpdate(sql4);
	out.println("<br><b>Contact deleted!</b>");
}
catch(SQLException e) {
	  out.println("SQLException: " + e.getMessage() + "<BR>");
	  while((e = e.getNextException()) != null)
	     out.println(e.getMessage() + "<BR>");
}
catch(ClassNotFoundException e) {
	out.println("ClassNotFoundException: " + e.getMessage() + "<BR>");
}
}
%>
</body>
</html>
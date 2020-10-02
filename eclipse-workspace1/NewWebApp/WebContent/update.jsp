<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style1.css" rel="stylesheet" type="text/css">
<title>Update Contact</title>
</head>
<body>
	<div class="header">
  		<a href="#default" class="logo">CONTACT LIST DATABASE</a>
  		<div class="header-right">
    		<a class="active" href="home.jsp">Home</a>
    		<a class="active" href="viewtable.jsp">Click to view records</a>
  		</div>
	</div>
<%
	int contactid=0;
	try{
	contactid = Integer.parseInt(request.getParameter("contactid1"));
	}catch(Exception e){
		out.println("<b> Contact ID cannot be empty!</b>");
	}
	if(contactid==0){
		out.println("<b> Contact ID missing!<br> Contact cannot be updated!</b>");
	}else{
	String fname = request.getParameter("fname1");
	String lname = request.getParameter("lname1");
	String mname = request.getParameter("mname1");
	String addrt = request.getParameter("addrt");
	String addr1 = request.getParameter("addr1");
	String city1 = request.getParameter("city1");
	String state1 = request.getParameter("state1");
	String zip1 = request.getParameter("zip1");
	String phonet1 = request.getParameter("phonetype");
	String ac1 = request.getParameter("ac1");
	String ph1 = request.getParameter("ph1");
	String dt1 = request.getParameter("dt1");
	String d1 = request.getParameter("d1");
	Connection conn;
	PreparedStatement pst;
	String sql1="update contact set Fname=?,Mname=?,Lname=? where Contact_id=?";
	String sql2;
	if(d1.length()<10 || d1.isEmpty()) 
		out.println("<b>Entered date does not match format, date value for contact is now truncated!<b><br>");
	if(addrt.equalsIgnoreCase("work")){
		sql2="update address set Address=?,City=?,State=?,Zip=? where Contact_id=? and Address_type='work'";
	}else{
		sql2="update address set Address=?,City=?,State=?,Zip=? where Contact_id=? and Address_type='home'";
	}
	String sql3,sql4;
	if(phonet1.equalsIgnoreCase("work")){
		sql3="update phone set Area_code=?,Pnumber=? where Contact_id=? and Phone_type='work'";
	}else if(phonet1.equalsIgnoreCase("home")){
		sql3="update phone set Area_code=?,Pnumber=? where Contact_id=? and Phone_type='home'";
		System.out.println("here");
	}else{
		sql3="update phone set Area_code=?,Pnumber=? where Contact_id=? and Phone_type='cell'";
	}
	if(dt1.equalsIgnoreCase("birthday")){
		sql4="update datetable set Date_type=?,C_Date=? where Contact_id=? and Date_type='birthday'";
	}else{
		sql4="update datetable set Date_type=?,C_Date=? where Contact_id=?";
	}
	try {
		if(!((Integer.toString(contactid)).isEmpty())){
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/contactdb","user1","root");
		try{
			pst = conn.prepareStatement(sql1);
			pst.setString(1, fname);
			pst.setString(2, mname);
			pst.setString(3, lname);
			pst.setInt(4,contactid);
			pst.executeUpdate();
		}
		catch(SQLException e){
			out.println("SQLException: " + e.getMessage() + "<BR>");
			  while((e = e.getNextException()) != null)
			     out.println(e.getMessage() + "<BR>");
		}
		try{
			pst = conn.prepareStatement(sql2);
			pst.setString(1, addr1);
			pst.setString(2, city1);
			pst.setString(3, state1);
			pst.setString(4, zip1);
			pst.setInt(5,contactid);
			pst.executeUpdate();
		}
		catch(SQLException e){
			out.println("SQLException: " + e.getMessage() + "<BR>");
			  while((e = e.getNextException()) != null)
			     out.println(e.getMessage() + "<BR>");
		}
		try{
			pst = conn.prepareStatement(sql3);
			pst.setString(1, ac1);
			pst.setString(2, ph1);
			pst.setInt(3,contactid);
			pst.executeUpdate();
		}
		catch(SQLException e){
			out.println("SQLException: " + e.getMessage() + "<BR>");
			  while((e = e.getNextException()) != null)
			     out.println(e.getMessage() + "<BR>");
		}
		try{
			pst = conn.prepareStatement(sql4);
			pst.setString(1, dt1);
			pst.setString(2, d1);
			pst.setInt(3,contactid);
			pst.executeUpdate();
		}
		catch(SQLException e){
			out.println("SQLException: " + e.getMessage() + "<BR>");
			  while((e = e.getNextException()) != null)
			     out.println(e.getMessage() + "<BR>");
		}
		out.println("<b>Update successful!<b>");
		}
		else{
			out.println("<b>Address type can be only work/home!<br>Phone type can be only work/home/cell!<br> Contact cannot be updated!</b>");
		}
	}
	catch(SQLException e) {
		  out.println("All fields must be entered in the valid format! Update unsuccessful!");
	}
	catch(ClassNotFoundException e) {
		out.println("ClassNotFoundException: " + e.getMessage() + "<BR>");
	}
	}
	%>
</body>
</html>
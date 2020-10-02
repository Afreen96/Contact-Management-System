<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.DataInputStream" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style1.css" rel="stylesheet" type="text/css">
<title>Search a Contact</title>
</head>
<body>
<div class="header">
  		<a href="#default" class="logo">CONTACT LIST DATABASE</a>
  		<div class="header-right">
    		<a class="active" href="home.jsp">Home</a>
    		<a class="active" href="home.jsp">Update contact</a>
    		<a class="active" href="home.jsp">Delete contact</a>
  		</div>
	</div>
<%
Connection conn;
Statement st;
String searchstr = request.getParameter("searchbar");
String sql2="select Contact.Contact_id as Contact_id,Fname,Mname,Lname,Address_type,Address,City,State,Zip,Phone_type,Area_code,Pnumber,Date_type,C_Date from contact inner join address on contact.Contact_id=address.Contact_id inner join phone on address.Contact_id=phone.Contact_id inner join datetable on phone.Contact_id=datetable.Contact_id where Fname like '%"+searchstr+"%' or Mname like '%"+searchstr+"%' or Lname like '%"+searchstr+"%' or Address_type like '%"+searchstr+"%' or Address like '%"+searchstr+"%' or City like '%"+searchstr+"%' or State like '%"+searchstr+"%' or Zip like '%"+searchstr+"%' or Phone_type like '%"+searchstr+"%' or Area_code like '%"+searchstr+"%' or Pnumber like '%"+searchstr+"%' or Date_type like '%"+searchstr+"%' or C_Date like '%"+searchstr+"%'";
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/contactdb","user1","root");
	st=conn.createStatement();
	//int size=elementsArr.length;
	//while(size!=0){
	//	sql1=
		//size--;
	//}
	if(!(searchstr.isEmpty())){
	ResultSet myRs = st.executeQuery(sql2);
	out.println("<TABLE CELLSPACING=\"0\" CELLPADDING=\"3\" BORDER=\"1\">");
	out.println("<TR><TH>Contact ID</TH><TH>First name</TH><TH>Middle name</TH><TH>Last name</TH><TH>Address type</TH><TH>Address</TH><TH>City</TH><TH>State</TH><TH>Zip Code</TH><TH>Phone type</TH><TH>Area Code</TH><TH>Phone Number</TH><TH>Date type</TH><TH>Calender date</TH></TR>");
	while(myRs.next()) {
		out.println("<TR>");
		out.println("  <TD>" + myRs.getString("Contact_id") + "</TD>");
	  	out.println("  <TD>" + myRs.getString("Fname") + "</TD>");
	  	out.println("  <TD>" + myRs.getString("Mname") + "</TD>");
	  	out.println("  <TD>" + myRs.getString("Lname") + "</TD>");
	  	out.println("  <TD>" + myRs.getString("Address_type") + "</TD>");
	  	out.println("  <TD>" + myRs.getString("Address") + "</TD>");
	  	out.println("  <TD>" + myRs.getString("City") + "</TD>");
	  	out.println("  <TD>" + myRs.getString("State") + "</TD>");
	  	out.println("  <TD>" + myRs.getString("Zip") + "</TD>");
	  	out.println("  <TD>" + myRs.getString("Phone_type") + "</TD>");
	  	out.println("  <TD>" + myRs.getString("Area_code") + "</TD>");
	  	out.println("  <TD>" + myRs.getString("Pnumber") + "</TD>");
		out.println("  <TD>" + myRs.getString("Date_type") + "</TD>");
	  	out.println("  <TD>" + myRs.getString("C_Date") + "</TD>");
	  	out.println("</TR>");
	}
	//myRs.getArray()
	out.println("</TABLE>");
	}
	else{
		out.println("<b>Search cannot be carried out because the string entered is invalid.<br> Please enter a valid search string!</b>");
	}
}
catch(SQLException e) {
	  out.println("SQLException: " + e.getMessage() + "<BR>");
	  while((e = e.getNextException()) != null)
	     out.println(e.getMessage() + "<BR>");
}
catch(ClassNotFoundException e) {
	out.println("ClassNotFoundException: " + e.getMessage() + "<BR>");
}
%>
</body>
</html>
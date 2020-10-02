<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Information-View</title>
<link href="style1.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
</script>
</head>
<body>
	<div class="header">
  		<a href="#default" class="logo">CONTACT LIST DATABASE</a>
  		<div class="header-right">
    		<a class="active" href="home.jsp">Update contact</a>
    		<a class="active" href="home.jsp">Delete contact</a>
    		<a class="active" href="home.jsp">Home</a>
  		</div>
	</div>
	<%
	Connection conn=null;
	Statement st=null;
	String sql1="select distinct(Contact.Contact_id) as Contact_id,Fname,Mname,Lname,Address_type,Address,City,State,Zip,Phone_type,Area_code,Pnumber,Date_type,C_Date from contact inner join address on contact.Contact_id=address.Contact_id inner join phone on address.Contact_id=phone.Contact_id inner join datetable on phone.Contact_id=datetable.Contact_id order by Contact.Contact_id,Address.Address_type,Phone.Phone_type";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/contactdb","user1","root");
		st = conn.createStatement();
		ResultSet myRs = st.executeQuery(sql1);
		out.println("<div class="+"container2"+">");
		out.println("<div class="+"row"+">");
				out.println("<div class="+"col-xs-12"+">");
				out.println("<div class="+"table-responsive"+">");
				out.println("<table class="+"table table-bordered table-hover"+">");
						out.println("<caption class="+"text-center"+">List of contacts</caption>");
						out.println("<thead>");
						out.println("<TR><TH>Contact ID</TH><TH>First name</TH><TH>Middle name</TH><TH>Last name</TH><TH>Address type</TH><TH>Address</TH><TH>City</TH><TH>State</TH><TH>Zip Code</TH><TH>Phone type</TH><TH>Area Code</TH><TH>Phone Number</TH><TH>Date type</TH><TH>Calender date</TH></TR>");
						out.println("</thead>");
				out.println("<tbody>");
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
					out.println("</tbody>");
					out.println("</table>");
				out.println("</div>");
		out.println("</div>");
	out.println("</div>");
	out.println("</div>");
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style1.css" rel="stylesheet" type="text/css">
<title>Insert new entry</title>
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
	String fname = request.getParameter("fname2");
	String lname = request.getParameter("lname2");
	String mname = request.getParameter("mname2");
	String addrt = request.getParameter("addrt2");
	String addr1 = request.getParameter("addr2");
	String city1 = request.getParameter("city2");
	String state1 = request.getParameter("state2");
	String zip1 = request.getParameter("zip2");
	String phonet1 = request.getParameter("phonetype2");
	String ac1 = request.getParameter("ac2");
	String ph1 = request.getParameter("ph2");
	String dt1 = request.getParameter("dt2");
	String d1 = request.getParameter("d2");
	Connection conn;
	PreparedStatement pst;
	String sql1, sql2, sql3, sql4, sqlsub;
	sql1="insert into contact(Fname,Mname,Lname) values(?,?,?)";
	sqlsub="(select Contact_id from Contact)";
	int flag=0;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/contactdb","user1","root");
		try{
			pst = conn.prepareStatement(sql1);
			pst.setString(1, fname);
			pst.setString(2, mname);
			pst.setString(3, lname);
			if(!(fname.isEmpty())){
				pst.executeUpdate();
				out.println("<b>Record added to Contact table!</b><br>");
			}
			else{
				out.println("<b>Contact cannot be added to any table since First Name is empty!</b>");
			}
			try{
			if(!(phonet1.isEmpty() && addrt.isEmpty() && dt1.isEmpty() && d1.isEmpty() && (d1.length()==10)) && (!(addr1.isEmpty()||city1.isEmpty()||state1.isEmpty()||zip1.isEmpty()||ac1.isEmpty()||ph1.isEmpty()||d1.isEmpty()))){
				pst = conn.prepareStatement(sqlsub);
				ResultSet rs = pst.executeQuery(sqlsub);
				String scid=null;
				while(rs.next()){
					if(rs.isLast()){
						scid=rs.getString("Contact_id");
					}
				}
				int cid=0;
				if(!(scid.isEmpty())){
					cid=Integer.parseInt(scid);
				}
			
			sql2="insert into address(Contact_id,Address_type,Address,City,State,Zip) values(?,?,?,?,?,?)";
			pst = conn.prepareStatement(sql2);
			pst.setInt(1, cid);
			pst.setString(2, addrt);
			pst.setString(3, addr1);
			pst.setString(4, city1);
			pst.setString(5, state1);
			pst.setString(6, zip1);
			pst.executeUpdate();
			sql3="insert into phone(Contact_id,Phone_type,Area_code,Pnumber) values(?,?,?,?)";
			pst = conn.prepareStatement(sql3);
			pst.setInt(1, cid);
			pst.setString(2, phonet1);
			pst.setString(3, ac1);
			pst.setString(4, ph1);
			pst.executeUpdate();
			sql4="insert into datetable(Contact_id,Date_type,C_Date) values(?,?,?)";
			pst = conn.prepareStatement(sql4);
			pst.setInt(1, cid);
			pst.setString(2, dt1);
			pst.setString(3, d1);
			pst.executeUpdate();
			out.println("<b>Record added to other tables too!</b>");
			}
			else{
				out.println("<b> Missing other required fields!<br> Contact cannot be added to other tables!</b>");
			}
			}
			catch(SQLException e){
				out.println("<b>Invalid entry for date field!<br>Record added to all other tables except Date table! <br> Date cannot be stored!");
			}
		}
		catch(SQLException e){
			out.println("SQLException: " + e.getMessage() + "<BR>");
			  while((e = e.getNextException()) != null)
			     out.println(e.getMessage() + "<BR>");
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Information</title>
<link href="style1.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
	<div class="header">
  		<a href="#default" class="logo">CONTACT LIST DATABASE</a>
  		<div class="header-right">
    		<a class="active" href="viewtable.jsp">View All Contacts</a>
    		<a href="#about">About</a>
    		<a href="#contactt">Contact Us</a>
  		</div>
	</div>
	<div class="form1">
		<form name="form_view" action="viewtable.jsp" method="post">
			<h1 class="heading3">Welcome to Contact List Database!</h1>
			<h1 class="heading4"><br><br>This database stores the contact information of thousands of contacts.You can <b>VIEW</b> a contact, <b>ADD</b> a new contact, <b>UPDATE</b> an existing contact, <b>DELETE</b> an existing contact and <b>SEARCH</b> for a contact!<br><br><br><br>Fields marked with (*) indicate required fields.<br><br> To view all contacts in the database, please click on View:</h1>
			<input type ="submit" value="View" name = "viewbutton1"/>
		</form>
	</div>
	<div class="form2">
		<form name="form_update" action="update.jsp" method="post">
			<h1 class="heading2">Update a contact by filling in ALL the details below:</h1>
			<label class="h" for="contactid1">Enter contact id: *</label>
			<input type = "text" name= "contactid1" id= "contactid1" /><br>
			<label class="h"  for="fname1">Enter first name: *</label>
			<input type = "text" name= "fname1" id= "fname1" /><br>
			<label class="h"  for="mname1">Enter middle name: *</label>
			<input type = "text" name= "mname1" id= "mname1" /><br>
			<label class="h"  for="lname1">Enter last name: *</label>
			<input type = "text" name= "lname1" id= "lname1" /><br>
			<label class="h"  for="addrt">Enter address type(home/work): *</label>
			<input type = "text" name= "addrt" id= "addrt" /><br>
			<label class="h"  for="addr1">Enter address: *</label>
			<input type = "text" name= "addr1" id= "addr1" /><br>
			<label class="h"  for="city1">Enter city: *</label>
			<input type = "text" name= "city1" id= "city1" /><br>
			<label class="h"  for="state1">Enter state: *</label>
			<input type = "text" name= "state1" id= "state1" /><br>
			<label class="h"  for="zip1">Enter zip(ex: 76543): *</label>
			<input type = "text" name= "zip1" id= "zip1" /><br>
			<label class="h"  for="phonetype">Enter phone type(home/work/cell): *</label>
			<input type = "text" name= "phonetype" id= "phonetype" /><br>
			<label class="h"  for="ac1">Enter area code(ex: 468): *</label>
			<input type = "text" name= "ac1" id= "ac1" /><br>
			<label class="h"  for="ph1">Enter phone number(ex: 678-9061): *</label>
			<input type = "text" name= "ph1" id= "ph1" /><br>
			<label class="h"  for="dt1">Enter date type(ex: birthday): *</label>
			<input type = "text" name= "dt1" id= "dt1" /><br>
			<label class="h"  for="d1">Enter date(ex: YYYY-MM-DD): *</label>
			<input type = "text" name= "d1" id= "d1" /><br>
			<input type ="submit" value="Update" name = "updatebutton1"/>
		</form>
	</div>
	<div class="form3">
		<form name="form_update" action="insert.jsp" method="post">
			<h1 class="heading1">Add a new contact by filling in the details below:</h1>
			<label class="h2"  for="fname2">Enter first name: *</label>
			<input type = "text" name= "fname2" id= "fname2" /><br>
			<label class="h2" for="mname2">Enter middle name:</label>
			<input type = "text" name= "mname2" id= "mname2" /><br>
			<label class="h2" for="lname2">Enter last name:</label>
			<input type = "text" name= "lname2" id= "lname2" /><br>
			<label class="h2" for="addrt2">Enter address type(home/work): *</label>
			<input type = "text" name= "addrt2" id= "addrt2" /><br>
			<label class="h2" for="addr2">Enter address:</label>
			<input type = "text" name= "addr2" id= "addr2" /><br>
			<label class="h2" for="city2">Enter city:</label>
			<input type = "text" name= "city2" id= "city2" /><br>
			<label class="h2" for="state2">Enter state:</label>
			<input type = "text" name= "state2" id= "state2" /><br>
			<label class="h2" for="zip2">Enter zip(ex: 76543):</label>
			<input type = "text" name= "zip2" id= "zip2" /><br>
			<label class="h2" for="phonetype2">Enter phone type(home/work/cell): *</label>
			<input type = "text" name= "phonetype2" id= "phonetype2" /><br>
			<label class="h2" for="ac2">Enter area code(ex: 468):</label>
			<input type = "text" name= "ac2" id= "ac2" /><br>
			<label class="h2" for="ph2">Enter phone number(ex: 678-9061):</label>
			<input type = "text" name= "ph2" id= "ph2" /><br>
			<label class="h2" for="dt2">Enter date type(ex: birthday): *</label>
			<input type = "text" name= "dt2" id= "dt2" /><br>
			<label class="h2" for="d2">Enter date(ex: YYYY-MM-DD): *</label>
			<input type = "text" name= "d2" id= "d2" /><br>
			<input type ="submit" value="Add" name = "insertbutton1"/>
		</form>
	</div>
	<div class="form4">
		<form name="form_delete" action="delete.jsp" method="post">
			<h1 class="heading5">Delete a contact by filling in the details below:</h1>
			<label class="h3" for="cid_del">Enter Contact ID: *</label>
			<input type = "text" name= "cid_del" id= "cid_del" /><br>
			<input type ="submit" value="Delete" name = "deletebutton1"/>
		</form>
	</div>
	<div class="form5">
		<form name="form_search" action="search.jsp" method="post">
			<h1 class="heading6">Search a contact by filling in the details below:</h1>
			<label class="h4" for="searchbar">Enter First Name: *</label>
			<input type = "text" name= "searchbar" id= "searchbar" /><br>
			<input type ="submit" value="Search" name = "searchbutton1"/>
		</form>
	</div>
	</div>
</body>
</html>
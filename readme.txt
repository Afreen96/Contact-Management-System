Dependencies- The user must have installed the latest version of MySQL Server (8). The other added dependencies are stored in the project under eclipse-workspace1\NewWebApp\WebContent\css for Bootstrap version 4, eclipse-workspace1\Servers for Apache Tomcat version 8.
Add the mysql connector jar file by right clicking the project -> Build path -> Libraries -> Add external JAR -> select the connector jar from the local disk location.
Unzip the contents of the folder axa190091_cs6360.zip into a desired location.
The project was made on Eclipse IDE Enterprise Edition.
If it is to be run in the same IDE, after extracting the file, choose the existing “eclipe-workspace-1” folder as the workspace where the project must be run.
To run the project, start the mysql server with the username as root and password as “root”.
Ex. mysql –u root -p
Source the file contactdb.sql by the command “source path\filename” to get the database in the server.
Source the file InsertContact.sql by the command “source path\filename” to get the database in the server.
Source the file InsertAddress.sql by the command “source path\filename” to get the database in the server.
Source the file InsertPhone.sql by the command “source path\filename” to get the database in the server.
Source the file InsertDate.sql by the command “source path\filename” to get the database in the server.
Now the data is fed into the database.
In eclipse-workspace1\NewWebApp\WebContent run the home.jsp file by typing in the url for the localhost server- example -http://localhost:8080/NewWebApp/home.jsp
Or right click on home.jsp in eclipse and run as -> run on server will lead to running it on Apache Tomcat 8.
The NewWebApp Dynamic Web Project consists of libraries related to Bootstrap version 4, Apache Tomcat version 8 and Mysql connector version 8.

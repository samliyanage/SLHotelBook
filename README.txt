Product: Java EE Web application for manage Sri Lankan hotels database

Pre-requisites:

 - Maven 3.x
 - Java 1.6 or above
 - Apache Tomcat 7.0 or above
 - MongoDB 2.6

 
 Used Technologies/Frameworks
 
 - Java EE v1.4
 - Spring MVC v3.2
 - Spring Data MongoDB v1.2
 - Google Gson libraries v2.2.2
 - JSTL v1.2
 - AngularJS v1.2.27
 - Bootstrap v2.3.2
 
Tested Platform: 

 - Apple OSX 10.10 Chrome/Safari
 - Window 7 Chrome/Firefox


Steps to follow in deploying web application.

 1. Install the relevent softwares and plugings that mentioned as Pre-requisites.

 2. Download the Maven project from github.
	
	https://github.com/samliyanage/SLHotelBook
 
 3. Build the project with maven using following command 
 
	{Project_Location}>mvn clean install -Dmaven.test.skip=true
 
 4. Build the war file after you build the project in step [3].
 
	{Project_Location}>mvn clean package
	
 5. Deploy the "SLHotelBook.war" file that built in step [4].

 6. to use this web app use the following URL to access.
 
	http://{Host_Name}:{Port}/SLHotelBook/hotel
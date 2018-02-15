<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
 	import="com.mongodb.BasicDBObject"   
    import="com.mongodb.DB"
 	import="com.mongodb.DBCollection"
 	import="com.mongodb.DBCursor"
 	import="com.mongodb.MongoClient"
 	import="com.mongodb.DBObject"
 	import="com.mongodb.Mongo"
 	import="java.net.UnknownHostException"
 	import="java.util.Date"
 	import="com.thakurcollege.mongoconn.dconnect"
 	
 	import="org.jfree.chart.*"
	import="org.jfree.chart.entity.*"
	import="org.jfree.data.general.*"
	
	import="java.util.*"
	import="com.google.gson.*" 
	
 %>
    

<!-- import="fusioncharts.FusionCharts"  -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!--  <script src="fusioncharts.js"></script>
<script src="fusioncharts.theme.fint.js"></script>
<script src="fusioncharts.charts.js"></script>-->

</head>
<body>

<form name="Index" action="Index.jsp" method="post">

<table>
		<tbody>
			<tr>
				<td>Period</td>
				<td>
					<input name="period"></input>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input name="btnsubmit" type="submit" value="Show Details"></input>
				</td>
				
			</tr>
		</tbody>
	</table>
	
	<%
	
		dconnect mymongo = dconnect.CreateInstance();
		DBCollection collection = mymongo.GetCollection("Sales");
		DBCursor doc =  collection.find();
	
	%>

	<table> 
	<thead>
		<tr>
			<td>Year</td>
			<td>Product</td>
			<td>Country</td>
			<td>Planned Revenue</td>
			<td>Revenue</td>
		</tr>
	</thead>
	
	
	<tbody>
		<%
		int i =0;
		//Hashmap is created to store the values from the database
        HashMap<String,Integer> proddata = new HashMap<String,Integer>();
		
        DBObject obj=null;
		for(i=0;i<100;i++){
			obj = doc.next();
			//String prod = (String) obj.get("Product") ; 
            //int value = ((Number) obj.get("Revenue")).intValue();
          	//proddata.put("xxx", value);
		%>
		<tr>
		<td><%=obj.get("Year") %><td>
		<td><%=obj.get("Product").toString().trim() %><td>
		<td><%=obj.get("Retailer country").toString().trim() %><td>
		<td><%=obj.get("Planned revenue") %><td>
		<td><%=obj.get("Revenue") %><td>
		</tr>
		<%}%>
	</tbody>	

	</table>
	
	
	
</form>
	
</body>
</html>
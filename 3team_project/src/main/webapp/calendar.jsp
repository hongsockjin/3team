<%@page import="com.hk.utils.Util"%>
<%@page import="com.hk.dtos.CalDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
	.wrapper{
		margin: 0 auto; /*가운데정렬용*/
		width: 1024px;
		background-color: ghostwhite;
		position: relative;
		left: 0;
		padding: 0;
		width: 100%;
		height: 35px;
		padding-top: 7px;
	}
	.topMenu:hover{
		color:gray;
	}
	.topMenu p{
		font-size: 12px;
		line-height: 20px;
	}
	.topMenu{
		display: inline;
	}
	.topMenu li{
		display: inline-block;
	}
	.topMenu a p{
		float: right;
		color: black;
	}
	.topMenu .a {
		float: right;
		padding-right: 20px;
	}
	.searhbox{	
		margin: 0 auto; /*가운데정렬용*/
		height: 40px;
		width: 400px;
		border: 1px solid #382f2f;
		background: #ffffff;
	}
	.searhbox > input{
		font-size: 16px;
		width: 315px;
		padding: 10px;
		border: 0px;
		outline: none;
		float: left;
	}
	.searhbox > button{
		width: 60px;
		height: 100%;
		border: 0px;
		background: #382f2f;
		outline: none;
		float: right;
		color: #ffffff;
	}
	.wrapper1{
		margin: 0 auto; /*가운데정렬용*/
		width: 1024px;
		position: relative;
		left: 0;
		padding: 0;
		width: 100%;
		height: 55px;
		padding-top: 30px;
	}
	.machineMenu{
		list-style: none;
		text-align: center;
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		padding: 10px 0;
	}
	.machineMenu a{
		text-decoration: none;
	}
	.machineMenu .b{
		display: inline-block;
		position: relative;
		text-transform: uppercase;
		padding: 0 40px;
		letter-spacing: 10px;
	}
	.boardall{
		width: 100%;		
	}
	.boardhead{
		background-color: ghostwhite;
		height: 50px;
	}
	.table{
		border-bottom: 1px solid #444444;
    	border-left: 1px solid #444444;
    	padding: 10px;
    	border-collapse: collapse;
    	border-left: none;
    	border-top: none;
	}
	.textmenu{
		padding-top: 10px;
	}
	button{
		width: 60px;
		height: 30px;
		border: 0px;
		background: #382f2f;
		outline: none;
		color: #ffffff;
		cursor: pointer;
	}
	.textdel{
		width: 60px;
		height: 30px;
		border: 0px;
		background: #382f2f;
		outline: none;
		color: #ffffff;
		cursor: pointer;
	}
	
	.calender{
		border: 1px solid #444444;
	   	padding:20px;
	   	border-collapse: collapse;
	   	margin-bottom : 10px;	}
	.font{
		font-size: 18px;
	}
	.link{
		text-decoration-line: none;
	}
	.link:link {
	  	color : black;
	}
	.link:visited {
	  	color : black;
	}
	.link:hover {
	  	color : black;
	}
	.link:active {
	  	color : black;
	}
	th{
		width: 80px;
	}
	td{
		position: relative;
		height: 80px;
		vertical-align: top;
		overflow: auto;
	}
	a{
		text-decoration: none;
	}
	a > img{
		width: 20px;
		height: 20px;
	}
	img:hover {
		background-color: pink;
	}
	.ctitle{
		background-color: black;
		color: white;
		text-align: center;
	}
	/*일정 개수를 출력하느 div*/
	.count{
		position: absolute;
		top: -20px;
		left: 10px;
		background-color: black;
		color: white;
		width: 30px;
		height: 30px;
		display: none;
		text-align: center;
		line-height: 30px;
		border-radius: 15px 15px 15px 0px;
	}
	#day{		
		background: #382f2f;
		outline: none;
		color: #ffffff;
	}
	table{
		margin: auto;
	}
	
	#sin {
	margin-top : 20px;
	}
	#date_caption {
	padding : 10px;
	}
	
</style>
<script type="text/javascript">
$(function(){
	var countA;
	$(".countA").hover(function() {
		console.log("일정 개수 보여 주세요!");

		var year = $("caption > span").eq(0).text().trim();
		var month = $("caption > span").eq(1).text().trim();
		var date = $(this).text().trim();
		countA = $(this);
		$.ajax({
			url:"CalController.do",
			method:"post",
			async:false,
			data:{"command":"calCount",
				  "year":year,
				  "month":month,
				  "date":date
				},
			dataType:"text", 
			success:function(obj){

				countA.parent().find(".count").text(obj).show();
			},
			error:function(){
				console.log("통신실패!!");
			}
		});
	}, function() {
		countA.parent().find(".count").text("").hide();
	});
});
</script>
</head>
<%
	String pYear = request.getParameter("year");
	String pMonth = request.getParameter("month");
	
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;

	if(pYear!=null){
		year = Integer.parseInt(pYear);
	}
	if(pMonth!=null){
		month = Integer.parseInt(pMonth);
	}

	if(month>=13){
		year++;
		month= 1;
	}else if(month <=0){
		year--;
		month = 12;
	}

	cal.set(year, month-1, 1);
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

	List<CalDto>list = (List<CalDto>)request.getAttribute("list");
%>
<body>
<header>
	<div>
		<div class="wrapper">
			<ul class="topMenu">
				<li class="a"><a href="userMain.jsp">마이페이지</a></li>
				<li class="a"><p>|</p></li>
				<li class="a">${sessionScope.ldto.name}&nbsp;&nbsp;님</li>
			</ul>
		</div>
	</div>
	<div class="wrapper1">
		
		<div class="searhbox">
			<input type="text" placeholder="검색어 입력">
			<button style="cursor:pointer">검색</button>
		</div>
	</div>
	<div class="wrapper2">
		<ul class="machineMenu">
			<li class="b"><p>상담날짜를 선택하세요</p></li>
		</ul>
	</div>
</header>
	
	<table class="calender">
		<caption id="date_caption">
			<a href="CalController.do?command=calendar&year=<%=year-1%>&month=<%=month%>">←</a>
			<a href="CalController.do?command=calendar&year=<%=year%>&month=<%=month-1%>">◀</a>
			<span><%=year%></span>년<span><%=month%></span>월
			<a href="CalController.do?command=calendar&year=<%=year%>&month=<%=month+1%>">▶</a>
			<a href="CalController.do?command=calendar&year=<%=year+1%>&month=<%=month%>">→</a>
		</caption>
		<tr id="day">
			<th class="font" style="color:red;">일</th>
			<th class="font">월</th>
			<th class="font">화</th>
			<th class="font">수</th>
			<th class="font">목</th>
			<th class="font">금</th>
			<th class="font" style="color: blue">토</th>
		</tr>
		<tr>
			<%
			for(int i=0; i<dayOfWeek-1; i++){
				out.print("<td>&nbsp;</td>");
			}
			for(int i=1; i<=lastDay; i++){
				
				%>
				<td>
				
				<% 
					if((i+dayOfWeek-1)%7 == 0){
						%>
						<a class="countA" style="color: red;" href="CalController.do?command=callist&year=<%=year%>&month=<%=month%>&date=<%=i%>"><%=i%></a>
						<%
					}else if((i+dayOfWeek-1)%7 == 1){
						%>
						<a class="countA" style="color: orange;" href="CalController.do?command=callist&year=<%=year%>&month=<%=month%>&date=<%=i%>"><%=i%></a>
						<%
					}
					else{
				%>
				<a class="countA" style="color: black;" href="CalController.do?command=callist&year=<%=year%>&month=<%=month%>&date=<%=i%>"><%=i%></a>
				<%
					}
				%>
					<a href="CalController.do?command=calinsertform&year=<%=year%>&month=<%=month%>&date=<%=i%>">
						<img alt="일정추가하기" src="img/pen.png">
					</a>
					
					
					<div style="font-size: 3px;">
						<%=getCalView(list, i) %>
					</div>
					<div class="count"></div>
				</td>
				<%
				if((i+dayOfWeek-1)%7 == 0){
					out.print("</tr><tr>");
					
				}
				
			}

				int a = (7-(dayOfWeek-1+lastDay)%7)%7;
				for(int i = 0; i<a;i++){
					out.println("<td>&nbsp;</td>");
				}
			%>
		</tr>
	</table>
	<div id="sin" align="center">
		<a href="BoardController.do?command=main"><button type="button">메인</button></a>
	</div>
	<%!  //자바 메서드 선언부
		public String getCalView(List<CalDto> list,int i){ 
			String d = Util.isTwo(i+""); 
			String titleList = "";
			
			for(CalDto dto:list){
				
				if(dto.getMdate().substring(6,8).equals(d)){
					titleList += "<p class='ctitle'>"
								+(dto.getId())+"님 예약"
								+"</p>";
							
				}else{
					titleList += "<p></p>";
				}
			}
		
			return titleList;
		}
	%>
</body>
</html>
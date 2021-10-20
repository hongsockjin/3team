<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

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
	.space{
		height: 10px;
	}
	.calinsert{
		width: 100%;	
		min-width: 100px;
		max-width: 1000px;
    	border-collapse: collapse;		
	}
	.machineMenu{
		list-style: none;
		text-align: center;
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		padding: 10px 0;
	}
	.machineMenu .b{
		display: inline-block;
		position: relative;
		text-transform: uppercase;
		padding: 0 40px;
		letter-spacing: 10px;
	}	
	.calender{		
		list-style: none;
		text-align: center;
		border: 1px solid black;
		padding: 10px 0;
	}
	.calender .b{
		display: inline-block;
		position: relative;
		text-transform: uppercase;
		padding: 0 40px;
		letter-spacing: 10px;
	}
	.table{
		height: 30px;
		border: 1px solid #444444;
    	padding: 10px;
    	border-collapse: collapse;
	}	
	th{		
		background: ghostwhite;
		border-right: 1px solid #444444;
		outline: none;
		color: #382f2f;
	}
	#textbox{
		margin: 0 auto; /*가운데정렬용*/
		height: 20px;
		width: 200px;
		border: 1px solid #382f2f;
		background: #ffffff;
	}
	#textbox2{
	width: 70px;
		height: 30px;
		border: 0px;
		background: #382f2f;
		outline: none;
		color: #ffffff;
		cursor: pointer;
		text-align: center;
	}
	textarea{
		resize:none;
	}
	#button{
		width: 70px;
		height: 30px;
		border: 0px;
		background: #382f2f;
		outline: none;
		color: #ffffff;
		cursor: pointer;
	}
</style>

</head>
<%
   //현재시간 구하기
   Calendar cal=Calendar.getInstance();
   int hour=cal.get(Calendar.HOUR_OF_DAY);
   int min=cal.get(Calendar.MINUTE);

   //EL에서 꺼내 쓰기 위해 pageScope에 저장하기
   pageContext.setAttribute("hour", hour);//java코드의 페이지스코프에다가 담에서 EL로 출력할 수 있다.   
   pageContext.setAttribute("min", min);
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
			<li class="b"><p>방문예약</p></li>
		</ul>
	</div>
</header>
	
<form action="CalController.do" method="post">

   <input type="hidden" name="command" value="calinsert">
   <input type="hidden" name="id" value="${sessionScope.ldto.id}">
   
   <table class="calinsert">
      <tr class="table">
         <th>아이디</th>  <!-- 세션에서 아이디를 가져와서 넣어준다 -->
         <td>${sessionScope.ldto.id}</td>
      </tr>
      <tr class="table">
         <th>일정</th>  
         <td>
         
            <select name="year">
               <c:forEach var="i" begin="${param.year-5}" end="${param.year+5}" step="1">
                  <option ${param.year==i?"selected":""} value="${i}">${i}</option>
               </c:forEach>
            </select>년
            <select name="month">
               <c:forEach var="i" begin="1" end="12" step="1">
                  <option ${param.month==i?"selected":""} value="${i}">${i}</option>            
               </c:forEach>
            </select>월
            <select name="date">
               <c:forEach var="i" begin="1" end="31" step="1">
                  <option ${param.date==i?"selected":""} value="${i}">${i}</option>            
               </c:forEach>
            </select>일
            <select name="hour">
               <c:forEach var="i" begin="0" end="23" step="1">
                  <option ${hour==i?"selected":""} value="${i}">${i}</option>            
               </c:forEach>
            </select>시
            <select name="min">
               <c:forEach var="i" begin="0" end="59" step="1">
                  <option ${min==i?"selected":""} value="${i}">${i}</option>            
               </c:forEach>
            </select>분
         </td>
      </tr>
      <tr class="table" id="textbox">
         <th>제목</th>
         <td><input type="text" name="title"></td>
      </tr>
      <tr class="table">
         <th>내용</th>
         <td><textarea rows="10" cols="60" name="content" style="width:98%; height:300px;"></textarea></td>
      </tr>
      <tr>
         <td colspan="2">
            <input id="button" type="submit" value="일정추가">
            <input id="textbox2" value="달력" onclick="location.href='CalController.do?command=calendar'" />
         </td>
      </tr>
   </table>
</form>
</body>
</html>
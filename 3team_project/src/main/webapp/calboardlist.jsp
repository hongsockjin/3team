<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		height: 50px;
	}
	.calender{
		list-style: none;
		text-align: center;
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		padding: 10px 0;
	}
	.calender .b{
		margin: 0 auto; /*가운데정렬용*/
		text-align: center;
		width: 100%;
		letter-spacing: 10px;
		padding-bottom: 10px;
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
		border: 1px solid #ffffff;
    	padding: 10px;
		padding-top: 10px;
	}
	#button{
		width: 70px;
		height: 30px;
		border: 0px;
		background: #382f2f;
		outline: none;
		color: #ffffff;
		cursor: pointer;		
    	border: none;
	}
</style>

<script type="text/javascript">
	function allSel(bool) {
		var chks = document.getElementsByName("seq");
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = bool;
		}
	}
	
	function calendar(year,month) {
		location.href="CalController.do?command=calendar&year="+year
				+"&month="+month;
	}
	function chkConfirm() {
		var chks = document.getElementsByName("seq");
		var count = 0;
		
		for (var i = 0; i < chks.length; i++) {
			if(chks[i].checked){
				count++;
			}
		}
		if(count<=0){
			alert("최소하나이상 체크하자");
			return false;
		}else{
			return true;
		}
	}
</script>
</head>
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
		<ul class="calendar">
			<li class="b">상담 내역 입니다.</li>
		</ul>
	</div>
</header>

<!-- <h1>일정목록(<small>${param.year}년${param.month}월${param.date}일</small>)</h1> -->

	<form action="CalController.do" method="post" onsubmit=" return chkConfirm()">
	<input type="hidden" name="command" value="muldel"/>
	<input type="hidden" name="year" value="${param.year}"/>
	<input type="hidden" name="month" value="${param.month}"/>
	<input type="hidden" name="date" value="${param.date}"/>
	
	<table  class="boardall">
		<col width="5px">
		<col width="40px">
		<col width="200px">
		<col width="300px">
		<col width="100px">
		<tr class="boardhead">
			<th><input type="checkbox" name="all" onclick="allSel(this.checked)"/></th>
			<th>번호</th>
			<th>일정</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr><td colspan="5">---- 작성된 일정이 없습니다. ----</td></tr>
			</c:when>
			<c:otherwise>
				<c:set var="num" value="0"/>
				<jsp:useBean id="util" class="com.hk.utils.Util"/>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td class="table"><input type="checkbox" name="seq" value="${dto.seq}"/></td>
						<td class="table">${num+=1}</td>
						<td class="table">
<!-- 						jstl을 이용해서 날짜 형식을 표현하자. -->
<%-- 						<fmt:parseDate var="parseMdate" value="${dto.mdate}" pattern="yyyyMMddHHmm"/> --%>
<%-- 						<fmt:formatDate value="${parseMdate}" pattern="yyyy년MM월dd일 HH시mm분"/> --%>
<!-- 						Action Tag를 이용해서 날짜 형식 표현하자 -->
							<jsp:setProperty property="toDates" name="util" value="${dto.mdate}"/>	
							<jsp:getProperty property="toDates" name="util"/>
						</td>
						<td class="table"><a href="CalController.do?command=caldetail&seq=${dto.seq}&year=${param.year}&month=${param.month}&date=${param.date}">${dto.title}</a></td>
						<td class="table"><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="5" class="textmenu">
				<input id="button" type="button" value="달력보기" onclick="calendar(${param.year},${param.month})"/>
				<input id="button" type="submit" value="삭제"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
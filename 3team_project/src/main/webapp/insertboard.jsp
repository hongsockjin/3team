<%@page import="com.hk.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
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
		min-width: 100px;
		max-width: 1000px;
    	border-collapse: collapse;
	}
	.table{
		border-bottom: 1px solid #444444;
    	border-left: 1px solid #444444;
    	padding: 10px;
    	border-collapse: collapse;
    	border-left: none;
    	border-top: none;
	}
	#table{
		height: 300px;
		padding-bottom: 10px;
	}
	.textarea{
		resize:none;
	}
	
	button, #button{
		width: 60px;
		height: 30px;
		border: 0px;
		background: #382f2f;
		outline: none;
		color: #ffffff;
		cursor: pointer;
	}
	
	th{		
		background: ghostwhite;
		outline: none;
		color: #382f2f;
	}
	.space{
		padding: 10px;
	}
	#tablefooter{
		height: 30px;
		border: none;
		outline: none;
	}
</style>

<script type="text/javascript">
	function boardList() {
		//JS: BOM--->위치와 관련있는 객체---->Location
		location.href = "BoardController.do?command=boardlist";
	}
</script>
</head>
<%
	LoginDto ldto=(LoginDto)session.getAttribute("ldto");
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
			<li class="b"><p>글작성</p></li>
		</ul>
	</div>
</header>

	<form action="BoardController.do" method="post">
		<input type="hidden" name="command" value="insertboard"/>
		
		<table border="1" class="boardall">
			<tr class="table">
				<th>작성자</th>
				<td><input type="text" name="id" value="<%=ldto.getId()%>" readonly="readonly"/></td>
			</tr>
			<tr class="table">
				<th>제목</th>
				<td><input type="text" name="title"/></td>
			</tr>
			<tr id="table" class="table" >
				<th>내용</th>
				<td><textarea class="textarea" name="content" style="width:98%; height:300px;"></textarea></td>
			</tr>
			</table>
			
			<table class="space">
			<tr id="tablefooter">
				<td colspan="2">
					<input id="button" type="submit" value="등록"/>
					<input id="button" type="button" value="목록" onclick="boardList()"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>





<%@page import="com.hk.dtos.BoardDto"%>
<%@page import="java.util.List"%>
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
</style>

<script type="text/javascript">
	function allSel(bool) {
		var chks = document.getElementsByName("chk");
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = bool;
		}
	}
</script>

</head>
<%
	
	List<BoardDto> list =(List<BoardDto>)request.getAttribute("list");

	if(list==null){
		request.setAttribute("msg", "요청글에 대한 정보가 없습니다.");
		pageContext.forward("error.jsp");
	}
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
			<li class="b"><p>게시판</p></li>
		</ul>
	</div>
</header>

	<form action="BoardController.do" method="post">
	<input type="hidden" name="command" value="muldel"/>
	
	<table class="boardall">
		<col width="3%">
		<col width="5%">
		<col width="16%">
		<col width="50%">
		<col width="26%">
		
		<tr class="boardhead">
			<th><input type="checkbox" name="all" onclick="allSel(this.checked)"/></th>
			<th>번호</th><th>작성자</th><th>제목</th><th>작성일</th>
		</tr>
		<%
			for(int i=0; i<list.size();i++){
				BoardDto dto = list.get(i);
				%>
				<tr>
					<td class="table"><input type="checkbox" name="chk" value="<%=dto.getSeq()%>"></td>
					<td class="table"><%=dto.getSeq()%></td>
					<td class="table"><%=dto.getId()%></td>
					<td class="table"><a href="BoardController.do?command=detailboard&seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></a></td>
					<td class="table"><%=dto.getRegdate()%></td>
				</tr>
				<%
			}
		%>
		<tr>
			<td colspan="5">
				<a href="BoardController.do?command=insertform"><button type="button">글쓰기</button></a>
				<input class="textdel" type="submit" value="글삭제"/>
				<a href="BoardController.do?command=main"><button type="button">메인</button></a>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>







<%@page import="java.util.List"%>
<%@page import="com.hk.dtos.BoardDto"%>
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
		height: 35px;
    	border-top: 1px solid #444444;
		border-bottom: 1px solid #444444;
    	border-left: 1px solid #444444;
    	padding: 10px;
	}
	#table{
		height: 300px;
		padding-bottom: 10px;
	}
	.textarea{
		resize:none;
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
	 $('#contentText').keyup(function (e){
	      var content = $(this).val();       
	      $('#counter').val(100-content.length);

	      if(content.length > 100) {
	      $(this).val($(this).val().substring(0, 100));
	      }
	      });
	
</script>

</head>
<%
	List<BoardDto> list =(List<BoardDto>)request.getAttribute("list");

	BoardDto dto = (BoardDto)request.getAttribute("dto");
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
			<li class="b"><%= dto.getId() %> 님의 글입니다.</li>
		</ul>
	</div>
</header>

	<table border="1" class="boardall">
		<tr class="table">
			<th>글번호</th>
			<td><%= dto.getSeq() %></td>
		</tr>
		<tr class="table">
			<th>작성자</th>
			<td><%= dto.getId() %></td>
		</tr>
		<tr class="table">
			<th>제목</th>
			<td><%= dto.getTitle() %></td>
		</tr>
		<tr id="table" class="table">
			<th>내용</th>
			<td><textarea class="textarea" style="width:98%; height:300px;"><%= dto.getContent() %></textarea></td>
		</tr>
		
	</table>
	
	<table class="space">
		<tr id="tablefooter">
			<td colspan="2">
				<button onclick="updateBoard()" title="수정폼으로 이동">수정</button>
				<button onclick="delboard()">삭제</button>
				<button onclick="boardList()" title="메인 화면으로 이동">목록</button>
			</td>
		</tr>
	</table>
<script type="text/javascript">
	//수정폼 이동
	function updateBoard() {
		location.href="BoardController.do?command=updateform&seq=<%=dto.getSeq()%>";
	}
	
	//글 삭제하기
	function delboard() {
		location.href="BoardController.do?command=muldel&chk=<%=dto.getSeq()%>";
	}
	
	//글목록 조회
	function boardList() {
		location.href="BoardController.do?command=boardlist";
	}
</script>
</body>
</html>







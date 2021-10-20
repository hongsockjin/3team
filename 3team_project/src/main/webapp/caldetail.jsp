<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.space{
		height: 10px;
	}
	.caldetail{
		
	}
</style>
<title></title>
<style type="text/css">
	.space{
      height: 10px;
   }
   .caldetail{
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
   .textbox{
      margin: 0 auto; /*가운데정렬용*/
      height: 20px;
      width: 200px;
      border: 1px solid #382f2f;
      background: #ffffff;
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
   textarea{
   		width: 98%; 
   		height: 300px;
   }
</style>
</head>
<header>
	<div>
		<ul class="machineMenu">
			<li class="b">일정상세보기</li>
		</ul>
	</div>
</header>
<body>
	<table class="caldetail">
		<tr class="table">
			<th>이름</th>
			<td>${dto.loginDto.name}</td>
		</tr>
		<tr class="table">
			<th>일정</th>
			<td>
				<jsp:useBean id="util" class="com.hk.utils.Util"/>
				<jsp:setProperty property="toDates" name="util" value="${dto.mdate}"/>
				<jsp:getProperty property="toDates" name="util"/>			
			</td>
		</tr>
		<tr class="table">
			<th>제목</th>
			<td>${dto.title}</td>
		</tr>
		<tr class="table">
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.content}</textarea></td>
		</tr>
		<tr class="table">
			<th>작성일</th>
			<td><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<td colspan="3">
				<input id="button" type="button" value="수정" onclick="calUpdate()"/>
				<input id="button"type="button" value="삭제" onclick="mulDel(${dto.seq})"/>
				<input id="button"type="button" value="목록" onclick="calList()"/>
			</td>
		</tr>
	</table>
<script type="text/javascript">
	function calUpdate() {
		location.href="CalController.do?command=calupdateform&seq=${dto.seq}&year=${param.year}&month=${param.month}&date=${param.date}";
	}
	function calList() {
		location.href="CalController.do?command=callist&year=${param.year}&month=${param.month}&date=${param.date}";
	}
	
	function mulDel(seq) {
		location.href="CalController.do?command=muldel&year=${param.year}&month=${param.month}&date=${param.date}&seq="+seq;
	}
</script>
</body>
</html>
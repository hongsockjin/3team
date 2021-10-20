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
</head>

<style type="text/css">
	.space{
		height: 10px;
	}
	.calupdate{
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
</style>

<body>
<header>
	<div class="wrapper2">
		<ul class="machineMenu">
			<li class="b"><p>예약변경</p></li>
		</ul>
	</div>
</header>

<form action="CalController.do" method="post">
   <input type="hidden" name="command" value="calupdate">
    <input type="hidden" name="seq" value="${dto.seq}">
   <table class="calupdate">
      <tr class="table">
        <th>이름</th>
			<td>${dto.loginDto.name}</td>
      </tr>
      <tr class="table">
         <th>일정</th>  
         <td>

				<select name="year" >
					<c:set var="yearP"  value="${fn:substring(dto.mdate,0,4)}"/>
					<c:forEach var="i" begin="${yearP-5}" end="${yearP+5}" step="1">
						<option ${yearP==i?"selected":""} value="${i}">${i}</option>						
					</c:forEach>
				</select>년
				<select name="month">
					<c:set var="monthP"  value="${fn:substring(dto.mdate,4,6)}"/>
					<c:forEach var="i" begin="1" end="12" step="1" >
					<option ${monthP==i?"selected":""} value="${i}">${i}</option>						
					</c:forEach>
				</select>월
				<select name="date">
					<c:set var="dateP"  value="${fn:substring(dto.mdate,6,8)}"/>
					<c:forEach var="i" begin="1" end="31" step="1" >
					<option ${dateP==i?"selected":""} value="${i}">${i}</option>						
					</c:forEach>
				</select>일
				<select name="hour">
					<c:set var="hourP"  value="${fn:substring(dto.mdate,8,10)}"/>
					<c:forEach var="i" begin="0" end="23" step="1" >
					<option ${hourP==i?"selected":""} value="${i}">${i}</option>						
					</c:forEach>
				</select>시
				<select name="min">
					<c:set var="minP"  value="${fn:substring(dto.mdate,10,12)}"/>
					<c:forEach var="i" begin="0" end="59" step="1" >
					<option ${minP==i?"selected":""} value="${i}">${i}</option>						
					</c:forEach>
				</select>분
         </td>
      </tr>
      <tr class="table">
         <th>제목</th>
         <td id="textbox"><input type="text" name="title" required="required" value="${dto.title}"></td>
      </tr>
      <trclass="table">
         <th>내용</th>
         <td><textarea rows="10" cols="60" required="required" name="content" style="width:98%; height:300px;">${dto.content}</textarea></td>
      </tr>
      <tr class="table">
         <td colspan="2">
            <input id="button" type="submit" value="수정완료">
            <input id="button" type="button" value="back" onclick="location.href='CalController.do?command=caldetail&seq=${dto.seq}&year=${param.year}&month=${param.month}&date=${param.date}'" />
         </td>
      </tr>
   </table>
</form>
</body>
</html>







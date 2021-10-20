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
	.space{
		height: 200px;
	}
	.usermain{
		margin: 0 auto; /*가운데정렬용*/
		text-align: center;
		width: 100%;
		letter-spacing: 10px;
		margin-bottom: 10px;
		font-size: 18px;		
	}
	.table{		
		position: relative;
		width: 100%;
	}
	.text{		
		margin: 0 auto; /*가운데정렬용*/
		height: 100px;
		width: 300px;
	}
	#button{
		display: inline-block;
		margin-top: 5px;
		width: 70px;
		height: 30px;
		border: 0px;
		background: #382f2f;
		outline: none;
		color: #ffffff;
		cursor: pointer;
		text-align: center;
		text-decoration: none;
		padding-bottom: 0;
	}
	li > a{	
		float: left;
		padding-right: 20px;
		color: black;
		text-transform: uppercase;
		text-decoration: none;
	}
	a:hover{
		text-decoration: underline;
	}
	.line{		
		line-height: 28px;
		list-style: none;
	}
</style>

</head>
<%
   LoginDto ldto=(LoginDto)session.getAttribute("ldto");

   if(ldto==null){
      pageContext.forward("index.jsp");
   }
%>
<body>

<header>
	<div class="space"></div>
	<div class="usermain">
		<div>마이페이지</div>
	</div>
</header>

<div class="table">
	<div class="text">
		<span><%=ldto.getId()%></span>님 환영합니다.
		(등급:<%=ldto.getRole().equals("USER")?"일반회원":"노예회원"%>)
 		<a id="button" href="LoginController.do?command=logout">로그아웃</a>
	</div>
	<div class="text">
		<ul>
			<li class="line">
				<a href="BoardController.do?command=boardlist">제품 소통방</a>
			</li>
			<li class="line">
				<a href="CalController.do?command=calendar">제품 상담일정 예정하기</a>
			</li>
			<li class="line">
				<a href="choose.jsp">제품 비교하러 가기</a>
			</li>
		</ul>
	</div>
	</div>
</body>
</html>





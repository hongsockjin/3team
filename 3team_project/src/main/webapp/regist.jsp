<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">
	.space{
		height: 200px;
	}
	.regist{		
		margin: 0 auto; /*가운데정렬용*/
		text-align: center;
		width: 100%;
		letter-spacing: 10px;
		
	}
	.regist > div{		
		margin: 0 auto; /*가운데정렬용*/
		text-align: center;
		width: 150px;
		letter-spacing: 10px;
		font-size: 18px;
		padding-bottom: 10px;
		padding-bottom: 35px;
		font-weight:bold;
	}
	.table{		
		position: relative;
		width: 100%;
	}
	.tr{
		margin: 0 auto; /*가운데정렬용*/
		height: 50px;
		width: 220px;
	}
	#textbox{
		margin: 0 auto; /*가운데정렬용*/
		height: 20px;
		width: 200px;
		border: 1px solid #382f2f;
		background: #ffffff;		
	}
	#button{
		margin-top: 10px;
		width: 100px;
		height: 30px;
		border: 0px;
		background: #382f2f;
		outline: none;
		color: #ffffff;
		cursor: pointer;
	}
</style>

</head>
<body>

<header>
	<div class="space"></div>
	<div class="regist">
		<div>회원가입</div>
	</div>
</header>

	<form action="LoginController.do" method="post">
		<input type="hidden" name="command" value="regist"/>
		<div class="table">
			<div class="tr">
				<div class="td">아이디</div>
				<div class="td">
					<input type="text" name="id" title="n" required="required" autocomplete="off"/>
				</div>
			</div>
			<div class="tr">
				<div class="td">비밀번호</div>
				<div class="td">
					<input id="textbox" type="password" name="password" required="required"/>
				</div>
			</div>
			<div class="tr">
				<div class="td">이름</div>
				<div class="td">
					<input id="textbox" type="text" name="name" required="required"/>
				</div>
			</div>
			<div class="tr">
				<div class="td">주소</div>
				<div class="td">
					<input id="textbox" type="text" name="address" required="required"/>
				</div>
			</div>
			<div class="tr">
				<div class="td">전화번호</div>
				<div class="td">
					<input id="textbox" type="tel" name="phone" required="required"/>
				</div>
			</div>
			<div class="tr">
				<div class="td">이메일</div>
				<div class="td">
					<input id="textbox" type="email" name="email" required="required"/>
				</div>
			</div>
			<div class="tr">
				<div class="td">
					<input id="button" type="submit" value="가입">
					<input id="button" type="button" value="취소" onclick="location.href='index.jsp'"/>
				</div>
			</div>
		</div>
	</form>
</body>
</html>







<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>

<style type="text/css">
	.space{
		height: 200px;
	}
	.login{		
		margin: 0 auto; /*가운데정렬용*/
		text-align: center;
		width: 100%;
		letter-spacing: 10px;
	}
	.login > div{		
		margin: 0 auto; /*가운데정렬용*/
		text-align: center;
		width: 100px;
		letter-spacing: 10px;
		font-size: 18px;
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
		padding-bottom: 10px;
	}
	.textbox{
		margin: 0 auto; /*가운데정렬용*/
		height: 20px;
		width: 200px;
		border: 1px solid #382f2f;
		background: #ffffff;
	}
	#button{
		display: inline-block;
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

<script type="text/javascript">
	function registForm() {
		location.href = "regist.jsp";
	}
</script>

</head>

<body>
<header>
	<div class="space"></div>
	<div class="login">
		<div>로그인</div>
	</div>
</header>

	<form action="LoginController.do" method="post">
	 <input type="hidden" name="command" value="login"/>
		<div class="table">
         <div class="tr">
            <div class="td">아이디</div>
            <div class="td"><input class="textbox" type="text" name="id"/></div>
         </div>
         <div class="tr">
            <div class="td">비밀번호</div>
            <div class="td"><input class="textbox" type="password" name="pw"/></div>
         </div>
         <div class="tr">
            <div class="td colspan">
               <input id="button" type="submit" value="로그인"/>
               <input id="button" type="button" value="회원가입" onclick="registForm()"/>
            </div>
         </div>
      </div>
	</form>
</body>
</html>







<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html lang="en">
<head>
	<title>E-Maintainence</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/login/images/icons/favicon.ico"/>
 
 
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/login/fonts/iconic/css/material-design-iconic-font.min.css">
 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/login/css/main.css">
<!--===============================================================================================-->
 
 

</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('${pageContext.request.contextPath}/resources/login//images/aa.jpg');">>
			<div class="wrap-login100">
				<form class="login100-form validate-form" id="loginForm" action="${pageContext.request.contextPath}/loginProcess" method="post">
					<span class="login100-form-logo" style="background-color: transparent;">
						<img alt="" src="${pageContext.request.contextPath}/resources/home/images/mlogon.png">
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Log in
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Enter username" >
						<input class="input100" type="text" name="username" placeholder="Username"style="border-radius: 25px;">
						<span class="focus-input100" style="color:red" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="pass" placeholder="Password" style="border-radius: 25px;">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<!-- <div class="contact100-form-checkbox">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
						<label class="label-checkbox100" for="ckb1">
							Remember me
						</label>
					</div> -->

				 <div class="container-login100-form-btn" >
					<!-- <input type="submit" value="Login" name="login"> -->
						<button class="login100-form-btn" onclick="submitForm()" style="    background: #8e24aa;
    background: -webkit-linear-gradient(45deg, #8e24aa 0%, #ff6e40 100%);
    background: linear-gradient(45deg, #8e24aa 0%, #ff6e40 100%);box-shadow: 0 6px 20px 0 rgba(255, 110, 64, 0.5);">
							Login
						</button>
					  
					<!--  <button type="submit"  ><span class="login100-form-title p-b-34 p-t-27">
						Log in
					</span></button>  -->
</div>
					<div class="text-center p-t-90">
						<a class="txt1" href="#">
							<!-- Forgot Password? -->Mahindra 2018-2019
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
 <script type="text/javascript">
function submitForm()
{
	document.getElementById("loginForm").submit();
	//alert("k");
}
	</script>
</body>
</html>
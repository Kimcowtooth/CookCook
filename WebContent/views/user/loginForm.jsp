<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.user.member.model.vo.Member"%>
    <%Member loginUser = (Member)request.getAttribute("loginUser");
    
    //로그인 성공시 띄워줄 알람 메세지
    String alertMsg = (String)session.getAttribute("alertMsg");
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>loginForm</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/template_login/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/template_login/css/style.css">
</head>
<body>

    <div class="main">
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <br><br>
                <div class="logoimg"><img src="<%=request.getContextPath() %>/resources/image/common/logo.png" alt="logo"  >
                </div>
                <div class="signin-content">
                  
                    <div class="signin-image">
                        <figure><img src="<%=request.getContextPath() %>/resources/image/common/gif3.gif" alt="sign up image" class="" width="100%"></figure>
                    </div>
                    
                    <div class="signin-form">
                        <h2 class="form-title">Login</h2>
                        <form action="<%=request.getContextPath() %>/login.me" method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="memberId" id="memberId" placeholder="ID"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="memberPwd" id="memberPwd" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                            </div>
                                <div class="signup-image-link">
                                <a href="#!" class="text-reset" onclick="enrollPage();">Create an account</a>
                                <span class="updown"></span>
                                <a href="#!" class="forgot-password-link">Forgot password?</a>
                                </div>
                            <div class="form-group form-button">
                                <input name="signin" id="signin" class="btn btn-block login-btn mb-4" type="submit" value="Login" >
                            </div>
                        </form>
                        
                        
                        <script type="text/javascript">
                        <!--회원가입 정보보안을 위해 servlet을 거쳐서 올 스크립트  -->
                        function enrollPage(){
                        	location.href="<%=request.getContextPath() %>/enrollForm.me";
                        }
                        </script>
                        
                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SignUpForm</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/template_login/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/template_login/css/style.css">
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form action="<%=request.getContextPath() %>/insert.me" method="POST" class="register-form" id="enroll-form">
                            <div class="form-group">
                                <label for="id"><i class="zmdi zmdi-favorite"></i></label>
                                <input type="text" name="memberId" id="memberId" placeholder="ID"/>
                                
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="memberPwd" id="memberPwd" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="checkPwd" id="checkPwd" placeholder="Repeat your password"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-favorite-outline"></i></label>
                                <input type="text" name="memberName" id="MemberName" placeholder="name"/>
                            </div>
                            <div class="form-group">
                                <label for="phone"><i class="zmdi zmdi-phone"></i></label>
                                <input type="text" name="phone" id="phone" placeholder="Your phone"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="address"><i class="zmdi zmdi-home"></i></label>
                                <input type="text" name="address" id="address" placeholder="address"/>
                            </div>
                            <div class="form-group form-button">
                                <input name="signup" id="signup" class="btn btn-block login-btn mb-4" type="submit" value="Join" >
                            </div>
                        </form>
                    </div>
                    <br><br>
                    <div class="signup-image">
                        <br><br><br>
                        <figure><img src="<%=request.getContextPath() %>/resources/image/common/gif2.gif" alt="sing up image"></figure>
                        <a href="<%=request.getContextPath() %>/views/user/loginForm.jsp" class="signup-image-link">I am already member</a>
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
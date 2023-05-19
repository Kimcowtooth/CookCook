<%@page import="com.user.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	//로그인 성공시 띄워줄 알람 메세지
	String alertMsg = (String)session.getAttribute("alertMsg");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>menubar</title>
	

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	
	<link rel="apple-touch-icon" href="<%=request.getContextPath() %>/template/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/template/assets/img/favicon.ico">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/template/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/template/assets/css/templatemo.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/template/assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/template/assets/css/fontawesome.min.css">

</head>
<body>
	<script>
	let msg = "<%=alertMsg%>";
	
	if(msg !="null"){
		alert(msg);
		//로그인 성공때 띄운 session삭제
		<%session.removeAttribute("alertMsg");%>
	}
	</script>

 <!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg navbar-light bg-yellow d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <i class="fa fa-envelope mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none"></a>
                    <i class="fa fa-phone mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none"></a>
                </div>
                <div>
                    <a class="text-light" href="https://fb.com/" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Top Nav -->


    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">
			<!-- 로고 -->
            <a class="navbar-brand text-success logo h1 align-self-center" href="index.jsp">
				<img src="<%= contextPath %>/resources/image/common/logo.png" class="logo" width="200px" height="50px">
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
	
			<!-- 게시판 -->
            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="<%=contextPath %>/list.re?currentPage=1"><b>Recipe Board</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=contextPath%>/list.op?currentPage=1"><b>Open Board</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=contextPath %>/list.qa?currentPage=1"><b>Q&A</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=contextPath %>/list.mo?currentPage=1"><b>Monthly Best</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=contextPath %>/list.in?currentPage=1"><b>Info</b></a>
                        </li>
                    </ul>
                </div>
                
                
               <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search">
                            	</i>
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- 검색창 -->
                    <a class="nav-icon d-none d-lg-inline" href="<%= contextPath%>/search.re">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    
                    <!-- 로그인창 -->
                   <%if(loginUser==null){ %>
                    <a class="nav-icon position-relative text-decoration-none" href="<%= contextPath%>/views/user/loginForm.jsp">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
                        <span
                            class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
                    </a>
                  	<%}else if(loginUser!=null){ %>
                  	
                  	<a href="<%=contextPath%>/views/user/myPage.jsp"><%=loginUser.getMemberId() %></a>
                  	 　
                  	<a class="nav-icon position-relative text-decoration-none" href="<%=contextPath%>/logout.me">
                        <i class="fa fa-fw fa-user-times text-dark mr-3"></i>
                        <span
                            class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
                    </a>
                  		
                  	<%} %>
                </div>
            </div>

        </div>
    </nav>
    <!-- Close Header -->


    
    <!-- Start Script -->
    <script src="<%=request.getContextPath() %>/template/assets/js/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/template/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/template/assets/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath() %>/template/assets/js/templatemo.js"></script>
    <script src="<%=request.getContextPath() %>/template/assets/js/custom.js"></script>
    <!-- End Script -->
</body>
</html>
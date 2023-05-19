<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>footer</title>
	<style>
	font-family: 'Noto Sans KR', sans-serif;
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	</style>
	
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

	<link rel="apple-touch-icon" href="/template/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/resources/image/common/iconCook.png">

    <link rel="stylesheet" href="/template/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/template/assets/css/templatemo.css">
    <link rel="stylesheet" href="/template/assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/template/assets/css/fontawesome.min.css">
</head>
<body>

	 <!-- Start Footer -->
    <footer class="bg-grey border-top border-black" id="tempaltemo_footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-success border-bottom pb-3 border-black" >
                    	<img src="<%=request.getContextPath() %>/resources/image/common/logo.png" class="logo" width="150px" height="30px">
                    </h2>
                    <ul class="list-unstyled text-black footer-link-list">
                        <li>
                            <i class="fas fa-map-marker-alt fa-fw text-black"></i>
                                                                       주소 : 서울 영등포구 선유동2로 57 이레빌딩 20층 E사무실
                        </li>
                        <li>
                            <i class="fa fa-phone fa-fw text-black"></i>
                            <a class="text-decoration-none" href="tel:010-020-0340">tel:010-1111-2222</a>
                        </li>
                        <li>
                            <i class="fa fa-envelope fa-fw text-black"></i>
                            <a class="text-decoration-none" href="mailto:info@company.com">email: cookcook@company.com</a>
                        </li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-black border-bottom pb-3 border-black" >Board</h2>
                    <ul class="list-unstyled text-black footer-link-list">
                        <li><a class="text-decoration-none" href="#">레시피게시판</a></li>
                        <li><a class="text-decoration-none" href="#">자유게시판 </a></li>
                        <li><a class="text-decoration-none" href="#">질문게시판</a></li>
                        <li><a class="text-decoration-none" href="#">월간베스트</a></li>
                        <li><a class="text-decoration-none" href="#">공지사항</a></li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-black border-bottom pb-3 border-black">Member Info</h2>
                    <ul class="list-unstyled text-black footer-link-list">
                    	<li><h6 class="text-decoration-none">김남호</h6></li>
                    	<li><h6 class="text-decoration-none">김소이</h6></li>
                        <li><h6 class="text-decoration-none">이지윤</h6></li>
                        <li><h6 class="text-decoration-none">원종우</h6></li>
                        <li><h6 class="text-decoration-none">전은덕</h6></li>
                        <li><h6 class="text-decoration-none">정혜진</h6></li>
                    </ul>
                </div>

            </div>

            <div class="row text-black mb-4">
                <div class="col-12 mb-3">
                    <div class="w-100 my-3 border-top border-black"></div>
                </div>
                <div class="col-auto me-auto">
	           		<li>
	                      	전화문의 - 10:00 ~ 12:00, 13:00 ~ 17:00 / 주말 공휴일 휴무
	                </li>
                </div>
            </div>
        </div>

        <div class="w-100 bg-yellow py-3">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                        <p class="text-left text-white">
                            Copyright &copy; 2022 밥조 
                            | Designed by 밥조
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!-- End Footer -->

    <!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->

</body>
</html>
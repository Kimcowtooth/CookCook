<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.user.member.model.vo.Member"%>
<%@page import="com.user.member.model.vo.MyPage"%>
<!DOCTYPE html>
<%
	String contextPath = request.getContextPath();
		Member loginUser = (Member) session.getAttribute("loginUser");
		MyPage mp = (MyPage)session.getAttribute("mp");
		//로그인 성공시 띄워줄 알람 메세지
		String alertMsg = (String) session.getAttribute("alertMsg");
%>

<!--마이페이지 회원정보수정페이지에 넣어줄 변수선언  -->
	<%
	String profileOrigin = mp.getprofile_origin();
	String profileChange = mp.getprofile_change();
	String filePath = mp.getFilePath();
	String nickName = mp.getNickName();
	String aboutMe = mp.getAboutMe();
	
	String memberId = loginUser.getMemberId();
	String memberPwd = loginUser.getMemberPwd();
	String memberName = loginUser.getMemberName();
	String phone = (loginUser.getPhone() == null) ? "" : loginUser.getPhone();
	String email = (loginUser.getEmail() == null) ? "" : loginUser.getEmail();
	String address = (loginUser.getAddress() == null) ? "" : loginUser.getAddress();
	%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>myPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/template_mypage/assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="<%=request.getContextPath()%>/template_mypage/css/styles.css"
	rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<style>
#success_message {
	display: none;
}

.myPageTop {
	height: 20%;
}

.myPageBottom {
	height: 80%;
}
</style>
</head>
<!-- Start Top Nav -->

<body id="page-top">

	<script>
	let msg = "<%=alertMsg%>";

		if (msg != "null") {
			alert(msg);
			//성공때 띄운 session삭제
	<%session.removeAttribute("alertMsg");%>
		}
	</script>
	
	<div class="myPageTop">
		<nav
			class="navbar navbar-expand-lg navbar-light bg-yellow d-none d-lg-block"
			id="templatemo_nav_top">
			<div class="container text-light">
				<div class="w-100 d-flex justify-content-between">
					<div>
						<i class="fa fa-envelope mx-2"></i> <a
							class="navbar-sm-brand text-light text-decoration-none"></a> <i
							class="fa fa-phone mx-2"></i> <a
							class="navbar-sm-brand text-light text-decoration-none"></a>
					</div>
					<div>
						<a class="text-light" href="https://fb.com/" target="_blank"
							rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
						<a class="text-light" href="https://www.instagram.com/"
							target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
						<a class="text-light" href="https://twitter.com/" target="_blank"><i
							class="fab fa-twitter fa-sm fa-fw me-2"></i></a> <a
							class="text-light" href="https://www.linkedin.com/"
							target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
					</div>
				</div>
			</div>
		</nav>
		<!-- Close Top Nav -->


		<!-- Header -->
		<nav class="navbar navbar-expand-lg navbar-light shadow">
			<div
				class="container d-flex justify-content-between align-items-center">
				<!-- 로고 -->
				<a class="navbar-brand text-success logo h1 align-self-center"
					href="<%=contextPath%>/index.jsp"> <img
					src="<%=contextPath%>/resources/image/common/logo.png" class="logo"
					width="200px" height="50px">
				</a>

				<button class="navbar-toggler border-0" type="button"
					data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<!-- 게시판 -->
				<div
					class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
					id="templatemo_main_nav">
					<div class="flex-fill">
						<ul
							class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
							<li class="nav-item"><a class="nav-link"
								href="<%=contextPath%>/list.re?currentPage=1"><b>Recipe
										Board</b></a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=contextPath%>/list.op?currentPage=1"><b>Open
										Board</b></a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=contextPath%>/list.qa?currentPage=1"><b>Q&A</b></a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=contextPath%>/list.mo?currentPage=1"><b>Monthly
										Best</b></a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=contextPath%>/list.in?currentPage=1"><b>Info</b></a></li>
						</ul>
					</div>


					<div class="navbar align-self-center d-flex">
						<div
							class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
							<div class="input-group">
								<input type="text" class="form-control" id="inputMobileSearch"
									placeholder="Search ...">
								<div class="input-group-text">
									<i class="fa fa-fw fa-search"> </i>
								</div>
							</div>
						</div>


						<!-- 검색창 -->
						<a class="nav-icon d-none d-lg-inline"
							href="<%=contextPath%>/search.re"> <i
							class="fa fa-fw fa-search text-dark mr-2"></i>
						</a>

						<!-- 로그인창 -->
						<% if (loginUser != null) { %>

						<a href="<%=contextPath%>/views/user/myPage.jsp"><%=mp.getNickName()%></a>

						<a class="nav-icon position-relative text-decoration-none"
							href="<%=contextPath%>/logout.me"> <i
							class="fa fa-fw fa-user-times text-dark mr-3"></i> <span
							class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
						</a>
						<%} %>
						
					</div>
				</div>

			</div>
		</nav>
	</div>
	<!-- Navigation-->
	<div class="myPageBottom">
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top"
			id="sideNav">
			<a class="navbar-brand js-scroll-trigger" href="#page-top"> <!--내프로필사진 클릭 시 수정창띄우기-->
				<span class="d-block d-lg-none">Clarence Taylor</span> <span
				class="d-none d-lg-block"> <img 
					style="background-color: rgb(243, 243, 243);"
					class="img-fluid img-profile rounded-circle mx-auto mb-2"
					src="<%=contextPath + filePath + profileChange %>"
					alt="..." />
			</span>
			</a>
			<h6><%=nickName%></h6>
			<h6><%=aboutMe%></h6>
			<br>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#MyRecipe">MyRecipe</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#education">댓글</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#skills">Like</a></li>
					<br>
					<br>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#interests">문의결과</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#awardss">회원탈퇴</a></li>
				</ul>
			</div>

		</nav>
		<section class="resume-section" id="awards">
			<div class="resume-section-content">
				<h2 class="mb-5">MyPage</h2>
				<hr>
				<br>
				<div class="container">
					<form class="myPage-form" action="<%=contextPath%>/update.me" method="post" id="myPage-form" enctype="multipart/form-data">
						<fieldset>
							<!--프로필사진변경-->
							<div class="form-group">
								<div class="col-md-6 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <label
											class="col-md-4 control-label" align="">ProFile</label>
										<img id="titleImg" width="100" height="100" src="<%=contextPath + filePath + profileChange %>" >	
										<div id="file-area">
										<input type="file" style="width: 250px" id="file1" name="profile" onchange="loadImg(this,1);" >
										</div>
									</div>
								</div>
							</div>
							<br>
							<!-- 자기소개등록변경-->
							<div class="form-group">
								<div class="col-md-6 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <label
											class="col-md-4 control-label" align="">About Me <Meta:desc></Meta:desc></label>
										<input name="aboutMe" value="<%=aboutMe%>"
											class="form-control" type="text">
									</div>
								</div>
							</div>
							<br>
							<!-- 닉네임-->
							<div class="form-group">
								<div class="col-md-6 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <label
											class="col-md-4 control-label" align="">NickName </label>
										<input name="nickName" value=<%=nickName%>
											class="form-control" type="text">
									</div>
								</div>
							</div>
							<br>
							<!-- 아이디변경-->
							<div class="form-group">
								<div class="col-md-6 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <label
											class="col-md-4 control-label" align="">ID</label> <input
											name="memberId" value="<%=memberId%>" class="form-control"
											type="text" required readonly disabled>
									</div>
								</div>
							</div>
							<br>
							<!-- 비밀번호변경-->
							<div class="form-group">
								<div class="col-md-6 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <label
											class="col-md-4 control-label" align="">password</label> <input
											name="memberPwd" class="form-control" type="password"
											required disabled>
									</div>
								</div>
							</div>
							<br>
							<!-- 이름변경-->
							<div class="form-group">
								<div class="col-md-6 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <label
											class="col-md-4 control-label" align="">Name</label> <input
											name="memberName" value="<%=memberName%>"
											class="form-control" type="text" required readonly disabled>
									</div>
								</div>
							</div>
							<br>
							<!-- 핸드폰번호변경-->
							<div class="form-group">
								<div class="col-md-6 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <label
											class="col-md-4 control-label" align="">Phone</label> <input
											name="phone" value="<%=phone%>" class="form-control"
											type="text">
									</div>
								</div>
							</div>
							<br>
							<!-- 이메일변경-->
							<div class="form-group">
								<div class="col-md-6 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <label
											class="col-md-4 control-label" align="">E-mail</label> <input
											name="email" value="<%=email%>" class="form-control"
											type="text">
									</div>
								</div>
							</div>
							<br>
							<!-- 주소변경-->
							<div class="form-group">
								<div class="col-md-6 inputGroupContainer">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <label
											class="col-md-4 control-label" align="">Address</label>
										<textarea class="form-control" name="address"><%=address%></textarea>
									</div>
								</div>
							</div>



							<!-- Success message -->
							<div class="alert alert-success" role="alert"
								id="success_message">
								Success <i class="glyphicon glyphicon-thumbs-up"></i> Thanks for
								contacting us, we will get back to you shortly.
							</div>

							<!-- Button -->
							<div class="form-group">
								<label class="col-md-4 control-label"></label>
								<div class="col-md-6" align="center">
									<button type="submit" class="btn btn-warning">
										수정하기 <span class="glyphicon glyphicon-send"></span>
									</button>
								</div>
							</div>


						</fieldset>
					</form>
				</div>
			</div>
			<!-- /.container -->
	</div>
	<hr class="m-0" />
	<script>
	  $(function(){
	 $("#file-area").hide();
	 
	 $('#titleImg').click(function(){
         $("#file1").click();
     });
	  })
	 function loadImg(inputFile,num){
		 console.log(inputFile);
		 if(inputFile.files.length==1){
			 let reader = new FileReader();
			 reader.readAsDataURL(inputFile.files[0]);
			 reader.onload = function(e){
				 switch(num){
				 case 1 : $("#titleImg").attr("src",e.target.result); break
				 }
			 }
		 }else{
			 switch(num){
			 case 1 : $("#titleImg").attr("src",null); break
			 }
		 }
	 }
	 
	</script>
	
	</section>
	<!-- Page Content-->
	<div class="container-fluid p-0">
		<!-- About-->
		<section class="resume-section" id="MyRecipe">
			<div class="resume-section-content">
				<h2 class="mb-5">Recipe</h2>
				<hr>
				<div class="subheading mb-5">
					3542 Berry Street · Cheyenne Wells, CO 80810 · (317) 585-8468 · <a
						href="mailto:name@email.com">name@email.com</a>
				</div>
				<p class="lead mb-5">I am experienced in leveraging agile
					frameworks to provide a robust synopsis for high level overviews.
					Iterative approaches to corporate strategy foster collaborative
					thinking to further the overall value proposition.</p>
				<div class="social-icons">
					<a class="social-icon" href="#!"><i class="fab fa-linkedin-in"></i></a>
					<a class="social-icon" href="#!"><i class="fab fa-github"></i></a>
					<a class="social-icon" href="#!"><i class="fab fa-twitter"></i></a>
					<a class="social-icon" href="#!"><i class="fab fa-facebook-f"></i></a>
				</div>
			</div>
		</section>
		<hr class="m-0" />

		<!-- Education-->
		<section class="resume-section" id="education">
			<div class="resume-section-content">
				<h2 class="mb-5">댓글</h2>
				<div
					class="d-flex flex-column flex-md-row justify-content-between mb-5">
					<div class="flex-grow-1">
						<h3 class="mb-0">University of Colorado Boulder</h3>
						<div class="subheading mb-3">Bachelor of Science</div>
						<div>Computer Science - Web Development Track</div>
						<p>GPA: 3.23</p>
					</div>
					<div class="flex-shrink-0">
						<span class="text-primary">August 2006 - May 2010</span>
					</div>
				</div>
				<div class="d-flex flex-column flex-md-row justify-content-between">
					<div class="flex-grow-1">
						<h3 class="mb-0">James Buchanan High School</h3>
						<div class="subheading mb-3">Technology Magnet Program</div>
						<p>GPA: 3.56</p>
					</div>
					<div class="flex-shrink-0">
						<span class="text-primary">August 2002 - May 2006</span>
					</div>
				</div>
			</div>
		</section>
		<hr class="m-0" />
		<!-- Skills-->
		<section class="resume-section" id="skills">
			<div class="resume-section-content">
				<h2 class="mb-5">Like</h2>
				<div class="subheading mb-3">Programming Languages & Tools</div>
				<ul class="list-inline dev-icons">
					<li class="list-inline-item"><i class="fab fa-html5"></i></li>
					<li class="list-inline-item"><i class="fab fa-css3-alt"></i></li>
					<li class="list-inline-item"><i class="fab fa-js-square"></i></li>
					<li class="list-inline-item"><i class="fab fa-angular"></i></li>
					<li class="list-inline-item"><i class="fab fa-react"></i></li>
					<li class="list-inline-item"><i class="fab fa-node-js"></i></li>
					<li class="list-inline-item"><i class="fab fa-sass"></i></li>
					<li class="list-inline-item"><i class="fab fa-less"></i></li>
					<li class="list-inline-item"><i class="fab fa-wordpress"></i></li>
					<li class="list-inline-item"><i class="fab fa-gulp"></i></li>
					<li class="list-inline-item"><i class="fab fa-grunt"></i></li>
					<li class="list-inline-item"><i class="fab fa-npm"></i></li>
				</ul>
				<div class="subheading mb-3">Workflow</div>
				<ul class="fa-ul mb-0">
					<li><span class="fa-li"><i class="fas fa-check"></i></span>
						Mobile-First, Responsive Design</li>
					<li><span class="fa-li"><i class="fas fa-check"></i></span>
						Cross Browser Testing & Debugging</li>
					<li><span class="fa-li"><i class="fas fa-check"></i></span>
						Cross Functional Teams</li>
					<li><span class="fa-li"><i class="fas fa-check"></i></span>
						Agile Development & Scrum</li>
				</ul>
			</div>
		</section>
		<hr class="m-0" />
		<!-- Interests-->
		<section class="resume-section" id="interests">
			<div class="resume-section-content">
				<h2 class="mb-5">문의결과</h2>
				<p>Apart from being a web developer, I enjoy most of my time
					being outdoors. In the winter, I am an avid skier and novice ice
					climber. During the warmer months here in Colorado, I enjoy
					mountain biking, free climbing, and kayaking.</p>
				<p class="mb-0">When forced indoors, I follow a number of sci-fi
					and fantasy genre movies and television shows, I am an aspiring
					chef, and I spend a large amount of my free time exploring the
					latest technology advancements in the front-end web development
					world.</p>
			</div>
		</section>
		<hr class="m-0" />
		<!-- Awards-->
		<section class="resume-section" id="awardss">
			<div class="resume-section-content" align="center">
				<h4 class="mb-5">회원탈퇴</h4>
				<hr>
				<br>
				<div align="center">
					<small>탈퇴 신청에 앞서 반드시 아래내용을 확인해주세요.</small> <br> <br>
				</div>
				<div class="list">
					<ul style="list-style-type: none">
						<li>1.CookCook 서비스 회원탈퇴 후 회원정보 및 이용기록은 모두 삭제되며, 다시 복구할 수
							없습니다.</li>
						<li>2.회원 탈퇴 시 고객정보가 삭제되어 추후 상담업무가 제한될 수 있습니다.</li>
						<li>3.작성한 후기와 결제내역은 이용약관과 관련 법률에 의해 보관됩니다.</li>
					</ul>
				</div>
				<br> <input type="checkbox" name="withdrawal" id="withdrawal">(필수)회원탈퇴
				안내사항을 확인하였습니다. <br> <br>
				<div class="col-md-6" align="center">
					<form action="<%=contextPath%>/delete.me" method="post">
						<input type="hidden" name="MemberId" value="<%=memberId%>">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <label
								class="col-md-5 control-label" align="">password</label> <input
								name="memberPwd" class="form-control" type="password" required>
						</div>
						<br>
						<button type="submit" class="btn btn-warning" id="secession"
							style="background-color: rgb(197, 197, 197);" disabled>
							탈퇴신청 <span class="glyphicon glyphicon-send"></span>
						</button>
						<a href="#page-top"></a>
						<button type="submit" class="btn btn-warning cancel">
							취소 <span class="glyphicon glyphicon-send"></span>
						</button>
					</form>

				</div>
				<!-- 체크박스 체크시 활성화 -->
				<script>
				
					$(document).ready(function() {
						$("#withdrawal").click(function() {
							if (this.checked) {
								$("#secession").prop("disabled", false);
							} else {
								$("#secession").prop("disabled", true);
							}

						});

					});
				</script>
			</div>
		</section>
	</div>
	</div>
</body>
</html>
A

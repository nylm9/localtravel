<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>TRAIN-열차예매사이트_Admin페이지</title>

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

<!-- jQuery google CDN -->
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> -->
	
	<!-- initialize jQuery Library -->
<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
	
	
	
	
<style>

}

li {
	list-style-type: none;
	margin-left: 10px;
	float: right;
}

ul lu {
	list-style-type: none;
}

a {
	text-decoration: none;
}

header {
	text-align: left;
	position: absolute;
	top: 0;
	left: 0;
}

.train-emoji {
	
}

img {
	text-align: left;
	width: 40px;
	height: 40px;
	top: -20px;
}

.title-image {
	position: relative;
	top: -20px;
	display: flex;
	margin: 25px;
}
/* #header1:hover + #header2 {
	display: block;
	position: fixed;
} */
select {
	width: 200px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	background: /* url('arrow.jpg') */ no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background-color: #0f1f4;
}

select::-ms-expand {
	display: none;
}
</style>

<!-- theme meta -->
<meta name="theme-name" content="revolve" />

<!--Favicon-->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/images/favicon.ico"
	type="image/x-icon">

<!-- THEME CSS
	================================================== -->
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/bootstrap/css/bootstrap.min.css">
<!-- Themify -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/themify/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/slick-carousel/slick-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/slick-carousel/slick.css">
<!-- Slick Carousel -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/magnific-popup/magnific-popup.css">
<!-- manin stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">
</head>
<body>

	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->
	
	<h1>로그인한 아이디 : ${sessionScope.loginId }</h1>




<!--     ENAME NVARCHAR2(50) NOT NULL,   -- 놀거리이름
    ELCODE NCHAR(2),                -- 놀거리 지역코드
    EADDR NVARCHAR2(200),           -- 놀거리 주소
    ETELL NVARCHAR2(11),            -- 놀거리 전화번호
    EREPUTE NCHAR(1),               -- 놀거리 평판 (최초등록이니까 0점으로 하겠음!)
    EEXPLAIN NVARCHAR2(500),        -- 놀거리 설명
    ETHCODE NCHAR(5),               -- 놀거리 테마코드 -->

<!-- Enjoy 부분 시작 -->    
	<section class="section" style="margin-top: 40px;">
		<div class="row " style="float: left; margin-left: 5px;">
			<div
				class="col d-flex flex-column align-items-center justify-content-center"
				style="max-width: 800px;">

				<div class="card mb-3">
					<div class="card-body">
						<div class="pt-4 pb-2">
							<h5 class="card-title text-center pb-0 fs-4">Enjoy 데이터 입력</h5>
							<p class="text-center small">Enjoy 정보를 입력해주세요.</p>
						</div>

						<form class="row g-3"
							action="${pageContext.request.contextPath }/insertEnjoyData"
							method="post" enctype="multipart/form-data">
							
							<div class="col-md-6">
								<label for="selectElcode" class="form-label">지역코드</label> <select
									name="elcode" id="elcode-select" class="form-control">
									<option value="" disabled selected>--지역 선택--</option>
									<option value="11">서울</option>
									<option value="31">경기</option>
									<option value="23">인천</option>
									<option value="25">대전</option>
									<option value="22">대구</option>
									<option value="26">울산</option>
									<option value="21">부산</option>
									<option value="24">광주</option>
									<option value="12">세종</option>
									<option value="32">강원</option>
									<option value="33">충북</option>
									<option value="34">충남</option>
									<option value="37">경북</option>
									<option value="38">경남</option>
									<option value="35">전북</option>
									<option value="36">전남</option>

								</select>

							</div>
							
							
							<div class="col-md-6">
								<label for="inputEname" class="form-label">놀거리 이름</label> 
								<span class="small" id=EnameCheckMsg>⠀</span> 
									<input type="text" name="ename" class="form-control" id="inputEname"
									onkeyup="joinENameCheck(this.value)">
							</div>
							<div class="col-md-6">
								<label for="inputEaddr" class="form-label">놀거리 주소</label> 
								<span class="small" id=EaddrCheckMsg>⠀</span> 
								<input type="text" name="eaddr" class="form-control" id="inputEaddr" 
									onkeyup="joinEAddrCheck(this.value)">
							</div>
							<div class="col-md-6">
								<label for="inputEtel" class="form-label">놀거리 전화번호(-는 제외하고 입력)</label> 
								<input type="tel" name="etell" class="form-control" id="inputEtel">
							</div>
							<div class="col-md-6">
								<label for="inputEexplain" class="form-label">놀거리 설명</label> <input
									type="text" name="eexplain" class="form-control" id="inputEexplain">
							</div>

							<div class="col-md-6">
								<label for="inputEexplain" class="form-label">놀거리 테마코드(5글자)</label> <input
									type="text" name="eexplain" class="form-control" id="inputEexplain">
							</div>
							
							<div class="col-md-6">
								<label for="inputEfile" class="form-label">놀거리 이미지</label>
								<input type="file" name="efile" class="form-control" id="inputEfile">
							</div>


							<div class="text-center">
								<button type="submit" class="btn btn-primary"
									style="margin-top: 10px; margin-left: 350px;">등록</button>
								<button type="reset" class="btn btn-secondary"
									style="margin-top: 10px;">다시작성</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Enjoy 부분 끝 -->
		
		
		
		<!-- Food insert 할 부분 시작 -->
		<div class="row ">
			<div
				class="col d-flex flex-column align-items-center justify-content-center"
				style="max-width: 900px;">

				<div class="card mb-3">
					<div class="card-body">
						<div class="pt-4 pb-2">
							<h5 class="card-title text-center pb-0 fs-4">Food 데이터 입력</h5>
							<p class="text-center small">Food 정보를 입력해주세요.</p>
						</div>

						<form class="row g-3"
							action="${pageContext.request.contextPath }/insertEnjoyData"
							method="post" enctype="multipart/form-data">
							
							<div class="col-md-6">
								<label for="selectFlcode" class="form-label">지역코드</label> <select
									name="Flcode" id="Flcode-select" class="form-control">
									<option value="" disabled selected>--지역 선택--</option>
									<option value="11">서울</option>
									<option value="31">경기</option>
									<option value="23">인천</option>
									<option value="25">대전</option>
									<option value="22">대구</option>
									<option value="26">울산</option>
									<option value="21">부산</option>
									<option value="24">광주</option>
									<option value="12">세종</option>
									<option value="32">강원</option>
									<option value="33">충북</option>
									<option value="34">충남</option>
									<option value="37">경북</option>
									<option value="38">경남</option>
									<option value="35">전북</option>
									<option value="36">전남</option>

								</select>

							</div>
							
							
							<div class="col-md-6">
								<label for="inputFname" class="form-label">가게 이름</label> 
								<span class="small" id=FnameCheckMsg>⠀</span> 
									<input type="text" name="Fname" class="form-control" id="inputFname"
									onkeyup="joinFNameCheck(this.value)">
							</div>
							<div class="col-md-6">
								<label for="inputFaddr" class="form-label">가게 주소</label> 
								<span class="small" id=FaddrCheckMsg>⠀</span> 
								<input type="text" name="Faddr" class="form-control" id="inputFaddr" 
									onkeyup="joinFAddrCheck(this.value)">
							</div>
							<div class="col-md-6">
								<label for="inputFtel" class="form-label">가게 전화번호(-는 제외하고 입력)</label> 
								<input type="tel" name="Ftell" class="form-control" id="inputFtel">
							</div>
							<div class="col-md-6">
								<label for="inputFexplain" class="form-label">가게 설명</label> <input
									type="text" name="Fexplain" class="form-control" id="inputFexplain">
							</div>

							<div class="col-md-6">
								<label for="inputFexplain" class="form-label">놀거리 테마코드(5글자)</label> <input
									type="text" name="Fexplain" class="form-control" id="inputFexplain">
							</div>
							
							<div class="col-md-6">
								<label for="inputFfile" class="form-label">가게 이미지</label>
								<input type="file" name="Ffile" class="form-control" id="inputFfile">
							</div>
							
							<div class="col-md-6">
								<label for="" class="form-label">  </label>
								<input type="hidden" class="form-control" >
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary"
									style="margin-top: 10px; margin-left: 350px;">등록</button>
								<button type="reset" class="btn btn-secondary"
									style="margin-top: 10px;">다시작성</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
	</section>




<!-- Enjoy 데이터 모두 출력 -->
	<section class="section" style="margin-top: 40px;">
		<div class="row">
			<div
				class="col d-flex flex-column align-items-center justify-content-center"
				style="max-width: 1000px;">
				<c:forEach items="${enjoyList }" var="enjoyList">
					<div class="col-md-6">
						<label for="inputEexplain" class="form-label">놀거리 정보</label>
						<img src="${pageContext.request.contextPath }/resources/EnjoyPicture/${enjoyList.epicture }">
						<h3>${enjoyList.ename }</h3>
						<h3>${enjoyList.eaddr }</h3>
						<hr>
					</div>
				</c:forEach>

			</div>
		</div>
			</section>
			

</body>

<script type="text/javascript">

function joinEAddrCheck(addrVal) {
	let inputEname = document.getElementById("inputEname").value;
	console.log("입력한 놀거리 주소 : " + addrVal);
	if(addrVal.length == 0 ) {
		$("#EaddrCheckMsg").text('놀거리 주소를 입력 해주세요!').css("color","red"); 
	} if(addrVal.length != 0 ) {
		$("#EaddrCheckMsg").text('').css("color","red");
	} 
	else {
		$.ajax( { 
			type : "get",	
			url : "${pageContext.request.contextPath }/enjoyNameCheck", 
			data : { "inputEname" : inputEname, "inputEaddr" : addrVal },
			success : function(checkResult) {
				console.log("checkResult : " + checkResult);
				if( checkResult == 'OK' ) {
					/* 놀거리 이름 가능 */
					$("#EnameCheckMsg").text('입력가능한 놀거리 입니다.').css("color","green"); 
				} else {
					/* 놀거리 이름 중복 */
					$("#EnameCheckMsg").text('중복된 놀거리 입니다.').css("color","red"); 
				}
			}
		} );
	}
	}
</script>


<script type="text/javascript">
	function joinENameCheck(nameVal) {
		console.log("입력한 놀거리 이름 : " + nameVal);
		if (nameVal.length == 0) {
			$("#EnameCheckMsg").text('놀거리 이름를 입력 해주세요!').css("color", "red");
		}
	}
</script>









<script type="text/javascript">
    	var Msg = '${Msg}';
    	if(Msg.length > 0 ){
    		alert(Msg);
    	}
    </script>
  

</html>
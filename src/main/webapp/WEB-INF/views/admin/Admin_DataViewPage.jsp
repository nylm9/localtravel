<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
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
	
<%-- <link href="${pageContext.request.contextPath }/resources/css/Menubutton.css" rel="stylesheet" type="text/css"/> --%>
	

<style type="text/css">
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
img {
  width: 200px;
  height: 100px;
  object-fit: cover;
}




</style>

 
</head>
<body>
	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->

	<!-- Enjoy ????????? ?????? ?????? -->
	<section class="section" style="margin-top: 40px;">
		<%-- 		<div class="row">
			<div
				class="col d-flex flex-column align-items-center justify-content-center"
				style="max-width: 1000px;">
				<c:forEach items="${enjoyList }" var="enjoyList">
					<div class="col-md-6">
						<label for="inputEexplain" class="form-label">????????? ??????</label> 
						<img src="${pageContext.request.contextPath }/resources/EnjoyPicture/${enjoyList.epicture }">
						<h3>${enjoyList.ename }</h3>
						<h3>${enjoyList.eaddr }</h3>
						<hr>
					</div>
				</c:forEach>

			</div>
		</div> --%>

<a href="${pageContext.request.contextPath }/testMainPage">???????????????????????? ??????</a> <br/>
<a href="${pageContext.request.contextPath }/testMemberJoinCheckForm">???????????? ?????? ????????? ????????? ??????</a>
<hr>





<hr>


<details>
    <summary>????????? Enjoy</summary>
    <p>
    <table>
			<thead>
				<tr>
					<th>????????? ??????</th>
					<th>????????? ??????</th>
					<th>????????? ??????</th>
					<th>????????? ??????</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${enjoyList }" var="enjoyList">
					<tr>
						<td><img src="${pageContext.request.contextPath }/resources/EnjoyPicture/${enjoyList.epicture }"></td>
						<td>${enjoyList.ecode }</td>
						<td>${enjoyList.ename }</td>
						<td>${enjoyList.eaddr }</td>
						<td><a class="btn" style="/* position:absolute; right:7%; */ color:black;"
						href="${pageContext.request.contextPath }/deleteAdminEnjoy?ecode=${enjoyList.ecode }"> ?????? </a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
    </p>
</details>

<details>
    <summary>?????? Food</summary>
    <p>
    <table>
			<thead>
				<tr>
					<th>?????? ??????</th>
					<th>?????? ??????</th>
					<th>?????? ??????</th>
					<th>?????? ??????</th>
					<th>??????</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${foodList }" var="foodList"  >
					<tr>
						<td><img src="${pageContext.request.contextPath }/resources/FoodPicture/${foodList.fpicture }"></td>
						<td>${foodList.fcode }</td>
						<td>${foodList.fname }</td>
						<td>${foodList.faddr }</td>
						<td><input type="button" value="????????????" onclick="openChild('${foodList.fcode }')"></td>
						<td><input type="hidden" id="pInput" value="${foodList.fcode }"></td>
						<td><a class="btn" style="/* position:absolute; right:7%; */ color:black;"
						href="${pageContext.request.contextPath }/deleteAdminMenu?fcode=${foodList.fcode }"> ?????? </a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
    </p>
</details>




	</section>
</body>

<script type="text/javascript">

/* function showPopup(fcode) {
	console.log(fcode);
	window.open("searchPopOpen", "a", "width=800, height=500, left=100, top=50"); 
	} */
	
let openWin;

function openChild(selectFcode) {
    // window.name = "????????? ??????"; 
    window.name = "parentForm";
    //let selectFcode = document.getElementById("pInput").value;
    openWin = window.open("MenuDataPopOpen?selectFcode="+selectFcode, "a", "width=800, height=500, left=100, top=50");
   /*  setChildText(); */
}

function setChildText(){
    openWin.document.getElementById("cInput").value = document.getElementById("pInput").value;
}
</script>

    <!-- alert??? ????????? -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
<script type="text/javascript">


$().ready(function () {
    // AdminDelSMsg ????????? ??????
    var AdminDelSMsg = "${AdminDelSMsg}";
    if (AdminDelSMsg) {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-center',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
        });

        Toast.fire({
            icon: 'success',
            title: AdminDelSMsg,
        });
    }
    

    
    // AdminDelFMsg ????????? ??????
    var AdminDelFMsg = "${AdminDelFMsg}";
    if (AdminDelFMsg) {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-center',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
        });

        Toast.fire({
            icon: 'error',
            title: AdminDelFMsg,
        });
    }
    
    
    // delEnjoySMsg ????????? ??????
    var delEnjoySMsg = "${delEnjoySMsg}";
    if (delEnjoySMsg) {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-center',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
        });

        Toast.fire({
            icon: 'success',
            title: delEnjoySMsg,
        });
    }
    
    
});

</script>
</html>
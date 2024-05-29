<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--<%@ include file="/WEB-INF/style/mainPage.css" %>-->
<%@ include file="/WEB-INF/common/header.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="./src/main/webapp/WEB-INF/style/mainPage.css"
	 rel="stylesheet"  type="text/css">

<title>A-Whale</title>
</head>
<body>
	<!-- <div class="menu1">
      <img src="https://i.pinimg.com/564x/d0/aa/aa/d0aaaa675b2aa1158492d4e698b28655.jpg" alt="동그라미~"> 
         <img class="lettering" src="./image/awhale.png" alt="레터링">

   </div> -->
	<div class="menu2">
		<div class="menu2-1">
		</div>
	</div>
	<div class="menu3">

	</div>
	<div class="menu4">
		<div class="left">
			<div class="left-child">
				<img style="width: 100%; height: 100%;"
					src="http://www.koreanewstoday.co.kr/news/photo/202203/66962_46979_3934.jpg"
					alt="zz">
				<!-- div안에 넣기전에 div에 overflow: hidden 주고 이미지에 height,width 각 100%씩 -->
			</div>
			<div class="left-child">
				<img
					style="width: 100%; height: 100%; margin-top: 5px; border-radius: 10px;"
					src="https://dimg.donga.com/ugc/CDB/WEEKLY/Article/5d/bb/ba/e1/5dbbbae119c7d2738de6.jpg"
					alt="">
			</div>
		</div>
		<div class="center imagehidden">
			<img style="width: 100%; height: 100%;"
				src="https://contents.sixshop.com/thumbnails/uploadedFiles/135637/default/image_1674201956171_1000.jpg"
				alt="zz">
		</div>
		<div class="right imagehidden">
			<img style="width: 100%; height: 100%;"
				src="https://dewberry9.github.io/assets/images/daily/bombay-sapphire/04.jpg"
				alt="zz">
		</div>
	</div>
	<div class="menu5">
		<div class="left2 imagehidden">
			<img style="width: 100%; height: 100%;"
				src="https://images.khan.co.kr/article/2024/01/25/news-p.v1.20240125.3f5fc2c0c3724e8995fb7a365b3c77a7_P1.jpeg"
				alt="zz">
		</div>
		<div class="center2 imagehidden">
			<img style="width: 100%; height: 100%;"
				src="https://www.esquirekorea.co.kr/resources_old/online/org_online_image/eq/3e274de4-1b3a-4f88-825f-d47f690c8945.jpg"
				alt="zz">
		</div> 
		<div class="right2 imagehidden">
			<img style="width: 100%; height: 100%;"
				src="https://ae01.alicdn.com/kf/Sf2b708307afb4923af70ea64bbcc2bd7y.jpg_640x640Q90.jpg_.webp"
				alt="zz">
		</div>
	</div>
	<div class="menu6">
		<div class="left3">
			<div class="child imagehidden">
				<img style="width: 100%; height: 100%;"
					src="https://cdn.woodkorea.co.kr/news/photo/202212/71473_81562_4716.jpg"
					alt="zz">
			</div>
			<div class="child imagehidden">
				<p>여기는 주류 설명~</p>
				<!-- <img style="width: 100%; height: 100%;" src="https://i.pinimg.com/736x/9a/e5/f2/9ae5f2aed5284649c009b7bea3f0b345.jpg" alt="zz"> -->
			</div>
		</div>
		<div class="center3">
			<div class="child imagehidden">
				<img style="width: 100%; height: 100%;"
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvcW7zlXmfJqdyvKnT0WPQVrjk_pyQjN0zL4eBIPiZDw&s"
					alt="zz">
			</div>
			<div class="child imagehidden">
				<p>여기는 주류 설명~</p>
				<!-- <img style="width: 100%; height: 100%;" src="https://i.pinimg.com/736x/9a/e5/f2/9ae5f2aed5284649c009b7bea3f0b345.jpg" alt="zz"> -->
			</div>
		</div>
		<div class="right3">
			<div class="child imagehidden">
				<img style="width: 100%; height: 100%;"
					src="https://biz.chosun.com/resizer/Tpbb-q42I_IhhcNHabeY6DP8Xs0=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosunbiz/AZA5NM7DWVF55MR4NCV2S6GPGE.jpg"
					alt="zz">
			</div>
			<div class="child imagehidden">
				<p>여기는 주류 설명~</p>
				<!-- <img style="width: 100%; height: 100%;" src="https://i.pinimg.com/736x/9a/e5/f2/9ae5f2aed5284649c009b7bea3f0b345.jpg" alt="zz"> -->
			</div>
		</div>
	</div>
	<div class="menu7"></div>
	<style>
.imagehidden {
	overflow: hidden;
	border-radius: 10px;
}

.child {
	block-size: 50%;
	/* border: 1px solid black; */
	box-sizing: border-box;
}

.center3 {
	width: 33%;
	float: left;
	box-sizing: border-box;
	/* border: 1px solid black; */
	flex: 1;
	margin: 7px;
	margin-bottom: 0px;
}

.left3 {
	width: 33%;
	float: left;
	box-sizing: border-box;
	/* border: 1px solid black; */
	flex: 1;
	display: inline-block;
	margin: 7px;
	margin-bottom: 0px;
}

.right3 {
	width: 33%;
	float: right;
	box-sizing: border-box;
	/* border: 1px solid black; */
	flex: 1;
	margin: 7px;
	margin-bottom: 0px;
}

.menu6 {
	margin-top: 20px;
	/* border: 1px solid black; */
	width: 1200px;
	height: 400px;
	display: flex;
	margin: 0 auto;
	margin-top: 20px;
}

.center2 {
	width: 33%;
	float: left;
	box-sizing: border-box;
	/* border: 1px solid black; */
	flex: 1;
	margin: 7px;
}

.left2 {
	width: 33%;
	float: left;
	box-sizing: border-box;
	/* border: 1px solid black; */
	flex: 1;
	display: inline-block;
	margin: 7px;
}

.right2 {
	width: 33%;
	float: right;
	box-sizing: border-box;
	/* border: 1px solid black; */
	flex: 1;
	margin: 7px;
}

.menu5 {
	margin-top: 20px;
	/* border: 1px solid black; */
	width: 1200px;
	height: 500px;
	display: flex;
	margin: 0 auto;
	margin-top: 20px;
}

.left-child {
	block-size: 50%;
	/* border: 1px solid black; */
	box-sizing: border-box;
	overflow: hidden;
	border-radius: 10px;
	margin-right: 10px;
}

.center {
	width: 33%;
	float: left;
	box-sizing: border-box;
	/* border: 1px solid black; */
	flex: 2;
}

.left {
	width: 33%;
	float: left;
	box-sizing: border-box;
	/* border: 1px solid black; */
	flex: 1;
	display: inline-block;
}

.right {
	width: 33%;
	float: right;
	box-sizing: border-box;
	/* border: 1px solid black; */
	flex: 1;
	margin-left: 10px;
}

.menu4 {
	margin-top: 20px;
	/* border: 1px solid black; */
	width: 1200px;
	height: 450px;
	display: flex;
	margin: 0 auto;
	margin-top: 20px;
	border-radius: 30px;
}

.menu3>a {
	text-decoration-line: none;
}

.menu3 {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.menu2 {
	/* border: 1px solid black; */
	box-shadow: 0px 0px 0px 0px grey;

	border-top: 0;
	border-left: 0;
	border-right: 0;
	display: flex;
	align-items: center;
	/* justify-content: center; */
}

.menu2-1 {
	/* border: 1px solid black; */
	width: 100%;
	height: 50px;
	display: flex;
	justify-content: space-around;
	/* margin-left: 670px; */
	margin-top: 20px;

	/* border-bottom: 3px solid black; */
}

.menu1 {
	display: flex;
	justify-content: center;
}

.menu1>img {
	margin-top: 100px;
	border-radius: 100%;
	width: 300px;
	height: 300px;
	z-index: 1;
	position: relative;
}

.menu1 .lettering {
	z-index: 2;
	/* margin-right: 50px; */
	position: absolute;
	width: 800px;
	opacity: 0.9;
}
</style>
</body>
</html>
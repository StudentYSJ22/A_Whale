<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/common/header.jsp" %> 
<title>Insert title here</title>
</head>
<body>
<style>
    #menubar>ul>li{
        list-style: none;
        text-decoration-line: none;
        margin-bottom: 15px;
        border: 1px solid red;
        width: 150px;
    }
    #brandlogo{
        border: 1px solid red;
    }
    #mypage{
        border: 1px solid red;
    }#content{
        display: inline-block;
        border: 1px solid red;
    }
    #menubar{
        width: 150px;
    }
    .aside{
            /* border: 1px dotted blue; */
            border: 1px solid black;
            width: 15%;
            height: 800px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            justify-content: space-evenly;
            
        }
        .aside>nav>ul{
            height: 650px;
            list-style-type:none ;
            margin: 0;
            padding: 0;
            
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
        }
        .aside>nav>ul>li{
            
            font-family: "휴먼굴림둥근체";
            font-weight: bolder;
            margin-top: 0;
            
        }
        .article{
            /* border: 1px dotted blue; */
            border: 1px solid black;
            width: 85%;
            height: 800px;
            display: flex;
            flex-wrap: wrap;
            margin: 0;
        }
        .section{
            display: flex;

        }
        .aside a{
            list-style: none;
        text-decoration-line: none;
        font-size: 13px;
        }
        #top{
            display: flex;
            justify-content: center;
        }
</style>



<body>
    <section class="section">
        <aside class="aside">
            <nav>
                <ul>
                    <li>*내정보 확인하기</li>
                    <li><a href="회원정보수정.html">-회원정보 수정</a></li>
                    <li><a href="회원탈퇴.html">-회원탈퇴</a></li>
                    <li><a href="">*주문내역조회</a></li>
                    <li><a href="">*최근 본 상품</a></li>
                    <li>*문의내역</li>
                    <li><a href="">-상품문의 내역</a></li>
                    <li><a href="">-1:1문의 내역</a></li>
                    <li><a href="">-나문희</a></li>
                </ul>
            </nav>
        </aside>
        <article class="article">
            <div class="product">
                <img src="./images/다운로드 (1).jfif" alt="" width="80" height="80">
                <h4>제품명: 돼지머리</h4>
                <h5>맛있는 돼지..</h5>
            </div>
            <div class="product">
                <img src="./images/다운로드 (1).jfif" alt="" width="80" height="80">
                <h4>제품명: 돼지머리</h4>
                <h5>제사용 돼지..</h5>
            </div>
            <div class="product">
                <img src="./images/다운로드 (1).jfif" alt="" width="80" height="80">
                <h4>제품명: 돼지머리</h4>
                <h5>끝내주는 돼지..</h5>
            </div>
            <div class="product">
                <img src="./images/다운로드 (1).jfif" alt="" width="80" height="80">
                <h4>제품명: 돼지머리</h4>
                <h5>먹어봐 내 돼지..</h5>
            </div>
            <div class="product">
                <img src="./images/다운로드 (1).jfif" alt="" width="80" height="80">
                <h4>제품명: 돼지머리</h4>
                <h5>비싼 돼지..</h5>
            </div>
            <div class="product">
                <img src="./images/다운로드 (1).jfif" alt="" width="80" height="80">
                <h4>제품명: 돼지머리</h4>
                <h5>그냥 돼지..</h5>
            </div>
            <div class="product">
                <img src="./images/다운로드 (1).jfif" alt="" width="80" height="80">
                <h4>제품명: 돼지</h4>
                <h5>근사한 돼지..</h5>
            </div>
            <div class="product">
                <img src="./images/다운로드 (1).jfif" alt="" width="80" height="80">
                <h4>제품명: 돼지</h4>
                <h5>근사한 돼지..</h5>
            </div>
        </article>
    </section>
</body>
<footer>

</footer>
</html>
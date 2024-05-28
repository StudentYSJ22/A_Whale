<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.nbp.model.DTO.Member" %> 
    <%@ page import="com.nbp.model.DAO.MemberDAO" %>   
    

<%
   Member loginMember=(Member)session.getAttribute("loginMember");
   System.out.println(loginMember);
   //Cookie값 가져오기
   Cookie[] cookies=request.getCookies();
   String saveId=null;
   if(cookies!=null){
      for(Cookie c : cookies){
         if(c.getName().equals("saveId")){
            saveId=c.getValue();
            break;
         }
      }
   }
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
<link href="https://webfontworld.github.io/kopus/KoPubWorldDotum.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>

</head>
<body>
       <style>
        body{
          background-image: url("https://images.unsplash.com/photo-1629196911514-cfd8d628ba26?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
          background-size: 100%;
          font-family:KoPubWorldDotum;

        }

        .shadow{
          box-shadow: 3px 3px 3px 3px #555555
        }

        #headmain{
            height: 220px;
        }

        #logo{
            height: 150px;
            /* border: 1px solid blue; */
            display: flex;
            justify-content: center;
            align-items: center;
            justify-content: space-between;
            
           
        }
        .logo{
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #ctg{
            height: 180px;
            /* border: 1px solid red; */
        }
        .evencenter{
            justify-content: space-evenly;
        }

        a{text-decoration:none; font-size: 18px;}
        *{margin: 0;}


        .header-icon{
          opacity: 1;
          transition: all 0.25s ease-in;
        }

        .header-icon:hover{
          opacity: 0.5;
        }


    nav {
      width: 100%;
      display: flex;
      justify-content: center;
      position: relative;
    }

    ul, li {
      margin: 0;
      padding: 0;
      list-style: none;
    }

    #main-menu > li {
      float: left;
      position: relative;
      margin: 0px 40px;

    }

    #main-menu > li > a {
      font-size: 30px;
      color: rgb(57, 56, 68);
      font-weight: bolder;
      text-align: center;
      text-decoration: none;
      letter-spacing: 0.05em;
      display: block;
      padding: 14px 36px;
      text-shadow: 1px 1px 1px rgba(18, 14, 87, 0.5);

    }


    #sub-menu {
      position: absolute;
      margin-top: 20px;
      opacity: 0;
      visibility: hidden;
      transition: all 0.35s ease-in;
      background: #181850;
      border-radius: 5px;

    }

    #sub-menu > li {
      padding: 16px 28px;

    }

    #sub-menu > li >  a {
      color: white;
      text-decoration: none;
      font-weight: lighter;
      font-size: 25px;
    }

    #main-menu > li:hover #sub-menu {
      opacity: 1;
      visibility: visible;
    }


        #main-menu {
      text-align: center;
    }

    #main-menu li {
      display: inline-block;
    }

    #main-menu a {
      display: inline-block; 
      opacity: 1;
      transition: all 0.25s ease-in;
    }

    #main-menu a:hover{
      opacity: 0.5;
      text-decoration: underline;

    }

    #login{
      position: absolute;
      top: 35%;
      left: 40%;
      display: none;
      width: 550px; 
      height: 700px; 
      background-color: rgb(234, 234, 234);
      box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.492);
      border-radius: 30px;
      transition: all 0.25s ease-in;
    }
    #login>div{
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      width: 550px; 
      height: 550px; 
    }


    .evencenter img{
      opacity: 1;
      transition: all 0.25s ease-in;
      cursor: pointer;
    }

    .evencenter img:hover{
      opacity: 0.5;
    }

    #login-close{
      position:relative;
      top: 3%;
      left: 3%;
      cursor: pointer;
      opacity: 1;
      transition: all 0.25s ease-in;
    }

    #login-close:hover{
      opacity: 0.5;
    }
/* ------------------------로그인 창 스타일---------------------------------*/
      .inputs{
        
        background-color: white;
        box-shadow: 2px 2px 10px black;
        border-radius: 10px;
      }

      #inputs01,#inputs02{
        opacity: 0.5;
      }


      .inputs > label {
        display: block;
        width: 100%;
        padding: 15px 0px;
      }

      .inputs > label > input {
        position: relative;
        border: none;
        outline: none;
        padding-left: 15px;
        background-color: rgb(255, 255, 255);
        font-size: 20px;
        font-weight: bold;
      }

      #find>a{
        width: 150px;
        border-right: 2px solid rgba(0, 0, 175, 0.45);
        text-align: center;
      }
      #find{
        display: flex;
        justify-content: center;
        width: 400px;
      }
        

    </style>
    <header>
        <div style="height:215px;"></div>
        <div id="headmain" style="min-width: 1500px;">
            <div id="logo">
                <div class="logo border" style="width: 300px; height: 120px;">
                    <div><h3 style="margin-left: 30px; margin-top: 20px; font-size:15px;">semi project. A.Whale.</h3></div>
                </div>
                <div class="logo border" ><img src="https://postfiles.pstatic.net/MjAyNDA1MTZfNjcg/MDAxNzE1ODUwMjgwOTY5.Jv6Kv_HtWZpWqwM47oHMsFPkdaNbnGuLxQcWEOivE3og.C6hmrMJVaBa-vZpvbdWJ47MpvixWDoZYUjALOHNn1ssg.PNG/logo1.png?type=w773" alt="" width="120px" height="90px"></div>
                <div  class="logo evencenter" style="width: 300px; height: 120px; "> 
	                <img src="https://i.imgur.com/Tod2QyI.png" id="cartgo" width="50px" height="50px">
	                <img src="https://i.imgur.com/hcPLIWf.png" id="wishlistgo" width="50px" height="50px">
	                <%if(loginMember!=null &&loginMember.getMemberId().equals("ADMIN")){ %>
	                <a href="<%=request.getContextPath()%>/admin/adminpage.do"><img id="mypage" src="https://i.imgur.com/232RUYS.png"  width="50px" height="50px"></a>
                	<%}else{ %>
                	<img id="mypage" src="https://i.imgur.com/232RUYS.png"  width="50px" height="50px">
                <%} %>
                
                
                
                <%if(loginMember!=null) {%>
                   <h4><%=loginMember.getMemberId() %>님 어서오세요!</h4>
                   <script>
                    document.getElementById("wishlistgo").addEventListener("click",function(){
                        location.assign('<%=request.getContextPath()%>/wishlist/WishListEnterSer.do?memberid=<%=loginMember.getMemberId()%>');
                     }); 
                         
                    document.getElementById("cartgo").addEventListener("click",function(){
                       location.assign('<%=request.getContextPath()%>/shoppingbasket/ShoppingBasket.do');
                  });
                   
                  </script>
                   <%} %>
                <%if(loginMember!=null) {%>
                   <br><input type="button" value="로그아웃"
                        onclick="location.replace('<%=request.getContextPath()%>/login/loginout.do')">
                   <%} %>
                   </div>
                </div>
            </div>
            <div id="category" style="min-width: 1000px;margin-top: 20px;">
              <nav role="navigation">
                <ul id="main-menu">
                  <li><a href="<%=request.getRequestURI() %>" id="menu">home</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">첫차intro</a></li>
                    </ul>
                  </li>
                  <li><a href="<%=request.getContextPath()%>/product/pagebar.do" id="menu">product</a>
                    <ul id="sub-menu">
                      <li><a href="<%=request.getContextPath()%>/product/pagebar.do" aria-label="subemnu">All-Products</a></li>
                      <li><a href="#" aria-label="subemnu">whisky</a></li>
                      <li><a href="#" aria-label="subemnu">wine</a></li>
                      <li><a href="#" aria-label="subemnu">brandy</a></li>
                    </ul>
                  </li>
                  <li><a href="#" id="menu">event</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">룰렛이벤트</a></li>
                      <li><a href="#" aria-label="subemnu">댓글이벤트</a></li>
                    </ul>
                  </li>
                  <!-- <li><a href="#" id="menu" >recipe</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                    </ul>
                  </li> -->
                  <li><a href="#" id="menu">community</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">place recommend</a></li>
                    </ul>
                  </li>
                  <li><a href="#" id="menu">service</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">1:1 문희</a></li>
                      <li><a href="<%=request.getContextPath()%>/notice/noticelist.do" aria-label="subemnu">notice</a></li>
                      <li><a href="#" aria-label="subemnu">FAQ</a></li>
                    </ul>
                  </li>
                </ul>
              </nav>
            </div>
    <script>
       <% if(loginMember!=null){ %>
      document.getElementById("mypage").addEventListener("click",e=>{
         location.href="<%=request.getContextPath()%>/MyPage/mypagepage.do";
      });
   <%   }   %>
    </script>
            

            
           


    <!-- 아이디 입력 박스 -->
    <div id="login">
       <%if(loginMember==null){ %>
         <form id="form" action="<%=request.getContextPath() %>/login/login.do" method="post">
      <div id="login-close" style="width: 40px; height: 40px;"><img src="https://i.imgur.com/B3yWAxM.png" width="25px"></div>
      <div style="border: 1px solid red;">
        <!-- 아이디 -->
        <div id="inputs01" class="inputs" style="display: flex; justify-content:center; align-items:center; width:350px; height: 55px;">
          <img src="https://i.imgur.com/jiAGWQk.png" width="20px" style="margin-left: 20px;margin-right: 10px;">
          <label for="id_input01">
            <input type="text" id="id_input01" name="memberId" placeholder="아이디">
          </label>
        </div>
        <br>
        <!-- 비밀번호 -->
        <div id="inputs02" class="inputs" style="display: flex; justify-content:center; align-items:center; width:350px; height: 55px;">
          <img src="https://i.imgur.com/sPvVjJ2.png" width="20px" style="margin-left: 20px; margin-right: 10px;">
          <label for="id_input02">
            <input type="password" id="id_input02" name="memberPw" placeholder="비밀번호">
          </label>
        </div>
        
        
        <!-- 아이디 저장 체크박스 -->
        <div style="margin-top: 20px;">
            <input type="checkbox" name="saveId" id="saveId" <%=saveId!=null?"checked":"" %>>아이디 저장
            <!-- 로그인 버튼 -->
            <br>
            <input type="submit" value="로그인">
            </form>
            
        <ul>
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <span>카카오 회원가입</span>
      </a>
	</li>
	<!--  <li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>-->
</ul>
      <%} %>
      </div>
        
        
        
        <!-- 비밀번호 찾기, 아이디 찾기, 회원가입 버튼 -->
        <div id="find" style="margin-top: 20px;">
        <!--	<a id="findId" href="<%=request.getContextPath() %>/common/FindID.do">아이디 찾기</a>-->
        	<a id="findId" href="#">아이디 찾기</a>
        	<a id="findPw" href="#">비밀번호 찾기</a>
			<a href="<%=request.getContextPath() %>/common/MemberEnroll.do" style="border-right:0px">회원가입</a>
        </div>
       


  <script>
  		//아이디 찾기
	  document.getElementById("findId").addEventListener("click", e => {
		  open("<%=request.getContextPath()%>/common/findId.do","_blank","width=600,height=500");
	  });
	  	//비밀번호 찾기
	  document.getElementById("findPw").addEventListener("click", e => {
		  open("<%=request.getContextPath()%>/common/FindPW.do","_blank","width=600,height=500");
	  });
  
	 // 로그인 창 띄우기
    document.getElementById("mypage").addEventListener("click",e=>{
      const login = document.getElementById("login");
      if(login.style.display="none"){
        login.style.display="block";
      }
    });

    //로그인 창 닫기
    document.getElementById("login-close").addEventListener("click",e=>{
      const login = document.getElementById("login");
      if(login.style.display="block"){
        login.style.display="none";
      }
    });

    document.querySelector("#id_input01").addEventListener("focus",e=>{
      const div01=document.getElementById("inputs01");
      div01.style.opacity="1";
      div01.style.outline="3px solid rgb(66, 114, 227)";
    });
    document.querySelector("#id_input01").addEventListener("blur",e=>{
      const div01=document.getElementById("inputs01");
      div01.style.opacity="0.5";
      div01.style.outline="0px";
    });

    document.querySelector("#id_input02").addEventListener("focus",e=>{
      const div01=document.getElementById("inputs02");
      div01.style.opacity="1";
      div01.style.outline="3px solid rgb(66, 114, 227)";
    });
    document.querySelector("#id_input02").addEventListener("blur",e=>{
      const div01=document.getElementById("inputs02");
      div01.style.opacity="0.5";
      div01.style.outline="0px";
    });

    
  </script>

  
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
Kakao.init('b94934910f5d3388dded25ccb1ba4ffa'); //발급받은 키 중 javascript키
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  const account=response.kakao_account;
        	  const kakaoEmail=account.email;
        	  const kakaoNickname=account.profile.nickname;        	  
        	  console.log(account);
        	  console.log(kakaoEmail);
        	  console.log(kakaoNickname);
        	  if(kakaoEmail!=null||kakaoNickname!=null){
        		  if(confirm("회원가입을 위해 추가 정보입력이 필요합니다. 회원가입페이지로 이동하시겠습니까?")){
        			  location.assign("<%=request.getContextPath()%>/common/KakaoMemberEnroll.do?kakaoEmail=" + kakaoEmail + "&kakaoNickname=" + kakaoNickname); //여기 카카오로그인 서블릿으로 새로파서 연결
        		  }
        	  }
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
//function kakaoLogout() {
  //  if (Kakao.Auth.getAccessToken()) {
    //  Kakao.API.request({
      //  url: '/v1/user/unlink',
        //success: function (response) {
        	//console.log(response)
        //},
        //fail: function (error) {
         // console.log(error)
        //},
      //})
     // Kakao.Auth.setAccessToken(undefined)
    //}
  //};

  
</script>

    
  </header> 
</body>
</html>
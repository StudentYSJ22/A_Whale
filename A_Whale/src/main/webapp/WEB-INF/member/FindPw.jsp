<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String DBID=(String)request.getAttribute("DBId");
	String DBEM=(String)request.getAttribute("DBEmail");

%>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
    body {
        font-family: 'KoPubWorldDotum', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #f0f0f0;
    }
    .container {
        background-color: white;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        width: 400px;
        text-align: center;
    }
    .container h2 {
        margin-bottom: 20px;
    }
    .container input[type="email"], .container input[type="text"] {
        width: 80%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }
    .container button {
        padding: 10px 20px;
        border: none;
        background-color: #4CAF50;
        color: white;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }
    .container button:hover {
        background-color: #45a049;
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <h2>비밀번호 찾기</h2>
        <form id="findPasswordForm">
            <label for="userId">아이디:</label>
            <input type="text" id="userId" name="userId" required>
            <label for="email">회원가입할 때 입력했던 이메일주소:</label>
            <input type="email" id="email" name="email" required>
            <button type="button" id="emailveri" disabled>이메일 인증</button>
        </form>
        <div id="verificationSection" style="display:none;">
            <label for="verificationCode">인증번호 입력:</label>
            <input type="text" id="verificationCode" name="verificationCode" required>
            <button id="verifyButton">인증</button>
        </div>
            <div id="verficationResult" style="display:none;"></div>
        
        
        <div id="newPasswordInputSection" style="display:none;">
        <label for="password">새로운 비밀번호:</label>
        <div id="newPwinput"><input type="password" id="newPw" name="newPw" required></div>
        <label for="password">비밀번호 재입력:</label>
        <div id="newPwCheck"><input type="password" id="check_newPw" name="check_newPw" required></div>
        <button id="changeButton">비밀번호 변경하기</button>
        <div id="pwresult"></div>
        <div id="result"></div>
        </div>
    </div>

    <script>
        let verificationCodefromWeb = "";
        
        document.getElementById("email").addEventListener("blur",
    			e=>{
    				
    				$.ajax({
                        url: "<%=request.getContextPath()%>/common/FindPwVeri.do",
                        method: "POST",
                        data: { userId: $("#userId").val() },
                        success: function(data) {
                        	data=JSON.parse(data);
                            if($("#userId").val()!=data.dbId&&$("#email").val()!=data.dbEmail){
                            	alert("아이디, 이메일이 일치하지않습니다!");
                            	$("#emailveri").text("본인인증실패");
                            }else{
                            	$("#emailveri").attr("disabled",false);
	                            $("#emailveri").text("이메일 인증");
                            }
                        },
                        error: function() {
                            alert('서버에서 본인인증에 실패 관리자에게 문의하세요!');
                            $("#emailveri").text("본인확인 실패!");
                        }
                    }); 
    				$("#emailveri").text("본인확인중....");
                });

        
		//이메일 인증 버튼 : 입력한 아이디와 이메일로 db와 비교 후에 일치하면 이메일 인증메일 전송 
        document.getElementById("emailveri").addEventListener("click", function(event) {
            const username = document.getElementById("userId").value;
            const email = document.getElementById("email").value;

            if (username.trim() !== "" && email.trim() !== "") {
                $.ajax({
                    url: "<%=request.getContextPath()%>/common/emailSend.do",
                    method: "POST",
                    data: { email: email },
                    success: function(response) {

                    	verificationCodefromWeb = response;
                        $('#userId').prop('readonly', true);
                        $('#email').prop('readonly', true);
                        $('#verificationSection').show();
                       
                    },
                    error: function() {
                        alert('이메일 전송에 실패했습니다.');
                    }
                }); 
            } else {
                alert("아이디와 이메일 주소를 확인해주세요.");
            }
        });
        //인증버튼 누르면 비밀번호변경 섹션 show() 처리
        document.getElementById("verifyButton").addEventListener("click", function(event) {
            event.preventDefault();
            const inputCode = document.getElementById("verificationCode").value;

            if (inputCode === verificationCodefromWeb) {
                        $('#newPasswordInputSection').show();
                        $("#verficationResult").html("인증 완료.");
                    }else {
                    	$("#verficationResult").html("인증 실패 인증번호를 확인해주세요.");
            }
        });
        
		//비밀번호 변경하기 버튼 섹션
        document.getElementById("changeButton").addEventListener("click", function(event) {
            event.preventDefault();
            const inputCode = document.getElementById("verificationCode").value;

            if (inputCode === verificationCodefromWeb) {
                $.ajax({
                    url: "<%=request.getContextPath()%>/common/PasswordFinder.do",
                    method: "POST",
                    data: { userId: document.getElementById("userId").value, email: document.getElementById("email").value, newPw: document.getElementById("newPw").value },
                    success: function(response) {
                        $("#result").html(response);
                        $('#check_newPw').prop('readonly', true);
                        $('#newPw').prop('readonly', true);
                    },
                    error: function() {
                        $("#result").html("해당 이메일로 가입된 계정이 없습니다.");
                    }
                });
            } else {
                alert("인증번호가 일치하지 않습니다.");
            }
        });
      
        document.getElementById("check_newPw").addEventListener("keyup",
    			e=>{
    				const pw=document.querySelector("#newPw").value;
    				const pwck=e.target.value;
    				const resultContainer=document.querySelector("#pwresult");
    				if(pw.length>=4&&pwck.length>=4){
        				if(pw==pwck){
        					resultContainer.innerText="비밀번호가 일치합니다";
        					resultContainer.style.color="green";
        				}else{
        					resultContainer.innerText="비밀번호가 일치하지 않습니다";
        					resultContainer.style.color="red";
        					document.querySelector("#newPw").value="";
        					e.target.value="";
        					document.querySelector("#newPw").focus();
        				}
    				}else{
    					resultContainer.innerText="";
    				}
    			});
        
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/subHeader.jsp" %>
<%@ page import="java.util.List, com.nbp.product.model.DTO.Product" %>
<% 
	List<Product> products=(List<Product>)request.getAttribute("products");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    header{
        height: 150px;
    }
	#list-menu{
	   margin-top: 30px;
	   height: 150px;
	   display: flex;
	   justify-content: center;
	   align-items: center;
	}

    ul, li {
      margin: 0;
      padding: 0;
      list-style: none;
    }
    
    #list-menu>ul>li{
        margin: 0px 30px;
    }

    #list-menu>ul{
        display: flex;
        justify-content: center;
    }

    #list-menu>ul>li>ul{
        display: flex;
        align-items: center;
    }

    #sub-menu1{
      position: absolute;
      margin-top: 50px;
      font-size: 25px;
      font-weight: lighter;
      opacity: 0;
      visibility: hidden;
      transition: all 0.35s ease-in;
      background-color: rgba(255, 255, 255, 0);
      border-radius: 5px;
    }

    #sub-menu1>li>a{
      color: #181850;
      margin-left:15px;
      margin-right:15px;
    }


    #sub-menu-title{
      display: flex;
      justify-content: center;
      font-size: 25px;
      font-weight: bolder;
      color: #181850;

    }

    #sub-menu-title:hover #sub-menu1{
      opacity: 1;
      visibility: visible;
    }
    
    #sub-menu-title:hover{
      text-decoration: underline;
    }
    
    #sub-menu1>li>a:hover{
      opacity:0.5;
    }

    #sub-menu-title>a{
    margin-left: 30px;
    margin-right: 30px;
    color: #181850;
    }
    
    #product-title{
    border-top:3px solid rgb(17, 17, 68); 
    border-bottom:3px solid rgb(17, 17, 68); 
    padding-top:20px;
    padding-bottom:20px;
    margin-top:50px;
    font-size:25px;
    width:100%;
    color:rgb(17, 17, 68);
    }
    
    #product-container{
		display:flex;
		justify-content:center;
    	align-items:center;
    	flex-direction: column;
    }
    
    #product-all{
    	display:grid;
    	justify-content:center;
    	align-items:center;
    	grid-template-columns: repeat(3,400px);
    	grid-template-rows: repeat(2,520px);
    	gap:150px;
    	
    }
    
    .product{
    	width:400px;
    	height:520px;
    	background:lightgray;
    	border:1px solid red;
    }
    
    #read-btn{
    	width:200px;
    	height:70px;
    	background-color:rgb(17, 17, 68);
    	border-radius:100px;
    	display:flex;
    	justify-content:center;
    	align-items:center;
    	margin-top:40px;
    	margin-bottom:100px;
    	cursor:pointer;
    }
    
    #read-btn>p{
    	text-decoration:none;
    	color:white;
    	font-size:25px; 
    	font-weight:bolder;
    }
    
    #read-btn:hover{
    	opacity:0.7;
    }
    
</style>
</head>
<body>
<section>
		<div id="product-title"  style="min-width: 1400px;">
			<h2 style="text-align:center;">All Products.</h2>
		</div>
        <div id="list-menu" style="min-width: 1400px;">
            <ul>
                <li id="sub-menu-title"><a href="">brand</a>
                    <ul id="sub-menu1">
                        <li><a href="">submenu</a></li>
                        <li><a href="">submenu</a></li>
                        <li><a href="">submenu</a></li>
                        <li><a href="">submenu</a></li>
                    </ul>
                </li>
                <li id="sub-menu-title"><a  href="">alcohole</a>
                    <ul id="sub-menu1">
                      <li><a href="">submenu</a></li>
                      <li><a href="">submenu</a></li>
                      <li><a href="">submenu</a></li>
                      <li><a href="">submenu</a></li>
                    </ul>
                </li>
                <li id="sub-menu-title" ><a href="">origin</a>
                    <ul id="sub-menu1">
                      <li><a href="">submenu</a></li>
                      <li><a href="">submenu</a></li>
                      <li><a href="">submenu</a></li>
                      <li><a href="">submenu</a></li>
                    </ul id="sub-menu">
                </li>
                <li id="sub-menu-title" ><a href="">age</a>
                    <ul id="sub-menu1">
                      <li><a href="">submenu</a></li>
                      <li><a href="">submenu</a></li>
                      <li><a href="">submenu</a></li>
                      <li><a href="">submenu</a></li>
                    </ul>
                </li>
                <li id="sub-menu-title" ><a href="">type</a>
                  <ul id="sub-menu1">
                    <li><a href="">submenu</a></li>
                    <li><a href="">submenu</a></li>
                    <li><a href="">submenu</a></li>
                    <li><a href="">submenu</a></li>
                  </ul>
              </li>
                
            </ul>
        </div>
        <div id="product-container">
	        <div id="product-all" style="border:1px solid red; min-width: 1400px; margin-top:50px;" >
	        	<div class="product"><img src="https://i.imgur.com/EwzxUrT.png" style="width:100%; height:100%;"></div>
	        	<div class="product">2</div>
	        	<div class="product">3</div>
	        	<div class="product">4</div>
	        	<div class="product">5</div>
	        	<div class="product">6</div>
	        </div>
	        <%=request.getAttribute("pageBar")%>
        </div>
        
        <script>
        	let firstNo = 1;
        	let lastNo = 6;
        	document.getElementById("read-btn").addEventListener("click",e=>{
        		firstNo=firstNo+6;
        		lastNo=lastNo+6;
        		fetch("<%=request.getContextPath()%>/product/productlist.do?lastNo="+lastNo+"&firstNo="+firstNo)
        		.then(response=> response.text())
        		.then(data=>{
        			
        		});
        	});
        
        </script>

    </section>

</body>
</html>
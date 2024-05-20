<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        body{
          background-image: url("https://images.unsplash.com/photo-1629196911514-cfd8d628ba26?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
          background-size: 100%;
         
        }
        a{
    		text-decoration: none;
    	}

        .shadow{
          box-shadow: 3px 3px 3px 3px #555555
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


        *{margin: 0;}

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
	
	
	    }
	
	    #main-menu > li > a {
	      font-size: 25px;
	      color: rgb(57, 56, 68);
	      font-weight: bolder;
	      text-align: center;
	      text-decoration: none;
	      letter-spacing: 0.05em;
	      display: block;
	      padding: 14px 36px;
	      border-right: 2px solid rgba(0, 0, 175, 0.45);
	      text-shadow: 1px 1px 1px rgba(18, 14, 87, 0.5);
	
	    }
	
	
	    #sub-menu {
	      margin-top: 20px;
	      position: absolute;
	      opacity: 0;
	      visibility: hidden;
	      transition: all 0.35s ease-in;
	      background: #181850;
	      /* border-radius: 5px; */
	    }
	
	    #sub-menu > li {
	      padding: 16px 28px;
	
	    }
	
	    #sub-menu > li >  a {
	      color: rgb(255, 255, 255);
	      text-decoration: none;
	      font-size: 25px;
	      font-weight: lighter;
	    }
	
	    #main-menu > li:hover #sub-menu {
	      opacity: 1;
	      visibility: visible;
	    }
	
	
	
	    #sub-menu > li >  a:hover {
	    text-decoration: underline;
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
	      transition: all 0.35s ease-in;
	    }
	
	    #main-menu a:hover{
	      opacity: 0.5;
	      text-decoration: underline;
	
	    }
	
	    #main{
	        display: flex;
	        margin-top: 20px;
	        margin-left: 20px;
	        height: 50px;
	    }
	
	    .header-icon{
	          opacity: 1;
	          transition: all 0.25s ease-in;
	        }
	
	    .header-icon:hover{
	      opacity: 0.5;
	    }
	    
	</style>    
</head>
<body>
 <header>
        <div id="main">
            <div class="logo border" style="width: 150px; height: 120px;"><img src="https://postfiles.pstatic.net/MjAyNDA1MTZfNjcg/MDAxNzE1ODUwMjgwOTY5.Jv6Kv_HtWZpWqwM47oHMsFPkdaNbnGuLxQcWEOivE3og.C6hmrMJVaBa-vZpvbdWJ47MpvixWDoZYUjALOHNn1ssg.PNG/logo1.png?type=w773" alt="" width="100px" height="80px"></div>
            <div id="category" style="min-width: 1100px;margin-top: 20px;">
              <nav role="navigation">
                <ul id="main-menu">
                  <li><a href="#" id="menu">home</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                    </ul>
                  </li>
                  <li><a href="#" id="menu">product</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                    </ul>
                  </li>
                  <li><a href="#" id="menu">event</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                    </ul>
                  </li>
                  <li><a href="#" id="menu" >recipe</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                    </ul>
                  </li>
                  <li><a href="#" id="menu">community</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                    </ul>
                  </li>
                  <li><a href="#" id="menu">service</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                    </ul>
                  </li>
                </ul>
              </nav>
            </div>
            <div  class="logo evencenter" style="width: 300px; height: 120px; margin-left: auto;"> 
              <a class="header-icon" href=""><img src="https://postfiles.pstatic.net/MjAyNDA1MTZfMjU4/MDAxNzE1ODUwMjgwOTU4.Tk8o-0wr5yOJqHcZe2qSyd6Sw5htuKotfTvqpzw3ffsg.m5BvckFSblkDLbIXmjnPS2PwN5ajZOzkXWxbG2S4fkgg.PNG/cart.png?type=w773" width="50px" height="50px"></a>
              <a class="header-icon" href=""><img src="https://postfiles.pstatic.net/MjAyNDA1MTZfMTY0/MDAxNzE1ODUwMjgwOTU2.uF-0pUqfz5kh9OZ-pV5bnC3W0BfZl04LzzoOjbKmAiUg.fn20oNtHI4PZjHPE9-DQ54fmBRjZ7gEQVfdQRCjDn8Eg.PNG/heart.png?type=w773" width="50px" height="50px"></a>
              <a class="header-icon" href=""><img src="https://postfiles.pstatic.net/MjAyNDA1MTZfNCAg/MDAxNzE1ODUwMjgxMDgw.TxIrC-5XuT4c-JczAuIocVq_gKcq-TIyIwjUNXLJbIwg.FAvOJXG7cNFKR2QCVGGy8eRzhOJLcAndZXbysBJl1YMg.PNG/person.png?type=w773" width="50px" height="50px"></a>
          </div>
        </div>
    </header>

</body>
</html>
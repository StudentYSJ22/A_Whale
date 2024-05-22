<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,com.nbp.notice.model.dto.Notice, java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/common/subHeader.jsp" %>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세내용</title>
</head>
<style>
	.notice{
        height: 100px;
        align-content: center;
        text-align: center;
        font-weight: 1000;
    }

    .notice_detail_container{
        margin: 0 10% 0 10%;
    }
    .notice_detail_title{
        font-size: 16px;
        margin: 15px 15px 15px 20px;
    }
    .row1{
        border-top: 0.5px solid rgb(202, 202, 254);
        border-bottom: 0.5px solid rgb(202, 202, 254);
    }
    .row2{
        font-size: 13px;
        display: flex;
        border-bottom: 0.5px solid rgb(202, 202, 254);
    }
    .row2 div{
        margin: 15px 15px 15px 20px;
    }

    .img_cotainer{
        display: flex;
        justify-content: center; 
        
  
    }
    .img_cotainer img{
        max-width: 100%;
       
    }
    .notice_list{
        margin: 30px 0 50px 20px;
    }
    button{
        background-color: white; 
        width: 60px; 
        border: 0.5px solid black;
    }
</style>
<body>
    <section>
        <div>
            <div class="notice" >
                N O T I C E
            </div>
        </div>


        <div class="notice_detail_container" >
            <div class="row1">
                <div class="notice_detail_title">
                    <strong><%=n.getNoticeTitle() %></strong> 
                </div>
            </div>
            <div class="row2" >
                <div class="notice_detail_writer" > 
                    <%=n.getNoticeWriter() %>
                </div>
                <div class="notice_detail_date" >
                    <%=new SimpleDateFormat("yyyy-MM-dd").format(n.getNoticeEnrollDate()) %>
                </div>
            </div>
            
                
      
            <div>
                <div class="">
                    <div class="notice_detail_img">
                        <div class="img_cotainer" style="margin: 30px;">
                            <img src="https://d1e2y5wc27crnp.cloudfront.net/media/core/product/thumbnail/9f46521c-3d51-4b4f-b5bf-fdf70fe2e574.webp"
                         alt="" width="400" height="600" style="justify-content:center;">
                        </div>
                        
                    </div>
                </div>
                <div class="" style="margin: 10px; border-bottom: 0.5px solid rgb(202, 202, 254);">
                    <div class="notice_detail_content" style="margin: 20px 20px 80px 20px">
                    <%=n.getNoticeContent() %>
                        <!-- 1827년 스코틀랜드의 조지 밸런타인이라는 사람이 식당 겸 식료품점에서 여러 가지 위스키를 판매하던 곳에서 시작되었다. 1865년 그의 아들이 글래스고에 대형 식료품점을 개업하자, 앞서 판매하던 여러 종류의 위스키를 조합하여 만든 독자적인 블렌디드 위스키를 판매하기 시작하였다. 처음에는 여러 시행착오를 거치면서 조합한 위스키를 캐스크에 넣고 숙성하여 판매하였으나, 곧 George Ballantine & Son Ltd.사를 창립하여 본격적으로 블렌디드 스카치 위스키 제조 
                        및 판매를 시작하였다. 전통적으로 밤중에 거위떼를 동원하여 증류소를 지키게 했던 방식으로 유명했다.
						발렌타인 사는 가장 크고 유명한 위스키 제조사 중 하나이며, 가장 전형적인 블렌디드 스카치 위스키로 여겨지고 있다. 이 회사의 제품 중 스탠다드급(NAS, 숙성년수 미표기)위스키인 발렌타인 파이니스트(Ballantine's Finest)는 J&B 레어, 조니 워커 레드와 함께 세계에서 가장 많이 팔리는 위스키로 알려져 있기도 하다.
						국내에서도 위스키하면 조니 워커,시바스 리갈과 발렌타인을 떠올릴 만큼 대표적인 위스키 브랜드로 알려져 있다. 특유의 부드러운 바디감으로 목넘김을 중시하는 한국인의 취향에 잘 맞는다는 의견이 있다. 비슷한 숙성연수의 시바스 리갈이나 조니 워커와 비교해봤을 때, 발렌타인이 튀는 향이 적어 더 부드럽다고 평가하는 사람이 많으며, 이는 호불호가 적다는 장점이 되기도, 개성이 부족하다는 단점이 되기도 한다.
						여튼, 이 호불호가 적다는 장점이 발렌타인 21년을 선물계의 조던링으로 만들었다. 남자 어른에게 선물하면 실패가 없다. 술을 안드시는 분이라해도 발렌타인 21년이 비싼 술이라는 것은 안다. 발렌타인은 맛과 브랜드 인지도로만 따지면 로얄 살루트 21년, 조니워커 블루와 함께 선물용으로 최적격인 술 중 하나이다. 조니 워커나 시바스 리갈은 어르신들 중에서도 취향이 갈리지만, 발렌타인은 어떤 사람이든 무난하게 생각하는 관계로 호불호가 갈리지 않는다. -->
                    </div>
                </div>
            </div>
            <div class="notice_list" >
                <a href="<%=request.getContextPath()%>/notice/noticelist.do"><button >목록</button></a>
            </div>
        </div>
    </section>
</body>
</html>
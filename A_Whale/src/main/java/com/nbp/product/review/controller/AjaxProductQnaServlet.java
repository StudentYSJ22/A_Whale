package com.nbp.product.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.product.review.model.DTO.Qna;
import com.nbp.product.review.model.service.ProductQnaService;
import com.nbp.product.review.model.service.ProductReviewService;

/**
 * Servlet implementation class AjaxProductQnaServlet
 */
@WebServlet("/product/qnaall.do")
public class AjaxProductQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxProductQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//상품 qna 자료, 페이지 바 처리
				int cPage = 1;
				try {
					cPage = Integer.parseInt(request.getParameter("ajaxcPage"));
				}catch(NumberFormatException e) {}
				//페이지당 데이터 갯수 지정
				int numPerpage = 3;
				try {
					numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
				}catch(NumberFormatException e) {}
				
				String productName = request.getParameter("productName");

				
				//qna 게시판의 내용
				List<Qna> qnas = new ProductQnaService().selectProductQnaAll(cPage, numPerpage, productName);
				request.setAttribute("qnas", qnas);
				
				
				
				//전체 데이터 수 
				int totalData = new ProductQnaService().selectProductQnaAllCount(productName);
				//전체 페이지 수
				int totalPage = (int)Math.ceil((double)totalData/numPerpage);
				//페이지 바 길이 설정
				int pageBarSize = 3; 
				//페이지 바 시작 번호 설정
				int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
				//페이지 바 끝 번호 설정
				int pageEnd = pageNo+pageBarSize-1;
				
				
				String qnaPageBar = "<div id='pagebar'>";
				//이전페이지 버튼 구현
				if(pageNo==1) {
					qnaPageBar+="<img src='https://i.imgur.com/hV1m2Nk.png' width='10px' height='15px' style='opacity:0.5'>";
				}else {
					qnaPageBar+="<img id='qnaPagePrev' style='cursor:pointer;' src=\"https://i.imgur.com/9b9FgKl.png\" width=\"10px\" height=\"15px\">";
				}
				//페이지 숫자 버튼 구현 
				while(!(pageNo>pageEnd||pageNo>totalPage)) {
					if(pageNo==cPage) {
						qnaPageBar+="<div id='cPageNext_qna' style='font-size:20px; color:rgb(125, 125, 125);'>"+pageNo+"</div>";
					}else {
						qnaPageBar+="<div class='qnacPage' style='cursor:pointer;'>"+pageNo+"</div>";
					}
					pageNo++;
				}
				
				if(pageNo>totalPage) {
					qnaPageBar+="<img src=\"https://i.imgur.com/9dt5DiB.png\" width=\"10px\" height=\"15px\" style='opacity:0.5'>";
				}else {
					qnaPageBar+="<img id='qnaPageNext' style='cursor:pointer;' src=\"https://i.imgur.com/9dt5DiB.png\" width=\"10px\" height=\"15px\">";
				}
				
				qnaPageBar+="</div>";
				
				request.setAttribute("qnaPageBar", qnaPageBar);
		
		
		
		
		request.getRequestDispatcher("/WEB-INF/views/product/ajaxProductQna.jsp").forward(request, response);
	
	
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

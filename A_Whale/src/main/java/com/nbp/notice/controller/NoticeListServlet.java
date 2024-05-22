package com.nbp.notice.controller;

import java.io.IOException; 
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.notice.model.dto.Notice;
import com.nbp.notice.model.service.NoticeService;

/**
 * Servlet implementation class InformListServlet
 */
@WebServlet("/notice/noticelist.do")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage=1;

		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));

		}catch(NumberFormatException e) {}
		
		int numPerpage=3;
		try {
			numPerpage=Integer.parseInt(request.getParameter("numPerpage"));			
		}catch(NumberFormatException e) {}
		
		List<Notice> notices=new NoticeService().selectNoticeAll(cPage,numPerpage);
		
		request.setAttribute("notices",notices);
		
		int totalData=new NoticeService().selectNoticeCount();
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1; 
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="<ul class='pagination '>";
		if(pageNo==1) { //1번페이지면 이전버튼 작동하지 않게
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		}else { //2번페이지면 이전번튼 작동하게
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='"+request.getRequestURI()
			+"?cPage="+(pageNo-1)+"&numPerpage="+numPerpage+"'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='"+request.getRequestURI()
							+"?cPage="+(pageNo)+"&numPerpage="+numPerpage+"'>"
							+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='"+request.getRequestURI()
						+"?cPage="+(pageNo)+"&numPerpage="+numPerpage+"'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		request.setAttribute("pageBar",pageBar);
		
		
		request.getRequestDispatcher("/WEB-INF/views/notice/noticeList.jsp")
				.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

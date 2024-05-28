package com.nbp.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.notice.model.dto.Notice;
import com.nbp.notice.model.service.NoticeService;

/**
 * Servlet implementation class InformViewServlet
 */
@WebServlet("/notice/noticeview.do")
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            int noticeNo = Integer.parseInt(request.getParameter("no"));
            System.out.println("Requested Notice No: " + noticeNo); // 디버그용 출력
            Notice notice = new NoticeService().selectNoticeByNo(noticeNo);
            if (notice != null) {
                request.setAttribute("notice", notice);
                request.getRequestDispatcher("/WEB-INF/views/notice/noticeView.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "등록이 완료되었습니다");
                request.setAttribute("loc", "/admin/adminpage.do");
                request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
//            request.setAttribute("msg", "잘못된 접근입니다.");
//            request.setAttribute("loc", "/notice/noticelist.do");
//            request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
        }
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

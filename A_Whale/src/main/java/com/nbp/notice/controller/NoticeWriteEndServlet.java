package com.nbp.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.notice.model.dto.Notice;
import com.nbp.notice.model.service.NoticeService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeWriteEndServlet
 */
@WebServlet("/notice/noticewriteend.do")
public class NoticeWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩 
		String encode="UTF-8";
		
		String uploadPath=getServletContext().getRealPath("/")+"upload";//getRealPath("/")하면 wepapp위치가 잡힌다
//				System.out.println(uploadPath);
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) uploadDir.mkdirs();
		
		
		//파일크기
		int maxSize=1024*1024*20; 
		
		//리네임
		DefaultFileRenamePolicy dfrp=new DefaultFileRenamePolicy();
		
		MultipartRequest mr = new MultipartRequest(request,uploadPath,maxSize,encode,dfrp);
		
		//폼으로 보낸거 가져오는거
		String title= mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String content= mr.getParameter("content");
		String fileName = "";
		
		////
		Enumeration files = mr.getFileNames();
        while (files.hasMoreElements()) {
            String name = (String) files.nextElement();
            fileName = mr.getFilesystemName(name);
        }
		
		Notice notice = new Notice();
		notice.setNoticeTitle(title);
        notice.setNoticeWriter(writer);
        notice.setNoticeContent(content);
        notice.setNoticeImgUrl(fileName); 
        
        
        int noticeNo = new NoticeService().insertNotice(notice);
        
        if (noticeNo > 0) {
        	System.out.println("Inserted Notice No: " + noticeNo); // 디버그용 출력
            response.sendRedirect(request.getContextPath() + "/notice/noticeview.do?no=" + notice.getNoticeNo());
        } else {
            System.out.println("Failed to insert notice"); // 디버그용 출력

            request.setAttribute("msg", "공지사항 등록 실패");
            request.setAttribute("loc", "/notice/noticewrite.do");
            request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
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

package com.nbp.notice.model.service;

import static com.nbp.common.JDBCTemplate.close;
import static com.nbp.common.JDBCTemplate.commit;
import static com.nbp.common.JDBCTemplate.getConnection;
import static com.nbp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.nbp.notice.model.dao.NoticeDAO;
import com.nbp.notice.model.dto.Notice;



public class NoticeService {
	private NoticeDAO dao=new NoticeDAO();
	
	
	public List<Notice> selectNoticeAll(int cPage, int numPerpage){
		Connection conn = getConnection();
		List<Notice> result = dao. selectNoticeAll(conn, cPage, numPerpage);
		close(conn);
		return result;
	}
	
	public int selectNoticeCount() {
		Connection conn = getConnection();
		int result = dao.selectNoticeCount(conn);
		close(conn);
		return result;
	}
	
	public Notice selectNoticeByNo(int no) {
		Connection conn = getConnection();
		Notice n = dao.selectNoticeByNo(conn,no);
		close(conn);
		return n;
	}
	public int insertNotice(Notice n) {
		Connection conn= getConnection();
		int result = dao.insertNotice(conn,n);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}

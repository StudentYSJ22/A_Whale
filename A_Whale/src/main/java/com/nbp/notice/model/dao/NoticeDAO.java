package com.nbp.notice.model.dao;

import static com.nbp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.nbp.notice.model.dto.Notice;

public class NoticeDAO {
	private Properties sql = new Properties();
	{
		String path = NoticeDAO.class.getResource("/sql/notice/notice.properties").getPath();
		try(FileReader fr= new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public List<Notice> selectNoticeAll(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Notice> notices =new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectNoticeAll"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				notices.add(getNotice(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return notices;
	}
	
	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result =0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectNoticeCount"));
			rs=pstmt.executeQuery();
			rs.next();
			result=rs.getInt(1); //if문 안써도 된다
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public Notice selectNoticeByNo(Connection conn, int no) {
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		Notice n = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectNoticeByNo"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				n=getNotice(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return n;
	}
	
	
	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertNotice"));
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeWriter());
			pstmt.setString(3, n.getNoticeContent());
//			pstmt.setString(4, n.getFilePath());
			pstmt.setString(4, n.getNoticeImgUrl());
			result= pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public static Notice getNotice(ResultSet rs) throws SQLException{//위에서 처리해라
		return Notice.builder()
				.noticeNo(rs.getInt("notice_no"))
				.noticeTitle(rs.getString("notice_title"))
				.noticeContent(rs.getString("notice_content"))
				.noticeWriter(rs.getString("notice_writer"))
				.noticeImgUrl(rs.getString("notice_img_url"))
				.noticeEnrollDate(rs.getDate("notice_enroll_date"))
				.noticeUpdateDate(rs.getDate("notice_update_date"))
				.noticeDeleteDate(rs.getDate("notice_delete_date"))
				.noticeDeleteYn(rs.getInt("notice_delete_yn"))
				.build();
	}
	
}

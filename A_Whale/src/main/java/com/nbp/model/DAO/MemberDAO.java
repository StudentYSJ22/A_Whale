package com.nbp.model.DAO;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.nbp.common.JDBCTemplate.*;

import com.nbp.model.DTO.Member;

public class MemberDAO {
	private Properties sql=new Properties();
	{
		String path=MemberDAO.class
				.getResource("/member/member.properties").getPath();
		try(FileReader fr=new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertMember"));
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberNickname());
			pstmt.setString(3, m.getMemberPw());
			pstmt.setString(4, m.getMemberName());
			pstmt.setString(5, m.getMemberPhone());
			pstmt.setString(6, m.getMemberEmail());
			pstmt.setString(7, m.getMemberAdr());
			pstmt.setString(8, m.getMemberBirthDate());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int updateMember(Connection conn, String pw, String em, String adr, String ph, String id) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateMember"));
			pstmt.setString(1, pw);
			pstmt.setString(2, em);
			pstmt.setString(3, adr);
			pstmt.setString(4, ph);
			pstmt.setString(5, id);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int updateMemberByEmail(Connection conn, String newPw, String em, String id) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateMemberByEmail"));
			pstmt.setString(1, newPw);
			pstmt.setString(2, em);
			pstmt.setString(3, id);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int deleteMember(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteMember"));
			pstmt.setString(1, memberId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public Member selectMemberById(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMemberById"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) m=getMember(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;	
	}
	public Member selectMemberByEmail(Connection conn, String userEmail) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMemberByEmail"));
			pstmt.setString(1, userEmail);
			rs=pstmt.executeQuery();
			if(rs.next()) m=getMember(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;	
	}
	
	
	public static Member getMember(ResultSet rs) throws SQLException{
		Date enrollDate=rs.getDate("ENROLL_DATE");
		return Member.builder()
				.memberId(rs.getString("MEMBER_ID"))
				.memberNo(rs.getInt("MEMBER_NO"))
				.memberNickname(rs.getString("MEMBER_NICKNAME"))
				.memberGrade(rs.getNString("MEMBER_GRADE"))
				.memberPw(rs.getString("MEMBER_PASSWORD"))
				.memberName(rs.getString("MEMBER_NAME"))
				.memberPhone(rs.getString("MEMBER_PHONE"))
				.memberEmail(rs.getString("MEMBER_EMAIL"))
				.memberAdr(rs.getString("MEMBER_ADDRESS"))
				.memberBirthDate(rs.getString("MEMBER_IDNUMBER"))
				.coupon(rs.getInt("MEMBER_COUPON"))
				.enrollDate(enrollDate!=null?enrollDate.toLocalDate():null)
				.build();
	}
	
}

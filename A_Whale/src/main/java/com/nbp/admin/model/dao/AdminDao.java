package com.nbp.admin.model.dao;

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

import com.nbp.model.DTO.Member;
import com.nbp.model.DAO.MemberDAO;




public class AdminDao {
	private Properties sql = new Properties();
	
	{
		String path=AdminDao.class.getResource("/sql/admin/admin.properties").getPath();
		try (FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Member> selectMemberAll (Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Member> members=new ArrayList<>();
		try {
			pstmt =conn.prepareStatement(sql.getProperty("selectMemberAll"));

			rs=pstmt.executeQuery();
			while(rs.next()) {
				members.add(MemberDAO.getMember(rs)); 
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return members;
	}
	
	public int selectMemberAllCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		int result =0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMemberAllCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1); //이런거 할때!! index 쓴다
			}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	
}

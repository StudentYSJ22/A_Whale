package com.nbp.admin.service;

import static com.nbp.common.JDBCTemplate.close;   
import static com.nbp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.nbp.admin.model.dao.AdminDao;
import com.nbp.model.DTO.Member;

public class AdminService {
	private AdminDao dao= new AdminDao();
	
	public List<Member> selectMemberAll(){
		Connection conn= getConnection();
		List<Member> members=dao.selectMemberAll(conn); 
		close(conn);
		return members;
	}
	public int selectMemberAllCount(){ 
		Connection conn= getConnection();
		int result =dao.selectMemberAllCount(conn);
		close(conn);
		return result;
	}

	
	
	
	
	
	
	

}

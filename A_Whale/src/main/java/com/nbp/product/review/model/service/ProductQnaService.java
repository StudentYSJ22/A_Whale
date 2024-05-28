package com.nbp.product.review.model.service;

import static com.nbp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.nbp.product.review.model.DAO.ProductQnaDao;
import com.nbp.product.review.model.DTO.Qna;

public class ProductQnaService {
	
	private ProductQnaDao dao = new ProductQnaDao();
	
	public List<Qna> selectProductQnaAll(int cPage, int numPerpage, String productName){
		Connection conn = getConnection();
		List<Qna> result = dao.selectProductQnaAll(conn, cPage, numPerpage, productName);
		close(conn);
		return result;
	}
	
	public int selectProductQnaAllCount(String productName) {
		Connection conn = getConnection();
		int result = dao.selectProductQnaAllCount(conn, productName);
		close(conn);
		return result;
	}
	
	public int productQnaInsert(String memberId,String qnaTitle,String qnaContent,String productName,int secret) {
		Connection conn =getConnection();
		int result = dao.productQnaInsert(conn, memberId,qnaTitle,qnaContent,productName,secret);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
		
	}
}

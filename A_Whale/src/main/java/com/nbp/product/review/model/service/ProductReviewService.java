package com.nbp.product.review.model.service;

import java.sql.Connection;
import java.util.List;

import com.nbp.product.review.model.DAO.ProductReviewDao;
import com.nbp.product.review.model.DTO.Review;
import static com.nbp.common.JDBCTemplate.*;


public class ProductReviewService {

	private ProductReviewDao dao = new ProductReviewDao(); 
	
	
	public List<Review> selectProductReviewAll(int cPage, int numPerpage, int productNo){
		Connection conn = getConnection();
		List<Review> result = dao.selectProductReviewAll(conn, cPage, numPerpage, productNo);
		close(conn);
		return result;
	}
	
	public int selectProductReviewAllCount(int productNo) {
		Connection conn = getConnection();
		int result = dao.selectProductReviewAllCount(conn,productNo);
		close(conn);
		return result;
	}
}

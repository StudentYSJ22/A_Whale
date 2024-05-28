package com.nbp.product.review.model.DAO;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOError;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static com.nbp.common.JDBCTemplate.*;
import com.nbp.product.review.model.DTO.Review;

public class ProductReviewDao {
	
	private Properties sql = new Properties();
	{
		String path = ProductReviewDao.class.getResource("/sql/product/review.properties").getPath();
		try(FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	
	public List<Review> selectProductReviewAll(Connection conn,int cPage, int numPerpage, int productNo){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<Review> result = new ArrayList<>();
		try {
		pstmt=conn.prepareStatement(sql.getProperty("selectProductReviewAll"));
		pstmt.setInt(1, productNo);
		pstmt.setInt(2, (cPage-1)*numPerpage+1);
		pstmt.setInt(3, cPage*numPerpage);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			result.add(getReview(rs));
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int selectProductReviewAllCount(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
		pstmt= conn.prepareStatement(sql.getProperty("selectProductReviewAllCount"));
		pstmt.setInt(1, productNo);
		rs=pstmt.executeQuery();
		if(rs.next()) result = rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
		
	}
	
	
	
	public static Review getReview(ResultSet rs) throws SQLException {
		return Review.builder()
				.reviewNo(rs.getInt("review_no"))
				.memberId(rs.getString("member_id"))
				.productNo(rs.getInt("product_no"))
				.reviewEnrollDate(rs.getDate("review_enroll_date"))
				.reviewUpdateDate(rs.getDate("review_update_date"))
				.reviewDeleteDate(rs.getDate("review_delete_date"))
				.reviewTitle(rs.getString("review_title"))
				.reviewContent(rs.getString("review_content"))
				.reviewRate(rs.getInt("review_rate"))
				.reviewDeleteYn(rs.getInt("review_delete_Yn"))
				.build();
	}
}

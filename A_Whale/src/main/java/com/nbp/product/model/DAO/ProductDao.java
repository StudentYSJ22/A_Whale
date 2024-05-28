package com.nbp.product.model.DAO;

import java.io.FileReader;	
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.nbp.common.JDBCTemplate.close;


import com.nbp.product.model.DTO.Product;

public class ProductDao {
	
	private Properties sql = new Properties();
	
	{
		String path = ProductDao.class.getResource("/sql/product/product.properties").getPath();
		try(FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	//상품 리스트에 상품전체 출력 >> 더보기 페이징 처리예정
	public List<Product> selectProductAll(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> result = new ArrayList<>();
		try {
		pstmt=conn.prepareStatement(sql.getProperty("selectProductAll"));
		pstmt.setInt(1, cPage);
		pstmt.setInt(2, numPerpage);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			result.add(getProduct(rs));
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int selectProductAllCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result =0;
		try {
		pstmt=conn.prepareStatement(sql.getProperty("selectProductAllCount"));
		rs=pstmt.executeQuery();
		if(rs.next()) result=rs.getInt(1);
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<Product> searchProduct(Connection conn, String title, String subTitle, int firstNo, int lastNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> result = new ArrayList<>();
		try {
			String sql=this.sql.getProperty("searchProduct");
			sql=sql.replace("#COL", title);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, subTitle);
			pstmt.setInt(2, firstNo);
			pstmt.setInt(3, lastNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getProduct(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public Product selectProductInfo(Connection conn, String title) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product result = null;
		try {
		pstmt = conn.prepareStatement(sql.getProperty("selectProductInfo"));
		pstmt.setString(1, title);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			result=getProduct(rs);
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
		
	}
	
	static public Product getProduct(ResultSet rs) throws SQLException {
		return Product.builder()
				.productNo(rs.getInt("product_no"))
				.productName(rs.getString("product_name"))
				.productSubname(rs.getString("product_subname"))
				.productDetail(rs.getString("product_detail"))
				.productPrice(rs.getInt("product_price"))
				.productStock(rs.getInt("product_stock"))
				.productAlcoholLv(rs.getInt("product_alcohol_lv"))
				.productOrigin(rs.getString("product_origin"))
				.productVolume(rs.getInt("product_volume"))
				.productAge(rs.getInt("product_age"))
				.productBrand(rs.getString("product_brand"))
				.productEnrollDate(rs.getDate("product_enroll_date"))
				.productDeleteYn(rs.getInt("product_delete_yn"))
				.memberId(rs.getString("member_id"))
				.productImg(rs.getString("product_img"))
				.categoryName(rs.getString("category_name"))
				.build();
	}
}

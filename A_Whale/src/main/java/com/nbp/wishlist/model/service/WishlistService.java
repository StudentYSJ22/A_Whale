package com.nbp.wishlist.model.service;


import static com.nbp.common.JDBCTemplate.close;
import static com.nbp.common.JDBCTemplate.commit;
import static com.nbp.common.JDBCTemplate.getConnection;
import static com.nbp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.nbp.shoppingbasket.model.dto.ShoppingBasketDto;
import com.nbp.wishlist.model.dao.WishlistDao;
import com.nbp.wishlist.model.dto.WishlistDto;


public class WishlistService {
	
	public List<WishlistDto> searchAllWish(String userId, int cPage, int numPerpage){
		Connection conn=getConnection();
		List<WishlistDto> list=new WishlistDao().searchAllWish(conn, userId, cPage, numPerpage);
		commit(conn);
		close(conn);
		return list;
		
		
	}
	
	public int selectWishCount(String userId) {
		Connection conn=getConnection();
		int result=new WishlistDao().selectWishCount(conn, userId);
		commit(conn);
		close(conn);
		return result;
		
	}
	
	public int deleteWish(int[] arr, String path) {
		Connection conn=getConnection();
		int result=new WishlistDao().deleteWish(conn, arr, path);
		if(result>0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
		
	}
	
	public int deleteWish2(int[] arr, String path) {
		Connection conn=getConnection();
		int result=new WishlistDao().deleteWish2(conn, arr, path);
		if(result>0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
		
	}
	
	
	
	public List<WishlistDto> selectWishAll(String userId){
		Connection conn=getConnection();
		List<WishlistDto> list=new WishlistDao().selectWishAll(conn, userId);
		commit(conn);
		close(conn);
		return list;
		
	}
	
	
	
	public int insertWish(WishlistDto wish) {
		Connection conn=getConnection();
		int result=new WishlistDao().insertWish(conn, wish);
		if(result>0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
	}
	
}

package com.nbp.notice.model.dto;

import java.sql.Date; 

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
//	private String filePath;
	private String noticeImgUrl;
	private Date noticeEnrollDate;
	private Date noticeUpdateDate;
	private Date noticeDeleteDate;
	private int noticeDeleteYn;
//	private String status;
	
}

package com.nbp.product.review.model.DTO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Qna {
	private String qnaId;
	private String memberId;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaEnrollDate;
	private Date qnaupdateDate;
	private Date qnadeleteDate;
	private int qnaDeleteYn;
	private int qnaSecretYn;
	private String productName;
	private String qnaAnswerContent;
	private Date qnaAnswerEnrollDate;
}

package com.nbp.model.DTO;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class Member {
	private String memberId;
	private int memberNo;
	private String memberNickname;
	private String memberGrade;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private String memberAdr;
	private String memberBirthDate;
	private int coupon;
	private LocalDate enrollDate;
}

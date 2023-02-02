package com.localtravel.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.localtravel.dto.EnjoyDto;

public interface EnjoyDao {
	
	@Select("SELECT * FROM ENJOY  "
			+ " WHERE ECODE = #{ecode}")
	EnjoyDto selectenjoyInfo(String ecode);

	@Select("SELECT * FROM REVIEWS RV"
			+ " INNER JOIN ENJOY EN ON RV.RVENCODE = EN.ECODE "
			+ " WHERE EN.ECODE = #{ecode}")
	ArrayList<Map<String, String>> selectReviewList(String ecode);



}
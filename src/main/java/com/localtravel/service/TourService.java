package com.localtravel.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.localtravel.dao.TourDao;
import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.FoodReviewDto;
import com.localtravel.dto.ReviewDto;


@Service
public class TourService {
	@Autowired
	private TourDao tourdao;

	public String reviewWrite_svc(ReviewDto review) {
		System.out.println("Toursevice - 놀거리관람평작성"); 
		int reviewResult = 0;
		try {
			reviewResult = tourdao.insertReviewWrite(review);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("관람평등록처리예외");
		}
		return reviewResult+"";
	}

	public String fdreviewWrite_svc(FoodReviewDto fdreview) {
		System.out.println("Toursevice - 먹거리관람평작성"); 
		int fdreviewResult = 0;
		try {
			fdreviewResult = tourdao.insertfdReviewWrite(fdreview);
			System.out.println("관람평작성성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("관람평등록처리예외");
		}
		return fdreviewResult+"";
	}

	public EnjoyDto enjoyInfo_svc(String encode) {
		System.out.println("Toursevice - 메인페이지 놀거리상세보기 ");
		EnjoyDto enjoyresult = tourdao.enjoyInfodao(encode);
		
		return enjoyresult;
	}

	public ArrayList<EnjoyDto> getSearchEnjoyList(String thcode) {
		ArrayList<EnjoyDto> eList = tourdao.getEnjoySelectList(thcode);
		System.out.println("eList : " + eList);
		return eList;
	}

}

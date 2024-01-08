package com.quiz.lesson07.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson07.repository.RecruitRepository;

@Service
public class RecruitBO {

	@Autowired
	private RecruitRepository recruitRepository; 
}

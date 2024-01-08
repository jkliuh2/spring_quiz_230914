package com.quiz.lesson07.bo;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson07.entity.CompanyEntity;
import com.quiz.lesson07.repository.CompanyRepository;

@Service
public class CompanyBO {
	
	@Autowired
	private CompanyRepository companyRepository;

	// input: 4가지 필드 / output: Entity(insert한 결과를 돌려준다)
	public CompanyEntity addCompany(
			String name, 
			String business, 
			String scale, 
			int headcount) {
		
		return companyRepository.save(CompanyEntity.builder()
				.name(name)
				.business(business)
				.scale(scale)
				.headcount(headcount)
				.build());
		// 아예 리턴 내부에 다 밀어넣었다.
		// build()로 마무리 짓는 순간 new 한다는 뜻.
		// new 하는 순간 필드들+날짜(자동) 전부 세팅되서 생성되는 것.
	}
	
	
	// update
	// input: id, scale, headcount
	public CompanyEntity updateCompanyScaleHeadcountById(
			int id, String scale, int headcount) {
		
		// id로 select
		CompanyEntity company = companyRepository.findById(id).orElse(null);
		
		if (company != null) { // null이 아니면
			// select해서 가져온 정보에서 scale, headcount 정보를 변경함.
			company = company.toBuilder() // 값만 변경하는 용도 -> Entity에 설정 추가해야한다
					.scale(scale)
					.headcount(headcount)
					.build();
			
			// 변경한 Entity를 통째로 save -> id가 존재한 save()이므로 update로 진행.
			company = companyRepository.save(company);
		}
		
		// update를 진행하고 돌아온 Entity를 리턴
		return company; // company or null
	}
	
	
	// Delete
	// input: id / output:X
	public void deleteCompanyById(int id) {
		Optional<CompanyEntity> companyOptional = companyRepository.findById(id); // optional 셀렉트
		companyOptional.ifPresent(c -> companyRepository.delete(c)); // c가 존재하면 delete
		// companyOptional이 c
	}
}

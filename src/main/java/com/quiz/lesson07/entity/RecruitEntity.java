package com.quiz.lesson07.entity;

import java.time.LocalDate;
import java.time.ZonedDateTime;

import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString // toString() 오버라이드 해주는 효과
@AllArgsConstructor
@NoArgsConstructor
@Builder // update안할거라서 toBuilder는 추가X
@Getter
@Table(name = "recruit")
@Entity
public class RecruitEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "companyId")
	private int companyId;
	
	private String position;
	
	private String responsibilities;
	
	private String qualification;
	
	private String type;
	
	private String region;
	
	private int salary;
	
	private LocalDate deadline; // 시분초 없음 + TimeZone 정보 없음(Local)
	
	@UpdateTimestamp // 값 넣을 때, input이 없어도 자동으로 NOW() 시간으로 들어가게 하는 것.
	@Column(name = "createdAt", updatable = false) // 업데이트 불가
	private ZonedDateTime createdAt;
	
	@UpdateTimestamp
	@Column(name = "updatedAt")
	private ZonedDateTime updatedAt; // UTC 시간 정보 같이 들어감
}

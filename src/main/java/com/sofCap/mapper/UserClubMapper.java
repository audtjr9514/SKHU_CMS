package com.sofCap.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.sofCap.dto.UserClubDto;

@Mapper
public interface UserClubMapper {

	UserClubDto findByUserId(int user_id);
	void insert(int user_id, int club_id);
	void delete(int user_id);
}

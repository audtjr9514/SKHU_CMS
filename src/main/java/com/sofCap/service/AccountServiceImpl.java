package com.sofCap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sofCap.Dao.AccountDao;
import com.sofCap.dto.AccountDto;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired AccountDao accountDao;
	
	@Override
	public List<AccountDto> findAll(){
		return accountDao.findAll();
	}

}

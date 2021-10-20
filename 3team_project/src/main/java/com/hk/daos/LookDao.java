package com.hk.daos;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hk.config.SqlMapConfig;
import com.hk.dtos.LookDto;

public class LookDao extends SqlMapConfig{
	private String namespace = "com.hk.look.";
	
	public LookDao() {
		
	}
	
	//세탁기 조회
	public List<LookDto> getWmList(){
		List<LookDto> list = new ArrayList<LookDto>();
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSessionFactory().openSession(true);
			list = sqlSession.selectList(namespace+"WmList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
	}
	//냉장고 조회
	public List<LookDto> getRmList(){
		List<LookDto> list = new ArrayList<LookDto>();
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSessionFactory().openSession(true);
			list = sqlSession.selectList(namespace+"RmList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
	}
	//티비 조회
	public List<LookDto> getTmList(){
		List<LookDto> list = new ArrayList<LookDto>();
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSessionFactory().openSession(true);
			list = sqlSession.selectList(namespace+"TmList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
	}
	//청소기 조회
	public List<LookDto> getVmList(){
		List<LookDto> list = new ArrayList<LookDto>();
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSessionFactory().openSession(true);
			list = sqlSession.selectList(namespace+"VmList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
	}
	//청소기 하나만 조회해오기
	public LookDto getVmOne(int a) {
		LookDto dto = new LookDto();
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSessionFactory().openSession(true);
			dto = sqlSession.selectOne(namespace+"getVmOne",a);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return dto;
	}
	
	
}

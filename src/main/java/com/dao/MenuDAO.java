package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;
import com.dto.MenuDTO;
@Repository
public class MenuDAO {
	@Autowired
	SqlSessionTemplate template;

	public List<String> menuList(String image) {
		List<String> list = template.selectList("MenuMapper.menuList", image);
		return list;
	}

	public List<MenuDTO> menuSearch(String search) {
		List<MenuDTO> list = template.selectList("MenuMapper.menuSearch", search);
		return list;
	}

	
	
	public MenuDTO selectedMenu(String food1) {
		MenuDTO dto = template.selectOne("MenuMapper.selectedMenu", food1);
		return dto;
	}

	public List<String> resRecommend(List<String> menuRecommend) {
		List<String> resRecommendList = template.selectList("MenuMapper.resRecommend", menuRecommend);
		return resRecommendList;
	}

	public String resRecommend(String menuName) {
		String resRecommend = template.selectOne("MenuMapper.resNameRecommend", menuName);
		return resRecommend;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	
//	public int menuAdd(SqlSession session, MenuDTO dto) {
//		 System.out.println(dto);
//		   int n = session.insert("MenuMapper.menuAdd", dto);
//		   return n;
//	}
//
//	public List<String> menuList(SqlSession session, String image) {
//		List<String> list = session.selectList("MenuMapper.menuList", image);		
//		System.out.println(list);
//		return list;
//	}
//
//	public MenuDTO selectedMenu(SqlSession session, String menu) {
//		   MenuDTO selection = session.selectOne("MenuMapper.selectedMenu", menu);
//		   System.out.println(selection);
//		   return selection;
//	}
//
//	public List<MenuDTO> menuSearch(SqlSession session, String search) {
//		List<MenuDTO> list = session.selectList("MenuMapper.menuSearch",search);
//		return list;
//	}
//	
//	public String getMenuImage(SqlSession session, String menuFinal) {
//		String menuImage = session.selectOne("MenuMapper.getMenuImage",menuFinal);
//		return menuImage;
//	}

}

package kr.ac.kopo.kopo23.service;

import java.util.List;

import kr.ac.kopo.kopo23.dao.RealEstatDAO;
import kr.ac.kopo.kopo23.dao.RealEstatDAOImpl;
import kr.ac.kopo.kopo23.domain.RealEstat;

public class RealEstatServiceImpl implements RealEstatService {
	private RealEstatDAO EstatDAO = new RealEstatDAOImpl();
	
	//public static String [] PackageList = {};  여기서 선택안한건 false
	
	
	@Override
	public RealEstat findAPTbyCode(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RealEstat> showAll() {
	
		return EstatDAO.showAll();
	}

	@Override
	public List<RealEstat> searchResults(String QueryTxt) {
		QueryTxt = "select * from Seoul_Apt where " + QueryTxt + " order by address;";

		return EstatDAO.searchResults(QueryTxt);
	}

	@Override
	public void add_reply(RealEstat estat) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete_reply(RealEstat estat) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<RealEstat> showReply(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String changeNull(String value) {
		String new_value = value;
		
		if (value.equals("-1")) {
			new_value = "없음";
		}
		
		return new_value;
	}

	@Override
	public String changeNull(int value) {
		String new_value = Integer.toString(value) +"m";
		
		if (value == -1) {
			new_value = "없음";
		}
		
		return new_value;
	}
	
	

}

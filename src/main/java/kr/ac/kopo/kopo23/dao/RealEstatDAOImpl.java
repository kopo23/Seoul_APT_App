package kr.ac.kopo.kopo23.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.kopo23.domain.RealEstat;

public class RealEstatDAOImpl implements RealEstatDAO {
	public RealEstat realEstat;
	public List<RealEstat> EstatList;
	
	@Override
	public RealEstat findAPTbyCode(int id) {
		//코드로 아파트 찾기
		return null;
	}

	@Override
	public List<RealEstat> showAll() {
		EstatList = new ArrayList<RealEstat>();
		realEstat = new RealEstat();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.87:3306/kopoctc", "root", "kopoctc");
			Statement stmt = conn.createStatement();
			String QueryTxt;
			QueryTxt = String.format("select * from Seoul_Apt;");
			ResultSet rset = stmt.executeQuery(QueryTxt);

			while (rset.next()) {
				
				realEstat = new RealEstat(); // 객체선언해줘야한다.. 매번 why?..
				realEstat.setId(rset.getInt(1));
				realEstat.setName(rset.getString(2));
				realEstat.setAddress(rset.getString(3));
				realEstat.setCost(rset.getString(4));
				realEstat.setSeadae(rset.getString(5));
				realEstat.setParking(rset.getString(6));
				realEstat.setAllowdate(rset.getString(7));
				realEstat.setD_bus(rset.getInt(8));
				realEstat.setD_subway(rset.getInt(9));
				realEstat.setD_daycarecenter(rset.getInt(10));
				realEstat.setD_kindergarten(rset.getInt(11));
				realEstat.setD_school(rset.getInt(12));
				realEstat.setD_parkinglot(rset.getInt(13));
				realEstat.setD_mart(rset.getInt(14));
				realEstat.setD_convinientstore(rset.getInt(15));
				realEstat.setD_drycleaner(rset.getInt(16));
				realEstat.setD_bank(rset.getInt(17));
				EstatList.add(realEstat);

			}

			rset.close();
			stmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("error" + e);
		}

		return EstatList;
	}

	@Override
	public List<RealEstat> searchResults(String QueryTxt) {
		//검색결과
		EstatList = new ArrayList<RealEstat>();
		realEstat = new RealEstat();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.87:3306/kopoctc", "root", "kopoctc");
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery(QueryTxt);

			while (rset.next()) {
				
				realEstat = new RealEstat(); // 객체선언해줘야한다.. 매번 why?..
				realEstat.setId(rset.getInt(1));
				realEstat.setName(rset.getString(2));
				realEstat.setAddress(rset.getString(3));
				realEstat.setCost(rset.getString(4));
				realEstat.setSeadae(rset.getString(5));
				realEstat.setParking(rset.getString(6));
				realEstat.setAllowdate(rset.getString(7));
				if (QueryTxt.contains("bus")) realEstat.setD_bus(rset.getInt(8));
				
				if (QueryTxt.contains("subway")) realEstat.setD_subway(rset.getInt(9));
				
				if (QueryTxt.contains("daycarecenter")) realEstat.setD_daycarecenter(rset.getInt(10));
				
				if (QueryTxt.contains("kindergarten")) realEstat.setD_kindergarten(rset.getInt(11));
				
				if (QueryTxt.contains("school")) realEstat.setD_school(rset.getInt(12));
				
				if (QueryTxt.contains("parkinglot")) realEstat.setD_parkinglot(rset.getInt(13));
				
				if (QueryTxt.contains("mart")) realEstat.setD_mart(rset.getInt(14));
				
				if (QueryTxt.contains("convinientstore")) realEstat.setD_convinientstore(rset.getInt(15));
				
				if (QueryTxt.contains("drycleaner")) realEstat.setD_drycleaner(rset.getInt(16));
				
				if (QueryTxt.contains("bank")) realEstat.setD_bank(rset.getInt(17));
				EstatList.add(realEstat);

			}

			rset.close();
			stmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("error" + e);
		}

		return EstatList;
	}

	@Override
	public void add_reply(RealEstat estat) {
		//후기남기기

	}

	@Override
	public void delete_reply(RealEstat estat) {
		//후기 지우기

	}

	@Override
	public List<RealEstat> showReply(int id) {
		//후기 보여주기
		return null;
	}

}

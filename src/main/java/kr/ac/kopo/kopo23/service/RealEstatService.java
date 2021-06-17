package kr.ac.kopo.kopo23.service;

import java.util.List;

import kr.ac.kopo.kopo23.domain.RealEstat;

public interface RealEstatService {
	RealEstat findAPTbyCode(int id); //�ڵ�ξ���Ʈã��
	List<RealEstat> showAll(); //��ü �����ֱ�
	List<RealEstat> searchResults(String QueryTxt); //�˻����
	void add_reply (RealEstat estat); //�ı�
	void delete_reply (RealEstat estat); //�ı������
	List<RealEstat> showReply(int id); //�ı⺸���ֱ�
	String changeNull (String value);
	String changeNull (int value);
	
	
}

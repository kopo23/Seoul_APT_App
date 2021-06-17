<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.kopo23.domain.*"%>
<%@ page import="kr.ac.kopo.kopo23.service.*"%>
<%@ page import="java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<%
String Apt_name = "";
String Apt_address = "";
if (request.getParameter("Apt_name") != null ) {
	Apt_name = request.getParameter("Apt_name");
}

if (request.getParameter("district") != null) {
	Apt_address = request.getParameter("district");
}

String [] sisul = {};
String [] sisul_title = {"bus","subway","daycarecenter","kindergarten","school","parkinglot","mart","convinientstore","drycleaner","bank"};
String QueryTxt = "name like '%" +Apt_name+ "%' and address like '%" +Apt_address+"%'";
ArrayList <String> valid_sisul = new ArrayList<String>();
RealEstatService estatService = new RealEstatServiceImpl();
try {
	if (request.getParameterValues("sisul") != null) {
		sisul = request.getParameterValues("sisul");
		for (int i = 0; i < sisul.length; i++) {
			if (sisul[i].equals("0")) { //기본값인 0으로 받아온건
				sisul[i] = "-1"; // -1값으로 준다
			} 
			
			if (!(sisul[i].equals("-1")) && sisul[i] != null) { // 그래서 -1 이 아닌 놈만 쿼리줘서 실행
				QueryTxt += " and " + sisul_title[i] + " >= 0 and " + sisul_title[i] + " <= " + sisul[i];
				valid_sisul.add(sisul_title[i]);
			}
		}
		
}
%>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>검색결과</div>
	<%
	out.print("총 결과 :"+estatService.searchResults(QueryTxt).size()+" 개");
	int size = 10;
	if (estatService.searchResults(QueryTxt).size() < 10) size = estatService.searchResults(QueryTxt).size();
	
	for (int i = 0; i < size; i++) {
	  %>
		<div>번호 : <%=(i+1)%></div>
	    <div>이름 : <%=estatService.searchResults(QueryTxt).get(i).getName() %></div>
	    <div>주소 : <%=estatService.searchResults(QueryTxt).get(i).getAddress() %></div>
	    <div>최근 실거래가 : <%=estatService.changeNull(estatService.searchResults(QueryTxt).get(i).getCost()) %></div>
	    <%
	    for (int j = 0; j < valid_sisul.size(); j++ ){
	    		switch (valid_sisul.get(j)) {
	    			case "bus": 
	    				out.print("<div>버스 : "+estatService.changeNull(estatService.searchResults(QueryTxt).get(i).getD_bus())+"</di>");
	    				break;
	    			case "subway": 
	    				out.print("<div>지하철 : "+estatService.changeNull(estatService.searchResults(QueryTxt).get(i).getD_subway())+"</di>");
	    				break;
	    			case "daycarecenter": 
	    				out.print("<div>어린이집 : "+estatService.changeNull(estatService.searchResults(QueryTxt).get(i).getD_daycarecenter())+"</di>");
	    				break;
	    			case "kindergarten": 
	    				out.print("<div>유치원 : "+estatService.changeNull(estatService.searchResults(QueryTxt).get(i).getD_kindergarten())+"</di>");
	    				break;
	    			case "school": 
	    				out.print("<div>학교 : "+estatService.changeNull(estatService.searchResults(QueryTxt).get(i).getD_school())+"</di>");
	    				break;
	    			case "parkinglot": 
	    				out.print("<div>주차장 : "+estatService.changeNull(estatService.searchResults(QueryTxt).get(i).getParking())+"</di>");
	    				break;
	    			case "mart": 
	    				out.print("<div>마트 : "+estatService.changeNull(estatService.searchResults(QueryTxt).get(i).getD_mart())+"</di>");
	    				break;
	    			case "convinientstore": 
	    				out.print("<div>편의점 : "+estatService.changeNull(estatService.searchResults(QueryTxt).get(i).getD_convinientstore())+"</di>");
	    				break;
	    			case "drycleaner": 
	    				out.print("<div>세탁소 : "+estatService.changeNull(estatService.searchResults(QueryTxt).get(i).getD_drycleaner())+"</di>");
	    				break;
	    			case "bank": 
	    				out.print("<div>은행 : "+estatService.changeNull(estatService.searchResults(QueryTxt).get(i).getD_bank())+"</di>");
	    				break;
	    		}
	    }
	}

}catch (Exception e) {
	out.print(e);
}
%>
</body>
</html>
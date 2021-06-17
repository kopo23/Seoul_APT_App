<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.kopo23.domain.*"%>
<%@ page import="kr.ac.kopo.kopo23.service.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아파트 검색</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<form method="post" action ="App_select_p.jsp">
		<div id ="app">
			<input type="text" placeholder ="아파트 이름" name = "Apt_name">
			<p v-on:click ="if (isShow == true){isShow = false} else {isShow = true}">필터</p>
			<div id = container v-if ="isShow">
				<select name = "district" id ="address">
					<option value ="" selected>지역을 선택하세요. </option>
					<option v-for = "item in Gus"  v-bind:value="item">
					{{ item }}
					</option>
				</select>
				<div  v-for = "item in sisuls">
					{{ item }} : <input type ="number" name = sisul value = "0"> (m) 이내
				</div>
				
			</div>
		<input type="submit" value="검색">
		</div>
	</form>
		
	<div> 오늘의 추천 집!
	<%
	   RealEstatService estatService = new RealEstatServiceImpl();
	   request.getParameterValues("");
	   for (int i = 0; i < 10; i ++) {
		   int rand_num = (int) (Math.random()*12023);
		   %>
		   <div>이름 : <%=estatService.showAll().get(rand_num).getName() %></div>
		   <div>주소 : <%=estatService.showAll().get(rand_num).getAddress() %></div>
		 	 <div>최근 실거래가 : <%=estatService.changeNull(estatService.showAll().get(rand_num).getCost()) %></div>
		    <%
	   }
	   %>
	</div>
	<!-- 여기서 값을 받아서 p로넘겨주고, p에서는 그걸로 query문 만들어서 service로 넘겨주자. -->
	
<script>
	new Vue({
	    el: '#app',
	    data: {
	    	sisuls : [" 버스 "," 지하철","어린이집"," 유치원"," 학교 "," 주차장"," 마트 "," 편의점"," 세탁소"," 은행"],
			Gus : ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문","동작구","마포구","서대문","서초구","성동구","성북구","송파구","양천구","영등포","용산구","은평구","종로구"],
			isShow : false
	    }
	});
</script>
</body>
</html>
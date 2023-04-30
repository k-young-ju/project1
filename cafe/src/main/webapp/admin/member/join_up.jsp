<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header2.jsp"%>

<%
String sql1 = "select * from member where id = '"+session_id+"'";

Connection con1 = DriverManager.getConnection(url, user, password);
Statement stmt1 = con1.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);

String mem_id = "";
String mem_pass = "";
String mem_name = "";

String gender = "";

String mem_email1 = "";
String mem_email2 = "";


String z = "";
String z1 = "";
String z2 = "";
String z3 = "";
String z4 = "";

String p1 = "";
String p2 = "";
String p3 = "";

while(rs1.next()){
	mem_id = rs1.getString("id");
	mem_pass = rs1.getString("password");
	mem_name = rs1.getString("name");
	
	gender =rs1.getString("gender");
	
	
	mem_email1 = rs1.getString("email1");
	mem_email2 = rs1.getString("email2");
	
	z=rs1.getString("zipcode");
	z1=rs1.getString("zipcode1");
	z2=rs1.getString("zipcode2");
	z3=rs1.getString("zipcode3");
	z4=rs1.getString("zipcode4");
	
	p1 =rs1.getString("phone1");
	p2 =rs1.getString("phone2");
	p3 =rs1.getString("phone3");
	
}

%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정 페이지</title>
<style>
	body{
	background-color:#EEDE4D;
	}
			
	input,select{
		width:98%;
		height:30px;
		padding:0px;
	}
	.title_font{
		text-align:center;
		font-family: 'aggro';
		font-size: 35px;
		font-weight: bold;
	}
	.subject_font{
		font-family: 'choice';
		font-size:20px;
		width:100%
	}
	
</style>
<script>
	function join_ok(){
		if(pass2.value != pass1.value){
			alert("비밀번호가 일치하지 않습니다.");
			pass2.focus();
			self.close();
			return false;
		}
		if(m_id.value ==""){
 			alert("아이디를 입력하세요.");
 			m_id.focus();
 			return false;
 		}
 		if(pass1.value ==""){
 			alert("비밀번호를 입력하세요.");
 			pass1.focus();
 			return false;
 	 	}
  		if(name1.value ==""){
  			alert("이름을 입력하세요.");
  			name1.focus();
  			return false;
  	 	 }
	 		
		
				
	} 
	function id_check(id){
		window.open("id_check.jsp?id="+id,"a","width=300,height=200");
	}
	
</script>

</head>
<body>
<form name ="join" action ="update.jsp" method="post" onsubmit ="return join_ok()">
<center>
<table>
	<tr>
		<td height=15></td>
	</tr>
	<tr>
		<td class="title_font">회원정보수정</td>
	</tr>
</table>
<table border=0 >
	<tr>
		<td>
		<center>
		
		<table border=0 width=500 >
			<tr>
				<td colspan="2" class="subject_font"><b>아이디</b><input type="hidden" id="id_check2" name="id_check2" value="n"></td><br>
			</tr>
			<tr>
				<td width=350>
				<input id="m_id" name="m_id" value="<%=mem_id %>" readonly style="background-color: #EFEFEF;border:0px">
		 		</td>
		 		
		 		</td>
			</tr>
		</table>
		<p></p>
		<table width=500>	
			<tr>
				<td class="subject_font"><b>비밀번호</b></td>
			</tr>
			<tr>
				<td ><input id="pass1" name="pass1" value="<%=mem_pass%>"></td>
			</tr>	
		</table>
		<p></p>
		<table width=500>	
			<tr>
				<td class="subject_font" ><b>비밀번호 재확인</b></td>
			</tr>
			<tr>
				<td ><input id="pass2" name="pass2" value="<%=mem_pass%>"></td>
			</tr>
		</table>
		<p></p>
		<table width=500>
			<tr>
				<td class="subject_font"><b>이름</b></td>
			</tr>
			<tr>
				<td ><input id="name1" name="name1" value="<%=mem_name %>" readonly style="background-color: #EFEFEF;border:0px"></td>
			</tr>
		</table>
		<p></p>
		<table width=500>	
			<tr>
				<td class="subject_font"><b>성별</b></td>
			</tr>
			<tr>
				<td width=100% >
				<%if(gender.equals("M")){ %>
					<input id ="gender" name = "gender" value="남자" readonly style="background-color: #EFEFEF;border:0px">
				<%}else{ %>
					<input id ="gender" name = "gender" value="여자" readonly style="background-color: #EFEFEF;border:0px">
				<%} %>	
				</td>
			</tr>
		</table>
		<p></p>
		<table width=500>	
			<tr>
				<td colspan="4" class="subject_font"><b>이메일</b></td>
			</tr>
			<tr>
				<td style="width:30%"><input id="email1" name="email1" style="border:0px" value="<%=mem_email1 %>"></td>
				<td>@</td>
				<td ><input id= "email2" name ="email2" style="border:0px" value="<%=mem_email2 %>">
		 		</td>
		 		<td>    
		 		    <select id="domain" onchange="email2.value=this.value" >
		 		    	<option value = "">==직접입력==</option>
		 		    	<option value = "naver.com">naver.com</option>
		 		    	<option value = "gmail.com">gmail.com</option>
		 		    	<option value = "nate.com">nate.com</option>
		 		    </select>
		 	    </td>
			</tr>
		</table>
		<p></p>
		<table width=500 border = 0>
			<tr>
		 	    <td class="subject_font"><b>주소</b></td>
		 	</tr>
		 	<tr> 
		 		 
		 		<td>
		 			<input type="text" id="sample4_postcode" name="zipcode" placeholder="우편번호" style="height:30px;width:230px" value="<%=z %>">
		            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="height:30px;;width:230px">
		 		</td>
		 	</tr>
		 	<tr>
		 	    <td>
		 			<input type="text" id="sample4_roadAddress" name="zipcode1" placeholder="도로명주소" style="height:30px;;width:230px" value="<%=z1 %>">
					<input type="text" id="sample4_jibunAddress" name="zipcode2" placeholder="지번주소" style="height:30px;;width:230px" value="<%=z2%>">
					<span id="guide" style="color:#999;display:none"></span>
		 		</td>
		 	</tr>
		 	<tr>
		 	   	<td>
		 			<input type="text" id="sample4_detailAddress" name="zipcode3" placeholder="상세주소" style="height:30px;;width:230px" value="<%=z3 %>">
					<input type="text" id="sample4_extraAddress" name="zipcode4" placeholder="참고항목" style="height:30px;;width:230px" value="<%=z4 %>">
		 		</td>
		 	</tr>
		</table>
		<p></p>
		<table border=0 width=500>
			<tr>
				<td colspan="5" width=500 class="subject_font"><b>전화번호</b></td>
			</tr>
			<tr>
				<td ><input id="phone1" name="phone1" value="<%=p1 %>"></td>
				<td>-&nbsp; </td>
				<td ><input id="phone2" name="phone2" value="<%=p2 %>"></td>
				<td>-&nbsp; </td>
				<td ><input id="phone3" name="phone3" value="<%=p3 %>"></td>
			</tr>
		</table>
		<p></p>
		<table width=500>
			<tr>
				<td width=100% align="center" ><button style="width:100%;height:35px;background-color: white;color:black;font-size:20px" class="subject_font">수정하기</button></td>
			</tr>
		</table>
		</center>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td height=15></td>
	</tr>
</table>		
				
</form>

</body>
</html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<%@ include file = "/admin/include/footer.jsp" %>

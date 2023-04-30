<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/include/header2.jsp" %>
    
    <%
    Date today = new Date();

	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
	String signdate = sd.format(today);
	
	//out.print(signdate);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<style>
	body{
	background-color: #E89D96;
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
  		if(gender.value == ""){
  			alert("성별을 입력하세요");
  			return false;
  		}
	 		
		
		result = confirm("아이디 : "+m_id.value+"\n이름 :"+name1.value+"\n이메일 :"+email1.value+"@"+email2.value+"\n휴대폰 :"+phone1.value+"-"+phone2.value+"-"+phone3.value+"\n맞습니까?");
		if(result == true){
			document.join.submit();
			window.close();
		}else{
			return false;
		}
		
	} 
	function id_check(id){
		window.open("id_check.jsp?id="+id,"a","width=300,height=200");
		
	}
	
</script>

</head>
<body>
<form name ="join" action ="insert.jsp" method="post" onsubmit ="return join_ok()">
<center>
<table>
	<tr>
		<td height=15></td>
	</tr>
	<tr>
		<td class="title_font">회원가입</td>
	</tr>
</table>
<table border=0 >
	<tr>
		<td><input type="hidden" id = "signdate" name="signdate" value="<%=signdate%>"></td>
	</tr>
	<tr>
		<td>
										
			<table border=0 width=500 >
				<tr>
					<td colspan="2" class="subject_font"><b>아이디</b>&nbsp;(영문,숫자조합으로만 입력가능합니다.)<input type="hidden" id="id_check2" name="id_check2" value="n"></td><br>
				</tr>
				<tr>
					<td width=350>
					<input type ="text" pattern="[A-Za-z0-9]+" style="input:invalid" id="m_id" name="m_id"  maxlength="12">
			 		</td>
			 		<td><input type= "button" value ="아이디 중복체크"  onclick="id_check(m_id.value)" >
			 		</td>
				</tr>
			</table>
			<p></p>
			<table width=500>	
				<tr>
					<td class="subject_font"><b>비밀번호</b></td>
				</tr>
				<tr>
					<td ><input type="password" id="pass1" name="pass1" maxlength="13"></td>
				</tr>	
			</table>
			<p></p>
			<table width=500>	
				<tr>
					<td><b class="subject_font">비밀번호 재확인</b></td>
				</tr>
				<tr>
					<td ><input id="pass2" name="pass2" type="password" maxlength="20"></td>
				</tr>
			</table>
			<p></p>
			<table width=500>
				<tr>
					<td><b class="subject_font" >이름</b></td>
				</tr>
				<tr>
					<td ><input id="name1" name="name1" maxlength="20"></td>
				</tr>
			</table>
			<p></p>
			<table border=0 width=500>	
				<tr>
					<td colspan="5" class="subject_font"><b>생년월일</b></td>
				</tr>
				<tr>
					<td width=32% ><input placeholder ="년(4자)" style="width:95%;border:0px" id= "birthday1" name= "birthday1" ></td>
					<td></td>
					<td width=32%>
						<select id= "birthday2" name= "birthday2" onchange = "birthday2.value = this.value">
							<option value ="">선택</option>
							<option value ="1">1월</option>
							<option value ="2">2월</option>
							<option value ="3">3월</option>
							<option value ="4">4월</option>
							<option value ="5">5월</option>
							<option value ="6">6월</option>
							<option value ="7">7월</option>
							<option value ="8">8월</option>
							<option value ="9">9월</option>
							<option value ="10">10월</option>
							<option value ="11">11월</option>
							<option value ="12">12월</option>
						</select>
					</td>
					<td></td>
					<td width=32% ><input width=95% placeholder ="일" style="border:0px" id= "birthday3" name= "birthday3" ></td>
				</tr>
			</table>
			<p></p>
			<table width=500>	
				<tr>
					<td class="subject_font"><b>성별</b></td>
				</tr>
				<tr>
					<td width=100% >
						<select style="border:0px" id="gender" name= "gender">
							<option value ="">성별</option>
							<option value ="M">남자</option>
							<option value ="F">여자</option>
						</select>
					</td>
				</tr>
			</table>
			<p></p>
			<table width=500>	
				<tr>
					<td colspan="4" class="subject_font"><b>이메일</b></td>
				</tr>
				<tr>
					<td style="width:30%"><input id="email1" name="email1" style="border:0px" maxlength="20"></td>
					<td>@</td>
					<td ><input id= "email2" name ="email2" style="border:0px" maxlength="20">
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
			 			<input type="text" id="sample4_postcode" name="zipcode" placeholder="우편번호" style="height:30px;width:230px">
			            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="height:30px;;width:230px">
			 		</td>
			 	</tr>
			 	<tr>
			 	    <td>
			 			<input type="text" id="sample4_roadAddress" name="zipcode1" placeholder="도로명주소" style="height:30px;;width:230px">
						<input type="text" id="sample4_jibunAddress" name="zipcode2" placeholder="지번주소" style="height:30px;;width:230px">
						<span id="guide" style="color:#999;display:none"></span>
			 		</td>
			 	</tr>
			 	<tr>
			 	   	<td>
			 			<input type="text" id="sample4_detailAddress" name="zipcode3" placeholder="상세주소" style="height:30px;;width:230px">
						<input type="text" id="sample4_extraAddress" name="zipcode4" placeholder="참고항목" style="height:30px;;width:230px">
			 		</td>
			 	</tr>
			</table>
			<p></p>
			<table border=0 width=500>
				<tr>
					<td colspan="5" width=500 class="subject_font"><b>전화번호</b></td>
				</tr>
				<tr>
					<td ><input id="phone1" name="phone1" maxlength="4"></td>
					<td>-&nbsp; </td>
					<td ><input id="phone2" name="phone2" maxlength="4"></td>
					<td>-&nbsp; </td>
					<td ><input id="phone3" name="phone3" maxlength="4"></td>
				</tr>
			</table>
			<p></p>
			<table width=500>
				<tr>
					<td width=100% align="center"><button style="width:100%;height:35px;background-color: white;color:black;font-size:20px" class="subject_font">가입하기</button></td>
				</tr>
			</table>
			
		</td>
	</tr>
</table>
<table>
	<tr>
		<td height=20></td>
	</tr>
</table>		
		
</center>		
				
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

<%@ include file = "/include/footer2.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest04.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<style type="text/css">
	#result
	{
		display: inline-block;
		width: 250px;
		color: #F33;
		font-size: small;
	}
</style>

<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>
<script type="text/javascript">

	function check()
	{
		// 확인
		//alert("함수 호출~!!!");
		
		// 데이터 수집
		var id = document.getElementById("id").value;
		
		// URL 준비
		var url = "test03.do?id=" +id;
		
		// AJAX 객체(→ XMLHttpRequest 객체) 생성
		ajax = createAjax();
		
		//환경 설정(『open("요청방식", "URL", 비동기/동기)』)
		ajax.open("GET",url,true);
		
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState==4 && ajax.status==200)
			{
				//업무 처리 (모듈화 → 외부로 추출)
				callBack();
			}
		};
		ajax.send("");
	}
	
	function callBack()
	{
	
		var data = ajax.responseText;
		
		data = parseInt(data);
		
		if (data==0)
		{
			document.getElementById("result").innerText = "사용 가능한 아이디입니다.";
		}
		else
		{
			document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";
		}
	}
	
	function search()
	{
		// 확인
		//alert("함수 호출~!!!");
		
		// 데이터 수집
		var addr = document.getElementById("addr").value;
		
		// URL 준비
		var url = "test04.do?addr=" + addr;
		
		// AJAX 객체(→ XMLHttpRequest 객체) 생성
		ajax = createAjax();
		
		// 설정
		ajax.open("GET", url, true);
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState==4 && ajax.status==200)
			{
				// 업무 수행
				callBack2();
			}
		};
		
		ajax.send("");
		
	}
	
	//추출된 수행 업무
	// → 우편번호 검색 결과를 통보받아
	//    사용자에게 안내해 줄 수 있도록 처리
	function callBack2()
	{
		//var data = ajax.responseText;
		
		// XML 문서 전체의 참조 객체. (흔히... XML 문서 객체라고 한다.)
		var doc = ajax.responseXML;
		
		// XML 문서의 최상위 엘리먼트(루트 엘리먼트)
		//-- 현재는... 『<lists></lists>』 엘리먼트
		var root = doc.documentElement;
		
		// 모든 『<item></item>』 엘리먼트 반환받기
		var itemList = root.getElementsByTagName("item");
		
		// select box 초기화
		document.getElementById("addrResult").innerHTML = "";
		
		// 검색 결과 확인
		if(itemList.length==0)
		{
			document.getElementById("addrResult").innerHTML
				= "<option>주소를 입력하세요.</option>";
		}
		else
		{
			document.getElementById("addrResult").innerHTML
				= "<option>주소를 선택하세요.</option>";
		}
	}

</script>
</head>
<body>

<div>
	<h1>회원 가입</h1>
	<p>우편번호 검색</p>
	<hr />
</div>

<table class="table">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="txt control" />
			<input type="button" value="중복검사" class="txt control" onclick="check()">
			<span id="result"></span>
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td>
			<input type="text" id="name" class="txt control" />
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>
			<input type="text" id="addr" class="txt control" />
			<input type="button" value="검색하기" class="btn control" onclick="search()">
			<br>
			<select id="addrResult" class="control">
				<option>주소를 입력하세요</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<th>주소 검색 결과</th>
		<td>
			<input type="text" id="addr1" class="txt control" readonly="readonly"
			style="width: 200px;"/>
			<br>
			<input type="text" id="addr2" class="txt control" readonly="readonly"
			style="width: 400px;"/>
			<br>
			<input type="text" id="addr3" class="txt control" placeholder="상세주소를 입력하세요."
			style="width: 400px;"/>
			<br>
		</td>
	</tr>
</table>

</body>
</html>


/*=========================
 	ServletSample.java
 	- Servlet 관련 실습
 ========================*/

// HttpServlet 을 상속받는 클래스로 설계 -> Servlet

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// HttpServlet 은 추상클래스이지만 추상메소드가 없다
public class Test05 extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	// 서블릿 컨테이너가 이 메소드들을 호출해서 사용하는데 
	// get 과 post 두 방식 중에서 get 방식이라고 하면 서블릿 컨테이너는 doGet 메소드를 호출한다.
	// post 방식이라고 지정하면 doPost 메소드를 호출한다.
	// 하지만 실제 이 방식으로 코딩을 하게 되면 개발자의 입장에서 코딩을 이중으로 해야 하는 문제가 생긴다
	// 그 때문에 사용자 정의 메소드를 만들어 어떤 방식이든 사용자 정의 메소드가 호출되도록 하면 편리하다
	
	// 우리가 보이지 않는 영역에서 클라이언트와 서버는 뭔가를 주고 받는다.
	
	// 사용자의 http 프로토콜 요청이 Get 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	// 사용자의 http 프로토콜 요청이 Post 방식일 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// Get 방식이든 Post 방식이든
		// 어던 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		// ※ 완성형 한글 형태로 전송된 데이터 수신
		
		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지(AjaxTest05.jsp)로부터 넘어온 데이터 수신
		// -> search
		String search = request.getParameter("search");
		
		// 테스트
		//System.out.println(search);
		
		// DB 연결 및 액션 처리
		// ..... WHERE COLUMNNAME LIKE 'search%'; 와 같은 쿼리문 수행
		// 그에 따른 결과 수신
		
		// 위에서 처리한 결과를 가지고 있는 자료구조 활용
		ArrayList<WordDTO> lists = new ArrayList<WordDTO>();
		
		if(search.equals("가"))
		{
			lists.add(new WordDTO("가습기"));
			lists.add(new WordDTO("가요대전"));
			lists.add(new WordDTO("가방"));
			lists.add(new WordDTO("가다랑어"));
			lists.add(new WordDTO("가위"));
			lists.add(new WordDTO("가죽"));
			lists.add(new WordDTO("가족"));
			lists.add(new WordDTO("가지"));
			lists.add(new WordDTO("가평"));
		}
		else if(search.equals("가습"))
		{
			lists.add(new WordDTO("가습기 손질"));
			lists.add(new WordDTO("가습기 구매"));
			lists.add(new WordDTO("가습기 분해"));
			lists.add(new WordDTO("가습기 교체"));
			lists.add(new WordDTO("가습기 살균제"));
			lists.add(new WordDTO("가습기 고장"));
		}
		else if(search.equals("가방"))
		{
			lists.add(new WordDTO("가방 손질"));
			lists.add(new WordDTO("가방 구매"));
			lists.add(new WordDTO("가방 분해"));
			lists.add(new WordDTO("가방 교체"));
			lists.add(new WordDTO("가방 수리"));
			lists.add(new WordDTO("가방끈"));
			lists.add(new WordDTO("가방나눔"));
		}
		else if(search.equals("가방끈"))
		{
			lists.add(new WordDTO("가방끈 매듭"));
			lists.add(new WordDTO("가방끈 매듭 묶기"));
			lists.add(new WordDTO("가방끈 매듭 푸는 법"));
			lists.add(new WordDTO("가방끈 길이 조절"));
			lists.add(new WordDTO("가방끈 교체"));
			lists.add(new WordDTO("가방끈 색상"));
		}
		
		request.setAttribute("lists", lists);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/Test05_ok.jsp");
		//RequestDispatcher dispatcher = request.getRequestDispatcher("Test05_ok.jsp");
		dispatcher.forward(request, response);
	}
	
}







































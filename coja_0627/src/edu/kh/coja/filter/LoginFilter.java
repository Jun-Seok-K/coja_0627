package edu.kh.coja.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 회원 전용 서비스에 비로그인 상태로 요청이 올 경우 메인페이지로 돌려보내는 필터
// 로그인 여부 확인방법 : session에 loginMember의 존재 여부로 확인 가능...
@WebFilter(filterName = "loginFilter", urlPatterns = {"/member/myPage", "/member/update", "/member/pwUpdate" , "/member/foundPw"})
public class LoginFilter implements Filter {

   public void destroy() {
      
   }

   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
      
      // 회원 전용 서비스 요청이 왔을 때
      // Session에 loginMember가 있는지 확인하여
      // 없으면 메인페이지로 돌려보내기
      
      // 1. Session을 얻어오기 위한 request 다운 캐스팅
      HttpServletRequest req = (HttpServletRequest)request;
      
      // 2. Session 얻어오기
      // HttpSession session = request.getSession(); // (X) 
      HttpSession session = req.getSession(); // (O)
      
      // 3. Session에서 loginMember를 얻어와 null인지 확인
      if( session.getAttribute("loginMember") == null ) {
         
         session.setAttribute("icon", "warning"); // 원레는 이곳에 swal 안씀...(단순 확인용)
         session.setAttribute("title", "로그인 후 이용해주세요."); // 원레는 이곳에 swal 안씀...(단순 확인용)
         
         
         // 4. null == 로그인 X --> 메인페이지로 강제 이동(by redirect...)
         // == 메인페이지 재요청
         ( (HttpServletResponse)response ).sendRedirect(req.getContextPath());
                  
      }else {
         
         // 5. 로그인이 된 상태 -> 정상 수행
         chain.doFilter(request, response);         
      }
      
   }

   public void init(FilterConfig fConfig) throws ServletException {
   
   }

}
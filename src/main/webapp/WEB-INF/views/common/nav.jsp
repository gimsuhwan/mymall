<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>






<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top " >
 
  <div class="collapse navbar-collapse" id="navbarsExampleDefault">
    
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <!-- 인증 전 표시 -->
      <c:if test="${sessionScope.loginStatus == null }">
      <li class="nav-item">
        <a class="nav-link" href="/member/login">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/member/join">Register</a>
      </li>
      </c:if>
       <!-- 인증 후 표시 -->
      <c:if test="${sessionScope.loginStatus != null }">
      
      <li class="nav-item">
        <a class="nav-link" href="/member/logout">LogOut</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/cart/cart_list">CartList</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="/member/mypage">MyPage</a>
      </li>
      </c:if>

  </div>
  

</nav> 






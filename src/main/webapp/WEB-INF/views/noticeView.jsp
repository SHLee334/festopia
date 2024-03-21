<%@page import="com.semi.festopia.model.vo.NoticeBoard"%> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib
prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <style>
    .write-container {
      display: flex;
      flex-direction: column;
    }
    .write-group {
      border-top: 1px solid grey;
      /* background-color: red; */
      width: 75%;
    }
    .write-control {
      /* background-color: red; */
      width: 100%;
      margin-top: 10px;
      margin-bottom: 10px;
    }
    #top-title {
      border-top: 3px solid;
    }
    #main-notice {
      font-size: 2rem;
      padding-bottom: 15px;
      text-align: left;
    }
    #file {
      display: flex;
      align-items: center;
    }
    .end-container {
      width: 75%;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    #image_container {
      width: 200px;
      height: 200px;
    }

    /* readonly!! */
  </style>
  <body>
    <% NoticeBoard board = (NoticeBoard) request.getAttribute("vo"); %>
  <sec:authentication property="principal" var="user" />
    <c:if test="${user.auth == 'ROLE_MEMBER'}">  
    
    	 <!-- 여기는 일반 유저가 볼수 있는 화면 -->
	    <div class="write-container">
	      <h1 id="main-notice">공지사항 상세정보</h1>
	      <!-- 제목 부분 -->
	      <div class="write-group" id="top-title">
	        <input
	          class="write-control"
	          name="noticeTitle"
	          value="${vo.noticeTitle}"
	          readonly
	        />
	      </div>
	
	      <!-- 쓰는 곳 -->
	      <div class="write-group">
	        <textarea class="write-control" rows="10" name="noticeContent" readonly>${vo.noticeContent}</textarea
	        >
	      </div>
	      <div id="image_container">
	        <a href="/adminUpload/${vo.noticeUrl}" download
	          ><img src="/adminUpload/${vo.noticeUrl}"
	        /></a>
	      </div>
	    </div>
    	</c:if>
 
    	
    
    			<!--  여기부터 관리자가 볼 수 있는 화면 -->

   <c:if test="${user.auth == 'ROLE_ADMIN'}">
      <div class="write-container">
       <form action="/updateNotice" method="post" enctype="multipart/form-data">
       <input type="hidden" name="no" value="${vo.no}" />
        <input type="hidden" name="noticeUrl" value="${vo.noticeUrl}" />
        <h1 id="main-notice">공지사항 수정</h1>
        <!-- 제목 부분 -->
        <div class="write-group" id="top-title">
          <input
            class="write-control"
            name="noticeTitle"
            value="${vo.noticeTitle}"
          />
        </div>
     

      <!-- 쓰는 곳 -->
      <div class="write-group">
        <textarea class="write-control" rows="10" name="noticeContent">${vo.noticeContent}</textarea
        >
      </div>
      <div class="end-container">
        <input
          class="write-input"
          type="file"
          id="file"
          name="file"
          accept="image/*"
          onchange="setThumbnail(event);"
        />
        <button type="submit" class="btn btn-outline-warning">수정하기</button>
        <a class="btn btn-outline-danger" href="/delete?no=${vo.no}"
          >삭제하기</a
        >
      </div>
      <div id="image_container">
        <a href="/adminUpload/${vo.noticeUrl}" download><img src="/adminUpload/${vo.noticeUrl}"/></a>
      </div>
       </form>
       </div> 
       
       </c:if>
    			
    
    
 
   


    
  </body>
</html>

<%@page import="com.semi.festopia.model.vo.NoticeBoard"%> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib
prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="../../resources/css/Image_Gallery.css">
    <link rel="stylesheet" href="../../resources/css/noticeView.css">
  </head>
  <body>
    <% NoticeBoard board = (NoticeBoard) request.getAttribute("vo"); %>
  <sec:authentication property="principal" var="user" />

  <c:if test="${user.auth == 'ROLE_MEMBER' || user == 'anonymousUser'}">
	<jsp:include page="/header.jsp"/>
	</c:if>
		<c:if test="${user.auth == 'ROLE_MEMBER'}">
		<div class="bSection-main">
			<div class="Container">
	
			<c:forEach items="${favInBoard}" var="inBoard">
				<div class="Picture">
					<img class="Picture-img card-poster " src='${inBoard.festival.poster}'/>
					<div class="Picture-note card-body">
						<p class="card-name">${inBoard.festival.name}</p>
						<p class="card-date">${inBoard.festival.startDate} ~ ${inBoard.festival.endDate}</p>
						<p class="card-place">${inBoard.festival.endDate}</p>
					</div>
				  </div>
			</c:forEach>
			</div>
		</div>
    
    	 <!-- 여기는 일반 유저가 볼수 있는 화면 -->
	    <div class="write-container view-user">
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
           <div id="editor" contenteditable="true" class="write-control" name="noticeContent" >${vo.noticeContent}</div>
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
       <script src="../../resources/js/Image_Gallery.js"></script>
  </body>
</html>

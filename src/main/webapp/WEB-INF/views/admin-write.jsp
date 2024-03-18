<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %>

<sec:authentication property="principal" var="user" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <div class="write-container">
      <h1>공지사항 등록</h1>
      <form action="/noticeWrite" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userCode" value="${user.userCode}" />
        <div class="write-group">
          <label>Title</label>
          <input class="write-control" name="noticeTitle" />
        </div>
        <div class="write-group">
          <label>Content</label>
          <textarea
            class="write-control"
            rows="10"
            name="noticeContent"
          ></textarea>
        </div>
        <div class="write-group">
          <label for="file">add File</label>
          <input
            class="write-control"
            type="file"
            id="file"
            name="file"
            accept="image/*"
          />
        </div>
        <button type="submit" class="btn btn-outline-warning">등록</button>
      </form>
    </div>

    <!-- <form action="writerAction" method="post">
	<input type="hidden" name="bdGroup" />
	<input type="hidden" name="bdOrder" />
	<input type="hidden" name="bdIndent" />
	<input
	  type="text"
	  name="bdTitle"
	  class="form-control mt-4 mb-2"
	  placeholder="제목을 입력해주세요."
	  required
	/>
	<div class="form-group">
	  <textarea
		class="form-control"
		rows="10"
		name="bdContent"
		placeholder="내용을 입력해주세요"
		required
	  ></textarea>
	</div>
	<button type="submit" class="btn btn-secondary mb-3">제출하기</button>
  </form> -->
  </body>
</html>

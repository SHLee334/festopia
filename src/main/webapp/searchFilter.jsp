<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>FESTOPIA | Find Seoul's Beat, Dive into FESTOPIA!</title>
    <!-- 파비콘 -->
    <link
      rel="icon"
      href="resources/resources/favicon.png"
      type="image/x-icon"
    />

    <!-- 스타일 적용 -->
    <link rel="stylesheet" href="./resources/css/searchFilter.css" />
  </head>
  <body class="sfBody">
    <main>
      <form action="search">
        <div class="searchFilter">
          <div class="category">
            <div class="category-1">
              <input
                type="checkbox"
                class="btn-check"
                id="btn-check-1"
                name="checkFes"
                value="1"
                autocomplete="off"
              />
              <label class="btn category-btn" for="btn-check-1"
                >교육/체험</label
              >

              <input
                type="checkbox"
                class="btn-check"
                id="btn-check-2"
                name="checkFes"
                value="2"
                autocomplete="off"
              />
              <label class="btn category-btn" for="btn-check-2">국악</label>

              <input
                type="checkbox"
                class="btn-check"
                id="btn-check-3"
                name="checkFes"
                value="3"
                autocomplete="off"
              />
              <label class="btn category-btn" for="btn-check-3">기타</label>

              <input
                type="checkbox"
                class="btn-check"
                id="btn-check-4"
                name="checkFes"
                value="4"
                autocomplete="off"
              />
              <label class="btn category-btn" for="btn-check-4"
                >독주/독창회</label
              >

              <input
                type="checkbox"
                class="btn-check"
                id="btn-check-5"
                name="checkFes"
                value="5"
                autocomplete="off"
              />
              <label class="btn category-btn" for="btn-check-5">무용</label>

              <input
                type="checkbox"
                class="btn-check"
                id="btn-check-6"
                name="checkFes"
                value="6"
                autocomplete="off"
              />
              <label class="btn category-btn" for="btn-check-6"
                >뮤지컬/오페라</label
              >
            </div>
            <br />
            <div class="category-2">
              <input
                type="checkbox"
                class="btn-check"
                id="btn-check-7"
                name="checkFes"
                value="7"
                autocomplete="off"
              />
              <label class="btn category-btn" for="btn-check-7">연극</label>

              <input
                type="checkbox"
                class="btn-check"
                id="btn-check-8"
                name="checkFes"
                value="8"
                autocomplete="off"
              />
              <label class="btn category-btn" for="btn-check-8">영화</label>

              <input
                type="checkbox"
                class="btn-check"
                id="btn-check-9"
                name="checkFes"
                value="9"
                autocomplete="off"
              />
              <label class="btn category-btn" for="btn-check-9"
                >전시/미술</label
              >

              <input
                type="checkbox"
                class="btn-check"
                id="btn-check-10"
                name="checkFes"
                value="10"
                autocomplete="off"
              />
              <label class="btn category-btn" for="btn-check-10">축제</label>

              <input
                type="checkbox"
                class="btn-check"
                id="btn-check-11"
                name="checkFes"
                value="11"
                autocomplete="off"
              />
              <label class="btn category-btn" for="btn-check-11">콘서트</label>

              <input
                type="checkbox"
                class="btn-check"
                id="btn-check-12"
                name="checkFes"
                value="12"
                autocomplete="off"
              />
              <label class="btn category-btn" for="btn-check-12">클래식</label>
            </div>
          </div>
          <br />
          <hr />
          <br />

          <div class="dateSetting">
            <h5>기간</h5>
            <select name="" id="">
              <option value="">시작일</option>
              <option value="">종료일</option>
              <input type="date" readonly />
              ~
              <input type="date" readonly />
              <input type="checkbox" />
            </select>
          </div>

          <br />
          <hr />
          <br />

          <div class="checkfeeStatus">
            <h5>입장료</h5>
            <label
              ><input type="checkbox" name="feeStatus" value="nonfree" />
              유료</label
            >
            <label
              ><input type="checkbox" name="feeStatus" value="free" />
              무료</label
            >
          </div>

          <input type="submit" value="검색" />
        </div>
      </form>
    </main>

    <script src="./resources/js/searchFilter.js"></script>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- 부트스트랩 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <!--css-->
    <link rel="stylesheet" href="resources/studyManagement/css/studyManagement.css">
  </head>

  <body>
    <div class="studyManagementMenus-left-section">
      <div class="studyManagementMenus-container">
        <div class="studyManagementMenus-container-writer">
          <h4 id="studyManagementMenus-header">강의자료실</h4>
          <input class="lectureMaterials-write-btn" id="studyManagementWriter" type="button" value="자료 등록"
            data-bs-toggle="modal" data-bs-target="#staticBackdrop">
        </div>
        <div class="studyManagementMenus-class-menuTitle">
          <h5>자료실</h5>
          <button type="button" class="btn btn-outline-dark"
            style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">폴더 추가</button>
        </div>

        <div class="studyManagementMenus-class-menu">
          <div class="studyManagementMenus-class-menu-btn studyManagementMenus-class-menu-click"
            onclick="changeClass(this)">자바</div>
          <div class="studyManagementMenus-class-menu-btn" onclick="changeClass(this)">데이터베이스</div>
          <div class="studyManagementMenus-class-menu-btn" onclick="changeClass(this)">파이썬</div>
          <div class="studyManagementMenus-class-menu-btn" onclick="changeClass(this)">자바스크립트</div>
          <div class="studyManagementMenus-class-menu-btn" onclick="changeClass(this)">즐겨찾기</div>
        </div>
        <div class="studyManagementMenus-container-menu">
          <select class="form-select form-select-sm" id="studyManagementMenus-id" onchange="changeMenu(this)"
            aria-label=".form-select-sm example">
            <option selected value="lessonPlan">강의계획표</option>
            <option value="lectureMaterials">강의자료실</option>
            <option value="studentManagement">학생 관리</option>
          </select>
        </div>
      </div>
    </div>
    <!-- JS -->
    <script src="resources/studyManagement/js/studyManagement.js"></script>
  </body>

  </html>
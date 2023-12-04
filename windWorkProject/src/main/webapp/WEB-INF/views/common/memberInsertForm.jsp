<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <!--css-->
    <link rel="stylesheet" href="./resources/common/css/memberInsertForm.css">
     <!--JS-->
  <script src="resources/common/js/memberInsert.js"></script>
</head>
<body>
	<form action="" class="row g-3 needs-validation" id="signupForm">
    <div class="memberInsertForm">
      <div class="memberInsertForm-inputs">
        <div class="memberInsertForm-input-title">
          <div class="memberInsertForm-titleSize">
            <div class="memberInsertForm-input-title-logo">
              <h1>회원 가입</h1>
            </div>
            <div class="memberInsertForm-title">
              <img src="./resources/common/logo/mainLogo.png" class="memberInsert-title-Logo" height="70" width="70" alt="">
            </div>
          </div>
        </div>

        <div class="memberInsertForm-input-content1">
          <div class="memberInsertForm-input-content1-container">
            <div class="memberInsertForm-input-content1-container1">
              <div class="memberInsertForm-input-content1-container1-name">
                <label for="nameInput" class="form-label insert-font">이름</label>
                <input class=" form-control form-control-sm" id="nameInput" type="text" placeholder="이름을 입력해주세요">
              </div>
              <div class="memberInsertForm-input-content1-container1-name">
                <label for="genderInput" class="form-label insert-font">성별</label>
                <div class="memberInsert-genderInput">
                  <input type="radio" class="btn-check " name="gender" value="male" id="success-outlined"
                    autocomplete="off" checked>
                  <label class="btn btn-outline-secondary btn-sm" for="success-outlined">남자</label>
                  <input type="radio" class="btn-check" name="gender" value="female" id="danger-outlined"
                    autocomplete="off">
                  <label class="btn btn-outline-secondary btn-sm" for="danger-outlined">여자</label>
                </div>

              </div>
            </div>
            <div class="memberInsertForm-input-content1-container2">
              <label for="emailInput" class="form-label insert-font">이메일</label>
              <div class="input-group input-group-sm mb-3">
                <input type="text" class="form-control" id="emailInput" name="" placeholder="이메일 주소">
                <span class="input-group-text" id="inputGroup-sizing-sm">@</span>
                <input class="form-control form-control-sm" id="emailDomain" name="" list="datalistOptions" type="text"
                  placeholder="직접입력 or 선택">
                <datalist id="datalistOptions">
                  <option value="naver.com">
                  <option value="hanmail.com">
                  <option value="gmail.com">
                  <option value="daum.net">
                  <option value="kakao.com">
                  <option value="nate.com">
                </datalist>
              </div>
            </div>
          </div>
          <div class="memberInsertForm-input-content1-container">
            <div class="memberInsertForm-input-content1-container3">
              <label for="inputPassword" class="form-label insert-font">비밀번호</label>
              <input class="form-control form-control-sm" name="" id="inputPassword" type="password"
                placeholder="비밀번호 입력(문자, 숫자, 특수문자 포함 8 ~ 20자)">
              <div class="invalid-feedback insert-invalid-fontsize1" id="password-invalid">
              </div>
              <div class="valid-feedback insert-invalid-fontsize1">
                사용가능한 비밀번호 입니다.
              </div>
            </div>
            <div class="memberInsertForm-input-content1-container2">
              <label for="inputPasswordCheck" class="form-label insert-font">비밀번호 확인</label>
              <input class="form-control form-control-sm" name="" id="inputPasswordCheck" type="password"
                placeholder="비밀번호 재입력">
              <div class="invalid-feedback insert-invalid-fontsize2">
                비밀번호가 일치하지 않습니다.
              </div>
              <div class="valid-feedback insert-invalid-fontsize2">
                비밀번호가 일치합니다.
              </div>
            </div>
          </div>
        </div>
        <div class="memberInsertForm-input-content2">
          <div class="memberInsertForm-input-content1-container2">
            <label for="phoneInput" class="form-label insert-font">전화번호</label>
            <input class="form-control form-control-sm" name="" id="phoneInput" type="text"
              placeholder="휴대폰 번호 입력(문자,특수문자 입력불가)">
            <div class="invalid-feedback insert-invalid-fontsize2">
              9 ~ 11자리 입력해주세요.
            </div>
            <div class="valid-feedback insert-invalid-fontsize2">
              정확합니다.
            </div>
          </div>
          <div class="memberInsertForm-input-content1-container2">
            <label for="dateInput" class="form-label insert-font">생년월일</label>
            <input class="form-control form-control-sm" name="" id="dateInput" type="date"
              placeholder=".form-control-sm" aria-label=".form-control-sm example">
          </div>
        </div>
        <div class="memberInsert-btns">
          <div class="memberInsert-btn">
            <button type="submit" class="btn btn-outline-success insert-btn-size">가입</button>
            <button type="button" class="btn btn-outline-danger insert-btn-size">돌아가기</button>
          </div>
        </div>
      </div>
    </div>
  </form>
</body>
</html>
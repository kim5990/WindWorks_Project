<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<!--부트스트랩-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <!--login 스타일-->
  <link rel="stylesheet" href="./resources/common/css/login.css">
</head>
<body>
  <form action="">
    <div class='login'>
      <div class='login-logo-image'>
        <img src="./resources/common/logo/mainLogo.png" alt="" width="100" height="100">
      </div>
      <div class='login-logo-text'>
        <div class="text-body-success login-logo-text-wind">WIND</div>
        <div class="text-body-success login-logo-text-work">WORKS</div>
      </div>
      <div class="login-inputs">
        <div class="login-input">
          <div class="login-input-size">
            <input type="text" class="login-input-border" name="id" value="" placeholder="계정">
          </div>
        </div>
        <div class="login-input">
          <div class="login-input-size">
            <input type="password" class="login-input-border" name="password" value="" placeholder="비밀번호">
          </div>
        </div>
      </div>
      <button type="submit" class="btn btn-success login-success-btn">로그인</button>
      <div class="login-tail">
        <div class="form-check"
          style="padding: 0px; display: flex; justify-content: space-between; align-items: center; width: 70px;">
          <input class="check-input" type="checkbox" value="" id="flexCheckDefault">
          <label class="form-check-label" for="flexCheckDefault">
            계정저장
          </label>
        </div>
        <div class="login-insertMember-btn text-body-secondary">아이디 찾기</div>
        <div class="login-insertMember-btn text-body-secondary">비밀번호 찾기</div>
        <div class="login-insertMember-btn text-body-secondary">회원가입</div>
      </div>
    </div>
  </form>
</body>
</html>
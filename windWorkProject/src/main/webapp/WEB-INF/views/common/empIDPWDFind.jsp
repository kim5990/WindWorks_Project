<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <!--css-->
    <link rel="stylesheet" href="./resources/common/css/empIDFind.css">
</head>
<body>
	<div class="insertContainer" >
        <div class="container" >
        <form action="" method="post" class = "idFindForm">
            <div class="idFindForm-input-title-logo">
                <h2>아이디 찾기</h2>
            </div>
            <div class="idFindForm-input-container">
                <div class="inputPasswordFind1">
                    <input class="idFindForm-input-style"  placeholder="이름 입력" type="text" id="empName">
                </div>
                <div class="inputPasswordFind2">
                    <input class="idFindForm-input-style" placeholder="휴대폰 번호" type="text" id="empPhone">
                    <button class="idFindForm-input-button" type="submit">휴대폰 인증</button>
                </div>
                <div></div>
            </div>
        </form>
        <form action="" method="post" class = "idFindForm">
            <div class="idFindForm-input-title-logo">
                <h2>비밀 번호 찾기</h2>
            </div>
            <div class="idFindForm-input-container">
                <div class="idFindForm-input-container">
                    <div class="inputPasswordFind">
                        <input class="idFindForm-input-style" placeholder="이메일(아이디) 입력"  type="text" id="empPhone">
                        <button class="idFindForm-input-button" type="submit">이메일 인증</button>
                    </div>
                </div>
            </div>
        </form>
        </div>
        <div class="backBtn">
            <div  class="backBtn-container">
                <button type="button"  onclick="history.back()" class="btn btn-outline-danger backBtn-btn">돌아가기</button>
            </div>
        </div>
    </div>
</body>
</html>
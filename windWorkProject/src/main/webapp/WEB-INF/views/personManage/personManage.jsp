<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!--css-->
<link rel="stylesheet" href="./resources/personManage/css/personManage.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
    <div class ="menu">
        <div class="pmMainbox">
            <div class="personManage">
                <div class="personManage_header">
                    <div class="personManage_title"><h4>전직원</h4></div>
                    <div class="personManage_personSum">125</div>
                    <div class="personManage_searchDiv"><input type="text" class="personManage_search"><ion-icon name="search-outline"></ion-icon></div>
                    <div class="personManage_accept">
                        <button type="button" class="personManage_accept_btn" data-bs-toggle="modal" data-bs-target="#acceptPm">
                            1
                        </button>
                    </div>
                </div>
                <div class="personManage_body">
                    <table class="personManage_table">
                        <thead>
                            <tr>
                                <th>사번</th>
                                <th style="padding-left: 10px;">부서 <ion-icon name="chevron-down-outline"></ion-icon></th>
                                <th style="padding-left: 10px;">직급 <ion-icon name="chevron-down-outline"></ion-icon></th>
                                <th>이름</th>
                                <th style="width: 200px;">이메일</th>
                                <th>연락처</th>
                                <th>생년월일</th>
                                <th>입사일</th>
                                <th style="padding-left: 10px;">상태 <ion-icon name="chevron-down-outline"></ion-icon></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update" data-bs-toggle="modal" data-bs-target="#updatePm">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update" data-bs-toggle="modal" data-bs-target="#updatePm">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update" data-bs-toggle="modal" data-bs-target="#updatePm">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update" data-bs-toggle="modal" data-bs-target="#updatePm">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update" data-bs-toggle="modal" data-bs-target="#updatePm">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update" data-bs-toggle="modal" data-bs-target="#updatePm">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update" data-bs-toggle="modal" data-bs-target="#updatePm">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update" data-bs-toggle="modal" data-bs-target="#updatePm">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update" data-bs-toggle="modal" data-bs-target="#updatePm">수정</button></td>
                            </tr>
                            <tr>
                                <td>125</td>
                                <td>영업부</td>
                                <td>부장</td>
                                <td>김부장</td>
                                <td>asdotm23dl@wind.com</td>
                                <td>010-1111-1111</td>
                                <td>860421</td>
                                <td>2012-02-14</td>
                                <td>재직</td>
                                <td><button class="personManage_update" data-bs-toggle="modal" data-bs-target="#updatePm">수정</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 페이지네이션 -->
                <div class="personManage_footer">
                    <ul class="pagination">
                        <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--가입승인 Modal -->
    <div class="modal fade" id="acceptPm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" id="modal-dialog-id">
            <div class="modal-content">
                <form action="" method="post">
                    <div class="modal-header" id="modal-header-id">
                        <button type="button" id="close-btn" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        <h4 class="modal-title" id="modal-title-id">가입신청</h4>
                        <button type="submit" class="form-button1">승인</button>
                        <button type="button" class="form-button2" id="fakeBtn" onclick="executeCloseButton()">취소</button>
                    </div>
                        <div class="modal-body" id="modal-body-id">
                            <table class="modal-table">
                                <tr>
                                    <th>이름</th>
                                    <td>김신입</td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>oskdleeos@wind.com</td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td>010-1111-1234</td>
                                </tr>
                                <tr>
                                    <th>생년월일</th>
                                    <td>950752</td>
                                </tr>
                                <tr>
                                    <th>입사일</th>
                                    <td>2023 - 11 - 24</td>
                                </tr>
                                <tr>
                                    <th>부서</th>
                                    <td>
                                        <form>
                                            <!-- 공통 부서 변수명으로 name값 바꾸기 -->
                                            <select name="" id="group">
                                                <option value="">영업팀</option>
                                                <option value="">인사팀</option>
                                            </select>
                                        </form>
                                    </td>
                                </tr>
                                <tr>
                                    <th>직급</th>
                                    <td>
                                        <form>
                                            <!-- 공통 직급 변수명으로 name값 바꾸기 -->
                                            <select name="" id="grade">
                                                <option value="">사원</option>
                                                <option value="">대리</option>
                                                <option value="">팀장</option>
                                                <option value="">부장</option>
                                            </select>
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!--수정 Modal -->
    <div class="modal fade" id="updatePm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" id="modal-dialog-id">
            <div class="modal-content">
                <form action="" method="post">
                    <div class="modal-header" id="modal-header-id">
                        <button type="button" id="close-btn2" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        <h4 class="modal-title" id="modal-title-id">수정</h4>
                        <button type="submit" class="form-button3">수정</button>
                        <button type="button" class="form-button2" id="fakeBtn" onclick="executeCloseButton2()">취소</button>
                    </div>
                        <div class="modal-body" id="modal-body-id">
                            <table class="modal-table">
                                <tr>
                                    <th>이름</th>
                                    <td>김신입</td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>oskdleeos@wind.com</td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td>010-1111-1234</td>
                                </tr>
                                <tr>
                                    <th>생년월일</th>
                                    <td>950752</td>
                                </tr>
                                <tr>
                                    <th>입사일</th>
                                    <td>2023 - 11 - 24</td>
                                </tr>
                                <tr>
                                    <th>부서</th>
                                    <td>
                                        <form>
                                            <!-- 공통 부서 변수명으로 name값 바꾸기 -->
                                            <select name="" id="group">
                                                <option value="">영업팀</option>
                                                <option value="">인사팀</option>
                                            </select>
                                        </form>
                                    </td>
                                </tr>
                                <tr>
                                    <th>직급</th>
                                    <td>
                                        <form>
                                            <!-- 공통 직급 변수명으로 name값 바꾸기 -->
                                            <select name="" id="grade">
                                                <option value="">사원</option>
                                                <option value="">대리</option>
                                                <option value="">팀장</option>
                                                <option value="">부장</option>
                                            </select>
                                        </form>
                                    </td>
                                </tr>
                                <tr>
                                    <th>상태</th>
                                    <td>
                                        <form>
                                            <!-- 공통 상태 변수명으로 name값 바꾸기 -->
                                            <select name="" id="status">
                                                <option value="">재직</option>
                                                <option value="">휴직</option>
                                                <option value="">퇴직</option>
                                            </select>
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        //취소버튼 누르면 모달창 끄기
        function executeCloseButton() {
            var closeButton = document.getElementById("close-btn");
            closeButton.click();
        }
        function executeCloseButton2() {
            var closeButton = document.getElementById("close-btn2");
            closeButton.click();
        }
    </script>
</body>
</html>
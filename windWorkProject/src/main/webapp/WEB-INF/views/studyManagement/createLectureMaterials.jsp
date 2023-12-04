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
        <link rel="stylesheet" href="resources/studyManagement/css/createLectureMaterials.css">
        <style>
            .uploadbox {
                width: 800px;
                height: 300px;
                border: 1px solid gray;
                border-radius: 10px;
                display: flex;
                justify-content: center;
                align-items: center;
            }
        </style>

    </head>

    <body>
        <jsp:include page="../common/header.jsp" />
        <div class="menu">
            <jsp:include page="./studyManagement.jsp" />
            <div class="createLectureMaterials">
                <div class="createLectureMaterials-container">
                    <div class="createLectureMaterials-title">
                        <h4>문서 등록</h4>
                    </div>
                    <div class="createLectureMaterials-createInputs-container">
                        <table class="createLectureMaterials-createInputs-table">
                            <tr>
                                <th style="width: 172px; height: 42px; text-align: end;">
                                    <div class="createLectureMaterials-createInputs-div">
                                        <p class="createLectureMaterials-createInputs-p">위치</p>
                                        <p class="createLectureMaterials-createInputs-star">*</p>

                                    </div>
                                </th>
                                <td style="height: 42px;">
                                    <select class="form-select form-select-sm createLectureMaterials-select-subject"
                                        aria-label="Small select example" style="font-size: 13px;">
                                        <option selected>선택</option>
                                        <option value="java">자바</option>
                                        <option value="db">데이터베이스</option>
                                        <option value="python">파이썬</option>
                                        <option value="js">자바스크립트</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th style="width: 172px; height: 42px;">
                                    <div class="createLectureMaterials-createInputs-div">
                                        <p class="createLectureMaterials-createInputs-p">제목</p>
                                        <p class="createLectureMaterials-createInputs-star">*</p>
                                    </div>
                                </th>
                                <td style="height: 42px;">
                                    <input class="form-control form-control-sm" type="text" placeholder="제목을 입력하세요"
                                        aria-label=".form-control-sm example">
                                </td>
                            </tr>
                            <tr>
                                <th style="width: 172px; height: 42px;">
                                    <div class="createLectureMaterials-createInputs-div">
                                        <p class="createLectureMaterials-createInputs-p">보존연한</p>
                                    </div>
                                </th>
                                <td style="height: 42px;">
                                    <select class="form-select form-select-sm createLectureMaterials-select-year"
                                        aria-label="Small select example" style=" font-size: 13px;">
                                        <option value="java">1년</option>
                                        <option value="db">3년</option>
                                        <option selected value="python">5년</option>
                                        <option value="js">10년</option>
                                        <option value="js">영구</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th style="width: 172px; height: 65px;">
                                    <div class="createLectureMaterials-createInputs-p-file">
                                        <p class="createLectureMaterials-createInputs-p ">파일첨부</p>
                                    </div>
                                </th>
                                <td style="height: 65px;">
                                    <div class="createLectureMaterials-file-upload-box">
                                        <div class="createLectureMaterials-file-upload">
                                            <ion-icon class="create-document-icon"
                                                name="cloud-upload-outline"></ion-icon>
                                            <span>
                                                이 곳에 파일을 드래그 하세요. 또는
                                                <span>
                                                    <label id="create-fileSelected-label" for="create-fileSelected">파일
                                                        선택</label>
                                                    <input type="file" name="file" class="create-fileSelected"
                                                        id="fileInput" title="파일선택" multiple accept="undfined">
                                                </span>
                                            </span>
                                        </div>
                                        <ui class="createLectureMaterials-file-upload-wrap">

                                        </ui>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2" style="height: 316px;">
                                    <textarea id="postContent" style="width: 100%; height: 100%;"></textarea>
                                </th>
                            </tr>
                        </table>
                    </div>
                    <div class="createLectureMaterials-btn-container">
                        <div class="createLectureMaterials-btn-container2">
                            <button class="form-button1" type="submit">등록</button>
                            <button class="form-button2">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="createLectureMaterials" data-bs-backdrop="static" data-bs-keyboard="false"
            tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Understood</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.tiny.cloud/1/YOUR_API_KEY/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
            tinymce.init({
                selector: '#postContent', // 에디터를 적용할 텍스트 영역의 ID
                height: 300, // 에디터의 높이
                plugins: 'link image code', // 필요한 플러그인 추가
                toolbar: 'undo redo | formatselect | bold italic | alignleft aligncenter alignright | code', // 에디터 상단에 표시되는 툴바 구성
            });
        </script>
        <script>
            document.querySelector("#create-fileSelected-label").addEventListener("click", function () {
                document.getElementById('fileInput').click();
            })
            document.getElementById('fileInput').addEventListener('change', function () {
                let files = this.files;
                for (let i = 0; i < files.length; i++) {
                    let fileName = files[i].name;
                    let fileSize = files[i].size;

                    // 리스트 아이템 생성
                    let listItem = document.createElement('li');
                    listItem.className = 'fileItem';
                    listItem.innerHTML = '<span class="closeButton" onclick="removeFile(this)">X</span>'
                        + ' <span>파일 이름: ' + fileName + '</span>'
                        + '<span>파일 크기: ' + fileSize + '</span>';

                    // 파일 정보를 표시하는 ul에 추가
                    document.querySelector('.createLectureMaterials-file-upload-wrap').appendChild(listItem);
                }
            })

            // 파일 정보를 삭제하는 함수
            function removeFile(element) {
                let listItem = element.parentNode;
                listItem.parentNode.removeChild(listItem);
            }

        </script>
    </body>

    </html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lessonPlan</title>
  <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
  integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <!--css-->  
 <link rel="stylesheet" href="resources/studyManagement/css/lessonPlan.css">
</head>
<body onload="lessonOnload()">
	<jsp:include page="../common/header.jsp" />
	<div class="menu">
    <jsp:include page="./studyManagement.jsp" />
    <div class="lessonPlan">
        <div class = "studyManagementMenus">
            <div class="studyManagement-title">
                <div class="studyManagement-title-container">
                    <div class="studyManagement-title1">
                        <h3 class="studyManagement-title-fontStyle1">2023. 07. 24 ~ 2024. 01. 03</h3>
                        <h2 class="studyManagement-title-fontStyle2">프론트개발 양성과정 (I반)</h2>
                    </div>
                    <div class="studyManagement-title2">
                        <div class="studyManagement-title2-month">
                            <div class = "studyManagement-title-fontStyle2">개월차</div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-1-square-fill" viewBox="0 0 16 16">
                                <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2Zm7.283 4.002V12H7.971V5.338h-.065L6.072 6.656V5.385l1.899-1.383h1.312Z"/>
                              </svg>
                              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-2-square" viewBox="0 0 16 16">
                                <path d="M6.646 6.24v.07H5.375v-.064c0-1.213.879-2.402 2.637-2.402 1.582 0 2.613.949 2.613 2.215 0 1.002-.6 1.667-1.287 2.43l-.096.107-1.974 2.22v.077h3.498V12H5.422v-.832l2.97-3.293c.434-.475.903-1.008.903-1.705 0-.744-.557-1.236-1.313-1.236-.843 0-1.336.615-1.336 1.306Z"/>
                                <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2Zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2Z"/>
                              </svg>
                              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-3-square" viewBox="0 0 16 16">
                                <path d="M7.918 8.414h-.879V7.342h.838c.78 0 1.348-.522 1.342-1.237 0-.709-.563-1.195-1.348-1.195-.79 0-1.312.498-1.348 1.055H5.275c.036-1.137.95-2.115 2.625-2.121 1.594-.012 2.608.885 2.637 2.062.023 1.137-.885 1.776-1.482 1.875v.07c.703.07 1.71.64 1.734 1.917.024 1.459-1.277 2.396-2.93 2.396-1.705 0-2.707-.967-2.754-2.144H6.33c.059.597.68 1.06 1.541 1.066.973.006 1.6-.563 1.588-1.354-.006-.779-.621-1.318-1.541-1.318Z"/>
                                <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2Zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2Z"/>
                              </svg>
                              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-4-square" viewBox="0 0 16 16">
                                <path d="M7.519 5.057c.22-.352.439-.703.657-1.055h1.933v5.332h1.008v1.107H10.11V12H8.85v-1.559H4.978V9.322c.77-1.427 1.656-2.847 2.542-4.265ZM6.225 9.281v.053H8.85V5.063h-.065c-.867 1.33-1.787 2.806-2.56 4.218Z"/>
                                <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2Zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2Z"/>
                              </svg>
                              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-5-square" viewBox="0 0 16 16">
                                <path d="M7.994 12.158c-1.57 0-2.654-.902-2.719-2.115h1.237c.14.72.832 1.031 1.529 1.031.791 0 1.57-.597 1.57-1.681 0-.967-.732-1.57-1.582-1.57-.767 0-1.242.45-1.435.808H5.445L5.791 4h4.705v1.103H6.875l-.193 2.343h.064c.17-.258.715-.68 1.611-.68 1.383 0 2.561.944 2.561 2.585 0 1.687-1.184 2.806-2.924 2.806Z"/>
                                <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2Zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2Z"/>
                              </svg>
                              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-6-square" viewBox="0 0 16 16">
                                <path d="M8.21 3.855c1.612 0 2.515.99 2.573 1.899H9.494c-.1-.358-.51-.815-1.312-.815-1.078 0-1.817 1.09-1.805 3.036h.082c.229-.545.855-1.155 1.98-1.155 1.254 0 2.508.88 2.508 2.555 0 1.77-1.218 2.783-2.847 2.783-.932 0-1.84-.328-2.409-1.254-.369-.603-.597-1.459-.597-2.642 0-3.012 1.248-4.407 3.117-4.407Zm-.099 4.008c-.92 0-1.564.65-1.564 1.576 0 1.032.703 1.635 1.558 1.635.868 0 1.553-.533 1.553-1.629 0-1.06-.744-1.582-1.547-1.582Z"/>
                                <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2Zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2Z"/>
                              </svg>
                        </div>
                    </div>
                </div>
            </div>  
            <div class="studyManagement-contents">
                <div class = "studyManagement-contents-container-icon1">
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-caret-left" viewBox="0 0 16 16">
                        <path d="M10 12.796V3.204L4.519 8 10 12.796zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506l5.48-4.796A1 1 0 0 1 11 3.204v9.592a1 1 0 0 1-1.659.753z"/>
                      </svg>
                </div>
                <div class="studyManagement-contents-container">  
                    <div class="studyManagement-contents-container1">
                        <div class="studyManagement-contents-container2"> 1 - 2주차 </div>
                        <div class="studyManagement-contents-container3">
                            <div class="studyManagement-contents-container4">
                                <textarea disabled readonly style="border: none; width: 380px; height: 240px; resize: none; background-color: white; overflow:hidden"> 1. Vscode 설정 &#10; 2. html기본 개념 &#10; 3. 태그와 스타일의 기본적인 사용방법 &#10; 4. 박스 관련 속성과 여백 속성 &#10; 5. 폼 요소의 테이블 요소 &#10; 6. 포지션 속성과 레이아웃 정렬 &#10; 7. 웹 폰트 속성과 인터렉션 속성

                                </textarea>

                            </div>  
                        </div>
                        <div class="studyManagement-contents-container2"></div>
                    </div>
                    <div class="studyManagement-contents-container1">
                        <div class="studyManagement-contents-container2">3 - 4주차</div>
                        <div class="studyManagement-contents-container3">
                            <div class="studyManagement-contents-container4">
                                <textarea disabled readonly style="border: none; width: 380px; height: 240px; resize: none; background-color: white; overflow:hidden"> 1. Vscode 설정 &#10; 2. html기본 개념 &#10; 3. 태그와 스타일의 기본적인 사용방법 &#10; 4. 박스 관련 속성과 여백 속성 &#10; 5. 폼 요소의 테이블 요소 &#10; 6. 포지션 속성과 레이아웃 정렬 &#10; 7. 웹 폰트 속성과 인터렉션 속성

                                </textarea>
                            </div> 
                        </div>
                        <div class="studyManagement-contents-container2"></div>
                    </div>
                </div>
                <div class = "studyManagement-contents-container-icon2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">
                        <path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>
                      </svg>
                </div> 
            </div>
        </div>
    </div>
    <!--수정하기 모달-->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="staticBackdropLabel">강의계획표 수정</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">일시 : 시작일</span>
                    <input type="date" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                    <span class="input-group-text" id="basic-addon1">종료일</span>
                    <input type="date" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
              <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">개설반명</span>
                <input type="text" class="form-control" value="프론트 개발자양성과정" aria-label="Username" aria-describedby="basic-addon1">
                <span class="input-group-text" id="basic-addon1">강의실</span>
                <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    <option value="E">E</option>
                    <option value="F">F</option>
                    <option selected value="I">I</option>
                  </select>
            </div>
              <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                <option selected value="1-1">1개월차(1 - 2주차)</option>
                <option value="1-2">1개월차(3 - 4주차)</option>
                <option value="2-1">2개월차(4 - 5주차)</option>
                <option value="2-2">2개월차(6 - 7주차)</option>
                <option value="3-1">2개월차(8 - 9주차)</option>
                <option value="3-2">2개월차(10 - 11주차)</option>
                <option value="4-1">2개월차(12 - 13주차)</option>
                <option value="4-2">2개월차(14 - 15주차)</option>
                <option value="5-1">2개월차(16 - 17주차)</option>
                <option value="5-2">2개월차(18 - 19주차)</option>
                <option value="6-1">2개월차(20 - 21주차)</option>
                <option value="6-2">2개월차(22 - 23주차)</option>
              </select>
              <div class="input-group">
                <textarea style="height: 465px;" class="form-control" aria-label="With textarea"> 1. Vscode 설정 &#10; 2. html기본 개념 &#10; 3. 태그와 스타일의 기본적인 사용방법 &#10; 4. 박스 관련 속성과 여백 속성 &#10; 5. 폼 요소의 테이블 요소 &#10; 6. 포지션 속성과 레이아웃 정렬 &#10; 7. 웹 폰트 속성과 인터렉션 속성
                </textarea>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
              <button type="button" class="btn btn-danger">변경하기</button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script>
     const lessonOnload = function(){
        document.querySelector("#nav-studyM-bar").classList.add('nav__link')
     }

    </script>
</body>
</html>
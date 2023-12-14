function detailMaterialsView(dataNo) {
    location.href = "detailView.lm?dataNo=" + dataNo
}
//강의계획표 페이징 처리 함수
const studyManageFormMovement = function (num, cpage) {
    if (num === 1) {
        lessonPlanView((cpage - 1), drowlessonPlanView)
    } else {
        lessonPlanView((cpage + 1), drowlessonPlanView)
    }
}


//강의계획표 뷰
function drowlessonPlanView(res) {
    let str = "";
    const list = res.list;
    const cpage = res.pi;
    const cp = res.cp;
    let num = 1;
    let monthstr = "";
    for (let i = 1; i <= cp.months; i++) {
        if (i <= cpage.currentPage) {
            monthstr += '<div class="studyManagement-title-months months" id="months' + i + '">' + i + '</div>'
        } else {
            monthstr += '<div class="studyManagement-title-months" id="months' + i + '">' + i + '</div>'
        }
    }

    let cpageLeftBtnStr = "";
    if (cpage.currentPage === num) {
        cpageLeftBtnStr += '<svg xmlns="http://www.w3.org/2000/svg" onclick="studyManageFormMovement(1, 7)" width="40" height="40" fill="currentColor" class="bi bi-caret-left" viewBox="0 0 16 16">'
            + '<path d="M10 12.796V3.204L4.519 8 10 12.796zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506l5.48-4.796A1 1 0 0 1 11 3.204v9.592a1 1 0 0 1-1.659.753z"/>'
            + '</svg>';
    } else {
        cpageLeftBtnStr += '<svg xmlns="http://www.w3.org/2000/svg" onclick="studyManageFormMovement(1,' + cpage.currentPage + ')" width="40" height="40" fill="currentColor" class="bi bi-caret-left right_movement" viewBox="0 0 16 16">'
            + '<path d="M10 12.796V3.204L4.519 8 10 12.796zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506l5.48-4.796A1 1 0 0 1 11 3.204v9.592a1 1 0 0 1-1.659.753z"/>'
            + '</svg>';
    }

    let cpagerightBtnStr = "";
    if (cpage.currentPage === cpage.maxPage) {
        cpagerightBtnStr += '<svg xmlns="http://www.w3.org/2000/svg" onclick="studyManageFormMovement(2, 0)" width="40" height="40" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">'
            + '<path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>'
            + '</svg>'
    } else {
        cpagerightBtnStr += '<svg xmlns="http://www.w3.org/2000/svg" onclick="studyManageFormMovement(2, ' + cpage.currentPage + ')" width="40" height="40" fill="currentColor" class="bi bi-caret-right left_movement" viewBox="0 0 16 16">'
            + '<path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>'
            + '</svg>'
    }

    contentsStr = '';
    for (let item of list) {
        contentsStr += '<div class="studyManagement-contents-container1">'
            + '<div class="studyManagement-contents-container2">' + item.classWeek + '</div>'
            + '<div class="studyManagement-contents-container3">'
            + '<div class="studyManagement-contents-container4">'
            + '<textarea disabled readonly style="border: none; width: 380px; height: 240px; resize: none; background-color: white; overflow:hidden">' + item.classContent
            + '</textarea>'
            + '</div>'
            + '</div>'
            + '<div class="studyManagement-contents-container2"></div>'
            + '</div>'
    }
    str += '<div class = "studyManagementMenus">'
        + '<div class="studyManagement-title">'
        + '<div class="studyManagement-title-container">'
        + ' <div class="studyManagement-title1">'
        + '<h5 class="studyManagement-title-fontStyle1">' + cp.classStartDate + ' ~ ' + cp.classEndDate + '</h5>'
        + '<h4 class="studyManagement-title-fontStyle2">' + cp.classTitle + '</h4>'
        + '<h4 class="studyManagement-title-fontStyle2">(' + cp.classroomName + ' 수용인원: ' + cp.classTotalNumber + '명)</h4>'
        + '</div>'
        + '<div class="studyManagement-title2">'
        + '<div class="studyManagement-title2-month">'
        + '<div class = "studyManagement-title-fontStyle2">개월차</div>'
        + monthstr
        + '</div>'
        + '</div>'
        + '</div>'
        + '</div>'
        + ' <div class="studyManagement-contents">'
        + '<div class = "studyManagement-contents-container-icon1">'
        + cpageLeftBtnStr
        + '</div>'
        + '<div class="studyManagement-contents-container">'
        + contentsStr
        + '</div>'
        + '<div class = "studyManagement-contents-container-icon2">'
        + cpagerightBtnStr
        + '</div>'
        + '</div>'
        + '</div>';
    if (document.querySelector("#studyManagemetMenu").classList === "right-student-container") {
        document.querySelector("#studyManagemetMenu").classList.remove('right-student-container');
        document.querySelector("#studyManagemetMenu").classList.add('lessonPlan');
    } else {
        document.querySelector("#studyManagemetMenu").classList.remove('lectureMaterials');
        document.querySelector("#studyManagemetMenu").classList.add('lessonPlan');
    }
    document.querySelector("#studyManagemetMenu").innerHTML = str;
}

//강의자료실 리스트 뷰
function drowlectureMaterialsView(res) {
    let caLevellist = res.caLevellist;
    let calist = res.calist;
    let lmpi = res.lmpi;
    let category = calist[0].category;
    let str = "";
    let calistStr = "";

    for (let i = 0; i < calist.length; i++) {
        calistStr += '<tr style="height : 50px;" onclick = "detailMaterialsView(' + calist[i].classDataNo + ')" class = "lectureMaterials-Materials-tr">'
            + '<td class="lectureMaterials-Materials-table-th2">' + calist[i].classDataNo + '</td>'
            + '<td class="lectureMaterials-Materials-table-th">' + calist[i].classDataTitle + '</td>'
            + '<td class="lectureMaterials-Materials-table-th">' + calist[i].classDataDate + '</td>'
            + '<td class="lectureMaterials-Materials-table-th3">'
        for (let caLevel of caLevellist) {
            if (caLevel.classDataNo === calist[i].classDataNo) {
                calistStr += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-link-45deg" viewBox="0 0 16 16">'
                    + '<path d="M4.715 6.542 3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1.002 1.002 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4.018 4.018 0 0 1-.128-1.287z"/>'
                    + '<path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 1 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 1 0-4.243-4.243L6.586 4.672z"/>'
                    + '</svg>'
            }
        }
        calistStr += '</td>'
            + '</tr>'
    }


    let pageStr = "";
    if (lmpi.currentPage === 1) {
        pageStr += '<li class="page-item disabled"><a class="page-link"><</a></li>'
    } else {
        pageStr += '<li class="page-item" onclick = "lectureMaterialsView(' + (lmpi.currentPage - 1) + ', drowlectureMaterialsView, ' + "'" + category + "'" + ')"><a class="page-link"><</a></li>'
    }

    for (i = lmpi.startPage; i <= lmpi.endPage; i++) {
        pageStr += '<li class="page-item" onclick = "lectureMaterialsView(' + i + ', drowlectureMaterialsView, ' + "'" + category + "'" + ')"><a class="page-link page-color">' + i + '</a></li>'
    }
    if (lmpi.currentPage === lmpi.maxPage) {
        pageStr += '<li class="page-item disabled"><a class="page-link page-color" href="#">></a></li>'
    } else {
        pageStr += '<li class="page-item" onclick = "lectureMaterialsView(' + (lmpi.currentPage + 1) + ', drowlectureMaterialsView, ' + "'" + category + "'" + ')"><a class="page-link page-color" href="#">></a></li>'
    }



    if (res) {
        str += '<div class = "lectureMaterialsMenus">'
            + '<div class="lectureMaterials-title-cotainer">'
            + '<div class="lectureMaterials-title-cotainer2">'
            + '<div><h3 class="lectureMaterials-title-cotainer2-fontweight">강의자료실</h3></div>'
            + '<br><div class="lectureMaterials-hr"></div> <br>'
            + '</div>'
            + '</div>'
            + '<div class="lectureMaterials-Materials-cotainer">'
            + '<div class="lectureMaterials-search-container">'
            + '<div class="lectureMaterials-search-container2">'
            + '<form class="d-flex">'
            + '<select class="form-select form-select-sm" style="width: 80px;" id="specificSizeSelect">'
            + '<option value="1">제목</option>'
            + '<option value="2">내용</option>'
            + '</select>'
            + '<input class="form-control form-control-sm" type="search">'
            + '<button class="btn btn-outline-danger" type="submit"style="--bs-btn-padding-y: .5rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 0.5rem;">'
            + '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">'
            + '<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>'
            + '</svg>'
            + '</button>'
            + '</form>'
            + '</div>'
            + '</div>'
            + '<div class="lectureMaterials-Materials-cotainer2">'
            + '<table class="lectureMaterials-Materials-table">'
            + '<tr style="background-color: rgb(182, 37, 71); color: #ffffff; height : 50px;">'
            + '<th class="lectureMaterials-Materials-table-th2">번호</th>'
            + '<th class="lectureMaterials-Materials-table-title">제목</th>'
            + '<th class="lectureMaterials-Materials-table-th">등록일</th>'
            + '<th class="lectureMaterials-Materials-table-th3">첨부파일</th>'
            + '</tr>'
            + calistStr
            + '</table>'
            + '</div>'
            + '</div>'
            + '<div class="lectureMaterials-pazzing-container">'
            + '<div class="notice-pagenation">'
            + '<ul class="pagination">'
            + pageStr
            + '</ul>'
            + '</div>'
            + '</div>'
            + '</div>';
    }

    if (document.querySelector("#studyManagemetMenu").classList === "lessonPlan") {
        document.querySelector("#studyManagemetMenu").classList.remove('lessonPlan');
        document.querySelector("#studyManagemetMenu").classList.add('lectureMaterials');
    } else {
        document.querySelector("#studyManagemetMenu").classList.remove('right-student-container');
        document.querySelector("#studyManagemetMenu").classList.add('lectureMaterials');
    }

    document.querySelector("#studyManagemetMenu").innerHTML = str;
}

//강의자료실 리스트 뷰
function drowupdateBtnLessonPlanView(res) {
    const cp = res.cp;
    const list = res.list;
    const rlist = res.rlist;

    let headerStr = '<input type="hidden" value="' + cp.classNo + '" name="classNo">'

    document.querySelector("#modallptitle").innerHTML = headerStr;

    let bodyOneStr = '<span class="input-group-text"  for="classStartDate" id="basic-addon1">일시 : 시작일</span>'
        + '<input type="date" class="form-control" value="' + cp.classStartDate + '" name="classStartDate" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">'
        + '<span class="input-group-text"  for="classEndDate"  id="basic-addon1">종료일</span>'
        + '<input type="date" class="form-control" value="' + cp.classEndDate + '" name="classEndDate" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">';

    document.querySelector("#modalUpdatePlanDateInput").innerHTML = bodyOneStr;

    let bodyTwoStr = '<span class="input-group-text" for="classTitle" id="basic-addon1">개설반명</span>'
        + '<input type="text" class="form-control" value="' + cp.classTitle + '" name="classTitle" aria-label="Username" aria-describedby="basic-addon1">';

    document.querySelector("#modalclassTitleInput").innerHTML = bodyTwoStr;

    let bodyThree = '<span class="input-group-text" id="basic-addon1">강의실</span>'
        + '<select class="form-select form-select-sm" name="classRoomNo" aria-label=".form-select-sm example">';
    for (let r of rlist) {
        if (cp.classroomName === r.classroomName) {
            bodyThree += '<option selected value="' + r.classRoomNo + '">' + r.classroomName + '수용인원(' + r.classTotalNumber + '명)' + '</option>';
        } else {
            bodyThree += '<option value="' + r.classRoomNo + '">' + r.classroomName + '수용인원(' + r.classTotalNumber + '명)' + '</option>';
        }
    }

    bodyThree += '</select>';

    document.querySelector("#modalclassroomInput").innerHTML = bodyThree;

    let bodyFour = '';

    for (let i = 0; i < list.length; i++) {
        if (i == 0) {
            bodyFour += '<option selected value="' + list[i].classPlanNo + '">' + list[i].classWeek + '</option>'
        } else {
            bodyFour += '<option value="' + list[i].classPlanNo + '">' + list[i].classWeek + '</option>'
        }
    }

    document.querySelector("#modalclassWeekInput").innerHTML = bodyFour;

    let textareaStr = '<textarea style="height: 465px;" name = "classContent" class="form-control" aria-label="With textarea">' + list[0].classContent
        + '</textarea>'

    document.querySelector("#modalclassContentInput").innerHTML = textareaStr;

    document.querySelector("#modalclassWeekInput").onChange = function () {

        let textareaStr = '';
        for (let i = 0; i < list.length; i++) {
            if (this.value == i) {
                textareaStr += '<textarea style="height: 465px;" name ="classContent" class="form-control" aria-label="With textarea">' + list[i].classContent
                    + '</textarea>'
            }
        }

        document.querySelector("#modalclassContentInput").innerHTML = textareaStr;
    }
}

//학생관리 뷰
function drowstudentManagementView(res) {
    const studentList = res.studentList;
    const boardLimit = res.boardLimit;
    const pi = res.pi;
    const listCount = res.listCount;
    const classroomList = res.classroomList;
    let classroomStr = ""
    for (let classroom of classroomList) {
        classroomStr += '<option value="">' + classroom.classroomCategoryName + '</option>'
    }
    let studentStr = ""
    for (let student of studentList) {
        studentStr += '<tr class="student-tbody-tr">'
            + '<td style="padding: 8px 0px 8px 24px; width : 50px;">'
            + '<input class="student-tbody-tr-checkbox" value = "'+student.studentNo+'" type="checkbox" name="studentNo" id="">'
            + '</td>'
            + '<td style="padding: 8px 4px; width : 80px;">' + student.studentName + '</td>'
            + '<td style="padding: 8px 4px; width : 100px;">' + student.studentPhone + '</td>'
            + '<td style="padding: 8px 4px; width : 130px;">' + student.studentEmail + '</td>'
            + '<td style="padding: 8px 4px;">' + student.studentAddress + '</td>'
            + '<td style="padding: 8px 4px; width : 100px;">' + student.studentBirth + '</td>'
            + '<td style="padding: 8px 4px; width : 50px;">' + student.studentGender + '</td>'
            + '<td style="padding: 8px 4px; width : 150px;">' + student.studentMemo + '</td>'
            + '<td style="padding: 8px 4px; width : 80px;">' + student.classroomName + '</td>'
            + '<td style="padding: 8px 4px; width : 50px;">' + student.studentAttemdemce + '</td>'
            + '</tr>'
    }
    let boardLimitStr = "";

    if(boardLimit == 5){
        boardLimitStr = '<select onchange = "studentBoardLimit(this);" name="boardLimit" id="boardLimit" class="student-dataTables-length-select">'
                        + '<option selected value="5">5</option>'
                        + '<option value="10">10</option>'
                        + '<option value="15">15</option>'
                        + '<option value="20">20</option>'
                        + '</select>';
    }else if (boardLimit == 10){
        boardLimitStr = '<select onchange = "studentBoardLimit(this);" name="boardLimit" id="boardLimit" class="student-dataTables-length-select">'
                        + '<option value="5">5</option>'
                        + '<option selected value="10">10</option>'
                        + '<option value="15">15</option>'
                        + '<option value="20">20</option>'
                        + '</select>';
    }else if (boardLimit == 15){
        boardLimitStr = '<select onchange = "studentBoardLimit(this);" name="boardLimit" id="boardLimit" class="student-dataTables-length-select">'
                        + '<option value="5">5</option>'
                        + '<option value="10">10</option>'
                        + '<option selected value="15">15</option>'
                        + '<option value="20">20</option>'
                        + '</select>';
    }else{
        boardLimitStr = '<select onchange = "studentBoardLimit(this);" name="boardLimit" id="boardLimit" class="student-dataTables-length-select">'
                        + '<option value="5">5</option>'
                        + '<option value="10">10</option>'
                        + '<option value="15">15</option>'
                        + '<option selected value="20">20</option>'
                        + '</select>';
    }

    
    let pageStr = "";
    if (pi.currentPage === 1) {
        pageStr += '<li class="page-item disabled"><a class="page-link"><</a></li>'
    } else {
        pageStr += '<li class="page-item" onclick = "studentBoardLimitManagementView(' + (pi.currentPage - 1) + ', drowstudentManagementView, ' + boardLimit + ')"><a class="page-link"><</a></li>'
    }

    for (i = pi.startPage; i <= pi.endPage; i++) {
        pageStr += '<li class="page-item" onclick = "studentBoardLimitManagementView(' + i + ', drowstudentManagementView, '+ boardLimit +')"><a class="page-link page-color">' + i + '</a></li>'
    }
    if (pi.currentPage === pi.maxPage) {
        pageStr += '<li class="page-item disabled"><a class="page-link page-color" href="#">></a></li>'
    } else {
        pageStr += '<li class="page-item" onclick = "studentBoardLimitManagementView(' + (pi.currentPage + 1) + ', drowstudentManagementView, '+ boardLimit +')"><a class="page-link page-color">></a></li>'
    }
    let str = "";

    str += '<div class="student-header-container">'
        + '<h1>'
        + ' <span class="student-header-title">전체 주소록</span>'
        + '<span class="student-header-subtitle">' + '(총 ' + listCount + '명)</span>'
        + '</h1>'
        + '<div class="student-header-searchbar">'
        + '<div class="student-header-searchbar-container">'
        + '<select class="student-header-searchbar-select">'
        + '<option>이름</option>'
        + '<option>휴대폰</option>'
        + '<option>이메일</option>'
        + '<option selected>학생주소록</option>'
        + '</select>'
        + '<div class="student-header-searchbar-input1">'
        + ' <input class="student-header-searchbar-input" type="text">'
        + '</div>'
        + '<div class="student-header-searchbar-input-searchbtn">'
        + '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">'
        + '<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />'
        + '</svg>'
        + '</div>'
        + '</div>'
        + '</div>'
        + '</div>';

    str += '<div class="student-header-toolbar-container">'
        + '<ul class="student-header-toolbar-critical">'
        + '<li>'
        + ' <a onclick = "insertdisplaynone()" class="student-btn-tool">'
        + '<span class="student-btn-tool-icon"><ion-icon name="add-outline"></ion-icon></span>'
        + '<span>빠른 등록</span>'
        + '</a>'
        + '</li>'
        + '<li>'
        + '<a class="student-btn-tool">'
        + '<span class="student-btn-tool-icon"><ion-icon name="mail-outline"></ion-icon></span>'
        + '<span>메일 발송</span>'
        + '</a>'
        + '</li>'
        + '<li>'
        + '<a class="student-btn-tool">'
        + '<span class="student-btn-tool-icon"><ion-icon name="people-outline"></ion-icon></span>'
        + '<span>그룹 지정</span>'
        + '</a>'
        + '</li>'
        + '<li>'
        + '<a class="student-btn-tool">'
        + '<span class="student-btn-tool-icon"><ion-icon name="trash-outline"></ion-icon></span>'
        + '<span onclick="deleteStudent()">삭제</span>'
        + '</a>'
        + '</li>'
        + '</ul>'
        + '</div>';

    str += ' <form class="student-speed-regist">'
        + '<fieldset class="student-speed-regist-fleldset">'
        + '<div class="student-header-form-speed">'
        + '<input type="hidden" name = "classNo" id = "speedInputClassNo" value = "'+studentList[0].classNo +'">'
        + '<input type="text" placeholder="이름" id = "speedInputStudentName" name = "studentName" class="student-input student-speed-first">'
        + '<input type="text" placeholder="이메일" id = "speedInputStudentEmail" name = "studentEmail"  class="student-input">'
        + '<input type="text" placeholder="휴대폰"  id = "speedInputStudentPhone"  name = "studentPhone" class="student-input">'
        + '<div onclick = "speedStudentAdd();" class="student-speed-add-btn">'
        + '<ion-icon name="add-outline"></ion-icon>'
        + '</div>'
        + '<div class="student-speed-detail-add-btn">'
        + '<span>상세정보 추가</span>'
        + '</div>'
        + '</div>'
        + '</fieldset>'
        + '</form>';

    str += '<div class="student-header-toolbar-container">'
        + '<ul class="student-header-toolbar-critical ">'
        + '<li class="student-btn-tool2 student-on">'
        + '<span>전체</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + ' <span>ㄱ</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + '<span>ㄴ</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + '<span>ㄷ</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + '<span>ㄹ</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + '<span>ㅁ</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + '<span>ㅂ</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + '<span>ㅅ</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + '<span>ㅇ</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + '<span>ㅈ</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + '<span>ㅊ</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + '<span>ㅋ</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + '<span>ㅌ</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + '<span>ㅍ</span>'
        + '</li>'
        + '<li class="student-btn-tool2">'
        + '<span>ㅎ</span>'
        + '</li>'
        + '</ul>';

    str += '<div class="student-popup">'
        + '<div class="student-popup-optional">'
        + '<a class="student-btn-tool">'
        + '<span class="student-btn-tool-icon"><ion-icon name="funnel-outline"></ion-icon></span>'
        + '<span>필터</span>'
        + '</a>'
        + '</div>'
        + '<div class="student-dataTables-length">'
        + '<label>'
        + boardLimitStr
        + '</label>'
        + '</div>'
        + '</div>'
        + '</div>';
    str += '<div class="student-header-table-container" style="width:100%; height:800px; overflow:auto">'
        + '<table class="student-table">'
        + '<thead>'
        + '<tr class="student-thead-tr">'
        + '<th style="padding-left: 24px;"><input class="student-tbody-tr-allcheckbox" onclick = "studentAllClick(this);" type="checkbox"></th>'
        + '<th style="padding: 0px 4px;">이름</th>'
        + '<th style="padding: 0px 4px;">휴대폰</th>'
        + '<th style="padding: 0px 4px;">이메일</th>'
        + '<th style="padding: 0px 4px;">주소</th>'
        + '<th style="padding: 0px 4px;">생년월일</th>'
        + '<th style="padding: 0px 4px;">성별</th>'
        + '<th style="padding: 0px 4px;">메모</th>'
        + '<th>'
        + '<select name="" id="" size="1" class="student-dataTables-length-select">'
        + '<option selected>강의실</option>'
        + classroomStr
        + '</select>'
        + '</th>'
        + '<th style="padding: 0px 4px;">출결</th>'
        + '</tr>'
        + '</thead>'
        + '<tbody class="student-tbody">'
        + studentStr
        + '</tbody>'
        + '</table>'
        + '</div>';
    str += '<div class="student-pagenation">'
        + '<ul class="pagination">'
        + pageStr
        + '</ul>'
        + '</div>'

    if (document.querySelector("#studyManagemetMenu").classList === "lessonPlan") {
        document.querySelector("#studyManagemetMenu").classList.remove('lessonPlan');
        document.querySelector("#studyManagemetMenu").classList.add('right-student-container');
    } else {
        document.querySelector("#studyManagemetMenu").classList.remove('lectureMaterials');
        document.querySelector("#studyManagemetMenu").classList.add('right-student-container');
    }

    document.querySelector("#studyManagemetMenu").innerHTML = str;
}

function deleteStudent(){
    const checkBoxList = document.getElementsByClassName('student-tbody-tr-checkbox');
    let checkBoxtrueList = new Array();
    for (let checkBox of checkBoxList){
        if(checkBox.checked == true){
            checkBoxtrueList.push(checkBox.value)
        }
    }
    deletedStudent(checkBoxtrueList, drowstudentManagementView);
}

function studentAllClick(input){
    const checkBoxList = document.getElementsByClassName('student-tbody-tr-checkbox');
    for (let checkBox of checkBoxList){
        checkBox.checked = input.checked;
    }
}

function studentBoardLimit(selectLimit){
    console.log(selectLimit);
    studentBoardLimitManagementView(1, drowstudentManagementView, selectLimit.value)

}

function speedStudentAdd(){
    
    let classNo = document.querySelector("#speedInputClassNo").value;
    let className = document.querySelector("#speedInputStudentName").value;
    let classEmail = document.querySelector("#speedInputStudentEmail").value;
    let classPhone = document.querySelector("#speedInputStudentPhone").value;
    console.log(classNo)
    ajaxstudentaddManagementView(classNo, className, classEmail, classPhone, 1, drowstudentManagementView)
}
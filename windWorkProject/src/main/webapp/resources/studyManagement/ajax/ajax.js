//강의계획표 보여주기 
function lessonPlanView(czpage, drowlessonPlanView) {
    $.ajax({
        url: "ajaxlist.lp",
        data: {
            cpage: czpage
        },
        success: function (res) {
            console.log(res)
            drowlessonPlanView(res)
        },
        error: function () {
            console.log("lessonPlanView ajax 통신 실패")
        },
    })
}
//강의 계획표 수정 모달
document.querySelector("#studyManagementWriter").onclick = function () {
    $.ajax({
        url: "ajaxupdatePlanlist.lp",
        success: function (res) {
            console.log(res)
            drowupdateBtnLessonPlanView(res);
            alert("수정에 성공하셨습니다.");
        },
        error: function () {
            console.log("lessonPlanView ajax 통신 실패")
        },
    })
}


//자료실 보여주기
function lectureMaterialsView(czpage, drowlectureMaterialsView, category) {
    $.ajax({
        url: "ajaxlist.lm",
        data: {
            cpage: czpage,
            category: category
        },
        success: function (res) {
            console.log(res)
            drowlectureMaterialsView(res)
        },
        error: function () {
            console.log("lectureMaterialsView ajax 통신 실패")
        },
    })
}

//자료실 검색
function ajaxLectureMaterialsSearch(searchSelect, searchbarInput, drowstudentManagementView, czpage, category) {
    $.ajax({
        url: "ajaxLectureMaterialsSearch.lm",
        data: {
            searchSelect: searchSelect,
            searchbarInput: searchbarInput,
            cpage: czpage,
            category: category
        },
        success: function (res) {
            console.log(res)
            drowlectureMaterialsView(res)
        },
        error: function () {
            console.log("lectureMaterialsView ajax 통신 실패")
        },
    });
}

//학생 리스트 보여주기
function studentManagementView(czpage, drowstudentManagementView) {
    $.ajax({
        url: "ajaxSelectList.stm",
        data: {
            cpage: czpage
        },
        success: function (res) {
            console.log(res)
            drowstudentManagementView(res)
        },
        error: function () {
            console.log("studentManagementView ajax 통신 실패")
        },
    })
}


//학생 리스트 리미트 보여주기
function studentBoardLimitManagementView(czpage, drowstudentManagementView, selectLimit) {
    $.ajax({
        url: "ajaxSelectList.stm",
        data: {
            cpage: czpage,
            boardLimit: selectLimit
        },
        success: function (res) {
            console.log(res)
            drowstudentManagementView(res)
        },
        error: function () {
            console.log("studentManagementView ajax 통신 실패")
        },
    })
}

//학생 speed add 기능
function ajaxstudentaddManagementView(classNo, studentName, studentEmail, studentPhone, czpage, drowstudentManagementView) {
    $.ajax({
        url: "ajaxaddSelectList.stm",
        data: {
            classNo: classNo,
            studentName: studentName,
            studentEmail: studentEmail,
            studentPhone: studentPhone,
            cpage: czpage
        },
        success: function (res) {
            alert("추가 완료");
            drowstudentManagementView(res)
        },
        error: function () {
            console.log("studentManagementView add ajax 통신 실패")
        },
    })
}

//학생초성으로 검색
function ajaxStudentSelectInutialManagement(minUnicodeNum, maxUnicodeNum, classNo, czpage, drowstudentManagementView, boardLimit) {
    $.ajax({
        url: "ajaxInutialSelectList.stm",
        data: {
            classNo: classNo,
            minUnicodeNum: minUnicodeNum,
            maxUnicodeNum: maxUnicodeNum,
            boardLimit: boardLimit,
            cpage: czpage
        },
        success: function (res) {
            drowstudentManagementView(res)
        },
        error: function () {
            console.log("ajaxInutialSelectList add ajax 통신 실패")
        },
    })
}

//학생검색어로 검색
function ajaxSelectSerachStudent(searchSelect, searchbarInput, czpage, classNo, drowstudentManagementView, boardLimit) {
    $.ajax({
        url: "ajaxSelectSerachStudent.stm",
        data: {
            classNo: classNo,
            searchSelect: searchSelect,
            searchbarInput: searchbarInput,
            boardLimit: boardLimit,
            cpage: czpage
        },
        success: function (res) {
            drowstudentManagementView(res)
        },
        error: function () {
            console.log("ajaxInutialSelectList add ajax 통신 실패")
        },
    })
}

//학생 삭제
function deletedStudent(checkBoxtrueList, drowstudentManagementView) {
    $.ajax({
        url: "deleted.stm",
        data: {
            studentNoList: checkBoxtrueList
        },
        success: function (res) {
            drowstudentManagementView(res)
            alert("삭제 완료");
        },
        error: function () {
            console.log("studentManagementView ajax 통신 실패")
        },
    })
}

//강의자료실 즐겨찾기
function ajaxLikeAddSelect(classNo, empNo) {
    $.ajax({
        url: "ajaxLikeAddSelect,lm",
        data: {
            studentNoList: checkBoxtrueList
        },
        success: function (res) {
            alert("즐겨찾기 완료");

        },
        error: function () {
            console.log("ajaxLikeAddSelect ajax 통신 실패")
        },
    })
}

//강의자료실 즐겨찾기 삭제

//강의자료실 즐겨찾기
function ajaxLikeDeleteSelect(classNo, empNo) {
    $.ajax({
        url: "ajaxLikeDeleteSelect.lm",
        data: {
            studentNoList: checkBoxtrueList
        },
        success: function (res) {
            alert("즐겨찾기 삭제");
        },
        error: function () {
            console.log("ajaxLikeDeleteSelect ajax 통신 실패")
        },
    })
}
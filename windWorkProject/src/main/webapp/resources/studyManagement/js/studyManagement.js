function changeClass(selectedDiv, category) {
    lectureMaterialsView(1, drowlectureMaterialsView, category);
    // 모든 메뉴에서 'studyManagementMenus-class-menu-click' 클래스를 제거
    let menuButtons = document.querySelectorAll('.studyManagementMenus-class-menu-btn');
    for (let i = 0; i < menuButtons.length; i++) {
        menuButtons[i].classList.remove('studyManagementMenus-class-menu-click');
    }
    console.log(category);
    // 선택된 메뉴에 'studyManagementMenus-class-menu-click' 클래스를 추가
    selectedDiv.classList.add('studyManagementMenus-class-menu-click');


}

function changeMenu(selectedDiv, cpage, loginUserEmpNo) {
    let menustr = '<div class="studyManagementMenus-class-menu-btn studyManagementMenus-class-menu-click" onclick="changeClass(this,  ' + "'자바'" + ')">자바</div>'
        + '<div class="studyManagementMenus-class-menu-btn" onclick="changeClass(this, ' + "'데이터베이스'" + ')">데이터베이스</div>'
        + '<div class="studyManagementMenus-class-menu-btn" onclick="changeClass(this,   ' + "'파이썬'" + ')">파이썬</div>'
        + ' <div class="studyManagementMenus-class-menu-btn" onclick="changeClass(this,  ' + "'자바스크립트'" + ')">자바스크립트</div>'
        + '<div class="studyManagementMenus-class-menu-btn" onclick="changeClass(this, ' + "'즐겨찾기'" + ')">즐겨찾기</div>';
    let menuTitlestr = '<h5>자료실</h5>';
    if (selectedDiv.value === "lessonPlan") {
        lessonPlanView(cpage, drowlessonPlanView);
        lessonPlanCss();

    } else if (selectedDiv.value === "lectureMaterials") {
        lectureMaterialsView(cpage, drowlectureMaterialsView, "자바");
        lectureMaterialsCss(loginUserEmpNo, menustr, menuTitlestr);

    } else if (selectedDiv.value === "studentManagement") {
        studentManagementView(cpage, drowstudentManagementView);
        studentManagementCss(loginUserEmpNo);
    }
}

function lessonPlanCss() {
    document.querySelector("#studyManagementMenus-header").innerText = "강의계획표";
    document.querySelector(".studyManagementMenus-class-menuTitle").innerHTML = "";
    document.querySelector(".studyManagementMenus-class-menu").innerHTML = "";
    document.querySelector("#studyManagementWriter").value = "수정하기";
    //클릭시 업데이트
    document.querySelector("#studyManagementWriter").onclick = function () {
        $.ajax({
            url: "ajaxupdatePlanlist.lp",
            success: function (res) {
                console.log(res)
                drowupdateBtnLessonPlanView(res);
            },
            error: function () {
                console.log("lessonPlanView ajax 통신 실패")
            },
        })
    }
    document.querySelector("#studyManagementWriter").setAttribute('data-bs-toggle', 'modal');
    document.querySelector("#studyManagementWriter").setAttribute('data-bs-target', '#staticBackdrop');

}

function lectureMaterialsCss(loginUserEmpNo, menustr, menuTitlestr) {
    document.querySelector("#studyManagementMenus-header").innerText = "강의자료실";
    document.querySelector(".studyManagementMenus-class-menuTitle").innerHTML = menuTitlestr;
    document.querySelector(".studyManagementMenus-class-menu").innerHTML = menustr;
    document.querySelector("#studyManagementWriter").value = "자료 등록";

    document.querySelector("#studyManagementWriter").removeAttribute('data-bs-toggle');
    document.querySelector("#studyManagementWriter").removeAttribute('data-bs-target');

    document.querySelector("#studyManagementWriter").onclick = function () {
        location.href = 'createForm.lm?empNo=' + loginUserEmpNo;
    }
}

function studentManagementCss(loginUserEmpNo) {
    document.querySelector("#studyManagementMenus-header").innerText = "학생관리";
    document.querySelector(".studyManagementMenus-class-menuTitle").innerHTML = "";
    document.querySelector(".studyManagementMenus-class-menu").innerHTML = "";
    document.querySelector("#studyManagementWriter").value = "학생 추가";
    document.querySelector("#studyManagementWriter").removeAttribute('data-bs-toggle');
    document.querySelector("#studyManagementWriter").removeAttribute('data-bs-target');

    document.querySelector("#studyManagementWriter").onclick = function () {
        location.href = 'insertFormView.stm'
    }
}

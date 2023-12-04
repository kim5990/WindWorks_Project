function changeClass(selectedDiv) {
    // 모든 메뉴에서 'studyManagementMenus-class-menu-click' 클래스를 제거
    let menuButtons = document.querySelectorAll('.studyManagementMenus-class-menu-btn');
    for (let i = 0; i < menuButtons.length; i++) {
        menuButtons[i].classList.remove('studyManagementMenus-class-menu-click');
    }

    // 선택된 메뉴에 'studyManagementMenus-class-menu-click' 클래스를 추가
    selectedDiv.classList.add('studyManagementMenus-class-menu-click');
}

function changeMenu(selectedDiv) {
    if (selectedDiv.value === "lessonPlan") {
        document.querySelector("#studyManagementMenus-header").innerText = "강의계획표";
        document.querySelector("#studyManagementWriter").value = "수정하기";
        document.querySelector("#studyManagementWriter").setAttribute('data-bs-toggle', 'modal');
        document.querySelector("#studyManagementWriter").setAttribute('data-bs-target', '#staticBackdrop');
    } else if (selectedDiv.value === "lectureMaterials") {
        document.querySelector("#studyManagementMenus-header").innerText = "강의자료실";
        document.querySelector("#studyManagementWriter").value = "자료 등록";
        document.querySelector("#studyManagementWriter").removeAttribute('data-bs-toggle');
        document.querySelector("#studyManagementWriter").removeAttribute('data-bs-target');
    } else if (selectedDiv.value === "studentManagement") {
        document.querySelector("#studyManagementMenus-header").innerText = "학생관리";
        document.querySelector("#studyManagementWriter").value = "학생 추가";
        document.querySelector("#studyManagementWriter").removeAttribute('data-bs-toggle');
        document.querySelector("#studyManagementWriter").removeAttribute('data-bs-target');
    }
}
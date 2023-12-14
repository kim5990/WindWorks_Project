const mainOnload = function () {
    document.querySelector("#nav-home-bar").classList.add('active');
    document.querySelector("#navbar").style.background = 'rgb(85, 175, 130)';
    

}

const lessonOnload = function () {
    document.querySelector("#nav-studyM-bar").classList.add('active');
    document.querySelector("#navbar").style.background = '#B62547';
    document.querySelector(".active").style.background = 'white';
    document.querySelector(".active").style.color = '#B62547';

    document.querySelector(".right-section-bell").style.background = '#B62547';
    document.querySelector(".right-section-bell").style.border = '1px solid #B62547';
    document.querySelector(".right-section-person").style.background = '#B62547';
    document.querySelector(".right-section-person").style.border = '1px solid #B62547';
}

const lectureMaterialsDetailOnload = function () {
    document.querySelector("#nav-studyM-bar").classList.add('active');
    document.querySelector("#navbar").style.background = '#B62547';
    document.querySelector(".active").style.background = 'white';
    document.querySelector(".active").style.color = '#B62547';

    document.querySelector(".right-section-bell").style.background = '#B62547';
    document.querySelector(".right-section-bell").style.border = '1px solid #B62547';
    document.querySelector(".right-section-person").style.background = '#B62547';
    document.querySelector(".right-section-person").style.border = '1px solid #B62547';

    $("#studyManagementMenus-id").val("lectureMaterials").prop("selected", true);

    document.querySelector("#studyManagementMenus-header").innerHTML = "강의상세내용"
    document.querySelector("#studyManagementWriter").value = "이전으로"
    document.querySelector("#studyManagementWriter").onclick = function () {
        history.back();
    }

}
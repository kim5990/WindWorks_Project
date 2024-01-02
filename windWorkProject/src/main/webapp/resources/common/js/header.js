function stopEvent(ev) {
    ev.preventDefault()
    ev.stopImmediatePropagation()
    ev.stopPropagation()
}

function logout() {
    location.href = "logout.em";
    swal("", "로그아웃 성공", "success");
}

function myPageForm() {
    location.href = "myPageForm.em";
}
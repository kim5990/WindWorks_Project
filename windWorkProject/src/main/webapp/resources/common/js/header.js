function stopEvent(ev) {
    ev.preventDefault()
    ev.stopImmediatePropagation()
    ev.stopPropagation()
}

function logout(){
    location.href = "logout.em";
}

function myPageForm(){
    location.href = "myPageForm.em";
}
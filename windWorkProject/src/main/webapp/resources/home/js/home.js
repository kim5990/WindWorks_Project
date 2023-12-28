

const loginUser = {

}


// 채팅페이지로 이동
function chattingList() {
    location.href = "list.ch";
}

// 미확인 채팅 카운트
function noReadChatCount() {
    $.ajax({
        url: "noReadChatCount.ch",
        data: {
            empNo: loginUser.empNo
        },
        success: function (res) {
            document.querySelector(".profile-inform-chat-2").innerHTML = res;
        },
        error: function () {
            console.log("실패");
        }
    });
}







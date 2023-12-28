const loginUser = {

}
console.log(2)
// 첫실행시 세팅
homeOnload = function(empNo){
    console.log(empNo)
    console.log(loginUser.empNo);
    noReadChatCount();
}


// 채팅페이지로 이동
function chattingList(){
    location.href = "list.ch";
}

// 미확인 채팅 카운트
function noReadChatCount(){
    
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







//취소버튼 누르면 모달창 끄기
function executeCloseButton2() {
    var closeButton = document.getElementById("close-btn2");
    closeButton.click();
}
//수정버튼 누르면 수정모달에 사원 정보 띄우기
function empInformation(eNo, eName,eEmail,ePhone,eAge,eEnrollDate) {

    let str = '<input type="hidden" name="empNo" value="'+ eNo +'">'
            +'<tr><th>이름</th><td>'+ eName +'</td></tr>'
            +'<tr><th>이메일</th><td>' + eEmail +'</td></tr>'
            +'<tr><th>연락처</th><td>' + ePhone + '</td></tr>'
            +'<tr><th>생년월일</th><td>' + eAge + '</td></tr>'
            +'<tr><th>입사일</th><td>' + eEnrollDate + '</td></tr>'
            +'<tr><th>부서</th><td><select name="deptCode" id="group"><option value="D1">영업팀</option><option value="D2">회계팀</option><option value="D3">총무팀</option><option value="D4">인사팀</option><option value="D5">강사팀</option></select></td></tr>'
            +'<tr><th>직급</th><td><select name="jobCode" id="grade"><option value="J1">사장</option><option value="J2">부장</option><option value="J3">차장</option><option value="J4">과장</option><option value="J5">대리</option><option value="J6">사원</option><option value="J7">강사</option><option value="J0">병아리</option></select></td></tr>'
            +'<tr><th>상태</th><td><select name="empStatus" id="status"><option value="1">재직</option><option value="2">퇴직</option></select></td></tr>';
            
      document.getElementById('updateModaltable').innerHTML = str;
}

//사번 th클릭시 번호순 정렬
function sortEnoTable(number,sorting,condition){
    let s = sorting;
    let c = condition;

    if(s == 'desc'){
        s = 'asc';
    } else {
        s = 'desc';
    }

    if(c != 'empNo'){
        c = 'empNo';
    }

    window.location.href = "approval.em?condition=" + c + "&sorting=" + s + "&cpage="+number;
}
//부서 th클릭시 번호순 정렬
function sortDeptCodeTable(number,sorting,condition){
    let s = sorting;
    let c = condition;

    if(s == 'desc'){
        s = 'asc';
    } else {
        s = 'desc';
    }

    if(c != 'deptCode'){
        c = 'deptCode';
    }

    window.location.href = "approval.em?condition=" + c + "&sorting=" + s + "&cpage="+number;
}
//직급 th클릭시 번호순 정렬
function sortJobCodeTable(number,sorting,condition){
    let s = sorting;
    let c = condition;

    if(s == 'desc'){
        s = 'asc';
    } else {
        s = 'desc';
    }

    if(c != 'jobCode'){
        c = 'jobCode';
    }
    window.location.href = "approval.em?condition=" + c + "&sorting=" + s + "&cpage="+number;
}
//상태 th클릭시 번호순 정렬
function sortStatusTable(number,sorting,condition){
    let s = sorting;
    let c = condition;

    if(s == 'desc'){
        s = 'asc';
    } else {
        s = 'desc';
    }

    if(c != 'empStatus'){
        c = 'empStatus';
    }
    window.location.href = "approval.em?condition=" + c + "&sorting=" + s + "&cpage="+number;
}

//키워드 검색
function searchKeyword(number){
    let keyword = document.getElementById("personManage_search").value;
    window.location.href = "approval.em?keyword="+keyword+"&cpage="+number;
}
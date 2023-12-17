

insertEmpFormOnload = function(){
    // 아이디의 유효성 여부 검사
    let isNameValid = false;
    document.querySelector("#nameInput").addEventListener("input", function () {
        // 1. 입력한 value 값을 가져옴
        let inputName = this.value;

        // 2. 유효성(입력했는지)를 검사
        isNameValid = inputName.length > 0;
        if (isNameValid) {
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");
        } else {
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");
        }
    });

    //이메일 유효성 여부 검사
    let isEmailValid = false;
    document.querySelector("#emailInput").addEventListener("input", function () {
        // 1. 입력한 value 값을 가져옴
        let inputEmail = this.value;

        // 2. 유효성(입력했는지)를 검사
        isEmailValid = inputEmail.length > 5;
        if (isEmailValid) {
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");
        } else {
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");
        }
    });
    //이메일도메일 유효성 여부 검사
    let isEmailDomainValid = false;
    document.querySelector("#emailDomain").addEventListener("input", function () {
        // 1. 입력한 value 값을 가져옴
        let inputDomain = this.value;

        // 2. 유효성(입력했는지)를 검사
        isEmailDomainValid = inputDomain.length > 0;
        if (isEmailDomainValid) {
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");
        } else {
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");
        }
    });

    //비밀번호 유효성 여부 검사 함수
    function chkPW(password) {
        // 1. 입력한 value 값을 가져옴
        let inputPassword = password;
        //2. 글자 특수문자 혼합
        let num = inputPassword.search(/[0-9]/g);
        let eng = inputPassword.search(/[a-z]/ig);
        let spe = inputPassword.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

        if (inputPassword.length < 8 || inputPassword.length > 20) {
            document.querySelector("#password-invalid").innerHTML = "8자리 ~ 20자리 이내로 입력해주세요.";
            return false;
        } else if (inputPassword.search(/\s/) != -1) {
            document.querySelector("#password-invalid").innerHTML = "비밀번호는 공백 없이 입력해주세요.";
            return false;
        } else if (num < 0 || eng < 0 || spe < 0) {
            document.querySelector("#password-invalid").innerHTML = "영문,숫자, 특수문자를 혼합하여 입력해주세요.";
            return false;
        } else {
            return true;
        }

    }
    let isPasswordValid = false;
    //비밀번호 유효성 여부 검사
    document.querySelector("#inputPassword").addEventListener("input", function () {
        // 2. 유효성(비밀번호 검사 함수 실행)를 검사
        if (chkPW(this.value)) {
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");
            isPasswordValid = true;
        } else {
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");
            isPasswordValid = false;
        }
    });

    //비밀번호 체크 유효성 여부 검사
    let isPasswordCheclValid = false;
    document.querySelector("#inputPasswordCheck").addEventListener("input", function () {
        // 1. 입력한 value 값을 가져옴
        let inputPassword = document.querySelector("#inputPassword").value;
        let inputDomain = this.value;
        // 2. 유효성(입력했는지)를 검사
        isPasswordCheclValid = inputPassword === inputDomain && inputDomain.length > 0;
        if (isPasswordCheclValid) {
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");
        } else {
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");
        }
    });

    //폰번호 유효성 여부 검사
    let isPhoneValid = false;
    document.querySelector("#phoneInput").addEventListener("input", function () {
        // 1. 입력한 value 값을 가져옴
        let inputPhone = this.value;

        let numericValue = inputPhone.replace(/\D/g, '');

        this.value = numericValue;
        isPhoneValid = this.value.length >= 9 && this.value.length <= 11;
        // 2. 유효성(입력했는지)를 검사
        if (isPhoneValid) {
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");
        } else {
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");
        }
    });

    //생년월일 유효성 여부 검사
    let isDateValid = false;
    document.getElementById("dateInput").addEventListener("input", function () {
        // 입력한 value 값을 가져옴
        let inputDate = this.value;
        let dateRegex = /^\d{4}-\d{2}-\d{2}$/;
        // 유효성(입력했는지)를 검사
        isDateValid = dateRegex.test(inputDate);

        if (isDateValid) {
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");
        } else {
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");
        }
    });

    //폼에 submit 이벤트가 일어 났을때 실행할 함수 등록
    document.querySelector("#signupForm").addEventListener("submit", function (e) {
        //만일 폼이 유효하지 않는다면 전송을 막아주기
        if (!isNameValid || !isEmailValid || !isPasswordValid || !isPasswordCheclValid || !isPhoneValid || !isDateValid) {
            //이벤트 객체의 함수를 이용해서 폼 전송 막아주기
            alert("작성해주세요");
            e.preventDefault();
        }
    })
}



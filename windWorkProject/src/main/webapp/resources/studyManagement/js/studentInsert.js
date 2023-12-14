function profileImageChange(input){
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function(e) {
          document.getElementById('profile-img-tag').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
      } else {
        document.getElementById('profile-img-tag').src = "./resources/common/images/person.png";
      }
}
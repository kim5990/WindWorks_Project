function profileMemberInsertbox(){
    document.querySelector('#profileMemberInsert').click();
}

function readURL(input, url){
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function(e) {
          document.getElementById('profilePreview').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
      } else {
        document.getElementById('profilePreview').src = url;
      }
}
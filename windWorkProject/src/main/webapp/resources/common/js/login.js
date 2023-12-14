$(document).ready(function(){
	var key = getCookie("idChk"); //user1
	if(key!=""){
		$("#username").val(key); 
	}
	 
	if($("#username").val() != ""){ 
		$("#flexCheckDefault").attr("checked", true); 
	}
	 
	$("#flexCheckDefault").change(function(){ 
		if($("#flexCheckDefault").is(":checked")){ 
			setCookie("idChk", $("#username").val(), 7); 
		}else{ 
			deleteCookie("idChk");
		}
	});
	 
	$("#username").keyup(function(){ 
		if($("#flexCheckDefault").is(":checked")){
			setCookie("idChk", $("#username").val(), 7); 
		}
	});
});
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
	 
function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if(start != -1){
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1)end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}
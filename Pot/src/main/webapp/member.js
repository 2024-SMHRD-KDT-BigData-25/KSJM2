/**
 * 
 */

function idCheck(){
	
	if (document.frm.id.value==""){
		alert('아이디를 입력하여 주십시오.');
		document.frm.id.focus();
		return;
	}
	
	var url="idCheckCon?id=" + document.frm.id.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}

function idok() {
	opener.document.frm.id.value=document.frm.id.value;
	opener.document.frm.reid.value=document.frm.id.value;
	self.close();
	
}

function joinCheck() {
	
	if(document.frm.id.value.length == 0){
		alert("아이디를 입력해 주세요")
		frm.id.focus();
		return false;
	}
	
	if(document.frm.pw.value.length == 0){
		alert("비밀번호를 입력해 주세요")
		frm.pw.focus();
		return false;
	}
	
	if(document.frm.name.value.length == 0){
		alert("이름을 입력해 주세요.")
		frm.name.focus();
		return false;
	}
	
	if(document.frm.nick.value.length == 0){
		alert("닉네임을 입력해 주세요")
		frm.nick.focus();
		return false;
	}
	
	if(document.frm.phone.value.length == 0){
		alert("연락처를 입력해 주세요")
		frm.phone.focus();
		return false;
	}
	
	if(document.frm.postcode.value.length == 0){
		alert("우편번호를 입력해 주세요")
		frm.postcode.focus();
		return false;
	}
	
	if(document.frm.reid.value.length == 0){
		alert("아이디 중복 체크를 하지 않았습니다.")
		frm.id.focus();
		return false;
	}
	return true;
}




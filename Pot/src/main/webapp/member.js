/**
 * 
 */

function idCheck(){
	
	if (document.frm.user_id.value==""){
		alert('아이디를 입력하여 주십시오.');
		document.frm.user_id.focus();
		return;
	}
	
	var url="idCheckCon?user_id=" + document.frm.user_id.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}

function idok() {
	opener.document.frm.user_id.value=document.frm.user_id.value;
	opener.document.frm.reid.value=document.frm.user_id.value;
	self.close();
	
}

function joinCheck() {
	
	if(document.frm.user_id.value.length == 0){
		alert("아이디를 입력해 주세요")
		frm.user_id.focus();
		return false;
	}
	
	if(document.frm.user_pw.value.length == 0){
		alert("비밀번호를 입력해 주세요")
		frm.user_pw.focus();
		return false;
	}
	
	if(document.frm.user_name.value.length == 0){
		alert("이름을 입력해 주세요.")
		frm.user_name.focus();
		return false;
	}
	
	if(document.frm.user_nick.value.length == 0){
		alert("닉네임을 입력해 주세요")
		frm.user_nick.focus();
		return false;
	}
	
	if(document.frm.user_phone.value.length == 0){
		alert("연락처를 입력해 주세요")
		frm.user_phone.focus();
		return false;
	}
	
	if(document.frm.user_post.value.length == 0){
		alert("우편번호를 입력해 주세요")
		frm.user_post.focus();
		return false;
	}
	
	if(document.frm.reid.value.length == 0){
		alert("아이디 중복 체크를 하지 않았습니다.")
		frm.user_id.focus();
		return false;
	}
	return true;
}

function confirm() {
    const popup = window.open('confirm.html', 'confirmPopup', 'width=400,height=200');
}

// 물품등록 확인
function salecheck(){
	
	if(document.frm.sale_category.value.length == 0){
		alert("카테고리를 선택해 주세요")
		frm.sale_category.focus();
		return false;
	}
	
	if(document.frm.sale_title.value.length == 0){
		alert("상품명을 입력해 주세요")
		frm.sale_title.focus();
		return false;
	}
	
	if(document.frm.sale_price.value.length == 0){
		alert("가격을 입력해 주세요")
		frm.sale_price.focus();
		return false;
	}
	
	var fileInput = document.getElementById("img");

	// 파일이 선택되었는지 확인
    if (fileInput.files.length === 0) {
    	alert("파일을 선택해 주세요!");
    	document.getElementById('img').focus();
    	return false;
    }
	 
	if(document.frm.sale_content.value.length == 0){
    	alert("내용을 입력해 주세요")
    	frm.sale_content.focus();
    	return false;
    }
	
	return true;
}
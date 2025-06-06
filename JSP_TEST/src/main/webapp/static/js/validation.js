/**
 *  유효성 검사 
 */
function checkProduct() {
	let form = document.product
	let productId = form.productId
	let name = form.name
	let unitPrice = form.unitPrice
	let unitsInStock = form.unitsInStock
	
	let msg = ''
	
	// 상품아이디 체크
	// - P숫자 6자리
	let productIdCheck = /^P[0-9]{6}$/
	msg = '상품 아이디는 "P6자리" 로 입력해주세요' 
	if( !check(productIdCheck, productId, msg) ) return false
	
	// 상품명 체크
	// - 2글자 이상 20글자 이하
	let nameCheck = /^.{2,20}$/
	msg = '상품명은 2~20자 이내로 입력해주세요'
	if( !check(nameCheck, name, msg) ) return false
	
	// 가격 체크
	// - 숫자로 1글자 이상
	let priceCheck = /^\d{1,}$/
	msg = '가격은 1글자 이상의 숫자로 입력해주세요'
	if( !check(priceCheck, unitPrice, msg) ) return false
	
	// 재고 체크
	// - 숫자로 1글자 이상
	let stockCheck = /^\d{1,}$/
	msg = '재고는 1글자 이상의 숫자로 입력해주세요'
	if( !check(stockCheck, unitsInStock, msg) ) return false
	
	return true
}



function checkJoin() {
	let form = document.joinForm;

	let id = form.id;
	let password = form.password;
	let pw_confirm = form.pw_confirm; 
	let name = form.name;


	let msg = '';
	let idCheck = /^[a-zA-Z가-힣][a-zA-Z가-힣0-9]{1,19}$/;
	msg = '아이디는 첫글자는 영문자 또는 한글만 가능합니다. (영문자, 한글, 숫자 조합 가능)';
	if (!check(idCheck, id, msg)) return false;

	let passwordCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
	msg = '비밀번호는 영문, 숫자, 특수문자를 포함해 8자 이상이어야 합니다.';
	if (!check(passwordCheck, password, msg)) return false;
	
	if (password.value !== pw_confirm.value) {
			alert("비밀번호가 일치하지 않습니다.");
			pw_confirm.select();
			pw_confirm.focus();
			return false;
		}

	
	let nameCheck = /^[가-힣]*$/
	msg = '이름은 한글만 가능합니다..';
	if (!check(nameCheck, name, msg)) return false;

	return true; 
}

// 정규표현식 유효성 검사 함수
function check(regExp, element, msg) {
	
	if( regExp.test(element.value) ) {
		return true
	}
	alert(msg)
	element.select()
	element.focus()
	return false
}
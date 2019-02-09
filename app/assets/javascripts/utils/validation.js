var inputClass;
var activeClass;

function setValidateStyles(inputFieldClass, activeMsgClass) {
	inputClass = inputFieldClass;
	activeClass = activeMsgClass;
}

function invalidInput(inputElement, spanElement) {
	inputElement.classList.add(inputClass);
	spanElement.classList.add(activeClass);
}

function inputFilled(inputElement) {
	// Validates not blank.
	return Boolean(inputElement.value.trim());
}

function selectFilled(selectElement) {
	return Boolean(selectElement.selectedIndex);
}

function validCompleteName(completeName) {
	let expression = /^[a-z]{2,}(?:\s+[a-z]+\.?)*\s+[a-z]{2,}\.?(?:\s+[a-z]+\.?)*$/i;
	return expression.test(completeName);
}

function validEmail(email) {
	const expression = /(?!.*\.{2})^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
	return expression.test(email);
}

function validPassword(password) {
	const minPasswordLength = 8;
	return password.length >= minPasswordLength;	
}

function clearErrorStyles() {
	var isDangerElements = Array.from(document.getElementsByClassName(inputClass));
	var errorActiveElemeents = Array.from(document.getElementsByClassName(activeClass));

	for(let element of isDangerElements) {
		element.classList.remove(inputClass);
	}

	for(let element of errorActiveElemeents) {
		element.classList.remove(activeClass);
	}
}

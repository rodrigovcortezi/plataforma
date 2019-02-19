var html = document.querySelector('html');
var modal = document.getElementById('new-offer-modal');
var table = document.getElementById('offers-table');
var prototypeRow = table.querySelector('.prototype-row');
var updateRow;
var hiddenFields = document.querySelector('.hidden-fields');
var offerFieldsPrototype;

var offerCount;

var oldOfferFields;

init();

function init() {
	offerCount = table.tBodies[0].rows.length - 1;
	if(offerCount == 0) {
		table.style.display = 'none';
	}
	offerFieldsPrototype = hiddenFields.querySelector('.empty-fields');
	hiddenFields.querySelector('.empty-fields').remove();

	setEventsHandlers();
}

function setEventsHandlers() {
	var file = document.getElementById("event_image");
	// 1. Image file input handler
	file.onchange = function(){
	    if(file.files.length > 0)
	    {
			document.getElementById('filename').innerHTML = file.files[0].name;
	    }
	};


	var addOfferButton = document.getElementById('offer-button');
	var modalForm = modal.querySelector('.modal-form');
	// 2. Add offer button handler
	addOfferButton.addEventListener('click', function(e) {
		var newOffer = newOfferFields();
		modalForm.appendChild(newOffer);
		showModal();
	});

	var modalBackground = modal.querySelector('.modal-background');
	// 3. Modal background click handler
	modalBackground.addEventListener('click', function(e) {
		var offer = modal.querySelector('.empty-fields');
		if(offer.id) {
			// Update
			oldOfferFields.id = offer.id;
			oldOfferFields = null;
		}
		offer.remove();
		closeModal();
	});

	var closeButton = modal.querySelector('.delete');
	// 4. Close modal button handler
	closeButton.addEventListener('click', function(e) {
		var offer = modal.querySelector('.empty-fields');
		if(offer.id) {
			// Update
			oldOfferFields.id = offer.id;
			oldOfferFields = null;
		}
		offer.remove();
		closeModal();
	});

	var cancelButton = document.getElementById('cancel-button');
	// 5. Cancel offer creation button click handler
	cancelButton.addEventListener('click', function(e) {
		var offer = modal.querySelector('.empty-fields');
		if(offer.id) {
			// Update
			oldOfferFields.id = offer.id;
			oldOfferFields = null;
		}
		offer.remove();
		closeModal();
	});

	var newOfferButton = document.getElementById('create-offer-button');
	// 6. New offer button handler
	newOfferButton.addEventListener('click', function(e) {
		offerCount += 1;
		var nameInput = modal.querySelector('.name-input');
		var priceInput = modal.querySelector('.price-input');
		var quantityInput = modal.querySelector('.quantity-input');

		var offer = modal.querySelector('.empty-fields');

		if(offer.id) {
			// Update
			updateOfferRow(nameInput.value, priceInput.value, quantityInput.value);
			updateRow = null;
			oldOfferFields.remove();
			oldOfferFields = null;
		} else {
			// Create
			addOfferRow(nameInput.value, priceInput.value, quantityInput.value);
			offer.id = "new_offer_" + offerCount;
		}

		offer.classList.remove('empty-fields');
		offer.classList.add('offer-fields');
		offer.remove();
		hiddenFields.appendChild(offer);

		closeModal();
	});

	// 7. Edit offer buttons handler
	for(let row of Array.from(table.tBodies[0].rows).slice(1)) {
		let editButton = row.querySelector('a');
		editButton.addEventListener('click', function(e) {
			oldOfferFields = document.getElementById(this.dataset.target);
			var updateOfferFields = oldOfferFields.cloneNode(true);
			updateOfferFields.classList.remove('offer-fields');
			updateOfferFields.classList.add('empty-fields');
			oldOfferFields.id = "";
			modalForm.appendChild(updateOfferFields);
			updateRow = this.closest('tr');
			showModal();
		});
	}
}

function showModal() {
	modal.classList.add('is-active');
	html.classList.add('is-clipped');
}

function closeModal() {
	modal.classList.remove('is-active');
	html.classList.remove('is-clipped');
}

function newOfferFields() {
	var offerFields = offerFieldsPrototype.cloneNode(true);

	var fields = offerFields.querySelectorAll('input, textarea');
	for(let field of fields) {
		field.name = field.name.replace(/\[\d\]/, '[' + offerCount + ']');
	}

	return offerFields;
}

function updateOfferRow(name, price, quantity) {
	var nameCell = updateRow.querySelector('.name-cell');
	var priceCell = updateRow.querySelector('.price-cell');
	var quantityCell = updateRow.querySelector('.quantity-cell');
	var editButton = updateRow.querySelector('a');
	nameCell.innerText = name;
	priceCell.innerText = price;
	quantityCell.innerText = quantity;
}

function addOfferRow(name, price, quantity) {
	var newRow = prototypeRow.cloneNode(true);
	var nameCell = newRow.querySelector('.name-cell');
	var priceCell = newRow.querySelector('.price-cell');
	var quantityCell = newRow.querySelector('.quantity-cell');
	var editButton = newRow.querySelector('a');
	newRow.classList.remove('prototype-row');
	nameCell.innerText = name;
	priceCell.innerText = price;
	quantityCell.innerText = quantity;
	editButton.dataset.target = "new_offer_" + offerCount;
	table.tBodies[0].appendChild(newRow);
	table.style.display = '';

	editButton.addEventListener('click', function(e) {
		var modalForm = modal.querySelector('.modal-form');
		oldOfferFields = document.getElementById(this.dataset.target);
		var updateOfferFields = oldOfferFields.cloneNode(true);
		updateOfferFields.classList.remove('offer-fields');
		updateOfferFields.classList.add('empty-fields');
		oldOfferFields.id = "";
		modalForm.appendChild(updateOfferFields);
		updateRow = this.closest('tr');
		showModal();
	});
}

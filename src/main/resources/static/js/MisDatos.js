var nullError = document.getElementById('nullError')
var numberError = document.getElementById('numberError')
var nombreLengthError = document.getElementById('nombreLengthError')
var apellidoLengthError = document.getElementById('apellidoLengthError')
var infoLengthError = document.getElementById('infoLengthError')
var urlError = document.getElementById('urlError')

var postButton = document.getElementById('but_guardar')

var errors = [nullError, numberError, nombreLengthError, apellidoLengthError, infoLengthError, urlError]

function updateButton() {
  postButton.disabled = errors.some( err => err.dataset.valid == 'false')
}

function updateError(error, conditionToDisable) {
  if (conditionToDisable) {
    error.dataset.valid = 'false'
    error.style.display = 'block'
  } else {
    error.dataset.valid = 'true'
    error.style.display = 'none'
  }
}

document.getElementById('txt_celular').oninput = el => {
  updateError(nullError, el.target.value == null || el.target.value == undefined || el.target.value == "")
  updateError(numberError, el.target.value.length != 9)
  updateButton()
}

document.getElementById('txt_nombre').oninput = el => {
  updateError(nullError, el.target.value == null || el.target.value == undefined || el.target.value == "")
  updateError(nombreLengthError, el.target.value.length > 100)
  updateButton()
}

document.getElementById('txt_apellido').oninput = el => {
  updateError(nullError, el.target.value == null || el.target.value == undefined || el.target.value == "")
  updateError(apellidoLengthError, el.target.value.length > 100)
  updateButton()
}

document.getElementById('txt_relevantes').oninput = el => {
  updateError(infoLengthError, el.target.value.split(' ').length > 60)
  updateButton()
}

document.getElementById('txt_linkedin').oninput = el => {
  var expression = /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/gm
  var regex = new RegExp(expression)
  updateError(urlError, !el.target.value.match(regex))
  updateButton()
}
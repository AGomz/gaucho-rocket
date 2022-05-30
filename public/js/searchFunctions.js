'use strict'

// Deshabilitar selects
let tourRadio = document.getElementById("tourRadio");
let idaRadio = document.getElementById("idaRadio");
let selectsDinamicos = document.getElementsByClassName("select");

    tourRadio.addEventListener('click', function(){
        for (let i = 0; i < selectsDinamicos.length; i++) {
            selectsDinamicos[i].disabled = true;
            //fecha.setAttribute("required", "");
        }
    })
    idaRadio.addEventListener('click', function(){
        for (let i = 0; i < selectsDinamicos.length; i++) {
            selectsDinamicos[i].disabled = false;
        }
    })

// Validacion de los campos ingresados front
var forms = document.querySelectorAll('.needs-validation')

    Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
            }

            form.classList.add('was-validated')
        }, false)
    })


      
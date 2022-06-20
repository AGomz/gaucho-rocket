'use strict'

function cambiarEstadoDeSelects(){
    let idaRadio = document.getElementById("idaRadio");
    let selectsDinamicos = document.getElementsByClassName("select");
    let radios = document.querySelectorAll(".radio");
    let opciones = document.querySelectorAll(".option-dis");
    let selectOrigen = document.getElementById("select-origen");

    /*Habilitar selects usando radio ida*/
    idaRadio.addEventListener('click', function(){
        for (let i = 0; i < selectsDinamicos.length; i++) {
            selectsDinamicos[i].disabled = false;

            opciones.forEach(element => {
                element.setAttribute("class", "show");
            })
        }
    })

    /*Deshabilitar selects usando radio tour y suborbital*/
    for(let i=0; i<radios.length; i++){
        radios[i].addEventListener('click', function(){
            for (let i = 0; i < selectsDinamicos.length; i++) {
                selectsDinamicos[i].disabled = true;

                opciones.forEach(element => {
                   element.setAttribute("class", "hidden");
                })

            }
        })
    }
}

/* Validacion de los campos ingresados front*/
function validarSelects(){
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
}

window.onload = function(){
    cambiarEstadoDeSelects();
    validarSelects();
}


      
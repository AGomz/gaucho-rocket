'use strict'

function cambiarEstadoDeSelects(){
    let idaRadio = document.getElementById("idaRadio");
    let tourRadio = document.getElementById("tourRadio");
    let subRadio = document.getElementById("suborbitalRadio");
    let selectsDinamicos = document.getElementsByClassName("select");
    let radios = document.querySelectorAll(".radio");
    let opciones = document.querySelectorAll(".option-dis");
    let opDis = document.querySelectorAll(".dis");
    let opHab = document.querySelectorAll(".hab");

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

    /*Mostrar las opciones de origen dependiendo si es un tour o suborbital*/
    tourRadio.addEventListener('click', function(){
        opciones.forEach(element => {
            element.setAttribute("class", "hidden");
        })
    })

    subRadio.addEventListener('click', function(){
        opHab.forEach(element => {
            element.setAttribute("class", "show");
        })
        opDis.forEach(element => {
            element.setAttribute("class", "hidden");
        })
    })

    /*Deshabilitar select al seleccionar radio tour y suborbital*/
    for(let i=0; i<radios.length; i++){
        radios[i].addEventListener('click', function(){
            for (let i = 0; i < selectsDinamicos.length; i++) {
                selectsDinamicos[i].disabled = true;
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


      
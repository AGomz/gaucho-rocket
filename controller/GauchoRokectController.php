<?php

class GauchoRocketController
{

    private $printer;

    public function __construct($printer)
    {
        $this->printer = $printer;
    }

    public function show()
    {
        // Habría que manejar de otra forma la session
        // sino hay que pasarle siempre a cada vista para ver si mustra 
        // opciones para usuarios logueados o no
        $session = isset($_SESSION['logueado']) ? $_SESSION['logueado'] : null;

        echo $this->printer->render(
            "view/homeView.html",
            ["session" => $session]
        );
    }
}

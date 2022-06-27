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
        if (SessionManager::userIsAdmin())
            echo $this->printer->render("view/homeAdminView.html");
        else
            echo $this->printer->render("view/homeView.html");
    }
}

<?php

class GauchoRocketController
{
    private $printer;
    private $adminModel;

    public function __construct($printer, $adminModel)
    {
        $this->printer = $printer;
        $this->adminModel = $adminModel;
    }

    public function show()
    {
        if (SessionManager::userIsAdmin()) {
            $data = $this->adminModel->getList();
            echo $this->printer->render("view/homeAdminView.html", ["datos" => $data]);
        } else {
            echo $this->printer->render("view/homeView.html");
        }
    }
}

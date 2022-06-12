<?php


class ReservasController
{
    private $reservasModel;
    private $printer;

    public function __construct($model, $printer)
    {
        $this->reservasModel = $model;
        $this->printer = $printer;
    }

    public function show($data = [])
    {
        if (isset($_SESSION['user'])) {
            $array = $_SESSION['user']["id"];
            $userId = $array[0]['id'];

            $listadDeReservas = $this->reservasModel->getReservas($userId);
            $datos = ["proxVuelos" => $listadDeReservas];

            echo $this->printer->render("view/reservasView.html", $datos);
        } else {
            Redirect::to("/");
        }
    }

    public function reservar(){

        $idOrigen = isset($_POST["origenId"]) ? $_POST["origenId"] : "";
        $idDestino = isset($_POST["destinoId"]) ? $_POST["destinoId"] : "";

        $salida = isset($_POST["salida"]) ? $_POST["salida"] : "";
        $origen = isset($_POST["origen"]) ? $_POST["origen"] : "";

        if (isset($_SESSION['user'])) {
            $array = $_SESSION['user']["id"];
            $userId = $array[0]['id'];

            /*REVISAR
            if($idOrigen && $idDestino){
                $datos = $this->searchModel->getDatosPor($idOrigen, $idDestino);
            }

            $data = ["datos" => $datos];*/

            $data = ["origenId" => $idOrigen,
                    "destinoId"  => $idDestino,
                    "salida" => $salida,
                    "origen" => $origen];

            echo $this->printer->render("view/bookingView.html", $data);

            //var_dump($idOrigen);
            //Redirect::to("/");
        }else{
            Redirect::to("/login");
        }
    }
}

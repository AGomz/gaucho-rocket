<?php

class SearchController
{
    private $printer;
    private $searchModel;

    public function __construct($searchModel, $printer){
        $this->searchModel = $searchModel;
        $this->printer = $printer;
    }

    public function show($data = [])
    {
        echo $this->printer->render("view/searchView.html", $data);
    }

    public function execute()
    {
        $tipoViaje = isset($_POST["tipoDeViaje"]) ? $_POST["tipoDeViaje"] : "";
        $origen = isset($_POST["origen"]) ? $_POST["origen"] : "";
        $destino = isset($_POST["destino"]) ? $_POST["destino"] : "";
        $fecha = isset($_POST["fecha"]) ? $_POST["fecha"] : "";
        $nivelPasajero = isset($_POST["nivelPasajero"]) ? $_POST["nivelPasajero"] : "";
        $cabina = isset($_POST["cabina"]) ? $_POST["cabina"] : "";
        $servicio = isset($_POST["servicio"]) ? $_POST["servicio"] : "";

       /* $preload = [
           "tipoDeViaje" => $tipoViaje
        ];*/

        if($origen && $destino){
            $datos = $this->searchModel->getDatosPor($origen, $destino);
        }
        if($origen && $destino && $fecha && $cabina && $servicio && $tipoViaje=="ida"){
            $datos = $this->searchModel->getDatos($origen, $destino, $fecha, $nivelPasajero, $cabina, $servicio);
        }
        if($origen && $tipoViaje=="tour"){
            $datos = $this->searchModel->getDatosTour($origen);
        }
        if($origen && $tipoViaje=="suborbital"){
            $datos = $this->searchModel->getDatosSuborbital($origen);
        }

        if(sizeof($datos) > 0){
            $result = ["datos" => $datos]; // $data
            $data = array_merge($result, ["messageResult" => 'Realizar otra búsqueda.']);

        }else{
            $data = array_merge(["messageResult" => 'No se encontraron resultados.']);
        }

        $this->show($data);

    }
}
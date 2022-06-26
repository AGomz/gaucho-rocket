<?php

class SearchController
{
    private $printer;
    private $searchModel;

    public function __construct($searchModel, $printer)
    {
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
       /* $nivelPasajero = isset($_POST["nivelPasajero"]) ? $_POST["nivelPasajero"] : "";
        $cabina = isset($_POST["cabina"]) ? $_POST["cabina"] : "";
        $servicio = isset($_POST["servicio"]) ? $_POST["servicio"] : "";*/

        if ($origen && $destino && $tipoViaje == "ida") {
            $datos = $this->searchModel->getTramoCompleto($origen, $destino, $fecha);
        }
        if ($origen && $tipoViaje == "tour") {
            $datos = $this->searchModel->getDatosTour($fecha);
        }
        if ($origen && $tipoViaje == "suborbital") {
            $datos = $this->searchModel->getDatosSuborbital($origen, $fecha);
        }

        if (sizeof($datos) > 0) {
            $result = ["datos" => $datos];
            $data = array_merge($result, ["messageResult" => 'Realizar otra búsqueda.']);
        } else {
            $data = array_merge(["messageResult" => 'No se encontraron resultados.']);
        }

        $this->show($data);
    }
}

<?php

class PositionController extends BaseController
{

    private $reporteModel;
    private $printer;

    public function __construct($model, $printer)
    {
        $this->reporteModel = $model;
        $this->printer = $printer;
    }

    public function show($data = [])
    {
        $this->checkIfSessionIsNotValidForCustomer();
        echo $this->printer->render("view/positionView.html", $data);
    }

    public function showPosition()
    {
        $this->checkIfSessionIsNotValidForCustomer();

        $fecha = isset($_POST["fecha"]) ? $_POST["fecha"] : "";

        if($fecha){
            $datos = $this->reporteModel->getPosicionActualDeLasNaves($fecha);
        }

        if(sizeof($datos) > 0 && $fecha){
            $data =$this->createGraphicPosicion($datos, $fecha);
            $data = array_merge(["fecha" => $fecha]);
            $data = array_merge($data, ["imgPositionActiv" => true]);
        }else{
            $data = array_merge(["messageResult" => 'No se encontraron resultados.']);
        }
        $this->show($data);
    }

    private function createGraphicPosicion($result, $fecha)
    {
        // id, nombre, fechasalida, origen, fechallegada, destino
        require_once('./third-party/jpgraph/src/jpgraph.php');
        require_once('./third-party/jpgraph/src/jpgraph_gantt.php');
        $graph = new GanttGraph(1200, 500);

        $graph->title->Set("Posición de las naves");
        $graph->ShowHeaders(GANTT_HHOUR | GANTT_HDAY | GANTT_HMONTH);
        $counter = 0;

        foreach ($result as $viaje){
            $activity = new GanttBar ($counter, $viaje["equipo"], $viaje["fechasalida"], $viaje["fechallegada"]);
            $graph->Add( $activity);
            $counter++;
        }

        $vline = new GanttVLine($fecha,"Fecha actual");
        $graph->Add($vline);

        $fileName = "public/img/imgfile.png";
        $gdImgHandler = $graph->Stroke(_IMG_HANDLER);
        $graph->img->Stream($fileName);
    }
}
<?php
require_once ('./third-party/jpgraph/src/jpgraph.php');
require_once ('./third-party/jpgraph/src/jpgraph_bar.php');
//include("helpers/JpGraph.php");

class ReporteController
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
        echo $this->printer->render("view/reporteView.html", $data);
    }

    public function getReport(){
        //$tipoDeReporte = isset($_POST["reporte"]) ? $_POST["reporte"] : "";

        $datos = $this->reporteModel->getValores();

        //($datos[0]["valor"], $datos[1]["valor"], $datos[2]["valor"]
        $data1y=array(100, 50, 80);
        var_dump( $data1y);

        $graph = new Graph(350,200,'auto');
        $graph->SetScale("textlin");

        $theme_class=new UniversalTheme;
        $graph->SetTheme($theme_class);

        $graph->yaxis->SetTickPositions(array(0,30,60,90,120,150), array(15,45,75,105,135));
        $graph->SetBox(false);

        $graph->ygrid->SetFill(false);
        //array($result[0]["nombre"], $result[1]["nombre"], $result[2]["nombre"])
        $graph->xaxis->SetTickLabels(array('a','b','c'));
        $graph->yaxis->HideLine(false);
        $graph->yaxis->HideTicks(false,false);

        $b1plot = new BarPlot($data1y);
        $graph->Add($b1plot);


        $b1plot->SetColor("white");
        $b1plot->SetFillColor("#cc1111");

        $graph->title->Set("Bar Plots");

        $fileName = "public/img/imagefile.png";

        $gdImgHandler = $graph->Stroke(_IMG_HANDLER);
        $graph->img->Stream($fileName);

        $this->show();
    }

}
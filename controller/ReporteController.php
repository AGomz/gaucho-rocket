<?php
require_once ('./third-party/jpgraph/src/jpgraph.php');
require_once ('./third-party/jpgraph/src/jpgraph_bar.php');

class ReporteController
{

    private $reporteModel;
    private $printer;
    private $PDFGenerator;

    public function __construct($model, $printer, $PDFGenerator)
    {
        $this->reporteModel = $model;
        $this->printer = $printer;
        $this->PDFGenerator = $PDFGenerator;
    }

    public function show($data = [])
    {
        echo $this->printer->render("view/reporteView.html", $data);
    }

    public function getCabinaReport(){
        $datos = $this->reporteModel->getCabinaMasVendida();

        $data1y=array();
        $dataName=array();

        for($i=0;$i<count($datos);$i++){
            $data1y[] = $datos[$i]["cantidad"];
            $dataName[] = $datos[$i]["nombre"];
        }
        $graph = $this->getGraph();
        $graph->yaxis->SetTickPositions($data1y, array(15,45,75,105,135));
        $this->getConfigGraph($graph, $dataName);

        $b1plot = $this->getBarPlot($data1y);
        $graph->Add($b1plot);

        $graph->title->Set("Cabina más vendida");
        $this->generateImageGraph($graph);
        echo $this->printer->render("view/reporteCabinaView.html");
    }

    public function getMesReport(){
        $fecha = isset($_POST["fecha"]) ? $_POST["fecha"] : "";
        $datos = $this->reporteModel->getFacturacionMensual($fecha);

        if(sizeof($datos) > 0 && $fecha){
            $data1y=array();
            $dataName = array();

            for($i=0;$i<count($datos);$i++){
                $data1y[] = $datos[$i]["importe"];
                $dataName[] = $datos[$i]["credito"];
            }
            $graph = $this->getGraph();
            $this->getConfigGraph($graph, $dataName);

            $b1plot = $this->getBarPlot($data1y);
            $graph->Add($b1plot);

            $graph->title->Set("Facturación mensual");
            $this->generateImageGraph($graph);

            $data = ["fecha" => $fecha];
            /*Permite ocultar o mostrar la tabla*/
            $data = array_merge($data, ["facturacionMesActiv" => true]);

            echo $this->printer->render("view/reporteFacturacionMesView.html", $data);
        }else{
           // $data = array_merge(["messageResult" => 'No se encontraron resultados.']);
            echo $this->printer->render("view/reporteFacturacionMesView.html");
        }
    }

    public function getClienteReport(){
        $id = isset($_POST["idUsuario"]) ? $_POST["idUsuario"] : "";

        if($id){
            $datos = $this->reporteModel->getFacturacionPorCliente($id);
            $data = ["facturacionCliente" => $datos];
            /*Le paso a la vista el id para poder generar el PDF*/
            $data = array_merge($data, ["idUsuario" => $id]);
            $data = array_merge($data, ["clienteReportActiv" => true]);

            echo $this->printer->render("view/reporteFacturacionClienteView.html", $data);
        }else{
            echo $this->printer->render("view/reporteFacturacionClienteView.html");
        }
    }

    public function getOcupacion(){
        $idTramo =  isset($_POST["idTramo"]) ? $_POST["idTramo"] : "";

        if($idTramo){
            $datos = $this->reporteModel->getOcupacionPorViajeYEquipo($idTramo);
            $contador = 0;

            foreach($datos as $dato){
                $datos[$contador]["porcentaje"] = (($dato["cantidad"]/$dato["maximo"])*100)."%";
                $contador++;
            }
            $data = ["ocupacion" => $datos];
            $data = array_merge($data, ["idTramo" => $idTramo]);
            $data = array_merge($data, ["ocupacionActiv" => true]);

            echo $this->printer->render("view/reporteOcupacionView.html", $data);
        }else{
            echo $this->printer->render("view/reporteOcupacionView.html");
        }
    }

    public function getGraph(){
        $graph = new Graph(350,200,'auto');
        $graph->SetScale("textlin");

        $theme_class=new UniversalTheme;
        $graph->SetTheme($theme_class);

        return $graph;
    }

    public function getConfigGraph($graph, $dataName){
        $graph->SetBox(false);
        $graph->ygrid->SetFill(false);
        $graph->xaxis->SetTickLabels($dataName);

        return $graph;
    }

    public function getBarPlot($data1y){
        $b1plot = new BarPlot($data1y);

        $b1plot->SetColor("white");
        $b1plot->SetFillColor("#cc1111");

        return $b1plot;
    }

    public function generateImageGraph($graph){
        $fileName = "public/img/imagefile.png";

        $gdImgHandler = $graph->Stroke(_IMG_HANDLER);
        $image = $graph->img->Stream($fileName);

        return $image;
    }

    public function getPDFReport(){
        $fecha = isset($_POST["fecha"]) ? $_POST["fecha"] : "";

        if($fecha)
        {
            $datos = $this->reporteModel->getFacturacionMensual($fecha);
            $datos = ["dataReporteMes" => $this->reporteModel->getFacturacionMensual($fecha)];
        }
        else{
            $datos = ["dataReporte" => $this->reporteModel->getCabinaMasVendida()];
        }

        return $this->PDFGenerator->output($this->printer->render('view/pdf/reportePDFView.html', $datos), 'reporte.pdf');
    }

    public function getPDFReportTable(){
        $id = isset($_POST["idUsuario"]) ? $_POST["idUsuario"] : "";
        $idTramo =  isset($_POST["idTramo"]) ? $_POST["idTramo"] : "";

        if($id){
            $datos = $this->reporteModel->getFacturacionPorCliente($id);
            $datos = ["facturacionCliente" =>  $this->reporteModel->getFacturacionPorCliente($id)];
            $datos = array_merge($datos, ["facturacionClienteActiv" => true]);
        }
        else if($idTramo){
            $datos = $this->reporteModel->getOcupacionPorViajeYEquipo($idTramo);
            $datos = ["ocupacionViaje" => $this->reporteModel->getOcupacionPorViajeYEquipo($idTramo)];
            $datos = array_merge($datos, ["ocupacionActiv" => true]);
        }

        return $this->PDFGenerator->output($this->printer->render('view/pdf/reportePDFTabClienteView.html', $datos), 'reporte.pdf');
    }
}
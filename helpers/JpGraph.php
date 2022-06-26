<?php // content="text/plain; charset=utf-8"
require_once ('./third-party/jpgraph/src/jpgraph.php');
require_once ('./third-party/jpgraph/src/jpgraph_bar.php');

$dato1 = array("cantidad" => 100, "nombre" => "Turista");
$dato2 = array("cantidad" => 180, "nombre" => "Standard");
$dato3 = array("cantidad" => 120, "nombre" => "Primera");

$result = array($dato1, $dato2, $dato3);

$data1y=array($result[0]["cantidad"], $result[1]["cantidad"], $result[2]["cantidad"]);
/*$data2y=array($result[1]["cantidad"]);
$data3y=array($result[2]["cantidad"]);*/

// Create the graph. These two calls are always required
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

// Create the bar plots
$b1plot = new BarPlot($data1y);
/*$b2plot = new BarPlot($data2y);
$b3plot = new BarPlot($data3y);*/

// Create the grouped bar plot
//$gbplot = new GroupBarPlot(array($b1plot,$b2plot,$b3plot));
// ...and add it to the graPH
$graph->Add($b1plot);


$b1plot->SetColor("white");
$b1plot->SetFillColor("#cc1111");

/*$b2plot->SetColor("white");
$b2plot->SetFillColor("#11cccc");

$b3plot->SetColor("white");
$b3plot->SetFillColor("#1111cc");*/

$graph->title->Set("Bar Plots");

// Display the graph
$graph->Stroke();
?>




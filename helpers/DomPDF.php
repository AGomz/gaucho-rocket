<?php

require_once('./third-party/dompdf/autoload.inc.php');

use Dompdf\Dompdf;
use Dompdf\Options;


class PDFGenerator
{
    private $pdf;


    public function __construct()
    {
        $options = new Options();
        // Permite leer img remotas con src="google.com/imagnen.jpg"
        $options->set('isRemoteEnabled', true);
        $this->pdf = new Dompdf($options);
        $this->pdf->setPaper('A4', 'portrait');
    }

    /*
    * Genera el output a pdf del html que se pasa por parámetro
    * OJO!!! dompdf sólo soporta css 2.1 y pocas tipos de fuentes
    */
    public function output($html, $name = 'document.pdf')
    {
        $this->pdf->loadHtml($html);
        $this->pdf->render();
        return $this->pdf->stream($name, [
            "Attachment" => true
        ]);
    }
}

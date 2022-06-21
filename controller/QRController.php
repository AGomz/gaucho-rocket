<?php


class QRController
{
    public function __construct()
    {
    }

    public function show()
    {
        $qrHasCode = $_GET['code'];
        return QRcode::png($qrHasCode, false, QR_ECLEVEL_M, 10);
    }
}

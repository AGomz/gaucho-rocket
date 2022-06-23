<?php


class QRController
{
    public function __construct()
    {
    }

    public function show()
    {
        $qrHashCode = $_GET['code'];
        return QRcode::png($qrHashCode, false, QR_ECLEVEL_L, 10);
    }
}

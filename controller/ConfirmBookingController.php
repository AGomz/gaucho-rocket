<?php


class ConfirmBookingController
{
    private $printer;
    private $confirmBookingModel;
    private $userModel;

    public function __construct($confirmBookingModel, $printer, $userModel)
    {
        $this->confirmBookingModel = $confirmBookingModel;
        $this->printer = $printer;
        $this->userModel = $userModel;
    }

    public function show($data = [])
    {
        $data = array_merge($this->getDatos(), $data);
        echo $this->printer->render("view/confirmBookingView.html", $data);
    }

    public function confirm()
    {
        $datos = $this->getDatos();

        $userId = SessionManager::getUserId();
        $nivelDeVueloUser = $this->userModel->getNivelDeVueloByUserID($userId);
        $nivelesDeVueloDelEquipo = $this->confirmBookingModel->getNivelVueloDelEquipo($datos["equipoId"]);

        $this->show(["mensajeDeError" => 'Tu nivel de vuelo no aplica para esta reserva']);

        // Verifica que los niveles de vuelo del equipo contenga el nivel de vuelo del user
        if (array_key_exists($nivelDeVueloUser, $nivelesDeVueloDelEquipo)) {
            $capacidadDeLaCabina = $this->confirmBookingModel->getCapacidadDeCabina($datos["equipoId"], $datos["cabinaId"]);
            $cantidadDeReservasHechas = $this->confirmBookingModel->getReservasByTramoId($datos["tramoIdOrigen"]);

            // Verifica que haya lugar para realizar la reserva
            if ($cantidadDeReservasHechas < $capacidadDeLaCabina) {
                $this->confirmBookingModel->realizarReservas(
                    $userId, $datos["tramoIdOrigen"],
                    $datos["tramoIdDestino"],
                    $datos["servicioId"],
                    $datos["cabinaId"]
                );
                Redirect::to("payment");
            } else {
                $this->show(["mensajeDeError" => "Este vuelo ya está todo reservado"]);
            }
        } else {
            $this->show(["mensajeDeError" => "Tu nivel de vuelo no aplica para esta reserva"]);
        }
    }

    private function getDatos()
    {
        $salida = isset($_POST["salida"]) ? $_POST["salida"] : "";
        $origen = isset($_POST["origen"]) ? $_POST["origen"] : "";
        $llegada = isset($_POST["llegada"]) ? $_POST["llegada"] : "";
        $destino = isset($_POST["destino"]) ? $_POST["destino"] : "";
        $cabinaId = isset($_POST["cabinaId"]) ? $_POST["cabinaId"] : "";
        $servicioId = isset($_POST["servicioId"]) ? $_POST["servicioId"] : "";
        $equipoId = isset($_POST["equipoId"]) ? $_POST["equipoId"] : "";
        $tramoIdOrigen = isset($_POST["tramoIdOrigen"]) ? $_POST["tramoIdOrigen"] : "";
        $tramoIdDestino = isset($_POST["tramoIdDestino"]) ? $_POST["tramoIdDestino"] : "";

        $nombreDeCabina = $this->confirmBookingModel->getNombreDeCabina($cabinaId);
        $nombreDeServicio = $this->confirmBookingModel->getNombreDeServicio($servicioId);

        return $preload = [
            "salida" => $salida,
            "origen" => $origen,
            "llegada" => $llegada,
            "destino" => $destino,
            "cabinaId" => $cabinaId,
            "servicioId" => $servicioId,
            "equipoId" => $equipoId,
            "tramoIdOrigen" => $tramoIdOrigen,
            "tramoIdDestino" => $tramoIdDestino,
            "cabina" => $nombreDeCabina[0]["nombre"],
            "servicio" => $nombreDeServicio[0]["nombre"]
        ];
    }
}
<?php


class ConfirmBookingController extends BaseController
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
        $this->checkIfSessionIsNotValid("/login");
        $datos = $this->getDatos();
        $userId = SessionManager::getUserId();
        $nivelDeVueloUser = $this->userModel->getNivelDeVueloByUserID($userId);
        $nivelesDeVueloDelEquipo = $this->confirmBookingModel->getNivelVueloDelEquipo($datos["equipoId"]);

        $valoresDeLosNiveles = [];
        for ($i = 0; $i < sizeof($nivelesDeVueloDelEquipo); $i++) {
            $values = array_values($nivelesDeVueloDelEquipo[$i]);
            $valoresDeLosNiveles[$i] = $values[0];
        }

        // Verifica que los niveles de vuelo del equipo contenga el nivel de vuelo del user
        if (in_array($nivelDeVueloUser[0]["id"], $valoresDeLosNiveles)) {
            $capacidadDeLaCabina = $this->confirmBookingModel->getCapacidadDeCabina($datos["equipoId"], $datos["cabinaId"]);
            $cantidadDeReservasHechas = $this->confirmBookingModel->getReservasByTramoId($datos["tramoIdOrigen"]);

            if (sizeof($cantidadDeReservasHechas) > 0) {
                $cantidadDeReservasHechas = $cantidadDeReservasHechas[0]["cantidadreservas"];
            } else {
                $cantidadDeReservasHechas = 0;
            }

            // Verifica que haya lugar para realizar la reserva
            if ($cantidadDeReservasHechas < $capacidadDeLaCabina[0]["cantidad"]) {
                $reservaId = $this->confirmBookingModel->realizarReservas(
                    $userId,
                    $datos["tramoIdOrigen"],
                    $datos["tramoIdDestino"],
                    $datos["servicioId"],
                    $datos["cabinaId"]
                );
                SessionManager::setDatosDeReserva($reservaId, "", $datos["total"]);
                Redirect::to("/payment");
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
        $tramoIdOrigen = isset($_POST["origenId"]) ? $_POST["origenId"] : "";
        $tramoIdDestino = isset($_POST["destinoId"]) ? $_POST["destinoId"] : "";

        if (empty($cabinaId) || empty($servicioId) || empty($tramoIdOrigen)) {
            Redirect::to("/home");
        }

        $cabina = $this->confirmBookingModel->getCabina($cabinaId);
        $servicio = $this->confirmBookingModel->getServicioById($servicioId);
        $precioVuelo = $this->confirmBookingModel->getPrecioVuelo($tramoIdOrigen, $tramoIdDestino);
        $total = $precioVuelo + $servicio[0]["precio"] + $cabina[0]["precio"];

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
            "cabina" => $cabina[0]["nombre"],
            "precioCabina" => $cabina[0]["precio"],
            "servicio" => $servicio[0]["nombre"],
            "precioVuelo" => $precioVuelo,
            "precioServicio" => $servicio[0]["precio"],
            "total" => $total
        ];
    }
}
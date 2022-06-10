<?php

class TurnoMedicoModel
{

    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    /**
     *  Genera un turno médico para el usuario
     * 
     *  Itera de forma aleatoria sobre los centros médicos disponibles, y 
     *  consulta a la bd en cada centro si hay cupo en el para el día siguiente
     *  al que se registra el usuario. Si no hay, se pasa al siguiente día
     *  y se repite el proceso. Hay una cláusula de seguridad, que rompe el
     *  bucle si se superan las 1000 iteraciones
     */
    public function generateTurnoMedico($usuarioId)
    {
        $date = new DateTime(); // Fecha hoy
        $date->add(new DateInterval('P1D')); // P1D means a period of 1 day
        $turnoAgendado = false;
        $datosTurnoMedico = [];
        $centrosId = array(1, 2, 3);

        while (!$turnoAgendado) {

            $counter = 0;
            if ($counter == 1000) {
                break; // guard caluse
            }

            shuffle($centrosId);
            foreach ($centrosId as $centroMedicoId) {
                if ($this->hayTurnoDisponible($date->format('Y-m-d'), $centroMedicoId)) {
                    $turnoAgendado = true;

                    $centroMedico = $this->getCentroMedicoById($centroMedicoId);
                    $datosTurnoMedico['nombre'] = $centroMedico['nombre'];
                    $datosTurnoMedico['direccion'] = $centroMedico['direccion'];
                    $datosTurnoMedico['fecha'] = $date->format('Y-m-d');

                    $this->agendarTurnoMedico(
                        $usuarioId,
                        $centroMedicoId,
                        $date->format('Y-m-d')
                    );
                    $datosTurnoMedico['nivelVuelo'] = $this->asignarNivelDeVuelo($usuarioId);

                    if ($turnoAgendado) {
                        break;
                    }
                }
            }
            $date->add(new DateInterval('P1D')); // P1D means a period of 1 day
            $counter++;
        }
        return $datosTurnoMedico;
    }

    public function getCentroMedicoById($id)
    {
        $query = "select nombre, direccion, turnosdiarios from centromedico where id = ${id}";
        return $this->database->query($query)[0];
    }

    public function hayTurnoDisponible($fecha, $centroMedicoId)
    {
        // Devuelve si hay lugar en el $centroMedicoId en la $fecha
        $maximosTurnosPorDia = $this->getCentroMedicoById($centroMedicoId)['turnosdiarios'];

        $query = "select count(*) as cantidadturnos 
            from turnomedico t
            join centromedico c on t.centromedicoid = c.id
            where c.id = ${centroMedicoId} and t.fecha = '${fecha}'";

        return $this->database->query($query)[0]['cantidadturnos'] < $maximosTurnosPorDia;
    }

    // Agenda turno medico y devuelve nivel de vuelo
    public function agendarTurnoMedico($usuarioId, $centroId, $fecha)
    {
        $query = "insert into turnomedico (usuarioid, centromedicoid, fecha)
                    values (${usuarioId}, ${centroId}, '${fecha}')";

        // Asigna turno medico
        $this->database->insertQuery($query);
    }

    public function asignarNivelDeVuelo($usuarioId)
    {
        // Simula generar nivel de vuelo random
        $nivelVuelo = rand(1, 3);
        $query = "update usuario set idnivelvuelo = ${nivelVuelo} where id = ${usuarioId}";
        $this->database->insertQuery($query);
        return $nivelVuelo;
    }
}

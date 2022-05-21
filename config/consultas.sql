-- viajes activos en una determinada fecha

-- set @dia_hoy = current_time();
set @dia_hoy = "2022-05-27 20:00:00";
select 	t.id,
		e.nombre as "equipo",
		d.nombre as "salida", 
		t.FechaSalida,
		d2.nombre as "llegada",
		t.FechaLlegada 
from gauchorocket.tramo t
inner join gauchorocket.destino d
on t.OrigenID = d.id 
left join gauchorocket.destino d2 
on t.DestinoID = d2.id
inner join gauchorocket.equipo e 
on t.EquipoID = e.id 
where t.FechaSalida <= @dia_hoy 
and t.FechaLlegada >= @dia_hoy
order by t.FechaSalida ;

-- ultima locacionlzacion de un equipo

select t.id, e.nombre, 
e.matricula, 
d2.nombre, 
t.FechaLlegada
from gauchorocket.tramo t 
inner join gauchorocket.destino d
on t.OrigenID = d.id 
left join gauchorocket.destino d2 
on t.DestinoID = d2.id
inner join gauchorocket.equipo e 
on t.EquipoID = e.id
-- where e.nombre like "Zo%"
where t.FechaLlegada = (select max(t.FechaLlegada) )
group by e.nombre;

-- ultima locacionlzacion de un equipo segun fecha
set @dia_hoy = "2022-05-27 20:00:00";
select t.id, e.nombre, 
e.matricula, 
d2.nombre, 
t.FechaLlegada
from gauchorocket.tramo t 
inner join gauchorocket.destino d
on t.OrigenID = d.id 
left join gauchorocket.destino d2 
on t.DestinoID = d2.id
inner join gauchorocket.equipo e 
on t.EquipoID = e.id
-- where e.nombre like "Zo%"
where t.FechaLlegada = (select max(t.FechaLlegada) )
	and t.FechaSalida <= @dia_hoy 
	and t.FechaLlegada >= @dia_hoy
group by e.nombre;

-- reservas por usuario
-- reservas por usuario
set @usuarioABuscar = 1;
select u.apellido as "Apellido",
u.nombre as "Nombre",
r.fecha as "fechaReserva",
p.transaccion  as "CogidoPago",
p.importe as "Importe", 
d.nombre as "Salida",
t.FechaSalida as "FechaSalida",
d2.nombre as "Llegada",
t.FechaLlegada  as "FechaLlegada"
from gauchorocket.reserva r 
inner join gauchorocket.tramo t 
on r.TramoID = t.id 
inner join gauchorocket.usuario u 
on r.UsuarioID = u.id 
left join gauchorocket.pago p 
on r.PagoID = p.id 
inner join gauchorocket.destino d
on t.OrigenID = d.id 
inner join gauchorocket.destino d2 
on t.DestinoID = d2.id 
where r.UsuarioID = @usuarioABuscar;

-- facturacion por usuario
set @usuarioABuscar = 1;
select u.apellido as "Apellido",
u.nombre as "Nombre",
p.transaccion as "CodigoPago",
p.importe as "Importe",
d.nombre as "Salida",
t.FechaSalida as "FechaSalida",
d2.nombre as "Llegada",
t.FechaLlegada as "FechaLlegada"
from gauchorocket.usuario u 
inner join gauchorocket.reserva r 
on r.UsuarioID = u.id 
left join gauchorocket.pago p 
on r.PagoID = p.id 
inner join gauchorocket.tramo t 
on r.TramoID = t.id
inner join gauchorocket.destino d
on t.OrigenID = d.id 
inner join gauchorocket.destino d2 
on t.DestinoID = d2.id 
where r.UsuarioID = @usuarioABuscar;

-- Total facturacion por usuario
set @usuarioABuscar = 2;
select u.apellido as "Apellido",
u.nombre as "Nombre",
sum(p.importe) as "totalFacturado"
from gauchorocket.pago p 
inner join gauchorocket.reserva r 
on r.PagoID = p.id 
inner join gauchorocket.usuario u 
on r.UsuarioID = u.id 
where u.id = @usuarioABuscar;

-- Total facturacion mensual
set @fecha = "2022-06-27 20:00:00";
select month(@fecha) as "Mes",
sum(p.importe)
from gauchorocket.pago p 
where month(p.fecha) = month(@fecha);
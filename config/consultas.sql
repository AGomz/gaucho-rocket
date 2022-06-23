-- viajes activos en una determinada fecha

-- set @dia_hoy = current_time();
set @dia_hoy = "2022-05-27 20:00:00";
select 	t.id,
		e.nombre as "equipo",
		d.nombre as "salida", 
		t.fechasalida,
		d2.nombre as "llegada",
		t.fechallegada
from gauchorocket.tramo t
inner join gauchorocket.destino d
on t.origenid = d.id
left join gauchorocket.destino d2
on t.destinoid = d2.id
inner join gauchorocket.equipo e
on t.equipoid = e.id
where t.fechasalida <= @dia_hoy
and t.fechallegada >= @dia_hoy
order by t.fechasalida ;

-- ultima locacionlzacion de un equipo

select t.id, e.nombre,
e.matricula,
d2.nombre,
t.fechallegada
from gauchorocket.tramo t
inner join gauchorocket.destino d
on t.origenid = d.id
left join gauchorocket.destino d2
on t.destinoid = d2.id
inner join gauchorocket.equipo e
on t.equipoid = e.id
-- where e.nombre like "zo%"
where t.fechallegada = (select max(t.fechallegada) )
group by e.nombre;

-- ultima locacionlzacion de un equipo segun fecha
set @dia_hoy = "2022-05-27 20:00:00";
select t.id, e.nombre,
e.matricula,
d2.nombre,
t.fechallegada
from gauchorocket.tramo t
inner join gauchorocket.destino d
on t.origenid = d.id
left join gauchorocket.destino d2
on t.destinoid = d2.id
inner join gauchorocket.equipo e
on t.equipoid = e.id
-- where e.nombre like "zo%"
where t.fechallegada = (select max(t.fechallegada) )
	and t.fechasalida <= @dia_hoy
	and t.fechallegada >= @dia_hoy
group by e.nombre;

-- reservas por usuario
-- reservas por usuario
set @usuarioabuscar = 1;
select u.apellido as "apellido",
u.nombre as "nombre",
r.fecha as "fechareserva",
p.transaccion  as "cogidopago",
p.importe as "importe",
d.nombre as "salida",
t.fechasalida as "fechasalida",
d2.nombre as "llegada",
t.fechallegada  as "fechallegada"
from gauchorocket.reserva r
inner join gauchorocket.tramo t
on r.tramoid = t.id
inner join gauchorocket.usuario u
on r.usuarioid = u.id
left join gauchorocket.pago p
on r.pagoid = p.id
inner join gauchorocket.destino d
on t.origenid = d.id
inner join gauchorocket.destino d2
on t.destinoid = d2.id
where r.usuarioid = @usuarioabuscar;

-- facturacion por usuario
set @usuarioabuscar = 1;
select u.apellido as "apellido",
u.nombre as "nombre",
p.transaccion as "codigopago",
p.importe as "importe",
d.nombre as "salida",
t.fechasalida as "fechasalida",
d2.nombre as "llegada",
t.fechallegada as "fechallegada"
from gauchorocket.usuario u
inner join gauchorocket.reserva r
on r.usuarioid = u.id
left join gauchorocket.pago p
on r.pagoid = p.id
inner join gauchorocket.tramo t
on r.tramoid = t.id
inner join gauchorocket.destino d
on t.origenid = d.id
inner join gauchorocket.destino d2
on t.destinoid = d2.id
where r.usuarioid = @usuarioabuscar;

-- total facturacion por usuario
set @usuarioabuscar = 2;
select u.apellido as "apellido",
u.nombre as "nombre",
sum(p.importe) as "totalfacturado"
from gauchorocket.pago p
inner join gauchorocket.reserva r
on r.pagoid = p.id
inner join gauchorocket.usuario u
on r.usuarioid = u.id
where u.id = @usuarioabuscar;

-- total facturacion mensual
set @fecha = "2022-06-27 20:00:00";
select month(@fecha) as "mes",
sum(p.importe)
from gauchorocket.pago p 
where month(p.fecha) = month(@fecha);
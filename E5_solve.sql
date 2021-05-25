
-- Delete datos previos
delete from participa where id_evento > 0;
delete from evento where id_evento > 0;
delete from modelo where nro_doc > 0;

-- Actualizar datos
copy evento from 'evento.csv' with (format csv);
copy modelo from 'modelo.csv' with (format csv);
copy participa from 'participa.csv' with (format csv);

-- Solución
select e.id_evento, e.fecha_evento , e.direccion , e.ciudad 
from evento e 
where e.id_evento = any(
	select p.id_evento 
	from participa p 
	where upper(p.moneda) LIKE 'PESO'
		and p.monto > 100000
	group by p.id_evento 
	having count(p.nro_doc) > 5
);
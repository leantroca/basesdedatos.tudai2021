
-- Delete datos previos
delete from alquila where id_oficina > 0;
delete from oficina where id_oficina > 0;
delete from cliente where nro_doc > 0;
delete from sala_convencion where id_oficina > 0;

-- Actualizar datos
copy oficina from 'oficina.csv' with (format csv);
copy cliente from 'cliente.csv' with (format csv);
copy alquila from 'alquila.csv' with (format csv);
copy sala_convencion from 'sala_convencion.csv' with (format csv);

-- Solución
select o.id_oficina, o.cant_max_personas, o.monto_alquiler
from oficina o 
where o.id_oficina < 5
	and o.id_oficina = any(
		select a.id_oficina 
		from alquila a
		group by a.id_oficina
		having count(*) >= 30
	);
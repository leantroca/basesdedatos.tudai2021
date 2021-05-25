delete from alquila where id_oficina > 0;
delete from oficina where id_oficina > 0;
delete from cliente where nro_doc > 0;
delete from sala_convencion where id_oficina > 0;

copy oficina from 'https://raw.githubusercontent.com/leantroca/basesdedatos.tudai2021/main/oficina.csv' with (format csv);
copy cliente from 'https://raw.githubusercontent.com/leantroca/basesdedatos.tudai2021/main/cliente.csv' with (format csv);
copy alquila from 'https://raw.githubusercontent.com/leantroca/basesdedatos.tudai2021/main/alquila.csv' with (format csv);
copy sala_convencion from 'https://raw.githubusercontent.com/leantroca/basesdedatos.tudai2021/main/sala_convencion.csv' with (format csv);


select o.id_oficina, o.cant_max_personas, o.monto_alquiler
from oficina o 
where o.id_oficina < 5
	and o.id_oficina = any(
		select a.id_oficina 
		from alquila a
		group by a.id_oficina
		having count(*) >= 30
	);

------------------------------------------------------------------------------------

delete from participa where id_evento > 0;
delete from evento where id_evento > 0;
delete from modelo where nro_doc > 0;

copy evento from 'https://raw.githubusercontent.com/leantroca/basesdedatos.tudai2021/main/evento.csv' with (format csv);
copy modelo from 'https://raw.githubusercontent.com/leantroca/basesdedatos.tudai2021/main/modelo.csv' with (format csv);
copy participa from 'https://raw.githubusercontent.com/leantroca/basesdedatos.tudai2021/main/participa.csv' with (format csv);

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
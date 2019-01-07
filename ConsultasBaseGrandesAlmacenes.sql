--_________QUERYS______________________
--MOSTRAR EL NUMERO DE VENTAS DE CADA PRODUCTO ORDENADO DE MAS A MENOS VENTAS
SELECT p.nombre ,count(v.producto) cantidad_de_ventas   FROM  productos p , venta v 
where v.producto= p.codigo
group by p.nombre 
order by count(v.producto) desc;
select * from venta;
--Obtener un informe completo de ventas, indicando el nombre del cajero que 
--realizo la venta,nombre y precios de los productos vendidos, y piso en el que 
--encuentra la maquina registradora donde se realizo la venta 
select c.nomapels,v.cajero,p.nombre,p.precio,m.piso
from cajeros c, maquinas_registradora m,productos p,venta v
where c.codigo=v.cajero
and   p.codigo=v.producto
and   m.codigo=v.maquina;

--Obtener las ventas totales realizadas en cada piso 
SELECT m.piso ,sum(p.precio) cantidad_de_ventas FROM  productos p , venta v,
maquinas_registradora m  
where v.maquina= m.codigo
and v.producto=p.codigo
group by m.piso; 
--obtener el codigo y nombre de cada empleado junto con el informe total de sus ventas
select c.codigo,c.nomapels,sum(p.precio) total_de_ventas from cajeros c ,productos p ,venta v
where c.codigo=v.cajero
and   v.producto=p.codigo
group by c.codigo,c.nomapels;

--Obtener el codigo y el nombre de aquellos cajeros que hayan realizado 
--venta en pisos cuyas ventas totales sean inferiores a los $90.00

select c.codigo,c.nomapels,sum(p.precio) total_de_ventas from cajeros c ,productos p ,venta v
where c.codigo=v.cajero
and   v.producto=p.codigo
group by c.codigo,c.nomapels
having sum(p.precio)<90.00;


select* from cajeros;
select * from venta;
select* from productos;
select * from maquinas_registradora;






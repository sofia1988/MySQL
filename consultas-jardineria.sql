select * from cliente ;
select * from detalle_pedido;
select * from empleado;
select * from gama_producto;
select * from oficina;
select * from pago;
select * from pedido;
select * from producto;
/*Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.*/
select codigo_oficina ,ciudad from oficina;
/*Devuelve un listado con la ciudad y el teléfono de las oficinas de España.*/
select ciudad ,telefono  from oficina where pais ='españa';
/*Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.*/
select nombre ,apellido1,apellido2 ,email from empleado where codigo_jefe =7;
/*Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.*/
select puesto , nombre ,apellido1,apellido2 ,email  from empleado;
/*Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.*/
select nombre ,apellido1,puesto from empleado where puesto <> 'representastes de ventas';
/*Devuelve un listado con el nombre de los todos los clientes españoles.*/
select nombre_cliente from cliente where pais ='spain';
/*Devuelve un listado con los distintos estados por los que puede pasar un pedido.*/
select estado from pedido group by estado;
/*Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos.*/
select codigo_cliente from pago where  fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31' group by codigo_cliente;
SELECT DISTINCT codigo_cliente FROM pago WHERE YEAR(fecha_pago) = 2008;
SELECT DISTINCT codigo_cliente FROM pago WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';
/*Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.*/
select codigo_pedido ,codigo_cliente ,fecha_esperada,fecha_entrega from pedido where fecha_esperada < fecha_entrega;
/*Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.*/
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM pedido WHERE fecha_entrega <= ADDDATE(fecha_esperada, -2);
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM pedido WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;
/*Devuelve un listado de todos los pedidos que fueron rechazados en 2009.*/
select codigo_pedido from pedido where estado = 'rechazado' and fecha_entrega >= '2009-01-01' AND fecha_entrega <= '2009-12-31';
/*Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.*/
select codigo_pedido from pedido where estado = 'entregado' and MONTH(fecha_entrega) = 1;
/*Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.*/
select  forma_pago,total from pago where forma_pago ='paypal' and YEAR(fecha_pago) = 2008 order by total desc;
/*Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.*/
select forma_pago from pago group by forma_pago;
/*Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.*/
select codigo_producto,precio_venta from producto where gama ='Ornamentales' and cantidad_en_stock > 100 order by precio_venta desc;
/*Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.*/
select nombre_cliente from cliente where ciudad ='madrid' and codigo_empleado_rep_ventas = 11 or 30;

/*Consultas multitabla (Composición interna)*/
/*Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.*/
select cliente.nombre_cliente ,empleado.nombre as nombre_empleado , empleado.apellido1 as apellido_empleado from cliente inner join empleado on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;
/*Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.*/
select cliente.nombre_cliente ,empleado.nombre as nombre_empleado  from cliente inner join empleado on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado where codigo_cliente in(select codigo_cliente from pago where total > 1);
/*Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.*/
select cliente.nombre_cliente ,empleado.nombre as nombre_empleado  from cliente inner join empleado on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado where codigo_cliente in(select codigo_cliente from pago where total =0);
/*Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.*/
SELECT cliente.nombre_cliente, empleado.nombre AS nombre_empleado, oficina.ciudad FROM cliente INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina WHERE cliente.codigo_cliente IN (SELECT codigo_cliente FROM pago WHERE total > 1);
/*Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.*/
SELECT cliente.nombre_cliente, empleado.nombre AS nombre_empleado, oficina.ciudad FROM cliente INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina WHERE cliente.codigo_cliente IN (SELECT codigo_cliente FROM pago WHERE total =0);
/*Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.*/
select linea_direccion1,linea_direccion1 from oficina INNER JOIN cliente ON( select linea_direccion2 from cliente where linea_direccion2='Fuenlabrada');




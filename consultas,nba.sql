SELECT * FROM equipos;
SELECT * FROM estadisticas;
SELECT * FROM jugadores;
SELECT * FROM partidos;
/*Mostrar el nombre de todos los jugadores ordenados alfabéticamente.*/
select nombre from jugadores order by nombre;
/*Mostrar el nombre de los jugadores que sean pivots pisicion (‘C’) y que pesen más de 200 libras,ordenados por nombre alfabéticamente.*/
select  nombre ,peso  from jugadores where Posicion = 'c' and peso > 200;
/*Mostrar el nombre de todos los equipos ordenados alfabéticamente.*/
select nombre AS nombres_alfabeticamente from equipos order by nombre;
/*Mostrar el nombre de los equipos del este (East).*/
select nombre from equipos where conferencia ='East';
/*Mostrar los equipos donde su ciudad empieza con la letra ‘c’, ordenados por nombre.*/
select nombre,Ciudad from equipos where Ciudad LIKE 'c%' order by nombre;
/*Mostrar todos los jugadores y su equipo ordenados por nombre del equipo.*/
select nombre ,nombre_equipo from jugadores order by nombre_equipo;
/*Mostrar todos los jugadores del equipo “Raptors” ordenados por nombre.*/
select nombre,nombre_equipo from jugadores where nombre_equipo ='Raptors' order by nombre;
/*Mostrar los puntos por partido del jugador ‘Pau Gasol’.*/
select jugador,temporada ,puntos_por_partido from estadisticas where jugador = (select codigo from jugadores where nombre ='Pau Gasol');
/*Mostrar los puntos por partido del jugador ‘Pau Gasol’ en la temporada ’04/05′.*/
select temporada, puntos_por_partido from estadisticas where temporada ='04/05' and  jugador = (select codigo from jugadores where nombre ='Pau Gasol');
/*Mostrar el número de puntos de cada jugador en toda su carrera.*/
select jugador ,sum(puntos_por_partido) AS total_puntos from estadisticas group by jugador;
/*Mostrar el número de jugadores de cada equipo.*/
select nombre_equipo ,count(nombre_equipo) as cantidad_jugadores from jugadores group by nombre_equipo;
/*Mostrar el jugador que más puntos ha realizado en toda su carrera.*/
select jugador ,sum(puntos_por_partido) AS total_puntos from estadisticas group by jugador order by sum(puntos_por_partido) desc limit 1;
/*Mostrar el nombre del equipo, conferencia y división del jugador más alto de la NBA.*/
select nombre, conferencia, division from equipos where nombre =(select nombre_equipo from jugadores where altura =(select max(altura) from jugadores));


/*estan bien los dos solo que uno muestra el nombre del jugador y la altura*/

select j.nombre , j.altura , e.conferencia,e.division,j.Nombre_equipo from jugadores j inner join equipos e on j.Nombre_equipo = e.nombre where altura = (select max(altura) from jugadores); 
/*Mostrar el partido o partidos (equipo_local, equipo_visitante y diferencia) con mayor diferencia de puntos.*/
select abs( equipo_local - equipo_visitante ) as 'diferencia' from partidos group by abs( equipo_local - equipo_visitante ) order by abs( equipo_local - equipo_visitante ) desc;
select equipo_local,equipo_visitante,puntos_local,puntos_visitante,abs(puntos_local-puntos_visitante) from partidos;
/*Mostrar quien gana en cada partido (codigo, equipo_local, equipo_visitante, equipo_ganador), en caso de empate sera null.*/
select codigo, equipo_local , equipo_visitante  from partidos where equipo_local > equipo_visitante = 1 ;
SELECT codigo, equipo_local, equipo_visitante,
    CASE
        WHEN p.puntos_local > p.puntos_visitante THEN equipo_local
        WHEN p.puntos_local < p.puntos_visitante THEN equipo_visitante
        ELSE NULL
    END AS equipo_ganador
FROM partidos p;
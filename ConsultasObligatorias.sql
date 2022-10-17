#1 encuentros de futbol al dia 17/12/2022

select e.descripcionEncuentro, e.fechaComienzo, equi.nombre, equi.idEquipo, d.nombre
from Encuentros as e, Compite as c, Equipos as equi, Deportes as d, Practican as p
where  e.fechaComienzo > '2022-12-16 23:59:59' AND e.fechaComienzo < '2022-12-18 00:00:00' AND c.idEncuentro=e.idEncuentro
AND equi.idEquipo=c.idEquipo AND equi.idEquipo = p.idEquipo AND p.idDeporte = d.idDeporte AND d.nombre="futbol";

#2 nombre de los usuarios VIP
select nombre
from VIP;

#3 nombre de usuarios que reciben notificaciones (siguen) a aguada
Select v.idUsuario, v.Nombre, e.nombre
from Vip as v, EquiposFavoritos as ef, Equipos as e
where v.idUsuario=ef.idUsuario AND ef.idEquipoFavorito = e.idEquipo AND e.nombre="Aguada";

#4 listar aquellos usuarios que ven una publicidad dada
select g.nombreAutogen 
from Guest as g, Tiene_Usuario as t
where t.idPublicidad="1" AND t.idUsuario=g.idUsuario; #Reemplazaar "1" por el id de publicidad deseado

#5 cantidad de torneos en competencia por cada deporte
select d.nombre, count(*)
from torneos as t, deportes as d,  realiza as r
where t.fechaFinalizado >= CURDATE() AND d.idDeporte= r.idDeporte AND r.idTorneo=t.idTorneo #Curdate=fecha actual del sisteaa
group by (d.nombre);

#6 Alineaciones de un encuentro dado
select j.nombre, j.apellido, a.Poscion, equi.Nombre
from Jugador as j, Alineacion as a, Encuentros as e, Utiliza as u, Equipos as equi, Forman as f
where a.idAlineacion=u.idAlineacion AND u.idEncuentro = e.idEncuentro AND e.idEncuentro=1 AND j.idJugador=a.idJugador AND equi.idEquipo=f.idEquipo AND f.idJugador=j.idJugador;






 
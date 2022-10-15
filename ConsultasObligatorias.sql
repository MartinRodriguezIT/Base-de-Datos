
#2
select nombre
from VIP;

#4
select g.nombreAutogen 
from Guest as g, Tiene_Usuario as t
where t.idPublicidad="1" AND t.idUsuario=g.idUsuario; #Reemplazaar "1" por el id de publicidad deseado

#5
select d.nombre, count(*)
from torneos as t, deportes as d,  realiza as r
where t.fechaFinalizado >= CURDATE() AND d.idDeporte= r.idDeporte AND r.idTorneo=t.idTorneo #Curdate=fecha actual del sisteaa
group by (d.nombre);

#6
select j.nombre, j.apellido, a.Poscion, equi.Nombre
from Jugador as j, Alineacion as a, Encuentros as e, Utiliza as u, Equipos as equi, Forman as f
where a.idAlineacion=u.idAlineacion AND u.idEncuentro = e.idEncuentro AND e.idEncuentro=1 AND j.idJugador=a.idJugador AND equi.idEquipo=f.idEquipo AND f.idJugador=j.idJugador;


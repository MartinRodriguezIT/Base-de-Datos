create table Utiliza
(
	idAlineacion int,
    idEncuentro int,
    idEquipo int,
    idJugador int,
    primary key(idAlineacion,idEncuentro,idEquipo,idJugador)
);
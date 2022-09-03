create table Practican
(
	idJugador int,
    idEquipo int,
    idDeporte int,
    idResultado int,
    primary key (idEquipo,idJugador,idDeporte,idResultado)
);
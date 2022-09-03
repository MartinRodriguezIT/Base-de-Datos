create table Rankings
(
	idResultado int primary key,
    segundosDiff int not null,
    minutosDiff int not null,
    horasDiff int not null,
    segundosTrans int not null,
    minutosTrans int not null,
    horasTrans int not null,
    puntos int,
    nombreJugador varchar(40),
    posicion int not null

);
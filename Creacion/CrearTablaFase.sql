create table Fase 
(
	idTorneo int,
    nFases int,
    estadoFase varchar(50) not null,
    nombreFase varchar(50) not null,
    primary key (idTorneo,nFases)
);
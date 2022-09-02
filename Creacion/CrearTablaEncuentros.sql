create table Encuentros
(
	idEncuentro int primary key,
    dia int not null,
    mes int not null,
    anio int not null,
    hora int not null,
    minuto int,
    termino boolean not null
);
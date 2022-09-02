create table Equipos
(
	idEquipo int primary key,
    categoria varchar(50) not null,
    logo varchar(200),
    nombre varchar(30) not null,
    pais varchar(30) not null
);
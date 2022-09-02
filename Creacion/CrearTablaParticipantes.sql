create table Participantes
(
	idParticipante int primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    edad int not null,
    sexo varchar(1),
    paisNacimiento varchar(30) not null
);
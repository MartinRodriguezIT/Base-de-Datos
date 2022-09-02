create table Deportes
(
	idDeporte int primary key,
    cantidadJugadores int not null,
    categoria varchar(50) not null,
    nombre varchar(50) not null unique
);
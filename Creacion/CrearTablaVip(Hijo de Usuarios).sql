create table Vip
(
	idUsuario int primary key,
    correo varchar(60) not null ,
    contrasenia varchar(60) not null,
    nombre varchar(40) not null unique,
    mesesSuscritos int not null
);
alter table Vip add constraint uk_correo unique(correo);
alter table Vip change contrasenia contrasenia varchar(60) not null;
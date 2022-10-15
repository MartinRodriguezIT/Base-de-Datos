#drop database KnightWareV2;
create database KnightWareV2;
use KnightWareV2;
create table Deportes(
	idDeporte int primary key,
    cantidadJugadores int not null,
    categoria varchar(50) not null,
    nombre varchar(50) not null unique
);

create table Resultados
(
	idResultados int primary key
);
create table Rankings
(
	idResultado int primary key,
    tiempo_Transcurrido time not null,
    puntos int not null,
    posicion int not null,
    nombreJugador varchar(40)
);
create table Particular
(
	idResultado int primary key,
    puntosVisi int not null,
	puntosLocal int not null,
    setsVisi int not null,
	setsLocal int not null,
    ventaja boolean
);
create table Puntos
(
	idResultado int primary key,
    puntosLocal int not null,
    puntosVisi int not null

);

create table Genera
(
	idEncuentro int,
    idResultado int,
    primary key (idEncuentro,idResultado)
);
 
create table Ocurrencias
(
	idOcurrencia int primary key,
    nombre varchar(50) not null
);
create table Hacen
(
	idIncidencia int,
    idOcurrencia int,
    primary key (idIncidencia,idOcurrencia)
);
create table Notifica
(
	idIncidencia int,
    idOcurrencia int,
	idEncuentro int,
    primary key (idIncidencia,idOcurrencia, idEncuentro)
);
create table Incidencias
(
	idIncidencia int,
    idJugador int not null,
	minuto int not null,
    primary key (idIncidencia)
);
 create table Participantes
(
	idParticipante int primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    edad int not null,
    sexo varchar(1),
    paisNacimiento varchar(30) not null
);
create table Se_Especializa_En
(
	idDeporte int,
    idParticipante int,
    primary key (idDeporte,idparticipante)
);
create table Jugador
(
	idJugador int primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    edad int not null,
    sexo varchar(1),
    paisNacimiento varchar(30) not null
);

create table Equipos
(
	idEquipo int primary key,
    categoria varchar(50) not null,
    logo varchar(200),
    nombre varchar(30) not null,
    pais varchar(30) not null
);

create table Forman
(
	idJugador int ,
    idEquipo int,
    primary key (idJugador,idEquipo)
);
create table Practican
(
	idJugador int,
    idEquipo int,
    idDeporte int,
    primary key (idEquipo,idJugador,idDeporte)
);
create table Encuentros
(
	idEncuentro int primary key,
    fechaComienzo datetime not null,
    fechaFinaliza datetime,
    descripcionEncuentro varchar(100) not null
);
create table Competencia_Colectiva
(
	idEncuentro int,
    primary key (idEncuentro)
);
create table Competencia_Individual
(
	idEncuentro int,
    primary key (idEncuentro)
);
create table Participa
(
	idEncuentro int,
    idParticipante int,
    primary key (idEncuentro,idParticipante)
);

create table Compite
(
	idEncuentro int,
    idEquipo int,
    idJugador int,
    primary key (idEncuentro,idEquipo,idJugador)
);
create table Alineacion
(
	idAlineacion int,
	idJugador int,
    Poscion varchar(60) not null,
	primary key(idAlineacion, idJugador)
);

create table Duracion
(
	idDuracion int primary key
);

create table Tiempo
(
	idDuracion int primary key,
    tiempo time not null
);

create table Rounds
(
	idDuracion int primary key,
    tiempoRound time not null,
    CantidadRound int not null
);
create table Sets
(
	idDuracion int primary key,
    CantidadSets int not null
);
create table Torneos
(
	idTorneo int primary key,
    fechaComienzo date not null,
    fechaFinalizado date,
    nombreTorneo varchar(40) not null
);

create table torneosIndividuales(
	idTorneo int primary key
);
create table torneosColectivos(
	idTorneo int primary key
);



create table ParticipatesTorneosIndividuales(
	idTorneo int,
    idParticipante int,
    primary key (idTorneo, idParticipante)
);


create table ParticipatesTorneosEquipos(
	idTorneo int,
    idEquipo int,
    primary key (idTorneo, idEquipo)
);


create table torneosTienenEncuentrosIndivi(
	idTorneo int, 
    idEncuentro int,
    primary key (idTorneo, idEncuentro)
);
create table torneosTienenEncuentrosEquipos(
	idTorneo int, 
    idEncuentro int,
    primary key (idTorneo, idEncuentro)
);



create table Realiza
(
	idDeporte int,
    idTorneo int,
    primary key (idDeporte,idTorneo)
);

create table Usuarios
(
	idUsuario int primary key
);
create table Vip
(
	idUsuario int primary key,
    correo varchar(60) not null ,
    contrasenia varchar(60) not null,
    nombre varchar(40) not null unique,
    mesesSuscritos int not null,
    rol int not null
);
create table EquiposFavoritos
(
	idUsuario int,
    idEquipoFavorito int,
    primary key (idUsuario,idEquipoFavorito)
);
create table DeportesFavoritos
(
	idUsuario int,
    deporteFavorito int,
    primary key (idUsuario,deporteFavorito)
);
create table Guest
(
	idUsuario int primary key,
    nombreAutogen varchar(100) not null
);
create table Visualiza
(
	idUsuario int,
    idEncuentro int,
    primary key (idUsuario,idEncuentro)
);	

create table Publicidad
(
	idPublicidad int primary key,
    url varchar(500)
);
create table Tiene_Usuario
(
	idPublicidad int,
    idUsuario int,
    primary key (idPublicidad,idUsuario)
);

create table Utiliza
(
	idAlineacion int,
    idEncuentro int,
    primary key(idAlineacion,idEncuentro)
);

alter table Realiza add constraint fk_realizaTorn foreign key (idTorneo) references Torneos(idTorneo);
alter table Realiza add constraint fk_realizaDepo foreign key (idDeporte) references Deportes(idDeporte);
alter table Vip add constraint uk_correo unique(correo);
alter table Competencia_Colectiva add constraint fk_compCole foreign key (idEncuentro) references Encuentros(idEncuentro);
alter table Competencia_Individual add constraint fk_compIndi foreign key (idEncuentro) references Encuentros(idEncuentro);
alter table Compite add constraint fk_compiteENCU foreign key (idEncuentro) references Competencia_Colectiva(idEncuentro);
alter table Compite add constraint fk_compiteEQUI foreign key (idEquipo) references Equipos(idEquipo);
alter table Compite add constraint fk_compiteJUGA foreign key (idJugador) references Jugador(idJugador);
alter table DeportesFavoritos add constraint fk_depoFavUSU foreign key (idUsuario) references Usuarios(idUsuario);
alter table DeportesFavoritos add constraint fk_depoFavDEPO foreign key (deporteFavorito) references Deportes(idDeporte);
alter table Forman add constraint fk_formanJUGA foreign key (idJugador) references Jugador(idJugador);
alter table Forman add constraint fk_formanEQUI foreign key (idEquipo) references Equipos(idEquipo);
alter table Guest add constraint fk_guest foreign key (idUsuario) references Usuarios(idUsuario);
alter table Participa add constraint fk_partiENCUE foreign key (idEncuentro) references Competencia_Individual(idEncuentro);
alter table Participa add constraint fk_partiPARTI foreign key (idParticipante) references Participantes(idParticipante);
alter table Practican add constraint fk_pracJUGA foreign key (idJugador) references Jugador(idJugador);
alter table Practican add constraint fk_pracEQUI foreign key (idEquipo) references Equipos(idEquipo);
alter table Practican add constraint fk_pracDEPO foreign key (idDeporte) references Deportes(idDeporte);
alter table Rankings add constraint fk_rankings foreign key (idResultado) references Resultados(idResultados);
alter table Rounds add constraint fk_rounds foreign key (idDuracion) references Duracion(idDuracion);
alter table Se_Especializa_En add constraint fk_seEspeDEPO foreign key (idDeporte) references Deportes(idDeporte);
alter table Se_Especializa_En add constraint fk_seEspePARTI foreign key (idParticipante) references Participantes(idParticipante);
alter table Sets add constraint fk_sets foreign key (idDuracion) references Duracion(idDuracion);
alter table Tiempo add constraint fk_tiempo foreign key (idDuracion) references Duracion(idDuracion);
alter table Tiene_Usuario add constraint fk_tiene_usuPUB foreign key (idPublicidad) references Publicidad(idPublicidad);
alter table Tiene_Usuario add constraint fk_tiene_usuUSU foreign key (idUsuario) references Guest(idUsuario);
alter table Vip add constraint fk_vip foreign key (idUsuario) references Usuarios(idUsuario);
alter table Visualiza add constraint fk_visaUSU foreign key (idUsuario) references Usuarios(idUsuario);
alter table Visualiza add constraint fk_visaENCU foreign key (idEncuentro) references Encuentros(idEncuentro);
alter table Deportes add constraint ck_depoCantJuga check (cantidadJugadores > 1);
alter table Jugador add constraint ck_jugaSexo check(sexo = 'f' or sexo = 'm');
alter table Participantes add constraint ck_partiSexo check(sexo = 'f' or sexo = 'm');
alter table Vip add constraint ck_usuRol check(rol >= 0);
alter table Vip add constraint ck_vipMesesSus check(mesesSuscritos > 0);



alter table Utiliza add CONSTRAINT `fk_utiliALI` FOREIGN KEY (`idAlineacion`) REFERENCES `Alineacion` (`idAlineacion`);
alter table Utiliza add CONSTRAINT `fk_utiliENCU` FOREIGN KEY (`idEncuentro`) REFERENCES `Encuentros` (`idEncuentro`);
alter table Genera add CONSTRAINT `fk_generaENCU` FOREIGN KEY (`idEncuentro`) REFERENCES `Encuentros` (`idEncuentro`);
alter table Genera add CONSTRAINT `fk_generaResu` FOREIGN KEY (`idResultado`) REFERENCES `Resultados` (`idResultados`);
alter table Hacen add CONSTRAINT `fk_hacenOcu` FOREIGN KEY (`idOcurrencia`) REFERENCES `Ocurrencias` (`idOcurrencia`);
alter table Hacen add CONSTRAINT `fk_hacenInci` FOREIGN KEY (`idIncidencia`) REFERENCES `Incidencias` (`idIncidencia`);
alter table Notifica add CONSTRAINT `fk_notificaInci` FOREIGN KEY (idIncidencia, idOcurrencia) REFERENCES Hacen (idIncidencia, idOcurrencia);
alter table Notifica add CONSTRAINT `fk_notificaEncu` FOREIGN KEY (`idEncuentro`) REFERENCES `Encuentros` (`idEncuentro`);

Alter table torneosIndividuales add constraint fk_torneosIndivi foreign key(idTorneo) references Torneos(idTorneo);
Alter table torneosColectivos add constraint fk_torneosColec foreign key(idTorneo) references Torneos(idTorneo);
Alter table ParticipatesTorneosIndividuales add constraint fk_torneosIndicIDTorneo foreign key(idTorneo) references torneosIndividuales(idTorneo);
Alter table ParticipatesTorneosIndividuales add constraint fk_torneosIndicIDParti foreign key(idParticipante) references Participantes(idParticipante);
Alter table ParticipatesTorneosEquipos add constraint fk_torneosColecIDTorneo foreign key(idTorneo) references torneosColectivos(idTorneo);
Alter table ParticipatesTorneosEquipos add constraint fk_torneosColecIDParti foreign key(idEquipo) references Equipos(idEquipo);
Alter table torneosTienenEncuentrosIndivi add constraint fk_torneostorneosIndiIDtorn foreign key(idTorneo) references torneosIndividuales(idTorneo);
Alter table torneosTienenEncuentrosIndivi add constraint fk_torneostorneosIndiIDencu foreign key(idEncuentro) references Competencia_Individual(idEncuentro);
Alter table torneosTienenEncuentrosEquipos add constraint fk_torneostorneoscolIDtorn foreign key(idTorneo) references torneosColectivos(idTorneo);
Alter table torneosTienenEncuentrosEquipos add constraint fk_torneostorneoscolIDencu foreign key(idEncuentro) references Competencia_Colectiva(idEncuentro);
alter table EquiposFavoritos add constraint fk_EquipoFavUSU foreign key (idEquipoFavorito) references Equipos(idEquipo);
alter table EquiposFavoritos add constraint fk_EquipoidUsu foreign key (idUsuario) references VIP(idUsuario);
alter table Alineacion add constraint fk_idJugadorAline foreign key (idJugador) references Jugador(idJugador);

alter table Puntos add constraint fk_idResu foreign key (idResultado) references Resultados(idResultados);
alter table Rankings add constraint fk_idResuRank foreign key (idResultado) references Resultados(idResultados);
alter table Particular add constraint fk_idResParti foreign key (idResultado) references Resultados(idResultados);

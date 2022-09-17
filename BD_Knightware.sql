create database KnightWare;
use Knightware;

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
create table particular
(
	idResultado int primary key,
    puntosPorSets int not null,
    sets int not null,
    ventaja boolean
);
create table Puntos
(
	idResultado int primary key,
    puntosLocal int not null,
    puntosVisi int not null

);

create table Aplica
(
	idDeporte int,
    idResultado int,
    primary key (idDeporte,idResultado)
);
 
 create table Reglas
(
	idReglas int primary key
);
create table Instrucciones
(
	idReglas int primary key,
    descripcion varchar(500) not null,
    titulo varchar(60) not null,
    subtitulo varchar(60)
);
create table Sanciones
(
	idReglas int primary key,
    razon varchar(500) not null,
    sancion varchar(500) not null
);
create table Poseen
(
	idDeporte int,
    idReglas int,
    primary key (idDeporte,idReglas)
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
    idResultado int,
    idParticipante int,
    primary key (idDeporte,idResultado,idparticipante)
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
	idJugador int,
    idEquipo int,
    primary key (idJugador,idEquipo)
);
create table Practican
(
	idJugador int,
    idEquipo int,
    idDeporte int,
    idResultado int,
    primary key (idEquipo,idJugador,idDeporte,idResultado)
);
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
	idAlineacion int primary key,
    formacion varchar(60) not null
);

create table Duracion
(
	idDuracion int primary key
);

create table Tiempo
(
	idDuracion int primary key,
    horas int,
    minutos int
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
    nombreTorneo varchar(40) not null,
    cantidadFases int not null
);
create table torneoInscriptos
(
	idTorneo int,
    inscriptos varchar(40),
    primary key(idTorneo,inscriptos)
);
create table realiza
(
	idDeporte int,
    idTorneo int,
    primary key (idDeporte,idTorneo)
);
create table Fase 
(
	idTorneo int,
    nFases int,
    estadoFase varchar(50) not null,
    nombreFase varchar(50) not null,
    primary key (idTorneo,nFases)
);

create table FaseInscriptos
(
	idTorneo int,
    nFases int,
    inscriptos varchar(40),
    primary key (idTorneo,nFases,inscriptos)
);
create table Tiene
(
	idTorneo int,
    nFases int,
    idEncuentro int,
    primary key (idTorneo,nFases,idEncuentro)
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

create table DeportesFavoritos
(
	idUsuario int,
    deporteFavorito int,
    primary key (idUsuario,deporteFavorito)
);
create table Guest
(
	idUsuario int primary key,
    nombreAutogen varchar(500) not null
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
    idEquipo int,
    idJugador int,
    primary key(idAlineacion,idEncuentro,idEquipo,idJugador)
);

alter table Vip add constraint uk_correo unique(correo);
alter table aplica add constraint fk_aplicaDEPO foreign key (idDeporte) references deportes(idDeporte);
alter table aplica add constraint fk_aplicaRESU foreign key (idResultado) references resultados(idResultados);
alter table competencia_colectiva add constraint fk_compCole foreign key (idEncuentro) references encuentros(idEncuentro);
alter table competencia_individual add constraint fk_compIndi foreign key (idEncuentro) references encuentros(idEncuentro);
alter table compite add constraint fk_compiteENCU foreign key (idEncuentro) references encuentros(idEncuentro);
alter table compite add constraint fk_compiteEQUI foreign key (idEquipo) references equipos(idEquipo);
alter table faseinscriptos add constraint fk_faseinscri foreign key (idTorneo,nFases) references fase(idTorneo,nFases);
alter table compite add constraint fk_compiteJUGA foreign key (idJugador) references jugador(idJugador);
alter table deportesfavoritos add constraint fk_depoFavUSU foreign key (idUsuario) references usuarios(idUsuario);
alter table deportesfavoritos add constraint fk_depoFavDEPO foreign key (deporteFavorito) references deportes(idDeporte);
alter table fase add constraint fk_fase foreign key (idTorneo) references torneos(idTorneo);
alter table forman add constraint fk_formanJUGA foreign key (idJugador) references jugador(idJugador);
alter table forman add constraint fk_formanEQUI foreign key (idEquipo) references equipos(idEquipo);
alter table guest add constraint fk_guest foreign key (idUsuario) references usuarios(idUsuario);
alter table instrucciones add constraint fk_instru foreign key (idReglas) references reglas(idReglas);
alter table participa add constraint fk_partiENCUE foreign key (idEncuentro) references encuentros(idEncuentro);
alter table participa add constraint fk_partiPARTI foreign key (idParticipante) references participantes(idParticipante);
alter table poseen add constraint fk_poseenDEPO foreign key (idDeporte) references deportes(idDeporte);
alter table poseen add constraint fk_poseenREG foreign key (idReglas) references reglas(idReglas);
alter table practican add constraint fk_pracJUGA foreign key (idJugador) references jugador(idJugador);
alter table practican add constraint fk_pracEQUI foreign key (idEquipo) references equipos(idEquipo);
alter table practican add constraint fk_pracDEPO foreign key (idDeporte) references deportes(idDeporte);
alter table practican add constraint fk_pracRESU foreign key (idResultado) references resultados(idResultados);
alter table rankings add constraint fk_rankings foreign key (idResultado) references resultados(idResultados);
alter table rounds add constraint fk_rounds foreign key (idDuracion) references duracion(idDuracion);
alter table sanciones add constraint fk_sancion foreign key (idReglas) references reglas(idReglas);
alter table se_especializa_en add constraint fk_seEspeDEPO foreign key (idDeporte) references deportes(idDeporte);
alter table se_especializa_en add constraint fk_seEspeRESU foreign key (idResultado) references resultados(idResultados);
alter table se_especializa_en add constraint fk_seEspePARTI foreign key (idParticipante) references participantes(idParticipante);
alter table sets add constraint fk_sets foreign key (idDuracion) references duracion(idDuracion);
alter table tiempo add constraint fk_tiempo foreign key (idDuracion) references duracion(idDuracion);
alter table tiene add constraint fk_tieneFASE foreign key (idTorneo,nFases) references fase(idTorneo,nFases);
alter table tiene add constraint fk_tieneENCU foreign key (idEncuentro) references encuentros(idEncuentro);
alter table tiene_usuario add constraint fk_tiene_usuPUB foreign key (idPublicidad) references publicidad(idPublicidad);
alter table tiene_usuario add constraint fk_tiene_usuUSU foreign key (idUsuario) references guest(idUsuario);
alter table vip add constraint fk_vip foreign key (idUsuario) references usuarios(idUsuario);
alter table visualiza add constraint fk_visaUSU foreign key (idUsuario) references usuarios(idUsuario);
alter table visualiza add constraint fk_visaENCU foreign key (idEncuentro) references encuentros(idEncuentro);
alter table deportes add constraint ck_depoCantJuga check (cantidadJugadores > 1);
alter table encuentros add constraint ck_encuDia check (dia < 32);
alter table encuentros add constraint ck_encuDia2 check (dia > 0);
alter table encuentros add constraint dk_encuMes check (mes < 13);
alter table encuentros add constraint dk_encuMes2 check (mes > 0);
alter table encuentros add constraint ck_encuAnio check (anio > 2000);
alter table encuentros add constraint ck_encuHora check (hora < 24);
alter table encuentros add constraint ck_encuHora2 check (hora >= 0);
alter table encuentros add constraint ck_encuMinuto check (minuto < 61);
alter table encuentros add constraint ck_encuMinuto2 check (minuto >=0);
alter table encuentros alter column termino set default 0;
alter table jugador add constraint ck_jugaEdad check(edad > 17);
alter table jugador add constraint ck_jugaSexo check(sexo = 'f' or sexo = 'm');
alter table participantes add constraint ck_partiEdad check(edad > 5);
alter table participantes add constraint ck_partiSexo check(sexo = 'f' or sexo = 'm');
alter table tiempo add constraint ck_tiempoHoras check(horas >= 0);
alter table tiempo add constraint ck_tiempoHoras2 check(horas < 25);
alter table tiempo add constraint ck_tiempoMinu check(minutos < 61);
alter table tiempo add constraint ck_tiempoMinu2 check(minutos >= 0);
alter table vip add constraint ck_usuRol check(rol >= 0);
alter table vip add constraint ck_vipMesesSus check(mesesSuscritos > 0);
alter table utiliza add CONSTRAINT `fk_utiliALI` FOREIGN KEY (`idAlineacion`) REFERENCES `alineacion` (`idAlineacion`);
alter table utiliza add CONSTRAINT `fk_utiliENCU` FOREIGN KEY (`idEncuentro`) REFERENCES `encuentros` (`idEncuentro`);
alter table utiliza add CONSTRAINT `fk_utiliEQUI` FOREIGN KEY (`idEquipo`) REFERENCES `equipos` (`idEquipo`);
alter table utiliza add CONSTRAINT `fk_utiliJUGA` FOREIGN KEY (`idJugador`) REFERENCES `jugador` (`idJugador`);
	


insert into alineacion(idAlineacion,formacion) /*insertar valores a la tabla alineacion*/ 
values 
(1,'1-2-3'),
(2,'4-8-3'),
(3,'6-1-3'),
(4,'en triangulo'),
(5,'en cuadrado');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into deportes(idDeporte,cantidadJugadores,categoria,nombre) /*insertar valores a la tabla deportes*/ 
values 
(1,2,'pelota','futbol'),
(2,2,'pelota','basquetbol'),
(3,2,'pelota','handball'),
(4,2,'pelota','voleybol'),
(5,2,'mental','ajedrez'),
(6,2,'palo','cricket'),
(7,2,'palo','equitacion');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/

insert into duracion(idDuracion) /*insertar valores a la tabla duracion padre*/
values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into encuentros(idEncuentro,dia,mes,anio,hora,minuto,termino) /*insertar valores a la tabla encuentros(para el valor termino si es 0 es que sigue sucediendo)*/
values
(1,3,6,2003,16,30,false),
(2,13,1,2003,16,30,false),
(3,30,2,2003,16,30,true),
(4,7,3,2003,16,30,false),
(5,24,4,2003,16,30,true),
(6,20,5,2003,16,30,true);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into equipos(idEquipo,categoria,logo,nombre,pais) /*insertar valores a la tabla equipos*/
values
(1,'primera','http//megalovania','barcelona','españa'),
(2,'segunda','http//megalovania','real madrid','españa'),
(3,'tercera','http//megalovania','barcelona','españa'),
(4,'sub-15','http//megalovania','aguada','uruguay'),
(5,'sub-16','http//megalovania','redbull','estados unidos'),
(6,'sub-17','http//megalovania','lakers','estados unidos');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into jugador(idJugador,nombre,apellido,edad,sexo,paisNacimiento) /*insertar valores a la tabla jugador*/
values
(1,'luis','suarez',25,'m','uruguay'),
(2,'lionel','messi',30,'m','argentina'),
(3,'pamela','cuevas',20,'f','colombia'),
(4,'eric','cruz',20,'m','rusia'),
(5,'lolo','momo',20,'f','chekoslovaquia'),
(6,'lala','mama',20,'f','francia'),
(7,'lele','meme',20,'f','italia');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into participantes(idParticipante,nombre,apellido,edad,sexo,paisNacimiento)/*insertar valores a la tabla participantes*/
values
(1,'alberto','perez',19,'m','españa'),
(2,'gonzalo','ballestrino',32,'m','uruguay'),
(3,'ignacio','carvajal',57,'m','mexico'),
(4,'sebastian','arevalo',42,'m','argentina'),
(5,'mirta','legran',98,'f','argentina');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into publicidad(idPublicidad,url)/*insertar valores a la tabla publicidad*/
values
(1,'http//la_monalisa'),
(2,'http//jabones_dove'),
(3,'http//azucar_bella_union'),
(4,'http//jugo_ades'),
(5,'http//gatorade');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/

insert into puntos(idResultado,puntosLocal,puntosVisi)/*insertar valores a la tabla puntos*/
values
(1,1,2),
(2,2,1),
(3,14,78),
(4,1,1),
(5,1,9);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into reglas(idReglas) /*insertar valores a la tabla reglas padre*/
values
(1),
(2),
(3),
(4),
(5);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into instrucciones(idReglas,descripcion,titulo,subtitulo)/*insertar valores a la tabla instrucciones*/
values
(1,'abc','a','b'),
(2,'acc','b','ba'),
(3,'aac','c','br'),
(4,'adc','d','bf'),
(5,'arc','k','bg');

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into particular(idResultado,puntosPorSets,sets,ventaja)/*insertar valores a la tabla particular*/
values
(1,15,2,null),
(2,30,3,null),
(3,45,4,false),
(4,45,4,true),
(5,0,2,null);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into resultados(idResultados)/*insertar valores a la tabla resultados padre*/
values
(1),
(2),
(3),
(4),
(5);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into rankings(idResultado,segundosDiff,minutosDiff,horasDiff,segundosTrans,minutosTrans,horasTrans,puntos,nombreJugador,posicion)/*insertar valores a la tabla rankings*/
values
(1,4,18,9,10,32,7,100,'jose',1),
(2,8,23,12,10,32,6,40,'pepe',2),
(3,2,30,19,10,32,5,60,'manolo',3),
(4,1,44,2,10,32,4,null,'alberto',4),
(5,59,1,0,10,32,3,80,'gilberto',5);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into sets(idDuracion,cantidadSets)/*insertar valores a la tabla sets*/
values
(1,1),
(2,2),
(3,5),
(4,10),
(5,2);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into tiempo(idDuracion,horas,minutos)/*insertar valores a la tabla tiempo*/
values
(1,23,49),
(2,14,20),
(3,10,59),
(4,18,2),
(5,1,24);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into forman(idJugador,idEquipo)/*insertar valores a la tabla forman*/
values
(1,2),
(2,1),
(1,3),
(3,1),
(1,4);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into rounds(idDuracion,tiempoRound,CantidadRound)/*insertar valores a la tabla rounds*/
values
(1,'10:12:00',1),
(2,'11:59:23',2),
(3,'10:40:01',3),
(4,'10:18:11',4),
(5,'10:23:39',5);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into sanciones(idReglas,razon,sancion)/*insertar valores a la tabla sanciones*/
values
(1,'jajajajja','adasdva'),
(2,'fasdfasd','asdfsdfasdf'),
(3,'asdfasdfasdf','asdfsdfasd'),
(4,'asdfasd','asdfsdfas'),
(5,'asdfsdfasdfsda','asdfasdfasdf');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into torneos(idTorneo,fechaComienzo,fechaFinalizado,nombreTorneo,cantidadFases)/*insertar valores a la tabla torneos*/
values
(1,'2003-6-20','2010-6-20','speed',3),
(2,'2002-2-1','2022-8-9','redbull',4),
(3,'2020-9-9','2022-12-8','bishop',5),
(4,'1999-12-31','2000-1-1','new year walk',6),
(5,'2009-1-1','2119-12-31','jo mama',7);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into usuarios(idUsuario)/*insertar valores a la tabla ususarios padre*/ 
values
(1),
(2),
(3),
(4),
(5);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into guest(idUsuario,nombreAutogen)/*insertar valores a la tabla guest*/
values
(1,'yagsdvbasdvasdvkjhgk'),
(2,'iuasdhgvaiolsudhv'),
(3,'asduvhaiosdkuvghbads'),
(4,'asyuidgvaiosdvguyh'),
(5,'asduivhasdiuvhasdhsdg');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/

insert into vip(idUsuario,correo,contrasenia,nombre,mesesSuscritos,rol)/*insertar valores a la tabla vip*/
values
(1,'a@gmail.com','123','juan',4,1),
(2,'b@gmail.com','321','pablo',12,23),
(3,'c@gmail.com','132','lorenzo',24,2),
(4,'d@gmail.com','213','emiliano',1,34),
(5,'e@gmail.com','321','clara',100,2);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into visualiza(idUsuario,idEncuentro)/*insertar valores a la tabla visualiza*/
values
(1,1),
(1,2),
(2,1),
(1,3),
(3,1);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into fase(idTorneo,nFases,estadoFase,nombreFase)/*insertar valores a la tabla fases*/
values
(1,2,'3 equipos en pies','aguila'),
(2,2,'2 equipos en pies','tigre'),
(3,2,'1 equipos en pies','abeja'),
(1,1,'32 restantes','primera parte'),
(1,4,'no se','segunda parte');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into aplica(idDeporte,idResultado)  /*insertar valores a la tabla aplica*/
values
(1,2),
(1,3),
(1,4),
(3,1),
(2,1);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into competencia_colectiva(idEncuentro) /*insertar valores a la tabla competencia colectiva*/
values
(1),
(2),
(3);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into competencia_individual(idEncuentro) /*insertar valores a la tabla competencia individual*/ 
values
(1),
(4),
(5);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into compite(idEncuentro,idEquipo,idJugador)/*insertar valores a la tabla compite*/
values
(1,1,1),
(1,3,5),
(2,3,4),
(1,1,3),
(2,2,1);

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into deportesFavoritos(idUsuario,DeporteFavorito)/*insertar valores a la tabla deportes favoritos*/
values
(1,1),
(2,1),
(1,2),
(3,1),
(1,3);

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into faseinscriptos(idTorneo,nFases,inscriptos)/*insertar valores a la tabla fases inscriptos*/
values
(1,2,'mateo'),
(2,2,'gustavo'),
(3,2,'air force'),
(1,1,'the beatles'),
(1,4,'rocola fubol clu');

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into participa(idEncuentro,idParticipante)/*insertar valores a la tabla participa*/
values
(1,1),
(1,2),
(1,3),
(4,1),
(5,1);

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/

insert into poseen(idDeporte,idReglas)/*insertar valores a la tabla poseen*/
values
(1,1),
(2,1),
(3,1),
(1,2),
(1,3);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/

insert into practican(idJugador,idEquipo,idDeporte,idResultado)/*insertar valores a la tabla practican*/
values
(1,1,1,1),
(1,2,1,1),
(1,1,3,1),
(1,1,1,4),
(5,1,1,1);

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into realiza(idDeporte,idTorneo)/*insertar valores a la tabla realiza*/
values
(1,1),
(1,2),
(1,3),
(2,1),
(3,1);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into se_especializa_en(idDeporte,idResultado,idParticipante)/*insertar valores a la tabla se especializa en*/
values
(1,1,1),
(1,2,1),
(1,1,3),
(2,1,1),
(1,3,1);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/

insert into tiene(idTorneo,nFases,idEncuentro)/*insertar valores a la tabla tiene*/
values
(1,2,1),
(2,2,1),
(3,2,3),
(1,4,1),
(1,1,2);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into tiene_usuario(idPublicidad,idUsuario)/*insertar valores a la tabla tiene usuario*/
values
(1,1),
(1,2),
(2,1),
(1,4),
(3,1);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into torneoInscriptos(idTorneo,inscriptos)/*insertar valores a la tabla tiene torneos inscriptos*/
values
(1,'juan'),
(2,'javier'),
(3,'pablo'),
(4,'luis'),
(5,'maria');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into utiliza (idAlineacion, idEncuentro, idEquipo, idJugador)
values
(1,2,2,1),
(2,6,1,1),
(3,3,2,1),
(5,1,4,1);

/*///////////////////////////Creacion usuarios y permisos//////////////////////////////////////////////////////////*/

create user 'usuarioConsultas'@'localhost' identified by 'consultasSQL';
GRANT SELECT ON KnightWare.* TO 'usuarioConsultas';
GRANT update, insert ON KnightWare.Vip TO 'usuarioConsultas';
GRANT update, insert ON KnightWare.Usuarios TO 'usuarioConsultas';

create user 'usuarioAdministrador'@'localhost' identified by 'administrador1234';
GRANT ALL ON KnightWare.* TO 'usuarioAdministrador';


/*Only in case of emergency with the users
drop database knightware;
select user, Host from mysql.user;
drop user 'usuarioConsultas'@'localhost';
drop user 'usuarioAdministrador'@'localhost';
*/
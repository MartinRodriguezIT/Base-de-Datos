create table FaseInscriptos
(
	idTorneo int,
    nFases int,
    inscriptos varchar(40),
    primary key (idTorneo,nFases,inscriptos)
)
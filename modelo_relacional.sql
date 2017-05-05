 -- Modelo Relacional

CREATE DATABASE Mundial2017;
USE Mundial2017;

 -- Pais (codigo_pais, nombre)

CREATE TABLE Pais (codigo char(2) NOT NULL PRIMARY KEY, nombre varchar(64) NOT NULL);

 -- Maestro (placa, nombre, apellido, graduacion)

CREATE TABLE Maestro (placa int2 unsigned NOT NULL PRIMARY KEY, nombre varchar(64) NOT NULL, apellido varchar(64) NOT NULL, graduacion int1 unsigned NOT NULL);

 -- Escuela (id_escuela, nombre, placa_maestro, codigo_pais)

CREATE TABLE Escuela (id_escuela int2 unsigned NOT NULL auto_increment PRIMARY KEY, nombre varchar(64) NOT NULL, placa_maestro int2 unsigned NOT NULL, codigo_pais char(2) NOT NULL);

ALTER TABLE Escuela ADD CONSTRAINT fk_escuela_maestro
FOREIGN KEY (placa_maestro) REFERENCES Maestro(placa);

ALTER TABLE Escuela ADD CONSTRAINT fk_escuela_pais
FOREIGN KEY (codigo_pais) REFERENCES Pais(codigo);

 -- Participante (id_itf, nombre, apellido, graduacion, foto, id_escuela, tipo)

CREATE TABLE Participante (
  id_itf int(10) unsigned NOT NULL,
  nombre varchar(45) NOT NULL,
  apellido varchar(45) NOT NULL,
  graduacion varchar(45) NOT NULL,
  foto longblob,
  id_escuela smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (id_itf)
);

ALTER TABLE Participante ADD CONSTRAINT fk_participante_escuela
FOREIGN KEY (id_escuela) REFERENCES Escuela(id_escuela);

 -- Coach (itf, nombre, apellido, id_escuela)

CREATE TABLE Coach (id_itf int(10) unsigned NOT NULL PRIMARY KEY);

ALTER TABLE Coach ADD CONSTRAINT fk_coach_participante
FOREIGN KEY (id_itf) REFERENCES Participante(id_itf);

 -- Competidor (id_itf, dni, nombre, apellido, genero, fecha_nacimiento, peso, graduacion, id_escuela)

CREATE TABLE Competidor (id_itf int(10) unsigned NOT NULL PRIMARY KEY, dni int2 unsigned NOT NULL, genero char(1) NOT NULL, fecha_nacimiento date NOT NULL, peso int1 unsigned NOT NULL);

ALTER TABLE Competidor ADD CONSTRAINT fk_competidor_participante
FOREIGN KEY (id_itf) REFERENCES Participante(id_itf);

 -- Equipo (id_equipo, nombre)

CREATE TABLE Equipo (id_equipo int2 unsigned NOT NULL auto_increment PRIMARY KEY, nombre varchar(128) NOT NULL);

 -- EquipoCompetidor (id_equipo, id_itf_competidor)

CREATE TABLE EquipoCompetidor (id_equipo int2 unsigned NOT NULL, id_itf_competidor int(10) unsigned NOT NULL, suplente int(1) default 0, PRIMARY KEY (id_equipo, id_itf_competidor));


ALTER TABLE EquipoCompetidor ADD CONSTRAINT fk_equipoCompetidor_equipo
FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo);


ALTER TABLE EquipoCompetidor ADD CONSTRAINT fk_equipoCompetidor_competidor
FOREIGN KEY (id_itf_competidor) REFERENCES Competidor(id_itf);

 -- Modalidad (id_modalidad)

CREATE TABLE Modalidad (id_modalidad int1 unsigned NOT NULL auto_increment PRIMARY KEY);

 -- Categoria (id_categoria, sexo, id_modalidad, tipo) // tipo = I o E

CREATE TABLE Categoria (id_categoria int2 unsigned NOT NULL auto_increment PRIMARY KEY, sexo char(1) NOT NULL, id_modalidad int1 unsigned NOT NULL, tipo char(1) NOT NULL);


ALTER TABLE Categoria ADD CONSTRAINT fk_categoria_modalidad
FOREIGN KEY (id_modalidad) REFERENCES Modalidad(id_modalidad);

 -- CategoriaIndividual (id_categoria, tipo) // tipo in (R, C, F, S)

CREATE TABLE CategoriaIndividual (id_categoria int2 unsigned NOT NULL PRIMARY KEY, tipo char(1) NOT NULL);


ALTER TABLE CategoriaIndividual ADD CONSTRAINT fk_categoriaIndividual_categoria
FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria);

 -- CategoriaPorEquipos (id_categoria)

CREATE TABLE CategoriaPorEquipos (id_categoria int2 unsigned NOT NULL PRIMARY KEY);


ALTER TABLE CategoriaPorEquipos ADD CONSTRAINT fk_categoriaPorEquipos_categoria
FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria);

 -- CategoriaRoturaPotenciaIndividual (id_categoria) // no hace falta, se deduce del tipo
 -- CategoriaCombateIndividual (id_categoria, peso, edad)

CREATE TABLE CategoriaCombateIndividual (id_categoria int2 unsigned NOT NULL PRIMARY KEY, peso int1 unsigned NOT NULL, edad int1 unsigned NOT NULL);


ALTER TABLE CategoriaCombateIndividual ADD CONSTRAINT fk_categoriaCombateIndividual_categoria
FOREIGN KEY (id_categoria) REFERENCES CategoriaIndividual(id_categoria);

 -- CategoriaFormasIndiviual (id_categoria, edad)

CREATE TABLE CategoriaFormasIndiviual (id_categoria int2 unsigned NOT NULL PRIMARY KEY, edad int1 unsigned NOT NULL);


ALTER TABLE CategoriaFormasIndiviual ADD CONSTRAINT fk_categoriaFormasIndividual_categoria
FOREIGN KEY (id_categoria) REFERENCES CategoriaIndividual(id_categoria);

 -- CategoriaSaltoIndividual (id_categoria, edad)

CREATE TABLE CategoriaSaltoIndividual (id_categoria int2 unsigned NOT NULL PRIMARY KEY, edad int1 unsigned NOT NULL);


ALTER TABLE CategoriaSaltoIndividual ADD CONSTRAINT fk_categoriaSaltoIndividual_categoria
FOREIGN KEY (id_categoria) REFERENCES CategoriaIndividual(id_categoria);

 -- InscripcionIndividual (id_itf_competidor, id_categoria)

CREATE TABLE InscripcionIndividual (id_itf_competidor int(10) unsigned NOT NULL, id_categoria int2 unsigned NOT NULL, PRIMARY KEY (id_itf_competidor, id_categoria));


ALTER TABLE InscripcionIndividual ADD CONSTRAINT fk_inscripcionIndividual_competidor
FOREIGN KEY (id_itf_competidor) REFERENCES Competidor(id_itf);


ALTER TABLE InscripcionIndividual ADD CONSTRAINT fk_inscripcionIndividual_categoria
FOREIGN KEY (id_categoria) REFERENCES CategoriaIndividual(id_categoria);

 -- MedallaIndividual (id_itf_competidor, id_categoria, puesto)

CREATE TABLE MedallaIndividual (id_itf_competidor int(10) unsigned NOT NULL, id_categoria int2 unsigned NOT NULL, puesto int1 unsigned NOT NULL, PRIMARY KEY (id_itf_competidor, id_categoria));


ALTER TABLE MedallaIndividual ADD CONSTRAINT fk_medallaIndividual_competidor
FOREIGN KEY (id_itf_competidor) REFERENCES Competidor(id_itf);


ALTER TABLE MedallaIndividual ADD CONSTRAINT fk_medallaIndividual_categoria
FOREIGN KEY (id_categoria) REFERENCES CategoriaIndividual(id_categoria);

 -- InscripcionEquipo (id_equipo, id_categoria)

CREATE TABLE InscripcionEquipo (id_equipo int2 unsigned NOT NULL, id_categoria int2 unsigned NOT NULL, PRIMARY KEY (id_equipo, id_categoria));


ALTER TABLE InscripcionEquipo ADD CONSTRAINT fk_inscripcionEquipo_equipo
FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo);


ALTER TABLE InscripcionEquipo ADD CONSTRAINT fk_inscripcionEquipo_categoria
FOREIGN KEY (id_categoria) REFERENCES CategoriaPorEquipos(id_categoria);

 -- MedallaEquipo (id_equipo, id_categoria, puesto)

CREATE TABLE MedallaEquipo (id_equipo int2 unsigned NOT NULL, id_categoria int2 unsigned NOT NULL, puesto int1 unsigned NOT NULL, PRIMARY KEY (id_equipo, id_categoria));


ALTER TABLE MedallaEquipo ADD CONSTRAINT fk_medallaEquipo_equipo
FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo);


ALTER TABLE MedallaEquipo ADD CONSTRAINT fk_medallaEquipo_categoria
FOREIGN KEY (id_categoria) REFERENCES CategoriaPorEquipos(id_categoria);

 -- Ring (id_ring)

CREATE TABLE Ring (id_ring int2 unsigned NOT NULL PRIMARY KEY);

 -- RingCategoria (id_ring, id_categoria)

CREATE TABLE RingCategoria (id_ring int2 unsigned NOT NULL, id_categoria int2 unsigned NOT NULL, PRIMARY KEY (id_ring, id_categoria));


ALTER TABLE RingCategoria ADD CONSTRAINT fk_ringCategoria_ring
FOREIGN KEY (id_ring) REFERENCES Ring(id_ring);


ALTER TABLE RingCategoria ADD CONSTRAINT fk_ringCategoria_categoria
FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria);

 -- Arbitro (placa, nombre, apellido, graduacion, codigo_pais)

CREATE TABLE Arbitro (placa int2 unsigned NOT NULL PRIMARY KEY, nombre varchar(64) NOT NULL, apellido varchar(64) NOT NULL, graduacion int1 unsigned NOT NULL, codigo_pais char(2) NOT NULL);


ALTER TABLE Arbitro ADD CONSTRAINT fk_arbitro_pais
FOREIGN KEY (codigo_pais) REFERENCES Pais(codigo);

 -- FuncionArbitraje (id_funcion_arbitraje, nombre)

CREATE TABLE FuncionArbitraje (id_funcion_arbitraje int1 unsigned NOT NULL auto_increment PRIMARY KEY, nombre varchar(64) NOT NULL);

 -- RingConsejoArbitros (id_ring, placa_arbitro, id_funcion_arbitraje)

CREATE TABLE RingConsejoArbitros (id_ring int2 unsigned NOT NULL, placa_arbitro int2 unsigned NOT NULL, id_funcion_arbitraje int1 unsigned NOT NULL, PRIMARY KEY (id_ring, placa_arbitro));


ALTER TABLE RingConsejoArbitros ADD CONSTRAINT fk_ringConsejoArbitros_ring
FOREIGN KEY (id_ring) REFERENCES Ring(id_ring);


ALTER TABLE RingConsejoArbitros ADD CONSTRAINT fk_ringConsejoArbitros_arbitro
FOREIGN KEY (placa_arbitro) REFERENCES Arbitro(placa);


ALTER TABLE RingConsejoArbitros ADD CONSTRAINT fk_ringConsejoArbitros_funcionArbitraje
FOREIGN KEY (id_funcion_arbitraje) REFERENCES FuncionArbitraje(id_funcion_arbitraje);

 -- Modelo Relacional

CREATE DATABASE Mundial2017;
USE Mundial2017;

 -- Pais (codigo_pais, nombre)

CREATE TABLE Pais (codigo char(2) NOT NULL PRIMARY KEY, nombre varchar(64) NOT NULL);

 -- Maestro (placa, nombre, apellido, graduacion, codigo_pais)

CREATE TABLE Maestro (placa int2 unsigned NOT NULL PRIMARY KEY, nombre varchar(64) NOT NULL, apellido varchar(64) NOT NULL, graduacion int1 unsigned NOT NULL, codigo_pais char(2) NOT NULL);


ALTER TABLE Maestro ADD CONSTRAINT fk_maestro_pais
FOREIGN KEY (codigo_pais) REFERENCES Pais(codigo);

 -- Escuela (id_escuela, nombre, placa_maestro)

CREATE TABLE Escuela (id_escuela int2 unsigned NOT NULL auto_increment PRIMARY KEY, nombre varchar(64) NOT NULL, placa_maestro int2 unsigned NOT NULL);
ALTER TABLE Escuela ADD CONSTRAINT fk_escuela_maestro
FOREIGN KEY (placa_maestro) REFERENCES Maestro(placa);

 -- Coach (itf, nombre, apellido, id_escuela)

CREATE TABLE Coach (itf int2 unsigned NOT NULL PRIMARY KEY, nombre varchar(64) NOT NULL, apellido varchar(64) NOT NULL, id_escuela int2 unsigned NOT NULL);
ALTER TABLE Coach ADD CONSTRAINT fk_coach_escuela
FOREIGN KEY (id_escuela) REFERENCES Escuela(id_escuela);

 -- Competidor (dni, nombre, apellido, genero, fecha_nacimiento, peso, graduacion, id_escuela)

CREATE TABLE Competidor (dni int2 unsigned NOT NULL PRIMARY KEY, nombre varchar(64) NOT NULL, apellido varchar(64) NOT NULL, genero char(1) NOT NULL, fecha_nacimiento date NOT NULL, peso int1 unsigned NOT NULL, graduacion int1 unsigned NOT NULL, id_escuela int2 unsigned NOT NULL);


ALTER TABLE Competidor ADD CONSTRAINT fk_competidor_escuela
FOREIGN KEY (id_escuela) REFERENCES Escuela(id_escuela);

 -- Equipo (id_equipo, nombre)

CREATE TABLE Equipo (id_equipo int2 unsigned NOT NULL auto_increment PRIMARY KEY, nombre varchar(128) NOT NULL);

 -- EquipoCompetidores (id_equipo, dni_competidor)

CREATE TABLE EquipoCompetidores (id_equipo int2 unsigned NOT NULL, dni_competidor int2 unsigned NOT NULL, PRIMARY KEY (id_equipo, dni_competidor));


ALTER TABLE EquipoCompetidores ADD CONSTRAINT fk_equipoCompetidor_equipo
FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo);


ALTER TABLE EquipoCompetidores ADD CONSTRAINT fk_equipoCompetidor_competidor
FOREIGN KEY (dni_competidor) REFERENCES Competidor(dni);

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

 -- InscripcionesIndividuales (dni_competidor, id_categoria)

CREATE TABLE InscripcionesIndividuales (dni_competidor int2 unsigned NOT NULL, id_categoria int2 unsigned NOT NULL, PRIMARY KEY (dni_competidor, id_categoria));


ALTER TABLE InscripcionesIndividuales ADD CONSTRAINT fk_inscripcionIndividual_competidor
FOREIGN KEY (dni_competidor) REFERENCES Competidor(dni);


ALTER TABLE InscripcionesIndividuales ADD CONSTRAINT fk_inscripcionIndividual_categoria
FOREIGN KEY (id_categoria) REFERENCES CategoriaIndividual(id_categoria);

 -- MedallasIndividuales (dni_competidor, id_categoria, puesto)

CREATE TABLE MedallasIndividuales (dni_competidor int2 unsigned NOT NULL, id_categoria int2 unsigned NOT NULL, puesto int1 unsigned NOT NULL, PRIMARY KEY (dni_competidor, id_categoria));


ALTER TABLE MedallasIndividuales ADD CONSTRAINT fk_medallaIndividual_competidor
FOREIGN KEY (dni_competidor) REFERENCES Competidor(dni);


ALTER TABLE MedallasIndividuales ADD CONSTRAINT fk_medallaIndividual_categoria
FOREIGN KEY (id_categoria) REFERENCES CategoriaIndividual(id_categoria);

 -- InscripcionesEquipos (id_equipo, id_categoria)

CREATE TABLE InscripcionesEquipos (id_equipo int2 unsigned NOT NULL, id_categoria int2 unsigned NOT NULL, PRIMARY KEY (id_equipo, id_categoria));


ALTER TABLE InscripcionesEquipos ADD CONSTRAINT fk_inscripcionEquipo_equipo
FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo);


ALTER TABLE InscripcionesEquipos ADD CONSTRAINT fk_inscripcionEquipo_categoria
FOREIGN KEY (id_categoria) REFERENCES CategoriaPorEquipos(id_categoria);

 -- MedallasEquipos (id_equipo, id_categoria, puesto)

CREATE TABLE MedallasEquipos (id_equipo int2 unsigned NOT NULL, id_categoria int2 unsigned NOT NULL, PRIMARY KEY (id_equipo, id_categoria));


ALTER TABLE MedallasEquipos ADD CONSTRAINT fk_medallaEquipo_equipo
FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo);


ALTER TABLE MedallasEquipos ADD CONSTRAINT fk_medallaEquipo_categoria
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

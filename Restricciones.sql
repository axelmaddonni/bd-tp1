DELIMITER $$
CREATE TRIGGER chequeo_coach_cada_5_competidores
     BEFORE INSERT ON Competidor FOR EACH ROW
     BEGIN
          DECLARE id_escuela_nuevo_competidor INT;
          SELECT id_escuela INTO id_escuela_nuevo_competidor FROM Participante WHERE id_itf = NEW.id_itf;
          IF ((1 + (SELECT COUNT(c.id_itf) FROM Competidor c join Participante p on c.id_itf = p.id_itf where p.id_escuela = id_escuela_nuevo_competidor)) div 5 > (SELECT COUNT(c.id_itf) FROM Coach c
               JOIN Participante p on c.id_itf = p.id_itf WHERE p.id_escuela = id_escuela_nuevo_competidor))
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'No se puede agregar otro competidor sin agregar otro Coach de la misma escuela';
          END IF;
     END
$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `InscribirEquipo`(
	nombre varchar(128),
	id_itf_titular1 int(10),
	id_itf_titular2 int(10),
	id_itf_titular3 int(10),
	id_itf_titular4 int(10),
	id_itf_titular5 int(10),
	id_itf_suplente1 int(10),
	id_itf_suplente2 int(10),
	id_itf_suplente3 int(10)
)
BEGIN  
       DECLARE id_nuevo_equipo INT;
       IF (SELECT COUNT(distinct(id_escuela)) FROM Participante WHERE id_itf IN (id_itf_titular1, id_itf_titular2, id_itf_titular3, id_itf_titular4, id_itf_titular5, id_itf_suplente1, id_itf_suplente2, id_itf_suplente3) ) > 1
       THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Los integrantes del equipo no pertenecen a la misma escuela';
       END IF;
       INSERT INTO Equipo VALUES (default, nombre);
       SELECT max(id_equipo) INTO id_nuevo_equipo FROM Equipo;
       INSERT INTO EquipoCompetidor VALUES (id_nuevo_equipo, id_itf_titular1, 'T');
       INSERT INTO EquipoCompetidor VALUES (id_nuevo_equipo, id_itf_titular2, 'T');
       INSERT INTO EquipoCompetidor VALUES (id_nuevo_equipo, id_itf_titular3, 'T');
       INSERT INTO EquipoCompetidor VALUES (id_nuevo_equipo, id_itf_titular4, 'T');
       INSERT INTO EquipoCompetidor VALUES (id_nuevo_equipo, id_itf_titular5, 'T');
       INSERT INTO EquipoCompetidor VALUES (id_nuevo_equipo, id_itf_suplente1, 'S');
       INSERT INTO EquipoCompetidor VALUES (id_nuevo_equipo, id_itf_suplente2, 'S');
       INSERT INTO EquipoCompetidor VALUES (id_nuevo_equipo, id_itf_suplente3, 'S');
END
$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CargarResultadosCategoriaIndividual`(
	id_categoria int2,
	itf_competidor_puesto1 int(10),
	itf_competidor_puesto2 int(10),
	itf_competidor_puesto3 int(10)
)
BEGIN
       INSERT INTO MedallaIndividual VALUES (itf_competidor_puesto1, id_categoria, 1);
       INSERT INTO MedallaIndividual VALUES (itf_competidor_puesto2, id_categoria, 2);
       INSERT INTO MedallaIndividual VALUES (itf_competidor_puesto3, id_categoria, 3);
END
$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CargarResultadosCategoriaEquipos`(
	id_categoria int2,
	id_equipo_puesto1 int(10),
	id_equipo_puesto2 int(10),
	id_equipo_puesto3 int(10)
)
BEGIN
       INSERT INTO MedallaEquipo VALUES (id_equipo_puesto1, id_categoria, 1);
       INSERT INTO MedallaEquipo VALUES (id_equipo_puesto2, id_categoria, 2);
       INSERT INTO MedallaEquipo VALUES (id_equipo_puesto3, id_categoria, 3);
END
$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `esRingCompleto`(
  id_ring1 SMALLINT(5)
)
BEGIN  
       DECLARE id_nuevo_equipo INT;
       IF NOT (EXISTS (SELECT null FROM RingConsejoArbitros rca WHERE id_ring1 = rca.id_ring AND rca.id_funcion_arbitraje = 0) AND
          EXISTS (SELECT null FROM RingConsejoArbitros rca WHERE id_ring1 = rca.id_ring AND rca.id_funcion_arbitraje = 1) AND
          (SELECT count(*) FROM RingConsejoArbitros rca WHERE id_ring1 = rca.id_ring AND rca.id_funcion_arbitraje = 2) > 1 AND
          (SELECT count(*) FROM RingConsejoArbitros rca WHERE id_ring1 = rca.id_ring AND rca.id_funcion_arbitraje = 2) >= 3)
       THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'El ring es inválido pues el consejo arbitral está incompleto.';
       END IF;
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER graduacion_arbitro_es_suficiente
     BEFORE INSERT ON RingConsejoArbitros FOR EACH ROW
     BEGIN
          IF (SELECT a.graduacion FROM Arbitro a WHERE a.placa = NEW.placa_arbitro) <= (SELECT cfi.graduacion FROM (RingCategoria ra INNER JOIN CategoriaFormasIndividual cfi ON ra.id_categoria = cfi.id_categoria) racfi WHERE NEW.id_ring = racfi.id_ring)
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Un árbitro no puede arbitrar una categoría de formas de graduación mayor a la suya.';
          END IF;
     END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `inscripto_satisface_requisitos_categoria` BEFORE INSERT ON `InscripcionesIndividuales` FOR EACH ROW
BEGIN
  IF  (SELECT comp.genero FROM Competidor comp WHERE comp.id_itf = NEW.id_competidor) !=
    (SELECT cat.sexo FROM Categoria cat WHERE cat.id_categoria = NEW.id_categoria)
  THEN 
    SIGNAL sqlstate '45000'
      SET message_text = 'El género del competidor debe coincidir con el de la categoría.';
  END IF;
    
  IF  EXISTS (SELECT null FROM CategoriaCombateIndividual cat WHERE cat.id_categoria = NEW.id_categoria) AND
    NOT(((SELECT comp.peso FROM Competidor comp WHERE comp.id_itf = NEW.id_competidor) BETWEEN
    (SELECT cat.pesoMin FROM CategoriaCombateIndividual cat WHERE cat.id_categoria = NEW.id_categoria) AND
    (SELECT cat.pesoMax FROM CategoriaCombateIndividual cat WHERE cat.id_categoria = NEW.id_categoria)))
    THEN 
      SIGNAL sqlstate '45000'
        SET message_text = 'El peso del competidor debe estar en el rango de la categoría.';
  END IF;
    
  IF  EXISTS (SELECT null FROM CategoriaFormasIndividual cat WHERE cat.id_categoria = NEW.id_categoria) AND
    (SELECT comp.graduacion FROM Competidor comp WHERE comp.id_itf = NEW.id_competidor) !=
    (SELECT cat.graduacion FROM CategoriaFormasIndividual cat WHERE cat.id_categoria = NEW.id_categoria)
    THEN 
    SIGNAL sqlstate '45000'
      SET message_text = 'La graduación del competidor debe coincidir con la de la categoría de formas.';
  END IF;

  IF  (SELECT DATEDIFF(comp.fecha_nacimiento, '2017-10-01') / 365.25 AS age FROM Competidor comp WHERE comp.id_itf = NEW.id_competidor) BETWEEN 
      (SELECT comp.edadMin FROM Categoria cat WHERE cat.id_categoria = NEW.id_categoria) AND
      (SELECT comp.edadMax FROM Categoria cat WHERE cat.id_categoria = NEW.id_categoria)))
  THEN 
    SIGNAL sqlstate '45000'
      SET message_text = 'La edad del competidor debe estar dentro del rango de la categoría.';
  END IF;

END$$
DELIMITER ;

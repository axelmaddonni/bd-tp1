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

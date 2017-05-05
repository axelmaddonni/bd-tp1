
-- 1 El listado de inscriptos en cada categoría para el armado de llaves

-- Categorías Individuales

SELECT i.id_categoria,
       p.id_itf,
       p.nombre,
       p.apellido
FROM InscripcionIndividual i
JOIN Participante p ON i.id_itf_competidor = p.id_itf;

-- Categorías por Equipos

SELECT i.id_categoria,
       i.id_equipo,
       e.nombre
FROM InscripcionEquipo i
JOIN Equipo e ON i.id_equipo = e.id_equipo;

-- 2 El país que obtuvo mayor cantidad de medallas de oro, plata y bronce.

-- Mayor cantidad de oro

SELECT medallas_oro.nombre,
       count(medallas_oro.nombre) AS cantidad
FROM (
        (SELECT pa.nombre
         FROM MedallaIndividual mi
         JOIN Participante p ON mi.id_itf_competidor = p.id_itf
         JOIN Escuela esc ON p.id_escuela = esc.id_escuela
         JOIN Pais pa ON esc.codigo_pais = pa.codigo
         WHERE mi.puesto = 1)
      UNION ALL
        (SELECT pa.nombre
         FROM MedallaEquipo me
         JOIN Equipo e ON me.id_equipo = e.id_equipo
         LEFT OUTER JOIN EquipoCompetidor ec ON e.id_equipo = ec.id_equipo
         JOIN Participante p ON ec.id_itf_competidor = p.id_itf
         JOIN Escuela esc ON p.id_escuela = esc.id_escuela
         JOIN Pais pa ON pa.codigo = esc.codigo_pais
         WHERE me.puesto = 1)) medallas_oro
GROUP BY nombre
ORDER BY cantidad DESC LIMIT 1;

-- Mayor cantidad de plata

SELECT medallas_oro.nombre,
       count(medallas_oro.nombre) AS cantidad
FROM (
        (SELECT pa.nombre
         FROM MedallaIndividual mi
         JOIN Participante p ON mi.id_itf_competidor = p.id_itf
         JOIN Escuela esc ON p.id_escuela = esc.id_escuela
         JOIN Pais pa ON esc.codigo_pais = pa.codigo
         WHERE mi.puesto = 2)
      UNION ALL
        (SELECT pa.nombre
         FROM MedallaEquipo me
         JOIN Equipo e ON me.id_equipo = e.id_equipo
         LEFT OUTER JOIN EquipoCompetidor ec ON e.id_equipo = ec.id_equipo
         JOIN Participante p ON ec.id_itf_competidor = p.id_itf
         JOIN Escuela esc ON p.id_escuela = esc.id_escuela
         JOIN Pais pa ON pa.codigo = esc.codigo_pais
         WHERE me.puesto = 2)) medallas_oro
GROUP BY nombre
ORDER BY cantidad DESC LIMIT 1;

-- Mayor cantidad de bronce

SELECT medallas_oro.nombre,
       count(medallas_oro.nombre) AS cantidad
FROM (
        (SELECT pa.nombre
         FROM MedallaIndividual mi
         JOIN Participante p ON mi.id_itf_competidor = p.id_itf
         JOIN Escuela esc ON p.id_escuela = esc.id_escuela
         JOIN Pais pa ON esc.codigo_pais = pa.codigo
         WHERE mi.puesto = 3)
      UNION ALL
        (SELECT pa.nombre
         FROM MedallaEquipo me
         JOIN Equipo e ON me.id_equipo = e.id_equipo
         LEFT OUTER JOIN EquipoCompetidor ec ON e.id_equipo = ec.id_equipo
         JOIN Participante p ON ec.id_itf_competidor = p.id_itf
         JOIN Escuela esc ON p.id_escuela = esc.id_escuela
         JOIN Pais pa ON pa.codigo = esc.codigo_pais
         WHERE me.puesto = 3)) medallas_oro
GROUP BY nombre
ORDER BY cantidad DESC LIMIT 1;

-- Ranking de puntaje por escuela

SELECT e.nombre, sum(Puntuacion) as total
FROM (MedallasIndividuales m JOIN Participante par ON par.id_itf = m.id_itf_competidor) as mpar JOIN Escuela e ON mpar.id_escuela = e.id_escuela
CASE m.puesto
	WHEN 1 THEN 3
	WHEN 2 THEN 2
	ELSE 1
END as Puntuacion
GROUP BY e.nombre
ORDER BY total

-- Ranking de puntaje por pais

SELECT pa.nombre, sum(Puntuacion) as total
FROM ((MedallasIndividuales m JOIN Participante par ON par.id_itf = m.id_itf_competidor) as mcpar JOIN Escuela e ON mcpar.id_escuela = e.id_escuela) as mce JOIN Pais pa ON mce.codigo_pais = pa.codigo
CASE m.puesto
	WHEN 1 THEN 3
	WHEN 2 THEN 2
	ELSE 1
END as Puntuacion
GROUP BY pa.nombre
ORDER BY total

-- Lista  de  categorías  donde  haya  participado  y  el  resultado obtenido

SELECT p.nombre, cat.nombre, m.puesto
FROM ((InscripcionesIndividuales i LEFT OUTER JOIN MedallasIndividuales m ON m.id_itf_competidor = i.id_itf_competidor AND m.id_categoria = i.id_categoria) as im JOIN Participante p ON p.id_itf = im.id_itf_competidor) as imc JOIN Categoria cat ON cat.id_categoria = imc.id_categoria

-- Medallero por escuela

SELECT e.nombre, par.nombre, par.apellido, m.puesto, cat.nombre
FROM ((MedallasIndividuales m JOIN Participante par ON par.id_itf = m.id_itf_competidor) as cmpar JOIN Escuela e ON cmpar.id_escuela = e.id_escuela) as cms JOIN Categoria cat ON cms.id_categoria = cat.id_categoria
ORDER BY e.nombre

-- Listado de los árbitros por país

SELECT p.nombre, a.nombre, a.apellido
FROM Arbitro a JOIN Pais p ON a.codigo_pais = p.codigo
ORDER BY p.nombre

-- Lista de todos los árbitros que actuaron como árbitro central en las modalidades de combate

SELECT a.nombre, a.apellido
FROM ((Arbitro a JOIN RingConsejoArbitros r ON a.placa = r.placa_arbitro) as ar JOIN RingCategoria c ON ar.id_ring = c.id_ring) as arc JOIN FuncionArbitraje f ON f.id_funcion_arbitraje = arc.id_funcion_arbitraje as arcf
WHERE (c.id_categoria IN CategoriaCombateIndividual OR c.id_categoria IN (SELECT equi.id_categoria FROM Categoria c JOIN CategoriaPorEquipo equi ON c.id_categoria = equi.id_categoria WHERE c.nombre LIKE '%Combate%')) AND f.nombre = 'Central'

-- Lista de equipos por país

SELECT p.nombre, e.nombre
FROM (((Equipo e JOIN EquipoCompetidores ec ON e.id_equipo = ec.id_equipo) as eec JOIN Participante par ON par.id_itf = eec.id_itf_competidor) as eeccpar JOIN Escuela es ON es.id_escuela = eeccpar.id_escuela) as eeccesm JOIN Pais p ON p.codigo = eeccesm.codigo_pais
ORDER BY p.nombre

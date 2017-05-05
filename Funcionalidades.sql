
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

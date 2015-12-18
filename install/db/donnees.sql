INSERT INTO `Competition` (`id_competition`, `id_typeCompetition`, `id_tournoi`) VALUES
(1, NULL, NULL);

INSERT INTO `Terrain` (`id_terrain`, `name`, `id_typeTerrain`, nb_sieges_max) VALUES
(1, 'terrainTest', NULL, 15);

INSERT INTO `Creneau` (`id_creneau`, `day`, `hDeb`, `hFin`) VALUES
(1, '2015-12-07', '8:00', '12:00'),
(2, '2015-12-07', '12:00', '16:00');

INSERT INTO `Match` (`id_match`, `id_creneau`, `id_terrain`, `id_competition`, `rang`, `ordre`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 1, 1, 1, 2);

INSERT INTO `Typebillet` (`id_typeBillet`, `libTypeBillet`) VALUES
(1, 'Grand Public'),
(2, 'Promo'),
(3, 'Licenciés'),
(4, 'Solidarité'),
(5, 'Big Match');

INSERT INTO `Disponibilite` (`id_match`, `id_typeBillet`, `nbBilletsDispo`, `nbBilletsTotal`, `prixBillet`) VALUES
(1, 1, 10, 0, 10.5),
(1, 2, 11, 0, 5),
(1, 3, 12, 0, 2),
(1, 4, 10, 0, 9),
(2, 2, 9, 0, 5),
(2, 3, 10, 0, 5),
(2, 5, 10, 0, 12);

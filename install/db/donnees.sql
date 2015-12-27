--
-- Contenu de la table `TypeArbitre`
--

INSERT INTO `TypeArbitre` (`id_typeArbitre`, `libTypeArbitre`) VALUES
(1, 'Arbitre de chaise'),
(2, 'Juge de ligne'),
(3, 'Juge-Arbitre'),
(4, 'Juge de Filet'),
(5, 'Ramasseurs');


--
-- Contenu de la table `TypeBillet`
--

INSERT INTO `TypeBillet` (`id_typeBillet`, `libTypeBillet`) VALUES
(5, 'Big Match'),
(1, 'Grand Public'),
(3, 'Licenciés'),
(2, 'Promo'),
(4, 'Solidarité');

--
-- Contenu de la table `Adresse`
--

INSERT INTO `Adresse` (`ville`, `code_postal`, `rue`, `numero`, `id`, `pays`) VALUES
('Reims', 51100, 'Inconnue', 666, 1, 'France'),
('Laon', 2000, 'Inconnue', 12, 2, 'France');



--
-- Contenu de la table `Tournoi`
--

INSERT INTO `Tournoi` (`id_tournoi`, `dateDeb`, `dateFin`, `description`, `nom`, `id_addresse`) VALUES
(1, '2015-12-14', '2015-12-20', 'Ceci est la description du tournoi!!!', 'Tournoi_de_test', 1);


--
-- Contenu de la table `CategorieArbitre`
--

INSERT INTO `CategorieArbitre` (`id_categorie`, `libCategorie`) VALUES
(1, 'JAT1'),
(2, 'JAT2'),
(4, 'ITT1');

--
-- Contenu de la table `TypeCompetition`
--

INSERT INTO `TypeCompetition` (`id_typeCompetition`, `libType`) VALUES
(1, 'simple femme'),
(2, 'simple homme'),
(3, 'double femme'),
(4, 'double homme');

--
-- Contenu de la table `Competition`
--

INSERT INTO `Competition` (`id_competition`, `id_typeCompetition`, `id_tournoi`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1);

--
-- Contenu de la table `Creneau`
--

INSERT INTO `Creneau` (`id_creneau`, `day`, `hDeb`, `hFin`) VALUES
(1, '2015-12-07', '08:00:00', '12:00:00'),
(2, '2015-12-07', '12:00:00', '16:00:00');


--
-- Contenu de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`id_user`, `login`, `password`, `mail`, `firstName`, `lastName`, `phone`, `id_addresse`) VALUES
(1, 'util1', 'e5ba5be595da48b87f97018329cb59795c07b3d9', 'util1@mail.com', 'jean', 'guy', 353698653, 1),
(2, 'util2', '79581ba151e968cad0eb9d43838564dc2301ae2c', 'util2@mail.com', 'toto', 'toto', 215151515, 2),
(3, 'util3', 'util3', 'jeanguy@gmail.tv', 'jean', 'pierre', 888888888, NULL),
(8, 'abel', 'a', 'abel', 'Abel', 'a', NULL, NULL),
(9, 'baker', 'b', 'baker', 'Baker', 'b', NULL, NULL),
(10, 'charlie', 'c', 'charlie', 'Charlie', 'c', NULL, NULL),
(11, 'david', 'd', 'david', 'David', 'd', NULL, NULL),
(15, 'cujj', '87dda20416649f2a6a1b03d4e13d48a80b1a357f', 'cofievet@gmail.fr', 'co', 'Fievet', 0, NULL),
(16, 'co', '87dda20416649f2a6a1b03d4e13d48a80b1a357f', 'cofievet@gmail.com', 'co', 'Fievet', 0, NULL);


--
-- Contenu de la table `Participant`
--

INSERT INTO `Participant` (`id_participant`) VALUES
(1),
(2),
(8),
(9),
(10),
(11);

--
-- Contenu de la table `Joueur`
--

INSERT INTO `Joueur` (`id_joueur`, `classement`) VALUES
(1, ''),
(8, '3'),
(9, '10'),
(10, ''),
(11, '');

--
-- Contenu de la table `Arbitre`
--

INSERT INTO `Arbitre` (`id_arbitre`, `id_categorie`, `id_typeArbitre`) VALUES
(2, 4, 4);


--
-- Contenu de la table `Hebergeur`
--

INSERT INTO `Hebergeur` (`id_hebergeur`) VALUES
(2),
(3);

--
-- Contenu de la table `Terrain`
--

INSERT INTO `Terrain` (`id_terrain`, `name`, `id_typeTerrain`, `nb_sieges_max`) VALUES
(1, 'terrainTest', NULL, 15);


--
-- Contenu de la table `Match`
--

INSERT INTO `Match` (`id_match`, `id_creneau`, `id_terrain`, `id_competition`, `rang`, `ordre`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 1, 1, 1, 2),
(3, 1, 1, 1, 1, 1),
(4, 1, 1, 1, 1, 2);


--
-- Contenu de la table `Disponibilite`
--

INSERT INTO `Disponibilite` (`id_match`, `id_typeBillet`, `nbBilletsDispo`, `nbBilletsTotal`, `prixBillet`) VALUES
(1, 1, 10, 0, 10.5),
(1, 2, 11, 0, 5),
(1, 3, 12, 0, 2),
(1, 4, 10, 0, 9),
(2, 2, 9, 0, 5),
(2, 3, 10, 0, 5),
(2, 5, 10, 0, 12);

--
-- Contenu de la table `Jouer`
--

INSERT INTO `Jouer` (`id_joueur`, `id_match`, `score`) VALUES
(8, 1, ''),
(9, 1, ''),
(10, 2, ''),
(11, 2, '');

--
-- Contenu de la table `Hebergement`
--

INSERT INTO `Hebergement` (`id_hebergement`, `id_hebergeur`, `nom`, `description`, `id_adresse`, `url_image`) VALUES
(1, 3, 'Hotel reims', '3 chambres', 2, NULL),
(2, 3, 'Hotel reims', '3 chambres', 1, NULL),
(3, 2, 'Hotel Ibis', 'Grand', 1, NULL);




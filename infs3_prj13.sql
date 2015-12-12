-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 12 Décembre 2015 à 15:28
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `infs3_prj13`
--

-- --------------------------------------------------------

--
-- Structure de la table `arbitre`
--

CREATE TABLE IF NOT EXISTS `arbitre` (
  `id_arbitre` int(11) NOT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `id_typeArbitre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_arbitre`),
  KEY `id_categorie` (`id_categorie`),
  KEY `id_typeArbitre` (`id_typeArbitre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `arbitrermatch`
--

CREATE TABLE IF NOT EXISTS `arbitrermatch` (
  `id_arbitre` int(11) NOT NULL,
  `id_match` int(11) NOT NULL,
  PRIMARY KEY (`id_arbitre`,`id_match`),
  KEY `id_match` (`id_match`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `arbitrertournoi`
--

CREATE TABLE IF NOT EXISTS `arbitrertournoi` (
  `id_arbitre` int(11) NOT NULL,
  `id_tournoi` int(11) NOT NULL,
  PRIMARY KEY (`id_arbitre`,`id_tournoi`),
  KEY `id_tournoi` (`id_tournoi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `arbre`
--

CREATE TABLE IF NOT EXISTS `arbre` (
  `id_arbre` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` text NOT NULL,
  PRIMARY KEY (`id_arbre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `billet`
--

CREATE TABLE IF NOT EXISTS `billet` (
  `id_billet` int(11) NOT NULL AUTO_INCREMENT,
  `id_typeBillet` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_billet`),
  KEY `id_typeBillet` (`id_typeBillet`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `billet`
--

INSERT INTO `billet` (`id_billet`, `id_typeBillet`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `categoriearbitre`
--

CREATE TABLE IF NOT EXISTS `categoriearbitre` (
  `id_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `libCategorie` int(11) NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `competition`
--

CREATE TABLE IF NOT EXISTS `competition` (
  `id_competition` int(11) NOT NULL AUTO_INCREMENT,
  `id_typeCompetition` int(11) DEFAULT NULL,
  `id_tournoi` int(11) DEFAULT NULL,
  `id_arbre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_competition`),
  KEY `id_typeCompettion` (`id_typeCompetition`,`id_tournoi`),
  KEY `id_tournoi` (`id_tournoi`),
  KEY `id_arbre` (`id_arbre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `competition`
--

INSERT INTO `competition` (`id_competition`, `id_typeCompetition`, `id_tournoi`, `id_arbre`) VALUES
(1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `creneau`
--

CREATE TABLE IF NOT EXISTS `creneau` (
  `id_creneau` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `day` date NOT NULL,
  `hDeb` varchar(5) CHARACTER SET utf8 NOT NULL,
  `hFin` varchar(5) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_creneau`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `creneau`
--

INSERT INTO `creneau` (`id_creneau`, `name`, `day`, `hDeb`, `hFin`) VALUES
(1, 'matin', '2015-12-07', '8:00', '12:00'),
(2, 'arpem', '2015-12-07', '12:00', '16:00');

-- --------------------------------------------------------

--
-- Structure de la table `disponibilite`
--

CREATE TABLE IF NOT EXISTS `disponibilite` (
  `id_match` int(11) NOT NULL,
  `id_typeBillet` int(11) NOT NULL,
  `nbBilletsDispo` int(11) NOT NULL,
  `nbBilletsTotal` int(11) NOT NULL,
  `prixBillet` double NOT NULL,
  PRIMARY KEY (`id_match`,`id_typeBillet`),
  KEY `id_billet` (`id_typeBillet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `disponibilite`
--

INSERT INTO `disponibilite` (`id_match`, `id_typeBillet`, `nbBilletsDispo`, `nbBilletsTotal`, `prixBillet`) VALUES
(1, 1, 10, 0, 10.5),
(1, 2, 11, 0, 5),
(1, 3, 12, 0, 2),
(1, 4, 10, 0, 9),
(2, 2, 9, 0, 5),
(2, 3, 10, 0, 5),
(2, 5, 10, 0, 12);

-- --------------------------------------------------------

--
-- Structure de la table `entrainement`
--

CREATE TABLE IF NOT EXISTS `entrainement` (
  `id_terrain` int(11) NOT NULL,
  `id_joueur` int(11) NOT NULL,
  `id_creneau` int(11) NOT NULL,
  PRIMARY KEY (`id_terrain`,`id_joueur`,`id_creneau`),
  KEY `id_terrainEntrainement` (`id_terrain`),
  KEY `id_joueur` (`id_joueur`),
  KEY `id_creneau` (`id_creneau`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `hebergement`
--

CREATE TABLE IF NOT EXISTS `hebergement` (
  `id_hebergement` int(11) NOT NULL AUTO_INCREMENT,
  `nbPlaces` int(11) NOT NULL,
  `id_hebergeur` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_hebergement`),
  KEY `id_hebergeur` (`id_hebergeur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `hebergeur`
--

CREATE TABLE IF NOT EXISTS `hebergeur` (
  `id_hebergeur` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_hebergeur`),
  KEY `id_hebergeur` (`id_hebergeur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `jouer`
--

CREATE TABLE IF NOT EXISTS `jouer` (
  `id_joueur` int(11) NOT NULL,
  `id_match` int(11) NOT NULL,
  `score` tinytext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_joueur`,`id_match`),
  KEY `id_match` (`id_match`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE IF NOT EXISTS `joueur` (
  `id_joueur` int(11) NOT NULL,
  `classement` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_joueur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

CREATE TABLE IF NOT EXISTS `match` (
  `id_match` int(11) NOT NULL AUTO_INCREMENT,
  `id_creneau` int(11) NOT NULL,
  `id_terrain` int(11) NOT NULL,
  `id_competition` int(11) NOT NULL,
  PRIMARY KEY (`id_match`),
  KEY `id_creneau` (`id_creneau`),
  KEY `id_terrainMatch` (`id_terrain`),
  KEY `id_competition` (`id_competition`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `match`
--

INSERT INTO `match` (`id_match`, `id_creneau`, `id_terrain`, `id_competition`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `organisateur`
--

CREATE TABLE IF NOT EXISTS `organisateur` (
  `id_organisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_organisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `organiser`
--

CREATE TABLE IF NOT EXISTS `organiser` (
  `id_organisateur` int(11) NOT NULL,
  `id_tournoi` int(11) NOT NULL,
  PRIMARY KEY (`id_organisateur`,`id_tournoi`),
  KEY `id_tournoi` (`id_tournoi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

CREATE TABLE IF NOT EXISTS `participant` (
  `id_participant` int(11) NOT NULL,
  PRIMARY KEY (`id_participant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participercompetition`
--

CREATE TABLE IF NOT EXISTS `participercompetition` (
  `id_joueur` int(11) NOT NULL,
  `id_competition` int(11) NOT NULL,
  PRIMARY KEY (`id_joueur`,`id_competition`),
  KEY `id_competition` (`id_competition`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reserver`
--

CREATE TABLE IF NOT EXISTS `reserver` (
  `id_hebergement` int(11) NOT NULL,
  `id_participant` int(11) NOT NULL,
  PRIMARY KEY (`id_hebergement`,`id_participant`),
  KEY `id_participant` (`id_participant`),
  KEY `id_hebergement` (`id_hebergement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `id_staff` int(11) NOT NULL,
  PRIMARY KEY (`id_staff`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `terrain`
--

CREATE TABLE IF NOT EXISTS `terrain` (
  `id_terrain` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `id_typeTerrain` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_terrain`),
  KEY `id_typeTerrain` (`id_typeTerrain`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `terrain`
--

INSERT INTO `terrain` (`id_terrain`, `name`, `id_typeTerrain`) VALUES
(1, 'terrainTest', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tournoi`
--

CREATE TABLE IF NOT EXISTS `tournoi` (
  `id_tournoi` int(11) NOT NULL AUTO_INCREMENT,
  `dateDeb` date NOT NULL,
  `dateFin` date NOT NULL,
  PRIMARY KEY (`id_tournoi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `typearbitre`
--

CREATE TABLE IF NOT EXISTS `typearbitre` (
  `id_typeArbitre` int(11) NOT NULL AUTO_INCREMENT,
  `libTypeArbitre` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_typeArbitre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `typebillet`
--

CREATE TABLE IF NOT EXISTS `typebillet` (
  `id_typeBillet` int(11) NOT NULL AUTO_INCREMENT,
  `libTypeBillet` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_typeBillet`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `typebillet`
--

INSERT INTO `typebillet` (`id_typeBillet`, `libTypeBillet`) VALUES
(1, 'Grand Public'),
(2, 'Promo'),
(3, 'Licenciés'),
(4, 'Solidarité'),
(5, 'Big Match');

-- --------------------------------------------------------

--
-- Structure de la table `typecompetition`
--

CREATE TABLE IF NOT EXISTS `typecompetition` (
  `id_typeCompetition` int(11) NOT NULL AUTO_INCREMENT,
  `libType` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_typeCompetition`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `typeterrain`
--

CREATE TABLE IF NOT EXISTS `typeterrain` (
  `id_typeTerrain` int(11) NOT NULL AUTO_INCREMENT,
  `libTypeTerrain` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_typeTerrain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) CHARACTER SET utf8 NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 NOT NULL,
  `mail` varchar(20) CHARACTER SET utf8 NOT NULL,
  `firstName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `lastName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `N°Téléphone` varchar(15) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `arbitre`
--
ALTER TABLE `arbitre`
  ADD CONSTRAINT `Arbitre_ibfk_1` FOREIGN KEY (`id_arbitre`) REFERENCES `participant` (`id_participant`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Arbitre_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `categoriearbitre` (`id_categorie`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Arbitre_ibfk_3` FOREIGN KEY (`id_typeArbitre`) REFERENCES `typearbitre` (`id_typeArbitre`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `arbitrermatch`
--
ALTER TABLE `arbitrermatch`
  ADD CONSTRAINT `ArbitrerMatch_ibfk_1` FOREIGN KEY (`id_arbitre`) REFERENCES `arbitre` (`id_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ArbitrerMatch_ibfk_2` FOREIGN KEY (`id_match`) REFERENCES `match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `arbitrertournoi`
--
ALTER TABLE `arbitrertournoi`
  ADD CONSTRAINT `ArbitrerTournoi_ibfk_1` FOREIGN KEY (`id_arbitre`) REFERENCES `arbitre` (`id_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ArbitrerTournoi_ibfk_2` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `billet`
--
ALTER TABLE `billet`
  ADD CONSTRAINT `Billet_ibfk_1` FOREIGN KEY (`id_typeBillet`) REFERENCES `typebillet` (`id_typeBillet`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `competition`
--
ALTER TABLE `competition`
  ADD CONSTRAINT `Competition_ibfk_1` FOREIGN KEY (`id_typeCompetition`) REFERENCES `typecompetition` (`id_typeCompetition`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Competition_ibfk_2` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Competition_ibfk_3` FOREIGN KEY (`id_arbre`) REFERENCES `arbre` (`id_arbre`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `disponibilite`
--
ALTER TABLE `disponibilite`
  ADD CONSTRAINT `Disponibilite_ibfk_1` FOREIGN KEY (`id_match`) REFERENCES `match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Disponibilite_ibfk_2` FOREIGN KEY (`id_typeBillet`) REFERENCES `typebillet` (`id_typeBillet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `entrainement`
--
ALTER TABLE `entrainement`
  ADD CONSTRAINT `Entrainement_ibfk_2` FOREIGN KEY (`id_creneau`) REFERENCES `creneau` (`id_creneau`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Entrainement_ibfk_3` FOREIGN KEY (`id_joueur`) REFERENCES `joueur` (`id_joueur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Entrainement_ibfk_4` FOREIGN KEY (`id_terrain`) REFERENCES `terrain` (`id_terrain`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `hebergement`
--
ALTER TABLE `hebergement`
  ADD CONSTRAINT `Hebergement_ibfk_1` FOREIGN KEY (`id_hebergeur`) REFERENCES `hebergeur` (`id_hebergeur`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `hebergeur`
--
ALTER TABLE `hebergeur`
  ADD CONSTRAINT `Hebergeur_ibfk_1` FOREIGN KEY (`id_hebergeur`) REFERENCES `utilisateur` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `jouer`
--
ALTER TABLE `jouer`
  ADD CONSTRAINT `Jouer_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `joueur` (`id_joueur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Jouer_ibfk_2` FOREIGN KEY (`id_match`) REFERENCES `match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD CONSTRAINT `Joueur_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `participant` (`id_participant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `Match_ibfk_1` FOREIGN KEY (`id_creneau`) REFERENCES `creneau` (`id_creneau`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Match_ibfk_3` FOREIGN KEY (`id_competition`) REFERENCES `competition` (`id_competition`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Match_ibfk_4` FOREIGN KEY (`id_terrain`) REFERENCES `terrain` (`id_terrain`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `organisateur`
--
ALTER TABLE `organisateur`
  ADD CONSTRAINT `Organisateur_ibfk_1` FOREIGN KEY (`id_organisateur`) REFERENCES `utilisateur` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `organiser`
--
ALTER TABLE `organiser`
  ADD CONSTRAINT `Organiser_ibfk_1` FOREIGN KEY (`id_organisateur`) REFERENCES `organisateur` (`id_organisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Organiser_ibfk_2` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `Participant_ibfk_1` FOREIGN KEY (`id_participant`) REFERENCES `utilisateur` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participercompetition`
--
ALTER TABLE `participercompetition`
  ADD CONSTRAINT `ParticiperCompetition_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `joueur` (`id_joueur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ParticiperCompetition_ibfk_2` FOREIGN KEY (`id_competition`) REFERENCES `competition` (`id_competition`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reserver`
--
ALTER TABLE `reserver`
  ADD CONSTRAINT `Reserver_ibfk_1` FOREIGN KEY (`id_hebergement`) REFERENCES `hebergement` (`id_hebergement`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Reserver_ibfk_3` FOREIGN KEY (`id_participant`) REFERENCES `participant` (`id_participant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `participant` (`id_participant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `terrain`
--
ALTER TABLE `terrain`
  ADD CONSTRAINT `Terrain_ibfk_1` FOREIGN KEY (`id_typeTerrain`) REFERENCES `typeterrain` (`id_typeTerrain`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

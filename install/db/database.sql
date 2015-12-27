-- phpMyAdmin SQL Dump
-- version 4.2.12
-- http://www.phpmyadmin.net
--
-- Client :  mysql
-- Généré le :  Ven 18 Décembre 2015 à 14:41
-- Version du serveur :  5.5.32-MariaDB
-- Version de PHP :  5.3.6

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
-- Structure de la table `Adresse`
--

CREATE TABLE IF NOT EXISTS `Adresse` (
  `ville` varchar(256) CHARACTER SET latin1 NOT NULL,
  `code_postal` int(11) NOT NULL,
  `rue` varchar(256) CHARACTER SET latin1 NOT NULL,
  `numero` int(11) NOT NULL,
`id` int(11) NOT NULL,
  `pays` varchar(256) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Structure de la table `Arbitre`
--

CREATE TABLE IF NOT EXISTS `Arbitre` (
  `id_arbitre` int(11) NOT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `id_typeArbitre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `ArbitrerMatch`
--

CREATE TABLE IF NOT EXISTS `ArbitrerMatch` (
  `id_arbitre` int(11) NOT NULL,
  `id_match` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ArbitrerTournoi`
--

CREATE TABLE IF NOT EXISTS `ArbitrerTournoi` (
  `id_arbitre` int(11) NOT NULL,
  `id_tournoi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `CategorieArbitre`
--

CREATE TABLE IF NOT EXISTS `CategorieArbitre` (
`id_categorie` int(11) NOT NULL,
  `libCategorie` varchar(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Structure de la table `Chambre`
--

CREATE TABLE IF NOT EXISTS `Chambre` (
  `description` text,
  `prix` int(11) NOT NULL,
  `nb_place` int(11) NOT NULL,
`id_chambre` int(11) NOT NULL,
  `id_hebergement` int(11) NOT NULL,
  `id_type_chambre` int(11) NOT NULL,
  `url_image` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Competition`
--

CREATE TABLE IF NOT EXISTS `Competition` (
`id_competition` int(11) NOT NULL,
  `id_typeCompetition` int(11) DEFAULT NULL,
  `id_tournoi` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Structure de la table `Creneau`
--

CREATE TABLE IF NOT EXISTS `Creneau` (
`id_creneau` int(11) NOT NULL,
  `day` date NOT NULL,
  `hDeb` time NOT NULL,
  `hFin` time NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `Disponibilite`
--

CREATE TABLE IF NOT EXISTS `Disponibilite` (
  `id_match` int(11) NOT NULL,
  `id_typeBillet` int(11) NOT NULL,
  `nbBilletsDispo` int(11) NOT NULL,
  `nbBilletsTotal` int(11) NOT NULL,
  `prixBillet` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Structure de la table `Entrainement`
--

CREATE TABLE IF NOT EXISTS `Entrainement` (
  `id_terrain` int(11) NOT NULL,
  `id_joueur` int(11) NOT NULL,
  `id_creneau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `faireEquipe`
--

CREATE TABLE IF NOT EXISTS `faireEquipe` (
  `idJoueur1` int(11) NOT NULL,
  `idJoueur2` int(11) NOT NULL,
  `idCompetition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Hebergement`
--

CREATE TABLE IF NOT EXISTS `Hebergement` (
`id_hebergement` int(11) NOT NULL,
  `id_hebergeur` int(11) NOT NULL,
  `nom` varchar(256) NOT NULL,
  `description` text,
  `id_adresse` int(11) NOT NULL,
  `url_image` varchar(256) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Hebergeur`
--

CREATE TABLE IF NOT EXISTS `Hebergeur` (
`id_hebergeur` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `Jouer`
--

CREATE TABLE IF NOT EXISTS `Jouer` (
  `id_joueur` int(11) NOT NULL,
  `id_match` int(11) NOT NULL,
  `score` tinytext CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `Joueur`
--

CREATE TABLE IF NOT EXISTS `Joueur` (
`id_joueur` int(11) NOT NULL,
  `classement` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Structure de la table `Match`
--

CREATE TABLE IF NOT EXISTS `Match` (
`id_match` int(11) NOT NULL,
  `id_creneau` int(11) DEFAULT NULL,
  `id_terrain` int(11) DEFAULT NULL,
  `id_competition` int(11) NOT NULL,
  `rang` int(11) NOT NULL COMMENT 'finale/ demi finale / quart de finale.....',
  `ordre` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `Organisateur`
--

CREATE TABLE IF NOT EXISTS `Organisateur` (
  `id_organisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Organiser`
--

CREATE TABLE IF NOT EXISTS `Organiser` (
  `id_organisateur` int(11) NOT NULL,
  `id_tournoi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Participant`
--

CREATE TABLE IF NOT EXISTS `Participant` (
  `id_participant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Structure de la table `ParticiperCompetition`
--

CREATE TABLE IF NOT EXISTS `ParticiperCompetition` (
  `id_joueur` int(11) NOT NULL,
  `id_competition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Promo`
--

CREATE TABLE IF NOT EXISTS `Promo` (
  `code_promo` varchar(256) NOT NULL,
  `description` varchar(256) NOT NULL,
  `reduction` int(11) NOT NULL COMMENT 'pourcentage'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Reserver`
--

CREATE TABLE IF NOT EXISTS `Reserver` (
  `id_hebergement` int(11) NOT NULL,
  `id_participant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Staff`
--

CREATE TABLE IF NOT EXISTS `Staff` (
  `id_staff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Terrain`
--

CREATE TABLE IF NOT EXISTS `Terrain` (
`id_terrain` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `id_typeTerrain` int(11) DEFAULT NULL,
  `nb_sieges_max` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `terrain_tournoi`
--

CREATE TABLE IF NOT EXISTS `terrain_tournoi` (
  `id_terrain` int(11) NOT NULL,
  `id_tournoi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Tournoi`
--

CREATE TABLE IF NOT EXISTS `Tournoi` (
`id_tournoi` int(11) NOT NULL,
  `dateDeb` date NOT NULL,
  `dateFin` date NOT NULL,
  `description` text,
  `nom` varchar(256) NOT NULL,
  `id_addresse` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `TypeArbitre`
--

CREATE TABLE IF NOT EXISTS `TypeArbitre` (
`id_typeArbitre` int(11) NOT NULL,
  `libTypeArbitre` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Structure de la table `TypeBillet`
--

CREATE TABLE IF NOT EXISTS `TypeBillet` (
`id_typeBillet` int(11) NOT NULL,
  `libTypeBillet` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Structure de la table `TypeChambre`
--

CREATE TABLE IF NOT EXISTS `TypeChambre` (
`idTypeChambre` int(11) NOT NULL,
  `libTypeChambre` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `TypeCompetition`
--

CREATE TABLE IF NOT EXISTS `TypeCompetition` (
`id_typeCompetition` int(11) NOT NULL,
  `libType` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `TypeTerrain`
--

CREATE TABLE IF NOT EXISTS `TypeTerrain` (
`id_typeTerrain` int(11) NOT NULL,
  `libTypeTerrain` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE IF NOT EXISTS `Utilisateur` (
`id_user` int(11) NOT NULL,
  `login` varchar(20) CHARACTER SET utf8 NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 NOT NULL,
  `mail` varchar(20) CHARACTER SET utf8 NOT NULL,
  `firstName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `lastName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `phone` int(30) DEFAULT NULL,
  `id_addresse` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;



--
-- Index pour les tables exportées
--

--
-- Index pour la table `Adresse`
--
ALTER TABLE `Adresse`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Arbitre`
--
ALTER TABLE `Arbitre`
 ADD PRIMARY KEY (`id_arbitre`), ADD KEY `id_categorie` (`id_categorie`), ADD KEY `id_typeArbitre` (`id_typeArbitre`);

--
-- Index pour la table `ArbitrerMatch`
--
ALTER TABLE `ArbitrerMatch`
 ADD PRIMARY KEY (`id_arbitre`,`id_match`), ADD KEY `id_match` (`id_match`);

--
-- Index pour la table `ArbitrerTournoi`
--
ALTER TABLE `ArbitrerTournoi`
 ADD PRIMARY KEY (`id_arbitre`,`id_tournoi`), ADD KEY `id_tournoi` (`id_tournoi`);

--
-- Index pour la table `CategorieArbitre`
--
ALTER TABLE `CategorieArbitre`
 ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `Chambre`
--
ALTER TABLE `Chambre`
 ADD PRIMARY KEY (`id_chambre`), ADD KEY `id_hebergement` (`id_hebergement`);

--
-- Index pour la table `Competition`
--
ALTER TABLE `Competition`
 ADD PRIMARY KEY (`id_competition`), ADD KEY `id_typeCompettion` (`id_typeCompetition`,`id_tournoi`), ADD KEY `id_tournoi` (`id_tournoi`);

--
-- Index pour la table `Creneau`
--
ALTER TABLE `Creneau`
 ADD PRIMARY KEY (`id_creneau`);

--
-- Index pour la table `Disponibilite`
--
ALTER TABLE `Disponibilite`
 ADD PRIMARY KEY (`id_match`,`id_typeBillet`), ADD KEY `id_billet` (`id_typeBillet`);

--
-- Index pour la table `Entrainement`
--
ALTER TABLE `Entrainement`
 ADD PRIMARY KEY (`id_terrain`,`id_joueur`,`id_creneau`), ADD KEY `id_terrainEntrainement` (`id_terrain`), ADD KEY `id_joueur` (`id_joueur`), ADD KEY `id_creneau` (`id_creneau`);

--
-- Index pour la table `faireEquipe`
--
ALTER TABLE `faireEquipe`
 ADD PRIMARY KEY (`idJoueur1`,`idJoueur2`,`idCompetition`), ADD KEY `idJoueur2` (`idJoueur2`), ADD KEY `idCompetition` (`idCompetition`);

--
-- Index pour la table `Hebergement`
--
ALTER TABLE `Hebergement`
 ADD PRIMARY KEY (`id_hebergement`), ADD KEY `id_hebergeur` (`id_hebergeur`), ADD KEY `id_adresse` (`id_adresse`);

--
-- Index pour la table `Hebergeur`
--
ALTER TABLE `Hebergeur`
 ADD PRIMARY KEY (`id_hebergeur`), ADD KEY `id_hebergeur` (`id_hebergeur`);

--
-- Index pour la table `Jouer`
--
ALTER TABLE `Jouer`
 ADD PRIMARY KEY (`id_joueur`,`id_match`), ADD KEY `id_match` (`id_match`);

--
-- Index pour la table `Joueur`
--
ALTER TABLE `Joueur`
 ADD PRIMARY KEY (`id_joueur`);

--
-- Index pour la table `Match`
--
ALTER TABLE `Match`
 ADD PRIMARY KEY (`id_match`), ADD KEY `id_creneau` (`id_creneau`), ADD KEY `id_terrainMatch` (`id_terrain`), ADD KEY `id_competition` (`id_competition`);

--
-- Index pour la table `Organisateur`
--
ALTER TABLE `Organisateur`
 ADD PRIMARY KEY (`id_organisateur`);

--
-- Index pour la table `Organiser`
--
ALTER TABLE `Organiser`
 ADD PRIMARY KEY (`id_organisateur`,`id_tournoi`), ADD KEY `id_tournoi` (`id_tournoi`);

--
-- Index pour la table `Participant`
--
ALTER TABLE `Participant`
 ADD PRIMARY KEY (`id_participant`);

--
-- Index pour la table `ParticiperCompetition`
--
ALTER TABLE `ParticiperCompetition`
 ADD PRIMARY KEY (`id_joueur`,`id_competition`), ADD KEY `id_competition` (`id_competition`);

--
-- Index pour la table `Promo`
--
ALTER TABLE `Promo`
 ADD PRIMARY KEY (`code_promo`);

--
-- Index pour la table `Reserver`
--
ALTER TABLE `Reserver`
 ADD PRIMARY KEY (`id_hebergement`,`id_participant`), ADD KEY `id_participant` (`id_participant`), ADD KEY `id_hebergement` (`id_hebergement`);

--
-- Index pour la table `Staff`
--
ALTER TABLE `Staff`
 ADD PRIMARY KEY (`id_staff`);

--
-- Index pour la table `Terrain`
--
ALTER TABLE `Terrain`
 ADD PRIMARY KEY (`id_terrain`), ADD KEY `id_typeTerrain` (`id_typeTerrain`);

--
-- Index pour la table `terrain_tournoi`
--
ALTER TABLE `terrain_tournoi`
 ADD PRIMARY KEY (`id_terrain`,`id_tournoi`), ADD KEY `id_tournoi` (`id_tournoi`);

--
-- Index pour la table `Tournoi`
--
ALTER TABLE `Tournoi`
 ADD PRIMARY KEY (`id_tournoi`), ADD KEY `id_addresse` (`id_addresse`);

--
-- Index pour la table `TypeArbitre`
--
ALTER TABLE `TypeArbitre`
 ADD PRIMARY KEY (`id_typeArbitre`);

--
-- Index pour la table `TypeBillet`
--
ALTER TABLE `TypeBillet`
 ADD PRIMARY KEY (`id_typeBillet`), ADD UNIQUE KEY `libTypeBillet` (`libTypeBillet`);

--
-- Index pour la table `TypeChambre`
--
ALTER TABLE `TypeChambre`
 ADD PRIMARY KEY (`idTypeChambre`);

--
-- Index pour la table `TypeCompetition`
--
ALTER TABLE `TypeCompetition`
 ADD PRIMARY KEY (`id_typeCompetition`);

--
-- Index pour la table `TypeTerrain`
--
ALTER TABLE `TypeTerrain`
 ADD PRIMARY KEY (`id_typeTerrain`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
 ADD PRIMARY KEY (`id_user`), ADD UNIQUE KEY `login` (`login`), ADD UNIQUE KEY `mail` (`mail`), ADD KEY `id_addresse` (`id_addresse`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Adresse`
--
ALTER TABLE `Adresse`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `CategorieArbitre`
--
ALTER TABLE `CategorieArbitre`
MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `Chambre`
--
ALTER TABLE `Chambre`
MODIFY `id_chambre` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Competition`
--
ALTER TABLE `Competition`
MODIFY `id_competition` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `Creneau`
--
ALTER TABLE `Creneau`
MODIFY `id_creneau` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `Hebergement`
--
ALTER TABLE `Hebergement`
MODIFY `id_hebergement` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `Hebergeur`
--
ALTER TABLE `Hebergeur`
MODIFY `id_hebergeur` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `Joueur`
--
ALTER TABLE `Joueur`
MODIFY `id_joueur` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `Match`
--
ALTER TABLE `Match`
MODIFY `id_match` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `Terrain`
--
ALTER TABLE `Terrain`
MODIFY `id_terrain` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `Tournoi`
--
ALTER TABLE `Tournoi`
MODIFY `id_tournoi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `TypeArbitre`
--
ALTER TABLE `TypeArbitre`
MODIFY `id_typeArbitre` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `TypeBillet`
--
ALTER TABLE `TypeBillet`
MODIFY `id_typeBillet` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `TypeChambre`
--
ALTER TABLE `TypeChambre`
MODIFY `idTypeChambre` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `TypeCompetition`
--
ALTER TABLE `TypeCompetition`
MODIFY `id_typeCompetition` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `TypeTerrain`
--
ALTER TABLE `TypeTerrain`
MODIFY `id_typeTerrain` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Arbitre`
--
ALTER TABLE `Arbitre`
ADD CONSTRAINT `Arbitre_ibfk_1` FOREIGN KEY (`id_arbitre`) REFERENCES `Participant` (`id_participant`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Arbitre_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `CategorieArbitre` (`id_categorie`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `Arbitre_ibfk_3` FOREIGN KEY (`id_typeArbitre`) REFERENCES `TypeArbitre` (`id_typeArbitre`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `ArbitrerMatch`
--
ALTER TABLE `ArbitrerMatch`
ADD CONSTRAINT `ArbitrerMatch_ibfk_1` FOREIGN KEY (`id_arbitre`) REFERENCES `Arbitre` (`id_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `ArbitrerMatch_ibfk_2` FOREIGN KEY (`id_match`) REFERENCES `Match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ArbitrerTournoi`
--
ALTER TABLE `ArbitrerTournoi`
ADD CONSTRAINT `ArbitrerTournoi_ibfk_1` FOREIGN KEY (`id_arbitre`) REFERENCES `Arbitre` (`id_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `ArbitrerTournoi_ibfk_2` FOREIGN KEY (`id_tournoi`) REFERENCES `Tournoi` (`id_tournoi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Chambre`
--
ALTER TABLE `Chambre`
ADD CONSTRAINT `Chambre_ibfk_1` FOREIGN KEY (`id_hebergement`) REFERENCES `Hebergement` (`id_hebergement`) ON UPDATE CASCADE,
ADD CONSTRAINT `Chambre_ibfk_2` FOREIGN KEY (`id_chambre`) REFERENCES `TypeChambre` (`idTypeChambre`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `Competition`
--
ALTER TABLE `Competition`
ADD CONSTRAINT `Competition_ibfk_1` FOREIGN KEY (`id_typeCompetition`) REFERENCES `TypeCompetition` (`id_typeCompetition`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `Competition_ibfk_2` FOREIGN KEY (`id_tournoi`) REFERENCES `Tournoi` (`id_tournoi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Disponibilite`
--
ALTER TABLE `Disponibilite`
ADD CONSTRAINT `Disponibilite_ibfk_1` FOREIGN KEY (`id_match`) REFERENCES `Match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Disponibilite_ibfk_2` FOREIGN KEY (`id_typeBillet`) REFERENCES `TypeBillet` (`id_typeBillet`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `Entrainement`
--
ALTER TABLE `Entrainement`
ADD CONSTRAINT `Entrainement_ibfk_2` FOREIGN KEY (`id_creneau`) REFERENCES `Creneau` (`id_creneau`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Entrainement_ibfk_3` FOREIGN KEY (`id_joueur`) REFERENCES `Joueur` (`id_joueur`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Entrainement_ibfk_4` FOREIGN KEY (`id_terrain`) REFERENCES `Terrain` (`id_terrain`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `faireEquipe`
--
ALTER TABLE `faireEquipe`
ADD CONSTRAINT `faireEquipe_ibfk_1` FOREIGN KEY (`idJoueur1`) REFERENCES `Joueur` (`id_joueur`) ON UPDATE CASCADE,
ADD CONSTRAINT `faireEquipe_ibfk_2` FOREIGN KEY (`idJoueur2`) REFERENCES `Joueur` (`id_joueur`) ON UPDATE CASCADE,
ADD CONSTRAINT `faireEquipe_ibfk_3` FOREIGN KEY (`idCompetition`) REFERENCES `Competition` (`id_competition`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `Hebergement`
--
ALTER TABLE `Hebergement`
ADD CONSTRAINT `Hebergement_ibfk_1` FOREIGN KEY (`id_hebergeur`) REFERENCES `Hebergeur` (`id_hebergeur`) ON UPDATE CASCADE,
ADD CONSTRAINT `Hebergement_ibfk_2` FOREIGN KEY (`id_adresse`) REFERENCES `Adresse` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `Hebergeur`
--
ALTER TABLE `Hebergeur`
ADD CONSTRAINT `Hebergeur_ibfk_1` FOREIGN KEY (`id_hebergeur`) REFERENCES `Utilisateur` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Jouer`
--
ALTER TABLE `Jouer`
ADD CONSTRAINT `Jouer_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `Joueur` (`id_joueur`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Jouer_ibfk_2` FOREIGN KEY (`id_match`) REFERENCES `Match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Joueur`
--
ALTER TABLE `Joueur`
ADD CONSTRAINT `Joueur_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `Participant` (`id_participant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Match`
--
ALTER TABLE `Match`
ADD CONSTRAINT `Match_ibfk_1` FOREIGN KEY (`id_creneau`) REFERENCES `Creneau` (`id_creneau`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Match_ibfk_3` FOREIGN KEY (`id_competition`) REFERENCES `Competition` (`id_competition`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Match_ibfk_4` FOREIGN KEY (`id_terrain`) REFERENCES `Terrain` (`id_terrain`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Organisateur`
--
ALTER TABLE `Organisateur`
ADD CONSTRAINT `Organisateur_ibfk_1` FOREIGN KEY (`id_organisateur`) REFERENCES `Utilisateur` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Organiser`
--
ALTER TABLE `Organiser`
ADD CONSTRAINT `Organiser_ibfk_1` FOREIGN KEY (`id_organisateur`) REFERENCES `Organisateur` (`id_organisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Organiser_ibfk_2` FOREIGN KEY (`id_tournoi`) REFERENCES `Tournoi` (`id_tournoi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Participant`
--
ALTER TABLE `Participant`
ADD CONSTRAINT `Participant_ibfk_1` FOREIGN KEY (`id_participant`) REFERENCES `Utilisateur` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ParticiperCompetition`
--
ALTER TABLE `ParticiperCompetition`
ADD CONSTRAINT `ParticiperCompetition_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `Joueur` (`id_joueur`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `ParticiperCompetition_ibfk_2` FOREIGN KEY (`id_competition`) REFERENCES `Competition` (`id_competition`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Reserver`
--
ALTER TABLE `Reserver`
ADD CONSTRAINT `Reserver_ibfk_1` FOREIGN KEY (`id_hebergement`) REFERENCES `Hebergement` (`id_hebergement`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Reserver_ibfk_3` FOREIGN KEY (`id_participant`) REFERENCES `Participant` (`id_participant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Staff`
--
ALTER TABLE `Staff`
ADD CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `Participant` (`id_participant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Terrain`
--
ALTER TABLE `Terrain`
ADD CONSTRAINT `Terrain_ibfk_1` FOREIGN KEY (`id_typeTerrain`) REFERENCES `TypeTerrain` (`id_typeTerrain`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `terrain_tournoi`
--
ALTER TABLE `terrain_tournoi`
ADD CONSTRAINT `terrain_tournoi_ibfk_1` FOREIGN KEY (`id_terrain`) REFERENCES `Terrain` (`id_terrain`) ON UPDATE CASCADE,
ADD CONSTRAINT `terrain_tournoi_ibfk_2` FOREIGN KEY (`id_tournoi`) REFERENCES `Tournoi` (`id_tournoi`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `Tournoi`
--
ALTER TABLE `Tournoi`
ADD CONSTRAINT `Tournoi_ibfk_1` FOREIGN KEY (`id_addresse`) REFERENCES `Adresse` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
ADD CONSTRAINT `Utilisateur_ibfk_1` FOREIGN KEY (`id_addresse`) REFERENCES `Adresse` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

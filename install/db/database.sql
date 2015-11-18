-- phpMyAdmin SQL Dump
-- version 4.2.12
-- http://www.phpmyadmin.net
--
-- Client :  mysql
-- Généré le :  Lun 16 Novembre 2015 à 15:56
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
-- Structure de la table `arbitre`
--

CREATE TABLE IF NOT EXISTS `Arbitre` (
  `id_arbitre` int(11) NOT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `id_typeArbitre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `arbre`
--

CREATE TABLE IF NOT EXISTS `Arbre` (
`id_arbre` int(11) NOT NULL,
  `contenu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `billet`
--

CREATE TABLE IF NOT EXISTS `Billet` (
`id_billet` int(11) NOT NULL,
  `prix` double NOT NULL,
  `id_typeBillet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categoriearbitre`
--

CREATE TABLE IF NOT EXISTS `CategorieArbitre` (
`id_categorie` int(11) NOT NULL,
  `libCategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `competition`
--

CREATE TABLE IF NOT EXISTS `Competition` (
`id_competition` int(11) NOT NULL,
  `id_typeCompetition` int(11) DEFAULT NULL,
  `id_tournoi` int(11) DEFAULT NULL,
  `id_arbre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `creneau`
--

CREATE TABLE IF NOT EXISTS `Creneau` (
`id_creneau` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `day` date NOT NULL,
  `hDeb` time NOT NULL,
  `hFin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `disponibilite`
--

CREATE TABLE IF NOT EXISTS `Disponibilite` (
  `id_match` int(11) NOT NULL,
  `id_billet` int(11) NOT NULL,
  `nbBilletsDispo` int(11) NOT NULL,
  `nbBilletsTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `entrainement`
--

CREATE TABLE IF NOT EXISTS `Entrainement` (
  `id_terrain` int(11) NOT NULL,
  `id_joueur` int(11) NOT NULL,
  `id_creneau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `hebergement`
--

CREATE TABLE IF NOT EXISTS `Hebergement` (
`id_hebergement` int(11) NOT NULL,
  `nbPlaces` int(11) NOT NULL,
  `id_hebergeur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `hebergeur`
--

CREATE TABLE IF NOT EXISTS `Hebergeur` (
`id_hebergeur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `host`
--

CREATE TABLE IF NOT EXISTS `Participant` (
  `id_participant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `jouer`
--

CREATE TABLE IF NOT EXISTS `Jouer` (
  `id_joueur` int(11) NOT NULL,
  `id_match` int(11) NOT NULL,
  `score` tinytext CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE IF NOT EXISTS `Joueur` (
  `id_joueur` int(11) NOT NULL,
  `classement` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

CREATE TABLE IF NOT EXISTS `Match` (
`id_match` int(11) NOT NULL,
  `id_creneau` int(11) NOT NULL,
  `id_terrain` int(11) NOT NULL,
  `id_competition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `organisateur`
--

CREATE TABLE IF NOT EXISTS `Organisateur` (
  `id_organisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `organiser`
--

CREATE TABLE IF NOT EXISTS `Organiser` (
  `id_organisateur` int(11) NOT NULL,
  `id_tournoi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

CREATE TABLE IF NOT EXISTS `ArbitrerMatch` (
  `id_arbitre` int(11) NOT NULL,
  `id_match` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participerCompetition`
--

CREATE TABLE IF NOT EXISTS `ParticiperCompetition` (
  `id_joueur` int(11) NOT NULL,
  `id_competition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participerTournoi`
--

CREATE TABLE IF NOT EXISTS `ArbitrerTournoi` (
  `id_arbitre` int(11) NOT NULL,
  `id_tournoi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE IF NOT EXISTS `Reserver` (
  `id_hebergement` int(11) NOT NULL,
  `id_participant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `staff`
--

CREATE TABLE IF NOT EXISTS `Staff` (
  `id_staff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `terrain`
--

CREATE TABLE IF NOT EXISTS `Terrain` (
`id_terrain` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `id_typeTerrain` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tournoi`
--

CREATE TABLE IF NOT EXISTS `Tournoi` (
`id_tournoi` int(11) NOT NULL,
  `dateDeb` date NOT NULL,
  `dateFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typearbitre`
--

CREATE TABLE IF NOT EXISTS `TypeArbitre` (
`id_typeArbitre` int(11) NOT NULL,
  `libTypeArbitre` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typebillet`
--

CREATE TABLE IF NOT EXISTS `TypeBillet` (
`id_typeBillet` int(11) NOT NULL,
  `libTypeBillet` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typecompetition`
--

CREATE TABLE IF NOT EXISTS `TypeCompetition` (
`id_typeCompetition` int(11) NOT NULL,
  `libType` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typeterrain`
--

CREATE TABLE IF NOT EXISTS `TypeTerrain` (
`id_typeTerrain` int(11) NOT NULL,
  `libTypeTerrain` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `Utilisateur` (
`id_user` int(11) NOT NULL,
  `login` varchar(20) CHARACTER SET utf8 NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 NOT NULL,
  `mail` varchar(20) CHARACTER SET utf8 NOT NULL,
  `firstName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `lastName` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `arbitre`
--
ALTER TABLE `Arbitre`
 ADD PRIMARY KEY (`id_arbitre`), ADD KEY `id_categorie` (`id_categorie`), ADD KEY `id_typeArbitre` (`id_typeArbitre`);

--
-- Index pour la table `arbre`
--
ALTER TABLE `Arbre`
 ADD PRIMARY KEY (`id_arbre`);

--
-- Index pour la table `billet`
--
ALTER TABLE `Billet`
 ADD PRIMARY KEY (`id_billet`), ADD KEY `id_typeBillet` (`id_typeBillet`);

--
-- Index pour la table `categoriearbitre`
--
ALTER TABLE `CategorieArbitre`
 ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `competition`
--
ALTER TABLE `Competition`
 ADD PRIMARY KEY (`id_competition`), ADD KEY `id_typeCompettion` (`id_typeCompetition`,`id_tournoi`), ADD KEY `id_tournoi` (`id_tournoi`), ADD KEY `id_arbre` (`id_arbre`);

--
-- Index pour la table `creneau`
--
ALTER TABLE `Creneau`
 ADD PRIMARY KEY (`id_creneau`);

--
-- Index pour la table `disponibilite`
--
ALTER TABLE `Disponibilite`
 ADD PRIMARY KEY (`id_match`,`id_billet`), ADD KEY `id_billet` (`id_billet`);

--
-- Index pour la table `entrainement`
--
ALTER TABLE `Entrainement`
 ADD PRIMARY KEY (`id_terrain`,`id_joueur`,`id_creneau`), ADD KEY `id_terrainEntrainement` (`id_terrain`), ADD KEY `id_joueur` (`id_joueur`), ADD KEY `id_creneau` (`id_creneau`);

--
-- Index pour la table `hebergement`
--
ALTER TABLE `hebergement`
 ADD PRIMARY KEY (`id_hebergement`), ADD KEY `id_hebergeur` (`id_hebergeur`);

--
-- Index pour la table `hebergeur`
--
ALTER TABLE `Hebergeur`
 ADD PRIMARY KEY (`id_hebergeur`), ADD KEY `id_hebergeur` (`id_hebergeur`);

--
-- Index pour la table `host`
--
ALTER TABLE `Participant`
 ADD PRIMARY KEY (`id_participant`);

--
-- Index pour la table `jouer`
--
ALTER TABLE `Jouer`
 ADD PRIMARY KEY (`id_joueur`,`id_match`), ADD KEY `id_match` (`id_match`);

--
-- Index pour la table `joueur`
--
ALTER TABLE `Joueur`
 ADD PRIMARY KEY (`id_joueur`);

--
-- Index pour la table `match`
--
ALTER TABLE `Match`
 ADD PRIMARY KEY (`id_match`), ADD KEY `id_creneau` (`id_creneau`), ADD KEY `id_terrainMatch` (`id_terrain`), ADD KEY `id_competition` (`id_competition`);

--
-- Index pour la table `organisateur`
--
ALTER TABLE `Organisateur`
 ADD PRIMARY KEY (`id_organisateur`);

--
-- Index pour la table `organiser`
--
ALTER TABLE `Organiser`
 ADD PRIMARY KEY (`id_organisateur`,`id_tournoi`), ADD KEY `id_tournoi` (`id_tournoi`);

--
-- Index pour la table `participation`
--
ALTER TABLE `Arbitrer`
 ADD PRIMARY KEY (`id_arbitre`,`id_match`), ADD KEY `id_match` (`id_match`);

--
-- Index pour la table `participerCompetition`
--
ALTER TABLE `ParticiperCompetition`
 ADD PRIMARY KEY (`id_joueur`,`id_competition`), ADD KEY `id_competition` (`id_competition`);

--
-- Index pour la table `participerTournoi`
--
ALTER TABLE `ArbitrerTournoi`
 ADD PRIMARY KEY (`id_arbitre`,`id_tournoi`), ADD KEY `id_tournoi` (`id_tournoi`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `Reserver`
 ADD PRIMARY KEY (`id_hebergement`,`id_host`), ADD KEY `id_host` (`id_host`), ADD KEY `id_hebergement` (`id_hebergement`);

--
-- Index pour la table `staff`
--
ALTER TABLE `Staff`
 ADD PRIMARY KEY (`id_staff`);

--
-- Index pour la table `terrain`
--
ALTER TABLE `Terrain`
 ADD PRIMARY KEY (`id_terrain`), ADD KEY `id_typeTerrain` (`id_typeTerrain`);

--
-- Index pour la table `tournoi`
--
ALTER TABLE `Tournoi`
 ADD PRIMARY KEY (`id_tournoi`);

--
-- Index pour la table `typearbitre`
--
ALTER TABLE `TypeArbitre`
 ADD PRIMARY KEY (`id_typeArbitre`);

--
-- Index pour la table `typebillet`
--
ALTER TABLE `TypeBillet`
 ADD PRIMARY KEY (`id_typeBillet`);

--
-- Index pour la table `typecompetition`
--
ALTER TABLE `TypeCompetition`
 ADD PRIMARY KEY (`id_typeCompetition`);

--
-- Index pour la table `typeterrain`
--
ALTER TABLE `TypeTerrain`
 ADD PRIMARY KEY (`id_typeTerrain`);

--
-- Index pour la table `user`
--
ALTER TABLE `Utilisateur`
 ADD PRIMARY KEY (`id_user`), ADD UNIQUE KEY `login` (`login`), ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `arbre`
--
ALTER TABLE `Arbre`
MODIFY `id_arbre` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `billet`
--
ALTER TABLE `Billet`
MODIFY `id_billet` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `categoriearbitre`
--
ALTER TABLE `CategorieArbitre`
MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `competition`
--
ALTER TABLE `Competition`
MODIFY `id_competition` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `creneau`
--
ALTER TABLE `Creneau`
MODIFY `id_creneau` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `hebergement`
--
ALTER TABLE `Hebergement`
MODIFY `id_hebergement` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `hebergeur`
--
ALTER TABLE `Hebergeur`
MODIFY `id_hebergeur` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `match`
--
ALTER TABLE `Match`
MODIFY `id_match` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `terrain`
--
ALTER TABLE `Terrain`
MODIFY `id_terrain` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tournoi`
--
ALTER TABLE `Tournoi`
MODIFY `id_tournoi` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `typearbitre`
--
ALTER TABLE `TypeArbitre`
MODIFY `id_typeArbitre` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `typebillet`
--
ALTER TABLE `TypeBillet`
MODIFY `id_typeBillet` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `typecompetition`
--
ALTER TABLE `TypeCompetition`
MODIFY `id_typeCompetition` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `typeterrain`
--
ALTER TABLE `TypeTerrain`
MODIFY `id_typeTerrain` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `Utilisateur`
MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `arbitre`
--
ALTER TABLE `Arbitre`
ADD CONSTRAINT `arbitre_ibfk_1` FOREIGN KEY (`id_arbitre`) REFERENCES `Participant` (`id_participant`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `arbitre_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `CategorieArbitre` (`id_categorie`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `arbitre_ibfk_3` FOREIGN KEY (`id_typeArbitre`) REFERENCES `TypeArbitre` (`id_typeArbitre`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `billet`
--
ALTER TABLE `billet`
ADD CONSTRAINT `billet_ibfk_1` FOREIGN KEY (`id_typeBillet`) REFERENCES `TypeBillet` (`id_typeBillet`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `competition`
--
ALTER TABLE `competition`
ADD CONSTRAINT `competition_ibfk_1` FOREIGN KEY (`id_typeCompetition`) REFERENCES `TypeCompetition` (`id_typeCompetition`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `competition_ibfk_2` FOREIGN KEY (`id_tournoi`) REFERENCES `Tournoi` (`id_tournoi`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `competition_ibfk_3` FOREIGN KEY (`id_arbre`) REFERENCES `Arbre` (`id_arbre`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `disponibilite`
--
ALTER TABLE `disponibilite`
ADD CONSTRAINT `disponibilite_ibfk_1` FOREIGN KEY (`id_match`) REFERENCES `Match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `disponibilite_ibfk_2` FOREIGN KEY (`id_billet`) REFERENCES `Billet` (`id_billet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `entrainement`
--
ALTER TABLE `entrainement`
ADD CONSTRAINT `entrainement_ibfk_2` FOREIGN KEY (`id_creneau`) REFERENCES `Creneau` (`id_creneau`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `entrainement_ibfk_3` FOREIGN KEY (`id_joueur`) REFERENCES `Joueur` (`id_joueur`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `entrainement_ibfk_4` FOREIGN KEY (`id_terrain`) REFERENCES `Terrain` (`id_terrain`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `hebergement`
--
ALTER TABLE `hebergement`
ADD CONSTRAINT `hebergement_ibfk_1` FOREIGN KEY (`id_hebergeur`) REFERENCES `Hebergeur` (`id_hebergeur`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `hebergeur`
--
ALTER TABLE `hebergeur`
ADD CONSTRAINT `hebergeur_ibfk_1` FOREIGN KEY (`id_hebergeur`) REFERENCES `Utilisateur` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `host`
--
ALTER TABLE `Participant`
ADD CONSTRAINT `host_ibfk_1` FOREIGN KEY (`id_participant`) REFERENCES `Utilisateur` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `jouer`
--
ALTER TABLE `Jouer`
ADD CONSTRAINT `jouer_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `Joueur` (`id_joueur`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `jouer_ibfk_2` FOREIGN KEY (`id_match`) REFERENCES `Match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `joueur`
--
ALTER TABLE `Joueur`
ADD CONSTRAINT `joueur_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `Participant` (`id_participant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `match`
--
ALTER TABLE `Match`
ADD CONSTRAINT `match_ibfk_1` FOREIGN KEY (`id_creneau`) REFERENCES `Creneau` (`id_creneau`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `match_ibfk_3` FOREIGN KEY (`id_competition`) REFERENCES `Competition` (`id_competition`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `match_ibfk_4` FOREIGN KEY (`id_terrain`) REFERENCES `Terrain` (`id_terrain`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `organisateur`
--
ALTER TABLE `Organisateur`
ADD CONSTRAINT `organisateur_ibfk_1` FOREIGN KEY (`id_organisateur`) REFERENCES `Utilisateur` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `organiser`
--
ALTER TABLE `Organiser`
ADD CONSTRAINT `organiser_ibfk_1` FOREIGN KEY (`id_organisateur`) REFERENCES `Organisateur` (`id_organisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `organiser_ibfk_2` FOREIGN KEY (`id_tournoi`) REFERENCES `Tournoi` (`id_tournoi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participation`
--
ALTER TABLE `Arbitrer`
ADD CONSTRAINT `participation_ibfk_1` FOREIGN KEY (`id_arbitre`) REFERENCES `Arbitre` (`id_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`id_match`) REFERENCES `Match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participerCompetition`
--
ALTER TABLE `ParticiperCompetition`
ADD CONSTRAINT `participerCompetition_ibfk_2` FOREIGN KEY (`id_competition`) REFERENCES `Competition` (`id_competition`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `participerCompetition_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `Joueur` (`id_joueur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participerTournoi`
--
ALTER TABLE `ArbitrerTournoi`
ADD CONSTRAINT `participerTournoi_ibfk_2` FOREIGN KEY (`id_tournoi`) REFERENCES `Tournoi` (`id_tournoi`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `participerTournoi_ibfk_1` FOREIGN KEY (`id_arbitre`) REFERENCES `Arbitre` (`id_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `Reserver`
ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_hebergement`) REFERENCES `Hebergement` (`id_hebergement`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`id_host`) REFERENCES `Participant` (`id_participant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `staff`
--
ALTER TABLE `Staff`
ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `Participant` (`id_participant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `terrain`
--
ALTER TABLE `Terrain`
ADD CONSTRAINT `terrain_ibfk_1` FOREIGN KEY (`id_typeTerrain`) REFERENCES `TypeTerrain` (`id_typeTerrain`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

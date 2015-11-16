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

CREATE TABLE IF NOT EXISTS `arbitre` (
  `id_arbitre` int(11) NOT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `id_typeArbitre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `arbre`
--

CREATE TABLE IF NOT EXISTS `arbre` (
`id_arbre` int(11) NOT NULL,
  `contenu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `billet`
--

CREATE TABLE IF NOT EXISTS `billet` (
`id_billet` int(11) NOT NULL,
  `prix` double NOT NULL,
  `id_typeBillet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categoriearbitre`
--

CREATE TABLE IF NOT EXISTS `categoriearbitre` (
`id_categorie` int(11) NOT NULL,
  `libCategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `competition`
--

CREATE TABLE IF NOT EXISTS `competition` (
`id_competition` int(11) NOT NULL,
  `id_typeCompetition` int(11) DEFAULT NULL,
  `id_tournoi` int(11) DEFAULT NULL,
  `id_arbre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `creneau`
--

CREATE TABLE IF NOT EXISTS `creneau` (
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

CREATE TABLE IF NOT EXISTS `disponibilite` (
  `id_match` int(11) NOT NULL,
  `id_billet` int(11) NOT NULL,
  `nbBilletsDispo` int(11) NOT NULL,
  `nbBilletsTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `entrainement`
--

CREATE TABLE IF NOT EXISTS `entrainement` (
  `id_terrain` int(11) NOT NULL,
  `id_joueur` int(11) NOT NULL,
  `id_creneau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `hebergement`
--

CREATE TABLE IF NOT EXISTS `hebergement` (
`id_hebergement` int(11) NOT NULL,
  `nbPlaces` int(11) NOT NULL,
  `id_hebergeur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `hebergeur`
--

CREATE TABLE IF NOT EXISTS `hebergeur` (
`id_hebergeur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `host`
--

CREATE TABLE IF NOT EXISTS `host` (
  `id_host` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `jouer`
--

CREATE TABLE IF NOT EXISTS `jouer` (
  `id_joueur` int(11) NOT NULL,
  `id_match` int(11) NOT NULL,
  `score` tinytext CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE IF NOT EXISTS `joueur` (
  `id_joueur` int(11) NOT NULL,
  `classement` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

CREATE TABLE IF NOT EXISTS `match` (
`id_match` int(11) NOT NULL,
  `id_creneau` int(11) NOT NULL,
  `id_terrain` int(11) NOT NULL,
  `id_competition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `organisateur`
--

CREATE TABLE IF NOT EXISTS `organisateur` (
  `id_organisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `organiser`
--

CREATE TABLE IF NOT EXISTS `organiser` (
  `id_organisateur` int(11) NOT NULL,
  `id_tournoi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

CREATE TABLE IF NOT EXISTS `participation` (
  `id_arbitre` int(11) NOT NULL,
  `id_match` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participerCompetition`
--

CREATE TABLE IF NOT EXISTS `participerCompetition` (
  `id_joueur` int(11) NOT NULL,
  `id_competition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participerTournoi`
--

CREATE TABLE IF NOT EXISTS `participerTournoi` (
  `id_arbitre` int(11) NOT NULL,
  `id_tournoi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `id_hebergement` int(11) NOT NULL,
  `id_tournoi` int(11) NOT NULL,
  `id_host` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `id_staff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `terrain`
--

CREATE TABLE IF NOT EXISTS `terrain` (
`id_terrain` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `id_typeTerrain` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tournoi`
--

CREATE TABLE IF NOT EXISTS `tournoi` (
`id_tournoi` int(11) NOT NULL,
  `dateDeb` date NOT NULL,
  `dateFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typearbitre`
--

CREATE TABLE IF NOT EXISTS `typearbitre` (
`id_typeArbitre` int(11) NOT NULL,
  `libTypeArbitre` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typebillet`
--

CREATE TABLE IF NOT EXISTS `typebillet` (
`id_typeBillet` int(11) NOT NULL,
  `libTypeBillet` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typecompetition`
--

CREATE TABLE IF NOT EXISTS `typecompetition` (
`id_typeCompetition` int(11) NOT NULL,
  `libType` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typeterrain`
--

CREATE TABLE IF NOT EXISTS `typeterrain` (
`id_typeTerrain` int(11) NOT NULL,
  `libTypeTerrain` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
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
ALTER TABLE `arbitre`
 ADD PRIMARY KEY (`id_arbitre`), ADD KEY `id_categorie` (`id_categorie`), ADD KEY `id_typeArbitre` (`id_typeArbitre`);

--
-- Index pour la table `arbre`
--
ALTER TABLE `arbre`
 ADD PRIMARY KEY (`id_arbre`);

--
-- Index pour la table `billet`
--
ALTER TABLE `billet`
 ADD PRIMARY KEY (`id_billet`), ADD KEY `id_typeBillet` (`id_typeBillet`);

--
-- Index pour la table `categoriearbitre`
--
ALTER TABLE `categoriearbitre`
 ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `competition`
--
ALTER TABLE `competition`
 ADD PRIMARY KEY (`id_competition`), ADD KEY `id_typeCompettion` (`id_typeCompetition`,`id_tournoi`), ADD KEY `id_tournoi` (`id_tournoi`), ADD KEY `id_arbre` (`id_arbre`);

--
-- Index pour la table `creneau`
--
ALTER TABLE `creneau`
 ADD PRIMARY KEY (`id_creneau`);

--
-- Index pour la table `disponibilite`
--
ALTER TABLE `disponibilite`
 ADD PRIMARY KEY (`id_match`,`id_billet`), ADD KEY `id_billet` (`id_billet`);

--
-- Index pour la table `entrainement`
--
ALTER TABLE `entrainement`
 ADD PRIMARY KEY (`id_terrain`,`id_joueur`,`id_creneau`), ADD KEY `id_terrainEntrainement` (`id_terrain`), ADD KEY `id_joueur` (`id_joueur`), ADD KEY `id_creneau` (`id_creneau`);

--
-- Index pour la table `hebergement`
--
ALTER TABLE `hebergement`
 ADD PRIMARY KEY (`id_hebergement`), ADD KEY `id_hebergeur` (`id_hebergeur`);

--
-- Index pour la table `hebergeur`
--
ALTER TABLE `hebergeur`
 ADD PRIMARY KEY (`id_hebergeur`), ADD KEY `id_hebergeur` (`id_hebergeur`);

--
-- Index pour la table `host`
--
ALTER TABLE `host`
 ADD PRIMARY KEY (`id_host`);

--
-- Index pour la table `jouer`
--
ALTER TABLE `jouer`
 ADD PRIMARY KEY (`id_joueur`,`id_match`), ADD KEY `id_match` (`id_match`);

--
-- Index pour la table `joueur`
--
ALTER TABLE `joueur`
 ADD PRIMARY KEY (`id_joueur`);

--
-- Index pour la table `match`
--
ALTER TABLE `match`
 ADD PRIMARY KEY (`id_match`), ADD KEY `id_creneau` (`id_creneau`), ADD KEY `id_terrainMatch` (`id_terrain`), ADD KEY `id_competition` (`id_competition`);

--
-- Index pour la table `organisateur`
--
ALTER TABLE `organisateur`
 ADD PRIMARY KEY (`id_organisateur`);

--
-- Index pour la table `organiser`
--
ALTER TABLE `organiser`
 ADD PRIMARY KEY (`id_organisateur`,`id_tournoi`), ADD KEY `id_tournoi` (`id_tournoi`);

--
-- Index pour la table `participation`
--
ALTER TABLE `participation`
 ADD PRIMARY KEY (`id_arbitre`,`id_match`), ADD KEY `id_match` (`id_match`);

--
-- Index pour la table `participerCompetition`
--
ALTER TABLE `participerCompetition`
 ADD PRIMARY KEY (`id_joueur`,`id_competition`), ADD KEY `id_competition` (`id_competition`);

--
-- Index pour la table `participerTournoi`
--
ALTER TABLE `participerTournoi`
 ADD PRIMARY KEY (`id_arbitre`,`id_tournoi`), ADD KEY `id_tournoi` (`id_tournoi`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
 ADD PRIMARY KEY (`id_hebergement`,`id_tournoi`,`id_host`), ADD KEY `id_tournoi` (`id_tournoi`), ADD KEY `id_host` (`id_host`), ADD KEY `id_hebergement` (`id_hebergement`);

--
-- Index pour la table `staff`
--
ALTER TABLE `staff`
 ADD PRIMARY KEY (`id_staff`);

--
-- Index pour la table `terrain`
--
ALTER TABLE `terrain`
 ADD PRIMARY KEY (`id_terrain`), ADD KEY `id_typeTerrain` (`id_typeTerrain`);

--
-- Index pour la table `tournoi`
--
ALTER TABLE `tournoi`
 ADD PRIMARY KEY (`id_tournoi`);

--
-- Index pour la table `typearbitre`
--
ALTER TABLE `typearbitre`
 ADD PRIMARY KEY (`id_typeArbitre`);

--
-- Index pour la table `typebillet`
--
ALTER TABLE `typebillet`
 ADD PRIMARY KEY (`id_typeBillet`);

--
-- Index pour la table `typecompetition`
--
ALTER TABLE `typecompetition`
 ADD PRIMARY KEY (`id_typeCompetition`);

--
-- Index pour la table `typeterrain`
--
ALTER TABLE `typeterrain`
 ADD PRIMARY KEY (`id_typeTerrain`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id_user`), ADD UNIQUE KEY `login` (`login`), ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `arbre`
--
ALTER TABLE `arbre`
MODIFY `id_arbre` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `billet`
--
ALTER TABLE `billet`
MODIFY `id_billet` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `categoriearbitre`
--
ALTER TABLE `categoriearbitre`
MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `competition`
--
ALTER TABLE `competition`
MODIFY `id_competition` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `creneau`
--
ALTER TABLE `creneau`
MODIFY `id_creneau` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `hebergement`
--
ALTER TABLE `hebergement`
MODIFY `id_hebergement` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `hebergeur`
--
ALTER TABLE `hebergeur`
MODIFY `id_hebergeur` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `match`
--
ALTER TABLE `match`
MODIFY `id_match` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `terrain`
--
ALTER TABLE `terrain`
MODIFY `id_terrain` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tournoi`
--
ALTER TABLE `tournoi`
MODIFY `id_tournoi` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `typearbitre`
--
ALTER TABLE `typearbitre`
MODIFY `id_typeArbitre` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `typebillet`
--
ALTER TABLE `typebillet`
MODIFY `id_typeBillet` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `typecompetition`
--
ALTER TABLE `typecompetition`
MODIFY `id_typeCompetition` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `typeterrain`
--
ALTER TABLE `typeterrain`
MODIFY `id_typeTerrain` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `arbitre`
--
ALTER TABLE `arbitre`
ADD CONSTRAINT `arbitre_ibfk_1` FOREIGN KEY (`id_arbitre`) REFERENCES `host` (`id_host`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `arbitre_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `categoriearbitre` (`id_categorie`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `arbitre_ibfk_3` FOREIGN KEY (`id_typeArbitre`) REFERENCES `typearbitre` (`id_typeArbitre`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `billet`
--
ALTER TABLE `billet`
ADD CONSTRAINT `billet_ibfk_1` FOREIGN KEY (`id_typeBillet`) REFERENCES `typebillet` (`id_typeBillet`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `competition`
--
ALTER TABLE `competition`
ADD CONSTRAINT `competition_ibfk_1` FOREIGN KEY (`id_typeCompetition`) REFERENCES `typecompetition` (`id_typeCompetition`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `competition_ibfk_2` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `competition_ibfk_3` FOREIGN KEY (`id_arbre`) REFERENCES `arbre` (`id_arbre`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `disponibilite`
--
ALTER TABLE `disponibilite`
ADD CONSTRAINT `disponibilite_ibfk_1` FOREIGN KEY (`id_match`) REFERENCES `match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `disponibilite_ibfk_2` FOREIGN KEY (`id_billet`) REFERENCES `billet` (`id_billet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `entrainement`
--
ALTER TABLE `entrainement`
ADD CONSTRAINT `entrainement_ibfk_2` FOREIGN KEY (`id_creneau`) REFERENCES `creneau` (`id_creneau`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `entrainement_ibfk_3` FOREIGN KEY (`id_joueur`) REFERENCES `joueur` (`id_joueur`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `entrainement_ibfk_4` FOREIGN KEY (`id_terrain`) REFERENCES `terrain` (`id_terrain`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `hebergement`
--
ALTER TABLE `hebergement`
ADD CONSTRAINT `hebergement_ibfk_1` FOREIGN KEY (`id_hebergeur`) REFERENCES `hebergeur` (`id_hebergeur`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `hebergeur`
--
ALTER TABLE `hebergeur`
ADD CONSTRAINT `hebergeur_ibfk_1` FOREIGN KEY (`id_hebergeur`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `host`
--
ALTER TABLE `host`
ADD CONSTRAINT `host_ibfk_1` FOREIGN KEY (`id_host`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `jouer`
--
ALTER TABLE `jouer`
ADD CONSTRAINT `jouer_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `joueur` (`id_joueur`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `jouer_ibfk_2` FOREIGN KEY (`id_match`) REFERENCES `match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `joueur`
--
ALTER TABLE `joueur`
ADD CONSTRAINT `joueur_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `host` (`id_host`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `match`
--
ALTER TABLE `match`
ADD CONSTRAINT `match_ibfk_1` FOREIGN KEY (`id_creneau`) REFERENCES `creneau` (`id_creneau`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `match_ibfk_3` FOREIGN KEY (`id_competition`) REFERENCES `competition` (`id_competition`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `match_ibfk_4` FOREIGN KEY (`id_terrain`) REFERENCES `terrain` (`id_terrain`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `organisateur`
--
ALTER TABLE `organisateur`
ADD CONSTRAINT `organisateur_ibfk_1` FOREIGN KEY (`id_organisateur`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `organiser`
--
ALTER TABLE `organiser`
ADD CONSTRAINT `organiser_ibfk_1` FOREIGN KEY (`id_organisateur`) REFERENCES `organisateur` (`id_organisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `organiser_ibfk_2` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participation`
--
ALTER TABLE `participation`
ADD CONSTRAINT `participation_ibfk_1` FOREIGN KEY (`id_arbitre`) REFERENCES `arbitre` (`id_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`id_match`) REFERENCES `match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participerCompetition`
--
ALTER TABLE `participerCompetition`
ADD CONSTRAINT `participerCompetition_ibfk_2` FOREIGN KEY (`id_competition`) REFERENCES `competition` (`id_competition`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `participerCompetition_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `joueur` (`id_joueur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participerTournoi`
--
ALTER TABLE `participerTournoi`
ADD CONSTRAINT `participerTournoi_ibfk_2` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `participerTournoi_ibfk_1` FOREIGN KEY (`id_arbitre`) REFERENCES `arbitre` (`id_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_hebergement`) REFERENCES `hebergement` (`id_hebergement`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`id_host`) REFERENCES `host` (`id_host`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `staff`
--
ALTER TABLE `staff`
ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `host` (`id_host`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `terrain`
--
ALTER TABLE `terrain`
ADD CONSTRAINT `terrain_ibfk_1` FOREIGN KEY (`id_typeTerrain`) REFERENCES `typeterrain` (`id_typeTerrain`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

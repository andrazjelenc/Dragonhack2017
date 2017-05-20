-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 20. maj 2017 ob 16.30
-- Različica strežnika: 5.7.9
-- Različica PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Zbirka podatkov: `dragonhack`
--

-- --------------------------------------------------------

--
-- Struktura tabele `modul`
--

DROP TABLE IF EXISTS `modul`;
CREATE TABLE IF NOT EXISTS `modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `modul`
--

INSERT INTO `modul` (`id_modul`, `naziv`) VALUES
(1, 'Algoritmi in sistemski programi'),
(2, 'Informacijski sistemi'),
(3, 'Medijske tehnologije'),
(4, 'Obvladovanje informatike'),
(5, 'Razvoj programske opreme'),
(6, 'Računalniška omrežja'),
(7, 'Računalniški sistemi'),
(8, 'Umetna inteligenca');

-- --------------------------------------------------------

--
-- Struktura tabele `nosilec`
--

DROP TABLE IF EXISTS `nosilec`;
CREATE TABLE IF NOT EXISTS `nosilec` (
  `id_nosilec` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  PRIMARY KEY (`id_nosilec`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `nosilec`
--

INSERT INTO `nosilec` (`id_nosilec`, `naziv`, `link`) VALUES
(1, 'doc. dr. Tomaž Dobravec', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/tomaz-dobravec'),
(2, 'izr. prof. dr. Marko Robnik Šikonja', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/marko-robnik-sikonja'),
(3, 'doc. dr. Boštjan Slivnik', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/bostjan-slivnik'),
(4, 'prof. dr. Denis Trček', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/denis-trcek'),
(5, 'prof. dr. Blaž Zupan', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/blaz-zupan'),
(6, 'doc. dr. Tomaž Hovelja', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/tomaz-hovelja'),
(7, 'doc. dr. Matija Marolt', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/matija-marolt'),
(8, 'doc. dr. Luka Šajn', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/luka-sajn'),
(9, 'izr. prof. dr. Narvika Bovcon', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/narvika-bovcon'),
(10, 'izr. prof. dr. Matjaž Kukar', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/matjaz-kukar'),
(11, 'prof. dr. Marko Bajec', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/marko-bajec'),
(12, 'doc. dr. Rok Rupnik', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/rok-rupnik'),
(13, 'prof. dr. Matjaž Branko Jurič', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/matjaz-branko-juric'),
(14, 'doc. dr. Aleš Smrdel', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/ales-smrdel'),
(15, 'prof. dr. Viljan Mahnič', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/viljan-mahnic'),
(16, 'prof. dr. Miha Mraz', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/miha-mraz'),
(17, 'izr. prof. dr. Mojca Ciglarič', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/mojca-ciglaric'),
(18, 'prof. dr. Nikolaj Zimic', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/nikolaj-zimic'),
(19, 'izr. prof. dr. Uroš Lotrič', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/uros-lotric'),
(20, 'izr. prof. dr. Patricio Bulić', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/patricio-bulic'),
(21, 'doc. dr. Matej Kristan', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/matej-kristan'),
(22, 'prof. dr. Igon Kononeko', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/igor-kononenko'),
(23, 'izr. prof. dr. Danijel Skočaj', 'https://fri.uni-lj.si/sl/o-fakulteti/osebje/danijel-skocaj');

-- --------------------------------------------------------

--
-- Struktura tabele `predmet`
--

DROP TABLE IF EXISTS `predmet`;
CREATE TABLE IF NOT EXISTS `predmet` (
  `id_predmet` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `id_nosilec` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `kvaliteta` int(11) NOT NULL,
  PRIMARY KEY (`id_predmet`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `predmet`
--

INSERT INTO `predmet` (`id_predmet`, `naziv`, `id_nosilec`, `id_modul`, `semester`, `kvaliteta`) VALUES
(1, 'Sistemska programska oprema', 1, 1, 'zimski', 85),
(2, 'Računska zahtevnost in hevristično programiranje', 2, 1, 'zimski', 90),
(3, 'Prevajalniki', 3, 1, 'poletni', 95),
(4, 'Elektronsko poslovanje', 4, 2, 'zimski', 80),
(5, 'Poslovna inteligenca', 5, 2, 'zimski', 90),
(6, 'Organizacija in management', 6, 2, 'poletni', 100),
(7, 'Računalniška grafika in tehnologija iger', 7, 3, 'zimski', 95),
(8, 'Multimedijski sistemi', 8, 3, 'zimski', 85),
(9, 'Osnove oblikovanja', 9, 3, 'poletni', 95),
(10, 'Tehnologija upravljanja podatkov', 10, 4, 'zimski', 100),
(11, 'Razvoj informacijskih sistemov', 11, 4, 'zimski', 80),
(12, 'Planiranje in upravljanje informatike', 12, 4, 'poletni', 90),
(13, 'Postopki razvoja programske opreme', 13, 5, 'zimski', 95),
(14, 'Spletno programiranje', 14, 5, 'zimski', 85),
(15, 'Tehnologija programske opreme', 15, 5, 'poletni', 95),
(16, 'Modeliranje računalniških omrežij', 16, 6, 'zimski', 98),
(17, 'Komunikacijski protokoli', 17, 6, 'zimski', 85),
(18, 'Brezžična in mobilna omrežja', 18, 6, 'poletni', 85),
(19, 'Porazdeljeni sistemi', 19, 7, 'zimski', 85),
(20, 'Digitalno načrtovanje', 20, 7, 'zimski', 90),
(21, 'Zanesljivost in zmogljivost računalniških sistemov', 16, 7, 'poletni', 99),
(22, 'Umetno zaznavanje', 21, 8, 'zimski', 95),
(23, 'Intelignetni sistemi', 22, 8, 'zimski', 95),
(24, 'Razvoj intelignetnih sistemov', 23, 8, 'poletni', 87);

-- --------------------------------------------------------

--
-- Struktura tabele `zastavice_izvedba`
--

DROP TABLE IF EXISTS `zastavice_izvedba`;
CREATE TABLE IF NOT EXISTS `zastavice_izvedba` (
  `id_predmeta` int(11) NOT NULL,
  `domača naloga` int(11) NOT NULL,
  `skupinsko delo` int(11) NOT NULL,
  `izpit` int(11) NOT NULL,
  `seminar` int(11) NOT NULL,
  `kolokviji` int(11) NOT NULL,
  `praktično usmerjeno` int(11) NOT NULL,
  `teoretično usmerjeno` int(11) NOT NULL,
  KEY `id_predmeta` (`id_predmeta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `zastavice_izvedba`
--

INSERT INTO `zastavice_izvedba` (`id_predmeta`, `domača naloga`, `skupinsko delo`, `izpit`, `seminar`, `kolokviji`, `praktično usmerjeno`, `teoretično usmerjeno`) VALUES
(1, 1, 0, 1, 0, 0, 1, 0),
(2, 1, 0, 1, 0, 0, 0, 1),
(3, 1, 0, 1, 0, 0, 1, 1),
(4, 0, 0, 1, 1, 0, 1, 1),
(5, 1, 0, 1, 0, 1, 0, 1),
(6, 0, 0, 1, 1, 1, 1, 1),
(7, 1, 1, 1, 1, 0, 1, 0),
(8, 1, 0, 1, 0, 0, 1, 1),
(9, 1, 0, 0, 1, 0, 1, 0),
(10, 1, 0, 1, 1, 0, 1, 1),
(11, 0, 1, 1, 1, 0, 1, 1),
(12, 0, 0, 1, 1, 1, 1, 1),
(13, 0, 1, 1, 0, 1, 1, 0),
(14, 0, 0, 1, 1, 1, 1, 0),
(15, 0, 1, 1, 1, 1, 1, 0),
(16, 0, 1, 1, 1, 0, 1, 0),
(17, 0, 0, 1, 1, 1, 1, 1),
(18, 1, 0, 1, 1, 0, 1, 1),
(19, 0, 0, 1, 1, 0, 1, 1),
(20, 1, 0, 1, 0, 0, 1, 0),
(21, 1, 0, 1, 0, 0, 1, 1),
(22, 1, 0, 1, 0, 0, 1, 1),
(23, 1, 0, 1, 1, 0, 0, 1),
(24, 1, 0, 1, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Struktura tabele `zastavice_vsebina`
--

DROP TABLE IF EXISTS `zastavice_vsebina`;
CREATE TABLE IF NOT EXISTS `zastavice_vsebina` (
  `id_predmeta` int(11) NOT NULL,
  `informacijske tehnologije` int(11) NOT NULL,
  `umetna inteligenca` int(11) NOT NULL,
  `medijske tehnologije` int(11) NOT NULL,
  `spletne tehnologije` int(11) NOT NULL,
  `računalniški sistemi` int(11) NOT NULL,
  `algoritmi` int(11) NOT NULL,
  `razvoj programske opreme` int(11) NOT NULL,
  `računalniška omrežja` int(11) NOT NULL,
  `podatkovno rudarjenje` int(11) NOT NULL,
  `odločitveni sistemi` int(11) NOT NULL,
  `umetno zaznavanje` int(11) NOT NULL,
  `strojno učenje` int(11) NOT NULL,
  `strojna oprema` int(11) NOT NULL,
  `ekomika` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `zastavice_vsebina`
--

INSERT INTO `zastavice_vsebina` (`id_predmeta`, `informacijske tehnologije`, `umetna inteligenca`, `medijske tehnologije`, `spletne tehnologije`, `računalniški sistemi`, `algoritmi`, `razvoj programske opreme`, `računalniška omrežja`, `podatkovno rudarjenje`, `odločitveni sistemi`, `umetno zaznavanje`, `strojno učenje`, `strojna oprema`, `ekomika`) VALUES
(1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(5, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1),
(6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(7, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
(11, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1),
(13, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(14, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(15, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(16, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(17, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(18, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0),
(19, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0),
(20, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(21, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(23, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0),
(24, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

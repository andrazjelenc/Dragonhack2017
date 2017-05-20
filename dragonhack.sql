-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 20, 2017 at 11:34 PM
-- Server version: 10.1.23-MariaDB
-- PHP Version: 7.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dragonhack`
--

-- --------------------------------------------------------

--
-- Table structure for table `predmet`
--

CREATE TABLE `predmet` (
  `id_predmet` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `id_nosilec` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `kvaliteta` int(11) NOT NULL,
  `predmet_link` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `predmet`
--

INSERT INTO `predmet` (`id_predmet`, `naziv`, `id_nosilec`, `id_modul`, `semester`, `kvaliteta`, `predmet_link`) VALUES
(1, 'Sistemska programska oprema', 1, 1, 'zimski', 35, 'https://fri.uni-lj.si/sl/predmet/sistemska-programska-oprema?id=15724'),
(2, 'Računska zahtevnost in hevristično programiranje', 2, 1, 'zimski', 65, 'https://fri.uni-lj.si/sl/predmet/racunska-zahtevnost-hevristicno-programiranje?id=15724'),
(3, 'Prevajalniki', 3, 1, 'poletni', 95, 'https://fri.uni-lj.si/sl/predmet/prevajalniki?id=15724'),
(4, 'Elektronsko poslovanje', 4, 2, 'zimski', 80, 'https://fri.uni-lj.si/sl/predmet/elektronsko-poslovanje?id=15724'),
(5, 'Poslovna inteligenca', 5, 2, 'zimski', 90, 'https://fri.uni-lj.si/sl/predmet/poslovna-inteligenca?id=15724'),
(6, 'Organizacija in management', 6, 2, 'poletni', 100, 'https://fri.uni-lj.si/sl/predmet/organizacija-management?id=15724'),
(7, 'Računalniška grafika in tehnologija iger', 7, 3, 'zimski', 95, 'https://fri.uni-lj.si/sl/predmet/racunalniska-grafika-tehnologija-iger?id=15724'),
(8, 'Multimedijski sistemi', 8, 3, 'zimski', 85, 'https://fri.uni-lj.si/sl/predmet/multimedijski-sistemi?id=15724'),
(9, 'Osnove oblikovanja', 9, 3, 'poletni', 95, 'https://fri.uni-lj.si/sl/predmet/osnove-oblikovanja?id=15724'),
(10, 'Tehnologija upravljanja podatkov', 10, 4, 'zimski', 100, 'https://fri.uni-lj.si/sl/predmet/tehnologija-upravljanja-podatkov?id=15724'),
(11, 'Razvoj informacijskih sistemov', 11, 4, 'zimski', 80, 'https://fri.uni-lj.si/sl/predmet/razvoj-informacijskih-sistemov-0?id=15724'),
(12, 'Planiranje in upravljanje informatike', 12, 4, 'poletni', 90, 'https://fri.uni-lj.si/sl/predmet/planiranje-upravljanje-informatike?id=15724'),
(13, 'Postopki razvoja programske opreme', 13, 5, 'zimski', 95, 'https://fri.uni-lj.si/sl/predmet/postopki-razvoja-programske-opreme?id=15724'),
(14, 'Spletno programiranje', 14, 5, 'zimski', 85, 'https://fri.uni-lj.si/sl/predmet/spletno-programiranje?id=15724'),
(15, 'Tehnologija programske opreme', 15, 5, 'poletni', 95, 'https://fri.uni-lj.si/sl/predmet/tehnologija-programske-opreme-0?id=15724'),
(16, 'Modeliranje računalniških omrežij', 16, 6, 'zimski', 98, 'https://fri.uni-lj.si/sl/predmet/modeliranje-racunalniskih-omrezij?id=15724'),
(17, 'Komunikacijski protokoli', 17, 6, 'zimski', 85, 'https://fri.uni-lj.si/sl/predmet/komunikacijski-protokoli?id=15724'),
(18, 'Brezžična in mobilna omrežja', 18, 6, 'poletni', 85, 'https://fri.uni-lj.si/sl/predmet/brezzicna-mobilna-omrezja?id=15724'),
(19, 'Porazdeljeni sistemi', 19, 7, 'zimski', 85, 'https://fri.uni-lj.si/sl/predmet/porazdeljeni-sistemi?id=15724'),
(20, 'Digitalno načrtovanje', 20, 7, 'zimski', 90, 'https://fri.uni-lj.si/sl/predmet/digitalno-nacrtovanje?id=15724'),
(21, 'Zanesljivost in zmogljivost računalniških sistemov', 16, 7, 'poletni', 99, 'https://fri.uni-lj.si/sl/predmet/zanesljivost-zmogljivost-racunalniskih-sistemov?id=15724'),
(22, 'Umetno zaznavanje', 21, 8, 'zimski', 95, 'https://fri.uni-lj.si/sl/predmet/umetno-zaznavanje?id=15724'),
(23, 'Intelignetni sistemi', 22, 8, 'zimski', 95, 'https://fri.uni-lj.si/sl/predmet/inteligentni-sistemi?id=15724'),
(24, 'Razvoj intelignetnih sistemov', 23, 8, 'poletni', 87, 'https://fri.uni-lj.si/sl/predmet/razvoj-inteligentnih-sistemov?id=15724');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `predmet`
--
ALTER TABLE `predmet`
  ADD PRIMARY KEY (`id_predmet`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `predmet`
--
ALTER TABLE `predmet`
  MODIFY `id_predmet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

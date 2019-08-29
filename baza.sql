-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2019 at 03:17 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baza`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) COLLATE utf8_croatian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('779df6b4eee2');

-- --------------------------------------------------------

--
-- Table structure for table `bolnica`
--

CREATE TABLE `bolnica` (
  `id` int(11) NOT NULL,
  `naziv` varchar(140) COLLATE utf8_croatian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `bolnica`
--

INSERT INTO `bolnica` (`id`, `naziv`) VALUES
(1, 'Opća bolnica \"Dr. Josip Benčević\" Slavonski Brod'),
(2, 'Opća bolnica Dubrovnik'),
(3, 'Klinička bolnica \"Dubrava\" Zagreb'),
(4, 'Klinički bolnički centar Rijeka'),
(5, 'Opća bolnica Pula'),
(6, 'Opća bolnica Nova Gradiška'),
(7, 'Opća bolnica Pakrac'),
(8, 'Opća županijska bolnica Vinkovci'),
(9, 'Klinička bolnica \"Sveti Duh\" Zagreb'),
(10, 'Opća bolnica \"Dr. Tomislav Bardek\" Koprivnica');

-- --------------------------------------------------------

--
-- Table structure for table `doktor`
--

CREATE TABLE `doktor` (
  `id` int(11) NOT NULL,
  `ime` varchar(120) COLLATE utf8_croatian_ci DEFAULT NULL,
  `prezime` varchar(120) COLLATE utf8_croatian_ci DEFAULT NULL,
  `specijalizacija_id` int(11) DEFAULT NULL,
  `bolnica_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `doktor`
--

INSERT INTO `doktor` (`id`, `ime`, `prezime`, `specijalizacija_id`, `bolnica_id`) VALUES
(17, 'Dario', 'Živković', 1, 1),
(18, 'Ivan', 'Perković', 7, 7),
(19, 'Pero', 'Ćosić', 10, 2),
(20, 'Filip', 'Horvat', 4, 6),
(21, 'Darinka', 'Domazet', 5, 3),
(22, 'Kristina', 'Delić', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ocjena`
--

CREATE TABLE `ocjena` (
  `id` int(11) NOT NULL,
  `ocjena` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `doktor_id` int(11) DEFAULT NULL,
  `opis` varchar(500) COLLATE utf8_croatian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `ocjena`
--

INSERT INTO `ocjena` (`id`, `ocjena`, `user_id`, `doktor_id`, `opis`) VALUES
(45513, 5, 6, 17, 'Ljubazan doktor, sve po dogovoru, izlječio me u rekordnom roku, svaka preporuka'),
(45514, 5, 7, 18, 'Odličan doktor, sve lijepo objasni i spreman odgovoriti na svako pitanje, vrlo pristupačan i ljubazan, sestre su mu predrage također, nakon što sam se prebacila od dr. Semenicke kod Ghariba jako sam sretna što sam prešla kod njega!'),
(45515, 5, 7, 17, 'Najbolji doktor kojeg sam upoznala. Zainteresiran, komunikativan, pouzdan i razuman. Spreman pomoći i saslušati svaki problem. Oličenje humanosti i dobrote. Da je bar više ovakvih doktora!!!'),
(45516, 1, 8, 19, 'Nadam se da će doktor Pero bar pročitati ove komentare, iako sumnjam da će je dokaknuti. On se drži iznad svojih pacijenata i ne interesira ga što oni misle. Tako će valjda biti do god bude primao plaću na ovakav način. Za njega ne vrijedi ni radno vrijeme. Dolazi i odlazi kada hoće. Sramota.'),
(45517, 5, 8, 20, 'Odličan doktor, sve po dogovoru, preporodila sam se nakon odlaska od doktora Pere!'),
(45518, 5, 8, 21, 'Doktorica je iznimno ljubazna i prije svega profesionalna. Nakon hodanja kod raznih doktora,ona je bila ta koja mi se posvetila i krenula rješavati problem. Najvažnije od svega je to što daje osjećaj sigurnosti i pokazuje interes za pacijenta.'),
(45519, 2, 9, 21, 'Spomenuta dr specijalizant je hladna, nepristupacna i distancirana. Na pacijentov upit tesko joj je odgovoriti sa dvije rijeci, a kamoli dati kratko objasnjenje nekog postupka. Na kraju u ruke samo dobijete papir sa izracunima pretraga koji Vam sami za sebe apsolutno nista ne znace'),
(45520, 1, 10, 22, 'Liječnicu ne bih nikome preporučila. Njezina stručnost je vrlo upitna. Jako voli novac. Čak me indirektno pitala za novac. Šteta što ovakivi liječnici kvare prosjek kvalitete hrvatskih liječnika. Medicinske sestre su bile vrlo ljubazne i profesionalne za razliku od doktorice');

-- --------------------------------------------------------

--
-- Table structure for table `specijalizacija`
--

CREATE TABLE `specijalizacija` (
  `id` int(11) NOT NULL,
  `naziv` varchar(140) COLLATE utf8_croatian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `specijalizacija`
--

INSERT INTO `specijalizacija` (`id`, `naziv`) VALUES
(1, 'Dermatologija i venerologija'),
(2, 'Hitna medicina'),
(3, 'Klinička radiologija'),
(4, 'Neurologija'),
(5, 'Opća interna medicina'),
(6, 'Ortopedija i traumatologija'),
(7, 'Pedijatrija'),
(8, 'Patologija'),
(9, 'Reumatologija'),
(10, 'Urologija');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(64) COLLATE utf8_croatian_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8_croatian_ci DEFAULT NULL,
  `password_hash` varchar(128) COLLATE utf8_croatian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`) VALUES
(6, 'klukic', 'klukic@unipu.hr', 'pbkdf2:sha256:50000$vvwD7Pts$fb4eac51366c542c8d2934064f39b2a03536eb771748dffb63f6ad476989b42f'),
(7, 'pperic', 'pero@net.hr', 'pbkdf2:sha256:50000$Gjt674A3$33c8dff09f83cbe7341a6e0d7c1ab7afa9d41f95f2f9dcb4a8a9950fa0b4c9bc'),
(8, 'mklikic', 'mklikic@net.hr', 'pbkdf2:sha256:50000$na3sxPYi$6d821d3782a325aa1ac7fbe0ecb5b88d004bdef3373db8183dd19b86d3ece332'),
(9, 'mlalic', 'lalka@net.hr', 'pbkdf2:sha256:50000$1sN4kLEZ$78df999d700172777900b500720442477b9898f48b47ed4882aaa6bf3b9cbcdb'),
(10, 'petra_biber', 'perica@gmail.com', 'pbkdf2:sha256:50000$Y8YQo04c$04ca1f3f584ff3643a49b3511e2db457084a6670fe6eb36d61c5433562dcf7f0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `bolnica`
--
ALTER TABLE `bolnica`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doktor`
--
ALTER TABLE `doktor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bolnica_id` (`bolnica_id`),
  ADD KEY `specijalizacija_id` (`specijalizacija_id`);

--
-- Indexes for table `ocjena`
--
ALTER TABLE `ocjena`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doktor_id` (`doktor_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `specijalizacija`
--
ALTER TABLE `specijalizacija`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_user_email` (`email`),
  ADD UNIQUE KEY `ix_user_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bolnica`
--
ALTER TABLE `bolnica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doktor`
--
ALTER TABLE `doktor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `ocjena`
--
ALTER TABLE `ocjena`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45521;

--
-- AUTO_INCREMENT for table `specijalizacija`
--
ALTER TABLE `specijalizacija`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doktor`
--
ALTER TABLE `doktor`
  ADD CONSTRAINT `doktor_ibfk_1` FOREIGN KEY (`bolnica_id`) REFERENCES `bolnica` (`id`),
  ADD CONSTRAINT `doktor_ibfk_2` FOREIGN KEY (`specijalizacija_id`) REFERENCES `specijalizacija` (`id`);

--
-- Constraints for table `ocjena`
--
ALTER TABLE `ocjena`
  ADD CONSTRAINT `ocjena_ibfk_1` FOREIGN KEY (`doktor_id`) REFERENCES `doktor` (`id`),
  ADD CONSTRAINT `ocjena_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

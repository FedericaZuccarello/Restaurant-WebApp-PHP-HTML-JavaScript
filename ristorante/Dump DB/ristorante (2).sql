-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 12, 2018 alle 20:04
-- Versione del server: 10.1.31-MariaDB
-- Versione PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ristorante`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `acquisto`
--

CREATE TABLE `acquisto` (
  `ID` int(6) NOT NULL,
  `IDmagazzino` int(6) NOT NULL,
  `IDprodotto` int(6) NOT NULL,
  `Quantita` int(6) NOT NULL,
  `Prezzo` int(6) NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `acquisto`
--

INSERT INTO `acquisto` (`ID`, `IDmagazzino`, `IDprodotto`, `Quantita`, `Prezzo`, `Data`) VALUES
(1, 4, 14, 5, 25, '2018-07-30 11:56:22'),
(2, 4, 1, 5, 2, '2018-07-30 11:56:11'),
(3, 4, 19, 6, 3, '2018-07-30 11:56:01'),
(4, 4, 10, 10, 5, '2018-07-30 11:55:46'),
(5, 4, 2, 5, 6, '2018-07-30 11:56:43'),
(6, 4, 16, 7, 6, '2018-07-30 12:03:32'),
(7, 4, 5, 20, 10, '2018-07-30 12:03:32'),
(8, 4, 5, 5, 5, '2018-08-21 21:58:32'),
(9, 4, 15, 10, 20, '2018-08-21 21:58:32'),
(10, 4, 10, 10, 100, '2018-08-15 22:00:54');

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `ID` int(6) NOT NULL,
  `Nome` varchar(10) NOT NULL,
  `Cognome` varchar(10) NOT NULL,
  `TipoPrenotazione` int(1) NOT NULL,
  `TipoFedelta` int(1) DEFAULT NULL,
  `Soglia` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `contatto`
--

CREATE TABLE `contatto` (
  `ID` int(6) NOT NULL,
  `Descrizione` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `conto`
--

CREATE TABLE `conto` (
  `ID` int(6) NOT NULL,
  `OraEmissione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Totale` int(6) NOT NULL,
  `IDpren_asporto` int(6) DEFAULT NULL,
  `IDpren_tavolo` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `conto`
--

INSERT INTO `conto` (`ID`, `OraEmissione`, `Totale`, `IDpren_asporto`, `IDpren_tavolo`) VALUES
(1, '2018-09-08 12:14:56', 35, NULL, 3),
(2, '2018-09-08 12:14:56', 115, NULL, 2),
(3, '2018-09-17 22:00:00', 25, NULL, 4),
(4, '2018-09-17 04:00:00', 50, NULL, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `contopresenza`
--

CREATE TABLE `contopresenza` (
  `IDstoricoCliente` int(6) NOT NULL,
  `IDcliente` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `dipendente`
--

CREATE TABLE `dipendente` (
  `ID` int(6) NOT NULL,
  `Nome` varchar(25) NOT NULL,
  `Cognome` varchar(25) NOT NULL,
  `Stipendio` int(10) NOT NULL,
  `IDmansione` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `dipendente`
--

INSERT INTO `dipendente` (`ID`, `Nome`, `Cognome`, `Stipendio`, `IDmansione`) VALUES
(1, 'Giulio', 'Passalacqua', 1000, 4),
(2, 'Francesco', 'Motta', 1300, 1),
(3, 'Roberta', 'Minuto', 1300, 3),
(4, 'Giada', 'Zuccarello', 2500, 5),
(5, 'Salvatore', 'Branca', 900, 1),
(6, 'Gianluca', 'Coppolino', 1900, 1),
(7, 'Rosangela', 'Perroni', 500, 2),
(8, 'Debora', 'Crimi', 500, 4),
(9, 'Gabriele', 'Iacono', 100, 2),
(10, 'Valeria', 'Zante', 300, 6),
(11, 'Caterina', 'Cappellano', 300, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `erog_stipendio`
--

CREATE TABLE `erog_stipendio` (
  `ID` int(6) NOT NULL,
  `Descrizione` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `erog_stipendio`
--

INSERT INTO `erog_stipendio` (`ID`, `Descrizione`) VALUES
(1, 'Carta di credito'),
(2, 'Contanti'),
(3, 'Buoni Spesa');

-- --------------------------------------------------------

--
-- Struttura della tabella `fidelizzazione`
--

CREATE TABLE `fidelizzazione` (
  `IDcliente` int(6) NOT NULL,
  `DataRilascioCarta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `listino`
--

CREATE TABLE `listino` (
  `ID` int(6) NOT NULL,
  `Descrizione` varchar(25) NOT NULL,
  `Tipo` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `listino`
--

INSERT INTO `listino` (`ID`, `Descrizione`, `Tipo`) VALUES
(1, 'Listino da Asporto', 0),
(2, 'Listino Sala Pesce', 1),
(3, 'Listino Sala Carne', 1),
(4, 'Listino Sala Pizza', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `magazzino`
--

CREATE TABLE `magazzino` (
  `ID` int(6) NOT NULL,
  `NomeMagazzino` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `magazzino`
--

INSERT INTO `magazzino` (`ID`, `NomeMagazzino`) VALUES
(1, 'Magazzino in via Petti'),
(2, 'Magazzino in via Favara'),
(3, 'Magazzino Ariete'),
(4, 'Magazzino centrale');

-- --------------------------------------------------------

--
-- Struttura della tabella `mansione`
--

CREATE TABLE `mansione` (
  `ID` int(6) NOT NULL,
  `Descrizione` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `mansione`
--

INSERT INTO `mansione` (`ID`, `Descrizione`) VALUES
(1, 'Responsabile tavolo'),
(2, 'Responsabile asporto'),
(3, 'Responsabile conto'),
(4, 'Responsabile magazzino'),
(5, 'Responsabile pietanza'),
(6, 'Responsabile pulizie');

-- --------------------------------------------------------

--
-- Struttura della tabella `menu`
--

CREATE TABLE `menu` (
  `ID` int(6) NOT NULL,
  `IDlistino` int(6) NOT NULL,
  `IDpietanza` int(6) NOT NULL,
  `Prezzo` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `menu`
--

INSERT INTO `menu` (`ID`, `IDlistino`, `IDpietanza`, `Prezzo`) VALUES
(2, 4, 3, 4),
(3, 3, 1, 12),
(4, 4, 4, 7),
(5, 4, 12, 7),
(6, 4, 13, 7),
(7, 4, 5, 8),
(8, 4, 6, 10),
(9, 4, 7, 7),
(10, 4, 8, 8),
(11, 4, 9, 5),
(12, 4, 10, 6),
(13, 4, 11, 15);

-- --------------------------------------------------------

--
-- Struttura della tabella `offerta`
--

CREATE TABLE `offerta` (
  `ID` int(6) NOT NULL,
  `DataScadenza` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordin_asporto`
--

CREATE TABLE `ordin_asporto` (
  `IDpren_asporto` int(6) NOT NULL,
  `IDcliente` int(6) NOT NULL,
  `Data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordin_tavolo`
--

CREATE TABLE `ordin_tavolo` (
  `IDtavolo` int(11) NOT NULL,
  `IDcliente` int(11) NOT NULL,
  `Data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `pagamento`
--

CREATE TABLE `pagamento` (
  `ID` int(6) NOT NULL,
  `Descrizione` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `pietanza`
--

CREATE TABLE `pietanza` (
  `ID` int(6) NOT NULL,
  `Descrizione` varchar(50) NOT NULL,
  `TempoProduzione` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `pietanza`
--

INSERT INTO `pietanza` (`ID`, `Descrizione`, `TempoProduzione`) VALUES
(1, 'Pasta al pesto di basilico', 20),
(2, 'Pizza margherita', 15),
(3, 'Torta di Fragole', 60),
(4, 'Pizza alla Norma', 15),
(5, 'Pizza Diavola', 15),
(6, 'Pizza ai frutti di mare', 15),
(7, 'Pizza Tonno e Cipolla', 15),
(8, 'Calzone ripieno', 15),
(9, 'Patatine fritte', 12),
(10, 'Bruschette di pomodoro', 7),
(11, 'Tagliere tipico', 16),
(12, 'Pizza capricciosa', 15),
(13, 'Pizza Messinese', 15);

-- --------------------------------------------------------

--
-- Struttura della tabella `pren_asporto`
--

CREATE TABLE `pren_asporto` (
  `ID` int(6) NOT NULL,
  `Ora` time NOT NULL,
  `Note` varchar(25) NOT NULL,
  `IDlistino` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `pren_pietanza`
--

CREATE TABLE `pren_pietanza` (
  `ID` int(6) NOT NULL,
  `IDpren_tavolo` int(6) DEFAULT NULL,
  `IDpren_asporto` int(6) DEFAULT NULL,
  `IDmenu` int(11) NOT NULL,
  `Quantita` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `pren_pietanza`
--

INSERT INTO `pren_pietanza` (`ID`, `IDpren_tavolo`, `IDpren_asporto`, `IDmenu`, `Quantita`) VALUES
(1, 1, NULL, 13, 1),
(2, 1, NULL, 8, 1),
(3, 1, NULL, 11, 1),
(4, 1, NULL, 4, 1),
(5, 2, NULL, 9, 1),
(6, 2, NULL, 10, 1),
(12, 5, NULL, 4, 1),
(13, 5, NULL, 9, 1),
(14, 5, NULL, 10, 1),
(15, 6, NULL, 11, 1),
(16, 7, NULL, 13, 1),
(17, 7, NULL, 3, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `pren_tavolo`
--

CREATE TABLE `pren_tavolo` (
  `ID` int(6) NOT NULL,
  `Data` date NOT NULL,
  `Ora` time NOT NULL,
  `NumPersone` int(10) NOT NULL,
  `Note` varchar(25) DEFAULT NULL,
  `IDtavolo` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `pren_tavolo`
--

INSERT INTO `pren_tavolo` (`ID`, `Data`, `Ora`, `NumPersone`, `Note`, `IDtavolo`) VALUES
(1, '2018-09-07', '20:30:00', 2, 'Cena romantica', 10),
(2, '2018-09-07', '20:30:00', 5, '1 celiaco', 4),
(3, '2018-09-07', '21:00:00', 3, '', 1),
(4, '2018-09-08', '21:30:00', 4, '', 3),
(5, '2018-10-10', '12:54:00', 3, 'Happy Birthday', 6),
(6, '2018-09-19', '21:30:00', 4, '', 2),
(7, '2018-09-19', '21:00:00', 5, 'test', 8);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `prezzi_associati`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `prezzi_associati` (
`IDpren_pietanza` int(6)
,`IDtavolo` int(6)
,`Prezzo` int(6)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotto`
--

CREATE TABLE `prodotto` (
  `ID` int(6) NOT NULL,
  `NomeProdotto` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `prodotto`
--

INSERT INTO `prodotto` (`ID`, `NomeProdotto`) VALUES
(1, 'Pomodoro'),
(2, 'Mozzarella'),
(3, 'Basilico'),
(4, 'Olio'),
(5, 'Peperoni'),
(6, 'Pinoli'),
(7, 'Salsa'),
(8, 'Parmigiano'),
(9, 'Lievito'),
(10, 'Farina'),
(11, 'Involtini di carne'),
(12, 'Pesce spada'),
(13, 'Prezzemolo'),
(14, 'Gamberi'),
(15, 'Spaghetti'),
(16, 'Panna da cucina'),
(17, 'Pan di Spagna'),
(18, 'Crema'),
(19, 'Fragole'),
(20, 'Vaniglia');

-- --------------------------------------------------------

--
-- Struttura della tabella `promozione`
--

CREATE TABLE `promozione` (
  `ID` int(6) NOT NULL,
  `Descrizione` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `quantita_pietanza`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `quantita_pietanza` (
`ID` int(6)
,`quantita` int(10)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `resp_conto`
--

CREATE TABLE `resp_conto` (
  `IDdipendente` int(6) NOT NULL,
  `IDconto` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `resp_conto`
--

INSERT INTO `resp_conto` (`IDdipendente`, `IDconto`) VALUES
(4, 1),
(6, 2),
(4, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `resp_magazzino`
--

CREATE TABLE `resp_magazzino` (
  `IDdipendente` int(6) NOT NULL,
  `IDmagazzino` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `resp_pietanza`
--

CREATE TABLE `resp_pietanza` (
  `IDdipendente` int(6) NOT NULL,
  `IDpietanza` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `resp_pren_asporto`
--

CREATE TABLE `resp_pren_asporto` (
  `IDdipendente` int(6) NOT NULL,
  `IDpren_asporto` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `resp_pren_tavolo`
--

CREATE TABLE `resp_pren_tavolo` (
  `IDdipendente` int(6) NOT NULL,
  `IDpren_tavolo` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `ricetta`
--

CREATE TABLE `ricetta` (
  `ID` int(6) NOT NULL,
  `IDpietanza` int(11) NOT NULL,
  `IDprodotto` int(6) NOT NULL,
  `IDsize_ricetta` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ricetta`
--

INSERT INTO `ricetta` (`ID`, `IDpietanza`, `IDprodotto`, `IDsize_ricetta`) VALUES
(1, 1, 3, 3),
(2, 1, 4, 2),
(3, 1, 8, 3),
(4, 1, 6, 3),
(5, 1, 15, 2),
(6, 2, 3, 3),
(7, 2, 10, 3),
(8, 2, 9, 3),
(9, 2, 2, 3),
(10, 2, 4, 3),
(11, 2, 1, 2),
(12, 3, 18, 2),
(13, 3, 9, 3),
(14, 3, 17, 2),
(15, 3, 20, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `sala`
--

CREATE TABLE `sala` (
  `ID` int(6) NOT NULL,
  `Descrizione` varchar(25) NOT NULL,
  `IDlistino` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `sala`
--

INSERT INTO `sala` (`ID`, `Descrizione`, `IDlistino`) VALUES
(1, 'Carne', 3),
(2, 'Pesce', 2),
(3, 'Pizza', 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `sconto`
--

CREATE TABLE `sconto` (
  `IDcliente` int(6) NOT NULL,
  `IDofferta` int(6) NOT NULL,
  `Data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `scorte`
--

CREATE TABLE `scorte` (
  `IDprodotto` int(6) NOT NULL,
  `IDmagazzino` int(6) NOT NULL,
  `Quantita` int(10) NOT NULL,
  `IDsize_scorte` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `scorte`
--

INSERT INTO `scorte` (`IDprodotto`, `IDmagazzino`, `Quantita`, `IDsize_scorte`) VALUES
(2, 4, 12, 1),
(3, 4, 3, 1),
(4, 4, 50, 2),
(9, 4, 1, 1),
(10, 4, 50, 1),
(14, 4, 3, 1),
(17, 4, 5, 1),
(18, 4, 20, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `size_ricetta`
--

CREATE TABLE `size_ricetta` (
  `ID` int(6) NOT NULL,
  `Descrizione` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `size_ricetta`
--

INSERT INTO `size_ricetta` (`ID`, `Descrizione`) VALUES
(1, 'Km'),
(2, 'Hg'),
(3, 'g');

-- --------------------------------------------------------

--
-- Struttura della tabella `size_scorte`
--

CREATE TABLE `size_scorte` (
  `ID` int(6) NOT NULL,
  `UnitaMisura` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `size_scorte`
--

INSERT INTO `size_scorte` (`ID`, `UnitaMisura`) VALUES
(1, 'Kg'),
(2, 'L');

-- --------------------------------------------------------

--
-- Struttura della tabella `stipendio`
--

CREATE TABLE `stipendio` (
  `ID` int(6) NOT NULL,
  `IDdipendente` int(6) NOT NULL,
  `Descrizione` varchar(25) NOT NULL,
  `DataErogazione` date NOT NULL,
  `IDerog_stipendio` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `storicocliente`
--

CREATE TABLE `storicocliente` (
  `ID` int(6) NOT NULL,
  `Conteggio` int(10) NOT NULL,
  `Data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `tavolo`
--

CREATE TABLE `tavolo` (
  `ID` int(6) NOT NULL,
  `PostiTotali` int(6) NOT NULL,
  `Disponibilita` int(1) NOT NULL DEFAULT '1',
  `IDsala` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `tavolo`
--

INSERT INTO `tavolo` (`ID`, `PostiTotali`, `Disponibilita`, `IDsala`) VALUES
(1, 4, 0, 1),
(2, 4, 0, 1),
(3, 4, 0, 1),
(4, 6, 0, 1),
(5, 4, 1, 2),
(6, 4, 0, 2),
(7, 4, 1, 2),
(8, 6, 0, 2),
(9, 6, 1, 3),
(10, 4, 0, 3),
(11, 6, 1, 3),
(12, 4, 1, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `tipocontatto`
--

CREATE TABLE `tipocontatto` (
  `IDcontatto` int(6) NOT NULL,
  `IDdipendente` int(6) DEFAULT NULL,
  `IDcliente` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `tipopagamento`
--

CREATE TABLE `tipopagamento` (
  `IDpagamento` int(6) NOT NULL,
  `IDcliente` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `tipopromozione`
--

CREATE TABLE `tipopromozione` (
  `IDofferta` int(6) NOT NULL,
  `IDpromozione` int(6) NOT NULL,
  `DataRilascio` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `tipoutente`
--

CREATE TABLE `tipoutente` (
  `ID` int(6) NOT NULL,
  `Tipo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `tipoutente`
--

INSERT INTO `tipoutente` (`ID`, `Tipo`) VALUES
(1, 'admin'),
(2, 'cameriere'),
(3, 'cassiere'),
(4, 'magazziniere'),
(5, 'fattorino'),
(6, 'cuoco');

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `ID` int(6) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `IDtipoUtente` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`ID`, `username`, `password`, `IDtipoUtente`) VALUES
(1, 'a', 'b', 1),
(2, 'c', 'd', 2),
(6, 'e', 'f', 6),
(7, 'pasquale', 'pasquale', 2);

-- --------------------------------------------------------

--
-- Struttura per vista `prezzi_associati`
--
DROP TABLE IF EXISTS `prezzi_associati`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prezzi_associati`  AS  select `pren_pietanza`.`ID` AS `IDpren_pietanza`,`pren_tavolo`.`IDtavolo` AS `IDtavolo`,`menu`.`Prezzo` AS `Prezzo` from ((`pren_pietanza` join `pren_tavolo`) join `menu`) where ((`pren_tavolo`.`ID` = `pren_pietanza`.`IDpren_tavolo`) and (`menu`.`ID` = `pren_pietanza`.`IDmenu`)) ;

-- --------------------------------------------------------

--
-- Struttura per vista `quantita_pietanza`
--
DROP TABLE IF EXISTS `quantita_pietanza`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `quantita_pietanza`  AS  select `pren_pietanza`.`ID` AS `ID`,`pren_pietanza`.`Quantita` AS `quantita` from `pren_pietanza` order by `pren_pietanza`.`ID` ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `acquisto`
--
ALTER TABLE `acquisto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDmagazzino` (`IDmagazzino`),
  ADD KEY `IDprodotto` (`IDprodotto`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `contatto`
--
ALTER TABLE `contatto`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `conto`
--
ALTER TABLE `conto`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IDpren_asporto` (`IDpren_asporto`) USING BTREE,
  ADD KEY `IDpren_pietanza` (`IDpren_tavolo`) USING BTREE;

--
-- Indici per le tabelle `contopresenza`
--
ALTER TABLE `contopresenza`
  ADD UNIQUE KEY `IDstoricoCliente` (`IDstoricoCliente`,`IDcliente`) USING BTREE,
  ADD KEY `contopresenza_ibfk_2` (`IDcliente`,`IDstoricoCliente`) USING BTREE;

--
-- Indici per le tabelle `dipendente`
--
ALTER TABLE `dipendente`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDmansione` (`IDmansione`);

--
-- Indici per le tabelle `erog_stipendio`
--
ALTER TABLE `erog_stipendio`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `fidelizzazione`
--
ALTER TABLE `fidelizzazione`
  ADD KEY `IDcliente` (`IDcliente`);

--
-- Indici per le tabelle `listino`
--
ALTER TABLE `listino`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `magazzino`
--
ALTER TABLE `magazzino`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `mansione`
--
ALTER TABLE `mansione`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDlistino` (`IDlistino`),
  ADD KEY `IDpietanza` (`IDpietanza`) USING BTREE;

--
-- Indici per le tabelle `offerta`
--
ALTER TABLE `offerta`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `ordin_asporto`
--
ALTER TABLE `ordin_asporto`
  ADD UNIQUE KEY `IDpren_asporto` (`IDpren_asporto`) USING BTREE,
  ADD KEY `IDcliente` (`IDcliente`);

--
-- Indici per le tabelle `ordin_tavolo`
--
ALTER TABLE `ordin_tavolo`
  ADD UNIQUE KEY `IDtavolo` (`IDtavolo`) USING BTREE,
  ADD KEY `IDcliente` (`IDcliente`);

--
-- Indici per le tabelle `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `pietanza`
--
ALTER TABLE `pietanza`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `pren_asporto`
--
ALTER TABLE `pren_asporto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDlistino` (`IDlistino`);

--
-- Indici per le tabelle `pren_pietanza`
--
ALTER TABLE `pren_pietanza`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDmenu` (`IDmenu`),
  ADD KEY `pren_pietanza_ibfk_2` (`IDpren_asporto`),
  ADD KEY `pren_pietanza_ibfk_4` (`IDpren_tavolo`);

--
-- Indici per le tabelle `pren_tavolo`
--
ALTER TABLE `pren_tavolo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDtavolo` (`IDtavolo`);

--
-- Indici per le tabelle `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `promozione`
--
ALTER TABLE `promozione`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `resp_conto`
--
ALTER TABLE `resp_conto`
  ADD KEY `IDconto` (`IDconto`),
  ADD KEY `IDdipendente` (`IDdipendente`);

--
-- Indici per le tabelle `resp_magazzino`
--
ALTER TABLE `resp_magazzino`
  ADD KEY `IDdipendente` (`IDdipendente`),
  ADD KEY `IDmagazzino` (`IDmagazzino`);

--
-- Indici per le tabelle `resp_pietanza`
--
ALTER TABLE `resp_pietanza`
  ADD KEY `IDdipendente` (`IDdipendente`),
  ADD KEY `IDpietanza` (`IDpietanza`);

--
-- Indici per le tabelle `resp_pren_asporto`
--
ALTER TABLE `resp_pren_asporto`
  ADD KEY `IDdipendente` (`IDdipendente`),
  ADD KEY `IDpren_asporto` (`IDpren_asporto`);

--
-- Indici per le tabelle `resp_pren_tavolo`
--
ALTER TABLE `resp_pren_tavolo`
  ADD KEY `IDdipendente` (`IDdipendente`),
  ADD KEY `resp_pren_tavolo_ibfk_2` (`IDpren_tavolo`);

--
-- Indici per le tabelle `ricetta`
--
ALTER TABLE `ricetta`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDsize_ricetta` (`IDsize_ricetta`),
  ADD KEY `IDprodotto` (`IDprodotto`),
  ADD KEY `IDpietanza` (`IDpietanza`);

--
-- Indici per le tabelle `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDlistino` (`IDlistino`);

--
-- Indici per le tabelle `sconto`
--
ALTER TABLE `sconto`
  ADD UNIQUE KEY `IDofferta` (`IDofferta`) USING BTREE,
  ADD UNIQUE KEY `IDcliente` (`IDcliente`) USING BTREE;

--
-- Indici per le tabelle `scorte`
--
ALTER TABLE `scorte`
  ADD PRIMARY KEY (`IDprodotto`,`IDmagazzino`),
  ADD KEY `IDmagazzino` (`IDmagazzino`),
  ADD KEY `IDsize_scorte` (`IDsize_scorte`);

--
-- Indici per le tabelle `size_ricetta`
--
ALTER TABLE `size_ricetta`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `size_scorte`
--
ALTER TABLE `size_scorte`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `stipendio`
--
ALTER TABLE `stipendio`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDerog_stipendio` (`IDerog_stipendio`),
  ADD KEY `IDdipendente` (`IDdipendente`);

--
-- Indici per le tabelle `storicocliente`
--
ALTER TABLE `storicocliente`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `tavolo`
--
ALTER TABLE `tavolo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDsala` (`IDsala`);

--
-- Indici per le tabelle `tipocontatto`
--
ALTER TABLE `tipocontatto`
  ADD UNIQUE KEY `IDcontatto` (`IDcontatto`) USING BTREE,
  ADD KEY `IDdipendente` (`IDdipendente`),
  ADD KEY `IDcliente` (`IDcliente`);

--
-- Indici per le tabelle `tipopagamento`
--
ALTER TABLE `tipopagamento`
  ADD UNIQUE KEY `IDpagamento` (`IDpagamento`,`IDcliente`) USING BTREE,
  ADD KEY `IDcliente` (`IDcliente`);

--
-- Indici per le tabelle `tipopromozione`
--
ALTER TABLE `tipopromozione`
  ADD KEY `IDofferta` (`IDofferta`),
  ADD KEY `IDpromozione` (`IDpromozione`);

--
-- Indici per le tabelle `tipoutente`
--
ALTER TABLE `tipoutente`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDtipoUtente` (`IDtipoUtente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `acquisto`
--
ALTER TABLE `acquisto`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `contatto`
--
ALTER TABLE `contatto`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `conto`
--
ALTER TABLE `conto`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `dipendente`
--
ALTER TABLE `dipendente`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `erog_stipendio`
--
ALTER TABLE `erog_stipendio`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `listino`
--
ALTER TABLE `listino`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `magazzino`
--
ALTER TABLE `magazzino`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `mansione`
--
ALTER TABLE `mansione`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `menu`
--
ALTER TABLE `menu`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `offerta`
--
ALTER TABLE `offerta`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `pietanza`
--
ALTER TABLE `pietanza`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `pren_asporto`
--
ALTER TABLE `pren_asporto`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `pren_pietanza`
--
ALTER TABLE `pren_pietanza`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT per la tabella `pren_tavolo`
--
ALTER TABLE `pren_tavolo`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `promozione`
--
ALTER TABLE `promozione`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ricetta`
--
ALTER TABLE `ricetta`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `sala`
--
ALTER TABLE `sala`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `size_ricetta`
--
ALTER TABLE `size_ricetta`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `size_scorte`
--
ALTER TABLE `size_scorte`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `stipendio`
--
ALTER TABLE `stipendio`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `storicocliente`
--
ALTER TABLE `storicocliente`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tavolo`
--
ALTER TABLE `tavolo`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `tipoutente`
--
ALTER TABLE `tipoutente`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `acquisto`
--
ALTER TABLE `acquisto`
  ADD CONSTRAINT `acquisto_ibfk_1` FOREIGN KEY (`IDmagazzino`) REFERENCES `magazzino` (`ID`),
  ADD CONSTRAINT `acquisto_ibfk_2` FOREIGN KEY (`IDprodotto`) REFERENCES `prodotto` (`ID`);

--
-- Limiti per la tabella `conto`
--
ALTER TABLE `conto`
  ADD CONSTRAINT `conto_ibfk_2` FOREIGN KEY (`IDpren_asporto`) REFERENCES `pren_asporto` (`ID`),
  ADD CONSTRAINT `conto_ibfk_3` FOREIGN KEY (`IDpren_tavolo`) REFERENCES `pren_tavolo` (`ID`);

--
-- Limiti per la tabella `contopresenza`
--
ALTER TABLE `contopresenza`
  ADD CONSTRAINT `contopresenza_ibfk_1` FOREIGN KEY (`IDstoricoCliente`) REFERENCES `storicocliente` (`ID`),
  ADD CONSTRAINT `contopresenza_ibfk_2` FOREIGN KEY (`IDcliente`) REFERENCES `cliente` (`ID`);

--
-- Limiti per la tabella `dipendente`
--
ALTER TABLE `dipendente`
  ADD CONSTRAINT `dipendente_ibfk_1` FOREIGN KEY (`IDmansione`) REFERENCES `mansione` (`ID`);

--
-- Limiti per la tabella `fidelizzazione`
--
ALTER TABLE `fidelizzazione`
  ADD CONSTRAINT `fidelizzazione_ibfk_1` FOREIGN KEY (`IDcliente`) REFERENCES `cliente` (`ID`);

--
-- Limiti per la tabella `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`IDlistino`) REFERENCES `listino` (`ID`),
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`IDpietanza`) REFERENCES `pietanza` (`ID`);

--
-- Limiti per la tabella `ordin_asporto`
--
ALTER TABLE `ordin_asporto`
  ADD CONSTRAINT `ordin_asporto_ibfk_1` FOREIGN KEY (`IDcliente`) REFERENCES `cliente` (`ID`),
  ADD CONSTRAINT `ordin_asporto_ibfk_2` FOREIGN KEY (`IDpren_asporto`) REFERENCES `pren_asporto` (`ID`);

--
-- Limiti per la tabella `ordin_tavolo`
--
ALTER TABLE `ordin_tavolo`
  ADD CONSTRAINT `ordin_tavolo_ibfk_1` FOREIGN KEY (`IDcliente`) REFERENCES `cliente` (`ID`),
  ADD CONSTRAINT `ordin_tavolo_ibfk_2` FOREIGN KEY (`IDtavolo`) REFERENCES `tavolo` (`ID`);

--
-- Limiti per la tabella `pren_asporto`
--
ALTER TABLE `pren_asporto`
  ADD CONSTRAINT `pren_asporto_ibfk_1` FOREIGN KEY (`IDlistino`) REFERENCES `listino` (`ID`);

--
-- Limiti per la tabella `pren_pietanza`
--
ALTER TABLE `pren_pietanza`
  ADD CONSTRAINT `pren_pietanza_ibfk_2` FOREIGN KEY (`IDpren_asporto`) REFERENCES `pren_asporto` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `pren_pietanza_ibfk_3` FOREIGN KEY (`IDmenu`) REFERENCES `menu` (`ID`),
  ADD CONSTRAINT `pren_pietanza_ibfk_4` FOREIGN KEY (`IDpren_tavolo`) REFERENCES `pren_tavolo` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limiti per la tabella `pren_tavolo`
--
ALTER TABLE `pren_tavolo`
  ADD CONSTRAINT `pren_tavolo_ibfk_1` FOREIGN KEY (`IDtavolo`) REFERENCES `tavolo` (`ID`);

--
-- Limiti per la tabella `resp_conto`
--
ALTER TABLE `resp_conto`
  ADD CONSTRAINT `resp_conto_ibfk_1` FOREIGN KEY (`IDconto`) REFERENCES `conto` (`ID`),
  ADD CONSTRAINT `resp_conto_ibfk_2` FOREIGN KEY (`IDdipendente`) REFERENCES `dipendente` (`ID`);

--
-- Limiti per la tabella `resp_magazzino`
--
ALTER TABLE `resp_magazzino`
  ADD CONSTRAINT `resp_magazzino_ibfk_1` FOREIGN KEY (`IDdipendente`) REFERENCES `dipendente` (`ID`),
  ADD CONSTRAINT `resp_magazzino_ibfk_2` FOREIGN KEY (`IDmagazzino`) REFERENCES `magazzino` (`ID`);

--
-- Limiti per la tabella `resp_pietanza`
--
ALTER TABLE `resp_pietanza`
  ADD CONSTRAINT `resp_pietanza_ibfk_1` FOREIGN KEY (`IDdipendente`) REFERENCES `dipendente` (`ID`),
  ADD CONSTRAINT `resp_pietanza_ibfk_2` FOREIGN KEY (`IDpietanza`) REFERENCES `pietanza` (`ID`);

--
-- Limiti per la tabella `resp_pren_asporto`
--
ALTER TABLE `resp_pren_asporto`
  ADD CONSTRAINT `resp_pren_asporto_ibfk_1` FOREIGN KEY (`IDdipendente`) REFERENCES `dipendente` (`ID`),
  ADD CONSTRAINT `resp_pren_asporto_ibfk_2` FOREIGN KEY (`IDpren_asporto`) REFERENCES `pren_asporto` (`ID`);

--
-- Limiti per la tabella `resp_pren_tavolo`
--
ALTER TABLE `resp_pren_tavolo`
  ADD CONSTRAINT `resp_pren_tavolo_ibfk_1` FOREIGN KEY (`IDdipendente`) REFERENCES `dipendente` (`ID`),
  ADD CONSTRAINT `resp_pren_tavolo_ibfk_2` FOREIGN KEY (`IDpren_tavolo`) REFERENCES `pren_tavolo` (`ID`);

--
-- Limiti per la tabella `ricetta`
--
ALTER TABLE `ricetta`
  ADD CONSTRAINT `ricetta_ibfk_3` FOREIGN KEY (`IDsize_ricetta`) REFERENCES `size_ricetta` (`ID`),
  ADD CONSTRAINT `ricetta_ibfk_4` FOREIGN KEY (`IDprodotto`) REFERENCES `prodotto` (`ID`),
  ADD CONSTRAINT `ricetta_ibfk_5` FOREIGN KEY (`IDpietanza`) REFERENCES `pietanza` (`ID`);

--
-- Limiti per la tabella `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`IDlistino`) REFERENCES `listino` (`ID`);

--
-- Limiti per la tabella `sconto`
--
ALTER TABLE `sconto`
  ADD CONSTRAINT `sconto_ibfk_1` FOREIGN KEY (`IDcliente`) REFERENCES `cliente` (`ID`),
  ADD CONSTRAINT `sconto_ibfk_2` FOREIGN KEY (`IDofferta`) REFERENCES `offerta` (`ID`);

--
-- Limiti per la tabella `scorte`
--
ALTER TABLE `scorte`
  ADD CONSTRAINT `scorte_ibfk_1` FOREIGN KEY (`IDprodotto`) REFERENCES `prodotto` (`ID`),
  ADD CONSTRAINT `scorte_ibfk_2` FOREIGN KEY (`IDmagazzino`) REFERENCES `magazzino` (`ID`),
  ADD CONSTRAINT `scorte_ibfk_3` FOREIGN KEY (`IDsize_scorte`) REFERENCES `size_scorte` (`ID`);

--
-- Limiti per la tabella `stipendio`
--
ALTER TABLE `stipendio`
  ADD CONSTRAINT `stipendio_ibfk_1` FOREIGN KEY (`IDerog_stipendio`) REFERENCES `erog_stipendio` (`ID`),
  ADD CONSTRAINT `stipendio_ibfk_2` FOREIGN KEY (`IDdipendente`) REFERENCES `dipendente` (`ID`);

--
-- Limiti per la tabella `tavolo`
--
ALTER TABLE `tavolo`
  ADD CONSTRAINT `tavolo_ibfk_1` FOREIGN KEY (`IDsala`) REFERENCES `sala` (`ID`);

--
-- Limiti per la tabella `tipocontatto`
--
ALTER TABLE `tipocontatto`
  ADD CONSTRAINT `tipocontatto_ibfk_2` FOREIGN KEY (`IDcontatto`) REFERENCES `contatto` (`ID`),
  ADD CONSTRAINT `tipocontatto_ibfk_3` FOREIGN KEY (`IDdipendente`) REFERENCES `dipendente` (`ID`),
  ADD CONSTRAINT `tipocontatto_ibfk_4` FOREIGN KEY (`IDcliente`) REFERENCES `cliente` (`ID`);

--
-- Limiti per la tabella `tipopagamento`
--
ALTER TABLE `tipopagamento`
  ADD CONSTRAINT `tipopagamento_ibfk_1` FOREIGN KEY (`IDcliente`) REFERENCES `cliente` (`ID`),
  ADD CONSTRAINT `tipopagamento_ibfk_2` FOREIGN KEY (`IDpagamento`) REFERENCES `pagamento` (`ID`);

--
-- Limiti per la tabella `tipopromozione`
--
ALTER TABLE `tipopromozione`
  ADD CONSTRAINT `tipopromozione_ibfk_1` FOREIGN KEY (`IDofferta`) REFERENCES `offerta` (`ID`),
  ADD CONSTRAINT `tipopromozione_ibfk_2` FOREIGN KEY (`IDpromozione`) REFERENCES `promozione` (`ID`);

--
-- Limiti per la tabella `utente`
--
ALTER TABLE `utente`
  ADD CONSTRAINT `utente_ibfk_1` FOREIGN KEY (`IDtipoUtente`) REFERENCES `tipoutente` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

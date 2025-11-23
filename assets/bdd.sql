-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2025 at 05:53 AM
-- Server version: 10.5.25-MariaDB-cll-lve
-- PHP Version: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bestofal_omek317`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `credential_hash` varchar(60) NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('8oh28HmT421E62K4MlHZJluwYVsYkDmM', 1, 'testomeka', '$2y$10$e7cwQqxNlkYkE.RSQRhDxOiOqb8YWAj4YbKUmQT.dhUII9HxtH1zC', 0x50d639e9, '2025-11-21 14:13:01', '2025-11-01 11:09:28'),
('oXn57bi9OJYYMG6mswABTiTT9D0WPCNF', 1, 'test_api', '$2y$10$yPtuSp6TWZPDRNe7rLmHi.Frnz2YiJe7PvoFGCHQgso/xrGz92dm2', NULL, NULL, '2025-10-21 08:57:32'),
('yKNxh5ZLos1itBreg0X81mrJrMjxSN1o', 1, 'newtest', '$2y$10$xsT2dvrELRR4XgAOzkNzBeSqvmXpTmps0s6M1Cu1VdbD2mXoQIFsG', NULL, NULL, '2025-10-22 12:55:44'),
('yOiatpM70hFH4GyJy2NGd1s0kBvOjDKl', 1, 'omk', '$2y$10$D8h6mTPfAyo3jUvls/pUX.mkTDE9WvHgySTTkgkkc3K3DeZ3mOwzK', NULL, NULL, '2025-10-21 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `media_type` varchar(255) NOT NULL,
  `storage_id` varchar(190) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `csvimport_entity`
--

CREATE TABLE `csvimport_entity` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `csvimport_entity`
--

INSERT INTO `csvimport_entity` (`id`, `job_id`, `entity_id`, `resource_type`) VALUES
(4, 3, 4, 'items'),
(5, 3, 5, 'items'),
(6, 3, 6, 'items');

-- --------------------------------------------------------

--
-- Table structure for table `csvimport_import`
--

CREATE TABLE `csvimport_import` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `undo_job_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL,
  `has_err` tinyint(1) NOT NULL,
  `stats` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `csvimport_import`
--

INSERT INTO `csvimport_import` (`id`, `job_id`, `undo_job_id`, `comment`, `resource_type`, `has_err`, `stats`) VALUES
(1, 1, 2, '', 'items', 0, '{\"added\":{\"items\":3}}'),
(2, 3, NULL, '', 'items', 0, '{\"added\":{\"items\":3}}');

-- --------------------------------------------------------

--
-- Table structure for table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext DEFAULT NULL,
  `text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(4, 'items', 1, 1, NULL, 'Clé USB noire\nClé 16Go avec logo ESILV\n2025-03-14\nSalle L113\nKarim Bouchaane'),
(5, 'items', 1, 1, NULL, 'Carte étudiante\nCarte au nom de Sarah L.\n2025-03-16\nBibliothèque\nMohamed S.'),
(6, 'items', 1, 1, NULL, 'Parapluie bleu\nPerdu près de la cafétéria\n2025-03-20\nCafétéria\nRamzi N.'),
(7, 'items', 1, 1, 'Karim Bouchaane', 'Karim Bouchaane\nMoi\n12345\n21/10/2025\nKarim\nBouchaane'),
(8, 'items', 1, 1, NULL, ''),
(9, 'items', 1, 1, NULL, ''),
(10, 'items', 1, 1, NULL, ''),
(11, 'items', 1, 1, 'test', 'test'),
(12, 'media', 1, 1, NULL, ''),
(13, 'items', 1, 1, 'test', 'test'),
(14, 'media', 1, 1, NULL, ''),
(15, 'items', 1, 1, 'Enregistrement audio', 'Enregistrement audio\nMessage audio enregistré via DevinciLostFound | Latitude:  | Longitude: '),
(16, 'items', 1, 1, 'Nous testons', 'Nous testons\nMessage audio enregistré via DevinciLostFound | Latitude: Tu testes | Longitude: Je test'),
(17, 'items', 1, 1, 'sdf', 'sdf\nMessage audio enregistré via DevinciLostFound | Latitude: zds | Longitude: zer'),
(18, 'items', 1, 1, 'Smile again and again', 'Smile again and again\nMessage audio enregistré via DevinciLostFound | Latitude: smile again | Longitude: Smile'),
(19, 'items', 1, 1, 'teert', 'teert\nMessage audio enregistré via DevinciLostFound | Latitude: tert | Longitude: Tert'),
(20, 'items', 1, 1, 'vbn', 'vbn\nMessage audio enregistré via DevinciLostFound | Latitude: vbg | Longitude: vfg'),
(21, 'items', 1, 1, 'cde', 'cde\nMessage audio enregistré via DevinciLostFound | Latitude: cde | Longitude: cde'),
(22, 'items', 1, 1, 'trt', 'trt\nMessage audio enregistré via DevinciLostFound | Latitude: trt | Longitude: trt'),
(23, 'items', 1, 1, 'dxdx', 'dxdx\nMessage audio enregistré via DevinciLostFound | Latitude: dxdx | Longitude: dxdx'),
(24, 'items', 1, 1, 'yhyh', 'yhyh\nMessage audio enregistré via DevinciLostFound | Latitude: yhyh | Longitude: yhyh'),
(25, 'items', 1, 1, 'eedd', 'eedd\nMessage audio enregistré via DevinciLostFound | Latitude: sdfs | Longitude: vbbg'),
(26, 'items', 1, 1, 'xcxc', 'xcxc\nMessage audio enregistré via DevinciLostFound | Latitude: xcxc | Longitude: xcxc'),
(27, 'items', 1, 1, 'qqq', 'qqq\nMessage audio enregistré via DevinciLostFound | Latitude: xxwx | Longitude: cxwx'),
(28, 'items', 1, 1, 'qqq', 'qqq\nMessage audio enregistré via DevinciLostFound | Latitude: xxwx | Longitude: cxwx'),
(29, 'items', 1, 1, 'cdc', 'cdc\nMessage audio enregistré via DevinciLostFound | Latitude: cdc | Longitude: cdc'),
(30, 'items', 1, 1, 'dsd', 'dsd\nMessage audio enregistré via DevinciLostFound | Latitude: sds | Longitude: ds'),
(31, 'items', 1, 1, NULL, ''),
(32, 'items', 1, 1, 'sdfe', 'sdfe\nMessage audio enregistré via DevinciLostFound | Latitude: zer | Longitude: ze'),
(33, 'items', 1, 1, 'sdfe', 'sdfe\nMessage audio enregistré via DevinciLostFound | Latitude: zer | Longitude: ze'),
(34, 'items', 1, 1, 'sdfe', 'sdfe\nMessage audio enregistré via DevinciLostFound | Latitude: zer | Longitude: ze'),
(35, 'items', 1, 1, 'sdfe', 'sdfe\nMessage audio enregistré via DevinciLostFound | Latitude: zer | Longitude: ze'),
(36, 'items', 1, 1, 'sdfe', 'sdfe\nMessage audio enregistré via DevinciLostFound | Latitude: 3322 | Longitude: 112'),
(37, 'items', 1, 1, 'sdfe', 'sdfe\nMessage audio enregistré via DevinciLostFound | Latitude: 3322 | Longitude: 112'),
(38, 'items', 1, 1, 'wqwq', 'wqwq\nMessage audio enregistré via DevinciLostFound | Latitude: 3322 | Longitude: 112'),
(39, 'items', 1, 1, 'Enregistrement audio', 'Enregistrement audio\nMessage audio enregistré via DevinciLostFound | Latitude:  | Longitude: '),
(40, 'items', 1, 1, 'sdf', 'sdf\nMessage audio enregistré via DevinciLostFound | Latitude: sdf | Longitude: sdf'),
(41, 'items', 1, 1, 'Enregistrement audio', 'Enregistrement audio\nMessage audio enregistré via DevinciLostFound | Latitude:  | Longitude: '),
(42, 'items', 1, 1, 'Enregistrement audio', 'Enregistrement audio\nMessage audio | Latitude:  | Longitude: '),
(43, 'items', 1, 1, 'Enregistrement audio', 'Enregistrement audio\nMessage audio | Latitude:  | Longitude: '),
(44, 'items', 1, 1, 'Joly', 'Joly\nMessage audio | Latitude: 48.829365 | Longitude: 2.426541'),
(45, 'items', 1, 1, 'sdf', 'sdf\nMessage audio | Latitude: 112 | Longitude: 232'),
(46, 'items', 1, 1, 'ERE', 'ERE\nMessage audio | Latitude: 223 | Longitude: 121'),
(47, 'items', 1, 1, 'gsg', 'gsg\nMessage audio | Latitude: 48.829365 | Longitude: 2.426541'),
(48, 'items', 1, 1, 'sfs', 'sfs\nMessage audio | Latitude: 48.829365 | Longitude: 2.426541'),
(49, 'items', 1, 1, 'Devinci', 'Devinci\nMessage audio | Latitude: 48.829365 | Longitude: 2.426541'),
(50, 'items', 1, 1, 'You', 'You\nMessage audio | Latitude: 48.829365 | Longitude: 2.426541'),
(51, 'items', 1, 1, 'Paris8', 'Paris8\nMessage audio | Latitude: 48.944656 | Longitude: 2.363221'),
(52, 'items', 1, 1, 'sjs', 'sjs\nMessage audio | Latitude: 48.944656 | Longitude: 2.363221'),
(53, 'items', 1, 1, 'Hello', 'Hello\nMessage audio | Latitude: 23 | Longitude: 32'),
(54, 'items', 1, 1, 'Paris8', 'Paris8\nMessage audio | Latitude: 48.944656 | Longitude: 2.363221'),
(55, 'items', 1, 1, 'Joly', 'Joly\nMessage audio | Latitude: 11 | Longitude: 23'),
(56, 'items', 1, 1, 'Salut', 'Salut\nMessage audio | Latitude: 48.944656 | Longitude: 2.363221'),
(57, 'items', 1, 1, 'test', 'test\nMessage audio | Latitude: 48.944656 | Longitude: 2.363221'),
(58, 'items', 1, 1, 'Wallet', 'Wallet\nObjet trouvé — Description générée à l\'envoi.\nTéléphone du trouveur : 067567456\nLocalisation : lat=48.829365, lng=2.426541'),
(59, 'items', 1, 1, 'Monter', 'Monter\nObjet trouvé — Description générée à l\'envoi.\nTéléphone du trouveur : 067887788\nLocalisation : lat=48.829365, lng=2.426541'),
(60, 'items', 1, 1, 'Helop', 'Helop\nObjet trouvé — Description générée à l\'envoi.\nTéléphone du trouveur : 06756786567\nLocalisation : lat=48.829365, lng=2.426541'),
(61, 'items', 1, 1, 'Smartphone', 'Smartphone\nObjet trouvé.\nTéléphone du trouveur : 068756789\nLocalisation : lat=48.829365, lng=2.426541'),
(62, 'items', 1, 1, 'Rolo', 'Rolo\nObjet trouvé.\nTéléphone du trouveur : 067856787\nLocalisation : lat=48.829365, lng=2.426541'),
(63, 'items', 1, 1, 'ezze', 'ezze\nObjet trouvé.\nTéléphone du trouveur : 087645678\nLocalisation : lat=48.829365, lng=2.426541');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL),
(11, NULL),
(13, NULL),
(15, NULL),
(16, NULL),
(17, NULL),
(18, NULL),
(19, NULL),
(20, NULL),
(21, NULL),
(22, NULL),
(23, NULL),
(24, NULL),
(25, NULL),
(26, NULL),
(27, NULL),
(28, NULL),
(29, NULL),
(30, NULL),
(31, NULL),
(32, NULL),
(33, NULL),
(34, NULL),
(35, NULL),
(36, NULL),
(37, NULL),
(38, NULL),
(39, NULL),
(40, NULL),
(41, NULL),
(42, NULL),
(43, NULL),
(44, NULL),
(45, NULL),
(46, NULL),
(47, NULL),
(48, NULL),
(49, NULL),
(50, NULL),
(51, NULL),
(52, NULL),
(53, NULL),
(54, NULL),
(55, NULL),
(56, NULL),
(57, NULL),
(58, NULL),
(59, NULL),
(60, NULL),
(61, NULL),
(62, NULL),
(63, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `args` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, '18789', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"objets.csv\",\"filesize\":\"349\",\"filepath\":\"\\/tmp\\/omekahOzF60\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column-property\":{\"1\":{\"dlf:nomObjet\":185},\"2\":{\"dlf:description\":186},\"3\":{\"dlf:datePerte\":187},\"4\":{\"dlf:lieuPerte\":188},\"5\":{\"dlf:trouvePar\":189}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-19 11:57:31', '2025-10-19 11:57:31'),
(2, 1, '30837', 'completed', 'CSVImport\\Job\\Undo', '{\"jobId\":\"1\"}', NULL, '2025-10-19 12:03:04', '2025-10-19 12:03:04'),
(3, 1, '30561', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"objets.csv\",\"filesize\":\"349\",\"filepath\":\"\\/tmp\\/omekaihyXtP\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column-property\":{\"1\":{\"dlf:nomObjet\":185},\"2\":{\"dlf:description\":186},\"3\":{\"dlf:datePerte\":187},\"4\":{\"dlf:lieuPerte\":188},\"5\":{\"dlf:trouvePar\":189}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":2},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-19 12:17:14', '2025-10-19 12:17:14');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) NOT NULL,
  `renderer` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `storage_id` varchar(190) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `sha256` char(64) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `item_id`, `ingester`, `renderer`, `data`, `source`, `media_type`, `storage_id`, `extension`, `sha256`, `size`, `has_original`, `has_thumbnails`, `position`, `lang`, `alt_text`) VALUES
(12, 11, 'upload', 'file', NULL, 'blob', 'video/webm', '186b2fc9a0af4dd96fc5eeb8cd422b93aaddb8da', 'webm', 'd9baad930d930709ef794e4831537c40b98f360dcba8d8dde6d71117679eee18', 95930, 1, 0, 1, NULL, NULL),
(14, 13, 'upload', 'file', NULL, 'blob', 'video/webm', 'febbdb27f93f2c33f0311d3d5090230e8f7bec86', 'webm', '6471fa9ab68cba27182dc6e87c30c13d92a98467356dfbaa4e871d72202666bc', 68882, 1, 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230124033031'),
('20230410074846'),
('20230523085358'),
('20230601060113'),
('20230713101012'),
('20231016000000'),
('20240103030617');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CSVImport', 1, '2.6.2'),
('DevinciLostFoundModule', 1, '1.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('Kw2cN3qSSao87DA1qI3qaq1aLhbltZOD', 2, '2025-10-21 07:20:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(185, 1, 5, 'nomObjet', 'Nom de l’objet', 'Nom ou titre de l’objet perdu.'),
(186, 1, 5, 'description', 'Description', 'Description de l’objet ou de son apparence.'),
(187, 1, 5, 'datePerte', 'Date de perte', 'Date à laquelle l’objet a été perdu.'),
(188, 1, 5, 'lieuPerte', 'Lieu de perte', 'Lieu où l’objet a été perdu.'),
(189, 1, 5, 'trouvePar', 'Trouvé par', 'Personne ayant trouvé l’objet.'),
(190, 1, 5, 'contact', 'Contact', 'Coordonnées pour contacter la personne.');

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(4, 1, 106, 2, NULL, 'Clé USB noire', 1, '2025-10-19 12:17:14', '2025-10-19 12:17:14', 'Omeka\\Entity\\Item'),
(5, 1, 106, 2, NULL, 'Carte étudiante', 1, '2025-10-19 12:17:14', '2025-10-19 12:17:14', 'Omeka\\Entity\\Item'),
(6, 1, 106, 2, NULL, 'Parapluie bleu', 1, '2025-10-19 12:17:14', '2025-10-19 12:17:14', 'Omeka\\Entity\\Item'),
(7, 1, 94, 5, NULL, 'Karim Bouchaane', 1, '2025-10-21 10:53:56', '2025-10-21 10:53:56', 'Omeka\\Entity\\Item'),
(8, 1, NULL, NULL, NULL, NULL, 1, '2025-11-04 10:26:42', '2025-11-04 10:26:42', 'Omeka\\Entity\\Item'),
(9, 1, NULL, NULL, NULL, NULL, 1, '2025-11-04 15:18:58', '2025-11-04 15:18:58', 'Omeka\\Entity\\Item'),
(10, 1, NULL, NULL, NULL, NULL, 1, '2025-11-04 15:20:23', '2025-11-04 15:20:23', 'Omeka\\Entity\\Item'),
(11, 1, NULL, NULL, NULL, 'test', 1, '2025-11-11 18:46:34', '2025-11-11 18:46:34', 'Omeka\\Entity\\Item'),
(12, 1, NULL, NULL, NULL, NULL, 1, '2025-11-11 18:46:34', '2025-11-11 18:46:34', 'Omeka\\Entity\\Media'),
(13, 1, NULL, NULL, NULL, 'test', 1, '2025-11-11 19:47:43', '2025-11-11 19:47:43', 'Omeka\\Entity\\Item'),
(14, 1, NULL, NULL, NULL, NULL, 1, '2025-11-11 19:47:43', '2025-11-11 19:47:43', 'Omeka\\Entity\\Media'),
(15, 1, NULL, 4, NULL, 'Enregistrement audio', 1, '2025-11-14 14:15:51', '2025-11-14 14:15:51', 'Omeka\\Entity\\Item'),
(16, 1, NULL, 4, NULL, 'Nous testons', 1, '2025-11-14 14:23:27', '2025-11-14 14:23:27', 'Omeka\\Entity\\Item'),
(17, 1, NULL, 4, NULL, 'sdf', 1, '2025-11-14 14:26:33', '2025-11-14 14:26:33', 'Omeka\\Entity\\Item'),
(18, 1, NULL, 4, NULL, 'Smile again and again', 1, '2025-11-14 14:28:36', '2025-11-14 14:28:36', 'Omeka\\Entity\\Item'),
(19, 1, NULL, 4, NULL, 'teert', 1, '2025-11-15 01:02:35', '2025-11-15 01:02:35', 'Omeka\\Entity\\Item'),
(20, 1, NULL, 4, NULL, 'vbn', 1, '2025-11-15 01:07:24', '2025-11-15 01:07:24', 'Omeka\\Entity\\Item'),
(21, 1, NULL, 4, NULL, 'cde', 1, '2025-11-15 01:10:40', '2025-11-15 01:10:40', 'Omeka\\Entity\\Item'),
(22, 1, NULL, 4, NULL, 'trt', 1, '2025-11-15 01:12:43', '2025-11-15 01:12:43', 'Omeka\\Entity\\Item'),
(23, 1, NULL, 4, NULL, 'dxdx', 1, '2025-11-15 01:14:38', '2025-11-15 01:14:38', 'Omeka\\Entity\\Item'),
(24, 1, NULL, 4, NULL, 'yhyh', 1, '2025-11-15 01:18:46', '2025-11-15 01:18:46', 'Omeka\\Entity\\Item'),
(25, 1, NULL, 4, NULL, 'eedd', 1, '2025-11-15 01:29:26', '2025-11-15 01:29:26', 'Omeka\\Entity\\Item'),
(26, 1, NULL, 4, NULL, 'xcxc', 1, '2025-11-15 01:30:39', '2025-11-15 01:30:39', 'Omeka\\Entity\\Item'),
(27, 1, NULL, 4, NULL, 'qqq', 1, '2025-11-15 01:33:23', '2025-11-15 01:33:23', 'Omeka\\Entity\\Item'),
(28, 1, NULL, 4, NULL, 'qqq', 1, '2025-11-15 01:34:58', '2025-11-15 01:34:58', 'Omeka\\Entity\\Item'),
(29, 1, NULL, NULL, NULL, 'cdc', 1, '2025-11-15 01:35:57', '2025-11-15 01:35:57', 'Omeka\\Entity\\Item'),
(30, 1, NULL, 4, NULL, 'dsd', 1, '2025-11-15 01:39:19', '2025-11-15 01:39:19', 'Omeka\\Entity\\Item'),
(31, 1, NULL, NULL, NULL, NULL, 1, '2025-11-15 09:26:03', '2025-11-15 09:26:03', 'Omeka\\Entity\\Item'),
(32, 1, NULL, 4, NULL, 'sdfe', 1, '2025-11-15 09:37:44', '2025-11-15 09:37:44', 'Omeka\\Entity\\Item'),
(33, 1, NULL, 4, NULL, 'sdfe', 1, '2025-11-15 09:40:28', '2025-11-15 09:40:28', 'Omeka\\Entity\\Item'),
(34, 1, NULL, 4, NULL, 'sdfe', 1, '2025-11-15 09:40:39', '2025-11-15 09:40:39', 'Omeka\\Entity\\Item'),
(35, 1, NULL, 4, NULL, 'sdfe', 1, '2025-11-15 09:42:22', '2025-11-15 09:42:22', 'Omeka\\Entity\\Item'),
(36, 1, NULL, 4, NULL, 'sdfe', 1, '2025-11-15 09:42:41', '2025-11-15 09:42:41', 'Omeka\\Entity\\Item'),
(37, 1, NULL, 4, NULL, 'sdfe', 1, '2025-11-15 09:42:46', '2025-11-15 09:42:46', 'Omeka\\Entity\\Item'),
(38, 1, NULL, 4, NULL, 'wqwq', 1, '2025-11-15 09:49:12', '2025-11-15 09:49:12', 'Omeka\\Entity\\Item'),
(39, 1, NULL, NULL, NULL, 'Enregistrement audio', 1, '2025-11-17 18:46:59', '2025-11-17 18:46:59', 'Omeka\\Entity\\Item'),
(40, 1, NULL, NULL, NULL, 'sdf', 1, '2025-11-17 18:47:08', '2025-11-17 18:47:08', 'Omeka\\Entity\\Item'),
(41, 1, NULL, NULL, NULL, 'Enregistrement audio', 1, '2025-11-17 19:32:10', '2025-11-17 19:32:10', 'Omeka\\Entity\\Item'),
(42, 1, NULL, NULL, NULL, 'Enregistrement audio', 1, '2025-11-17 20:33:14', '2025-11-17 20:33:14', 'Omeka\\Entity\\Item'),
(43, 1, NULL, NULL, NULL, 'Enregistrement audio', 1, '2025-11-17 20:33:17', '2025-11-17 20:33:17', 'Omeka\\Entity\\Item'),
(44, 1, NULL, NULL, NULL, 'Joly', 1, '2025-11-17 20:36:18', '2025-11-17 20:36:18', 'Omeka\\Entity\\Item'),
(45, 1, NULL, NULL, NULL, 'sdf', 1, '2025-11-17 23:23:55', '2025-11-17 23:23:55', 'Omeka\\Entity\\Item'),
(46, 1, NULL, NULL, NULL, 'ERE', 1, '2025-11-17 23:29:24', '2025-11-17 23:29:24', 'Omeka\\Entity\\Item'),
(47, 1, NULL, NULL, NULL, 'gsg', 1, '2025-11-17 23:33:54', '2025-11-17 23:33:54', 'Omeka\\Entity\\Item'),
(48, 1, NULL, NULL, NULL, 'sfs', 1, '2025-11-17 23:50:41', '2025-11-17 23:50:41', 'Omeka\\Entity\\Item'),
(49, 1, NULL, NULL, NULL, 'Devinci', 1, '2025-11-17 23:56:15', '2025-11-17 23:56:15', 'Omeka\\Entity\\Item'),
(50, 1, NULL, NULL, NULL, 'You', 1, '2025-11-17 23:58:04', '2025-11-17 23:58:04', 'Omeka\\Entity\\Item'),
(51, 1, NULL, NULL, NULL, 'Paris8', 1, '2025-11-18 08:16:13', '2025-11-18 08:16:13', 'Omeka\\Entity\\Item'),
(52, 1, NULL, NULL, NULL, 'sjs', 1, '2025-11-18 09:28:45', '2025-11-18 09:28:45', 'Omeka\\Entity\\Item'),
(53, 1, NULL, NULL, NULL, 'Hello', 1, '2025-11-18 09:29:54', '2025-11-18 09:29:54', 'Omeka\\Entity\\Item'),
(54, 1, NULL, NULL, NULL, 'Paris8', 1, '2025-11-18 09:30:45', '2025-11-18 09:30:45', 'Omeka\\Entity\\Item'),
(55, 1, NULL, NULL, NULL, 'Joly', 1, '2025-11-18 09:33:23', '2025-11-18 09:33:23', 'Omeka\\Entity\\Item'),
(56, 1, NULL, NULL, NULL, 'Salut', 1, '2025-11-18 09:47:14', '2025-11-18 09:47:14', 'Omeka\\Entity\\Item'),
(57, 1, NULL, NULL, NULL, 'test', 1, '2025-11-18 10:51:25', '2025-11-18 10:51:25', 'Omeka\\Entity\\Item'),
(58, 1, NULL, NULL, NULL, 'Wallet', 1, '2025-11-21 12:26:40', '2025-11-21 12:26:40', 'Omeka\\Entity\\Item'),
(59, 1, NULL, NULL, NULL, 'Monter', 1, '2025-11-21 12:37:35', '2025-11-21 12:37:35', 'Omeka\\Entity\\Item'),
(60, 1, NULL, NULL, NULL, 'Helop', 1, '2025-11-21 13:50:46', '2025-11-21 13:50:46', 'Omeka\\Entity\\Item'),
(61, 1, NULL, NULL, NULL, 'Smartphone', 1, '2025-11-21 13:56:53', '2025-11-21 13:56:53', 'Omeka\\Entity\\Item'),
(62, 1, NULL, NULL, NULL, 'Rolo', 1, '2025-11-21 14:07:50', '2025-11-21 14:07:50', 'Omeka\\Entity\\Item'),
(63, 1, NULL, NULL, NULL, 'ezze', 1, '2025-11-21 14:13:00', '2025-11-21 14:13:00', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Table structure for table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(106, 1, 5, 'ObjetPerdu', 'Objet perdu', 'Un objet signalé comme perdu ou retrouvé.'),
(107, 1, 5, 'Personne', 'Personne', 'Une personne qui a perdu ou trouvé un objet.'),
(108, 1, 5, 'Lieu', 'Lieu', 'Un lieu de l’école où des objets peuvent être perdus ou retrouvés.');

-- --------------------------------------------------------

--
-- Table structure for table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(2, 1, 106, 185, NULL, 'Objet Perdu'),
(3, 1, 107, NULL, NULL, 'Personne'),
(4, 1, 108, NULL, NULL, 'Lieu'),
(5, 1, 94, NULL, NULL, 'Étudiant');

-- --------------------------------------------------------

--
-- Table structure for table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) DEFAULT NULL,
  `alternate_comment` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(21, 2, 185, NULL, NULL, 1, NULL, 0, 0, NULL),
(22, 2, 186, NULL, NULL, 2, NULL, 0, 0, NULL),
(23, 2, 187, NULL, NULL, 3, NULL, 0, 0, NULL),
(24, 2, 188, NULL, NULL, 4, NULL, 0, 0, NULL),
(25, 2, 189, NULL, NULL, 5, NULL, 0, 0, NULL),
(26, 3, 190, NULL, NULL, 1, NULL, 0, 0, NULL),
(27, 4, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(28, 4, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(29, 5, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(30, 5, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(31, 5, 10, NULL, NULL, 3, NULL, 0, 0, NULL),
(32, 5, 7, NULL, NULL, 4, NULL, 0, 0, NULL),
(33, 5, 141, NULL, NULL, 5, NULL, 0, 0, NULL),
(34, 5, 145, NULL, NULL, 6, NULL, 0, 0, NULL),
(35, 2, 154, NULL, NULL, 6, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('01317dd0b7ed3ea8ad4e447b736fa13f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333239343030332e313530313239303739383138373235353835393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223031333137646430623765643365613861643465343437623733366661313366223b7d7d, 1763294003),
('04d4606cb93eff7226c0620f2f32adac', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373433302e313036353738313131363438353539353730333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223034643436303663623933656666373232366330363230663266333261646163223b7d7d, 1763237430),
('06b536ebd8f2ab77f7764a26b1f5f415', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333137303331382e333337353239383937363839383139333335393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223036623533366562643866326162373766373736346132366231663566343135223b7d7d, 1763170318),
('0af2f81ba5ecb052f3289d7592734646', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235303034322e363431373032383930333936313138313634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223061663266383162613565636230353266333238396437353932373334363436223b7d7d, 1762250043),
('0dbbdba02d496c3f99a4ea29a6b71062', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233383836352e323939393938393938363431393637373733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223064626264626130326434393663336639396134656132396136623731303632223b7d7d, 1763238865),
('0ecf27181f64a44598cf98250d24cafe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323030333137332e393437353239303737353239393037323236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223065636632373138316636346134343539386366393832353064323463616665223b7d7d, 1762003173),
('0f021c1d9780120b806c16c5b5f1a306', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323735333337322e3230303437393033303630393133303835393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223066303231633164393738303132306238303663313663356235663161333036223b7d7d, 1762753372),
('0fa0e0714c7852b4b97b3098bf95d86a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333436323938322e33373836303130373432313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223066613065303731346337383532623462393762333039386266393564383661223b7d7d, 1763462982),
('10d00a835c1ff21eee3ae65b3ffe3423', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333536302e313139303635303436333130343234383034363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223130643030613833356331666632316565653361653635623366666533343233223b7d7d, 1763303560),
('11a5142904ce42d39843b614e78b8428', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323432393538372e343038393730313137353638393639373236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223131613531343239303463653432643339383433623631346537386238343238223b7d7d, 1762429587),
('1261226f0da9aee31e81fed0b3146477', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373434332e313838363538393532373133303132363935333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223132363132323666306461396165653331653831666564306233313436343737223b7d7d, 1763237443),
('1444833e35dec28088d4fee3ca705355', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323838303035362e393430343233393635343534313031353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223134343438333365333564656332383038386434666565336361373035333535223b7d7d, 1762880057),
('192c8b5dab905f475c5b675753af7a36', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323032353939302e32323138383039313237383037363137313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223139326338623564616239303566343735633562363735373533616637613336223b7d7d, 1762025990),
('1c3ddb6291758dd99797bda7fc5b07db', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373438362e373237353430393639383438363332383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223163336464623632393137353864643939373937626461376663356230376462223b7d7d, 1763237486),
('1ca26c29bdd0a6d9ebe7a59bedcb4404', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333634323635372e36393736333038383232363331383335393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223163613236633239626464306136643965626537613539626564636234343034223b7d7d, 1763642657),
('1f7f902480dfc19a13d9a2ed30668f2e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323032353938302e3538353434353838303838393839323537383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223166376639303234383064666331396131336439613265643330363638663265223b7d7d, 1762025980),
('21581afceffe2603efc79ab91aebdaff', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323431343937372e3633303135383930313231343539393630393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223231353831616663656666653236303365666337396162393161656264616666223b7d7d, 1762414977),
('23df71b796f9091a7e1340202dfcc742', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333535382e3933363538323038383437303435383938343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223233646637316237393666393039316137653133343032303264666363373432223b7d7d, 1763303559),
('24eb0e7fe6c6fc88f864646daf58766e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432303730302e3031393039323038323937373239343932313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223234656230653766653663366663383866383634363436646166353837363665223b7d7d, 1763420700),
('2684d2d3e45448a0154809fe75a06c12', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234373130332e3139333637353939343837333034363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223236383464326433653435343438613031353438303966653735613036633132223b7d7d, 1762247103),
('279467da5b02af345fb64d61d7a5fe0f', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333733333132352e333833383637303235333735333636323130393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223237393436376461356230326166333435666236346436316437613566653066223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333737363332353b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223437346664343066343131343232356335663237663230623934353735646136223b733a33323a223235373734353763396163326130353364643661323638653665643236376463223b7d733a343a2268617368223b733a36353a2232353737343537633961633261303533646436613236386536656432363764632d3437346664343066343131343232356335663237663230623934353735646136223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763733125),
('295354071a1ed334cf3d6d6955fe0275', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234373733372e31353031353530363734343338343736353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223233633339613362303338396265333365393363636137646330613461343730223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239303931343b7d7d72656469726563745f75726c7c733a33343a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223530626465656238633339623830623635356461373437643236653466643930223b733a33323a226430633536323061353332306336386333643338373566393264393734656365223b7d733a343a2268617368223b733a36353a2264306335363230613533323063363863336433383735663932643937346563652d3530626465656238633339623830623635356461373437643236653466643930223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762247737),
('298913a7a2190ba2e9724eaef5be1fe1', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333435363332322e36363930333230393638363237393239363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223036666234623439653433656661386438333833376463666130323431633065223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323932393235343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323933333731383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323932393239383b7d7d72656469726563745f75726c7c733a33343a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226437643665303136636634326333303437306661376133323535666130343935223b733a33323a226338633735643535386163343566376332306461613162373834643634376530223b7d733a343a2268617368223b733a36353a2263386337356435353861633435663763323064616131623738346436343765302d6437643665303136636634326333303437306661376133323535666130343935223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223566663536363737363462306236353366343335643537363433356133326236223b733a33323a223465363164323563663633626565626261383239383736323634363939303037223b733a33323a226531643637363435636639623735363233653836616335343861306532373733223b733a33323a223864643137653538383738636430626338323931663261613861393666326364223b733a33323a223837346165623430346134663030613639346534363363643133636233663565223b733a33323a226535653865376638323736633836656464313330613761633033316430366239223b733a33323a226261363237646665653031353262643163636461613539613938316465343565223b733a33323a223634326166313131666665663738643637383366643335396264373636323532223b733a33323a223438343832313633613535653333383262393131633633623765373634353866223b733a33323a226234656531373134333466356430656433333036393965343532373632653434223b733a33323a226532313361663363306633366562323534303861383239323631643136616561223b733a33323a226361376363353634383636356661313835663735616636616364363136633434223b733a33323a223265366535353861636432336236633030656564666236386262303366376335223b733a33323a223362653834393461613534393632386635333962383862636566633266363836223b733a33323a226539326665633764646364306563323432383865303263643763613531636566223b733a33323a226531393734303765636337383036633832303065316230316231366635656633223b733a33323a223837653964376537396639633162613165623937333863616639633266393534223b733a33323a226232636333376232643861653633626633656266383462626339373962333136223b733a33323a223264316535396165376338656534333833393638373862373935656638333639223b733a33323a223333383230643939376265323336613236613938623962643439663761383036223b7d733a343a2268617368223b733a36353a2233333832306439393762653233366132366139386239626434396637613830362d3264316535396165376338656534333833393638373862373935656638333639223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226561383535373533626331653332383462353636363061356336373336623135223b733a33323a223339363336386338636338626237343561666235653661376135626166323237223b7d733a343a2268617368223b733a36353a2233393633363863386363386262373435616662356536613761356261663232372d6561383535373533626331653332383462353636363061356336373336623135223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763456322),
('2fb8eccbcc67c49d43cb0bce951de59e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333332393436312e34333035363339323636393637373733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223266623865636362636336376334396434336362306263653935316465353965223b7d7d, 1763329461),
('30a4b36b2183752d8b1091b3259a732f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333630383133312e353439303831303837313132343236373537383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223330613462333662323138333735326438623130393162333235396137333266223b7d7d, 1763608131),
('3142d0af6929aeb9099cc0078e743a28', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323930343438372e313436393632383831303838323536383335393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223331343264306166363932396165623930393963633030373865373433613238223b7d7d, 1762904487),
('31ea4b49624e9bc1e6ecb8ae7a4fc1c6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333737353732362e393533343330383931303336393837333034363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223331656134623439363234653962633165366563623861653761346663316336223b7d7d, 1763775726),
('3261b8092860bdbce5492da6fd213fc7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323237313935382e3038343032313039313436313138313634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223332363162383039323836306264626365353439326461366664323133666337223b7d7d, 1762271958),
('328a870d6f8ce7496b693263ba189819', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323333373535352e343431333234393439323634353236333637313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223332386138373064366638636537343936623639333236336261313839383139223b7d7d, 1762337555),
('35b8a8ea48b248f619333c9659dc9dbe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333532323536372e32353834313939393035333935353037383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223335623861386561343862323438663631393333336339363539646339646265223b7d7d, 1763522567),
('35fc1acbfabb597efd330dbb5ecdd87f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333438303435362e363532313938303736323438313638393435333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223335666331616362666162623539376566643333306462623565636464383766223b7d7d, 1763480456),
('397a5d68ebc47a53484a7efa4591992d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323431323434342e353535333232383835353133333035363634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223339376135643638656263343761353334383461376566613435393139393264223b7d7d, 1762412444),
('3ac19455565635e4abe540961f6878ed', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323735333337322e353634313030303237303834333530353835393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223361633139343535353635363335653461626535343039363166363837386564223b7d7d, 1762753372),
('3c3390da6264d0b9bcd8d43e2c171ae6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333335333039392e303133393330303832333231313636393932313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223363333339306461363236346430623962636438643433653263313731616536223b7d7d, 1763353099),
('3f272669a349b4f856f4fbdfb8e02ad9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333536302e3637353532373039353739343637373733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223366323732363639613334396234663835366634666264666238653032616439223b7d7d, 1763303560),
('3f3ecba39cff306736ff453a69294b73', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333536302e393531343933393738353030333636323130393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223366336563626133396366663330363733366666343533613639323934623733223b7d7d, 1763303560),
('409e161aff5ebb9062e020cb4ad8a29e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333034303332342e3537383137383838323539383837363935333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223430396531363161666635656262393036326530323063623461643861323965223b7d7d, 1763040324),
('4a7da9d3e8c0f2299242d3417ec64c0c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323432373437322e35323030313039343831383131353233343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223461376461396433653863306632323939323432643334313765633634633063223b7d7d, 1762427472),
('4b95d09e95f9fc710e593ef3a87236f3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323032393539372e3730323736343033343237313234303233343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223462393564303965393566396663373130653539336566336138373233366633223b7d7d, 1762029597),
('4dae21bb5387e3c90b3801395532f969', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323030333137352e363235373236393338323437363830363634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223464616532316262353338376533633930623338303133393535333266393639223b7d7d, 1762003175),
('4eef3eb826584a6cb87b4bc602131fa2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333436323934312e3836383731323930323036393039313739363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223465656633656238323635383461366362383762346263363032313331666132223b7d7d, 1763462941),
('4fdcc4a7038b55c4cc000bc784be1ace', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239332e363836343134303033333732313932333832383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223466646363346137303338623535633463633030306263373834626531616365223b7d7d, 1763304293),
('506fb7ba4b8d896f9e6fdbeb1b88d4df', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333332393436312e343330353839393134333231383939343134303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223530366662376261346238643839366639653666646265623162383864346466223b7d7d, 1763329461),
('53e177d5ea0639ceec08e8fd323b36f4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323138343831372e3634393739363030393036333732303730333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223533653137376435656130363339636565633038653866643332336233366634223b7d7d, 1762184817),
('55d4f0b1753039c58feda44d7f1c5ea6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333438313332312e3030373135343934313535383833373839303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223535643466306231373533303339633538666564613434643766316335656136223b7d7d, 1763481321),
('590e940ce1eb415618216d3250f97e0b', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235313630382e313134383735303738323031323933393435333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223539306539343063653165623431353631383231366433323530663937653062223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239343830383b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226633333766386233326665306536353963643163386138373838353338633831223b733a33323a223734633661653430306631353832333339326465383864616534623139376363223b7d733a343a2268617368223b733a36353a2237346336616534303066313538323333393264653838646165346231393763632d6633333766386233326665306536353963643163386138373838353338633831223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762251608),
('5d1318e5211e2d2cef9a31edbe7345d7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323433363738342e313935313030303639303436303230353037383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223564313331386535323131653264326365663961333165646265373334356437223b7d7d, 1762436784),
('5f52083c68ce7b4483635475e7e60f49', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333136323130302e363835303535393731313435363239383832383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223566353230383363363863653762343438333633353437356537653630663439223b7d7d, 1763162100),
('61b0f8a2da456d2c593b69e63c44928a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333739343332322e303537313833303237323637343536303534363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223631623066386132646134353664326335393362363965363363343439323861223b7d7d, 1763794322),
('63ebf4a78609b72d16bacf0bdf17f264', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373436332e36373838393439393636343330363634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223633656266346137383630396237326431366261636630626466313766323634223b7d7d, 1763237463),
('646ecd3dcaa0b06a7ae7b26086f38511', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323030333137332e353530333539303130363936343131313332383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223634366563643364636161306230366137616537623236303836663338353131223b7d7d, 1762003173),
('66c7b563cc4a7098c199b5660bfeebf1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373438352e38393734333930303239393037323236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223636633762353633636334613730393863313939623536363062666565626631223b7d7d, 1763237485),
('765f3008805bb819ab3819f1c8304c69', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239352e333534323532303939393930383434373236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223736356633303038383035626238313961623338313966316338333034633639223b7d7d, 1763304295),
('7893be82f5ed4d7125bc00c569c02cdf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333537353836302e3532363938383938333135343239363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223738393362653832663565643464373132356263303063353639633032636466223b7d7d, 1763575860),
('79c6c7af1711b9234e08b2485a81e4b5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323735333337312e3837393638313131303338323038303037383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223739633663376166313731316239323334653038623234383561383165346235223b7d7d, 1762753371),
('7a1e7346987e8de89e457f2a0c6908b2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323136393532382e333735323831303935353034373630373432313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223761316537333436393837653864653839653435376632613063363930386232223b7d7d, 1762169528),
('7f559b55bb36ca9c577647e91a0f0703', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333132343235382e343534383239393331323539313535323733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223766353539623535626233366361396335373736343765393161306630373033223b7d7d, 1763124258),
('83b1aad66b8f5e2b5ecc1832ec112d17', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323433343834372e35333037333430363231393438323432313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223833623161616436366238663565326235656363313833326563313132643137223b7d7d, 1762434847),
('86a98d4ca0bbed13930ef0b22d1c44a3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323838363038382e3532383535333030393033333230333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223836613938643463613062626564313339333065663062323264316334346133223b7d7d, 1762886088),
('88c39796cbd0ec52393e44d28a88bd9c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333733333132352e303535383434303638353237323231363739363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223838633339373936636264306563353233393365343464323861383862643963223b7d7d72656469726563745f75726c7c733a33393a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e2f6974656d223b, 1763733125),
('8db78b109b248c27a7e4122a3ae2e7f3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333338333130312e31363239383030373936353038373839303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223864623738623130396232343863323761376534313232613361653265376633223b7d7d, 1763383101),
('8feef7715979d01dc4c06aa4db6f8e56', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373434372e393836343639303330333830323439303233343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223866656566373731353937396430316463346330366161346462366638653536223b7d7d, 1763237448),
('9122120a365e59bf923bf66950dccfd4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373435382e393138373631393638363132363730383938343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223931323231323061333635653539626639323362663636393530646363666434223b7d7d, 1763237458),
('9196bbfbb7ec14bd4e753d1b127545d2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333536302e333935323139303837363030373038303037383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223931393662626662623765633134626434653735336431623132373534356432223b7d7d, 1763303560),
('94737adf1aefd1de8d6d54a3a2ceb197', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239352e3036383435393033333936363036343435333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223934373337616466316165666431646538643664353461336132636562313937223b7d7d, 1763304295),
('980fb7ed78bd6971bb6b7cd6b1e6ed30', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333434323038312e383238393533303237373235323139373236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223938306662376564373862643639373162623662376364366231653665643330223b7d7d, 1763442081),
('9b209f1f8be4b6ce1cfe154fae7b1c18', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333536312e32323337393538393038303831303534363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223962323039663166386265346236636531636665313534666165376231633138223b7d7d, 1763303561),
('9c81eacfb822ae3f60a71e0b441a5c12', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239332e3431303431393934303934383438363332383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223963383165616366623832326165336636306137316530623434316135633132223b7d7d, 1763304293),
('9ce20eea81ad2fe287f3d87275500ba8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333535392e353539343132303032353633343736353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223963653230656561383161643266653238376633643837323735353030626138223b7d7d, 1763303559),
('a09b9161f618c7004b57dad80ec64816', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323032353631302e3836383935383935303034323732343630393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226130396239313631663631386337303034623537646164383065633634383136223b7d7d, 1762025610),
('a246c242d22560f77352b1f967233751', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323030333234362e353530343432393334303336323534383832383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226132343663323432643232353630663737333532623166393637323333373531223b7d7d, 1762003246),
('a4440488f7796c3000976185f15f5deb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333834353034312e353334343434303933373034323233363332383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226134343430343838663737393663333030303937363138356631356635646562223b7d7d, 1763845041),
('a84713de7cf177ff42da0c2792369546', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373437302e313437383731303137343536303534363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226138343731336465376366313737666634326461306332373932333639353436223b7d7d, 1763237470),
('aa8598d9d1829075e7467dff825abc32', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333231303334332e323537343731303834353934373236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226161383539386439643138323930373565373436376466663832356162633332223b7d7d, 1763210343),
('abd1b4c51897893de8110ae04b07786f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323432373437332e3233323936343033383834383837363935333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226162643162346335313839373839336465383131306165303462303737383666223b7d7d, 1762427473),
('abec67628783c1d704a0a7c653da9266', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239342e3233373932373931333636353737313438343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226162656336373632383738336331643730346130613763363533646139323636223b7d7d, 1763304294),
('ac4bf0b49d2e993d89e822930fbb3a4e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333630393532372e343537343834393630353536303330323733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226163346266306234396432653939336438396538323239333066626233613465223b7d7d, 1763609527),
('ae1e1923305b24ee792b005e5ecb4a73', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239342e35313738343830313438333135343239363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226165316531393233333035623234656537393262303035653565636234613733223b7d7d, 1763304294),
('b1dc5d7e02f19e2ad75b0e2d8ad3234e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235313630372e3738363934333931323530363130333531353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226231646335643765303266313965326164373562306532643861643332333465223b7d7d72656469726563745f75726c7c733a33393a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e2f6974656d223b, 1762251607),
('b296ad06f87c31da6525900c9fff5167', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323735333337342e313933313837393532303431363235393736353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226232393661643036663837633331646136353235393030633966666635313637223b7d7d, 1762753374),
('b299d57278a78cd79ac7f7d610b1a9d9', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432323233312e383636313935393137313239353136363031353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226232393964353732373861373863643739616337663764363130623161396439223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333436353433313b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223231643137333730303630343133363361343530363266633836613039623866223b733a33323a226134353163643135616263313366386236613363623239623132626236613634223b7d733a343a2268617368223b733a36353a2261343531636431356162633133663862366133636232396231326262366136342d3231643137333730303630343133363361343530363266633836613039623866223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763422231),
('b5924aa654439407b08ab7b4253d32f4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373438352e363039393439313131393338343736353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226235393234616136353434333934303762303861623762343235336433326634223b7d7d, 1763237485),
('b7584ce5ae277a54af6597df29188f5e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239342e3739313539353933353832313533333230333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226237353834636535616532373761353461663635393764663239313838663565223b7d7d, 1763304294),
('bb5c7d595a2ef349a7c0bb6e3ac131ea', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333838333332322e323532303936383931343033313938323432313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226262356337643539356132656633343961376330626236653361633133316561223b7d7d, 1763883322),
('bd063da527706e3c0c9dc5b8f04097ae', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323030323737312e3938363737333031343036383630333531353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226264303633646135323737303665336330633964633562386630343039376165223b7d7d, 1762002772),
('bf4670a193b71b59e3457d7dae0cfc8d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239332e393539363937393631383037323530393736353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226266343637306131393362373162353965333435376437646165306366633864223b7d7d, 1763304293),
('c11dcd32eb1e1bc0436e00013039e65a', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323332393033362e36363535333539323638313838343736353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226331316463643332656231653162633034333665303030313330333965363561223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323337323233363b7d7d72656469726563745f75726c7c733a33343a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226161353837363431613533663930656463343436633630323439356239366161223b733a33323a223036613236313361623863643763336461303731666230636463656636336130223b7d733a343a2268617368223b733a36353a2230366132363133616238636437633364613037316662306364636566363361302d6161353837363431613533663930656463343436633630323439356239366161223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762329036),
('c1e7e069d745f3898b610ea407e8e535', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333136323538362e343839313337383837393534373131393134303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226331653765303639643734356633383938623631306561343037653865353335223b7d7d, 1763162586),
('c5539b7818c888abda75b47b4d4136ba', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323030333137332e323230353138313132313832363137313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226335353339623738313863383838616264613735623437623464343133366261223b7d7d, 1762003173),
('c56abb84074c77ef906adee40d03f6ec', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323238313432332e393738373431383834323331353637333832383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226335366162623834303734633737656639303661646565343064303366366563223b7d7d, 1762281424);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('c5cad3c76e2ad8c43d8437f8791d548e', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333930323336352e363533333030303436393230373736333637313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223935613238663637386137346662333764653763653831386537316339356338223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323033383236313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333838383537303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333934353536353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333737373531323b7d7d72656469726563745f75726c7c733a33343a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223630393837326431393165383039353138646437616539333466633637633462223b733a33323a226361383630393038373838633238313732366334376664356663623533616632223b7d733a343a2268617368223b733a36353a2263613836303930383738386332383137323663343766643566636235336166322d3630393837326431393165383039353138646437616539333466633637633462223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226632613339313731386639643265373635623337343965386261643634643864223b733a33323a226365613734363263646439623566613738613364333636666236653564336361223b733a33323a226661363537363636343732373832636434366363316666666631343234646531223b733a33323a223061356434356633336239376433336166313834333033336631663537376262223b733a33323a223432333036623136626233346561396331323335383836346438303762373437223b733a33323a223166396565356638393761353831636539393961326166383933373635303034223b733a33323a226663643765383966623764396665313638626631323734353339393734626335223b733a33323a223565663334623233396261303438383335613164646363336531313131636530223b733a33323a223635653533656338363161626230383237396264386234366333366137653665223b733a33323a223462303839616263313338366466353864343863626633623039346265393432223b733a33323a223566336361363131396663643064373263343863323333356166656537653363223b733a33323a223265306162613135343434306137303366633966353961326137313938323438223b7d733a343a2268617368223b733a36353a2232653061626131353434343061373033666339663539613261373139383234382d3566336361363131396663643064373263343863323333356166656537653363223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226361616239643933353638666130383635616163666635366539646263353033223b733a33323a223631353739656332353835386136666234353166653932303530636261656133223b733a33323a226435303465353536376131306433613763373036326431353530393364393834223b733a33323a226365393737666261646363343435633963323430613933363236613930623533223b733a33323a223639353533646639303965363539353366383866666637346239393161306462223b733a33323a223363333133373665343939643634393036653165336162323739396234316465223b733a33323a223139613835376263353665353961346361363931653064396331653938313062223b733a33323a223361393531623634346238313865336364316236396630356466323132653037223b7d733a343a2268617368223b733a36353a2233613935316236343462383138653363643162363966303564663231326530372d3139613835376263353665353961346361363931653064396331653938313062223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226236643661613833333431623532366534343836356637643232383165633963223b733a33323a223863656565626230393461656264366364633333306134356566333635626133223b7d733a343a2268617368223b733a36353a2238636565656262303934616562643663646333333061343565663336356261332d6236643661613833333431623532366534343836356637643232383165633963223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763902365),
('c7407fb0422d28f85337a075b43612e1', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333132333833342e3431313234333931353535373836313332383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226337343037666230343232643238663835333337613037356234333631326531223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333136373033343b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223538323965636664323165386336363836663465316339663461633237613835223b733a33323a223430376132343035393834386565303235373165616636616430666362383466223b7d733a343a2268617368223b733a36353a2234303761323430353938343865653032353731656166366164306663623834662d3538323965636664323165386336363836663465316339663461633237613835223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763123834),
('cbb9697440f81dae8b86600b087064c2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235323832312e3634383437373037373438343133303835393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226362623936393734343066383164616538623836363030623038373036346332223b7d7d, 1762252821),
('cc4e0018f19d2957e05a8756b48b0e42', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333535392e38333835323239313130373137373733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226363346530303138663139643239353765303561383735366234386230653432223b7d7d, 1763303559),
('db696ce752bd3cdf0bf150544aed20a1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333335333131352e323738343933383831323235353835393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226462363936636537353262643363646630626631353035343461656432306131223b7d7d, 1763353115),
('db81d0da1e66c7805995042d5f690707', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333337323732362e3030373139343034323230353831303534363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226462383164306461316536366337383035393935303432643566363930373037223b7d7d, 1763372726),
('dd97834a3b4e8524bdaeced24b0e54c8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323432393134312e353932373036393138373136343330363634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226464393738333461336234653835323462646165636564323462306535346338223b7d7d, 1762429141),
('ddba42751c187a0b5222e67083172a94', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323031393237352e383337333833393835353139343039313739363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226464626134323735316331383761306235323232653637303833313732613934223b7d7d, 1762019275),
('de5470fac80b1faed157ed2fbbaeb1c0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333237393038312e3230343338303033353430303339303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226465353437306661633830623166616564313537656432666262616562316330223b7d7d, 1763279081),
('e335f7cfc3aa27a3f4462c16d8fd087d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333732383834392e333031323232303835393532373538373839303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226533333566376366633361613237613366343436326331366438666430383764223b7d7d, 1763728849),
('e4a95edd1cb30238c24918411d1ea53a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333436303137392e383738303731303639373137343037323236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226534613935656464316362333032333863323439313834313164316561353361223b7d7d, 1763460179),
('e62287f05f762080e8d2f710a2f03416', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333438313333392e35353634323630343832373838303835393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226536323238376630356637363230383065386432663731306132663033343136223b7d7d, 1763481339),
('e6e1c9f05c40312b9d44b656491208e6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432353434302e313636383235303536303736303439383034363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226536653163396630356334303331326239643434623635363439313230386536223b7d7d, 1763425440),
('e817132a78dfcf56b30b9ae3a423a103', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323737323036302e3732383934383131363330323439303233343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226538313731333261373864666366353662333062396165336134323361313033223b7d7d, 1762772060),
('eb8c737781b4d04c0ebe2cdf05dab24a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239332e31303035323439303233343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226562386337333737383162346430346330656265326364663035646162323461223b7d7d, 1763304293),
('f165792d1835c541b9ac96cbc5969ad7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432323233312e353337363733393530313935333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226631363537393264313833356335343162396163393663626335393639616437223b7d7d72656469726563745f75726c7c733a33393a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e2f6974656d223b, 1763422231),
('f174a6c2033698d2e3069c932089ff1c', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234373733372e34343539313830383331393039313739363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226631373461366332303333363938643265333036396339333230383966663163223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239303933373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223134386362633832343534313332333230626234666665393764656537343131223b733a33323a223233656332316166616531633833323730646564656438623465396161656561223b7d733a343a2268617368223b733a36353a2232336563323161666165316338333237306465646564386234653961616565612d3134386362633832343534313332333230626234666665393764656537343131223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762247737),
('f47682ec5236aca2cfb23b74a78c571b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333535392e323837383735383930373331383131353233343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226634373638326563353233366163613263666232336237346137386335373162223b7d7d, 1763303559),
('f5a473887fd12c523819d760ac7902be', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333533373533302e363932333538303136393637373733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226635613437333838376664313263353233383139643736306163373930326265223b7d7d, 1763537530),
('f616596ebf746cf2a7cb0fb97d7ccba9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333431383231392e393036353734393634353233333135343239363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226636313635393665626637343663663261376362306662393764376363626139223b7d7d, 1763418219),
('f6b0075236c237bb9d92d76f405c61ea', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333132333833342e303939373835303839343932373937383531353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226636623030373532333663323337626239643932643736663430356336316561223b7d7d72656469726563745f75726c7c733a33393a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e2f6974656d223b, 1763123834),
('f852702eda7419a2151f52dc8722f2ef', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333435383137322e393132333231303930363938323432313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226638353237303265646137343139613231353166353264633837323266326566223b7d7d, 1763458172),
('f958053ee6c31a15bb927131b863e352', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373434382e323831383731303830333938353539353730333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226639353830353365653663333161313562623932373133316238363365333532223b7d7d72656469726563745f75726c7c733a33373a22687474703a2f2f7777772e6f6d656b612e746f6461796672616e63652e66722f61646d696e223b, 1763237448),
('fcb5cf2f665e8af699a6435abd610456', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323938333035302e353138323436383839313134333739383832383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226663623563663266363635653861663639396136343335616264363130343536223b7d7d, 1762983050),
('fdd5e50bb4941192c80e15e78f031c69', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233343632312e3230313234313031363338373933393435333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226664643565353062623439343131393263383065313565373866303331633639223b7d7d, 1763234621),
('fe1fdcd53149ab420159dd1dfab7b64a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333632323337302e353135373032393632383735333636323130393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226665316664636435333134396162343230313539646431646661623762363461223b7d7d, 1763622370);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"karimbochx@gmail.com\"'),
('default_site', '\"\"'),
('default_to_private', '\"0\"'),
('disable_file_validation', '\"0\"'),
('disable_jsonld_embed', '\"0\"'),
('disable_jsonld_reverse', '\"0\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('favicon', '\"\"'),
('installation_title', '\"DevinciLostFound\"'),
('locale', '\"fr\"'),
('media_alt_text_property', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/webp\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '\"25\"'),
('property_label_information', '\"none\"'),
('recaptcha_secret_key', '\"\"'),
('recaptcha_site_key', '\"\"'),
('time_zone', '\"Europe\\/Paris\"'),
('use_htmlpurifier', '\"1\"'),
('value_languages', '[]'),
('version', '\"4.1.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) NOT NULL,
  `theme` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `navigation` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(190) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `role` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'karimbochx@gmail.com', 'Administrator', '2025-10-18 04:37:27', '2025-10-18 04:37:27', '$2y$10$GSiUx1.v0CxdTNm7//D.ZOFh0Tu3BQg6cMPfLARZUTJsaP7ZLszi6', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'TeacherSamuel', '2025-10-21 07:20:07', '2025-11-04 09:14:03', '$2y$10$cPqXf3wKvjFkYghNfPVzQeA7uaSaVI16Z0u4dvoUtaAYwXvZyEk6K', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 2, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 2, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('csv_import_automap_check_names_alone', 1, 'false'),
('csv_import_delimiter', 1, '\",\"'),
('csv_import_enclosure', 1, '\"\\\"\"'),
('csv_import_global_language', 1, '\"\"'),
('csv_import_identifier_property', 1, '\"\"'),
('csv_import_multivalue_separator', 1, '\",\"'),
('csv_import_rows_by_batch', 1, '20'),
('default_resource_template', 1, '\"\"'),
('default_resource_template', 2, '\"\"'),
('locale', 1, '\"\"'),
('locale', 2, '\"\"');

-- --------------------------------------------------------

--
-- Table structure for table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `uri` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(16, 4, 185, NULL, NULL, 'literal', NULL, 'Clé USB noire', NULL, 1),
(17, 4, 186, NULL, NULL, 'literal', NULL, 'Clé 16Go avec logo ESILV', NULL, 1),
(18, 4, 187, NULL, NULL, 'literal', NULL, '2025-03-14', NULL, 1),
(19, 4, 188, NULL, NULL, 'literal', NULL, 'Salle L113', NULL, 1),
(20, 4, 189, NULL, NULL, 'literal', NULL, 'Karim Bouchaane', NULL, 1),
(21, 5, 185, NULL, NULL, 'literal', NULL, 'Carte étudiante', NULL, 1),
(22, 5, 186, NULL, NULL, 'literal', NULL, 'Carte au nom de Sarah L.', NULL, 1),
(23, 5, 187, NULL, NULL, 'literal', NULL, '2025-03-16', NULL, 1),
(24, 5, 188, NULL, NULL, 'literal', NULL, 'Bibliothèque', NULL, 1),
(25, 5, 189, NULL, NULL, 'literal', NULL, 'Mohamed S.', NULL, 1),
(26, 6, 185, NULL, NULL, 'literal', NULL, 'Parapluie bleu', NULL, 1),
(27, 6, 186, NULL, NULL, 'literal', NULL, 'Perdu près de la cafétéria', NULL, 1),
(28, 6, 187, NULL, NULL, 'literal', NULL, '2025-03-20', NULL, 1),
(29, 6, 188, NULL, NULL, 'literal', NULL, 'Cafétéria', NULL, 1),
(30, 6, 189, NULL, NULL, 'literal', NULL, 'Ramzi N.', NULL, 1),
(31, 7, 1, NULL, NULL, 'literal', '', 'Karim Bouchaane', NULL, 1),
(32, 7, 4, NULL, NULL, 'literal', '', 'Moi', NULL, 1),
(33, 7, 10, NULL, NULL, 'literal', '', '12345', NULL, 1),
(34, 7, 7, NULL, NULL, 'literal', '', '21/10/2025', NULL, 1),
(35, 7, 141, NULL, NULL, 'literal', '', 'Karim', NULL, 1),
(36, 7, 145, NULL, NULL, 'literal', '', 'Bouchaane', NULL, 1),
(37, 11, 1, NULL, NULL, 'literal', NULL, 'test', NULL, 1),
(38, 13, 1, NULL, NULL, 'literal', NULL, 'test', NULL, 1),
(39, 15, 1, NULL, NULL, 'literal', NULL, 'Enregistrement audio', NULL, 1),
(40, 15, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude:  | Longitude: ', NULL, 1),
(41, 16, 1, NULL, NULL, 'literal', NULL, 'Nous testons', NULL, 1),
(42, 16, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: Tu testes | Longitude: Je test', NULL, 1),
(43, 17, 1, NULL, NULL, 'literal', NULL, 'sdf', NULL, 1),
(44, 17, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: zds | Longitude: zer', NULL, 1),
(45, 18, 1, NULL, NULL, 'literal', NULL, 'Smile again and again', NULL, 1),
(46, 18, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: smile again | Longitude: Smile', NULL, 1),
(47, 19, 1, NULL, NULL, 'literal', NULL, 'teert', NULL, 1),
(48, 19, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: tert | Longitude: Tert', NULL, 1),
(49, 20, 1, NULL, NULL, 'literal', NULL, 'vbn', NULL, 1),
(50, 20, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: vbg | Longitude: vfg', NULL, 1),
(51, 21, 1, NULL, NULL, 'literal', NULL, 'cde', NULL, 1),
(52, 21, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: cde | Longitude: cde', NULL, 1),
(53, 22, 1, NULL, NULL, 'literal', NULL, 'trt', NULL, 1),
(54, 22, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: trt | Longitude: trt', NULL, 1),
(55, 23, 1, NULL, NULL, 'literal', NULL, 'dxdx', NULL, 1),
(56, 23, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: dxdx | Longitude: dxdx', NULL, 1),
(57, 24, 1, NULL, NULL, 'literal', NULL, 'yhyh', NULL, 1),
(58, 24, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: yhyh | Longitude: yhyh', NULL, 1),
(59, 25, 1, NULL, NULL, 'literal', NULL, 'eedd', NULL, 1),
(60, 25, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: sdfs | Longitude: vbbg', NULL, 1),
(61, 26, 1, NULL, NULL, 'literal', NULL, 'xcxc', NULL, 1),
(62, 26, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: xcxc | Longitude: xcxc', NULL, 1),
(63, 27, 1, NULL, NULL, 'literal', NULL, 'qqq', NULL, 1),
(64, 27, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: xxwx | Longitude: cxwx', NULL, 1),
(65, 28, 1, NULL, NULL, 'literal', NULL, 'qqq', NULL, 1),
(66, 28, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: xxwx | Longitude: cxwx', NULL, 1),
(67, 29, 1, NULL, NULL, 'literal', NULL, 'cdc', NULL, 1),
(68, 29, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: cdc | Longitude: cdc', NULL, 1),
(69, 30, 1, NULL, NULL, 'literal', NULL, 'dsd', NULL, 1),
(70, 30, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: sds | Longitude: ds', NULL, 1),
(71, 32, 1, NULL, NULL, 'literal', NULL, 'sdfe', NULL, 1),
(72, 32, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: zer | Longitude: ze', NULL, 1),
(73, 33, 1, NULL, NULL, 'literal', NULL, 'sdfe', NULL, 1),
(74, 33, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: zer | Longitude: ze', NULL, 1),
(75, 34, 1, NULL, NULL, 'literal', NULL, 'sdfe', NULL, 1),
(76, 34, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: zer | Longitude: ze', NULL, 1),
(77, 35, 1, NULL, NULL, 'literal', NULL, 'sdfe', NULL, 1),
(78, 35, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: zer | Longitude: ze', NULL, 1),
(79, 36, 1, NULL, NULL, 'literal', NULL, 'sdfe', NULL, 1),
(80, 36, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: 3322 | Longitude: 112', NULL, 1),
(81, 37, 1, NULL, NULL, 'literal', NULL, 'sdfe', NULL, 1),
(82, 37, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: 3322 | Longitude: 112', NULL, 1),
(83, 38, 1, NULL, NULL, 'literal', NULL, 'wqwq', NULL, 1),
(84, 38, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: 3322 | Longitude: 112', NULL, 1),
(85, 39, 1, NULL, NULL, 'literal', NULL, 'Enregistrement audio', NULL, 1),
(86, 39, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude:  | Longitude: ', NULL, 1),
(87, 40, 1, NULL, NULL, 'literal', NULL, 'sdf', NULL, 1),
(88, 40, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude: sdf | Longitude: sdf', NULL, 1),
(89, 41, 1, NULL, NULL, 'literal', NULL, 'Enregistrement audio', NULL, 1),
(90, 41, 4, NULL, NULL, 'literal', NULL, 'Message audio enregistré via DevinciLostFound | Latitude:  | Longitude: ', NULL, 1),
(91, 42, 1, NULL, NULL, 'literal', NULL, 'Enregistrement audio', NULL, 1),
(92, 42, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude:  | Longitude: ', NULL, 1),
(93, 43, 1, NULL, NULL, 'literal', NULL, 'Enregistrement audio', NULL, 1),
(94, 43, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude:  | Longitude: ', NULL, 1),
(95, 44, 1, NULL, NULL, 'literal', NULL, 'Joly', NULL, 1),
(96, 44, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 48.829365 | Longitude: 2.426541', NULL, 1),
(97, 45, 1, NULL, NULL, 'literal', NULL, 'sdf', NULL, 1),
(98, 45, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 112 | Longitude: 232', NULL, 1),
(99, 46, 1, NULL, NULL, 'literal', NULL, 'ERE', NULL, 1),
(100, 46, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 223 | Longitude: 121', NULL, 1),
(101, 47, 1, NULL, NULL, 'literal', NULL, 'gsg', NULL, 1),
(102, 47, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 48.829365 | Longitude: 2.426541', NULL, 1),
(103, 48, 1, NULL, NULL, 'literal', NULL, 'sfs', NULL, 1),
(104, 48, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 48.829365 | Longitude: 2.426541', NULL, 1),
(105, 49, 1, NULL, NULL, 'literal', NULL, 'Devinci', NULL, 1),
(106, 49, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 48.829365 | Longitude: 2.426541', NULL, 1),
(107, 50, 1, NULL, NULL, 'literal', NULL, 'You', NULL, 1),
(108, 50, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 48.829365 | Longitude: 2.426541', NULL, 1),
(109, 51, 1, NULL, NULL, 'literal', NULL, 'Paris8', NULL, 1),
(110, 51, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 48.944656 | Longitude: 2.363221', NULL, 1),
(111, 52, 1, NULL, NULL, 'literal', NULL, 'sjs', NULL, 1),
(112, 52, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 48.944656 | Longitude: 2.363221', NULL, 1),
(113, 53, 1, NULL, NULL, 'literal', NULL, 'Hello', NULL, 1),
(114, 53, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 23 | Longitude: 32', NULL, 1),
(115, 54, 1, NULL, NULL, 'literal', NULL, 'Paris8', NULL, 1),
(116, 54, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 48.944656 | Longitude: 2.363221', NULL, 1),
(117, 55, 1, NULL, NULL, 'literal', NULL, 'Joly', NULL, 1),
(118, 55, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 11 | Longitude: 23', NULL, 1),
(119, 56, 1, NULL, NULL, 'literal', NULL, 'Salut', NULL, 1),
(120, 56, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 48.944656 | Longitude: 2.363221', NULL, 1),
(121, 57, 1, NULL, NULL, 'literal', NULL, 'test', NULL, 1),
(122, 57, 4, NULL, NULL, 'literal', NULL, 'Message audio | Latitude: 48.944656 | Longitude: 2.363221', NULL, 1),
(123, 58, 1, NULL, NULL, 'literal', NULL, 'Wallet', NULL, 1),
(124, 58, 4, NULL, NULL, 'literal', NULL, 'Objet trouvé — Description générée à l\'envoi.\nTéléphone du trouveur : 067567456\nLocalisation : lat=48.829365, lng=2.426541', NULL, 1),
(125, 59, 1, NULL, NULL, 'literal', NULL, 'Monter', NULL, 1),
(126, 59, 4, NULL, NULL, 'literal', NULL, 'Objet trouvé — Description générée à l\'envoi.\nTéléphone du trouveur : 067887788\nLocalisation : lat=48.829365, lng=2.426541', NULL, 1),
(127, 60, 1, NULL, NULL, 'literal', NULL, 'Helop', NULL, 1),
(128, 60, 4, NULL, NULL, 'literal', NULL, 'Objet trouvé — Description générée à l\'envoi.\nTéléphone du trouveur : 06756786567\nLocalisation : lat=48.829365, lng=2.426541', NULL, 1),
(129, 61, 1, NULL, NULL, 'literal', NULL, 'Smartphone', NULL, 1),
(130, 61, 4, NULL, NULL, 'literal', NULL, 'Objet trouvé.\nTéléphone du trouveur : 068756789\nLocalisation : lat=48.829365, lng=2.426541', NULL, 1),
(131, 62, 1, NULL, NULL, 'literal', NULL, 'Rolo', NULL, 1),
(132, 62, 4, NULL, NULL, 'literal', NULL, 'Objet trouvé.\nTéléphone du trouveur : 067856787\nLocalisation : lat=48.829365, lng=2.426541', NULL, 1),
(133, 63, 1, NULL, NULL, 'literal', NULL, 'ezze', NULL, 1),
(134, 63, 4, NULL, NULL, 'literal', NULL, 'Objet trouvé.\nTéléphone du trouveur : 087645678\nLocalisation : lat=48.829365, lng=2.426541', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) NOT NULL,
  `prefix` varchar(190) NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(5, 1, 'http://devincilostfound.com/vocab#', 'dlf', 'Vocabulaire DevinciLostFound', 'Vocabulaire sémantique pour décrire les objets perdus, les lieux et les personnes de l’écosystème de l’école Léonard de Vinci.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Indexes for table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_84D382F4BE04EA9` (`job_id`);

--
-- Indexes for table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_17B50881BE04EA9` (`job_id`),
  ADD UNIQUE KEY `UNIQ_17B508814C276F75` (`undo_job_id`);

--
-- Indexes for table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`);

--
-- Indexes for table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Indexes for table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  ADD KEY `title` (`title`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Indexes for table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Indexes for table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Indexes for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Indexes for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Indexes for table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Indexes for table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `is_public` (`is_public`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Indexes for table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Indexes for table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Indexes for table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Indexes for table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Indexes for table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Indexes for table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD CONSTRAINT `FK_84D382F4BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Constraints for table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD CONSTRAINT `FK_17B508814C276F75` FOREIGN KEY (`undo_job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `FK_17B50881BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Constraints for table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Constraints for table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Constraints for table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Constraints for table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Constraints for table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

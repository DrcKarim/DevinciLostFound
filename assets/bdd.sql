-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 09, 2025 at 12:19 AM
-- Server version: 9.4.0
-- PHP Version: 8.4.13

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
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('8oh28HmT421E62K4MlHZJluwYVsYkDmM', 1, 'testomeka', '$2y$10$e7cwQqxNlkYkE.RSQRhDxOiOqb8YWAj4YbKUmQT.dhUII9HxtH1zC', 0x7f000001, '2025-11-23 14:00:28', '2025-11-01 11:09:28'),
('gWaqHYnwYbVmwFToXWXTaVXCKPdT3lnp', 1, 'localkey', '$2y$12$c/Z0OxClhAzn3X1MjFG8Quf2Fj4mlehxBOY.Bki4keU8X/S8hk9NS', 0x7f000001, '2025-12-08 21:52:43', '2025-11-23 14:02:08'),
('oXn57bi9OJYYMG6mswABTiTT9D0WPCNF', 1, 'test_api', '$2y$10$yPtuSp6TWZPDRNe7rLmHi.Frnz2YiJe7PvoFGCHQgso/xrGz92dm2', NULL, NULL, '2025-10-21 08:57:32'),
('yKNxh5ZLos1itBreg0X81mrJrMjxSN1o', 1, 'newtest', '$2y$10$xsT2dvrELRR4XgAOzkNzBeSqvmXpTmps0s6M1Cu1VdbD2mXoQIFsG', NULL, NULL, '2025-10-22 12:55:44'),
('yOiatpM70hFH4GyJy2NGd1s0kBvOjDKl', 1, 'omk', '$2y$10$D8h6mTPfAyo3jUvls/pUX.mkTDE9WvHgySTTkgkkc3K3DeZ3mOwzK', NULL, NULL, '2025-10-21 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `csvimport_entity`
--

CREATE TABLE `csvimport_entity` (
  `id` int NOT NULL,
  `job_id` int NOT NULL,
  `entity_id` int NOT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
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
  `id` int NOT NULL,
  `job_id` int NOT NULL,
  `undo_job_id` int DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_err` tinyint(1) NOT NULL,
  `stats` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `csvimport_import`
--

INSERT INTO `csvimport_import` (`id`, `job_id`, `undo_job_id`, `comment`, `resource_type`, `has_err`, `stats`) VALUES
(1, 1, 2, '', 'items', 0, '{\"added\":{\"items\":3}}'),
(2, 3, NULL, '', 'items', 0, '{\"added\":{\"items\":3}}');

-- --------------------------------------------------------

--
-- Table structure for table `extract_metadata`
--

CREATE TABLE `extract_metadata` (
  `id` int UNSIGNED NOT NULL,
  `media_id` int NOT NULL,
  `extracted` datetime NOT NULL,
  `extractor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int NOT NULL,
  `resource` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `text` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(4, 'items', 1, 1, NULL, 'Clé USB noire\nClé 16Go avec logo ESILV\n2025-03-14\nSalle L113\nKarim Bouchaane'),
(5, 'items', 1, 1, NULL, 'Carte étudiante\nCarte au nom de Sarah L.\n2025-03-16\nBibliothèque\nMohamed S.'),
(106, 'items', 1, 1, 'Gourde Métallique Inox 750ml', 'Gourde Métallique Inox 750ml\nDescription de l\'objet : Gourde en acier inoxydable de couleur argentée, marque “Klean Kanteen”. Trouvée dans un casier ouvert.\nTéléphone du trouveur : 07 90 66 31 84\nTrouvé par : Imane\nLieu : Couloir du 3ᵉ étage – casiers'),
(107, 'items', 1, 1, 'Casque Audio JBL Noir', 'Casque Audio JBL Noir\nDescription de l\'objet : Casque Bluetooth JBL noir, modèle Tune 510BT. Fonctionne encore, quelques traces d’usure. Trouvé sur une table près des fenêtres.\nTéléphone du trouveur : 07 82 15 99 02\nTrouvé par : Mickael\nLieu : Salle 200 – rangée du fond'),
(111, 'items', 1, 1, 'Clé USB Rouge', 'Clé USB Rouge\nDescription de l\'objet : Clé usb rouge avec cycle\nTéléphone du trouveur : 0655566666\nTrouvé par : Karim\nLieu : Caffe');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int NOT NULL,
  `primary_media_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(4, NULL),
(5, NULL),
(99, NULL),
(101, NULL),
(102, NULL),
(106, NULL),
(107, NULL),
(111, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int NOT NULL,
  `item_set_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_set`
--

CREATE TABLE `item_set` (
  `id` int NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int NOT NULL,
  `site_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `log` longtext COLLATE utf8mb4_unicode_ci,
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
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `ingester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `source` longtext COLLATE utf8mb4_unicode_ci,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int DEFAULT NULL,
  `lang` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
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
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CSVImport', 1, '2.6.2'),
('DescriptionWithAI', 1, '1.0.0'),
('ExtractMetadata', 1, '1.2.0');

-- --------------------------------------------------------

--
-- Table structure for table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int NOT NULL,
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
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci
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
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `resource_template_id` int DEFAULT NULL,
  `thumbnail_id` int DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(4, 1, 106, 2, NULL, 'Clé USB noire', 1, '2025-10-19 12:17:14', '2025-10-19 12:17:14', 'Omeka\\Entity\\Item'),
(5, 1, 106, 2, NULL, 'Carte étudiante', 1, '2025-10-19 12:17:14', '2025-10-19 12:17:14', 'Omeka\\Entity\\Item'),
(99, 1, NULL, NULL, NULL, 'Portefeuille en cuir noir', 1, '2025-12-05 12:25:45', '2025-12-05 12:25:45', 'Omeka\\Entity\\Item'),
(101, 1, NULL, NULL, NULL, 'Clés avec Porte-clé Rouge', 1, '2025-12-05 14:19:58', '2025-12-05 14:19:58', 'Omeka\\Entity\\Item'),
(102, 1, NULL, NULL, NULL, 'Lunettes de vue Ray-Ban', 1, '2025-12-05 18:10:26', '2025-12-05 18:10:26', 'Omeka\\Entity\\Item'),
(106, 1, NULL, NULL, NULL, 'Gourde Métallique Inox 750ml', 1, '2025-12-05 19:40:17', '2025-12-05 19:41:24', 'Omeka\\Entity\\Item'),
(107, 1, NULL, NULL, NULL, 'Casque Audio JBL Noir', 1, '2025-12-06 21:18:50', '2025-12-06 21:18:56', 'Omeka\\Entity\\Item'),
(111, 1, NULL, NULL, NULL, 'Clé USB Rouge', 1, '2025-12-08 21:52:43', '2025-12-08 21:52:49', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Table structure for table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci
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
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `title_property_id` int DEFAULT NULL,
  `description_property_id` int DEFAULT NULL,
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL
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
  `id` int NOT NULL,
  `resource_template_id` int NOT NULL,
  `property_id` int NOT NULL,
  `alternate_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT NULL,
  `data_type` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
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
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('01317dd0b7ed3ea8ad4e447b736fa13f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333239343030332e313530313239303739383138373235353835393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223031333137646430623765643365613861643465343437623733366661313366223b7d7d, 1763294003),
('02c5275967a0abcfd3273a80ec6b838f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353230323030332e3436323631383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223032633532373539363761306162636664333237336138306563366238333866223b7d7d, 1765202012),
('0367dd9b15bfa54b521814621859f9ab', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343636343837302e3430303434353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223033363764643962313562666135346235323138313436323138353966396162223b7d7d, 1764664870),
('04d4606cb93eff7226c0620f2f32adac', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373433302e313036353738313131363438353539353730333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223034643436303663623933656666373232366330363230663266333261646163223b7d7d, 1763237430),
('0545a4dcae3a347d482ab6490f4fb173', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373737322e30353239373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223035343561346463616533613334376434383261623634393066346662313733223b7d7d, 1765047772),
('05e2a992955118af42280cc069030cd9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343036323938332e3032373631383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223035653261393932393535313138616634323238306363303639303330636439223b7d7d, 1764062983),
('06b536ebd8f2ab77f7764a26b1f5f415', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333137303331382e333337353239383937363839383139333335393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223036623533366562643866326162373766373736346132366231663566343135223b7d7d, 1763170318),
('08c396e63cabc79a93481ceca8065f77', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373737322e3731333731383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223038633339366536336361626337396139333438316365636138303635663737223b7d7d, 1765047772),
('0af2f81ba5ecb052f3289d7592734646', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235303034322e363431373032383930333936313138313634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223061663266383162613565636230353266333238396437353932373334363436223b7d7d, 1762250043),
('0cb3295bd7e0ce68180382238f3e7b87', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373034392e3735323334373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223063623332393562643765306365363831383033383232333866336537623837223b7d7d, 1765047049),
('0dbbdba02d496c3f99a4ea29a6b71062', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233383836352e323939393938393938363431393637373733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223064626264626130326434393663336639396134656132396136623731303632223b7d7d, 1763238865),
('0ecf27181f64a44598cf98250d24cafe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323030333137332e393437353239303737353239393037323236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223065636632373138316636346134343539386366393832353064323463616665223b7d7d, 1762003173),
('0f021c1d9780120b806c16c5b5f1a306', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323735333337322e3230303437393033303630393133303835393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223066303231633164393738303132306238303663313663356235663161333036223b7d7d, 1762753372),
('0fa0e0714c7852b4b97b3098bf95d86a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333436323938322e33373836303130373432313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223066613065303731346337383532623462393762333039386266393564383661223b7d7d, 1763462982),
('10cbd551e3311f302989e3b86c7fe104', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343430383736342e3237393739373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223130636264353531653333313166333032393839653362383663376665313034223b7d7d, 1764408764),
('10d00a835c1ff21eee3ae65b3ffe3423', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333536302e313139303635303436333130343234383034363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223130643030613833356331666632316565653361653635623366666533343233223b7d7d, 1763303560),
('11a5142904ce42d39843b614e78b8428', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323432393538372e343038393730313137353638393639373236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223131613531343239303463653432643339383433623631346537386238343238223b7d7d, 1762429587),
('1261226f0da9aee31e81fed0b3146477', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373434332e313838363538393532373133303132363935333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223132363132323666306461396165653331653831666564306233313436343737223b7d7d, 1763237443),
('12fdc27040172fcd8ebe3dd938f219bf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333934313837352e3833393637373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223132666463323730343031373266636438656265336464393338663231396266223b7d7d, 1763941875),
('1444833e35dec28088d4fee3ca705355', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323838303035362e393430343233393635343534313031353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223134343438333365333564656332383038386434666565336361373035333535223b7d7d, 1762880057),
('17b19947016fa3c13709fad428d65f2c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373837392e3637363934343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223137623139393437303136666133633133373039666164343238643635663263223b7d7d, 1765047879),
('17e50769203fae8b031d2eea0c5bffbd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333934323239302e34353439323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223137653530373639323033666165386230333164326565613063356266666264223b7d7d, 1763942290),
('18bfc6f9a94ea9b6edcdb188932ccd5b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373435352e3235353837373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223138626663366639613934656139623665646364623138383933326363643562223b7d7d, 1765047455),
('192c8b5dab905f475c5b675753af7a36', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323032353939302e32323138383039313237383037363137313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223139326338623564616239303566343735633562363735373533616637613336223b7d7d, 1762025990),
('1c3ddb6291758dd99797bda7fc5b07db', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373438362e373237353430393639383438363332383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223163336464623632393137353864643939373937626461376663356230376462223b7d7d, 1763237486),
('1ca26c29bdd0a6d9ebe7a59bedcb4404', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333634323635372e36393736333038383232363331383335393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223163613236633239626464306136643965626537613539626564636234343034223b7d7d, 1763642657),
('1f7f902480dfc19a13d9a2ed30668f2e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323032353938302e3538353434353838303838393839323537383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223166376639303234383064666331396131336439613265643330363638663265223b7d7d, 1762025980),
('21581afceffe2603efc79ab91aebdaff', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323431343937372e3633303135383930313231343539393630393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223231353831616663656666653236303365666337396162393161656264616666223b7d7d, 1762414977),
('22b9d66bacdb69bb4e2800c02062c1ec', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353233303834392e3634383330343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223232623964363662616364623639626234653238303063303230363263316563223b7d7d, 1765230861),
('23df71b796f9091a7e1340202dfcc742', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333535382e3933363538323038383437303435383938343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223233646637316237393666393039316137653133343032303264666363373432223b7d7d, 1763303559),
('24eb0e7fe6c6fc88f864646daf58766e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432303730302e3031393039323038323937373239343932313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223234656230653766653663366663383866383634363436646166353837363665223b7d7d, 1763420700),
('25a727f0b6a4c627ba4a55bce054dc30', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353230323539302e3437323433343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223235613732376630623661346336323762613461353562636530353464633330223b7d7d, 1765202601),
('2684d2d3e45448a0154809fe75a06c12', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234373130332e3139333637353939343837333034363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223236383464326433653435343438613031353438303966653735613036633132223b7d7d, 1762247103),
('277394e5b3fcef502b4354ba5fc811bb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373737322e3534313137333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223237373339346535623366636566353032623433353462613566633831316262223b7d7d, 1765047772),
('279467da5b02af345fb64d61d7a5fe0f', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333733333132352e333833383637303235333735333636323130393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223237393436376461356230326166333435666236346436316437613566653066223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333737363332353b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223437346664343066343131343232356335663237663230623934353735646136223b733a33323a223235373734353763396163326130353364643661323638653665643236376463223b7d733a343a2268617368223b733a36353a2232353737343537633961633261303533646436613236386536656432363764632d3437346664343066343131343232356335663237663230623934353735646136223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763733125),
('28346b9d9a0559decb8696a711031ed0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373439322e3336343733383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223238333436623964396130353539646563623836393661373131303331656430223b7d7d, 1765047492),
('295354071a1ed334cf3d6d6955fe0275', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234373733372e31353031353530363734343338343736353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223233633339613362303338396265333365393363636137646330613461343730223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239303931343b7d7d72656469726563745f75726c7c733a33343a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223530626465656238633339623830623635356461373437643236653466643930223b733a33323a226430633536323061353332306336386333643338373566393264393734656365223b7d733a343a2268617368223b733a36353a2264306335363230613533323063363863336433383735663932643937346563652d3530626465656238633339623830623635356461373437643236653466643930223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762247737),
('298913a7a2190ba2e9724eaef5be1fe1', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333435363332322e36363930333230393638363237393239363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223036666234623439653433656661386438333833376463666130323431633065223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323932393235343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323933333731383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323932393239383b7d7d72656469726563745f75726c7c733a33343a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226437643665303136636634326333303437306661376133323535666130343935223b733a33323a226338633735643535386163343566376332306461613162373834643634376530223b7d733a343a2268617368223b733a36353a2263386337356435353861633435663763323064616131623738346436343765302d6437643665303136636634326333303437306661376133323535666130343935223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223566663536363737363462306236353366343335643537363433356133326236223b733a33323a223465363164323563663633626565626261383239383736323634363939303037223b733a33323a226531643637363435636639623735363233653836616335343861306532373733223b733a33323a223864643137653538383738636430626338323931663261613861393666326364223b733a33323a223837346165623430346134663030613639346534363363643133636233663565223b733a33323a226535653865376638323736633836656464313330613761633033316430366239223b733a33323a226261363237646665653031353262643163636461613539613938316465343565223b733a33323a223634326166313131666665663738643637383366643335396264373636323532223b733a33323a223438343832313633613535653333383262393131633633623765373634353866223b733a33323a226234656531373134333466356430656433333036393965343532373632653434223b733a33323a226532313361663363306633366562323534303861383239323631643136616561223b733a33323a226361376363353634383636356661313835663735616636616364363136633434223b733a33323a223265366535353861636432336236633030656564666236386262303366376335223b733a33323a223362653834393461613534393632386635333962383862636566633266363836223b733a33323a226539326665633764646364306563323432383865303263643763613531636566223b733a33323a226531393734303765636337383036633832303065316230316231366635656633223b733a33323a223837653964376537396639633162613165623937333863616639633266393534223b733a33323a226232636333376232643861653633626633656266383462626339373962333136223b733a33323a223264316535396165376338656534333833393638373862373935656638333639223b733a33323a223333383230643939376265323336613236613938623962643439663761383036223b7d733a343a2268617368223b733a36353a2233333832306439393762653233366132366139386239626434396637613830362d3264316535396165376338656534333833393638373862373935656638333639223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226561383535373533626331653332383462353636363061356336373336623135223b733a33323a223339363336386338636338626237343561666235653661376135626166323237223b7d733a343a2268617368223b733a36353a2233393633363863386363386262373435616662356536613761356261663232372d6561383535373533626331653332383462353636363061356336373336623135223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763456322),
('2a58e6639dba6e8e336711bce4d11ccf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333930363432382e37333638393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223261353865363633396462613665386533333637313162636534643131636366223b7d7d, 1763906428),
('2d81171f2bc142bf6a9658367a9e5ec9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343431353434302e3437303533313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223264383131373166326263313432626636613936353833363761396535656339223b7d7d, 1764415440),
('2fb8eccbcc67c49d43cb0bce951de59e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333332393436312e34333035363339323636393637373733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223266623865636362636336376334396434336362306263653935316465353965223b7d7d, 1763329461),
('30a4b36b2183752d8b1091b3259a732f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333630383133312e353439303831303837313132343236373537383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223330613462333662323138333735326438623130393162333235396137333266223b7d7d, 1763608131),
('3142d0af6929aeb9099cc0078e743a28', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323930343438372e313436393632383831303838323536383335393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223331343264306166363932396165623930393963633030373865373433613238223b7d7d, 1762904487),
('3177ed34a6b6b5415c22baf3a1217e02', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343430383736392e3038333239323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223331373765643334613662366235343135633232626166336131323137653032223b7d7d, 1764408769),
('31ea4b49624e9bc1e6ecb8ae7a4fc1c6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333737353732362e393533343330383931303336393837333034363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223331656134623439363234653962633165366563623861653761346663316336223b7d7d, 1763775726),
('3261b8092860bdbce5492da6fd213fc7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323237313935382e3038343032313039313436313138313634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223332363162383039323836306264626365353439326461366664323133666337223b7d7d, 1762271958),
('328a870d6f8ce7496b693263ba189819', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323333373535352e343431333234393439323634353236333637313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223332386138373064366638636537343936623639333236336261313839383139223b7d7d, 1762337555),
('33b2575ca80706c02c7d617216e7419f', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353233393438362e3433303435323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223236373738363361623165626462356364303334623962663838626432616433223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736353233353236323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736353238323133393b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223334643862653438326365336361353736613362663963633866626130383132223b733a33323a226563326437323833646263333135323063343934376431313261313065396237223b7d733a343a2268617368223b733a36353a2265633264373238336462633331353230633439343764313132613130653962372d3334643862653438326365336361353736613362663963633866626130383132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32323a7b733a33323a223734303166303263313731646337663766663462373732663131316638663734223b733a33323a223666653630393533636264656530636164666465396462666464306264376361223b733a33323a226664303333306364316330646333616665393133633536346366326230376433223b733a33323a226239366338363932613132346463636463613131633937366463653464356530223b733a33323a223866636435383437316333363838316137363539396162663335336564353634223b733a33323a226533643930653638323762643263383930376337643033356362666165653161223b733a33323a223566633636343438363563616330376362303837333565616439663338303161223b733a33323a223866306230336336636364306534653330393139383130346439346639363935223b733a33323a226437373638333266393763653463666539633162633235323534333139663162223b733a33323a223738323730626665646537323338343735663833323064396634356330633136223b733a33323a226134353364343234343038383533613032656235316162333632303138383435223b733a33323a223534383066336133366338653762396138613437356333323532383034366262223b733a33323a223366653132316536626532633964336133643936616335633831626533363163223b733a33323a223063643939633036373534633439643433376230303761326338353965383339223b733a33323a223363376338306166356261356534316530386135333930336461626134316135223b733a33323a223631386162386163336364623230363166633730346331343265633636396332223b733a33323a223933353437393166346437356233383464363332316166636334333936383033223b733a33323a226465633766363639383562636438333233653130303630643033356236663230223b733a33323a223737653433353033303837326132373731326434313963386530363634663630223b733a33323a226330653662346565363536333737663233333462386338626434326333383336223b733a33323a226666303732376161393630376436646139306164346330376431336433653864223b733a33323a223134356362306537353065363333353163633963646361616566333736643430223b733a33323a226237666639366439653238333538656331393061656538353337343637386337223b733a33323a223636333566656436353062613864643638343862333336356433613837336639223b733a33323a223531316232353639646365323936623235333463656361663131393130373165223b733a33323a223739613663336630353563363739643237623863636130656236316531323063223b733a33323a223561383335373534376630623233303763316163393834373838313233616132223b733a33323a223338633532373263353464633933313466613435626337316632353962633262223b733a33323a223461376337633239306262306264643631623538366230663763343237643939223b733a33323a223635666231313865336136383239353261333132383130353561353465333637223b733a33323a226134643962383130303566393636323638633562363365646130303738656666223b733a33323a223831323563616436643637303864623664353230666264343465353135613830223b733a33323a223333633065373366363534366462646234343632363264643765616566336233223b733a33323a223733313564393534326630353563666462333966306461643130383534623936223b733a33323a223361373732336236353734636465323562653665353635373363633830303461223b733a33323a226339653330633564323665363464633933613164356432343538373562356135223b733a33323a223362396565613531363732383936633536303864633534343531396239623335223b733a33323a223431393063363466626532633731356536623836633935303831376238333232223b733a33323a226462326436633036633966353236383533383135666539326362313939323132223b733a33323a226561316464353931333463643937313739333734313861613138663732326265223b733a33323a223137666133333163366433326438616162373430306664656133356562316665223b733a33323a226563366231313435326163306432653466613031323231386533663333353632223b733a33323a223861616230316331343863333638376632643364366236353533626465363338223b733a33323a226637613635656265613837303965343565346537643039386330623963643065223b7d733a343a2268617368223b733a36353a2266376136356562656138373039653435653465376430393863306239636430652d3861616230316331343863333638376632643364366236353533626465363338223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1765239486),
('33d32d75725573bd7e1780f3263e0828', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373737322e32313438313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223333643332643735373235353733626437653137383066333236336530383238223b7d7d, 1765047772),
('33e8cec77b9a539269f342c1d4d4c63b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343933373432322e3735353735313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223333653863656337376239613533393236396633343263316434643463363362223b7d7d, 1764937422),
('3437131b6cb1c8355adfbf1a15c753ac', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343430383736342e3435313337373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223334333731333162366362316338333535616466626631613135633735336163223b7d7d, 1764408764),
('35b8a8ea48b248f619333c9659dc9dbe', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333532323536372e32353834313939393035333935353037383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223335623861386561343862323438663631393333336339363539646339646265223b7d7d, 1763522567),
('35fc1acbfabb597efd330dbb5ecdd87f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333438303435362e363532313938303736323438313638393435333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223335666331616362666162623539376566643333306462623565636464383766223b7d7d, 1763480456),
('397a5d68ebc47a53484a7efa4591992d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323431323434342e353535333232383835353133333035363634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223339376135643638656263343761353334383461376566613435393139393264223b7d7d, 1762412444),
('3a489f9fd5f1510ce6e2ac382d4a0919', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373233312e3939393630313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223361343839663966643566313531306365366532616333383264346130393139223b7d7d, 1765047232),
('3ac19455565635e4abe540961f6878ed', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323735333337322e353634313030303237303834333530353835393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223361633139343535353635363335653461626535343039363166363837386564223b7d7d, 1762753372),
('3b581b245893a32398fe63251f5db35b', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333934313432342e3630363331393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223330663332313630633138373631303461303163383162383032366634333534223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333938343431333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333938343632343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333938343437383b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223463353939333763336365363963373738393433306235383836363536643566223b733a33323a223931626665666135343536396238363737653639386335316663343461386261223b7d733a343a2268617368223b733a36353a2239316266656661353435363962383637376536393863353166633434613862612d3463353939333763336365363963373738393433306235383836363536643566223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a223730623732393463323062393236333631376433313439383361323963393037223b733a33323a223237623739663163393638333032383231343932623065633536666537323830223b733a33323a223163646239396631386362373864336533333538653732393634643362633536223b733a33323a223435613834376665616262653062613035333265333562656635656164376165223b733a33323a223233396564666131353464646334366134336461643032646331656139633832223b733a33323a226635646534306239306161346566346539623866386633663534656563643935223b733a33323a223863376531373061346232636630383134633733326162613361316161646530223b733a33323a223137323861393266336131356633666536656231613235356639333939643932223b733a33323a223561616531366262643962663637316232636165376664353262396331373632223b733a33323a223437376462633361363231336562383038636262623036633965363835656134223b733a33323a223565666639663730666363316334346664633561363738303364666534376339223b733a33323a226633323839313135386630313133303935646330333938656437343339373861223b733a33323a226137373031393039653164646361393064366437336238663230633337343736223b733a33323a223061303564643534326563666166373736653736663766393030373839346633223b733a33323a223239383833373665353136363232363939633234353530656438363866393336223b733a33323a226334633565353066366435653363663865656664313663663334376166666130223b7d733a343a2268617368223b733a36353a2263346335653530663664356533636638656566643136636633343761666661302d3239383833373665353136363232363939633234353530656438363866393336223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223831643562646430333537336363633362323032386138326366653239393561223b733a33323a226163393838616235326663366466383735396137656665363561633532383034223b733a33323a226131326135326131303435373463366562396234363535383233616336616136223b733a33323a223331376332313031323066626334366164643964366563633330323935663861223b7d733a343a2268617368223b733a36353a2233313763323130313230666263343661646439643665636333303239356638612d6131326135326131303435373463366562396234363535383233616336616136223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763941424),
('3c3390da6264d0b9bcd8d43e2c171ae6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333335333039392e303133393330303832333231313636393932313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223363333339306461363236346430623962636438643433653263313731616536223b7d7d, 1763353099),
('3c6fe89b5f2f22d08613de1b92a5d870', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343737343938322e3833323935343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223363366665383962356632663232643038363133646531623932613564383730223b7d7d, 1764774982),
('3dc9a7c22b76dd552952fefe067dc67c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034383238342e37343934383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223364633961376332326237366464353532393532666566653036376463363763223b7d7d, 1765048284),
('3f272669a349b4f856f4fbdfb8e02ad9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333536302e3637353532373039353739343637373733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223366323732363639613334396234663835366634666264666238653032616439223b7d7d, 1763303560),
('3f3ecba39cff306736ff453a69294b73', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333536302e393531343933393738353030333636323130393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223366336563626133396366663330363733366666343533613639323934623733223b7d7d, 1763303560),
('409e161aff5ebb9062e020cb4ad8a29e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333034303332342e3537383137383838323539383837363935333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223430396531363161666635656262393036326530323063623461643861323965223b7d7d, 1763040324);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('41450d274de8cb5d4680aac357d30fac', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353139303933322e3531343138323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223962323134366562323736343131316331346237633433396139633736333634223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736343938303439303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736353233343130303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736353138353036303b7d7d72656469726563745f75726c7c733a32323a22687474703a2f2f6c6f63616c686f73742f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223361393862383966316332336437666431623936366362646135303864663535223b733a33323a226336333335353633333364396432303037653466363531626366373832346135223b7d733a343a2268617368223b733a36353a2263363333353536333333643964323030376534663635316263663738323461352d3361393862383966316332336437666431623936366362646135303864663535223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226165366235326330663137616138663863633233646461396539353336306135223b733a33323a223062323537323465613331656364303636346164663036363231303034306133223b733a33323a223739396332643338383931666163373362333237663561613530363762353961223b733a33323a226164623761323133333035616162316263393666613563336465623666633030223b733a33323a223565386531383531313462366663653630363366643939626463613461313938223b733a33323a223162373866396166386634363761616162326537313936616232623133323131223b733a33323a223066353138643764336664626334356261393731323961393261613561623262223b733a33323a223162343961366632393534393237373732363939363039626237316661373232223b7d733a343a2268617368223b733a36353a2231623439613666323935343932373737323639393630396262373166613732322d3066353138643764336664626334356261393731323961393261613561623262223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a223565356431666465376139353939363033336364353638376366646632646430223b733a33323a223264386633333235626439316139326434366237353331323736393633616334223b733a33323a223066336434386532343039376136313362383231386163303138663537356666223b733a33323a223562663863663836383136373461666636353438323530626663356236333135223b733a33323a226261646534343832346235396433353162623766333066363837306135643433223b733a33323a226233653136393738363166373936656265323239666233633639633835333766223b733a33323a223132336430313430663439613961653466623339656637306263343637373434223b733a33323a223362313734626231636636343762313662623238396161613838616130613630223b733a33323a226335306631626435663833613937366532333335663137363864373034616533223b733a33323a226232373363323236663636353932316366616133613066633238613632653936223b733a33323a223439363439663633636230376432356133663765353636306261363331646233223b733a33323a226665613934653563363638303239613532366464356363316430653266393762223b733a33323a226132326466653732633933326333633138316530373737363132303039353333223b733a33323a226339333663653739316135323664366538333038376165653836363565303437223b733a33323a226339313365376162323764363137633363313138363039623136353663643761223b733a33323a226238376566393938303739383663323638653133363032363465356266303535223b733a33323a226235366334626332626632303562323538363332373266356530386131353439223b733a33323a223439663061303234343937326337666665643331633639623233356661326562223b733a33323a223936366137393633623331313263663233303666336133643331616665343439223b733a33323a223866336564623336376633643930373764393866616633663439386339363366223b733a33323a226562656330623132633563383137346632643037386638616138303861336330223b733a33323a223833333932356366393935306534623935343634633936353534313461376532223b7d733a343a2268617368223b733a36353a2238333339323563663939353065346239353436346339363535343134613765322d6562656330623132633563383137346632643037386638616138303861336330223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1765190932),
('435b0748a30ab62d15ef697a4cbdb482', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343337383133332e39323035333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223433356230373438613330616236326431356566363937613463626462343832223b7d7d, 1764378133),
('4370225eae6f6e7b5e6cddfaf1f6c394', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353035353937392e3430343132333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223433373032323565616536663665376235653663646466616631663663333934223b7d7d, 1765055996),
('440f3e85bf710b3780e9d83f2ecb30ce', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343430383736382e3931323731363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223434306633653835626637313062333738306539643833663265636233306365223b7d7d, 1764408768),
('44c83dc5ec8a2b2b0b8cdd5e8bcf0b4e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343431333537312e3030393539363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223434633833646335656338613262326230623863646435653862636630623465223b7d7d, 1764413571),
('464421110d06dc00c41cea8daa2dd1d7', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353139313835312e3431393439353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226639666131626138333366643364336135366536633432396462383033653666223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736353233353032353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736353233353034383b7d7d72656469726563745f75726c7c733a32373a22687474703a2f2f6c6f63616c686f73742f61646d696e2f6974656d223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226163646333326666653034623032643333333635623437356430353434376234223b733a33323a226361626261373030326234373366663332353564323762346264366431353436223b7d733a343a2268617368223b733a36353a2263616262613730303262343733666633323535643237623462643664313534362d6163646333326666653034623032643333333635623437356430353434376234223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226136623166336661316439613239623230306363343333616464643737633636223b733a33323a223533343533333361323936323466633333393663663962306463363135303731223b733a33323a223231306236376666353263393038336562306564663534666437646338363765223b733a33323a226661373064663262373635316637343462663637636333303033333030323162223b733a33323a223235386431393864613334633062363530393935366264633231666133356339223b733a33323a223863313638616266666163316335656234396139643138383930376164356564223b733a33323a223563646335343439376630353661333332376462616230386635373363346662223b733a33323a226265383237353366666137333462313133623761653865353039613664623830223b733a33323a223230303233633331373236376431616434353566336639633430356639346333223b733a33323a226531303234353065316664343834623134646665653961313834373734303531223b733a33323a226263313136616236633961666536643533623739363661386131326166383465223b733a33323a223237386539373436303464363162613065316362383462303761653963353261223b7d733a343a2268617368223b733a36353a2232373865393734363034643631626130653163623834623037616539633532612d6263313136616236633961666536643533623739363661386131326166383465223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1765191851),
('47456f13f31d9604a490f9b34a0ee196', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343430393032332e3835383437363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223437343536663133663331643936303461343930663962333461306565313936223b7d7d, 1764409023),
('4762f5f1bab03f52881c8f0a878374e5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353134323936362e3534393133393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223437363266356631626162303366353238383163386630613837383337346535223b7d7d, 1765142966),
('47cd269a0ae0a84d749bc32484d868ee', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373234372e3432363333333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223437636432363961306165306138346437343962633332343834643836386565223b7d7d, 1765047247),
('4a7da9d3e8c0f2299242d3417ec64c0c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323432373437322e35323030313039343831383131353233343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223461376461396433653863306632323939323432643334313765633634633063223b7d7d, 1762427472),
('4b583c17eafdb9528492e49c1199b2c1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343431323539302e36363139313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223462353833633137656166646239353238343932653439633131393962326331223b7d7d, 1764412590),
('4b95d09e95f9fc710e593ef3a87236f3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323032393539372e3730323736343033343237313234303233343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223462393564303965393566396663373130653539336566336138373233366633223b7d7d, 1762029597),
('4dae21bb5387e3c90b3801395532f969', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323030333137352e363235373236393338323437363830363634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223464616532316262353338376533633930623338303133393535333266393639223b7d7d, 1762003175),
('4eef3eb826584a6cb87b4bc602131fa2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333436323934312e3836383731323930323036393039313739363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223465656633656238323635383461366362383762346263363032313331666132223b7d7d, 1763462941),
('4fdcc4a7038b55c4cc000bc784be1ace', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239332e363836343134303033333732313932333832383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223466646363346137303338623535633463633030306263373834626531616365223b7d7d, 1763304293),
('506fb7ba4b8d896f9e6fdbeb1b88d4df', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333332393436312e343330353839393134333231383939343134303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223530366662376261346238643839366639653666646265623162383864346466223b7d7d, 1763329461),
('5109d93a5643f74403a8b9982af502ad', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353230313937382e3835343134343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223531303964393361353634336637343430336138623939383261663530326164223b7d7d, 1765201990),
('527166fd19594d163a73012496494b74', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353233343235392e3837313034393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223532373136366664313935393464313633613733303132343936343934623734223b7d7d, 1765234270),
('53e177d5ea0639ceec08e8fd323b36f4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323138343831372e3634393739363030393036333732303730333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223533653137376435656130363339636565633038653866643332336233366634223b7d7d, 1762184817),
('54d090b83ce2c3ff417c57cdd9bfc7bd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343038333337362e3630363837393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223534643039306238336365326333666634313763353763646439626663376264223b7d7d, 1764083376),
('55d4f0b1753039c58feda44d7f1c5ea6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333438313332312e3030373135343934313535383833373839303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223535643466306231373533303339633538666564613434643766316335656136223b7d7d, 1763481321),
('58dc985234dd3aa95dacc087b4ee8ce0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343337383232342e3133313238363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223538646339383532333464643361613935646163633038376234656538636530223b7d7d, 1764378224),
('590e940ce1eb415618216d3250f97e0b', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235313630382e313134383735303738323031323933393435333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223539306539343063653165623431353631383231366433323530663937653062223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239343830383b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226633333766386233326665306536353963643163386138373838353338633831223b733a33323a223734633661653430306631353832333339326465383864616534623139376363223b7d733a343a2268617368223b733a36353a2237346336616534303066313538323333393264653838646165346231393763632d6633333766386233326665306536353963643163386138373838353338633831223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762251608),
('5aa49a2c2b7c05edb08d36d55c922f90', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333930373333312e3033383637373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223561613439613263326237633035656462303864333664353563393232663930223b7d7d, 1763907331),
('5c0cf6657c2f84bb7e23ec3611433e09', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343933363236382e3233383534353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226636633138613032376438613231623236636364346365353035383166333035223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736343031383232383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736343937393436383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736343937373738333b7d733a36353a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f457874726163744d657461646174615f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313736343432313437373b7d7d72656469726563745f75726c7c733a32323a22687474703a2f2f6c6f63616c686f73742f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226534313265613238313864376437353734393031653264663931333639626235223b733a33323a226361636565373531643933396532393432623632326537346537306335653964223b733a33323a226534306339363934376635613862343534376332636165366631306431653431223b733a33323a226138656663656334336339366330663465306131336563633063656463376637223b733a33323a226137333031313938653766613737663939633466393737303738356536633236223b733a33323a223439666335643931386363653637323334326531376131646137663835313930223b7d733a343a2268617368223b733a36353a2234396663356439313863636536373233343265313761316461376638353139302d6137333031313938653766613737663939633466393737303738356536633236223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223930356138356535343831336164343566393838393866303830383130383661223b733a33323a226466383463656338336263373662353931633964383737353832663862356466223b733a33323a223434353031613135373634353161393134316663353330396631363839653335223b733a33323a223133626364643362346331366564356231316531386263353234346132383936223b733a33323a223330363766666233336538343739313631386163613866666563383331306464223b733a33323a223539623438363631346432383431626666336136623366626332636665336337223b733a33323a223835613131346337636633383431623530333835636366323662653636616564223b733a33323a226264626662646661366233353134656537653162386535373130343336376565223b733a33323a223461623532373261326664646635373165376161383138653431623835306466223b733a33323a223436363662633666353536396639333631356532376433663164656230356466223b733a33323a226466333762326138616264646631666130383561663432303862366135373036223b733a33323a223636666161666365646335373864633437633765356330323330336166643932223b733a33323a226465323635633861376535653134333131336662623533643537633937303461223b733a33323a223533666466303161613836636266373963303833383266323431393939623062223b733a33323a223232343139663861616262626239396136613933636263623337343432343439223b733a33323a223435646433343234393132343831653438386139393039393261666639336536223b733a33323a223139303332633439333334313833306363373035306165653434356662323138223b733a33323a223364376335646233343131373134636630376466343066663138323335356238223b733a33323a223039623661393466636661346132376434373763383636343566636333616239223b733a33323a223365366461363931653661303864663361306264363662373337626461633539223b7d733a343a2268617368223b733a36353a2233653664613639316536613038646633613062643636623733376264616335392d3039623661393466636661346132376434373763383636343566636333616239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223561633364366234353065393039343633303032663639353531323466616232223b733a33323a223534343962323765303331666239626639313561646266396537336461346130223b733a33323a226561396431383339363662666239626630333737626263646363666135366636223b733a33323a226630326535646464383532623661366234663134323061366362356536326534223b7d733a343a2268617368223b733a36353a2266303265356464643835326236613662346631343230613663623565363265342d6561396431383339363662666239626630333737626263646363666135366636223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f457874726163744d657461646174615f636f6e6669677572655f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223138313036643865653532336238626336663762363661373665326438633136223b733a33323a223636626332623536396638353235353634316565393532373036646630313538223b7d733a343a2268617368223b733a36353a2236366263326235363966383532353536343165653935323730366466303135382d3138313036643865653532336238626336663762363661373665326438633136223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1764936268),
('5cf13f551c6cc9788e08279cfcb1592f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373035302e3338343031323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223563663133663535316336636339373838653038323739636663623135393266223b7d7d, 1765047050),
('5d1318e5211e2d2cef9a31edbe7345d7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323433363738342e313935313030303639303436303230353037383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223564313331386535323131653264326365663961333165646265373334356437223b7d7d, 1762436784),
('5deb4ce44c0dd3c524784ecc2d2e9e05', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343834313031342e3732393138363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223564656234636534346330646433633532343738346563633264326539653035223b7d7d, 1764841014),
('5e0d850ac8af9c719cfb760dce4fc547', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353134333234342e3230323439373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223565306438353061633861663963373139636662373630646365346663353437223b7d7d, 1765143244),
('5e9826e111249c71346ef720fb31439a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353133383038302e31303630373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223565393832366531313132343963373133343665663732306662333134333961223b7d7d, 1765138080),
('5f52083c68ce7b4483635475e7e60f49', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333136323130302e363835303535393731313435363239383832383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223566353230383363363863653762343438333633353437356537653630663439223b7d7d, 1763162100),
('5f5dd5a5f050e8c992853d90ef106e0d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034363932362e3836333939393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223566356464356135663035306538633939323835336439306566313036653064223b7d7d, 1765046926),
('6041197e4eb07496f3d59869e39e46fa', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343038333830302e3038393131333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223630343131393765346562303734393666336435393836396533396534366661223b7d7d, 1764083800),
('61b0f8a2da456d2c593b69e63c44928a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333739343332322e303537313833303237323637343536303534363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223631623066386132646134353664326335393362363965363363343439323861223b7d7d, 1763794322),
('63ebf4a78609b72d16bacf0bdf17f264', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373436332e36373838393439393636343330363634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223633656266346137383630396237326431366261636630626466313766323634223b7d7d, 1763237463),
('646ecd3dcaa0b06a7ae7b26086f38511', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323030333137332e353530333539303130363936343131313332383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223634366563643364636161306230366137616537623236303836663338353131223b7d7d, 1762003173),
('65bc640c700558b062a62edeb48406b8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353133383038302e3035333630353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223635626336343063373030353538623036326136326564656234383430366238223b7d7d, 1765138080),
('663503c10359b233c8e53c58ebd38c02', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373035312e36333839393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223636333530336331303335396232333363386535336335386562643338633032223b7d7d, 1765047051),
('66c7b563cc4a7098c199b5660bfeebf1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373438352e38393734333930303239393037323236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223636633762353633636334613730393863313939623536363062666565626631223b7d7d, 1763237485),
('67107fe17162744a839aee75e3088e76', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353133383038302e30393839353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223637313037666531373136323734346138333961656537356533303838653736223b7d7d, 1765138080),
('67ffca53047e90547a32ea347192543a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353133393438312e3836333838343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223637666663613533303437653930353437613332656133343731393235343361223b7d7d, 1765139481),
('6b5921c29f32780831eca59635366d25', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353133393438312e3833313639313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223662353932316332396633323738303833316563613539363335333636643235223b7d7d, 1765139481),
('709011b5c256aa73ed76d8ecfb4669b5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373837392e3038393731333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223730393031316235633235366161373365643736643865636662343636396235223b7d7d, 1765047879),
('70fda1981e30d52348f1646c33dda9d4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034383436332e3634353930313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223730666461313938316533306435323334386631363436633333646461396434223b7d7d, 1765048494),
('727f8605b90069773699ae2373b8e8cf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343430383736332e3333393732333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223732376638363035623930303639373733363939616532333733623865386366223b7d7d, 1764408763),
('72a6231a0009c2e905d6a7771791f5c4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343431343238322e3133363633373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223732613632333161303030396332653930356436613737373137393166356334223b7d7d, 1764414282),
('7443064afc35b8a8e33338773be5f4c5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343431313139352e3433323334353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223734343330363461666333356238613865333333333837373362653566346335223b7d7d, 1764411195),
('75791c9137c1e60c1d3feddbcb923395', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343234313636392e34373033323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223735373931633931333763316536306331643366656464626362393233333935223b7d7d, 1764241669),
('765f3008805bb819ab3819f1c8304c69', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239352e333534323532303939393930383434373236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223736356633303038383035626238313961623338313966316338333034633639223b7d7d, 1763304295),
('7821689d20c14ebce0b3b8d20d1189d6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343431343835322e3235363531393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223738323136383964323063313465626365306233623864323064313138396436223b7d7d, 1764414852),
('7893be82f5ed4d7125bc00c569c02cdf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333537353836302e3532363938383938333135343239363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223738393362653832663565643464373132356263303063353639633032636466223b7d7d, 1763575860),
('799ce6342c73de00e4be5d409f1e796b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373837372e3336383035383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223739396365363334326337336465303065346265356434303966316537393662223b7d7d, 1765047877),
('79c6c7af1711b9234e08b2485a81e4b5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323735333337312e3837393638313131303338323038303037383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223739633663376166313731316239323334653038623234383561383165346235223b7d7d, 1762753371),
('7a1e7346987e8de89e457f2a0c6908b2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323136393532382e333735323831303935353034373630373432313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223761316537333436393837653864653839653435376632613063363930386232223b7d7d, 1762169528),
('7aa19563961bb9ba2d41b2c5560eb72f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353134363336322e3833363836333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223761613139353633393631626239626132643431623263353536306562373266223b7d7d, 1765146580),
('7ed6ac29bb37af10a8680341d772b911', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343430383736342e3034343834323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223765643661633239626233376166313061383638303334316437373262393131223b7d7d, 1764408764),
('7f1963025f0c1e732fe3b013ff5b9c6d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343636343838352e3634363433383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223766313936333032356630633165373332666533623031336666356239633664223b7d7d, 1764664885),
('7f559b55bb36ca9c577647e91a0f0703', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333132343235382e343534383239393331323539313535323733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223766353539623535626233366361396335373736343765393161306630373033223b7d7d, 1763124258),
('7fcb0d116274463d4c441d37ed87969a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034383734372e3430383230353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223766636230643131363237343436336434633434316433376564383739363961223b7d7d, 1765048761),
('815428a06d4aa15b657abbe7820efb43', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373737312e3439333238343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223831353432386130366434616131356236353761626265373832306566623433223b7d7d, 1765047771),
('81563ca3cf8ebab7a151f5aa7bd550bf', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373035312e3039393430373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223831353633636133636638656261623761313531663561613762643535306266223b7d7d, 1765047051),
('81bee96d2c66ef7e1ceb25543018e498', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373737322e33383234313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223831626565393664326336366566376531636562323535343330313865343938223b7d7d, 1765047772),
('83b1aad66b8f5e2b5ecc1832ec112d17', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323433343834372e35333037333430363231393438323432313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223833623161616436366238663565326235656363313833326563313132643137223b7d7d, 1762434847),
('86a98d4ca0bbed13930ef0b22d1c44a3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323838363038382e3532383535333030393033333230333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223836613938643463613062626564313339333065663062323264316334346133223b7d7d, 1762886088),
('87b6c9df1fc7de019bec68873a308d93', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353035333435392e3935373032333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223837623663396466316663376465303139626563363838373361333038643933223b7d7d, 1765053475),
('88c39796cbd0ec52393e44d28a88bd9c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333733333132352e303535383434303638353237323231363739363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223838633339373936636264306563353233393365343464323861383862643963223b7d7d72656469726563745f75726c7c733a33393a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e2f6974656d223b, 1763733125),
('8a8faf3e17103e5391e51ad0932b48fc', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343338303530392e3032303338373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226561663464303536643139373262666137613139346238363333643338313434223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736343432333639393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736343432333730393b7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f61646d696e2f6d6f64756c65223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226462346536333336323035626633636335646664356663336334373465623633223b733a33323a226466393161356537353362373866306336363233653863386634393038343634223b7d733a343a2268617368223b733a36353a2264663931613565373533623738663063363632336538633866343930383436342d6462346536333336323035626633636335646664356663336334373465623633223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226533633737353230353232306166666661353136353963636633623533386336223b733a33323a226233633931323135333732363738306230336431656138353765323263636532223b733a33323a226335386530663065393131653364363163653665643563353832653131353934223b733a33323a226561633962313132383762613864393439316430613462353933323231303536223b733a33323a226535303664376336393266653238656338383537633564323931303238333838223b733a33323a226363373631626436613733616364616337303666376136656439396239643637223b733a33323a226638363664396431326562396361323861646464653035653130343031623034223b733a33323a223035623364366439386336326533313166333739303031353034613665633132223b733a33323a226330313937626163363631646232666336646439636563646364366538363033223b733a33323a223132643434393134373832356533626361663834656138326539313363396633223b733a33323a226531353336643837623265613766373966626139396563383862353336396635223b733a33323a223134396234636563326638316435383061386565623138633664666565353863223b733a33323a223265303230303763623732626236353066306337316637626437306661646334223b733a33323a223735323631643762636166613032373966636238313930363634626137666664223b733a33323a223137363565336561313230353635356361323739326666616661383464636261223b733a33323a226333326234333233373437343833373235346436613931303137383261363565223b7d733a343a2268617368223b733a36353a2263333262343332333734373438333732353464366139313031373832613635652d3137363565336561313230353635356361323739326666616661383464636261223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1764380509),
('8b111168c109e61e7afb9847e79ba4da', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373837392e3435323338313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223862313131313638633130396536316537616662393834376537396261346461223b7d7d, 1765047879);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('8db78b109b248c27a7e4122a3ae2e7f3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333338333130312e31363239383030373936353038373839303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223864623738623130396232343863323761376534313232613361653265376633223b7d7d, 1763383101),
('8feef7715979d01dc4c06aa4db6f8e56', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373434372e393836343639303330333830323439303233343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223866656566373731353937396430316463346330366161346462366638653536223b7d7d, 1763237448),
('9012ee1798ce710f24ef28a58edf28d3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353233383539312e3937313532353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223930313265653137393863653731306632346566323861353865646632386433223b7d7d, 1765238603),
('90a1b7eac77da2b3f2baf4fb120d97a0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343933373434392e3133393931363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223930613162376561633737646132623366326261663466623132306439376130223b7d7d, 1764937449),
('9122120a365e59bf923bf66950dccfd4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373435382e393138373631393638363132363730383938343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223931323231323061333635653539626639323362663636393530646363666434223b7d7d, 1763237458),
('91842ce85f3d9d4a7346b87e30c55910', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343430383736342e3133383131333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223931383432636538356633643964346137333436623837653330633535393130223b7d7d, 1764408764),
('91895c7eee213be27b448c30036dfc7d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343636343837392e3131313039323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223931383935633765656532313362653237623434386333303033366466633764223b7d7d, 1764664879),
('9196bbfbb7ec14bd4e753d1b127545d2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333536302e333935323139303837363030373038303037383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223931393662626662623765633134626434653735336431623132373534356432223b7d7d, 1763303560),
('9304b6b4507226b30f7bd8da2f72c483', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353233383534302e3234313833363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223933303462366234353037323236623330663762643864613266373263343833223b7d7d, 1765238553),
('94737adf1aefd1de8d6d54a3a2ceb197', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239352e3036383435393033333936363036343435333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223934373337616466316165666431646538643664353461336132636562313937223b7d7d, 1763304295),
('95ca9f05e5b1509e42a88b1b95575ae0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343038333337362e3635393930313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223935636139663035653562313530396534326138386231623935353735616530223b7d7d, 1764083376),
('980fb7ed78bd6971bb6b7cd6b1e6ed30', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333434323038312e383238393533303237373235323139373236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223938306662376564373862643639373162623662376364366231653665643330223b7d7d, 1763442081),
('9b209f1f8be4b6ce1cfe154fae7b1c18', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333536312e32323337393538393038303831303534363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223962323039663166386265346236636531636665313534666165376231633138223b7d7d, 1763303561),
('9c81eacfb822ae3f60a71e0b441a5c12', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239332e3431303431393934303934383438363332383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223963383165616366623832326165336636306137316530623434316135633132223b7d7d, 1763304293),
('9ce20eea81ad2fe287f3d87275500ba8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333535392e353539343132303032353633343736353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223963653230656561383161643266653238376633643837323735353030626138223b7d7d, 1763303559),
('9efe9705fca58deb9e312e67a2b2e707', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373035342e3134333736333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223965666539373035666361353864656239653331326536376132623265373037223b7d7d, 1765047054),
('a025a1dc4d1c91573d56506e096da6e1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373837372e3936323536373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226130323561316463346431633931353733643536353036653039366461366531223b7d7d, 1765047877),
('a09b9161f618c7004b57dad80ec64816', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323032353631302e3836383935383935303034323732343630393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226130396239313631663631386337303034623537646164383065633634383136223b7d7d, 1762025610),
('a162c7b3fa92ea7f030687328663bdc7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373737312e3836373133333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226131363263376233666139326561376630333036383733323836363362646337223b7d7d, 1765047771),
('a18459dbd8530f124eeca22c8e7e432b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343038333337352e3133323839393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226131383435396462643835333066313234656563613232633865376534333262223b7d7d, 1764083375),
('a1b9152df8446bb21354e4e0d5d07a44', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373035382e3638333230393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226131623931353264663834343662623231333534653465306435643037613434223b7d7d, 1765047058),
('a246c242d22560f77352b1f967233751', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323030333234362e353530343432393334303336323534383832383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226132343663323432643232353630663737333532623166393637323333373531223b7d7d, 1762003246),
('a32838a1a549734617fdeed17b41f8b2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353233303739342e3732303837313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226133323833386131613534393733343631376664656564313762343166386232223b7d7d, 1765230807),
('a4440488f7796c3000976185f15f5deb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333834353034312e353334343434303933373034323233363332383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226134343430343838663737393663333030303937363138356631356635646562223b7d7d, 1763845041),
('a5353f362379a44584ba6b5e7f89c170', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353035343137362e3635353531313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226135333533663336323337396134343538346261366235653766383963313730223b7d7d, 1765054176),
('a5de3511e60bd25b15929e1bcf86348d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373737312e36393833393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226135646533353131653630626432356231353932396531626366383633343864223b7d7d, 1765047771),
('a84713de7cf177ff42da0c2792369546', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373437302e313437383731303137343536303534363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226138343731336465376366313737666634326461306332373932333639353436223b7d7d, 1763237470),
('a91c2ee55759ee3092acc5a2f161c4a7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373436382e3932373136373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226139316332656535353735396565333039326163633561326631363163346137223b7d7d, 1765047468),
('a9e3be2894a21263c69fa83c4da683b1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353133383237352e39303533373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226139653362653238393461323132363363363966613833633464613638336231223b7d7d, 1765138275),
('a9f9a5e35b23db35f91c0668b75ba167', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373838302e3133353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226139663961356533356232336462333566393163303636386237356261313637223b7d7d, 1765047880),
('aa3dc8f1c885595b113799f838222d19', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353133393438312e3836373834393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226161336463386631633838353539356231313337393966383338323232643139223b7d7d, 1765139481),
('aa8598d9d1829075e7467dff825abc32', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333231303334332e323537343731303834353934373236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226161383539386439643138323930373565373436376466663832356162633332223b7d7d, 1763210343),
('abd1b4c51897893de8110ae04b07786f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323432373437332e3233323936343033383834383837363935333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226162643162346335313839373839336465383131306165303462303737383666223b7d7d, 1762427473),
('abec67628783c1d704a0a7c653da9266', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239342e3233373932373931333636353737313438343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226162656336373632383738336331643730346130613763363533646139323636223b7d7d, 1763304294),
('ac09b7f625a713f9a4da23ca11ee1f05', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333931303739342e3331363335323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226163303962376636323561373133663961346461323363613131656531663035223b7d7d, 1763910794),
('ac4bf0b49d2e993d89e822930fbb3a4e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333630393532372e343537343834393630353536303330323733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226163346266306234396432653939336438396538323239333066626233613465223b7d7d, 1763609527),
('acfd7d913020064fd3ee655d211ce2a6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034383634312e3936383539323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226163666437643931333032303036346664336565363535643231316365326136223b7d7d, 1765048655),
('ae1e1923305b24ee792b005e5ecb4a73', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239342e35313738343830313438333135343239363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226165316531393233333035623234656537393262303035653565636234613733223b7d7d, 1763304294),
('b1dc5d7e02f19e2ad75b0e2d8ad3234e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235313630372e3738363934333931323530363130333531353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226231646335643765303266313965326164373562306532643861643332333465223b7d7d72656469726563745f75726c7c733a33393a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e2f6974656d223b, 1762251607),
('b296ad06f87c31da6525900c9fff5167', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323735333337342e313933313837393532303431363235393736353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226232393661643036663837633331646136353235393030633966666635313637223b7d7d, 1762753374),
('b299d57278a78cd79ac7f7d610b1a9d9', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432323233312e383636313935393137313239353136363031353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226232393964353732373861373863643739616337663764363130623161396439223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333436353433313b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223231643137333730303630343133363361343530363266633836613039623866223b733a33323a226134353163643135616263313366386236613363623239623132626236613634223b7d733a343a2268617368223b733a36353a2261343531636431356162633133663862366133636232396231326262366136342d3231643137333730303630343133363361343530363266633836613039623866223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763422231),
('b39669954de4e3c9a07739140ec01f9e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353233303837362e3031333634333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226233393636393935346465346533633961303737333931343065633031663965223b7d7d, 1765230887),
('b3fa0c6cb5fdf5d51cad37a1b3d268d2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373035322e3130393837373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226233666130633663623566646635643531636164333761316233643236386432223b7d7d, 1765047052),
('b553a1efce5a8bad9ceb5ab1f5bba817', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353134363333362e3539393538373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226235353361316566636535613862616439636562356162316635626261383137223b7d7d, 1765146336),
('b591769d529e4c9afaa71cad82d1061a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343430383736382e3832353038393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226235393137363964353239653463396166616137316361643832643130363161223b7d7d, 1764408768),
('b5924aa654439407b08ab7b4253d32f4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373438352e363039393439313131393338343736353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226235393234616136353434333934303762303861623762343235336433326634223b7d7d, 1763237485),
('b5d87f8145a597fe5c8ca3233c36d3c8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373737322e38383432313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226235643837663831343561353937666535633863613332333363333664336338223b7d7d, 1765047772),
('b6fbafd6e87ddfb339e1d1857c78ba63', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353133383038302e3035333534333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226236666261666436653837646466623333396531643138353763373862613633223b7d7d, 1765138080),
('b7584ce5ae277a54af6597df29188f5e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239342e3739313539353933353832313533333230333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226237353834636535616532373761353461663635393764663239313838663565223b7d7d, 1763304294),
('b8d91ebb460662f80415fa9f0a4d7764', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353035343734302e3235323131393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226238643931656262343630363632663830343135666139663061346437373634223b7d7d, 1765054740),
('b96e934a13b007c9931df94d39fa6240', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353035333630332e3435373431313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226239366539333461313362303037633939333164663934643339666136323430223b7d7d, 1765053614),
('ba0a9e4db9b1cf29a39de97f964d30fb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353134323933372e3535323238313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226261306139653464623962316366323961333964653937663936346433306662223b7d7d, 1765142937),
('bb54a7b7ff8013dafdf3e64098de979b', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343430363437342e3334313137373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223137383531313237303433646237616563373766666334653830346537653566223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736343434393431323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736343434393637343b7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f61646d696e2f6d6f64756c65223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226661643635343666663661386337373133643061363461653036363335616161223b733a33323a223430323134646538353934386434373534366266306437306266396262393730223b7d733a343a2268617368223b733a36353a2234303231346465383539343864343735343662663064373062663962623937302d6661643635343666663661386337373133643061363461653036363335616161223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a226232316562373234346436306139326635393036663731306464623331333066223b733a33323a223335663237633333363330346365373335366534623330366130386264383830223b733a33323a226166653761383539383262336665356438643134373164316561333564646663223b733a33323a226265333736373232396232373436343462313537363164663639336337353661223b733a33323a223564666331383162643363363462353234306532326664663133323965393632223b733a33323a223137323938323564343238303636383466646364613664333531383134666231223b733a33323a223634373433623733353639633736663237353030653336316531393437346335223b733a33323a223264666135353061653031326630366636373830633930353563643336306665223b733a33323a223230643564383739396633396131386164663063616166336537373830613036223b733a33323a223964646332666237393130623934313736343537306338313031636264366635223b733a33323a226335366461373332376166643337303836303565376362316433343238366332223b733a33323a223434653932303836643037343433386265306365623365623437626633613266223b733a33323a223965653533656436333163313236616162333830326165646334363435353734223b733a33323a223036663565346237333238623232633631353836376566616539386662316165223b733a33323a223431393438326236373331353030336230643534366435613236383561626666223b733a33323a223034353632326363353836643638653430383037353930336465323561343961223b733a33323a223464333837373339383230626134343737363330613532353461623064323865223b733a33323a223463383433343632666666623761373064363739663932636561623131333039223b733a33323a223664656661333066633036363561663137396530316665326136316665323930223b733a33323a226462643263343862373662313238363530613038653462663536663864373235223b733a33323a223764613037363231303830316464653366383061376234333433636635346439223b733a33323a223036353962343432363363353335653035636464613463636463636433303564223b7d733a343a2268617368223b733a36353a2230363539623434323633633533356530356364646134636364636364333035642d3764613037363231303830316464653366383061376234333433636635346439223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1764406474),
('bb5c7d595a2ef349a7c0bb6e3ac131ea', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333838333332322e323532303936383931343033313938323432313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226262356337643539356132656633343961376330626236653361633133316561223b7d7d, 1763883322),
('bbe7d55cfb65726093376de38bedf23f', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353139323036322e3739393739353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223137663631313161336461633739383436353762336437326436613339366436223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736353233353235373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223862343239363435333462633337356134383032666165313536316465343061223b733a33323a223439373561313936663064613937636466333963653838653536613239656165223b733a33323a223439363134386636396366346536323730653033303662326638303538306635223b733a33323a226435306532336636356232326231393263316632316362366330396632643366223b7d733a343a2268617368223b733a36353a2264353065323366363562323262313932633166323163623663303966326433662d3439363134386636396366346536323730653033303662326638303538306635223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f746879705f32352d32365f636c6f6e652f61646d696e223b4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1765192062),
('bc308c574f806c1fc79de3f67c3e51c6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373737312e3237353232383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226263333038633537346638303663316663373964653366363763336535316336223b7d7d, 1765047771),
('bc5fd71ea74e7607e1f1d94b792a45c0', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343338303238332e3334383733383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223535306662393561653962316531636665393664383436643762373234623932223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736343432333235393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736343432333438333b7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f61646d696e2f6d6f64756c65223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223234643066363665666531613463613063316464643930353232333631386461223b733a33323a223664656335663263666439366534356135303266613666323961396334613438223b7d733a343a2268617368223b733a36353a2236646563356632636664393665343561353032666136663239613963346134382d3234643066363665666531613463613063316464643930353232333631386461223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32373a7b733a33323a223364666634616330303537356630633134306239666632333661323165393133223b733a33323a226564366639353930633763313266306139383137636264383232336162653138223b733a33323a223433663062623361633564373038383139396663323435393533323339393862223b733a33323a226362396338613630643065363534353064626466626333616435353431303163223b733a33323a223663633838396232383034323338613864353832313963343231646164623133223b733a33323a226466633266343266323239346137376531356538336438346131353934326432223b733a33323a223166336435333930393039323166363037626664346233313536633563633532223b733a33323a226431613630336265613939323261666161323433623966666639663661396236223b733a33323a226139323962663864326631333137623533666236363939356336313834386437223b733a33323a223766636261666535613332636439393634643337393865393039356666333263223b733a33323a226230343634393163303332616563633033616234303434363633666332656361223b733a33323a223765393836666230343366346562303561353334313936663739343462613739223b733a33323a226432313836636338333634393439306365666632373835643464663634653165223b733a33323a223463323932643537616261363430636162313137386632336236643838366666223b733a33323a226465633832623633663633336539653866353963643463623835336633353461223b733a33323a223838643664396137643262656637353061363935633136386261666535313964223b733a33323a223838303839663266656162633233393063363237356633333633666564666537223b733a33323a223232363435613535373138356466616432343130306235383130313364623264223b733a33323a223839326332646439333039313035396161613335343035323366356234306338223b733a33323a223930313736363836333334633936313262366461343639373431633633616366223b733a33323a226563383439646438643165373364323636353434343137383663613830346335223b733a33323a223364306461373330633866353635326633313335376564313336656665616634223b733a33323a223037386438393064393935343337333935353936636135613263323362626431223b733a33323a226133393639633565353466306438383231333963373935353139353833313135223b733a33323a226235343434306332643738346164393065366333623836656263333336643066223b733a33323a223431333532393430646538306462373563303235613534636238656138656138223b733a33323a226561626139353439316135346339373530663838653130646666306634653331223b733a33323a223662343265643730303463316530326230383166383033303033306162616235223b733a33323a223631666232316162663731666264643964336662303532343737373564366435223b733a33323a226637363162323336623361373732363132343964383634373038373766626431223b733a33323a223766366632643161366531656366373534653965383737383636663635346430223b733a33323a226636646435633165303065353933646238343563393664626231616539316631223b733a33323a223765313164353235623032666339616431376234623663643765333263656265223b733a33323a223838383162656133656466383839303134636336333936353335663665656234223b733a33323a223461623938626535663037323132303961346533666137323637666161333439223b733a33323a223036376336666632376363623039613533643766373265613466663461663338223b733a33323a223034646562323963623165333633623034356633363035346539613761303336223b733a33323a223731316335363963646263323039333831383364383031306232313330353532223b733a33323a226131623162333932393238663535393363643137346665373961376634323930223b733a33323a223839616130643235383535306261663964396262643335336365663364393266223b733a33323a223261306263646437633539306330316332663837353965306435376132343466223b733a33323a226635313763326431323262313230653436343065323562356566653066313239223b733a33323a226663633730303065646265316633303831643965653361393464376663633338223b733a33323a226433636330336235656533376630616239653833346637623332316265363263223b733a33323a223134373164626261343030323630633961356433303166353832353862356535223b733a33323a223065643166303931316436386430646238336130643834643630653639363362223b733a33323a223566373436613230393737363934376265383934353463613862656333336634223b733a33323a223263346265316665323262383432333062303637363932323639333934643464223b733a33323a223836646164343537306532343231623364386263323861626465663635623931223b733a33323a223766383963356431656535376661363030653665396135333766613162393531223b733a33323a223536376661373530383434306330313335383938303666656461313261303534223b733a33323a226636383761383036343339383732633938656434383135666331663934303263223b733a33323a223639333030353138373938316636333263666164366436613735643934646236223b733a33323a223435383432616537613635313365376539646164656663346665653763633734223b7d733a343a2268617368223b733a36353a2234353834326165376136353133653765396461646566633466656537636337342d3639333030353138373938316636333263666164366436613735643934646236223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1764380283),
('bd063da527706e3c0c9dc5b8f04097ae', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323030323737312e3938363737333031343036383630333531353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226264303633646135323737303665336330633964633562386630343039376165223b7d7d, 1762002772),
('bed2e4b44f6c7238f15480c97fcf3d0d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333930363730322e3139383235363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226265643265346234346636633732333866313534383063393766636633643064223b7d7d, 1763906702),
('bf3a90c0153bf230ab1c874c717631a0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333931303736352e3635313638323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226266336139306330313533626632333061623163383734633731373633316130223b7d7d, 1763910765),
('bf4670a193b71b59e3457d7dae0cfc8d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239332e393539363937393631383037323530393736353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226266343637306131393362373162353965333435376437646165306366633864223b7d7d, 1763304293),
('bfeb26ec58f43ace8fb3ecc7a52e3268', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343431333836382e3931393138313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226266656232366563353866343361636538666233656363376135326533323638223b7d7d, 1764413868),
('c03f47ba8f00664fd69c63de4c1a54ce', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034383330302e3038333834343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226330336634376261386630303636346664363963363364653463316135346365223b7d7d, 1765048300),
('c11dcd32eb1e1bc0436e00013039e65a', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323332393033362e36363535333539323638313838343736353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226331316463643332656231653162633034333665303030313330333965363561223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323337323233363b7d7d72656469726563745f75726c7c733a33343a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226161353837363431613533663930656463343436633630323439356239366161223b733a33323a223036613236313361623863643763336461303731666230636463656636336130223b7d733a343a2268617368223b733a36353a2230366132363133616238636437633364613037316662306364636566363361302d6161353837363431613533663930656463343436633630323439356239366161223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762329036),
('c1e7e069d745f3898b610ea407e8e535', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333136323538362e343839313337383837393534373131393134303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226331653765303639643734356633383938623631306561343037653865353335223b7d7d, 1763162586),
('c1f5401ae51d1141d8df83d59459246d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373737302e35353535393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226331663534303161653531643131343164386466383364353934353932343664223b7d7d, 1765047770),
('c5539b7818c888abda75b47b4d4136ba', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323030333137332e323230353138313132313832363137313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226335353339623738313863383838616264613735623437623464343133366261223b7d7d, 1762003173),
('c56abb84074c77ef906adee40d03f6ec', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323238313432332e393738373431383834323331353637333832383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226335366162623834303734633737656639303661646565343064303366366563223b7d7d, 1762281424);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('c5cad3c76e2ad8c43d8437f8791d548e', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333930323336352e363533333030303436393230373736333637313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223935613238663637386137346662333764653763653831386537316339356338223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323033383236313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333838383537303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333934353536353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333737373531323b7d7d72656469726563745f75726c7c733a33343a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223630393837326431393165383039353138646437616539333466633637633462223b733a33323a226361383630393038373838633238313732366334376664356663623533616632223b7d733a343a2268617368223b733a36353a2263613836303930383738386332383137323663343766643566636235336166322d3630393837326431393165383039353138646437616539333466633637633462223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226632613339313731386639643265373635623337343965386261643634643864223b733a33323a226365613734363263646439623566613738613364333636666236653564336361223b733a33323a226661363537363636343732373832636434366363316666666631343234646531223b733a33323a223061356434356633336239376433336166313834333033336631663537376262223b733a33323a223432333036623136626233346561396331323335383836346438303762373437223b733a33323a223166396565356638393761353831636539393961326166383933373635303034223b733a33323a226663643765383966623764396665313638626631323734353339393734626335223b733a33323a223565663334623233396261303438383335613164646363336531313131636530223b733a33323a223635653533656338363161626230383237396264386234366333366137653665223b733a33323a223462303839616263313338366466353864343863626633623039346265393432223b733a33323a223566336361363131396663643064373263343863323333356166656537653363223b733a33323a223265306162613135343434306137303366633966353961326137313938323438223b7d733a343a2268617368223b733a36353a2232653061626131353434343061373033666339663539613261373139383234382d3566336361363131396663643064373263343863323333356166656537653363223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226361616239643933353638666130383635616163666635366539646263353033223b733a33323a223631353739656332353835386136666234353166653932303530636261656133223b733a33323a226435303465353536376131306433613763373036326431353530393364393834223b733a33323a226365393737666261646363343435633963323430613933363236613930623533223b733a33323a223639353533646639303965363539353366383866666637346239393161306462223b733a33323a223363333133373665343939643634393036653165336162323739396234316465223b733a33323a223139613835376263353665353961346361363931653064396331653938313062223b733a33323a223361393531623634346238313865336364316236396630356466323132653037223b7d733a343a2268617368223b733a36353a2233613935316236343462383138653363643162363966303564663231326530372d3139613835376263353665353961346361363931653064396331653938313062223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226236643661613833333431623532366534343836356637643232383165633963223b733a33323a223863656565626230393461656264366364633333306134356566333635626133223b7d733a343a2268617368223b733a36353a2238636565656262303934616562643663646333333061343565663336356261332d6236643661613833333431623532366534343836356637643232383165633963223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763902365),
('c5cedd72eea598171675a896753215ce', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373035382e3233333839353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226335636564643732656561353938313731363735613839363735333231356365223b7d7d, 1765047058),
('c62bc2116d0f75cfcf35044341c2b521', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373837382e3337383338363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226336326263323131366430663735636663663335303434333431633262353231223b7d7d, 1765047878),
('c7407fb0422d28f85337a075b43612e1', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333132333833342e3431313234333931353535373836313332383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226337343037666230343232643238663835333337613037356234333631326531223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333136373033343b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223538323965636664323165386336363836663465316339663461633237613835223b733a33323a223430376132343035393834386565303235373165616636616430666362383466223b7d733a343a2268617368223b733a36353a2234303761323430353938343865653032353731656166366164306663623834662d3538323965636664323165386336363836663465316339663461633237613835223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763123834),
('c74d20dbb18d70f42e0acc5acff1be1c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373736392e3832373435363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226337346432306462623138643730663432653061636335616366663162653163223b7d7d, 1765047769),
('cbb4a58d84449591d474ecc88114b672', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343430383736392e3235343230373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226362623461353864383434343935393164343734656363383831313462363732223b7d7d, 1764408769),
('cbb9697440f81dae8b86600b087064c2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235323832312e3634383437373037373438343133303835393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226362623936393734343066383164616538623836363030623038373036346332223b7d7d, 1762252821),
('cc4e0018f19d2957e05a8756b48b0e42', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333535392e38333835323239313130373137373733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226363346530303138663139643239353765303561383735366234386230653432223b7d7d, 1763303559),
('cc597a3274c99d76a200f13c71866d31', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034363438352e3038373436313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226363353937613332373463393964373661323030663133633731383636643331223b7d7d, 1765046485),
('ccd45ada0c0c141e2cc41a4b56bdcb41', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373035322e3537363930353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226363643435616461306330633134316532636334316134623536626463623431223b7d7d, 1765047052),
('cd8216f040894855f426123e88066b05', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343038333337382e3333303537383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226364383231366630343038393438353566343236313233653838303636623035223b7d7d, 1764083378),
('d2722736f90a5b01cdc0181adbdc2e7d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343337373134332e313336373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226432373232373336663930613562303163646330313831616462646332653764223b7d7d, 1764377143),
('d49ed208b4072d42f69df23f952862e2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353035393034322e3938343636353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226434396564323038623430373264343266363964663233663935323836326532223b7d7d, 1765059042),
('d59ce051fd50c3ad628f245f6a914e42', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353139303932352e3532303131353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226435396365303531666435306333616436323866323435663661393134653432223b7d7d, 1765190925),
('d5c78072655facb3c917156c857c3a51', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353133383038302e30393731313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226435633738303732363535666163623363393137313536633835376333613531223b7d7d, 1765138080),
('d677973d78de6599c6356a2d246a5bd7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333931303134362e34343837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226436373739373364373864653635393963363335366132643234366135626437223b7d7d, 1763910146),
('d81f3f9387d1aabbc3621d5193661325', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373735312e3832353436363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226438316633663933383764316161626263333632316435313933363631333235223b7d7d, 1765047751),
('db696ce752bd3cdf0bf150544aed20a1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333335333131352e323738343933383831323235353835393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226462363936636537353262643363646630626631353035343461656432306131223b7d7d, 1763353115),
('db81d0da1e66c7805995042d5f690707', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333337323732362e3030373139343034323230353831303534363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226462383164306461316536366337383035393935303432643566363930373037223b7d7d, 1763372726),
('dbe0cf2ca6b5c4f34ee5ee6fb0c44285', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343933363039382e3732363631363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226462653063663263613662356334663334656535656536666230633434323835223b7d7d, 1764936098),
('dd97834a3b4e8524bdaeced24b0e54c8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323432393134312e353932373036393138373136343330363634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226464393738333461336234653835323462646165636564323462306535346338223b7d7d, 1762429141),
('ddba42751c187a0b5222e67083172a94', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323031393237352e383337333833393835353139343039313739363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226464626134323735316331383761306235323232653637303833313732613934223b7d7d, 1762019275),
('de5470fac80b1faed157ed2fbbaeb1c0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333237393038312e3230343338303033353430303339303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226465353437306661633830623166616564313537656432666262616562316330223b7d7d, 1763279081),
('e0e7d80345fbac737c9a01074dedb3d0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343038333836352e3137393333383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226530653764383033343566626163373337633961303130373464656462336430223b7d7d, 1764083865),
('e335f7cfc3aa27a3f4462c16d8fd087d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333732383834392e333031323232303835393532373538373839303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226533333566376366633361613237613366343436326331366438666430383764223b7d7d, 1763728849),
('e423de36322b764c45a3756b6602d7f6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373034382e3331383836393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226534323364653336333232623736346334356133373536623636303264376636223b7d7d, 1765047048),
('e4a95edd1cb30238c24918411d1ea53a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333436303137392e383738303731303639373137343037323236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226534613935656464316362333032333863323439313834313164316561353361223b7d7d, 1763460179),
('e5c3003960e0f140ab4d2eadc36a14d2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353135333034382e3631363432383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226535633330303339363065306631343061623464326561646333366131346432223b7d7d, 1765153048),
('e62287f05f762080e8d2f710a2f03416', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333438313333392e35353634323630343832373838303835393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226536323238376630356637363230383065386432663731306132663033343136223b7d7d, 1763481339),
('e666e1868156e7326b5bc53eb8b509dd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373737302e3936353031313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226536363665313836383135366537333236623562633533656238623530396464223b7d7d, 1765047770),
('e6e1c9f05c40312b9d44b656491208e6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432353434302e313636383235303536303736303439383034363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226536653163396630356334303331326239643434623635363439313230386536223b7d7d, 1763425440),
('e817132a78dfcf56b30b9ae3a423a103', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323737323036302e3732383934383131363330323439303233343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226538313731333261373864666366353662333062396165336134323361313033223b7d7d, 1762772060),
('eab4626d95e4c27d10b7c46835397ed8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353233343232302e3532313533313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226561623436323664393565346332376431306237633436383335333937656438223b7d7d, 1765234227),
('eb8c737781b4d04c0ebe2cdf05dab24a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330343239332e31303035323439303233343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226562386337333737383162346430346330656265326364663035646162323461223b7d7d, 1763304293),
('ecca07f079c254203db41055e2f9a03d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343636383731332e3330353830363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226563636130376630373963323534323033646234313035356532663961303364223b7d7d, 1764668713),
('ed9cd325cdfe1d1e0544019018bd1360', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373838352e3838343838313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226564396364333235636466653164316530353434303139303138626431333630223b7d7d, 1765047885),
('f165792d1835c541b9ac96cbc5969ad7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432323233312e353337363733393530313935333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226631363537393264313833356335343162396163393663626335393639616437223b7d7d72656469726563745f75726c7c733a33393a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e2f6974656d223b, 1763422231),
('f174a6c2033698d2e3069c932089ff1c', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234373733372e34343539313830383331393039313739363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226631373461366332303333363938643265333036396339333230383966663163223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239303933373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223134386362633832343534313332333230626234666665393764656537343131223b733a33323a223233656332316166616531633833323730646564656438623465396161656561223b7d733a343a2268617368223b733a36353a2232336563323161666165316338333237306465646564386234653961616565612d3134386362633832343534313332333230626234666665393764656537343131223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762247737),
('f17a6905f97b42eb72c18b92f71d4d6a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333931363436302e31373333393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226631376136393035663937623432656237326331386239326637316434643661223b7d7d, 1763916460),
('f21c9a0de2f61a738da6b6f476576f70', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343337383231382e3133323637353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226632316339613064653266363161373338646136623666343736353736663730223b7d7d, 1764378218),
('f2a8ce92f02c315fdabea5f6753bfceb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353133393438312e3833313639313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226632613863653932663032633331356664616265613566363735336266636562223b7d7d, 1765139481),
('f42c6c6e53124b9ed98f3a318df5058b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373837392e3835333030323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226634326336633665353331323462396564393866336133313864663530353862223b7d7d, 1765047879),
('f47682ec5236aca2cfb23b74a78c571b', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333330333535392e323837383735383930373331383131353233343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226634373638326563353233366163613263666232336237346137386335373162223b7d7d, 1763303559),
('f503c02d7605b4cdd61f1ce3d0f0acd0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373533342e3230313337323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226635303363303264373630356234636464363166316365336430663061636430223b7d7d, 1765047534),
('f50d334b242076cbd57cf817356f4619', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343636393331372e3638343939343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226635306433333462323432303736636264353763663831373335366634363139223b7d7d, 1764669317),
('f55b2ea2b943969c218f442eacdc13f0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373837382e3639313431383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226635356232656132623934333936396332313866343432656163646331336630223b7d7d, 1765047878),
('f5a473887fd12c523819d760ac7902be', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333533373533302e363932333538303136393637373733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226635613437333838376664313263353233383139643736306163373930326265223b7d7d, 1763537530),
('f616596ebf746cf2a7cb0fb97d7ccba9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333431383231392e393036353734393634353233333135343239363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226636313635393665626637343663663261376362306662393764376363626139223b7d7d, 1763418219),
('f65b13a91854a348529dc9366c959b3a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373035392e3133333338343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226636356231336139313835346133343835323964633933363663393539623361223b7d7d, 1765047059),
('f6b0075236c237bb9d92d76f405c61ea', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333132333833342e303939373835303839343932373937383531353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226636623030373532333663323337626239643932643736663430356336316561223b7d7d72656469726563745f75726c7c733a33393a2268747470733a2f2f6f6d656b612e746f6461796672616e63652e66722f61646d696e2f6974656d223b, 1763123834),
('f6b543b2a4e9dcf3a6ffa66f42c7b328', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333934313838332e3431343034323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226636623534336232613465396463663361366666613636663432633762333238223b7d7d, 1763941883),
('f716b4192babdf297dc54598a3a07573', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353133393438312e3837343832333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226637313662343139326261626466323937646335343539386133613037353733223b7d7d, 1765139481),
('f73ce8f82e3a76f451fb1d47447d8ca5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353031353737392e3233313634363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226637336365386638326533613736663435316662316434373434376438636135223b7d7d, 1765015779),
('f740071dfe80a0d9dfb1a9551a5c5dff', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353034373035332e3631333130363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226637343030373164666538306130643964666231613935353161356335646666223b7d7d, 1765047053),
('f7d18f3d8ddf6460778cdd69e111d9b6', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343338303334392e3936373038353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223130336661383234326334646166356663386637306566306130343965623936223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736343432333439373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736343432333534393b7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f61646d696e2f6d6f64756c65223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223133656634633232363036343630643839616164653462326436356636346364223b733a33323a223734633939373862306662326231373963616231646635323063316533663332223b7d733a343a2268617368223b733a36353a2237346339393738623066623262313739636162316466353230633165336633322d3133656634633232363036343630643839616164653462326436356636346364223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32383a7b733a33323a223661626332373462396433316432376464656564393864373563313038326264223b733a33323a226337636261656363303866626538376333656439633362363338643462383862223b733a33323a226436303034396139663263366265386461343035303461623264366462623361223b733a33323a223336316537313330363732633863653233376164646666353534653234643432223b733a33323a226432623362366137336435383739306262633735336631323763346262363032223b733a33323a223735353537616362303239356331303639376466393135356438666236333661223b733a33323a223232353837636435613865646331326666626166656237323464653136646464223b733a33323a223632663666616239613933653031633335383038303062316531663765356562223b733a33323a223130666136323535306661663034656362373936383336666363653937623266223b733a33323a226132656538313532616265363830336135636133373166643833613134373539223b733a33323a226363636136623962303461306430643730653461643030643765313531393862223b733a33323a223861393531633530386237633363356362313132306539643332633036626664223b733a33323a226530323434313262326435363533323164376364656663306566303632323364223b733a33323a223865353665343532663636376631323937383163376665386539393335636630223b733a33323a223336396532383836396266303134633233623366343436313231323562373963223b733a33323a226363306465333931363965343865313833376563643738663139623133363932223b733a33323a223030623165393934353630656465373035653332393432383830303466666566223b733a33323a223736656331633366303030666238333662616630663334303832393235316238223b733a33323a226537366564613263383637346232306264326433316431323938346637643437223b733a33323a223836383436376138376465386433326531626637623332626665373563333762223b733a33323a226230313966633733373263333239636663623761386561333633373237656139223b733a33323a223462633937396164346363616330616164643634316562343135623834343136223b733a33323a226532316439313866663234386439333663643236326562643831373031316533223b733a33323a223832336334623835663237306237316533633130353132656465663831346561223b733a33323a226130643235363038313338623461313930613534633035643564356464313762223b733a33323a223965663264373432326462333961646334383965393532656563613666363661223b733a33323a223630336630313433326331633131306566386161396139643761643063626632223b733a33323a226166633439326131346237333730396136316461393263376237333166346131223b733a33323a223835623939346435383966616139623833643935306262663430383334333738223b733a33323a223266633338353632653361396338346236396436643165363133643933306263223b733a33323a223366326538313863343839326635653865376539626161326161623232313830223b733a33323a223831363663653739383035326333313930643864643535643039313838303038223b733a33323a223738623533306263313464646634383466353364346462393831343363643564223b733a33323a223934323966626261393137303339656163386263646562653064353036656337223b733a33323a223133643038393334646130613666633330393762363230326461306364396339223b733a33323a226432626432393832363066616265343534633034383933626432353132616435223b733a33323a226336363036303632313636336132633661653637306636373832303232333364223b733a33323a226431366666653239623164613732633034323237326237396261396536636331223b733a33323a226162616533363636386364353137356434653639613737626163313564616337223b733a33323a223636346266313236643133313162376538616632336435383139353736366138223b733a33323a223332346236356438303732373363326564633835616532363532366133386337223b733a33323a223564343437656135383931656263623861626234366232653032333063633764223b733a33323a223730613666383639316235646231323762623965616132626435663164616131223b733a33323a226664346466666463356634396435626233306437303935656535323464643537223b733a33323a223764386334333733333331653737663163303633323330366432303732353631223b733a33323a226239376334616437663631373734616433376533333831386234343466616434223b733a33323a223963373733376461616331306439303734366436353037633135366332343563223b733a33323a223336643134623163643535313030353835346666316262316562343330366266223b733a33323a226437396434393032363839393633383135323964376231376330396535373165223b733a33323a223138623539663266616666313335613031386363353730663866633835623636223b733a33323a223565313166626339316130663433303634333665356438666537623337346437223b733a33323a223464373439633665363339666565346238656639663531663362383765323733223b733a33323a223863333530356563313263653532313937353861646462373333616637663431223b733a33323a223134623130303234326365656464623436343733393631316631623035653833223b733a33323a226237643565313063666632636466353037393935333464316333613230343836223b733a33323a223835356434376333356230303563356565323935623430313432313664626535223b7d733a343a2268617368223b733a36353a2238353564343763333562303035633565653239356234303134323136646265352d6237643565313063666632636466353037393935333464316333613230343836223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1764380349),
('f852702eda7419a2151f52dc8722f2ef', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333435383137322e393132333231303930363938323432313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226638353237303265646137343139613231353166353264633837323266326566223b7d7d, 1763458172),
('f958053ee6c31a15bb927131b863e352', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233373434382e323831383731303830333938353539353730333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226639353830353365653663333161313562623932373133316238363365333532223b7d7d72656469726563745f75726c7c733a33373a22687474703a2f2f7777772e6f6d656b612e746f6461796672616e63652e66722f61646d696e223b, 1763237448),
('f98640088116de622247dd34373a0f0c', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343636343731382e3938343836383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223864316562343664306339376135353038323833333335623961636237656337223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333934363631323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736343432333538303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736343434393430313b7d7d72656469726563745f75726c7c733a32323a22687474703a2f2f6c6f63616c686f73742f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223738363635363433323932366433383433643430386138363036383233356534223b733a33323a223135333038633137343833633132646261626431383666333761623739393832223b733a33323a226133313230336133313566653335663937363831326530356266393364353136223b733a33323a223761356363313938663036666463303931313138393635653632663061313331223b7d733a343a2268617368223b733a36353a2237613563633139386630366664633039313131383936356536326630613133312d6133313230336133313566653335663937363831326530356266393364353136223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223039326162656632393039353066393863343433336633346337623830643731223b733a33323a226432666639316539353465653765376237383133646630363638633261616431223b733a33323a226338313737613237343934323339663634616531633532373165656563623934223b733a33323a226663353065386534366263346463303066313161363332313465303163306338223b7d733a343a2268617368223b733a36353a2266633530653865343662633464633030663131613633323134653031633063382d6338313737613237343934323339663634616531633532373165656563623934223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31363a7b733a33323a223934383361663433316138316538393439663362336565366331643834643566223b733a33323a223037363162396163313739623039666561323030646661396363376565323866223b733a33323a223166306139656633626533363466316362353666346563313261356433656435223b733a33323a226631636232333564333830363432303437383839386266373365353532323031223b733a33323a226335663061333433623439663962353937396163633936626563303661323863223b733a33323a223264636333303430663361653232633061316265343665656230653661623730223b733a33323a226635326334656337636263383139323765393165666539643030366163386533223b733a33323a223261393838613436316232343934383835316530613733626235363332313366223b733a33323a226139626566633863306264356139333530376164623235623634306535366437223b733a33323a223461313935393166643263393831303032643035373538306431633062613030223b733a33323a223131363832613961613364633134616537653934663065623762366231623737223b733a33323a223763396461613566643765313331353239386566656338316363643065336432223b733a33323a223139306637633731356435623531333036653538373134633462323230643934223b733a33323a223038613536633461356265613637316565656333313331386362393235323138223b733a33323a223762643138663833633236623463343930656562376335613264353730356164223b733a33323a226662336432333763633832333865643762353433316237333239346433336361223b733a33323a223766313032303539356431373531333436373935663231353739633636616633223b733a33323a223432323635396633333430643236336261383035643035333562316165613834223b733a33323a223963336438626137396263663834373639656561613063643437333136626434223b733a33323a223938663366346165626164393863353031336564666533643662656133653231223b733a33323a226363656634656162636538353235343633636563366565323037303932333430223b733a33323a223562623139383637313138386666353565666163343862643032616532346137223b733a33323a223136313165633930326331643363623363636638616332343461613761663466223b733a33323a226533303166303561653839646535363732633038346563383666336166333761223b733a33323a223464363461656431653732353064393834373135346432653030326136643433223b733a33323a223466393831333863353738376334393564376438366663333233333338663339223b733a33323a226262393962333534633330643332386362383335633763383966646366326166223b733a33323a226133616136386239343539323834643766353031363161626162383438646436223b733a33323a223638396537383366346338613534636436663661643331393531343562343863223b733a33323a223934353661653437666664326137373139303939356330373764636637323163223b733a33323a223939323131316435663434663631346636663339653866333966663164623032223b733a33323a223130383135353238373764623937376431646233653161346263633066626230223b7d733a343a2268617368223b733a36353a2231303831353532383737646239373764316462336531613462636330666262302d3939323131316435663434663631346636663339653866333966663164623032223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1764664718),
('f9cd68b6fab5b0d691f9e7712791e834', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353130303038352e3133303837333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226639636436386236666162356230643639316639653737313237393165383334223b7d7d, 1765100085),
('fbb999f8eb5f398affe942754f064263', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343337383435322e3930363832393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226662623939396638656235663339386166666539343237353466303634323633223b7d7d, 1764378452),
('fc425062f2f0bafd1ff66f82ce6f21de', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353134333034342e3933303034363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226663343235303632663266306261666431666636366638326365366632316465223b7d7d, 1765143044),
('fcb5cf2f665e8af699a6435abd610456', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323938333035302e353138323436383839313134333739383832383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226663623563663266363635653861663639396136343335616264363130343536223b7d7d, 1762983050),
('fdd5e50bb4941192c80e15e78f031c69', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333233343632312e3230313234313031363338373933393435333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226664643565353062623439343131393263383065313565373866303331633639223b7d7d, 1763234621),
('fe1fdcd53149ab420159dd1dfab7b64a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333632323337302e353135373032393632383735333636323130393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226665316664636435333134396162343230313539646431646661623762363461223b7d7d, 1763622370);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
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
  `id` int NOT NULL,
  `thumbnail_id` int DEFAULT NULL,
  `homepage_id` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci,
  `navigation` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int NOT NULL,
  `block_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `media_id` int DEFAULT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int NOT NULL,
  `site_id` int NOT NULL,
  `item_set_id` int NOT NULL,
  `position` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_page`
--

CREATE TABLE `site_page` (
  `id` int NOT NULL,
  `site_id` int NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `layout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout_data` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int NOT NULL,
  `page_id` int NOT NULL,
  `layout` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `layout_data` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json)',
  `position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int NOT NULL,
  `site_id` int NOT NULL,
  `user_id` int NOT NULL,
  `role` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
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
  `id` int NOT NULL,
  `resource_id` int NOT NULL,
  `property_id` int NOT NULL,
  `value_resource_id` int DEFAULT NULL,
  `value_annotation_id` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `uri` longtext COLLATE utf8mb4_unicode_ci,
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
(205, 99, 1, NULL, NULL, 'literal', NULL, 'Portefeuille en cuir noir', NULL, 1),
(206, 99, 4, NULL, NULL, 'literal', NULL, 'Description de l\'objet : Portefeuille en cuir noir avec cartes de crédit et permis de conduire\nTéléphone du trouveur : 06 12 34 56 78\nTrouvé par : Jean Martin\nLieu : Salle A205', NULL, 1),
(209, 101, 1, NULL, NULL, 'literal', NULL, 'Clés avec Porte-clé Rouge', NULL, 1),
(210, 101, 4, NULL, NULL, 'literal', NULL, 'Description de l\'objet : Trousseau de 3 clés attaché à un porte-clé rouge en plastique avec l’inscription “Sport 2000”. Trouvé au sol dans la cafétéria.\nTéléphone du trouveur : 06 71 03 42 11\nTrouvé par : Jérémy\nLieu : Cafétéria – près des poubelles', NULL, 1),
(211, 102, 1, NULL, NULL, 'literal', NULL, 'Lunettes de vue Ray-Ban', NULL, 1),
(212, 102, 4, NULL, NULL, 'literal', NULL, 'Description de l\'objet : Lunettes de vue Ray-Ban noires, étui en cuir marron. Trouvées posées sur un radiateur.\nTéléphone du trouveur : 06 92 14 08 22\nTrouvé par : Mohammed\nLieu : Bâtiment principal – près de l’ascenseur', NULL, 1),
(219, 106, 1, NULL, NULL, 'literal', NULL, 'Gourde Métallique Inox 750ml', NULL, 1),
(220, 106, 4, NULL, NULL, 'literal', NULL, 'Description de l\'objet : Gourde en acier inoxydable de couleur argentée, marque “Klean Kanteen”. Trouvée dans un casier ouvert.\nTéléphone du trouveur : 07 90 66 31 84\nTrouvé par : Imane\nLieu : Couloir du 3ᵉ étage – casiers', NULL, 1),
(221, 107, 1, NULL, NULL, 'literal', NULL, 'Casque Audio JBL Noir', NULL, 1),
(222, 107, 4, NULL, NULL, 'literal', NULL, 'Description de l\'objet : Casque Bluetooth JBL noir, modèle Tune 510BT. Fonctionne encore, quelques traces d’usure. Trouvé sur une table près des fenêtres.\nTéléphone du trouveur : 07 82 15 99 02\nTrouvé par : Mickael\nLieu : Salle 200 – rangée du fond', NULL, 1),
(229, 111, 1, NULL, NULL, 'literal', NULL, 'Clé USB Rouge', NULL, 1),
(230, 111, 4, NULL, NULL, 'literal', NULL, 'Description de l\'objet : Clé usb rouge avec cycle\nTéléphone du trouveur : 0655566666\nTrouvé par : Karim\nLieu : Caffe', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `namespace_uri` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci
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
-- Indexes for table `extract_metadata`
--
ALTER TABLE `extract_metadata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_extractor` (`media_id`,`extractor`),
  ADD KEY `IDX_4DA36818EA9FDD75` (`media_id`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `extract_metadata`
--
ALTER TABLE `extract_metadata`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `value`
--
ALTER TABLE `value`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `extract_metadata`
--
ALTER TABLE `extract_metadata`
  ADD CONSTRAINT `FK_4DA36818EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE;

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

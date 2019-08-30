-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2019. Aug 25. 20:43
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `wob`
--

DELIMITER $$
--
-- Eljárások
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addListing` (IN `IDIN` VARCHAR(36) CHARSET utf8, IN `titleIN` VARCHAR(100) CHARSET utf8, IN `descriptionIN` VARCHAR(200) CHARSET utf8, IN `location_idIN` VARCHAR(36) CHARSET utf8, IN `listing_priceIN` DECIMAL(36,2), IN `currencyIN` TEXT CHARSET utf8, IN `quantityIN` INT(36), IN `status_idIN` INT(8), IN `marketplace_idIN` INT(8), IN `upload_timeIN` VARCHAR(36) CHARSET utf8, IN `owner_emailIN` VARCHAR(100) CHARSET utf8)  NO SQL
INSERT INTO `listing`( `ID`, `title`, `description`, `location_id`, `listing_price`, `currency`,`quantity`,`status_id`,`marketplace_id`,`upload_time`,`owner_email`)
 VALUES (IDIN,titleIN,descriptionIN,location_idIN,listing_priceIN,currencyIN,quantityIN,status_idIN,marketplace_idIN,upload_timeIN,owner_emailIN)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addListingStatus` (IN `idIN` INT(8), IN `status_nameIN` VARCHAR(50) CHARSET utf8)  NO SQL
INSERT INTO `listingstatus`( `id`, `status_name`)
 VALUES (idIN,status_nameIN)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addLocation` (IN `IDIN` VARCHAR(36) CHARSET utf8, IN `manager_nameIN` VARCHAR(100) CHARSET utf8, IN `phoneIN` VARCHAR(100) CHARSET utf8, IN `address_primaryIN` VARCHAR(100) CHARSET utf8, IN `address_secondaryIN` VARCHAR(100) CHARSET utf8, IN `countryIN` VARCHAR(100) CHARSET utf8, IN `townIN` VARCHAR(100) CHARSET utf8, IN `postal_codeIN` VARCHAR(100) CHARSET utf8)  NO SQL
INSERT INTO `location`( `ID`, `manager_name`, `phone`, `address_primary`, `address_secondary`, `country`,`town`,`postal_code`)
 VALUES (IDIN,manager_nameIN,phoneIN,address_primaryIN,address_secondaryIN,countryIN,townIN,postal_codeIN)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addMarketplace` (IN `idIN` INT(8), IN `marketplace_nameIN` VARCHAR(50))  NO SQL
INSERT INTO `marketplace`( `ID`, `marketplace_name`)
 VALUES (idIN,marketplace_nameIN)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllLocationID` ()  NO SQL
SELECT `location`.`ID` FROM location$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getBestListerEmail` ()  NO SQL
SELECT owner_email FROM listing
GROUP BY owner_email
ORDER BY COUNT(owner_email) DESC
LIMIT 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getListingCount` ()  NO SQL
SELECT COUNT(`listing`.`title`)
FROM `listing`$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `listing`
--

CREATE TABLE `listing` (
  `ID` varchar(36) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `location_id` varchar(36) NOT NULL,
  `listing_price` decimal(36,2) NOT NULL,
  `currency` text NOT NULL,
  `quantity` int(36) NOT NULL,
  `status_id` int(8) NOT NULL,
  `marketplace_id` int(8) NOT NULL,
  `upload_time` varchar(36) NOT NULL,
  `owner_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `listing`
--

INSERT INTO `listing` (`ID`, `title`, `description`, `location_id`, `listing_price`, `currency`, `quantity`, `status_id`, `marketplace_id`, `upload_time`, `owner_email`) VALUES
('00331d80-e592-43ce-a5e4-c923883fe0c5', 'Minute Hawthorn', 'Crataegus tristis Beadle', '52ea143e-cb45-43af-981e-92cedb89f7a8', '855.47', 'HUF', 31, 2, 2, '11/30/2018', 'wkrebs@comcast.net'),
('00e5ff1b-089d-4781-8bb3-5122c721e27d', 'Canyon Gooseberry', 'Ribes menziesii Pursh var. hystrix (Eastw.) Jeps.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '453.03', 'AUD', 50, 1, 2, '2/11/2017', 'josem@aol.com'),
('0136924c-6368-4226-9a77-8b0af1fa21e7', 'Plantainleaf Dubautia', 'Dubautia plantaginea Gaudich. ssp. humilis G.D. Carr', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '534.29', 'USD', 44, 3, 2, '10/23/2017', 'mallanmba@mac.com'),
('01ba110e-6b8c-4e93-b1ea-7920e5a583fd', 'Sacatrapo', 'Caperonia palustris (L.) A. St.-Hil.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '255.53', 'USD', 34, 3, 1, '4/30/2018', 'bmidd@yahoo.com'),
('01ec3e7f-4e6a-45a8-ba28-f75b0e5d45cf', 'Whitewhorl Lupine', 'Lupinus densiflorus Benth. var. glareosus (Elmer) C.P. Sm.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '788.48', 'HUF', 30, 1, 1, '2/13/2018', 'mfburgo@yahoo.com'),
('023d4b5e-bb61-43fd-9f47-9638af1dc67d', 'Coast Oak', 'Quercus parvula Greene', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '307.57', 'EUR', 2, 2, 1, '9/2/2017', 'krueger@yahoo.com'),
('0288adbe-5d50-4ad2-90fb-60f2feb939f8', 'Subalpine Fleabane', 'Erigeron peregrinus (Banks ex Pursh) Greene ssp. peregrinus var. thompsonii (S.F. Blake ex J.W. Thompson) Cronquist', '013cc380-c18b-4c87-8043-16e14f7127de', '944.53', 'HUF', 33, 3, 2, '8/21/2018', 'josem@aol.com'),
('028e6bd3-6e10-4198-ac16-66579cf3c6dc', 'Giant Arrowhead', 'Sagittaria montevidensis Cham. & Schltdl.', '013cc380-c18b-4c87-8043-16e14f7127de', '52.08', 'EUR', 35, 3, 1, '4/27/2018', 'dburrows@live.com'),
('02fc4a06-3078-4471-b793-977314b19881', 'Shortstalk Dewberry', 'Rubus curtipes L.H. Bailey', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '835.32', 'HUF', 19, 1, 2, '5/7/2018', 'cderoove@aolcom'),
('031a4c85-82f4-43ec-bc69-fd9c2f7b0cc6', 'Common Sheep Sorrel', 'Rumex acetosella L.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '653.69', 'AUD', 26, 2, 2, '12/24/2017', 'wkrebs@comcast.net'),
('0328398e-703d-4e7f-b197-b50563385368', 'Leathery Knotweed', 'Polygonum achoreum S.F. Blake', '013cc380-c18b-4c87-8043-16e14f7127de', '560.73', 'HUF', 40, 2, 2, 'null', 'krueger@yahoo.com'),
('036beddb-be1d-4280-b716-144778c8c02a', 'Indian-physic', 'Gillenia Moench', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '750.51', 'JPY', 3, 2, 2, '4/18/2017', 'jfmulder@me.com'),
('04f3178e-b643-4bb5-b085-012f2aafd5b6', 'Jack In The Pulpit', 'Arisaema triphyllum (L.) Schott ssp. pusillum (Peck) Huttleston', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '64.25', 'HUF', 31, 3, 1, '8/12/2017', 'mallanmba@mac.com'),
('0542c7a5-29f4-439d-92c7-fe21a0a89bd3', 'Graham\'s Willow', 'Salix ×grahamii Borrer ex Baker', '5249f33c-fadf-44d9-ab70-471df29c20a6', '192.24', 'GBP', 18, 3, 1, '5/22/2017', 'bmidd@yahoo.com'),
('0553b224-b57e-4a5a-ad07-5bd2a4f206e1', 'Miniature Beefsteakplant', 'Mosla dianthera (Buch.-Ham. ex Roxb.) Maxim.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '142.21', 'JPY', 19, 1, 1, 'null', 'bmidd@yahoo.com'),
('05b2b21d-8385-4fec-a1b1-9d7bb257deef', 'False Bluet', 'Lucya tetrandra (L.) K. Schum.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '436.76', 'GBP', 4, 1, 1, '9/14/2018', 'wkrebs@comcast.net'),
('05e6139c-c670-40a7-926c-960cb0e4d261', 'Wart Lichen', 'Verrucaria nigrescentoidea Fink', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '922.67', 'HUF', 2, 3, 2, 'null', 'mhanoh@verizon.net'),
('0739d963-8cc4-4ca6-ae05-56f482d6d880', 'Miracle Fruit', 'Thaumatococcus daniellii (Benn.) Benth.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '283.67', 'USD', 21, 2, 2, '6/20/2017', 'jfmulder@me.com'),
('073b5cbb-6d1e-47cd-b883-bbb33d2afb3f', 'Santa Monica Lecidea Lichen', 'Lecidea santae-monicae H. Magn.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '523.29', 'GBP', 45, 3, 1, '4/12/2018', 'crobles@yahoo.com'),
('090dc564-911e-47f4-b508-0270815a92b9', 'Suksdorf\'s Silene', 'Silene suksdorfii B.L. Rob.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '616.61', 'JPY', 8, 2, 2, '12/6/2017', 'mhanoh@verizon.net'),
('096a458b-5b64-4a2c-b33d-1a546a290bb7', 'Coastal Plain Balm', 'Dicerandra linearifolia (Elliott) Benth. var. robustior R.B. Huck', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '642.24', 'JPY', 5, 3, 2, '6/29/2017', 'bhtower@sbcglobal.net'),
('0991ed18-8f6c-4728-95af-669a27314cd7', 'Horsetail', 'Equisetum ×font-queri Rothm.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '562.31', 'EUR', 36, 3, 2, '9/12/2018', 'mfburgo@yahoo.com'),
('0a0b0395-b107-41ac-96c9-a39a22aca588', 'Pringle\'s Fleabane', 'Erigeron pringlei A. Gray', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '648.63', 'HUF', 28, 3, 1, '7/17/2018', 'mfburgo@yahoo.com'),
('0a9c3906-9940-4518-8561-f19bc7fce014', 'Howell\'s Onion', 'Allium howellii Eastw.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '994.08', 'JPY', 13, 3, 2, '4/27/2018', 'overbom@yahoo.com'),
('0ae1ef23-7e20-4c84-9c90-8ef746981d73', 'Zollinger\'s Indigo', 'Indigofera zollingeriana Miq.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '793.45', 'HUF', 45, 1, 2, '7/9/2018', 'naoya@verizon.net'),
('0c0c23f2-3f8c-4c85-a043-0a745e44a8bc', 'Ambiguous Bran Lichen', 'Parmeliopsis ambigua (Wulfen) Nyl.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '155.68', 'AUD', 50, 1, 2, '8/10/2018', 'naoya@verizon.net'),
('0c277348-3099-418b-9b00-3fbe4e25db89', 'Pineoak Jewelflower', 'Streptanthus squamiformis Goodman', '5249f33c-fadf-44d9-ab70-471df29c20a6', '488.17', 'EUR', 4, 2, 2, 'null', 'stefano@live.com'),
('0c3d274e-66f1-45c6-9b8f-e2dc3b33cdb7', 'Silkreed', 'Neyraudia reynaudiana (Kunth) Keng ex Hitchc.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '212.82', 'EUR', 48, 3, 2, '10/24/2017', 'cderoove@aolcom'),
('0c5d1f38-eb69-4ada-868d-ab024998892a', 'Odontites', 'Odontites Ludwig', '013cc380-c18b-4c87-8043-16e14f7127de', '629.67', 'JPY', 49, 2, 1, '5/31/2018', 'krueger@yahoo.com'),
('0ca35e36-9910-4a28-9d23-31999d1f8dcf', 'Brace\'s Aster', 'Symphyotrichum bracei (Britton ex Small) G.L. Nesom', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '638.69', 'AUD', 46, 1, 2, 'null', 'cderoove@aolcom'),
('0d149d3b-687b-4ff0-b05c-6b3c94b394aa', 'Sessile Joyweed', 'Alternanthera sessilis (L.) R. Br. ex DC.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '552.05', 'GBP', 35, 3, 1, '2/11/2018', 'overbom@yahoo.com'),
('0d315c07-9d17-4c05-b4f1-bd1a1919f7f3', 'Canadian Plum', 'Prunus nigra Aiton', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '467.36', 'HUF', 49, 1, 2, '9/21/2017', 'dburrows@live.com'),
('0d489f20-1fe5-4437-abde-759480362d96', 'Pringle\'s Monardella', 'Monardella pringlei A. Gray', '52ea143e-cb45-43af-981e-92cedb89f7a8', '546.19', 'USD', 19, 1, 2, '9/10/2017', 'wkrebs@comcast.net'),
('0f983924-1e3b-4cd5-89d3-8bffa55a4618', 'Spineless Horsebrush', 'Tetradymia canescens DC.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '349.17', 'HUF', 14, 2, 2, '10/18/2018', 'bhtower@sbcglobal.net'),
('0ffcd7e1-871e-487a-bb7d-1039aa597128', 'Bull Crowngrass', 'Paspalum boscianum Flueggé', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '820.76', 'JPY', 50, 1, 2, 'null', 'cderoove@aolcom'),
('100f9728-859f-4197-a4e1-39a21d455141', 'Norwegian Whitlowgrass', 'Draba norvegica Gunnerus var. clivicola (Fernald) B. Boivin', '5249f33c-fadf-44d9-ab70-471df29c20a6', '533.22', 'AUD', 18, 3, 1, '8/24/2017', 'crobles@yahoo.com'),
('108ba18d-0413-4eb5-96db-d4f0fbbfee66', 'Tortella Moss', 'Tortella tortelloides (S.W. Greene) H. Rob.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '971.37', 'HUF', 23, 2, 1, '12/26/2018', 'overbom@yahoo.com'),
('11da443a-05f6-43ab-9c9d-b8c100a9d9f6', 'Imbricate Phacelia', 'Phacelia imbricata Greene ssp. imbricata', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '254.36', 'EUR', 50, 2, 1, '6/7/2017', 'overbom@yahoo.com'),
('120f51d8-6d64-4806-ac27-e09bf3015e43', 'Snowbrush Ceanothus', 'Ceanothus velutinus Douglas ex Hook.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '688.62', 'EUR', 9, 3, 2, '11/24/2018', 'overbom@yahoo.com'),
('138fa4aa-370d-4746-bc35-fe84bf513f77', 'Teak', 'Tectona grandis L. f.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '645.86', 'AUD', 41, 3, 1, '8/19/2018', 'mhanoh@verizon.net'),
('13ab8e90-444c-4b53-84dc-72bfb74ecf18', 'Gamo De Costa', 'Phyllanthus juglandifolius Willd.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '64.08', 'USD', 29, 1, 2, '4/5/2018', 'dburrows@live.com'),
('13bd77e8-3fa5-4e17-9cfb-64c63c317f00', 'Pineneedle Toadflax', 'Linaria pinifolia (Poir.) Thell.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '870.34', 'JPY', 42, 1, 2, '1/1/2017', 'naoya@verizon.net'),
('144623cc-b9b1-4312-bebb-54c54fecb983', 'Annual Marsh Elder', 'Iva annua L.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '306.86', 'GBP', 43, 3, 2, '11/5/2018', 'stefano@live.com'),
('147fcf0e-b8e7-4f65-8584-49735e5df554', 'Syagrus', 'Syagrus Mart.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '385.94', 'HUF', 2, 1, 1, '7/29/2017', 'wkrebs@comcast.net'),
('1498e9b5-2a34-4eaa-9abc-29310285d444', 'German-madwort', 'Asperugo L.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '935.11', 'JPY', 23, 2, 2, '6/11/2017', 'dburrows@live.com'),
('14a33572-819a-422a-85d5-b765eac01555', 'Purpleflower Blacksnakeroot', 'Sanicula purpurea H. St. John & Hosaka', '5249f33c-fadf-44d9-ab70-471df29c20a6', '895.45', 'USD', 14, 1, 2, 'null', 'josem@aol.com'),
('14daf621-a07b-47c2-bdc6-c7d026534a0e', 'Long-stolon Sedge', 'Carex inops L.H. Bailey ssp. inops', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '370.34', 'GBP', 15, 1, 2, '7/5/2017', 'jgwang@aol.com'),
('15403d57-473d-4c40-98f9-c935dfb7294b', 'Blueberry Willow', 'Salix myrtillifolia Andersson', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '836.14', 'GBP', 8, 3, 2, '9/5/2017', 'bhtower@sbcglobal.net'),
('158f12f3-05c5-4cfd-b5a7-e3d885310c8f', 'Sky-blue Lupine', 'Lupinus cumulicola Small', '5ae22efb-f875-4134-a03d-6402efa31dc5', '351.44', 'GBP', 20, 2, 1, 'null', 'krueger@yahoo.com'),
('1688d651-9577-4673-98e2-0bafad17b1c2', 'Openfield Sedge', 'Carex conoidea Schkuhr ex Willd.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '137.99', 'JPY', 13, 3, 1, '2/13/2018', 'jipsen@hotmail.com'),
('1774e29e-19e8-4e28-96e9-a83c7ee7cf8c', 'Bundleflower', 'Desmanthus Willd.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '960.21', 'AUD', 37, 3, 2, 'null', 'mallanmba@mac.com'),
('17a62b4b-6f02-4223-b113-e3db6632147c', 'Santa Catalina Indian Paintbrush', 'Castilleja tenuiflora Benth.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '707.74', 'GBP', 39, 3, 1, '10/17/2018', 'dburrows@live.com'),
('18359cd4-3fca-4c81-87af-13fd0c051fbe', 'Pop Saltbush', 'Atriplex spongiosa F. Muell.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '64.95', 'USD', 46, 2, 1, '7/15/2017', 'wkrebs@comcast.net'),
('1867da1c-1bb9-4112-beff-2276a57eee38', 'Dwarf Heliotrope', 'Heliotropium supinum L.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '213.44', 'GBP', 15, 1, 2, '6/22/2017', 'crobles@yahoo.com'),
('18960072-79ef-4f62-81e3-c4cffeedb977', 'Whitewhorl Lupine', 'Lupinus densiflorus Benth. var. lacteus (Kellogg) C.P. Sm.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '353.23', 'USD', 46, 2, 2, '3/18/2018', 'josem@aol.com'),
('189c57d1-ee74-42a1-a423-edf54fa9fc1a', 'Arrowfeather Threeawn', 'Aristida purpurascens Poir. var. purpurascens', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '655.84', 'HUF', 9, 1, 2, '12/4/2018', 'bhtower@sbcglobal.net'),
('18fb749d-be14-4341-920e-de38a470aa34', 'Thinleaf Creepingfern', 'Bolbitis nicotianifolia (Sw.) Alston', '5249f33c-fadf-44d9-ab70-471df29c20a6', '322.65', 'AUD', 38, 2, 1, '9/28/2017', 'josem@aol.com'),
('190577eb-885a-4c45-807e-65f111a9a7b4', 'Wijkia Moss', 'Wijkia H.A. Crum', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '167.03', 'AUD', 45, 3, 1, '7/8/2018', 'stefano@live.com'),
('19121c20-a9fa-402e-849b-18d1525b4d1c', 'Alderleaf Buckthorn', 'Rhamnus alnifolia L\'Hér.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '927.04', 'AUD', 7, 3, 1, '5/26/2018', 'naoya@verizon.net'),
('191fc273-31f2-4580-bbbd-c34c3cbf1017', 'Shield Lichen', 'Parmelia Ach.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '502.95', 'EUR', 23, 1, 2, '8/4/2017', 'mfburgo@yahoo.com'),
('19dd67af-7ae1-476d-9ba5-3b975ec7196f', 'Tanglehead', 'Heteropogon contortus (L.) P. Beauv. ex Roem. & Schult.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '87.55', 'HUF', 46, 3, 2, '12/8/2017', 'mfburgo@yahoo.com'),
('19e1b7b0-97cf-407b-bea2-d4e20646fc2e', 'Streambank Springbeauty', 'Claytonia parviflora Douglas ex Hook. ssp. viridis (Davidson) John M. Mill. & K.L. Chambers', '5249f33c-fadf-44d9-ab70-471df29c20a6', '907.16', 'HUF', 37, 3, 2, '4/25/2018', 'bmidd@yahoo.com'),
('1ab57caa-7275-4ea7-bd82-9324d271cf06', 'California Laurel', 'Umbellularia (Nees) Nutt.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '273.45', 'AUD', 35, 1, 2, '7/23/2018', 'crobles@yahoo.com'),
('1b96a9e9-1f5f-4d86-bdf9-d9b14962ea5d', 'Idaho Blue-eyed Grass', 'Sisyrinchium idahoense E.P. Bicknell var. idahoense', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '642.34', 'AUD', 34, 3, 2, '1/28/2017', 'mhanoh@verizon.net'),
('1d06fde0-4cf8-4076-9604-1403faa903cf', 'Lesser Trema', 'Trema cannabina Lour. [excluded]', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '632.91', 'EUR', 36, 1, 2, '2/11/2018', 'mfburgo@yahoo.com'),
('1d66898c-21c6-4d5e-87a2-1da929bf8947', 'Sageleaf Willow', 'Salix candida Flueggé ex Willd.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '475.24', 'EUR', 28, 3, 1, '11/12/2018', 'naoya@verizon.net'),
('1d8c44d3-aa0b-4de1-af4f-f459b3311884', 'Eggshape Melicope', 'Melicope ovata (H. St. John & Hume) T.G. Hartley & B.C. Stone', '5249f33c-fadf-44d9-ab70-471df29c20a6', '654.65', 'HUF', 20, 1, 2, '8/7/2018', 'naoya@verizon.net'),
('1e1fa1a8-9a85-42ea-a3c4-040581695018', 'Broom Silverbush', 'Argythamnia fasciculata (Vahl ex A. Juss.) Müll. Arg.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '332.71', 'JPY', 42, 3, 2, '12/9/2017', 'bmidd@yahoo.com'),
('1e818af4-eaf0-4c1e-b1f7-b60afe0cc69d', 'Cymbalaria', 'Cymbalaria Hill', '52ea143e-cb45-43af-981e-92cedb89f7a8', '656.59', 'HUF', 41, 2, 2, 'null', 'jgwang@aol.com'),
('1e8ee41e-9729-44ea-b3c4-6cdb292031b2', 'Cretan Brake', 'Pteris cretica L. var. albolineata Hook.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '79.21', 'EUR', 48, 3, 2, '8/30/2017', 'mhanoh@verizon.net'),
('1ec52cc2-a09e-4dc8-b445-c0acbb41d6f8', 'African Tuliptree', 'Spathodea campanulata P. Beauv.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '164.32', 'USD', 46, 2, 1, '7/27/2017', 'mfburgo@yahoo.com'),
('1f58fd1f-a1a5-4005-87aa-4861fe86f458', 'Caribbean Fingergrass', 'Eustachys paspaloides (Vahl) Lanza & Mattei ssp. caribaea (Spreng.) Nowack', '013cc380-c18b-4c87-8043-16e14f7127de', '479.93', 'JPY', 17, 3, 1, '6/18/2018', 'josem@aol.com'),
('1fbef9b4-11bd-4578-a8cb-92f45bd0827d', 'Stinkgrass', 'Melinis P. Beauv.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '471.02', 'EUR', 47, 2, 1, '8/2/2018', 'overbom@yahoo.com'),
('20237177-38af-444b-90c5-ecd2a2db8a41', 'Beechdrops', 'Epifagus virginiana (L.) W.P.C. Barton', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '106.18', 'AUD', 4, 2, 2, '2/26/2018', 'mhanoh@verizon.net'),
('203b78bc-93e1-4602-a1ca-e90960b8c98f', 'Peebles\' Bluestar', 'Amsonia peeblesii Woodson', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '230.62', 'GBP', 29, 2, 1, '8/7/2017', 'krueger@yahoo.com'),
('2205c933-6cfe-4445-acff-9a43979ab40b', 'Colorado Larkspur', 'Delphinium alpestre Rydb.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '556.14', 'HUF', 44, 1, 2, '2/17/2017', 'cderoove@aolcom'),
('22c66064-1f85-4fc5-b128-3fe1bff980c4', 'Youth On Age', 'Tolmiea Torr. & A. Gray', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '104.83', 'AUD', 9, 1, 1, 'null', 'krueger@yahoo.com'),
('2360d784-6beb-4302-9e4d-e8816a948d44', 'Reflexed Flatsedge', 'Cyperus refractus Engelm. ex Boeckeler', '013cc380-c18b-4c87-8043-16e14f7127de', '750.22', 'GBP', 4, 1, 1, '4/22/2017', 'dburrows@live.com'),
('2378bd83-12ae-49d3-8015-0fc7ac62a249', 'Yellow Anisetree', 'Illicium parviflorum Michx. ex Vent.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '901.76', 'USD', 47, 3, 2, '9/11/2017', 'dburrows@live.com'),
('23aed606-f890-48b8-9dc7-5f070531bca6', 'Bolander\'s Water-starwort', 'Callitriche heterophylla Pursh ssp. bolanderi (Hegelm.) Calder & Roy L. Taylor', '5249f33c-fadf-44d9-ab70-471df29c20a6', '184.07', 'USD', 11, 3, 1, 'null', 'krueger@yahoo.com'),
('248b0415-df4b-4ed8-9a68-ca009295aa4d', 'Buckley\'s Goldenrod', 'Solidago buckleyi Torr. & A. Gray', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '321.37', 'AUD', 22, 3, 1, '9/10/2018', 'krueger@yahoo.com'),
('24e4c900-7e54-4ac7-8db3-c2eec4159b4b', 'Woolly Locoweed', 'Astragalus mollissimus Torr. var. bigelovii (A. Gray) Barneby ex B.L. Turner', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '509.89', 'AUD', 12, 3, 2, '3/26/2018', 'bmidd@yahoo.com'),
('25558746-80fb-4c90-8cd6-0767b4f1c66d', 'Sea Lettuce', 'Ulva pertusa Kjellman', '013cc380-c18b-4c87-8043-16e14f7127de', '675.79', 'EUR', 39, 1, 2, '4/30/2018', 'crobles@yahoo.com'),
('2663271b-ae2c-4f84-9f26-76ae34063cdb', 'Fendler\'s Townsend Daisy', 'Townsendia fendleri A. Gray', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '588.56', 'GBP', 41, 1, 1, '5/2/2018', 'krueger@yahoo.com'),
('269c43ab-71ef-4a8f-b25b-f848b0b7d840', 'Ladder Buckwheat', 'Eriogonum insigne S. Watson', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '891.34', 'JPY', 11, 1, 1, '8/20/2018', 'krueger@yahoo.com'),
('273913a2-84d8-440f-9d0f-4054e81eb127', 'Schreber\'s Dicranella Moss', 'Dicranella schreberiana (Hedw.) Hilf. ex H.A. Crum & L.E. Anderson', '52ea143e-cb45-43af-981e-92cedb89f7a8', '50.45', 'USD', 34, 3, 2, '1/12/2018', 'krueger@yahoo.com'),
('278d0569-6b49-4f63-9ea1-0d0b2aa0cd29', 'Silvery Primrose', 'Primula incana M.E. Jones', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '523.42', 'EUR', 35, 1, 2, '3/17/2017', 'mallanmba@mac.com'),
('27ffe24d-606b-4c42-a856-e2ff75450faa', 'Green Muhly', 'Muhlenbergia ramulosa (Kunth) Swallen', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '474.91', 'GBP', 22, 1, 1, '10/31/2018', 'jfmulder@me.com'),
('296c6d48-42f1-429f-b89c-66e491ef14fe', 'Stipulated Cinquefoil', 'Potentilla stipularis L.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '737.88', 'HUF', 48, 1, 1, '4/14/2017', 'jfmulder@me.com'),
('29802062-9424-4efc-9033-39c8dd0a3cd0', 'Neglected Balsamroot', 'Balsamorhiza hookeri (Hook.) Nutt. var. neglecta (Sharp) Cronquist', '013cc380-c18b-4c87-8043-16e14f7127de', '742.44', 'USD', 16, 3, 1, '7/30/2017', 'josem@aol.com'),
('299cee56-7605-483c-a447-4ba5cf502b54', 'Glossyleaf Manzanita', 'Arctostaphylos nummularia A. Gray', '5249f33c-fadf-44d9-ab70-471df29c20a6', '968.23', 'GBP', 4, 3, 1, '11/4/2018', 'wkrebs@comcast.net'),
('29d11c85-8290-4df1-82f5-46dcd89ef90e', 'Freckled Milkvetch', 'Astragalus lentiginosus Douglas ex Hook. var. antonius Barneby', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '335.27', 'EUR', 22, 3, 2, '6/25/2018', 'mallanmba@mac.com'),
('2a18e860-11f2-47a8-b1a3-d0c8cc521909', 'Tall Blazing Star', 'Liatris aspera Michx. var. aspera', '5ae22efb-f875-4134-a03d-6402efa31dc5', '481.14', 'EUR', 23, 2, 1, '12/2/2018', 'crobles@yahoo.com'),
('2a29b519-f231-4821-a0a8-83518ef0c52f', 'Littlecup Beardtongue', 'Penstemon sepalulus A. Nelson', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '742.54', 'JPY', 21, 2, 1, '9/29/2017', 'dburrows@live.com'),
('2b936362-9072-4238-b683-a551c80c2f53', 'Belonia Lichen', 'Belonia russula Körb. ex Nyl.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '672.99', 'AUD', 38, 2, 2, '12/28/2017', 'overbom@yahoo.com'),
('2c8c19f4-ed9d-4469-9887-7f92d325adbc', 'Sausage Tree', 'Kigelia DC.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '991.86', 'GBP', 26, 1, 2, '9/28/2017', 'naoya@verizon.net'),
('2cf2268a-11d4-40af-9cf3-50d68a3d18b4', 'Nose Skullcap', 'Scutellaria antirrhinoides Benth.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '173.29', 'GBP', 21, 2, 2, '10/25/2018', 'jfmulder@me.com'),
('2f0cd3fc-852b-4a4e-8f6e-56c0d4fdc147', 'Blackseed Plantain', 'Plantago rugelii Decne. var. asperula Farw.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '769.63', 'EUR', 37, 3, 2, '2/7/2018', 'jgwang@aol.com'),
('2f20903d-cbc4-4db9-837e-61651c3a5c7b', 'Mountain Bladderfern', 'Cystopteris montana (Lam.) Bernh. ex Desv.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '643.67', 'USD', 32, 1, 1, '12/11/2018', 'overbom@yahoo.com'),
('2f8e4218-304f-4b16-9859-7a2c1b271931', 'Arar Tree', 'Tetraclinis articulata (Vahl) Masters', '013cc380-c18b-4c87-8043-16e14f7127de', '605.44', 'GBP', 28, 1, 1, '9/7/2018', 'naoya@verizon.net'),
('3043b31c-be6a-4493-815f-bf6a97b4a5eb', 'Heller\'s Blazing Star', 'Liatris helleri Porter', '5249f33c-fadf-44d9-ab70-471df29c20a6', '137.41', 'JPY', 1, 3, 1, '9/4/2018', 'overbom@yahoo.com'),
('30ad18e9-e662-44dc-83b8-43ff5b776268', 'Small-leaf Milkpea', 'Galactia parvifolia A. Rich.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '883.46', 'EUR', 31, 1, 1, '8/29/2017', 'cderoove@aolcom'),
('30dd160f-edce-438b-a056-9db5c115acb9', 'Tomentose Groutiella Moss', 'Groutiella tomentosa (Hornsch.) Wijk & Margad.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '853.14', 'USD', 12, 3, 1, '5/22/2017', 'overbom@yahoo.com'),
('310ebb5a-4c4a-4e83-8cac-8ea8cb876b69', 'Granite Mousetail', 'Ivesia muirii A. Gray', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '293.24', 'HUF', 37, 1, 1, '2/15/2017', 'jfmulder@me.com'),
('3131c082-fef1-4475-8164-b6758a047512', 'Aleutian Wormwood', 'Artemisia aleutica Hultén', '5249f33c-fadf-44d9-ab70-471df29c20a6', '260.18', 'EUR', 7, 3, 2, '5/26/2017', 'stefano@live.com'),
('31719ec8-7d5f-48b9-80b0-8f638da83622', 'Palestine Clover', 'Trifolium palaestinum Boiss.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '205.79', 'EUR', 20, 3, 1, '7/1/2017', 'bmidd@yahoo.com'),
('3184ae87-deeb-4be2-8874-c0321846ca21', 'Bottle-palm', 'Beaucarnea recurvata Lem.', '013cc380-c18b-4c87-8043-16e14f7127de', '991.17', 'AUD', 3, 2, 1, '4/8/2018', 'cderoove@aolcom'),
('3252e117-ffc1-459f-81c3-0eeecc28b181', 'Timber Milkvetch', 'Astragalus miser Douglas ex Hook. var. oblongifolius (Rydb.) Cronquist', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '772.29', 'GBP', 37, 2, 1, '3/23/2017', 'jfmulder@me.com'),
('3269d2d9-1172-454b-8122-ef214336cf73', 'Venus Flytrap', 'Dionaea muscipula Ellis', '52ea143e-cb45-43af-981e-92cedb89f7a8', '203.72', 'USD', 18, 2, 1, '2/23/2017', 'overbom@yahoo.com'),
('32cc6031-a39d-4dbf-a2d0-a6f407dce8b2', 'Eccremocactus', 'Eccremocactus Britton & Rose', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '670.65', 'HUF', 19, 3, 1, 'null', 'mfburgo@yahoo.com'),
('3353f106-18ec-49e6-a05d-76bcde3e8566', 'Colorado Bedstraw', 'Galium coloradoense W. Wight', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '112.82', 'USD', 19, 1, 1, '11/26/2018', 'jfmulder@me.com'),
('33803dbe-ffd4-46d6-9324-aec51518ebbd', 'Moist Sowthistle', 'Sonchus arvensis L. ssp. uliginosus (M. Bieb.) Nyman', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '84.48', 'AUD', 12, 3, 1, '9/14/2018', 'josem@aol.com'),
('33a6e936-1615-45b8-ad20-2aabb585742b', 'Waianae Range Papala', 'Charpentiera tomentosa Sohmer var. tomentosa', '013cc380-c18b-4c87-8043-16e14f7127de', '903.89', 'AUD', 43, 2, 2, '9/28/2017', 'jgwang@aol.com'),
('34256086-5cb1-49f4-b993-97b7c49983ee', 'Threadleaf Ragwort', 'Senecio flaccidus Less. var. flaccidus', '013cc380-c18b-4c87-8043-16e14f7127de', '488.71', 'AUD', 39, 1, 1, '6/21/2017', 'jipsen@hotmail.com'),
('34d95bb2-703e-4a07-b56b-bb61ef1f14ef', 'Rose Bladderpod', 'Lesquerella purpurea (A. Gray) S. Watson', '013cc380-c18b-4c87-8043-16e14f7127de', '903.79', 'AUD', 14, 3, 1, '4/14/2017', 'wkrebs@comcast.net'),
('34e0b239-c466-4ca6-81d0-a630af2c376e', 'Licorice', 'Glycyrrhiza L.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '794.88', 'EUR', 7, 2, 1, '3/25/2017', 'cderoove@aolcom'),
('354c8ea6-7acd-4ece-9942-d4b58d4d605f', 'Brodoa Lichen', 'Brodoa Goward', '013cc380-c18b-4c87-8043-16e14f7127de', '209.82', 'GBP', 28, 3, 2, 'null', 'josem@aol.com'),
('3580c6da-93e2-40e2-b013-e8f9637b1fd3', 'Lecidea Lichen', 'Lecidea delincta Nyl.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '709.82', 'EUR', 15, 1, 1, '12/5/2018', 'bmidd@yahoo.com'),
('358b1f8d-b343-47ff-a6c4-9d5e46903493', 'Sierra Fringed Gentian', 'Gentianopsis holopetala (A. Gray) Iltis', '013cc380-c18b-4c87-8043-16e14f7127de', '676.31', 'USD', 1, 1, 2, '4/18/2018', 'naoya@verizon.net'),
('359207db-dcfd-44ed-9b39-20a4e63ff66f', 'Dactylospora Lichen', 'Dactylospora amygdalariae Triebel', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '977.42', 'HUF', 16, 3, 1, '1/19/2017', 'mhanoh@verizon.net'),
('35f6babc-7adb-4f7b-a792-661d55002849', 'Washoe Pine', 'Pinus ponderosa Lawson & C. Lawson var. washoensis (H. Mason & Stockw.) J.R. Haller & Vivrette', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '33.54', 'EUR', 14, 2, 2, 'null', 'jgwang@aol.com'),
('3620c1bd-1b38-4cab-8116-e5a30e71fa6e', 'Kobus Magnolia', 'Magnolia kobus DC.', '013cc380-c18b-4c87-8043-16e14f7127de', '457.38', 'HUF', 18, 3, 2, 'null', 'mhanoh@verizon.net'),
('36b02f30-05ee-42cd-a2fe-34ff36bc54a7', 'Thelocactus', 'Thelocactus (K. Schum.) Britton & Rose', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '993.07', 'USD', 3, 1, 1, '9/18/2017', 'jfmulder@me.com'),
('36e3e884-aa89-4993-833b-629c698eae1b', 'Map Lichen', 'Rhizocarpon intersitum Arnold', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '93.53', 'USD', 10, 3, 2, '4/27/2017', 'jgwang@aol.com'),
('37d6d2d3-ee6c-4633-870d-0ccf72d78a90', 'Tall Buckwheat', 'Eriogonum tenellum Torr. var. tenellum', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '245.13', 'JPY', 25, 2, 1, '8/28/2018', 'bhtower@sbcglobal.net'),
('37fc5f42-eaec-480c-8606-c229b3495ccb', 'Sphagnum Absonditella Lichen', 'Absconditella sphagnorum Vezda & Poelt', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '584.76', 'AUD', 43, 3, 1, '4/28/2018', 'crobles@yahoo.com'),
('38cc9eb2-df26-4dfb-b057-70fdf3d475a9', 'Yerba Buena', 'Clinopodium douglasii (Benth.) Kuntze', '52ea143e-cb45-43af-981e-92cedb89f7a8', '650.49', 'JPY', 5, 2, 1, '7/28/2017', 'bmidd@yahoo.com'),
('38f5ec5a-9d0a-4170-b864-da4270b2e152', 'Blazing Star', 'Liatris ×fallacior (Lunell) Rydb. (pro sp.)', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '213.94', 'EUR', 50, 3, 1, '3/24/2018', 'cderoove@aolcom'),
('390337af-9d7c-4b98-8c00-f5b52206b6cc', 'Hogpeanut', 'Amphicarpaea Elliott ex Nutt.', '013cc380-c18b-4c87-8043-16e14f7127de', '330.98', 'JPY', 26, 3, 2, '4/30/2017', 'naoya@verizon.net'),
('39121113-a29a-407a-bdb7-9ba85c258782', 'African Dry Rock Moss', 'Grimmia pulvinata (Hedw.) Sm. var. africana (Hedw.) Hook. f.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '845.63', 'EUR', 19, 3, 2, '4/21/2017', 'jgwang@aol.com'),
('3a1ac205-8075-42f7-aea6-8e2876dbfb8f', 'Arizona Pine', 'Pinus arizonica Engelm. var. arizonica', '013cc380-c18b-4c87-8043-16e14f7127de', '351.66', 'EUR', 26, 3, 2, '11/29/2017', 'wkrebs@comcast.net'),
('3a6ec0e4-c125-4967-ab4e-7c8359615f19', 'Clustered Goldenweed', 'Pyrrocoma racemosa (Nutt.) Torr. & A. Gray var. congesta (Greene) Mayes ex G. Brown & Keil', '52ea143e-cb45-43af-981e-92cedb89f7a8', '593.48', 'EUR', 6, 2, 1, '11/18/2018', 'jfmulder@me.com'),
('3b4104f3-aad3-4ed1-baf8-c7b9c25f13ae', 'Hypnum Moss', 'Hypnum hamulosum Schimp.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '25.45', 'EUR', 3, 2, 2, '11/22/2018', 'josem@aol.com'),
('3c13e894-e7be-47c1-b716-8bd7bcef9143', 'Poison Angelica', 'Angelica lineariloba A. Gray', '5249f33c-fadf-44d9-ab70-471df29c20a6', '470.75', 'AUD', 19, 3, 1, '11/3/2017', 'bmidd@yahoo.com'),
('3c239820-c53a-486e-bfd9-74b4dc695301', 'Mountain Mock Vervain', 'Glandularia elegans (Kunth) Umber var. elegans', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '673.02', 'AUD', 50, 2, 2, '6/21/2017', 'overbom@yahoo.com'),
('3dd6e936-c592-4972-82ed-a40055f1bb6f', 'Purple Locoweed', 'Oxytropis lambertii Pursh var. bigelovii A. Gray', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '184.41', 'GBP', 24, 3, 2, 'null', 'mfburgo@yahoo.com'),
('3e52f578-f366-4b95-8942-2c38f7771611', 'Bulrush', 'Schoenoplectus (Rchb.) Palla', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '826.34', 'JPY', 24, 3, 2, 'null', 'cderoove@aolcom'),
('3ee24237-a354-41ef-abd1-94ffd5d982ef', 'Bryum Moss', 'Bryum subneodamense Kindb.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '787.28', 'GBP', 45, 3, 2, '4/8/2018', 'naoya@verizon.net'),
('3f556e66-a4b1-4ac7-b5bc-d50be2f8e414', 'Bird Vetch', 'Vicia cracca L.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '830.83', 'GBP', 46, 2, 1, '2/9/2018', 'bmidd@yahoo.com'),
('3f9a8518-6e12-4d49-8bb9-b48b93f643fd', 'Purplenerve Springparsley', 'Cymopterus multinervatus (J.M. Coult. & Rose) Tidestr.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '601.81', 'GBP', 24, 3, 1, '10/21/2017', 'bmidd@yahoo.com'),
('3fb686dc-141d-47f1-99ff-151ae21e0681', 'Rocky Mountain Lousewort', 'Pedicularis parryi A. Gray ssp. purpurea (Parry) G.D. Carr', '013cc380-c18b-4c87-8043-16e14f7127de', '656.07', 'JPY', 32, 3, 2, '2/18/2017', 'naoya@verizon.net'),
('3fe06d69-8c35-4b59-9458-60de53102202', 'Winn Falls Fleabane', 'Erigeron scopulinus G.L. Nesom & Roth', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '466.63', 'JPY', 43, 2, 1, '6/11/2017', 'stefano@live.com'),
('40b68ac4-1eca-406f-b562-f1013cde96df', 'Lava Aster', 'Ionactis alpina (Nutt.) Greene', '52ea143e-cb45-43af-981e-92cedb89f7a8', '485.41', 'HUF', 22, 1, 1, 'null', 'jfmulder@me.com'),
('415f98a3-00ab-4258-9018-656fe4068c29', 'Suckley\'s Endolepis', 'Endolepis dioica (Nutt.) Standl.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '319.93', 'EUR', 34, 1, 1, '6/22/2018', 'bmidd@yahoo.com'),
('418b1d7f-ec87-44cf-a6f2-21ba78c7d7d4', 'Canna', 'Canna L.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '314.39', 'USD', 9, 1, 2, '10/13/2018', 'overbom@yahoo.com'),
('42cebd28-e007-461c-a1e9-a17ce44110b5', 'Orange Bush Monkeyflower', 'Diplacus aurantiacus (W. Curtis) Jeps.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '758.09', 'EUR', 25, 1, 1, '5/27/2017', 'josem@aol.com'),
('430cdff0-c9ee-4ee0-9978-b25d0aae9aad', 'Vervain', 'Verbena ×deamii Moldenke (pro sp.)', '5249f33c-fadf-44d9-ab70-471df29c20a6', '398.28', 'JPY', 48, 3, 1, '6/19/2018', 'jfmulder@me.com'),
('44defcbf-3ccc-4e21-8e8f-f74a63e04000', 'Douglas Aster', 'Symphyotrichum subspicatum (Nees) G.L. Nesom', '52ea143e-cb45-43af-981e-92cedb89f7a8', '249.21', 'GBP', 41, 1, 2, '7/12/2018', 'cderoove@aolcom'),
('45ce57b4-d35d-4710-a3dc-8ca1c24d87e3', 'Brunswickgrass', 'Paspalum nicorae Parodi', '5249f33c-fadf-44d9-ab70-471df29c20a6', '46.73', 'EUR', 46, 1, 2, '6/4/2018', 'jgwang@aol.com'),
('46c6d8f6-1463-4718-b712-8c74008b366d', 'Maui Beggarticks', 'Bidens mauiensis (A. Gray) Sherff', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '893.71', 'USD', 21, 2, 2, '4/4/2018', 'overbom@yahoo.com'),
('47b1741b-0e3c-430a-ab47-d4aa2ae2b071', 'Rimmed Lichen', 'Aspicilia verrucigera Hue', '013cc380-c18b-4c87-8043-16e14f7127de', '139.64', 'EUR', 46, 1, 1, '10/19/2017', 'jgwang@aol.com'),
('47d0bdec-e938-4881-948f-b638bed0baca', 'Beard Lichen', 'Usnea hesperina Mot.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '508.93', 'HUF', 10, 1, 2, '10/7/2017', 'overbom@yahoo.com'),
('48193aaa-da2d-4e0b-99f1-534a90ce3f9b', 'Richardson\'s Masonhalea Lichen', 'Masonhalea richardsonii (Hook.) Karnefelt', '52ea143e-cb45-43af-981e-92cedb89f7a8', '688.65', 'JPY', 30, 1, 2, '5/8/2018', 'mallanmba@mac.com'),
('4914427e-2ad7-4a5d-ac54-2b15a0ed2d9c', 'Jointtail Grass', 'Coelorachis Brongn.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '230.45', 'USD', 19, 1, 1, '10/23/2018', 'mallanmba@mac.com'),
('4a841cdb-48b1-48af-a9c4-e5cb7b9654be', 'Greene Brickellbush', 'Brickellia greenei A. Gray', '5ae22efb-f875-4134-a03d-6402efa31dc5', '469.36', 'JPY', 25, 3, 1, '3/14/2017', 'jipsen@hotmail.com'),
('4a8fce27-2c17-4a93-8e10-d5a44306d91f', 'Astomum Moss', 'Astomum ludovicianum (Sull.) Sull.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '801.08', 'USD', 5, 1, 2, '3/7/2017', 'mallanmba@mac.com'),
('4af1d113-da69-4c95-bfd8-83c93321d756', 'Longleaf Summer Bluet', 'Houstonia longifolia Gaertn.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '842.25', 'GBP', 36, 2, 2, '8/18/2018', 'stefano@live.com'),
('4bb15199-54f0-4d38-9a6a-56eea33c2d5d', 'Saltcedar', 'Tamarix ramosissima Ledeb.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '287.69', 'USD', 18, 2, 1, '9/19/2018', 'overbom@yahoo.com'),
('4bccee6f-16d2-4021-afcf-45d158ea6073', 'Tenangle Pipewort', 'Eriocaulon decangulare L. var. decangulare', '5ae22efb-f875-4134-a03d-6402efa31dc5', '60.29', 'USD', 14, 3, 2, '8/8/2017', 'bhtower@sbcglobal.net'),
('4d2e50bc-8c1b-472e-bd72-55c7c506c78f', 'Queen Of The Meadow', 'Filipendula ulmaria (L.) Maxim. ssp. ulmaria', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '684.16', 'JPY', 24, 2, 1, '8/18/2017', 'mhanoh@verizon.net'),
('4d5ea266-68c9-4da4-b2da-eddd62f5e5a0', 'Plume Albizia', 'Paraserianthes lophantha (Willd.) I.C. Nielsen', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '360.48', 'JPY', 38, 2, 1, '3/7/2017', 'wkrebs@comcast.net'),
('4d672b04-efe4-407c-a091-c1af80191bb6', 'Fries\' Pussytoes', 'Antennaria friesiana (Trautv.) Ekman ssp. friesiana', '52ea143e-cb45-43af-981e-92cedb89f7a8', '151.64', 'AUD', 17, 2, 2, '9/27/2017', 'wkrebs@comcast.net'),
('4d75f131-60c0-4447-975d-fe3aeef58491', 'Cracked Lichen', 'Acarospora hilaris (Dufour) Hue', '5ae22efb-f875-4134-a03d-6402efa31dc5', '856.98', 'EUR', 16, 2, 2, '7/29/2017', 'cderoove@aolcom'),
('4d78c40d-12e7-4fbc-a3fd-a9155d1b969f', 'Sedge', 'Carex ×patuensis Lepage', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '2.74', 'GBP', 6, 1, 2, '12/7/2017', 'jgwang@aol.com'),
('4d88db7e-8475-46bb-b18d-34eab47639d3', 'Kennedy\'s Tropical Bent', 'Bromidium tandilense (Kuntze) Rúgolo', '013cc380-c18b-4c87-8043-16e14f7127de', '922.95', 'AUD', 31, 3, 1, '7/3/2018', 'jfmulder@me.com'),
('4e07cbc3-96c9-4a3b-9116-13ac83f31304', 'Royal Fern', 'Osmunda regalis L.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '346.29', 'EUR', 8, 1, 1, '10/1/2018', 'jgwang@aol.com'),
('4ef09d0f-8a74-4f3d-a5d2-514f446f430e', 'Prairie Broomweed', 'Amphiachyris dracunculoides (DC.) Nutt.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '262.53', 'EUR', 30, 3, 1, '5/27/2018', 'crobles@yahoo.com'),
('4f79ab4d-1dda-46ee-9ee6-4620ac68fe89', 'Rock Bulrush', 'Schoenoplectiella juncoides (Roxb.) Lye', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '193.88', 'HUF', 45, 1, 1, '12/5/2017', 'josem@aol.com'),
('504e5969-2655-41f1-8d7c-54ea8d1ce6f9', 'Matted Crinklemat', 'Tiquilia latior (I.M. Johnst.) A.T. Richardson', '5249f33c-fadf-44d9-ab70-471df29c20a6', '479.95', 'EUR', 13, 3, 1, '9/29/2018', 'stefano@live.com'),
('51023b96-5feb-4abe-bbc7-e1b08c3970cc', 'Lanaihale Cyrtandra', 'Cyrtandra munroi Forbes', '52ea143e-cb45-43af-981e-92cedb89f7a8', '937.11', 'AUD', 19, 1, 1, '5/23/2018', 'mallanmba@mac.com'),
('521c3522-cf74-4595-a083-bee84b6edc15', 'Plagiothecium Moss', 'Plagiothecium cavifolium (Brid.) Z. Iwats.', '013cc380-c18b-4c87-8043-16e14f7127de', '341.45', 'AUD', 18, 3, 2, 'null', 'josem@aol.com'),
('53090984-ddf9-46a4-9fca-396fe463630e', 'Carolina Foxtail', 'Alopecurus carolinianus Walter', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '990.19', 'JPY', 32, 3, 2, '2/13/2018', 'stefano@live.com'),
('53b9603c-f773-48cc-bba8-28e6db6a3c7a', 'Professor-weed', 'Galega L.', '013cc380-c18b-4c87-8043-16e14f7127de', '913.38', 'HUF', 19, 2, 2, 'null', 'stefano@live.com'),
('53cd2095-2a81-4ae1-a068-1ddebd32c93b', 'Bryum Moss', 'Bryum erythroloma (Kindb.) Syed', '5ae22efb-f875-4134-a03d-6402efa31dc5', '556.45', 'AUD', 26, 2, 1, '9/28/2018', 'crobles@yahoo.com'),
('53e7efbd-7e24-4d2a-ba64-2b84d6eb5fa8', 'Sawtooth Lewisia', 'Lewisia serrata Heckard & Stebbins', '013cc380-c18b-4c87-8043-16e14f7127de', '384.38', 'HUF', 10, 3, 1, '5/25/2017', 'cderoove@aolcom'),
('53fabe17-f169-42c1-8a34-188e696aa573', 'Dyer\'s Woad', 'Isatis tinctoria L.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '575.34', 'HUF', 32, 2, 2, '8/25/2018', 'crobles@yahoo.com'),
('5444e368-7552-4058-82e1-5a3c486fab79', 'Dimerella Lichen', 'Dimerella lutea (Dicks.) Trevis.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '228.21', 'EUR', 46, 2, 2, 'null', 'krueger@yahoo.com'),
('5464cc5a-0dca-4235-a3a6-e2f05736df29', 'Whitebristle Cottongrass', 'Eriophorum altaicum Meinsh. var. altaicum Meinsh. [excluded]', '013cc380-c18b-4c87-8043-16e14f7127de', '752.09', 'JPY', 12, 3, 1, '4/16/2017', 'mfburgo@yahoo.com'),
('5468eddf-e723-4109-9fcc-5e3697c9c8d6', 'Silktassel', 'Garrya Douglas ex Lindl.', '013cc380-c18b-4c87-8043-16e14f7127de', '484.71', 'AUD', 41, 3, 1, '3/19/2018', 'josem@aol.com'),
('550ccb36-834e-4ed3-afa0-06a676b23074', 'Sprucemont Flax', 'Linum subteres (Trel.) Winkl.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '200.69', 'EUR', 23, 3, 1, '8/22/2018', 'bhtower@sbcglobal.net'),
('552aae32-e946-44fe-8d26-ee9cc0e357a4', 'Summer Coralroot', 'Corallorhiza maculata (Raf.) Raf. var. ozettensis E. Tisch', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '156.61', 'JPY', 32, 2, 1, '8/15/2017', 'cderoove@aolcom'),
('55489c6a-572c-4c71-b32d-d2a1e9a775ea', 'Blackseed Plantain', 'Plantago rugelii Decne.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '481.56', 'HUF', 27, 2, 2, '4/23/2017', 'bhtower@sbcglobal.net'),
('55ced636-b777-4c5b-973c-066016478517', 'Parry\'s Thistle', 'Cirsium parryi (A. Gray) Petr. ssp. parryi', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '528.56', 'GBP', 7, 3, 2, '6/17/2017', 'mhanoh@verizon.net'),
('55d5d82d-687f-42cc-9585-178d8feacfac', 'Sea Lettuce', 'Ulva clathratioides L.G. Kraft, Kraft, & R.F. Waller', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '338.81', 'GBP', 12, 1, 1, 'null', 'krueger@yahoo.com'),
('56440b13-4f51-47cf-b2ae-b20f5d2be765', 'Bur Pincushionplant', 'Navarretia prolifera Greene ssp. prolifera', '013cc380-c18b-4c87-8043-16e14f7127de', '803.61', 'GBP', 2, 3, 2, 'null', 'josem@aol.com'),
('569de61e-2f31-4ec0-b062-dcd89a08249e', 'Orange Honeysuckle', 'Lonicera ciliosa (Pursh) Poir. ex DC.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '938.16', 'GBP', 49, 1, 2, '6/21/2018', 'mfburgo@yahoo.com'),
('570bf803-b80f-4206-8da1-508f70fdffd5', 'Columbian Goldenbush', 'Ericameria resinosa Nutt.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '533.31', 'USD', 34, 3, 2, '1/18/2018', 'dburrows@live.com'),
('57764829-4a54-4071-acfa-83fc6b2047ac', 'Mustang Monardella', 'Monardella lanceolata A. Gray var. lanceolata', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '16.73', 'HUF', 47, 1, 1, '8/21/2018', 'bmidd@yahoo.com'),
('57d0703a-786a-4e58-bde0-48dbcca810f5', 'Pohlia Moss', 'Pohlia brevinervis Lindb. & Arnell', '5ae22efb-f875-4134-a03d-6402efa31dc5', '431.96', 'AUD', 32, 3, 1, '11/8/2018', 'naoya@verizon.net'),
('58000ff2-1ada-4e9c-ac8e-02d44c6235d2', 'Okanoga Bedstraw', 'Galium serpenticum Dempster ssp. okanoganense Dempster & Ehrend.', '013cc380-c18b-4c87-8043-16e14f7127de', '47.64', 'JPY', 37, 1, 1, 'null', 'jipsen@hotmail.com'),
('5882f624-4f4e-49cc-9fb3-0905ea75d551', 'Big Bend Barometerbush', 'Leucophyllum minus A. Gray', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '950.02', 'JPY', 5, 3, 2, '6/3/2017', 'bmidd@yahoo.com'),
('5946a294-ef7e-44bf-812a-f078909eec7c', 'Greenland Snow Lichen', 'Stereocaulon groenlandicum (E. Dahl) Lamb', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '330.63', 'HUF', 14, 2, 2, '12/13/2017', 'bmidd@yahoo.com'),
('59d29421-6485-4c4c-92ba-8c1497f671a0', 'Racomitrium Moss', 'Racomitrium depressum Lesq.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '62.78', 'GBP', 37, 3, 2, '6/17/2018', 'josem@aol.com'),
('59ed9067-57e1-43c0-9d3c-2308219911f6', 'Slender-fruit Saltbush', 'Atriplex leptocarpa F. Muell.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '156.03', 'AUD', 1, 1, 1, '8/3/2017', 'cderoove@aolcom'),
('5a9e2da5-d9c3-4cf0-bc76-b99985621f5f', 'Hubricht\'s Bluestar', 'Amsonia hubrichtii Woodson', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '344.65', 'AUD', 46, 1, 2, '5/9/2017', 'naoya@verizon.net'),
('5af5d235-6b4a-4f41-b6bc-6a9d9413668e', 'Pseudoleskea Moss', 'Pseudoleskea saviana (De Not.) Latz.', '013cc380-c18b-4c87-8043-16e14f7127de', '996.34', 'EUR', 32, 2, 2, '7/21/2018', 'wkrebs@comcast.net'),
('5b465364-481a-4307-ba10-f015d95f983d', 'Fetid Passionflower', 'Passiflora foetida L.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '64.23', 'HUF', 14, 3, 1, '8/25/2018', 'krueger@yahoo.com'),
('5b84f9eb-fc87-4595-b17d-da2e225af790', 'Whisk Fern', 'Psilotum Sw.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '358.88', 'USD', 22, 3, 1, '11/11/2017', 'crobles@yahoo.com'),
('5be6ddcd-1879-463e-96a5-ad1ea33db45e', 'Wheat Sedge', 'Carex atherodes Spreng.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '205.85', 'GBP', 48, 1, 2, '4/5/2018', 'crobles@yahoo.com'),
('5c050679-6424-4f7f-8365-22c9a630a831', 'Modoc Plateau Milkvetch', 'Astragalus pulsiferae A. Gray var. coronensis S.L. Welsh, Ondricek & G. Clifton', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '376.06', 'HUF', 14, 2, 1, '10/10/2018', 'bmidd@yahoo.com'),
('5c99eaea-4103-4354-a91d-c93653ac2c1e', 'Smith\'s Sunflower', 'Helianthus smithii Heiser', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '35.41', 'GBP', 10, 2, 1, 'null', 'jipsen@hotmail.com'),
('5d2dcca4-e4ee-4049-855f-01727f4c5318', 'Fremont\'s Beardtongue', 'Penstemon fremontii Torr. & A. Gray ex A. Gray', '52ea143e-cb45-43af-981e-92cedb89f7a8', '452.25', 'AUD', 3, 3, 2, '8/24/2017', 'bhtower@sbcglobal.net'),
('5e5556c5-dcb1-4570-9065-f2c1c09816f0', 'Forest Danafern', 'Danaea urbanii Maxon', '013cc380-c18b-4c87-8043-16e14f7127de', '711.05', 'EUR', 12, 2, 2, 'null', 'mallanmba@mac.com'),
('5e6d9009-78c0-43e3-9ee0-d98f32fc84e6', 'Saffron Plum', 'Sideroxylon celastrinum (Kunth) T.D. Penn.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '34.67', 'EUR', 13, 1, 2, '6/5/2018', 'jipsen@hotmail.com'),
('5e8f4d13-7adb-479e-9638-bc06207e1450', 'Whitewoolly Twintip', 'Stemodia durantifolia (L.) Sw.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '861.26', 'EUR', 41, 3, 2, '7/14/2017', 'mfburgo@yahoo.com'),
('5edcba38-a9b2-487f-84bf-91e48df58597', 'Klamath Arnica', 'Arnica spathulata Greene', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '563.78', 'JPY', 11, 2, 1, '2/18/2018', 'cderoove@aolcom'),
('5eea4f9c-d59e-4d37-ab88-8f644cf53e73', 'Skunkbush', 'Navarretia squarrosa (Eschsch.) Hook. & Arn.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '138.64', 'GBP', 20, 2, 2, 'null', 'dburrows@live.com'),
('5f4edf45-5138-4eaa-a64d-51820dfd6f79', 'Mustard', 'Brassica cretica Lam.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '728.75', 'AUD', 33, 3, 2, '11/28/2018', 'bmidd@yahoo.com'),
('6049a911-f0f1-4e40-bceb-54b0dc7c0c92', 'Waxyleaf Meadow-rue', 'Thalictrum revolutum DC.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '198.97', 'USD', 12, 3, 1, '7/16/2018', 'dburrows@live.com'),
('60cffa7b-3b9f-4f67-9ddf-b5931d1dbaf9', 'Dakota Sarcogyne Lichen', 'Sarcogyne dakotensis H. Magn.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '523.51', 'JPY', 3, 1, 1, '4/3/2018', 'overbom@yahoo.com'),
('60da2425-d697-4cf9-aef5-62c725cc1dfa', 'Nevada Dustymaiden', 'Chaenactis nevadensis (Kellogg) A. Gray', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '180.31', 'USD', 21, 3, 1, '8/30/2017', 'jipsen@hotmail.com'),
('61015690-a357-4acc-a35c-cf6cbe447bcf', 'Laurel Oak', 'Quercus laurifolia Michx.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '856.69', 'HUF', 7, 3, 2, '2/11/2018', 'naoya@verizon.net'),
('623ae3f8-7c91-462c-8d0a-05d61250f4ac', 'Nuttall\'s Biscuitroot', 'Lomatium nuttallii (A. Gray) J.F. Macbr.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '100.52', 'EUR', 39, 3, 1, '12/4/2018', 'wkrebs@comcast.net'),
('6270e435-2899-47fe-a0d2-9aacbfe300d2', 'Parachute Sedge', 'Carex tonsa (Fernald) E.P. Bicknell var. rugosperma (Mack.) Crins', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '903.44', 'AUD', 21, 3, 1, '2/24/2018', 'josem@aol.com'),
('628d71a4-0a0f-4671-ac95-bfc8ec1f838b', 'Quillwort Arrowhead', 'Sagittaria isoetiformis J.G. Sm.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '722.65', 'AUD', 19, 2, 1, '11/3/2018', 'cderoove@aolcom'),
('6298fcbd-5f61-415c-b68c-5190f263683a', 'Langloisia', 'Langloisia Greene', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '47.35', 'USD', 33, 1, 2, '8/12/2018', 'stefano@live.com'),
('62cf0890-3816-426b-89b0-e07a820e740d', 'Chilean Cedar', 'Austrocedrus Florin & Boutelje', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '120.29', 'GBP', 28, 3, 2, '5/31/2017', 'cderoove@aolcom'),
('63a45a8b-3daf-4207-96cd-41fd252d6c5f', 'Phaeocalicium Lichen', 'Phaeocalicium A.F.W. Schmidt', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '640.64', 'JPY', 12, 1, 1, '4/17/2017', 'mhanoh@verizon.net'),
('63c7d674-4d5e-4db1-b932-6a4001af3d8d', 'Coast Range Dwarf-flax', 'Hesperolinon disjunctum H. Sharsm.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '732.27', 'AUD', 50, 1, 1, '2/27/2018', 'bhtower@sbcglobal.net'),
('642085e0-8ffd-4cec-9b9e-fcd3857b7420', 'Cutleaf Silverpuffs', 'Microseris laciniata (Hook.) Sch. Bip. ssp. siskiyouensis K.L. Chambers', '013cc380-c18b-4c87-8043-16e14f7127de', '924.81', 'USD', 13, 3, 1, '10/2/2017', 'krueger@yahoo.com'),
('6572efe5-01aa-4cdc-91f2-f677dd610356', 'Silken Homalothecium Moss', 'Homalothecium sericeum (Hedw.) Schimp.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '553.25', 'JPY', 12, 2, 1, '9/25/2017', 'mfburgo@yahoo.com'),
('65c5dea4-2ad7-4c74-a418-f65d9e60dc7d', 'Hall\'s Bruchia Moss', 'Bruchia hallii Austin', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '769.91', 'HUF', 7, 3, 2, '12/20/2018', 'mfburgo@yahoo.com'),
('662eb261-930b-42b4-b250-d8e04bd963a4', 'Soerensen\'s Sedge', 'Carex ×soerensenii Lepage', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '666.47', 'GBP', 27, 1, 1, 'null', 'krueger@yahoo.com'),
('667dd8f4-181f-4c72-91a0-1fd6a81fe820', 'Sulcaria Lichen', 'Sulcaria Bystrek', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '889.49', 'USD', 2, 2, 1, '12/25/2017', 'jgwang@aol.com'),
('676360ee-020c-4e5c-a5f9-d0bf32e6690e', 'Sticky Monkeyflower', 'Mimulus viscidus Congd.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '984.11', 'USD', 19, 3, 2, '12/28/2017', 'jipsen@hotmail.com'),
('6789e158-9f94-48e9-a07f-a62958b7020a', 'Missouri Lambsquarters', 'Chenopodium album L. var. missouriense (Aellen) I.J. Bassett & C.W. Crompton', '5ae22efb-f875-4134-a03d-6402efa31dc5', '540.24', 'HUF', 50, 2, 1, '12/3/2018', 'crobles@yahoo.com'),
('6790e7fe-8956-4453-96c5-6807597a91f5', 'Texas Salt', 'Allolepis Söderst. & Decker', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '215.53', 'AUD', 14, 1, 2, '3/11/2018', 'mallanmba@mac.com'),
('67d8311a-d071-48c1-a598-f9cd3a2a0942', 'Screw-pod Wattle', 'Acacia implexa Benth.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '581.09', 'GBP', 8, 1, 2, 'null', 'bmidd@yahoo.com'),
('67ed3451-65f9-43de-b099-e3df0d664e8d', 'Red Triangles', 'Centrostegia thurberi A. Gray ex Benth.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '0.75', 'AUD', 25, 3, 2, 'null', 'jgwang@aol.com'),
('67f1f8de-b43f-4ad7-94e2-eebf6387ed0a', 'Hollyleaf Buckthorn', 'Rhamnus crocea Nutt. ssp. pilosa (Trel.) C.B. Wolf', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '633.98', 'HUF', 15, 1, 2, '5/7/2018', 'bhtower@sbcglobal.net'),
('686eaf29-03bd-4d23-8920-dd59cbbb668b', 'Rock Goldenrod', 'Solidago rupestris Raf.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '840.68', 'HUF', 19, 1, 1, '5/4/2018', 'krueger@yahoo.com'),
('68b53664-206a-4062-8944-aca9ba690f75', 'Magnolia', 'Magnolia L.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '144.79', 'HUF', 1, 3, 1, '7/26/2018', 'mallanmba@mac.com'),
('68cb91e9-0288-4152-9164-bf2b9bc86c0b', 'Howell\'s Lewisia', 'Lewisia cotyledon (S. Watson) B.L. Rob. var. howellii (S. Watson) Jeps.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '687.93', 'JPY', 23, 3, 2, '5/1/2018', 'dburrows@live.com'),
('69e1dc26-099d-4f21-ac5b-125b8638bf73', 'Curlygrass Fern', 'Schizaea Sm.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '602.32', 'USD', 7, 2, 1, '9/18/2017', 'dburrows@live.com'),
('6a183199-a74f-49c2-a80a-ad464964ec40', 'Sphagnum', 'Sphagnum flexuosum Dozy & Molk. var. ramosissimum R.E. Andrus', '5249f33c-fadf-44d9-ab70-471df29c20a6', '917.72', 'GBP', 44, 2, 2, '5/10/2017', 'josem@aol.com'),
('6a25ce9f-70eb-40c9-b621-099890fc768c', 'Lady\'s Tresses', 'Spiranthes ×intermedia Ames', '52ea143e-cb45-43af-981e-92cedb89f7a8', '214.54', 'GBP', 39, 1, 2, '4/22/2017', 'dburrows@live.com'),
('6a893a79-e426-4961-8806-67b63275a837', 'Narrowleaf Colicwood', 'Myrsine linearifolia Hosaka', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '266.78', 'HUF', 26, 3, 1, 'null', 'dburrows@live.com'),
('6bdbc8cf-113e-40b5-8b96-ec3233041afe', 'Montane Trematodon Moss', 'Trematodon montanus Belland & Brass.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '36.44', 'JPY', 28, 3, 2, '11/1/2017', 'stefano@live.com'),
('6c49bc05-c462-4a32-9322-0e30f01d9590', 'Mountain Fetterbush', 'Pieris floribunda (Pursh) Benth. & Hook. f.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '166.01', 'EUR', 10, 3, 1, '10/29/2018', 'bmidd@yahoo.com'),
('6dbc729e-2251-4eec-9063-7e4b079655df', 'Meehania', 'Meehania Britton', '5ae22efb-f875-4134-a03d-6402efa31dc5', '510.92', 'EUR', 49, 3, 1, '4/14/2018', 'dburrows@live.com'),
('6e07acce-44d2-4ff9-8957-9fc71601cd6f', 'Incense Cedar', 'Calocedrus decurrens (Torr.) Florin', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '850.66', 'HUF', 28, 3, 2, '12/10/2018', 'dburrows@live.com'),
('6e6192cf-8e41-4725-8646-077e73042e99', 'Prairie Clover', 'Dalea L.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '859.48', 'JPY', 29, 1, 1, '6/1/2018', 'overbom@yahoo.com'),
('6e727ba0-b5e1-4a42-8d2e-8dcfdb354588', 'Starhair Groundcherry', 'Physalis viscosa L.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '563.24', 'HUF', 37, 3, 1, '3/29/2018', 'cderoove@aolcom'),
('6e7ffe4f-3a1e-45f9-855a-fd94b2253b0c', 'China Doll', 'Radermachera sinica (Hance) Hemsl.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '301.43', 'AUD', 12, 3, 2, '2/16/2017', 'naoya@verizon.net'),
('6fd808b6-eb42-447e-88a2-ed72c6bd9460', 'Elkweed', 'Frasera speciosa Douglas ex Griseb.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '849.95', 'HUF', 3, 2, 2, 'null', 'josem@aol.com'),
('7012213e-bf42-4605-957b-581a31a41a58', 'Parrotbeak Orchid', 'Dilomilis montana (Sw.) Summerhayes', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '148.65', 'HUF', 4, 2, 2, '7/6/2018', 'josem@aol.com'),
('70b5d9b6-f055-4c80-a9c9-237e36c4562f', 'Chinese-quince', 'Pseudocydonia C.K. Schneid.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '377.63', 'USD', 42, 2, 2, '4/23/2017', 'dburrows@live.com'),
('70c03f04-52bc-4b0b-b879-bc2db9d9466b', 'Jaeger\'s Draba', 'Draba jaegeri Munz & I.M. Johnst.', '013cc380-c18b-4c87-8043-16e14f7127de', '297.45', 'JPY', 39, 1, 1, '2/27/2017', 'mallanmba@mac.com'),
('71edde3a-dddf-4fc0-a6cb-df3e6e6b05f5', 'Dwarf Rattlesnakeroot', 'Prenanthes nana (Bigelow) Torr.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '329.61', 'AUD', 27, 2, 1, '9/25/2018', 'josem@aol.com'),
('721da5bf-753f-4e3b-9e80-72d844ab7429', 'Looseflower Alpine Sedge', 'Carex rariflora (Wahlenb.) Sm. var. rariflora', '52ea143e-cb45-43af-981e-92cedb89f7a8', '676.72', 'AUD', 43, 3, 1, '10/8/2017', 'jgwang@aol.com'),
('72bd648f-48be-49ad-a226-e661f867fcfc', 'Divided Rockcress', 'Arabis schistacea Rollins', '013cc380-c18b-4c87-8043-16e14f7127de', '842.61', 'EUR', 13, 3, 2, '10/25/2017', 'dburrows@live.com');
INSERT INTO `listing` (`ID`, `title`, `description`, `location_id`, `listing_price`, `currency`, `quantity`, `status_id`, `marketplace_id`, `upload_time`, `owner_email`) VALUES
('73fa1b61-24d9-4b84-acc6-b76fc42f9736', 'Chattahoochee River Wakerobin', 'Trillium decipiens J.D. Freeman', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '49.18', 'GBP', 27, 1, 1, '9/23/2017', 'overbom@yahoo.com'),
('759e4a00-bdf4-4000-8665-52d71f50b3eb', 'Guadalupe Mountain Sedge', 'Carex mckittrickensis P.W. Ball', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '597.31', 'AUD', 27, 2, 1, '2/16/2017', 'crobles@yahoo.com'),
('7630fc63-d5df-47e3-9dd3-244238df9c71', 'Spotted Beebalm', 'Monarda fruticulosa Epling', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '712.56', 'AUD', 21, 3, 2, '11/28/2017', 'josem@aol.com'),
('766af253-a74e-447c-811e-ecd2c950fb7c', 'Camasey Terciopelo', 'Clidemia cymosa (Wendl. ex Spreng.) Alain', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '555.78', 'EUR', 6, 1, 2, '8/26/2017', 'wkrebs@comcast.net'),
('76b7e1fc-15a1-4692-88cc-92b5c98e4ac4', 'Hanging Sedge', 'Carex pendula Huds.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '72.75', 'USD', 2, 1, 1, 'null', 'naoya@verizon.net'),
('77614df0-1b92-409a-9d26-bec4a878ec01', 'Ryegrass Sedge', 'Carex loliacea L.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '873.35', 'USD', 23, 3, 2, '1/7/2018', 'naoya@verizon.net'),
('77f18662-bf4a-45bd-b208-03c6bf909483', 'Lanceleaf Sage', 'Salvia reflexa Hornem.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '427.36', 'GBP', 7, 1, 2, '9/29/2017', 'dburrows@live.com'),
('78356ed8-0852-4153-990b-5f6f859bb993', 'Rocky Mountain Buttercup', 'Ranunculus macauleyi A. Gray', '5ae22efb-f875-4134-a03d-6402efa31dc5', '254.94', 'AUD', 41, 1, 1, 'null', 'overbom@yahoo.com'),
('78ba3906-0402-496c-90bc-380dbcffc0a7', 'Lugard\'s Clover', 'Trifolium lugardii Bullock', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '314.39', 'HUF', 2, 2, 1, '9/8/2018', 'overbom@yahoo.com'),
('79590cf4-7ec4-4172-9286-ec465aa0e481', 'Island Spleenwort', 'Diellia ×lauii W.H. Wagner', '013cc380-c18b-4c87-8043-16e14f7127de', '135.66', 'EUR', 8, 3, 1, '9/18/2017', 'crobles@yahoo.com'),
('798cd50a-ace5-484d-ba3b-e5618fa398b1', 'Nutrush', 'Scleria laxa R. Br.', '013cc380-c18b-4c87-8043-16e14f7127de', '784.44', 'HUF', 39, 1, 2, '7/26/2018', 'jipsen@hotmail.com'),
('799fe42c-f920-4237-bb1f-d62fbbda178c', 'Dotted Bristle Fern', 'Trichomanes punctatum Poir. ssp. sphenoides (Kunze) W. Boer', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '506.16', 'AUD', 42, 2, 2, '12/10/2017', 'stefano@live.com'),
('7b495411-5133-4c1a-869d-f412328ee3a0', 'Hypotrachyna Lichen', 'Hypotrachyna pseudosinuosa (Asah.) Hale', '5249f33c-fadf-44d9-ab70-471df29c20a6', '830.54', 'EUR', 38, 3, 2, '3/26/2017', 'jgwang@aol.com'),
('7b5669c3-9f4e-46f6-af20-b64748306c1e', 'Bastard Oak', 'Quercus sinuata Walter var. breviloba (Torr.) C.H. Mull.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '291.96', 'GBP', 24, 2, 2, '7/13/2017', 'overbom@yahoo.com'),
('7d089378-a593-40cd-819b-80d0a9cbd346', 'Phaeographis', 'Phaeographis punctiformis (Eschw.) Müll. Arg.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '96.65', 'AUD', 22, 2, 1, '9/22/2017', 'cderoove@aolcom'),
('7dac45c3-b99e-4e68-8663-f599ec94219c', 'Heterocladium Moss', 'Heterocladium procurrens (Mitt.) A. Jaeger', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '645.92', 'AUD', 23, 1, 1, '11/10/2017', 'jfmulder@me.com'),
('7e091f5d-fd28-4bd1-9a38-bc1ce0fd815e', 'Sleepygrass', 'Achnatherum robustum (Vasey) Barkworth', '013cc380-c18b-4c87-8043-16e14f7127de', '763.63', 'GBP', 16, 1, 2, '12/30/2017', 'krueger@yahoo.com'),
('7e1a4d81-eada-4349-9bad-4f50bffb7869', 'Pincushion Tree', 'Hakea Schrad.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '393.63', 'HUF', 38, 2, 1, '5/31/2018', 'dburrows@live.com'),
('801c05c3-060c-40e6-929e-a34e91fa6025', 'New York Ironweed', 'Vernonia noveboracensis (L.) Michx.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '851.14', 'HUF', 22, 1, 1, '9/4/2017', 'crobles@yahoo.com'),
('80ae6056-c86a-44c4-876a-1c72d5464e03', 'Arizona Lescuraea Moss', 'Lescuraea arizonae (R.S. Williams) P. Wilson & Norris', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '14.63', 'GBP', 26, 3, 1, '9/11/2017', 'mallanmba@mac.com'),
('8168351f-9cab-45f9-9d60-f82652891d71', 'Charming Centaury', 'Centaurium venustum (A. Gray) B.L. Rob. ssp. venustum', '52ea143e-cb45-43af-981e-92cedb89f7a8', '116.49', 'USD', 36, 3, 1, '2/18/2018', 'wkrebs@comcast.net'),
('81a934df-2f8e-40e3-bac6-844a5d8bbc05', 'Horsehair Lichen', 'Bryoria simplicior (Vain.) Brodo & D. Hawksw.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '489.27', 'HUF', 50, 2, 1, 'null', 'naoya@verizon.net'),
('81c75df5-5048-4f7c-bba5-b88e844d2dde', 'Giant White Wakerobin', 'Trillium albidum J.D. Freeman', '5249f33c-fadf-44d9-ab70-471df29c20a6', '702.36', 'AUD', 12, 3, 1, '8/20/2017', 'cderoove@aolcom'),
('82662029-3d5d-42e3-b4e6-ad4abb406ae4', 'Scurf Hoarypea', 'Tephrosia chrysophylla Pursh', '52ea143e-cb45-43af-981e-92cedb89f7a8', '33.37', 'AUD', 3, 3, 1, '2/11/2018', 'dburrows@live.com'),
('8334000a-b88f-47db-8f2c-4f2185d9ab00', 'Small Enchanter\'s Nightshade', 'Circaea alpina L.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '12.04', 'USD', 7, 3, 1, '3/11/2018', 'jgwang@aol.com'),
('83a0b256-7746-4369-9a41-cadad080d9d7', 'Waxyleaf Nightshade', 'Solanum glaucophyllum Desf.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '78.79', 'USD', 36, 3, 2, '5/23/2018', 'bmidd@yahoo.com'),
('8434e66a-474f-4909-8af5-bc1b91514731', 'Santee Azalea', 'Rhododendron eastmanii K.A. Kron & M. Creel', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '147.69', 'JPY', 44, 3, 1, '8/26/2017', 'dburrows@live.com'),
('84adcc12-360f-45f4-b7cd-d180e07dcc1a', 'Foothill Larkspur', 'Delphinium hesperium A. Gray', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '673.57', 'JPY', 38, 3, 2, '11/6/2017', 'krueger@yahoo.com'),
('84f5d8e0-d12a-41c1-976e-0c0be4f574c2', 'Pallid Hoptree', 'Ptelea trifoliata L. ssp. pallida (Greene) V. Bailey', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '111.23', 'USD', 24, 2, 2, '1/23/2017', 'krueger@yahoo.com'),
('85ace14f-59b6-41e9-88cc-995e7ca91724', 'Largeflowered Fiddleneck', 'Amsinckia grandiflora (Kleeb. ex A. Gray) Kleeb. ex Greene', '5249f33c-fadf-44d9-ab70-471df29c20a6', '475.28', 'EUR', 43, 3, 2, '2/23/2018', 'jipsen@hotmail.com'),
('8617b549-0f2d-4c71-bffc-31a00a121a1c', 'San Bernardino Larkspur', 'Delphinium parryi A. Gray', '5249f33c-fadf-44d9-ab70-471df29c20a6', '956.12', 'JPY', 26, 1, 2, '12/29/2017', 'dburrows@live.com'),
('861da2ed-576d-4ad7-b562-fa644af836bd', 'Dwarf Morning-glory', 'Convolvulus tricolor L.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '61.95', 'EUR', 43, 2, 1, '7/28/2017', 'jfmulder@me.com'),
('8652db80-ed20-421a-ba72-0e7cf5ddddd3', 'Small Bluebells', 'Mertensia longiflora Greene', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '634.11', 'USD', 13, 2, 2, '10/29/2018', 'cderoove@aolcom'),
('865ba126-3f6a-43c7-b372-e01d8de6f8cd', 'Snakecotton', 'Froelichia Moench', '013cc380-c18b-4c87-8043-16e14f7127de', '126.68', 'GBP', 14, 1, 2, '8/4/2018', 'mfburgo@yahoo.com'),
('8728df89-00ba-4405-8501-492957dae44e', 'Douglas-fir Dwarf Mistletoe', 'Arceuthobium douglasii Engelm.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '603.07', 'EUR', 11, 2, 1, '7/1/2017', 'bhtower@sbcglobal.net'),
('89d54ce4-fdc3-46c7-90ed-8b5d71502098', 'Big Sacaton', 'Sporobolus wrightii Munro ex Scribn.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '225.83', 'EUR', 18, 1, 2, '8/18/2018', 'mhanoh@verizon.net'),
('8a31e0ff-15f9-4445-923c-55d613bc61c7', 'Hairyfruit Chervil', 'Chaerophyllum tainturieri Hook. var. dasycarpum Hook. ex S. Watson', '013cc380-c18b-4c87-8043-16e14f7127de', '352.17', 'HUF', 6, 2, 2, '3/26/2017', 'wkrebs@comcast.net'),
('8b300da1-8ccf-4b3b-a193-c6ad5fdaa375', 'Shrubby Restharrow', 'Ononis fruticosa L.', '013cc380-c18b-4c87-8043-16e14f7127de', '687.42', 'EUR', 22, 1, 1, '9/6/2017', 'naoya@verizon.net'),
('8b329e9e-48f4-466e-8996-fdef19a77c54', 'Spiderling', 'Boerhavia L.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '966.78', 'GBP', 43, 1, 1, '8/19/2017', 'mhanoh@verizon.net'),
('8ba40d6d-156a-452d-b911-a099ed6459dd', 'Sulphur-flower Buckwheat', 'Eriogonum umbellatum Torr. var. umbellatum', '5249f33c-fadf-44d9-ab70-471df29c20a6', '539.61', 'HUF', 40, 2, 1, '2/6/2017', 'naoya@verizon.net'),
('8bfbcb64-8111-42be-af22-32acf6e3a58f', 'Deercabbage', 'Nephrophyllidium Gilg', '52ea143e-cb45-43af-981e-92cedb89f7a8', '745.76', 'EUR', 29, 3, 2, 'null', 'cderoove@aolcom'),
('8c04cdff-cbb2-4628-8323-38123314bf32', 'Topelia Lichen', 'Topelia aperiens P.M. Jørg. & Vezda', '52ea143e-cb45-43af-981e-92cedb89f7a8', '680.37', 'EUR', 21, 1, 1, '11/11/2017', 'mhanoh@verizon.net'),
('8c1277f6-b839-4eb5-96ab-317d4ae23733', 'Purpleanther Field Pepperweed', 'Lepidium heterophyllum Benth.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '809.55', 'HUF', 41, 1, 2, '2/8/2018', 'jfmulder@me.com'),
('8d160f88-4275-44d3-8574-519c005fdd0a', 'Chiricahua Adder\'s-mouth Orchid', 'Malaxis soulei L.O. Williams', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '343.54', 'AUD', 6, 3, 1, 'null', 'krueger@yahoo.com'),
('8d724332-37ef-4e01-9cc3-3d956e74ca19', 'Exserted Indian Paintbrush', 'Castilleja exserta (A. Heller) T.I. Chuang & Heckard ssp. exserta', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '898.11', 'JPY', 30, 2, 1, '2/21/2017', 'jfmulder@me.com'),
('8d97d310-18f9-4dd7-9cdc-ef0adfda28b7', 'Polymeridium Lichen', 'Polymeridium subcinereum (Nyl.) R.C. Harris', '5249f33c-fadf-44d9-ab70-471df29c20a6', '70.44', 'USD', 6, 2, 2, '10/3/2017', 'wkrebs@comcast.net'),
('8db66372-b6d9-4bc1-80a3-5500a8a7d243', 'Purple Mountain Saxifrage', 'Saxifraga oppositifolia L.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '11.19', 'AUD', 16, 1, 2, '12/25/2018', 'mhanoh@verizon.net'),
('8e2d46fb-7233-44cf-9420-952e0c255191', 'Coigue', 'Nothofagus dombeyi (Mirb.) Blume', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '542.16', 'HUF', 31, 3, 1, '1/21/2018', 'jgwang@aol.com'),
('8ea2088b-c3bc-4e1b-b595-a84d317e8a77', 'Bladder Campion', 'Silene latifolia Poir.', '013cc380-c18b-4c87-8043-16e14f7127de', '348.82', 'HUF', 1, 2, 1, '10/28/2017', 'bmidd@yahoo.com'),
('8f2a031f-5ead-4e18-9e22-4106ce789f41', 'Elaeagnus Willow', 'Salix elaeagnos Scop.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '312.36', 'EUR', 6, 2, 2, '9/10/2018', 'overbom@yahoo.com'),
('8fa53be5-404e-4f14-ba3b-01029331b3e6', 'Virgin Island Passionflower', 'Passiflora murucuja L.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '697.34', 'AUD', 41, 3, 2, '7/7/2018', 'crobles@yahoo.com'),
('8fe576ce-7a78-475d-8939-b5a4689efebb', 'King\'s Serpentweed', 'Tonestus kingii (D.C. Eaton) G.L. Nesom', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '275.55', 'HUF', 21, 2, 2, '11/14/2017', 'krueger@yahoo.com'),
('902e85ba-8fff-4650-819e-1428222b7391', 'Spring Thistle', 'Cirsium vernale (Osterh.) Cockerell', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '658.72', 'HUF', 16, 1, 1, '4/7/2018', 'josem@aol.com'),
('90a30b88-fbbb-44d2-bae5-88bc01597b0d', 'Canada Mayflower', 'Maianthemum canadense Desf.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '329.99', 'USD', 15, 1, 1, '2/24/2017', 'krueger@yahoo.com'),
('90e35245-3912-44d1-80e0-b1b73be015ce', 'Newfoundland Dwarf Birch', 'Betula michauxii Sarg.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '289.85', 'GBP', 49, 2, 2, '2/25/2018', 'wkrebs@comcast.net'),
('90f7c36b-f018-47e8-b408-b7d19bd86a58', 'Ashy Silktassel', 'Garrya flavescens S. Watson', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '107.03', 'EUR', 34, 1, 1, '12/20/2017', 'cderoove@aolcom'),
('9189116e-0330-4ce7-9320-2ea06f9b774c', 'Tozer\'s Epipterygium Moss', 'Epipterygium tozeri (Grev.) Lindb.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '648.92', 'GBP', 28, 1, 1, '11/20/2018', 'josem@aol.com'),
('9189c7f1-3d18-4092-9e11-61c25dc67a5b', 'Piscidia', 'Piscidia L.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '545.23', 'AUD', 34, 2, 2, 'null', 'mhanoh@verizon.net'),
('91ec74d7-e8fa-4623-b10e-872e5547a4f4', 'Oriental Paperbush', 'Edgeworthia chrysantha Lindl.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '910.65', 'GBP', 43, 1, 2, 'null', 'overbom@yahoo.com'),
('9261e877-cda8-4f71-b823-8d0c968eb0a0', 'Cutleaf Indian Paintbrush', 'Castilleja lacera (Benth.) T.I. Chuang & Heckard', '5ae22efb-f875-4134-a03d-6402efa31dc5', '780.03', 'EUR', 1, 1, 2, '10/30/2017', 'jgwang@aol.com'),
('927bc1d1-1dc9-4b0b-ac1e-8394053bd1f8', 'Smallflower Swallow-wort', 'Cynanchum parviflorum Sw.', '013cc380-c18b-4c87-8043-16e14f7127de', '751.85', 'USD', 11, 3, 2, '4/1/2018', 'stefano@live.com'),
('93847f62-00c0-49df-b3ea-99a3322f67f3', 'Silky Dogwood', 'Cornus amomum Mill.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '787.45', 'AUD', 13, 3, 1, '7/23/2018', 'jipsen@hotmail.com'),
('944c46c8-a86b-4fca-9ac4-5b24ff647316', 'Wolf\'s Saltweed', 'Atriplex wolfii S. Watson', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '197.55', 'EUR', 33, 2, 2, '4/11/2018', 'overbom@yahoo.com'),
('94635bc1-de86-4281-9e38-698be3b5e0ef', 'Smooth Cliffbrake', 'Pellaea glabella Mett. ex Kuhn ssp. glabella', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '69.83', 'JPY', 7, 3, 2, '9/19/2018', 'wkrebs@comcast.net'),
('9610b82a-b50a-408d-a82b-820497f63a91', 'Oregon Buttercup', 'Ranunculus oreogenes Greene', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '571.44', 'HUF', 22, 1, 2, '1/4/2018', 'jgwang@aol.com'),
('967fdecf-cdbe-4d67-bb29-081041d6d527', 'Slender Meadowfoam', 'Limnanthes gracilis Howell ssp. gracilis', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '778.95', 'JPY', 37, 1, 1, '6/27/2017', 'cderoove@aolcom'),
('970757b0-97e6-4a7f-be93-e8bb210f53ec', 'Yelloweyed Grass', 'Xyris L.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '367.43', 'JPY', 28, 1, 1, 'null', 'stefano@live.com'),
('9708c29f-c477-413e-93ab-52a8949fd1f2', 'Coulter\'s Snapdragon', 'Sairocarpus coulterianus (Benth. ex A. DC.) D.A. Sutton', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '154.55', 'GBP', 16, 2, 2, 'null', 'naoya@verizon.net'),
('9765cf0b-41e1-4030-94d3-a71b4574cfdb', 'Squarestem Butterflybush', 'Buddleja saligna Willd.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '724.42', 'USD', 25, 2, 2, '10/17/2017', 'stefano@live.com'),
('9858cd1f-b696-4db0-9caa-c19bc24ae2ca', 'Devils Slide Schiedea', 'Schiedea verticillata F. Br.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '259.44', 'USD', 49, 3, 2, '4/16/2018', 'josem@aol.com'),
('989ccd4c-1259-4486-b7d2-0e5f2b8cfe90', 'Scribble Lichen', 'Opegrapha leucoplaca Müll. Arg.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '346.78', 'AUD', 24, 1, 2, '6/17/2017', 'jfmulder@me.com'),
('989d0fd5-3e65-427a-b60d-f5d9be33fc42', 'Pinewoods Bluestem', 'Andropogon arctatus Chapm.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '229.88', 'GBP', 39, 3, 1, '10/17/2017', 'bhtower@sbcglobal.net'),
('9998ee1c-5726-44a1-adb3-af41f12b6510', 'Peninsular Manzanita', 'Arctostaphylos peninsularis P.V. Wells', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '76.34', 'USD', 29, 2, 1, '1/21/2017', 'dburrows@live.com'),
('9a0042eb-3efb-45bf-8809-2656896585b4', 'Red Fescue', 'Festuca rubra L. ssp. rubra', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '158.39', 'USD', 15, 1, 1, '11/23/2018', 'jfmulder@me.com'),
('9bae42d5-ba4b-4153-8a88-fba0dd62a3f5', 'Small Bluebells', 'Mertensia longiflora Greene', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '671.47', 'EUR', 46, 1, 1, '1/15/2018', 'jipsen@hotmail.com'),
('9bf7fc6c-e416-4ab5-870d-578ae0349240', 'Wallflower', 'Erysimum L.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '294.11', 'JPY', 22, 1, 2, '8/9/2018', 'jgwang@aol.com'),
('9c0517d7-5b72-47b8-b52b-41fc27a9ec7f', 'Dicranoweisia Moss', 'Dicranoweisia Lindb. ex Milde', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '359.47', 'JPY', 5, 1, 2, '7/16/2017', 'mhanoh@verizon.net'),
('9c28bf0c-0d5f-4444-b529-c0be51ddccaf', 'Velvetseed Milkwort', 'Polygala obscura Benth.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '641.68', 'JPY', 40, 1, 2, 'null', 'naoya@verizon.net'),
('9d2800ce-db9a-42e1-9a28-822ef29d6c30', 'Celery', 'Apium L.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '36.41', 'EUR', 4, 1, 2, '8/26/2017', 'bmidd@yahoo.com'),
('9dacd439-3c0d-4842-ad64-0ae2696d58f3', 'Nevada Onion', 'Allium nevadense S. Watson', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '468.96', 'GBP', 26, 3, 2, '10/27/2018', 'bhtower@sbcglobal.net'),
('9e4cf542-1eb0-4600-ae1c-2b07613cf449', 'Musk Mallow', 'Malva moschata L.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '867.18', 'USD', 5, 1, 1, '1/19/2017', 'crobles@yahoo.com'),
('9eb2bee0-aee3-4e42-a1df-7bbc31c0916b', 'Falfurrias Milkvine', 'Matelea radiata Correll', '5249f33c-fadf-44d9-ab70-471df29c20a6', '777.97', 'AUD', 49, 3, 2, '12/8/2017', 'crobles@yahoo.com'),
('9f089ac3-ac6d-4d04-9a7f-f592a2d6c93c', 'Duran\'s Rush', 'Juncus duranii Ewan', '5ae22efb-f875-4134-a03d-6402efa31dc5', '301.76', 'USD', 8, 1, 1, '11/20/2018', 'mhanoh@verizon.net'),
('9f717761-144d-404d-a474-228fc5436687', 'Psilochilus', 'Psilochilus Barb. Rodr.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '382.93', 'USD', 15, 2, 2, '4/28/2017', 'cderoove@aolcom'),
('a1ab0cb9-2a47-4f9c-8f5e-35ef43fa834c', 'Alpine Bluebells', 'Mertensia alpina (Torr.) G. Don', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '957.08', 'GBP', 9, 1, 1, '6/24/2018', 'jipsen@hotmail.com'),
('a25a4b71-5c19-406e-9341-fab1aa8e5ea2', 'Gmelin\'s Buttercup', 'Ranunculus gmelinii DC.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '185.19', 'EUR', 9, 3, 1, '12/4/2017', 'mfburgo@yahoo.com'),
('a28c2197-fdd3-4eb9-a81b-03d8e62eace9', 'Corktree', 'Phellodendron Rupr.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '660.54', 'GBP', 42, 1, 2, '12/2/2017', 'josem@aol.com'),
('a2ccb66c-d0b6-449c-8806-7410deef9063', 'Molokai Nehe', 'Lipochaeta degeneri Sherff', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '261.33', 'USD', 24, 3, 1, '5/25/2017', 'mallanmba@mac.com'),
('a2fb668e-5680-4930-bf80-c6449b93b9ad', 'Marsh Lady\'s Tresses', 'Spiranthes odorata (Nutt.) Lindl.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '887.83', 'JPY', 32, 2, 2, '12/12/2017', 'wkrebs@comcast.net'),
('a449cd98-6b1f-45ab-a3d1-a7f1ec791f80', 'Tall Ragwort', 'Senecio serra Hook. var. admirabilis (Greene) A. Nelson', '013cc380-c18b-4c87-8043-16e14f7127de', '298.19', 'AUD', 12, 1, 1, 'null', 'dburrows@live.com'),
('a4c1c686-e0d0-4538-a460-6a6328c47a41', 'Rimrock Milkvetch', 'Astragalus desperatus M.E. Jones var. petrophilus M.E. Jones', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '328.37', 'JPY', 6, 1, 1, '5/2/2017', 'mallanmba@mac.com'),
('a4d60609-c3f7-4c6a-853a-c12a839c14f9', 'Miniature Marigold', 'Tagetes minima L.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '813.06', 'GBP', 9, 2, 1, '12/6/2018', 'jgwang@aol.com'),
('a4fa52bd-a7be-4870-903b-fa4d99443ba8', 'Addison\'s Rosette Grass', 'Dichanthelium ovale (Elliott) Gould & C.A. Clark var. addisonii (Nash) Gould & C.A. Clark', '5ae22efb-f875-4134-a03d-6402efa31dc5', '386.93', 'GBP', 15, 1, 1, '10/30/2017', 'jipsen@hotmail.com'),
('a630319e-7b8e-46df-829f-8ea8caf5ff49', 'Florida Pimpernel', 'Anagallis pumila Sw.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '248.42', 'HUF', 17, 2, 1, '8/13/2018', 'dburrows@live.com'),
('a70f1244-c085-4dc9-8516-60bdfabb378e', 'Rim Lichen', 'Lecanora salina H. Magn.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '247.72', 'USD', 6, 2, 2, 'null', 'jgwang@aol.com'),
('a74025ad-9d09-4dab-8ac1-a2b062b6bac7', 'Feltleaf Willow', 'Salix alaxensis (Andersson) Coville var. alaxensis', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '209.27', 'AUD', 29, 1, 1, '9/5/2018', 'mallanmba@mac.com'),
('a7487bfc-4773-445a-80fd-d878948ac556', 'Broussaisia', 'Broussaisia Gaudich.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '594.12', 'GBP', 10, 1, 2, 'null', 'bmidd@yahoo.com'),
('a7916aa6-95cc-4ac2-af73-46ba44d01852', 'Shrubby Fivefingers', 'Sibbaldiopsis tridentata (Aiton) Rydb.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '602.94', 'GBP', 1, 1, 2, '7/25/2017', 'crobles@yahoo.com'),
('a7a4b7da-c63a-43a6-8b39-401937f10364', 'Hawai\'i Cheesewood', 'Pittosporum hawaiiense Hillebr.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '941.84', 'JPY', 47, 2, 1, '12/9/2018', 'cderoove@aolcom'),
('a8b66499-d468-4bfb-b3cf-3e039f9ab24d', 'Douglas\' Stitchwort', 'Minuartia douglasii (Fenzl ex Torr. & A. Gray) Mattf.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '452.28', 'USD', 11, 1, 2, '3/6/2018', 'crobles@yahoo.com'),
('a8d31ed8-0ae0-4bec-9f9e-a2f03b0f3cdc', 'Appalachian Hedgenettle', 'Stachys appalachiana D.B. Poind. & J.B. Nelson', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '368.85', 'AUD', 25, 3, 1, '8/6/2017', 'stefano@live.com'),
('a94c210e-d738-462b-8273-a0ce4644f319', 'Anderson\'s Hawksbeard', 'Crepis runcinata (James) Torr. & A. Gray ssp. andersonii (A. Gray) Babc. & Stebbins', '5ae22efb-f875-4134-a03d-6402efa31dc5', '221.15', 'GBP', 33, 2, 1, 'null', 'mhanoh@verizon.net'),
('a9dc1b5d-9084-4168-9287-a57325629710', 'Coast Wallflower', 'Erysimum ammophilum A. Heller', '5ae22efb-f875-4134-a03d-6402efa31dc5', '349.16', 'GBP', 2, 1, 2, '3/4/2018', 'jgwang@aol.com'),
('a9f2c57c-56dc-40ad-9e74-7968bd45aebb', 'Slender Spikerush', 'Eleocharis tenuis (Willd.) Schult.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '971.66', 'EUR', 47, 1, 2, '10/25/2018', 'mhanoh@verizon.net'),
('aa301fcf-25ec-4658-ae0f-aea6d012c9cc', 'California Penstemon', 'Penstemon californicus (Munz & I.M. Johnst.) D.D. Keck', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '676.35', 'GBP', 14, 2, 1, '2/20/2017', 'jipsen@hotmail.com'),
('aa703a58-4d9a-41cf-b11b-aa0961aff60e', 'Pallid Hoptree', 'Ptelea trifoliata L. ssp. pallida (Greene) V. Bailey', '52ea143e-cb45-43af-981e-92cedb89f7a8', '684.47', 'EUR', 5, 1, 2, '11/1/2017', 'josem@aol.com'),
('abb9b59d-7add-4015-a640-53d3b376c5a4', 'Guiana Fern', 'Lomagramma guianensis (Aubl.) Ching', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '165.93', 'GBP', 2, 3, 1, '6/7/2018', 'stefano@live.com'),
('abc853b9-ceb9-46fa-84bb-2a6e127ea96f', 'Scarlet Gilia', 'Ipomopsis aggregata (Pursh) V.E. Grant ssp. formosissima (Greene) Wherry', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '493.98', 'USD', 3, 1, 1, '10/10/2018', 'mhanoh@verizon.net'),
('ac175e8c-c2a8-44e2-80fd-c7e1063f25af', 'Thicket Groundcherry', 'Physalis turbinata Medik.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '99.68', 'EUR', 39, 1, 2, 'null', 'jfmulder@me.com'),
('ac7a7ac9-e6b3-4bc5-b6f5-7177e961ef2f', 'Trachybryum Moss', 'Trachybryum megaptilum (Sull.) Schof.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '356.03', 'USD', 19, 1, 1, '1/24/2017', 'bmidd@yahoo.com'),
('ac98fc40-51d2-4a06-89cc-4a59c74f3b15', 'Ashy Pricklyleaf', 'Thymophylla tephroleuca (S.F. Blake) Strother', '52ea143e-cb45-43af-981e-92cedb89f7a8', '401.75', 'AUD', 19, 2, 2, '3/1/2017', 'jipsen@hotmail.com'),
('accc8018-c2ab-4fcd-8249-0638ae86ca28', 'Low Greenthread', 'Thelesperma caespitosum Dorn', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '520.81', 'HUF', 23, 3, 1, '8/27/2017', 'bmidd@yahoo.com'),
('ad379e54-f2f0-4e44-994d-e14859267e15', 'Cusick\'s Sunflower', 'Helianthus cusickii A. Gray', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '589.19', 'JPY', 12, 3, 2, '9/4/2018', 'krueger@yahoo.com'),
('ad3d9034-6b11-43e5-a1a5-e679711a5bd5', 'Harford\'s Oniongrass', 'Melica harfordii Bol.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '310.57', 'EUR', 45, 1, 1, '2/23/2017', 'crobles@yahoo.com'),
('ad706e6f-784e-45d6-9ed4-5278cfcb8f06', 'Twotooth Buckwheat', 'Eriogonum viridescens A. Heller', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '332.96', 'USD', 6, 1, 1, '1/2/2017', 'mhanoh@verizon.net'),
('adb3c9a6-8bcd-4593-a565-7144aeccff83', 'Hybrid Oak', 'Quercus ×sterretii Trel.', '013cc380-c18b-4c87-8043-16e14f7127de', '348.32', 'GBP', 18, 3, 1, '8/26/2017', 'jgwang@aol.com'),
('ae44f3f4-5ac8-4b10-938a-df3bf4ff8f16', 'Mountainparsley', 'Oreonana Jeps.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '181.08', 'USD', 22, 2, 2, '10/24/2018', 'crobles@yahoo.com'),
('ae50cd88-4c56-46c3-8362-a230d895a259', 'Copeland\'s Speedwell', 'Veronica copelandii Eastw.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '571.17', 'HUF', 3, 2, 2, '4/29/2018', 'krueger@yahoo.com'),
('aeb19b74-4156-4819-a2e2-b332519d0879', 'Greater Yellowthroat Gilia', 'Gilia tenuiflora Benth. ssp. arenaria (Benth.) A.D. Grant & V.E. Grant', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '45.72', 'USD', 28, 1, 1, '6/18/2017', 'naoya@verizon.net'),
('aed9b230-242c-466c-85c5-628c60df2017', 'Arrowleaf Violet', 'Viola sagittata Aiton var. sagittata', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '366.77', 'USD', 19, 3, 2, '7/6/2017', 'crobles@yahoo.com'),
('af14be0a-43b8-45da-9c1e-36f33f7e8d4e', 'Durango Yellowcress', 'Rorippa ramosa Rollins', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '890.62', 'AUD', 8, 1, 2, '7/30/2017', 'jgwang@aol.com'),
('afaa42d7-b1ce-4f50-bf19-6295c2b1692b', 'Alpine Woodfern', 'Dryopteris wallichiana (Spreng.) Hyl.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '179.31', 'EUR', 20, 2, 2, '1/24/2017', 'overbom@yahoo.com'),
('b0217b1f-3a43-4f9d-a875-2189fe0f3183', 'Ames\' Milkvetch', 'Astragalus pulsiferae A. Gray', '5249f33c-fadf-44d9-ab70-471df29c20a6', '40.01', 'EUR', 17, 3, 2, '3/21/2017', 'mallanmba@mac.com'),
('b136d205-d122-4284-abce-63e5fe5c64d5', 'Wart Lichen', 'Porina nucula Ach.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '426.85', 'EUR', 29, 3, 1, '1/20/2017', 'dburrows@live.com'),
('b1ddbbdc-0ac1-4389-9182-2a21f7689e35', 'Feverwort', 'Triosteum perfoliatum L.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '468.54', 'EUR', 36, 1, 2, 'null', 'cderoove@aolcom'),
('b224adaa-cc69-4dfe-9db7-c15fd44b5e67', 'Wharton\'s Dewberry', 'Rubus whartoniae L.H. Bailey', '5249f33c-fadf-44d9-ab70-471df29c20a6', '524.72', 'JPY', 18, 3, 1, '6/12/2017', 'josem@aol.com'),
('b3322af3-8907-41bb-9118-c8775ee7574b', 'Armenia Tephromela Lichen', 'Tephromela armeniaca (DC.) Hertel & Rambold', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '377.75', 'EUR', 9, 3, 1, 'null', 'jgwang@aol.com'),
('b3d2483f-04f5-4a5f-9a1f-bf859014d78d', 'Lunar Crater Buckwheat', 'Johanneshowellia crateriorum Reveal', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '904.63', 'AUD', 5, 3, 2, '1/2/2017', 'krueger@yahoo.com'),
('b40d8d85-d51c-4698-9e67-724ec3f13d22', 'Longstyle Rush', 'Juncus longistylis Torr.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '303.11', 'USD', 7, 2, 1, '5/9/2018', 'mfburgo@yahoo.com'),
('b42b7eb7-3144-4c68-adcb-808d45f0ac1e', 'Denuded Pseudoleskea Moss', 'Pseudoleskea radicosa (Mitt.) Macoun & Kindb. var. denudata (Kindb.) Wijk & Margad.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '877.85', 'HUF', 36, 3, 1, 'null', 'cderoove@aolcom'),
('b45b635d-36bb-44c1-b191-5748d90a7305', 'New Mexico Goosefoot', 'Chenopodium neomexicanum Standl. var. neomexicanum', '5ae22efb-f875-4134-a03d-6402efa31dc5', '431.63', 'USD', 20, 2, 1, '2/15/2017', 'wkrebs@comcast.net'),
('b48c4b88-474a-41c7-bc06-5cc736f91e2c', 'Sandloving Penstemon', 'Penstemon ammophilus N.H. Holmgren & L.M. Shultz', '013cc380-c18b-4c87-8043-16e14f7127de', '211.21', 'USD', 28, 2, 2, '6/30/2017', 'naoya@verizon.net'),
('b64687cc-36ae-4859-b5fc-b9755242bf23', 'Tortella Moss', 'Tortella (Lindb.) Limpr.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '689.91', 'HUF', 49, 1, 1, '9/8/2017', 'overbom@yahoo.com'),
('b6d9d854-4c21-41b9-99f9-a2b6a6144214', 'Wood\'s Cycad', 'Encephalartos woodii Sander', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '816.76', 'GBP', 42, 2, 2, 'null', 'jfmulder@me.com'),
('b79b446f-458c-4d46-ada6-f0deaf253708', 'Hybrid Oak', 'Quercus ×cocksii Sarg.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '44.64', 'EUR', 44, 2, 2, '8/31/2017', 'crobles@yahoo.com'),
('b7a5e7cb-de86-47c6-bb8a-74c9a37de5fa', 'Thread Lichen', 'Ephebe lanata (L.) Vain.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '898.43', 'HUF', 18, 3, 2, 'null', 'jfmulder@me.com'),
('b7e6ba04-368e-4c3b-971a-27fb509b0f43', 'Glycine', 'Glycine tomentella Hayata', '5ae22efb-f875-4134-a03d-6402efa31dc5', '524.59', 'HUF', 8, 3, 2, 'null', 'krueger@yahoo.com'),
('b91d30d3-1f72-4a36-a490-f119feba212a', 'Barratt\'s Sedge', 'Carex barrattii Schwein. & Torr.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '271.37', 'HUF', 29, 3, 1, '5/22/2018', 'overbom@yahoo.com'),
('b94e3d60-d13e-4aed-8ff4-d69db968da5f', 'Parmotrema Lichen', 'Parmotrema internexum (Nyl.) Hale', '52ea143e-cb45-43af-981e-92cedb89f7a8', '348.93', 'HUF', 38, 2, 2, '4/2/2018', 'dburrows@live.com'),
('b9c9db59-bc9f-467c-bac4-9c9ee601207c', 'Pygmy Poppy', 'Eschscholzia minutiflora S. Watson', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '649.94', 'HUF', 21, 1, 2, '8/31/2018', 'jfmulder@me.com'),
('ba5264ec-4f4a-47ba-9aff-522f62baf843', 'Chilean Wormseed', 'Dysphania chilensis (Schrad.) Mosyakin & Clemants', '5ae22efb-f875-4134-a03d-6402efa31dc5', '759.91', 'GBP', 37, 3, 2, '4/2/2017', 'bhtower@sbcglobal.net'),
('ba965f2d-c1ec-4380-9462-2d5564f48633', 'Maidenstears', 'Silene vulgaris (Moench) Garcke', '5249f33c-fadf-44d9-ab70-471df29c20a6', '229.42', 'GBP', 13, 1, 1, '3/3/2018', 'josem@aol.com'),
('bad30fc1-4f10-4dfd-9633-fbb885b60a5c', 'Memphisgrass', 'Cutandia memphitica (Spreng.) K. Richt.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '23.61', 'EUR', 39, 1, 1, '11/1/2018', 'bmidd@yahoo.com'),
('bb28e22e-4ba0-4a53-973b-7ac03336de88', 'Canadian Hawkweed', 'Hieracium kalmii L. var. fasciculatum (Pursh) Lepage', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '59.85', 'GBP', 36, 2, 1, '5/20/2018', 'mfburgo@yahoo.com'),
('bbc1202d-302b-4117-ab93-dd37c04cf462', 'Crested Floatingheart', 'Nymphoides cristata (Roxb.) Kuntze', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '181.59', 'USD', 39, 2, 1, '5/7/2018', 'mallanmba@mac.com'),
('bc159c03-f55f-41fe-8318-6810e5fe7efe', 'Ballona Cinquefoil', 'Potentilla multijuga Lehm.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '435.11', 'JPY', 37, 3, 2, '8/2/2017', 'jgwang@aol.com'),
('bc30210a-09d3-4fcf-93b7-e7f5602d1c93', 'Sweet Michelia', 'Michelia doltsopa Buch.-Ham. ex DC.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '986.86', 'GBP', 47, 1, 2, '11/13/2017', 'jgwang@aol.com'),
('bc482e9b-34e4-4bae-b9af-694b968360a1', 'Creeping Alkaligrass', 'Puccinellia phryganodes (Trin.) Scribn. & Merr.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '565.02', 'JPY', 12, 3, 1, '2/5/2017', 'crobles@yahoo.com'),
('bdbca78e-ae37-41cf-acd7-d8ce43c64191', 'Annual Marsh Elder', 'Iva annua L. var. caudata (Small) R.C. Jacks.', '013cc380-c18b-4c87-8043-16e14f7127de', '734.56', 'EUR', 46, 2, 1, '9/13/2017', 'overbom@yahoo.com'),
('bdd45201-bdeb-4e69-bece-5aaeb59ea67c', 'Indianhemp', 'Apocynum cannabinum L.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '821.35', 'JPY', 20, 3, 1, '12/27/2017', 'jgwang@aol.com'),
('bdf2e71d-fd65-4b60-bd22-54d1a821996e', 'Lemon Lily', 'Lilium parryi S. Watson', '52ea143e-cb45-43af-981e-92cedb89f7a8', '294.76', 'GBP', 48, 2, 1, '5/11/2017', 'jfmulder@me.com'),
('be271a4e-14e7-48cf-b939-d05f91365ce7', 'Heartleaf Skullcap', 'Scutellaria ovata Hill ssp. pseudoarguta Epling', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '668.35', 'AUD', 39, 2, 2, '11/15/2017', 'jfmulder@me.com'),
('becaee8b-2528-42d4-8762-3e3b35657316', 'Scribner\'s Grass', 'Scribneria bolanderi (Thurb.) Hack.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '163.38', 'USD', 6, 1, 1, '2/14/2017', 'jgwang@aol.com'),
('bf41b634-2942-4928-9ff9-1fab4993350c', 'Dendroalsia Moss', 'Dendroalsia E. Britton', '5249f33c-fadf-44d9-ab70-471df29c20a6', '384.66', 'HUF', 29, 3, 1, '2/25/2017', 'mfburgo@yahoo.com'),
('bf7878ac-6f4a-4559-8dda-908f9bcdbcaf', 'Escarpment Milkvetch', 'Astragalus striatiflorus M.E. Jones', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '314.02', 'GBP', 44, 3, 1, '10/6/2017', 'naoya@verizon.net'),
('bfdd8435-fbe1-4f64-adc0-8f3b6d0f388c', 'Blue Fiestaflower', 'Pholistoma auritum (Lindl.) Lilja', '52ea143e-cb45-43af-981e-92cedb89f7a8', '266.83', 'HUF', 49, 3, 1, '1/17/2017', 'jgwang@aol.com'),
('c0188bdb-94e8-4370-b3af-6098e4b4f2fe', 'Capulí', 'Prunus serotina Ehrh. ssp. capuli (Cav.) McVaugh', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '562.51', 'EUR', 22, 2, 2, '5/13/2018', 'bhtower@sbcglobal.net'),
('c078820c-1975-4c75-a1a5-70b162e9e1e4', 'Trimezia', 'Trimezia Salisb. ex Herb.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '681.29', 'EUR', 23, 3, 2, '10/29/2018', 'dburrows@live.com'),
('c07cf2f4-9012-43d1-9e09-07fb4d743a86', 'Frosted Lichen', 'Physconia enteroxantha (Nyl.) Poelt', '5ae22efb-f875-4134-a03d-6402efa31dc5', '492.59', 'JPY', 37, 3, 2, '11/6/2017', 'jfmulder@me.com'),
('c0db4b3f-d0d7-4b78-ae4f-c4208ec4c7c2', 'Coral Necklace', 'Illecebrum L.', '013cc380-c18b-4c87-8043-16e14f7127de', '374.61', 'GBP', 22, 3, 1, '11/30/2018', 'dburrows@live.com'),
('c1d0f2cf-6c0c-4f12-9e60-a6886d4c0116', 'Pterygiopsis Lichen', 'Pterygiopsis Vain.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '35.89', 'GBP', 3, 3, 2, '11/6/2018', 'josem@aol.com'),
('c2a199f2-10d2-46bb-80e0-559e2182764c', 'Rumohra', 'Rumohra Raddi', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '896.92', 'GBP', 11, 2, 1, '7/11/2017', 'crobles@yahoo.com'),
('c2d27b95-6e10-4e51-adaf-0c96dab9df20', 'Dogfennel', 'Eupatorium capillifolium (Lam.) Small', '5249f33c-fadf-44d9-ab70-471df29c20a6', '468.27', 'JPY', 20, 1, 2, '6/28/2018', 'naoya@verizon.net'),
('c34f679b-5a89-44fb-810b-b1936fee3c14', 'Rock Draba', 'Draba arabisans Michx.', '013cc380-c18b-4c87-8043-16e14f7127de', '843.25', 'EUR', 34, 3, 2, 'null', 'mallanmba@mac.com'),
('c44dac86-72a3-4020-9c7b-306f189a090f', 'Neckera Moss', 'Neckera complanata (Hedw.) Hüb.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '633.46', 'HUF', 44, 1, 2, '2/25/2017', 'dburrows@live.com'),
('c4a5f378-f923-4edb-b1f3-9443d3aa5feb', 'Parasitic Dactylospora Lichen', 'Dactylospora parasitica (Flörke ex Spreng.) Zopf', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '901.14', 'JPY', 12, 3, 1, 'null', 'bhtower@sbcglobal.net'),
('c516399c-cabd-4022-9ebc-e8c783cb4188', 'California Antitrichia Moss', 'Antitrichia californica Sull.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '818.37', 'HUF', 39, 2, 2, '7/12/2017', 'josem@aol.com'),
('c5cde1a4-7e8d-4891-ba30-ae98acef0838', 'Key West Threeawn', 'Aristida floridana (Chapm.) Vasey', '52ea143e-cb45-43af-981e-92cedb89f7a8', '913.14', 'HUF', 31, 2, 1, '9/12/2017', 'krueger@yahoo.com'),
('c621c5e4-3271-4760-b0bb-14f868d1e001', 'Large-flower Primrose-willow', 'Ludwigia grandiflora (Michx.) Greuter & Burdet ssp. hexapetala (Hook. & Arn.) G.L. Nesom & Kartesz', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '93.02', 'HUF', 16, 3, 1, '2/9/2018', 'bmidd@yahoo.com'),
('c682faab-047f-4c53-948b-d15efef2143e', 'Spreading Amaranth', 'Amaranthus crassipes Schltdl.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '148.22', 'EUR', 39, 2, 1, '11/10/2018', 'stefano@live.com'),
('c7c2a18e-6893-4e37-9e7e-a0b6be688338', 'Desert Madwort', 'Alyssum desertorum Stapf var. himalayensis Dudley', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '771.58', 'GBP', 7, 2, 2, '6/7/2017', 'naoya@verizon.net'),
('c870bf04-0af8-4c6e-99dc-54faf6e07a2f', 'Widowscross', 'Sedum pulchellum Michx.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '327.06', 'EUR', 41, 1, 1, '7/22/2017', 'crobles@yahoo.com'),
('c9c741b1-1dc4-438d-a65e-2f1b4f304d55', 'San Clemente Island Woodland-star', 'Lithophragma maximum Bacig.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '848.14', 'JPY', 10, 2, 2, '1/18/2018', 'bhtower@sbcglobal.net'),
('ca0338f0-2d8f-4277-8b67-26cc6e37570c', 'Narrowleaf Pussytoes', 'Antennaria stenophylla (A. Gray) A. Gray', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '549.33', 'USD', 26, 1, 1, '8/27/2018', 'jgwang@aol.com'),
('ca12b0bf-64c8-47ca-98cc-07f4a035eff6', 'Zarzabacoa De Dos Hojas', 'Zornia gemella Vogel', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '588.66', 'JPY', 14, 3, 2, '1/8/2017', 'krueger@yahoo.com'),
('ca49d9e2-1aea-4c80-affe-64165d548deb', 'Erectleaf Panicgrass', 'Dichanthelium erectifolium (Nash) Gould & C.A. Clark', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '187.11', 'GBP', 24, 3, 2, 'null', 'crobles@yahoo.com'),
('cafd3c46-b4c9-430c-b9ca-ae45149dc945', 'Douglas\' Bladderpod', 'Lesquerella douglasii S. Watson', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '347.36', 'USD', 44, 2, 1, '11/17/2018', 'jipsen@hotmail.com'),
('cbb58f63-5b73-4d62-9201-ecece69ebb9d', 'Boxelder', 'Acer negundo L. var. violaceum (G. Kirchn.) H. Jaeger', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '81.55', 'JPY', 48, 3, 2, '5/26/2018', 'crobles@yahoo.com'),
('cbb7d347-0b52-487b-9621-ddd05d6f2563', 'Early Goldenrod', 'Solidago juncea Aiton', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '829.45', 'HUF', 35, 2, 2, '6/9/2017', 'dburrows@live.com'),
('cbca6845-f02e-4a12-9843-db1d3eecdcfd', 'Luquillo Mountain Babyboot Orchid', 'Lepanthes eltoroensis Stimson', '5ae22efb-f875-4134-a03d-6402efa31dc5', '107.39', 'HUF', 19, 2, 2, '9/12/2018', 'bhtower@sbcglobal.net'),
('cc565720-48af-4ee9-83ff-4f1c7a431fa5', 'Prairie Cordgrass', 'Spartina pectinata Bosc ex Link', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '434.34', 'EUR', 28, 3, 1, '11/1/2018', 'bmidd@yahoo.com'),
('ccc4cf08-4279-461d-8e05-27a1a7e55c14', 'Yellow Woodland Anemone', 'Anemone ranunculoides L.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '915.44', 'HUF', 50, 2, 2, '10/15/2018', 'bhtower@sbcglobal.net'),
('cce021cb-d976-4f52-b2e8-f99caeb575ed', 'Water Figwort', 'Scrophularia umbrosa Dumort.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '477.06', 'USD', 31, 1, 1, '9/1/2018', 'overbom@yahoo.com'),
('cd61d7f7-5a14-45e9-8f84-9ade867a061d', 'Saddle Mountain Bittercress', 'Cardamine pattersonii L.F. Hend.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '599.45', 'AUD', 13, 3, 1, '10/22/2017', 'mallanmba@mac.com'),
('cd70533e-8b6d-4b79-a0ff-f9e0ee3af0d1', 'Meadow Garlic', 'Allium canadense L. var. lavandulare (Bates) Ownbey & Aase', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '238.77', 'HUF', 8, 3, 2, '2/11/2018', 'bhtower@sbcglobal.net'),
('cddf5afe-e184-4db6-bc10-62bd7dcee7d7', 'False Goldeneye', 'Heliomeris Nutt.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '904.31', 'USD', 5, 1, 1, 'null', 'naoya@verizon.net'),
('cdfb1824-bc3e-4b5f-b70b-b997ae03237d', 'Burnet Ragwort', 'Packera sanguisorboides (Rydb.) W.A. Weber & Á. Löve', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '733.88', 'GBP', 30, 3, 1, '8/4/2018', 'mhanoh@verizon.net'),
('ce17c16c-d69c-46f9-adc7-9c4e2f14dc01', 'Marsh Labrador Tea', 'Ledum palustre L.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '543.15', 'GBP', 38, 3, 1, '5/15/2018', 'mallanmba@mac.com'),
('ce6fd5f3-96dc-4082-8a83-9ef32b59879a', 'Rasp-leaf Pelargonium', 'Pelargonium radens H.E. Moore', '5ae22efb-f875-4134-a03d-6402efa31dc5', '939.14', 'GBP', 29, 3, 2, '7/19/2018', 'jipsen@hotmail.com'),
('ce83c64a-d573-4e48-b03a-bf085851bec4', 'Copper Mine Milkvetch', 'Astragalus cobrensis A. Gray', '013cc380-c18b-4c87-8043-16e14f7127de', '468.59', 'USD', 1, 2, 2, '8/14/2017', 'bhtower@sbcglobal.net'),
('ce9d3340-0bda-4851-96f7-b94ac8f20404', 'Gourka', 'Garcinia dulcis (Roxb.) Kurz', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '727.18', 'AUD', 23, 2, 1, '12/28/2017', 'bhtower@sbcglobal.net'),
('d05b857e-8f2d-480e-9c6f-fba6b149df5e', 'Seaside Fleabane', 'Erigeron glaucus Ker Gawl.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '280.97', 'JPY', 41, 1, 2, '1/9/2018', 'dburrows@live.com'),
('d09e65d2-bf9e-467d-8154-044a20fed70e', 'Fendler\'s Tuckermannopsis Lichen', 'Tuckermannopsis fendleri (Nyl.) Hale', '5249f33c-fadf-44d9-ab70-471df29c20a6', '511.12', 'AUD', 42, 3, 2, '2/12/2018', 'crobles@yahoo.com'),
('d0ad2a1b-4c1a-44ce-b98f-f512c380d62b', 'Stiffbranch Bird\'s Beak', 'Cordylanthus rigidus (Benth.) Jeps.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '903.07', 'EUR', 14, 2, 2, '2/22/2017', 'cderoove@aolcom'),
('d27821e6-7d5c-4135-9e3a-6601c43592b4', 'Atamasco Lily', 'Zephyranthes atamasca (L.) Herb.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '336.94', 'EUR', 32, 2, 1, '8/20/2017', 'cderoove@aolcom'),
('d2f02abe-d5d1-40aa-b5ae-7cf94155027b', 'Laurel Willow', 'Salix pentandra L.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '670.58', 'AUD', 23, 2, 2, '4/14/2017', 'jipsen@hotmail.com'),
('d31d21ab-343f-43c8-993f-1547b3772c04', 'Redscale Scaly Polypody', 'Pleopeltis polylepis (Roem. ex Kunze) T. Moore var. erythrolepis (Weath.) T. Wendt', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '841.88', 'EUR', 40, 2, 2, '9/5/2017', 'mhanoh@verizon.net'),
('d3a0e93c-a516-4658-a1b9-4570aeb5e6ff', 'Pholisma', 'Pholisma Nutt. ex Hook.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '903.64', 'EUR', 18, 1, 2, 'null', 'wkrebs@comcast.net'),
('d3a756cb-910c-44d4-866f-5045119aae20', 'Sickle Oligotrichum Moss', 'Oligotrichum falcatum Steere', '5249f33c-fadf-44d9-ab70-471df29c20a6', '487.77', 'JPY', 44, 2, 2, '8/7/2017', 'bmidd@yahoo.com'),
('d3f4cfc5-2f94-48d0-9d9e-5701e8e74420', 'Cascade Popcornflower', 'Plagiobothrys hispidus A. Gray', '5249f33c-fadf-44d9-ab70-471df29c20a6', '588.93', 'EUR', 48, 3, 1, '10/12/2017', 'wkrebs@comcast.net'),
('d479ad32-215e-42a5-8545-96927fadb179', 'Smooth Purple Coneflower', 'Echinacea laevigata (C.L. Boynt. & Beadle) S.F. Blake', '5ae22efb-f875-4134-a03d-6402efa31dc5', '281.99', 'EUR', 10, 1, 2, '11/18/2018', 'naoya@verizon.net'),
('d4e8db20-d626-4940-909e-55de39810196', 'Oriental Wheat', 'Triticum turanicum Jakubz.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '125.89', 'EUR', 40, 1, 1, '10/31/2017', 'bmidd@yahoo.com'),
('d5b879d9-5e46-4bac-bb5f-c86feffa837e', 'Pygmy Manzanita', 'Arctostaphylos mendocinoensis P.V. Wells', '52ea143e-cb45-43af-981e-92cedb89f7a8', '922.18', 'AUD', 45, 2, 1, '4/21/2018', 'bhtower@sbcglobal.net'),
('d5fff60c-f8bf-4577-891b-94f9393b857a', 'Anderson\'s Milkvetch', 'Astragalus andersonii A. Gray', '5ae22efb-f875-4134-a03d-6402efa31dc5', '121.36', 'HUF', 10, 3, 1, 'null', 'wkrebs@comcast.net'),
('d64bcc72-9304-49a2-bfc2-247d1b0d8a40', 'Martinique Foldwing', 'Dicliptera martinicensis (Jacq.) Juss.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '395.69', 'HUF', 43, 3, 2, '10/21/2017', 'mallanmba@mac.com'),
('d6dc4fc6-99c4-4356-ac55-0f36df0d96b6', 'Sycamore', 'Platanus L.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '726.21', 'JPY', 49, 3, 2, '7/8/2018', 'jfmulder@me.com'),
('d8101d11-e2f4-4554-926f-f63fe3781d8f', 'Ontario Dicranum Moss', 'Dicranum ontariense Peters.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '320.15', 'EUR', 45, 3, 2, '9/8/2018', 'jfmulder@me.com'),
('d827c87a-d483-4744-ae73-1e898e8af7d7', 'Purple Twinpod', 'Physaria geyeri (Hook.) A. Gray var. purpurea Rollins', '5ae22efb-f875-4134-a03d-6402efa31dc5', '561.76', 'USD', 28, 2, 1, '4/9/2018', 'crobles@yahoo.com'),
('d8f59017-3aed-4a86-8034-bd29c92820b8', 'Lecidea Lichen', 'Lecidea diducens Nyl.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '354.56', 'AUD', 40, 3, 1, '1/14/2018', 'mhanoh@verizon.net'),
('d8f748a3-403b-49bc-af56-d748a968016b', 'Thornless Dewberry', 'Rubus uniformis L.H. Bailey', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '54.97', 'EUR', 48, 2, 2, '11/26/2018', 'jfmulder@me.com'),
('d9aa4d6a-25ae-485f-930a-556f0e0744c1', 'Columbian Whitetop Aster', 'Sericocarpus rigidus Lindl.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '131.39', 'EUR', 50, 3, 2, '9/27/2017', 'wkrebs@comcast.net'),
('da1c9338-6db1-4512-8e86-74206abf4f40', 'Mediterranean Clover', 'Trifolium spumosum L.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '781.53', 'GBP', 11, 1, 2, '10/1/2017', 'krueger@yahoo.com'),
('dae5162e-077b-43e7-a052-fa6f3a59e6af', 'Woolly Pussytoes', 'Antennaria lanata (Hook.) Greene', '5249f33c-fadf-44d9-ab70-471df29c20a6', '187.58', 'AUD', 23, 3, 1, '7/23/2017', 'mallanmba@mac.com'),
('dc7ecbb9-1164-4a07-9233-f5a77608004d', 'Bog Clermontia', 'Clermontia grandiflora Gaudich. ssp. munroi (H. St. John) Lammers', '5ae22efb-f875-4134-a03d-6402efa31dc5', '387.11', 'GBP', 1, 1, 2, '5/7/2017', 'jfmulder@me.com'),
('dcaa8b19-850c-40f4-ab9b-b45ffbe3e87d', 'Pillar Apple', 'Malus tschonoskii (Maxim.) C.K. Schneid.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '543.38', 'GBP', 41, 1, 1, '7/12/2017', 'dburrows@live.com'),
('dcb482b7-90f6-4049-89b4-36f778426863', 'Hairy Spotflower', 'Acmella pilosa R.K. Jansen', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '804.63', 'HUF', 11, 2, 2, 'null', 'naoya@verizon.net'),
('dd4b9eee-00c9-4178-92ac-e14ccc95ef67', 'Blue Skullcap', 'Scutellaria lateriflora L.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '436.89', 'AUD', 13, 1, 2, '9/4/2018', 'josem@aol.com'),
('ddc3375a-2bba-4575-a190-c4922dec175f', 'Troubled Milkvetch', 'Astragalus anxius R.J. Meinke & Kaye', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '922.66', 'AUD', 16, 2, 2, '7/7/2018', 'cderoove@aolcom'),
('de2a911e-9e4c-474f-890a-861e72dcee91', 'Florida Keys Hempvine', 'Mikania cordifolia (L. f.) Willd.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '475.46', 'EUR', 33, 2, 1, '11/13/2017', 'jfmulder@me.com'),
('df081902-64bd-4e29-9f3c-f238ee870a7c', 'Lesser Hawkbit', 'Leontodon taraxacoides (Vill.) Mérat ssp. longirostris Finch & Sell', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '507.34', 'EUR', 38, 1, 1, '4/16/2018', 'dburrows@live.com'),
('df8bc865-9a9a-4d2a-a4d1-6a67f5c590f4', 'Zygodon Moss', 'Zygodon viridissimus (Dicks.) Brid.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '976.64', 'USD', 14, 1, 2, '4/2/2017', 'stefano@live.com'),
('e01e1174-413e-4ef2-bfef-b43a187c2473', 'Erect Pricklypear', 'Opuntia dillenii (Ker Gawl.) Haw.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '43.16', 'AUD', 38, 1, 2, '11/26/2017', 'mfburgo@yahoo.com'),
('e029e0c2-eb68-4f59-9b2d-a7c7fced9f41', 'Tracy\'s Mistmaiden', 'Romanzoffia tracyi Jeps.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '855.57', 'HUF', 22, 1, 1, 'null', 'dburrows@live.com'),
('e141512e-5d83-4795-ad98-d74decd763e1', 'Firethread Sedge', 'Carex scopulorum T. Holm var. prionophylla (T. Holm) L.A. Standl.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '177.47', 'AUD', 38, 2, 1, '9/20/2018', 'jipsen@hotmail.com'),
('e162fc2c-9ac2-4921-844f-ab1603a49f52', 'Fanleaf Geranium', 'Geranium divaricatum Ehrh.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '273.92', 'JPY', 49, 2, 2, 'null', 'jgwang@aol.com'),
('e18316c0-ebf7-4763-88d9-834c6d92f1af', 'Shining False Indigo', 'Amorpha nitens Boynt.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '48.86', 'EUR', 31, 1, 1, '5/21/2017', 'naoya@verizon.net'),
('e189c092-49d2-4d40-baeb-0042b2146b1b', 'Oat', 'Avena L.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '907.63', 'HUF', 33, 3, 2, '1/2/2017', 'josem@aol.com'),
('e2357c6a-352f-4e17-a493-9d729c4f7bb0', 'Nodding Plumeless Thistle', 'Carduus nutans L.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '910.69', 'USD', 20, 1, 2, 'null', 'bmidd@yahoo.com'),
('e2f6b6f2-aa97-4a28-8188-dc5b9c76de7b', 'Tephromela Lichen', 'Tephromela aglaea (Sommerf.) Hertel & Rambold', '5ae22efb-f875-4134-a03d-6402efa31dc5', '524.71', 'HUF', 44, 2, 2, '2/8/2017', 'overbom@yahoo.com'),
('e30ff611-d82c-485d-aed6-f25a5ed0d3f2', 'Small Coastal Germander', 'Teucrium cubense Jacq. var. laevigatum (Vahl) Shinners', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '189.33', 'HUF', 9, 3, 1, '9/30/2017', 'wkrebs@comcast.net'),
('e3dfec75-10ee-437a-aed7-b1dfa427c845', 'Sixangle Foldwing', 'Dicliptera sexangularis (L.) Juss.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '410.16', 'USD', 27, 1, 1, '3/5/2018', 'dburrows@live.com'),
('e422a8a8-5b1d-4c12-af59-d74afe32b185', 'Silverscale Saltbush', 'Atriplex argentea Nutt. ssp. argentea', '5249f33c-fadf-44d9-ab70-471df29c20a6', '543.23', 'GBP', 44, 3, 2, '7/13/2018', 'dburrows@live.com'),
('e441971a-5f28-41b7-a790-48d73db1aac0', 'Boreal Cup Lichen', 'Cladonia borealis S. Stenroos', '52ea143e-cb45-43af-981e-92cedb89f7a8', '788.15', 'EUR', 7, 2, 1, 'null', 'mhanoh@verizon.net'),
('e50a8065-9abf-44da-a3a1-4f5059bc9138', 'Cecidonia Lichen', 'Cecidonia umbonella (Nyl.) Triebel & Rambold', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '988.17', 'HUF', 23, 2, 1, '4/26/2017', 'mfburgo@yahoo.com'),
('e62c8ba6-f838-40dd-a036-1f6c24278142', 'Peirson\'s Pincushion', 'Chaenactis carphoclinia A. Gray var. peirsonii (Jeps.) Munz', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '370.06', 'GBP', 25, 3, 1, '1/21/2017', 'josem@aol.com'),
('e6c448b2-62dd-41aa-a962-f55531ec4d63', 'Beet', 'Beta adanensis A. Pamukc. ex Aellen', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '439.73', 'JPY', 38, 2, 1, '4/28/2017', 'mallanmba@mac.com'),
('e7c71305-cdca-46d4-b50b-cb0573aadd72', 'Larch', 'Larix Mill.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '987.89', 'HUF', 3, 1, 1, '10/28/2018', 'josem@aol.com'),
('e845b98e-8ce2-4995-9e21-dc0dea73c467', 'Dwarf Groundsmoke', 'Gayophytum humile Juss.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '834.54', 'HUF', 37, 2, 1, '7/2/2017', 'bhtower@sbcglobal.net'),
('e9080536-9400-40aa-860e-b54f619eae98', 'Surf Thistle', 'Cirsium rhothophilum S.F. Blake', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '894.23', 'EUR', 38, 1, 2, '4/19/2018', 'naoya@verizon.net'),
('e912f236-e0d1-49ab-b1e4-58c52b414acb', 'Sitka Alder', 'Alnus viridis (Chaix) DC. ssp. sinuata (Regel) Á. Löve & D. Löve', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '829.96', 'JPY', 31, 3, 1, 'null', 'mhanoh@verizon.net'),
('e9c0a7b4-cb65-4eda-b8ab-06b82972f8a1', 'Winter Vetch', 'Vicia villosa Roth ssp. villosa', '52ea143e-cb45-43af-981e-92cedb89f7a8', '265.74', 'JPY', 22, 3, 2, '3/11/2018', 'mfburgo@yahoo.com'),
('eaecca43-c4cf-44a3-b975-d1a55a289a9f', 'White Heath Aster', 'Symphyotrichum ericoides (L.) G.L. Nesom', '5ae22efb-f875-4134-a03d-6402efa31dc5', '586.98', 'GBP', 26, 3, 2, '11/2/2018', 'dburrows@live.com'),
('eb7009c8-ae62-45d0-bee7-1ed82d32dcd1', 'Plains Greasebush', 'Glossopetalon spinescens A. Gray var. planitierum (Ensign) Yatsk.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '879.81', 'JPY', 30, 1, 2, '11/9/2017', 'bmidd@yahoo.com'),
('eb717529-e616-406b-838e-5f284ba29b6c', 'Scutula Lichen', 'Scutula Tul.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '328.64', 'EUR', 41, 3, 1, '4/24/2017', 'jipsen@hotmail.com'),
('ebf4d4c4-80b7-4f9a-bae2-e61d07d04c28', 'Chapman\'s Yelloweyed Grass', 'Xyris chapmanii Bridges & Orzell', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '997.72', 'JPY', 37, 2, 2, '5/10/2018', 'bhtower@sbcglobal.net'),
('ebfb3e8d-889c-480d-b3ad-b049e2f26ef6', 'White Blue-eyed Grass', 'Sisyrinchium albidum Raf.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '892.69', 'EUR', 46, 3, 2, '12/5/2017', 'mhanoh@verizon.net'),
('ecc99274-dea4-40ae-b151-3c42e9eb6760', 'Fruit Rockcress', 'Arabis fructicosa A. Nelson', '52ea143e-cb45-43af-981e-92cedb89f7a8', '440.15', 'EUR', 34, 2, 1, '2/26/2018', 'mfburgo@yahoo.com'),
('ecf43b4d-b3ec-4241-b8f6-8c9f6dc0e21a', 'False Baby\'s Breath', 'Galium mollugo L.', '013cc380-c18b-4c87-8043-16e14f7127de', '227.57', 'HUF', 36, 2, 2, '11/27/2018', 'krueger@yahoo.com'),
('ed9f37ed-5092-4482-bad2-6b16a8441ff4', 'Phlox Heliotrope', 'Heliotropium convolvulaceum (Nutt.) A. Gray var. californicum (Greene) I.M. Johnst.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '964.31', 'HUF', 5, 3, 1, '4/19/2017', 'stefano@live.com'),
('edaf434a-d21c-4b96-a0d3-1e4949c26308', 'Coastal Agave', 'Agave shawii Engelm.', '013cc380-c18b-4c87-8043-16e14f7127de', '516.27', 'HUF', 21, 1, 2, '4/30/2018', 'cderoove@aolcom'),
('ee483bb0-9daa-4dc2-a616-3c16aed5c815', 'Maui Clermontia', 'Clermontia micrantha (Hillebr.) Rock', '013cc380-c18b-4c87-8043-16e14f7127de', '69.45', 'EUR', 39, 3, 2, '12/16/2018', 'overbom@yahoo.com');
INSERT INTO `listing` (`ID`, `title`, `description`, `location_id`, `listing_price`, `currency`, `quantity`, `status_id`, `marketplace_id`, `upload_time`, `owner_email`) VALUES
('f19bbc9c-1392-4ef4-8af6-b9fbf906a521', 'Bogrush', 'Schoenus L.', '5ae22efb-f875-4134-a03d-6402efa31dc5', '195.22', 'HUF', 11, 1, 1, '9/16/2018', 'stefano@live.com'),
('f1cbae05-e882-473c-b338-d589324961b2', 'Ocellularia Lichen', 'Ocellularia G. Mey.', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '141.54', 'USD', 4, 1, 1, '7/1/2017', 'cderoove@aolcom'),
('f2495099-7f7a-4d04-be15-deffd868f091', 'Bud Saxifrage', 'Saxifraga bryophora A. Gray', '52ea143e-cb45-43af-981e-92cedb89f7a8', '974.39', 'AUD', 45, 1, 1, '4/5/2017', 'cderoove@aolcom'),
('f275d6c3-be8a-4ab7-8e6d-2f95e147bf11', 'Hairy Lipfern', 'Cheilanthes lanosa (Michx.) D.C. Eaton', '5ae22efb-f875-4134-a03d-6402efa31dc5', '679.81', 'AUD', 18, 3, 1, '5/20/2017', 'josem@aol.com'),
('f341de54-4034-48ff-a734-a4ec56d7abb0', 'Lindley\'s Clarkia', 'Clarkia amoena (Lehm.) A. Nelson & J.F. Macbr. ssp. lindleyi (Douglas) F.H. Lewis & M.E. Lewis', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '858.26', 'HUF', 16, 3, 2, 'null', 'crobles@yahoo.com'),
('f3ae994b-1912-47ff-bdeb-888ebfefa973', 'Roundleaf Serviceberry', 'Amelanchier sanguinea (Pursh) DC. var. sanguinea', '013cc380-c18b-4c87-8043-16e14f7127de', '439.33', 'GBP', 45, 1, 2, '6/11/2018', 'jfmulder@me.com'),
('f3c4f8e0-8f91-4bd8-98e9-2e55bcc8a454', 'Kalinia Grass', 'Kalinia H.L. Bell & Columbus', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '107.97', 'HUF', 47, 1, 1, '3/6/2017', 'bhtower@sbcglobal.net'),
('f49baf88-f05f-4997-a8d0-835d0ea5968e', 'Bejuco Prieto', 'Pristimera caribaea (Urb.) A.C. Sm.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '233.27', 'USD', 14, 3, 1, '10/16/2017', 'bhtower@sbcglobal.net'),
('f4b1e404-524b-4024-b16d-47877984b13a', 'Stalked Spikemoss', 'Selaginella substipitata Spring', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '24.23', 'JPY', 11, 2, 1, '5/3/2018', 'bmidd@yahoo.com'),
('f4b79dd6-7508-40d8-b291-d30cf6b7e88e', 'Northern Wildrice', 'Zizania palustris L. var. palustris', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '920.26', 'JPY', 8, 3, 2, '11/15/2017', 'jipsen@hotmail.com'),
('f508a02e-cb52-4335-8135-44a8ce321a1f', 'Checkered Jointtail Grass', 'Coelorachis tessellata (Steud.) Nash', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '30.56', 'AUD', 41, 3, 2, '1/24/2018', 'dburrows@live.com'),
('f5297b9e-e0fc-4854-b7f0-00461ae676ce', 'Brown\'s Indian Rosewood', 'Dalbergia brownei (Jacq.) Schinz', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '635.94', 'EUR', 26, 3, 1, '6/18/2017', 'bmidd@yahoo.com'),
('f5979373-711e-4e12-885a-22333d911a96', 'Coast Plantain', 'Plantago bigelovii A. Gray ssp. californica (Greene) Bassett', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '26.52', 'HUF', 47, 1, 1, '11/13/2018', 'jgwang@aol.com'),
('f603c18f-3778-42d0-826b-28e44029b698', 'Yerba Maravilla', 'Ruellia coccinea (L.) Vahl', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '174.94', 'EUR', 8, 1, 1, '12/17/2018', 'mfburgo@yahoo.com'),
('f63ceefd-06b5-4125-984e-b84850aef258', 'South African Oatgrass', 'Karroochloa Conert & Türpe', '5249f33c-fadf-44d9-ab70-471df29c20a6', '16.46', 'USD', 29, 1, 1, '12/17/2018', 'mhanoh@verizon.net'),
('f687311a-7b7d-45b7-9b86-ca2597e2f626', 'Baeckea', 'Baeckea L.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '954.36', 'USD', 5, 1, 2, '11/24/2017', 'naoya@verizon.net'),
('f6fcd1fe-f614-4400-b91f-e932caba19a2', 'Iowa Rim Lichen', 'Lecanora iowensis Fink', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '186.89', 'JPY', 39, 2, 1, '2/3/2018', 'bmidd@yahoo.com'),
('f6fd92ab-60bf-4457-aa73-bb69b3fe2b40', 'Japanese Flowering Crab Apple', 'Malus floribunda Siebold ex Van Houtte', '52ea143e-cb45-43af-981e-92cedb89f7a8', '256.91', 'HUF', 50, 3, 1, '3/13/2018', 'dburrows@live.com'),
('f7f31f13-77c7-48c7-b2aa-e504d4905522', 'Don Quixote\'s Lace', 'Yucca treculeana Carrière var. treculeana', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '230.62', 'HUF', 25, 2, 2, '3/25/2017', 'jfmulder@me.com'),
('f824dfef-79b4-43df-ba5a-d782e3e93312', 'Summer Coralroot', 'Corallorhiza maculata (Raf.) Raf.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '965.27', 'AUD', 7, 3, 1, '1/14/2017', 'wkrebs@comcast.net'),
('f8800567-4379-41ed-a2db-d87da9dc2f39', 'Lucretia Dewberry', 'Rubus roribaccus (L.H. Bailey) Rydb.', 'c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', '787.48', 'JPY', 20, 1, 1, '7/3/2018', 'wkrebs@comcast.net'),
('f8a63431-fd11-4645-a1df-53bc977b21e6', 'Sonora False Goldenaster', 'Heterotheca marginata Semple', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '798.04', 'JPY', 10, 1, 2, '3/14/2017', 'mallanmba@mac.com'),
('f8be6b4a-54e4-4da6-8b5d-02a3e5a85483', 'Trask\'s Island Broom', 'Lotus dendroideus (Greene) Greene var. traskiae (Eastw. ex Noddin) Isely', '5ae22efb-f875-4134-a03d-6402efa31dc5', '743.19', 'USD', 41, 2, 1, '9/23/2017', 'mfburgo@yahoo.com'),
('f99929bb-5316-41da-b938-77b5aa3959ae', 'Elliott\'s Beaksedge', 'Rhynchospora elliottii A. Dietr.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '722.48', 'EUR', 9, 2, 2, '6/18/2017', 'crobles@yahoo.com'),
('f9ce9f9e-4f5a-4944-ad60-b190215ec342', 'Carolina Crabgrass', 'Digitaria pubiflora (Vasey) Wipff', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '408.66', 'AUD', 5, 3, 1, '7/25/2017', 'jipsen@hotmail.com'),
('fa1aee92-04fb-409f-ab76-0915e63d3486', 'California Fetid Adderstongue', 'Scoliopus bigelovii Torr.', '5249f33c-fadf-44d9-ab70-471df29c20a6', '661.95', 'AUD', 27, 3, 2, '1/10/2018', 'cderoove@aolcom'),
('fa524fb9-5823-4636-8010-de279d8599ab', 'Watauga Porella', 'Porella wataugensis (Sull.) Underw.', 'bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', '719.54', 'AUD', 43, 2, 1, 'null', 'jipsen@hotmail.com'),
('fb2961ae-cbde-406e-b652-68be069e9336', 'Frosty Wattle', 'Acacia pruinosa A. Cunn. ex Benth.', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '634.34', 'HUF', 36, 3, 1, '11/6/2017', 'josem@aol.com'),
('fb6a466a-c152-461c-a06f-fe26024175ff', 'Cheesewood', 'Pittosporum halophilum Rock', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '586.65', 'JPY', 40, 1, 1, '12/7/2018', 'naoya@verizon.net'),
('fd93ee36-8b81-4cd0-83e5-ad384256be41', 'Homalotheciella Moss', 'Homalotheciella (Cardot) Broth.', '5c3a4cf8-1ac4-456d-ba85-a782ff475256', '195.27', 'GBP', 18, 1, 1, '4/18/2018', 'jipsen@hotmail.com'),
('fdc37630-39bc-4f07-8d2a-e908d28a7fc1', 'Thistleleaf Aster', 'Eurybia eryngiifolia (Torr. & A. Gray) G.L. Nesom', '0fe479bb-fe39-4265-b59f-bb4ac5a060d4', '625.87', 'HUF', 11, 3, 1, '12/3/2017', 'mallanmba@mac.com'),
('fe5d4922-a32e-4a9d-9e03-8769a1443908', 'Leatherstem', 'Jatropha dioica Cerv.', '52ea143e-cb45-43af-981e-92cedb89f7a8', '398.54', 'USD', 42, 2, 2, '8/29/2018', 'jgwang@aol.com'),
('fea4ac28-ab40-41ea-9498-3be062155432', 'Mantisalca', 'Mantisalca Cass.', '013cc380-c18b-4c87-8043-16e14f7127de', '566.89', 'HUF', 40, 2, 2, '2/15/2018', 'mhanoh@verizon.net'),
('ff60edfe-b4ca-4913-96ab-99317c44c945', 'True Indigo', 'Indigofera tinctoria L.', '013cc380-c18b-4c87-8043-16e14f7127de', '230.64', 'JPY', 8, 3, 2, '5/17/2018', 'overbom@yahoo.com'),
('ff6ba561-76a1-43a3-bac5-3eda26d92557', 'Blue Birch', 'Betula ×caerulea Blanch. (pro sp.)', '5249f33c-fadf-44d9-ab70-471df29c20a6', '497.01', 'USD', 13, 3, 1, '12/19/2017', 'josem@aol.com'),
('ff83d6a5-1bf9-43aa-bed2-c83ea2c97606', 'Skeletonweed', 'Chaetadelpha A. Gray ex S. Watson', '1d551b07-fd16-4760-88a3-4aa4fda13a2b', '308.33', 'JPY', 6, 2, 2, '1/21/2017', 'mhanoh@verizon.net'),
('ff976098-341c-488d-b4ae-26aef5aa6bbc', 'Tapertip Smartweed', 'Polygonum acuminatum Kunth', '013cc380-c18b-4c87-8043-16e14f7127de', '963.09', 'JPY', 47, 1, 1, '11/14/2017', 'mhanoh@verizon.net'),
('ffbff852-9173-44d8-937a-823803ae05cb', 'Purple Stonecrop', 'Sedum villosum L.', 'ac867cd8-c321-42ab-b179-01a4b8301a9c', '252.25', 'JPY', 19, 1, 1, '12/15/2017', 'mfburgo@yahoo.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `listingstatus`
--

CREATE TABLE `listingstatus` (
  `ID` int(8) NOT NULL,
  `status_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `listingstatus`
--

INSERT INTO `listingstatus` (`ID`, `status_name`) VALUES
(1, 'ACTIVE'),
(2, 'SCHEDULED'),
(3, 'CANCELLED');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `location`
--

CREATE TABLE `location` (
  `ID` varchar(36) NOT NULL,
  `manager_name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address_primary` varchar(100) NOT NULL,
  `address_secondary` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `town` varchar(100) NOT NULL,
  `postal_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `location`
--

INSERT INTO `location` (`ID`, `manager_name`, `phone`, `address_primary`, `address_secondary`, `country`, `town`, `postal_code`) VALUES
('013cc380-c18b-4c87-8043-16e14f7127de', 'Corabelle Andell', '814-117-3255', '277 High Crossing Center', 'null', 'Serbia', 'Ljig', 'null'),
('0fe479bb-fe39-4265-b59f-bb4ac5a060d4', 'Carmon Jaan', '439-467-3876', '329 Hagan Road', 'null', 'Palestinian Territory', 'Al Mughayyir', 'null'),
('1d551b07-fd16-4760-88a3-4aa4fda13a2b', 'Giles Glowacz', '244-722-6967', '27 Rutledge Street', 'null', 'China', 'Zudun', 'null'),
('5249f33c-fadf-44d9-ab70-471df29c20a6', 'Rivkah Gossipin', '124-485-4990', '4427 Menomonie Parkway', 'null', 'China', 'Jinshi', 'null'),
('52ea143e-cb45-43af-981e-92cedb89f7a8', 'Petronia Brimacombe', '437-811-7206', '48 Maple Court', 'null', 'China', 'Langjun', 'null'),
('5ae22efb-f875-4134-a03d-6402efa31dc5', 'Karena Millions', '619-231-8898', '952 Magdeline Street', 'null', 'Mauritius', 'Quatre Bornes', 'null'),
('5c3a4cf8-1ac4-456d-ba85-a782ff475256', 'Concettina Ambroisin', '136-741-4091', '19 Hoepker Avenue', 'null', 'Nicaragua', 'Matiguás', 'null'),
('ac867cd8-c321-42ab-b179-01a4b8301a9c', 'Flory Samweyes', '933-637-1296', '03 Kedzie Avenue', 'null', 'New Zealand', 'North Shore', '0748'),
('bfcd9dc2-3ead-470b-9846-5a3f6d8f32a1', 'Paton Fuxman', '130-697-0310', '0274 Buell Road', 'null', 'Argentina', 'Caseros', '3262'),
('c47ab7b4-3a94-4218-8e0b-4bada1fb05c0', 'Dill Garr', '602-419-4659', '1 Sommers Avenue', 'null', 'United States', 'Phoenix', '85010');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `marketplace`
--

CREATE TABLE `marketplace` (
  `ID` int(8) NOT NULL,
  `marketplace_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `marketplace`
--

INSERT INTO `marketplace` (`ID`, `marketplace_name`) VALUES
(1, 'EBAY'),
(2, 'AMAZON');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `listing`
--
ALTER TABLE `listing`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `listingstatus`
--
ALTER TABLE `listingstatus`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `marketplace`
--
ALTER TABLE `marketplace`
  ADD PRIMARY KEY (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

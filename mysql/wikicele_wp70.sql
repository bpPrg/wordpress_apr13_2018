-- MySQL dump 10.16  Distrib 10.1.31-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: wikicele_wp70
-- ------------------------------------------------------
-- Server version	10.1.31-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wped_automatic_amazon_links`
--

DROP TABLE IF EXISTS `wped_automatic_amazon_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_automatic_amazon_links` (
  `link_url` varchar(500) NOT NULL,
  `link_title` varchar(500) NOT NULL,
  `link_keyword` varchar(300) NOT NULL,
  `link_status` varchar(20) NOT NULL,
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `link_desc` mediumtext NOT NULL,
  `link_price` mediumtext NOT NULL,
  `link_img` varchar(750) NOT NULL,
  `link_review` text NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_automatic_amazon_links`
--

LOCK TABLES `wped_automatic_amazon_links` WRITE;
/*!40000 ALTER TABLE `wped_automatic_amazon_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_automatic_amazon_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_automatic_articles_keys`
--

DROP TABLE IF EXISTS `wped_automatic_articles_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_automatic_articles_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `camp_id` int(11) NOT NULL,
  `keyword` varchar(200) NOT NULL,
  `page_num` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `last_page` int(11) NOT NULL DEFAULT '999',
  `articlesbase_lastadd` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_keywordID` (`camp_id`,`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_automatic_articles_keys`
--

LOCK TABLES `wped_automatic_articles_keys` WRITE;
/*!40000 ALTER TABLE `wped_automatic_articles_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_automatic_articles_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_automatic_articles_links`
--

DROP TABLE IF EXISTS `wped_automatic_articles_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_automatic_articles_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(300) NOT NULL,
  `keyword` varchar(300) NOT NULL,
  `page_num` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `title` mediumtext NOT NULL,
  `bing_cache` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_automatic_articles_links`
--

LOCK TABLES `wped_automatic_articles_links` WRITE;
/*!40000 ALTER TABLE `wped_automatic_articles_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_automatic_articles_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_automatic_cached`
--

DROP TABLE IF EXISTS `wped_automatic_cached`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_automatic_cached` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_external` text NOT NULL,
  `img_internal` text NOT NULL,
  `img_path` text NOT NULL,
  `img_hash` varchar(50) NOT NULL,
  `img_data_hash` varchar(50) NOT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_automatic_cached`
--

LOCK TABLES `wped_automatic_cached` WRITE;
/*!40000 ALTER TABLE `wped_automatic_cached` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_automatic_cached` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_automatic_camps`
--

DROP TABLE IF EXISTS `wped_automatic_camps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_automatic_camps` (
  `camp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campaign ID',
  `camp_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_keywords` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_post_title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_cb_category` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_replace_link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_post_every` int(11) NOT NULL,
  `camp_add_star` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_post_category` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_options` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `feeds` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Articles',
  `camp_search_order` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_amazon_cat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_youtube_cat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_youtube_order` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_amazon_region` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `camp_post_author` int(11) NOT NULL,
  `camp_post_custom_k` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_post_custom_v` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_post_exact` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_general` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_post_execlude` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_yt_user` varchar(59) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_translate_to` varchar(59) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_translate_from` varchar(59) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_translate_to_2` varchar(59) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_post_type` varchar(59) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  PRIMARY KEY (`camp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_automatic_camps`
--

LOCK TABLES `wped_automatic_camps` WRITE;
/*!40000 ALTER TABLE `wped_automatic_camps` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_automatic_camps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_automatic_categories`
--

DROP TABLE IF EXISTS `wped_automatic_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_automatic_categories` (
  `cat_id` int(11) NOT NULL,
  `cat_parent` int(11) NOT NULL DEFAULT '0',
  `cat_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_automatic_categories`
--

LOCK TABLES `wped_automatic_categories` WRITE;
/*!40000 ALTER TABLE `wped_automatic_categories` DISABLE KEYS */;
INSERT INTO `wped_automatic_categories` (`cat_id`, `cat_parent`, `cat_name`) VALUES (1253,0,'Arts &amp; Entertainment'),(1510,0,'Betting Systems'),(1266,0,'Business / Investing'),(1283,0,'Computers / Internet'),(1297,0,'Cooking, Food &amp; Wine'),(1308,0,'E-business &amp; E-marketing'),(1362,0,'Education'),(1332,0,'Employment &amp; Jobs'),(1338,0,'Fiction'),(1340,0,'Games'),(1344,0,'Green Products'),(1347,0,'Health &amp; Fitness'),(1366,0,'Home &amp; Garden'),(1377,0,'Languages'),(1392,0,'Mobile'),(1400,0,'Parenting &amp; Families'),(1408,0,'Politics / Current Events'),(1410,0,'Reference'),(1419,0,'Self-Help'),(1432,0,'Software &amp; Services'),(1461,0,'Spirituality, New Age &amp; Alternative Beliefs'),(1472,0,'Sports'),(1494,0,'Travel'),(1265,1253,'Architecture'),(1259,1253,'Art'),(1254,1253,'Body Art'),(1261,1253,'Dance'),(1263,1253,'Fashion'),(1255,1253,'Film &amp; Television'),(1260,1253,'General'),(1262,1253,'Humor'),(1519,1253,'Magic Tricks'),(1256,1253,'Music'),(1257,1253,'Photography'),(1258,1253,'Radio'),(1264,1253,'Theater'),(1515,1510,'Casino Table Games'),(1517,1510,'Football'),(1511,1510,'General'),(1512,1510,'Horse Racing'),(1514,1510,'Lottery'),(1513,1510,'Poker'),(1516,1510,'Soccer'),(1275,1266,'Careers, Industries &amp; Professions'),(1520,1266,'Commodities'),(1277,1266,'Debt'),(1271,1266,'Derivatives'),(1280,1266,'Economics'),(1268,1266,'Equities &amp; Stocks'),(1267,1266,'Foreign Exchange'),(1270,1266,'General'),(1276,1266,'International Business'),(1278,1266,'Management &amp; Leadership'),(1273,1266,'Marketing &amp; Sales'),(1279,1266,'Outsourcing'),(1274,1266,'Personal Finance'),(1269,1266,'Real Estate'),(1272,1266,'Small Biz / Entrepreneurship'),(1290,1283,'Databases'),(1295,1283,'Email Services'),(1292,1283,'General'),(1285,1283,'Graphics'),(1288,1283,'Hardware'),(1291,1283,'Networking'),(1293,1283,'Operating Systems'),(1287,1283,'Programming'),(1286,1283,'Software'),(1296,1283,'System Administration'),(1294,1283,'System Analysis &amp; Design'),(1289,1283,'Web Hosting'),(1284,1283,'Web Site Design'),(1300,1297,'BBQ'),(1298,1297,'Baking'),(1303,1297,'Cooking'),(1304,1297,'Drinks &amp; Beverages'),(1305,1297,'General'),(1299,1297,'Recipes'),(1306,1297,'Regional &amp; Intl.'),(1301,1297,'Special Diet'),(1302,1297,'Special Occasions'),(1307,1297,'Vegetables / Vegetarian'),(1521,1297,'Wine Making'),(1309,1308,'Affiliate Marketing'),(1311,1308,'Article Marketing'),(1326,1308,'Auctions'),(1330,1308,'Banners'),(1318,1308,'Blog Marketing'),(1323,1308,'Classified Advertising'),(1328,1308,'Consulting'),(1327,1308,'Copywriting'),(1325,1308,'Domains'),(1312,1308,'E-commerce Operations'),(1320,1308,'E-zine Strategies'),(1321,1308,'Email Marketing'),(1324,1308,'General'),(1317,1308,'Market Research'),(1319,1308,'Marketing'),(1322,1308,'Niche Marketing'),(1314,1308,'Paid Surveys'),(1313,1308,'Pay Per Click Advertising'),(1310,1308,'Promotion'),(1315,1308,'SEM &amp; SEO'),(1331,1308,'Social Media Marketing'),(1316,1308,'Submitters'),(1329,1308,'Video Marketing'),(1364,1362,'Admissions'),(1522,1362,'Educational Materials'),(1523,1362,'Higher Education'),(1524,1362,'K-12'),(1365,1362,'Student Loans'),(1363,1362,'Test Prep &amp; Study Guides'),(1335,1332,'Cover Letter &amp; Resume Guides'),(1337,1332,'General'),(1334,1332,'Job Listings'),(1336,1332,'Job Search Guides'),(1333,1332,'Job Skills / Training'),(1339,1338,'General'),(1342,1340,'Console Guides &amp; Repairs'),(1343,1340,'General'),(1341,1340,'Strategy Guides'),(1345,1344,'Alternative Energy'),(1346,1344,'Conservation &amp; Efficiency'),(1525,1344,'General'),(1357,1347,'Addiction'),(1361,1347,'Beauty'),(1359,1347,'Dental Health'),(1348,1347,'Diets &amp; Weight Loss'),(1354,1347,'Exercise &amp; Fitness'),(1360,1347,'General'),(1526,1347,'Meditation'),(1352,1347,'Men&#039;s Health'),(1355,1347,'Mental Health'),(1350,1347,'Nutrition'),(1349,1347,'Remedies'),(1527,1347,'Sleep and Dreams'),(1356,1347,'Spiritual Health'),(1351,1347,'Strength Training'),(1353,1347,'Women&#039;s Health'),(1358,1347,'Yoga'),(1368,1366,'Animal Care &amp; Pets'),(1371,1366,'Crafts &amp; Hobbies'),(1374,1366,'Entertaining'),(1367,1366,'Gardening &amp; Horticulture'),(1373,1366,'General'),(1376,1366,'Homebuying'),(1369,1366,'How-to &amp; Home Improvements'),(1375,1366,'Interior Design'),(1372,1366,'Sewing'),(1370,1366,'Weddings'),(1391,1377,'Arabic'),(1383,1377,'Chinese'),(1385,1377,'English'),(1378,1377,'French'),(1381,1377,'German'),(1389,1377,'Hebrew'),(1390,1377,'Hindi'),(1382,1377,'Italian'),(1380,1377,'Japanese'),(1387,1377,'Other'),(1386,1377,'Russian'),(1384,1377,'Sign Language'),(1379,1377,'Spanish'),(1388,1377,'Thai'),(1518,1392,'Apps'),(1397,1392,'Developer Tools'),(1395,1392,'General'),(1393,1392,'Ringtones'),(1396,1392,'Security'),(1394,1392,'Video'),(1528,1400,'Divorce'),(1402,1400,'Education'),(1405,1400,'Genealogy'),(1407,1400,'General'),(1406,1400,'Marriage'),(1403,1400,'Parenting'),(1401,1400,'Pregnancy &amp; Childbirth'),(1404,1400,'Special Needs'),(1409,1408,'General'),(1529,1410,'Automotive'),(1412,1410,'Catalogs &amp; Directories'),(1411,1410,'Consumer Guides'),(1413,1410,'Education'),(1418,1410,'Etiquette'),(1416,1410,'Gay / Lesbian'),(1417,1410,'General'),(1414,1410,'Law &amp; Legal Issues'),(1530,1410,'The Sciences'),(1415,1410,'Writing'),(1431,1419,'Abuse'),(1423,1419,'Dating Guides'),(1430,1419,'Eating Disorders'),(1427,1419,'General'),(1420,1419,'Marriage &amp; Relationships'),(1422,1419,'Motivational / Transformational'),(1426,1419,'Personal Finance'),(1531,1419,'Public Speaking'),(1532,1419,'Self Defense'),(1429,1419,'Self-Esteem'),(1421,1419,'Stress Management'),(1425,1419,'Success'),(1428,1419,'Time Management'),(1438,1432,'Anti Adware / Spyware'),(1436,1432,'Background Investigations'),(1460,1432,'Communications'),(1441,1432,'Dating'),(1457,1432,'Developer Tools'),(1456,1432,'Digital Photos'),(1437,1432,'Drivers'),(1453,1432,'Education'),(1448,1432,'Email'),(1433,1432,'Foreign Exchange Investing'),(1445,1432,'General'),(1452,1432,'Graphic Design'),(1446,1432,'Hosting'),(1444,1432,'Internet Tools'),(1447,1432,'MP3 &amp; Audio'),(1458,1432,'Networking'),(1455,1432,'Operating Systems'),(1443,1432,'Other Investment Software'),(1459,1432,'Personal Finance'),(1450,1432,'Productivity'),(1434,1432,'Registry Cleaners'),(1435,1432,'Reverse Phone Lookup'),(1454,1432,'Screensavers &amp; Wallpaper'),(1439,1432,'Security'),(1440,1432,'System Optimization'),(1449,1432,'Utilities'),(1442,1432,'Video'),(1451,1432,'Web Design'),(1465,1461,'Astrology'),(1470,1461,'General'),(1463,1461,'Hypnosis'),(1466,1461,'Magic'),(1462,1461,'Numerology'),(1468,1461,'Paranormal'),(1467,1461,'Psychics'),(1469,1461,'Religion'),(1471,1461,'Tarot'),(1464,1461,'Witchcraft'),(1483,1472,'Automotive'),(1476,1472,'Baseball'),(1485,1472,'Basketball'),(1473,1472,'Coaching'),(1533,1472,'Cycling'),(1491,1472,'Extreme Sports'),(1488,1472,'Football'),(1490,1472,'General'),(1474,1472,'Golf'),(1493,1472,'Hockey'),(1481,1472,'Individual Sports'),(1480,1472,'Martial Arts'),(1492,1472,'Mountaineering'),(1484,1472,'Other Team Sports'),(1482,1472,'Outdoors &amp; Nature'),(1479,1472,'Racket Sports'),(1534,1472,'Running'),(1477,1472,'Soccer'),(1489,1472,'Softball'),(1478,1472,'Training'),(1475,1472,'Volleyball'),(1486,1472,'Water Sports'),(1487,1472,'Winter Sports'),(1535,1494,'Africa'),(1495,1494,'Asia'),(1500,1494,'Canada'),(1503,1494,'Caribbean'),(1499,1494,'Europe'),(1498,1494,'General'),(1501,1494,'Latin America'),(1502,1494,'Middle East'),(1496,1494,'Specialty Travel'),(1497,1494,'United States');
/*!40000 ALTER TABLE `wped_automatic_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_automatic_clickbank_links`
--

DROP TABLE IF EXISTS `wped_automatic_clickbank_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_automatic_clickbank_links` (
  `link_url` varchar(500) NOT NULL,
  `link_title` varchar(500) NOT NULL,
  `link_keyword` varchar(300) NOT NULL,
  `link_status` varchar(20) NOT NULL,
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `link_desc` mediumtext NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_automatic_clickbank_links`
--

LOCK TABLES `wped_automatic_clickbank_links` WRITE;
/*!40000 ALTER TABLE `wped_automatic_clickbank_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_automatic_clickbank_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_automatic_feeds_links`
--

DROP TABLE IF EXISTS `wped_automatic_feeds_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_automatic_feeds_links` (
  `camp_id` varchar(150) NOT NULL,
  `link` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_automatic_feeds_links`
--

LOCK TABLES `wped_automatic_feeds_links` WRITE;
/*!40000 ALTER TABLE `wped_automatic_feeds_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_automatic_feeds_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_automatic_general`
--

DROP TABLE IF EXISTS `wped_automatic_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_automatic_general` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(50) NOT NULL,
  `item_type` text NOT NULL,
  `item_status` varchar(50) NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_automatic_general`
--

LOCK TABLES `wped_automatic_general` WRITE;
/*!40000 ALTER TABLE `wped_automatic_general` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_automatic_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_automatic_keywords`
--

DROP TABLE IF EXISTS `wped_automatic_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_automatic_keywords` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_name` varchar(250) NOT NULL,
  `keyword_camp` int(11) NOT NULL,
  `keyword_start` int(11) NOT NULL DEFAULT '0',
  `clickbank_start` int(11) NOT NULL DEFAULT '1',
  `amazon_start` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `keyword_name` (`keyword_name`,`keyword_camp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_automatic_keywords`
--

LOCK TABLES `wped_automatic_keywords` WRITE;
/*!40000 ALTER TABLE `wped_automatic_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_automatic_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_automatic_links`
--

DROP TABLE IF EXISTS `wped_automatic_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_automatic_links` (
  `link_url` varchar(500) NOT NULL,
  `link_title` varchar(500) NOT NULL,
  `link_keyword` varchar(300) NOT NULL,
  `link_status` varchar(20) NOT NULL,
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_automatic_links`
--

LOCK TABLES `wped_automatic_links` WRITE;
/*!40000 ALTER TABLE `wped_automatic_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_automatic_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_automatic_log`
--

DROP TABLE IF EXISTS `wped_automatic_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_automatic_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(50) NOT NULL,
  `data` mediumtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `camp` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_automatic_log`
--

LOCK TABLES `wped_automatic_log` WRITE;
/*!40000 ALTER TABLE `wped_automatic_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_automatic_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_automatic_youtube_links`
--

DROP TABLE IF EXISTS `wped_automatic_youtube_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_automatic_youtube_links` (
  `link_url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_keyword` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `link_desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_player` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_img` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rating` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_views` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_time` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_author` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_duration` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `link_general` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_automatic_youtube_links`
--

LOCK TABLES `wped_automatic_youtube_links` WRITE;
/*!40000 ALTER TABLE `wped_automatic_youtube_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_automatic_youtube_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_commentmeta`
--

DROP TABLE IF EXISTS `wped_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_commentmeta`
--

LOCK TABLES `wped_commentmeta` WRITE;
/*!40000 ALTER TABLE `wped_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_comments`
--

DROP TABLE IF EXISTS `wped_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_comments`
--

LOCK TABLES `wped_comments` WRITE;
/*!40000 ALTER TABLE `wped_comments` DISABLE KEYS */;
INSERT INTO `wped_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES (1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2018-02-24 04:47:55','2018-02-24 04:47:55','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','',0,0);
/*!40000 ALTER TABLE `wped_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_links`
--

DROP TABLE IF EXISTS `wped_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_links`
--

LOCK TABLES `wped_links` WRITE;
/*!40000 ALTER TABLE `wped_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_nxs_log`
--

DROP TABLE IF EXISTS `wped_nxs_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_nxs_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `act` varchar(255) NOT NULL DEFAULT '',
  `nt` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `flt` varchar(20) NOT NULL DEFAULT '',
  `nttype` varchar(20) DEFAULT '',
  `msg` text NOT NULL,
  `extInfo` text,
  `uid` bigint(20) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_nxs_log`
--

LOCK TABLES `wped_nxs_log` WRITE;
/*!40000 ALTER TABLE `wped_nxs_log` DISABLE KEYS */;
INSERT INTO `wped_nxs_log` (`id`, `date`, `act`, `nt`, `type`, `flt`, `nttype`, `msg`, `extInfo`, `uid`) VALUES (19894,'2018-04-13 02:32:45','Cron Request','','L','cron','','182.62s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19878,'2018-04-13 01:39:18','Cron Request','','L','cron','','514.13s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19856,'2018-04-13 00:14:46','Cron Request','','L','cron','','274.34s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(4,'2018-02-24 07:35:14','*** ID: 16, Type: customize_changeset','','BG','snap','',' Status Changed: new_to_publish. Autopost requested.','0',1),(5,'2018-02-24 07:35:14','Skipped','','I','snap','','Filter(Global) - Excluded - Post ID:(16)','Filters Block',1),(19996,'2018-04-13 08:34:43','Cron Request','','L','cron','','305.24s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19811,'2018-04-12 21:34:52','Cron Request','','L','cron','','314.80s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20082,'2018-04-13 13:34:43','Cron Request','','L','cron','','305.65s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20013,'2018-04-13 09:34:41','Cron Request','','L','cron','','298.54s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20045,'2018-04-13 11:27:21','Cron Request','','L','cron','','156.07s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19808,'2018-04-12 21:24:40','Cron Request','','L','cron','','334.94s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19741,'2018-04-12 17:34:40','Cron Request','','L','cron','','299.73s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19961,'2018-04-13 06:32:52','Cron Request','','L','cron','','191.08s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19960,'2018-04-13 06:29:41','Cron Request','','L','cron','','315.07s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19755,'2018-04-12 18:24:45','Cron Request','','L','cron','','308.59s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19906,'2018-04-13 03:14:41','Cron Request','','L','cron','','301.37s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19907,'2018-04-13 03:15:52','Cron Request','','L','cron','','71.00s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19991,'2018-04-13 08:17:41','Cron Request','','L','cron','','470.75s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19992,'2018-04-13 08:19:44','Cron Request','','L','cron','','122.12s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20061,'2018-04-13 12:24:42','Cron Request','','L','cron','','303.87s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19825,'2018-04-12 22:20:32','Cron Request','','L','cron','','47.05s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19977,'2018-04-13 07:29:55','Cron Request','','L','cron','','280.95s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19958,'2018-04-13 06:19:38','Cron Request','','L','cron','','249.26s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19957,'2018-04-13 06:15:29','Cron Request','','L','cron','','49.09s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19903,'2018-04-13 03:04:42','Cron Request','','L','cron','','304.01s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19904,'2018-04-13 03:07:10','Cron Request','','L','cron','','148.13s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19905,'2018-04-13 03:09:40','Cron Request','','L','cron','','149.32s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19930,'2018-04-13 04:34:41','Cron Request','','L','cron','','218.21s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19929,'2018-04-13 04:31:03','Cron Request','','L','cron','','84.77s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19826,'2018-04-12 22:24:40','Cron Request','','L','cron','','248.33s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20080,'2018-04-13 13:26:46','Cron Request','','L','cron','','126.28s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20079,'2018-04-13 13:24:40','Cron Request','','L','cron','','338.55s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20047,'2018-04-13 11:34:46','Cron Request','','L','cron','','306.38s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19911,'2018-04-13 03:29:43','Cron Request','','L','cron','','279.30s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19810,'2018-04-12 21:29:37','Cron Request','','L','cron','','80.96s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19891,'2018-04-13 02:23:27','Cron Request','','L','cron','','227.30s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19892,'2018-04-13 02:24:56','Cron Request','','L','cron','','89.14s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19912,'2018-04-13 03:32:59','Cron Request','','L','cron','','195.54s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19820,'2018-04-12 22:04:39','Cron Request','','L','cron','','76.20s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19821,'2018-04-12 22:09:51','Cron Request','','L','cron','','311.95s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19928,'2018-04-13 04:29:38','Cron Request','','L','cron','','299.79s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20012,'2018-04-13 09:29:43','Cron Request','','L','cron','','225.80s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20011,'2018-04-13 09:25:57','Cron Request','','L','cron','','74.68s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19861,'2018-04-13 00:34:38','Cron Request','','L','cron','','299.21s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19910,'2018-04-13 03:25:04','Cron Request','','L','cron','','21.20s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19794,'2018-04-12 20:34:54','Cron Request','','L','cron','','315.55s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19943,'2018-04-13 05:24:42','Cron Request','','L','cron','','191.14s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19959,'2018-04-13 06:24:26','Cron Request','','L','cron','','287.66s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19858,'2018-04-13 00:25:09','Cron Request','','L','cron','','378.78s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20081,'2018-04-13 13:29:38','Cron Request','','L','cron','','171.62s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19909,'2018-04-13 03:24:43','Cron Request','','L','cron','','298.85s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19979,'2018-04-13 07:34:38','Cron Request','','L','cron','','64.82s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19972,'2018-04-13 07:14:40','Cron Request','','L','cron','','298.53s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19945,'2018-04-13 05:34:59','Cron Request','','L','cron','','198.26s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19978,'2018-04-13 07:33:33','Cron Request','','L','cron','','218.48s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19852,'2018-04-12 23:59:36','Cron Request','','L','cron','','290.29s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19853,'2018-04-13 00:04:44','Cron Request','','L','cron','','308.01s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19854,'2018-04-13 00:09:43','Cron Request','','L','cron','','299.39s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19944,'2018-04-13 05:31:41','Cron Request','','L','cron','','419.09s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19792,'2018-04-12 20:28:48','Cron Request','','L','cron','','249.65s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19793,'2018-04-12 20:29:38','Cron Request','','L','cron','','50.76s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19925,'2018-04-13 04:18:03','Cron Request','','L','cron','','196.52s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19770,'2018-04-12 19:13:03','Cron Request','','L','cron','','192.68s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19771,'2018-04-12 19:14:37','Cron Request','','L','cron','','94.10s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19823,'2018-04-12 22:14:40','Cron Request','','L','cron','','178.65s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20028,'2018-04-13 10:29:37','Cron Request','','L','cron','','299.67s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19942,'2018-04-13 05:21:31','Cron Request','','L','cron','','107.68s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19872,'2018-04-13 01:14:42','Cron Request','','L','cron','','67.24s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19893,'2018-04-13 02:29:42','Cron Request','','L','cron','','285.94s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19860,'2018-04-13 00:29:39','Cron Request','','L','cron','','127.27s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19859,'2018-04-13 00:27:32','Cron Request','','L','cron','','142.72s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19879,'2018-04-13 01:48:13','Cron Request','','L','cron','','534.53s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19857,'2018-04-13 00:18:50','Cron Request','','L','cron','','244.33s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19838,'2018-04-12 23:09:40','Cron Request','','L','cron','','292.96s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19776,'2018-04-12 19:29:52','Cron Request','','L','cron','','50.77s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19827,'2018-04-12 22:29:16','Cron Request','','L','cron','','275.94s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20015,'2018-04-13 09:43:58','Cron Request','','L','cron','','258.74s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19877,'2018-04-13 01:30:44','Cron Request','','L','cron','','60.24s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19740,'2018-04-12 17:29:40','Cron Request','','L','cron','','242.54s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19880,'2018-04-13 01:53:23','Cron Request','','L','cron','','310.57s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19764,'2018-04-12 18:49:39','Cron Request','','L','cron','','51.52s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19758,'2018-04-12 18:32:45','Cron Request','','L','cron','','181.26s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19842,'2018-04-12 23:21:52','Cron Request','','L','cron','','134.69s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19855,'2018-04-13 00:10:11','Cron Request','','L','cron','','28.37s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19757,'2018-04-12 18:29:44','Cron Request','','L','cron','','280.02s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19756,'2018-04-12 18:25:04','Cron Request','','L','cron','','19.16s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19750,'2018-04-12 18:07:17','Cron Request','','L','cron','','156.45s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19775,'2018-04-12 19:29:01','Cron Request','','L','cron','','257.97s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20099,'2018-04-13 14:34:38','Cron Request','','L','cron','','300.00s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19773,'2018-04-12 19:21:20','Cron Request','','L','cron','','48.02s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20009,'2018-04-13 09:21:23','Cron Request','','L','cron','','255.85s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20007,'2018-04-13 09:14:37','Cron Request','','L','cron','','345.68s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19790,'2018-04-12 20:20:55','Cron Request','','L','cron','','76.02s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20085,'2018-04-13 13:44:32','Cron Request','','L','cron','','295.51s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20086,'2018-04-13 13:49:50','Cron Request','','L','cron','','317.70s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19754,'2018-04-12 18:19:36','Cron Request','','L','cron','','217.90s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19800,'2018-04-12 20:54:22','Cron Request','','L','cron','','280.21s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19974,'2018-04-13 07:19:38','Cron Request','','L','cron','','219.11s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19975,'2018-04-13 07:24:37','Cron Request','','L','cron','','298.88s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19976,'2018-04-13 07:25:14','Cron Request','','L','cron','','36.83s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19940,'2018-04-13 05:15:11','Cron Request','','L','cron','','327.46s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20046,'2018-04-13 11:29:40','Cron Request','','L','cron','','138.48s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20064,'2018-04-13 12:34:45','Cron Request','','L','cron','','305.88s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19926,'2018-04-13 04:19:37','Cron Request','','L','cron','','94.75s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19927,'2018-04-13 04:24:38','Cron Request','','L','cron','','301.11s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19924,'2018-04-13 04:14:46','Cron Request','','L','cron','','303.37s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20078,'2018-04-13 13:19:01','Cron Request','','L','cron','','37.19s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; https://fromnepal.tk)',0),(20096,'2018-04-13 14:24:43','Cron Request','','L','cron','','291.28s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20095,'2018-04-13 14:19:51','Cron Request','','L','cron','','68.33s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20097,'2018-04-13 14:27:48','Cron Request','','L','cron','','185.28s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20063,'2018-04-13 12:29:39','Cron Request','','L','cron','','132.34s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19849,'2018-04-12 23:46:39','Cron Request','','L','cron','','121.22s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20062,'2018-04-13 12:27:27','Cron Request','','L','cron','','165.01s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20052,'2018-04-13 11:51:15','Cron Request','','L','cron','','102.30s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20053,'2018-04-13 11:54:38','Cron Request','','L','cron','','203.07s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20054,'2018-04-13 11:59:37','Cron Request','','L','cron','','299.69s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20043,'2018-04-13 11:19:59','Cron Request','','L','cron','','307.29s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20018,'2018-04-13 09:54:48','Cron Request','','L','cron','','124.52s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19873,'2018-04-13 01:19:39','Cron Request','','L','cron','','297.04s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19785,'2018-04-12 19:59:39','Cron Request','','L','cron','','265.03s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19752,'2018-04-12 18:14:38','Cron Request','','L','cron','','298.52s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19791,'2018-04-12 20:24:38','Cron Request','','L','cron','','223.23s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19777,'2018-04-12 19:34:42','Cron Request','','L','cron','','289.76s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20044,'2018-04-13 11:24:45','Cron Request','','L','cron','','286.66s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20071,'2018-04-13 12:59:48','Cron Request','','L','cron','','299.60s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20072,'2018-04-13 13:01:34','Cron Request','','L','cron','','106.32s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20060,'2018-04-13 12:19:38','Cron Request','','L','cron','','105.08s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20059,'2018-04-13 12:17:53','Cron Request','','L','cron','','152.50s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19965,'2018-04-13 06:44:40','Cron Request','','L','cron','','220.84s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19954,'2018-04-13 06:06:42','Cron Request','','L','cron','','114.09s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19845,'2018-04-12 23:32:37','Cron Request','','L','cron','','168.66s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19850,'2018-04-12 23:49:36','Cron Request','','L','cron','','176.73s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19843,'2018-04-12 23:24:41','Cron Request','','L','cron','','168.85s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19804,'2018-04-12 21:09:41','Cron Request','','L','cron','','301.83s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19803,'2018-04-12 21:04:40','Cron Request','','L','cron','','133.06s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19802,'2018-04-12 21:02:27','Cron Request','','L','cron','','159.17s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19801,'2018-04-12 20:59:47','Cron Request','','L','cron','','325.17s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20098,'2018-04-13 14:29:38','Cron Request','','L','cron','','110.05s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19798,'2018-04-12 20:46:31','Cron Request','','L','cron','','113.26s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19799,'2018-04-12 20:49:42','Cron Request','','L','cron','','191.34s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20056,'2018-04-13 12:04:37','Cron Request','','L','cron','','246.90s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20057,'2018-04-13 12:09:30','Cron Request','','L','cron','','292.67s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20016,'2018-04-13 09:49:40','Cron Request','','L','cron','','341.34s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19997,'2018-04-13 08:35:15','Cron Request','','L','cron','','32.21s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19980,'2018-04-13 07:39:42','Cron Request','','L','cron','','303.68s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19998,'2018-04-13 08:39:38','Cron Request','','L','cron','','263.01s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19816,'2018-04-12 21:49:45','Cron Request','','L','cron','','217.80s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19807,'2018-04-12 21:19:05','Cron Request','','L','cron','','263.14s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19788,'2018-04-12 20:14:42','**WARNING. Unhealthy Cron Request**',' [<a target=\"_blank\" href=\"http://nxs.fyi/uhcr\">More info</a>] ','W','cron','','Too far (602.11s) from the previous one. ','Now - 20:14:42 | Previous - 20:04:40| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20090,'2018-04-13 14:00:50','Cron Request','','L','cron','','60.87s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19847,'2018-04-12 23:39:39','Cron Request','','L','cron','','298.41s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20051,'2018-04-13 11:49:32','Cron Request','','L','cron','','348.47s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20040,'2018-04-13 11:09:41','Cron Request','','L','cron','','256.09s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20041,'2018-04-13 11:14:04','Cron Request','','L','cron','','262.33s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20026,'2018-04-13 10:23:40','Cron Request','','L','cron','','243.15s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20037,'2018-04-13 10:59:39','Cron Request','','L','cron','','160.76s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20010,'2018-04-13 09:24:42','Cron Request','','L','cron','','199.72s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19970,'2018-04-13 07:07:21','Cron Request','','L','cron','','157.85s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19914,'2018-04-13 03:39:38','Cron Request','','L','cron','','299.66s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19919,'2018-04-13 03:54:45','Cron Request','','L','cron','','288.18s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19782,'2018-04-12 19:49:38','Cron Request','','L','cron','','154.16s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19759,'2018-04-12 18:34:37','Cron Request','','L','cron','','112.21s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20055,'2018-04-13 12:00:30','Cron Request','','L','cron','','52.78s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19751,'2018-04-12 18:09:40','Cron Request','','L','cron','','142.85s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20030,'2018-04-13 10:34:37','Cron Request','','L','cron','','158.81s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20031,'2018-04-13 10:39:40','Cron Request','','L','cron','','303.26s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20022,'2018-04-13 10:09:39','Cron Request','','L','cron','','298.81s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20023,'2018-04-13 10:14:39','Cron Request','','L','cron','','299.84s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20038,'2018-04-13 11:04:48','Cron Request','','L','cron','','308.71s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19846,'2018-04-12 23:34:41','Cron Request','','L','cron','','123.14s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20033,'2018-04-13 10:48:44','Cron Request','','L','cron','','245.78s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20034,'2018-04-13 10:49:37','Cron Request','','L','cron','','53.23s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20035,'2018-04-13 10:54:37','Cron Request','','L','cron','','299.90s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19822,'2018-04-12 22:11:41','Cron Request','','L','cron','','110.26s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19805,'2018-04-12 21:10:46','Cron Request','','L','cron','','64.26s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20083,'2018-04-13 13:35:54','Cron Request','','L','cron','','70.78s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20077,'2018-04-13 13:18:24','Cron Request','','L','cron','','224.15s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20076,'2018-04-13 13:14:40','Cron Request','','L','cron','','256.11s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20025,'2018-04-13 10:19:37','Cron Request','','L','cron','','254.39s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20039,'2018-04-13 11:05:25','Cron Request','','L','cron','','37.11s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20036,'2018-04-13 10:56:59','Cron Request','','L','cron','','141.38s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20017,'2018-04-13 09:52:43','Cron Request','','L','cron','','183.69s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20027,'2018-04-13 10:24:38','Cron Request','','L','cron','','57.49s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20024,'2018-04-13 10:15:23','Cron Request','','L','cron','','43.50s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19999,'2018-04-13 08:43:56','Cron Request','','L','cron','','258.01s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20000,'2018-04-13 08:49:39','Cron Request','','L','cron','','342.33s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20001,'2018-04-13 08:52:07','Cron Request','','L','cron','','148.50s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20002,'2018-04-13 08:54:40','Cron Request','','L','cron','','153.35s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19753,'2018-04-12 18:15:58','Cron Request','','L','cron','','79.92s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19995,'2018-04-13 08:29:38','Cron Request','','L','cron','','200.43s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19994,'2018-04-13 08:26:17','Cron Request','','L','cron','','91.57s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20004,'2018-04-13 09:00:24','Cron Request','','L','cron','','42.74s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20094,'2018-04-13 14:18:43','Cron Request','','L','cron','','229.95s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19828,'2018-04-12 22:34:51','Cron Request','','L','cron','','335.00s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19908,'2018-04-13 03:19:44','Cron Request','','L','cron','','231.95s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20092,'2018-04-13 14:09:45','Cron Request','','L','cron','','297.00s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20093,'2018-04-13 14:14:53','Cron Request','','L','cron','','308.12s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20074,'2018-04-13 13:09:44','Cron Request','','L','cron','','286.84s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20032,'2018-04-13 10:44:38','Cron Request','','L','cron','','298.53s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20003,'2018-04-13 08:59:41','Cron Request','','L','cron','','300.54s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19989,'2018-04-13 08:08:43','Cron Request','','L','cron','','217.36s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19986,'2018-04-13 07:59:45','Cron Request','','L','cron','','293.66s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19990,'2018-04-13 08:09:51','Cron Request','','L','cron','','68.01s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19988,'2018-04-13 08:05:05','Cron Request','','L','cron','','279.88s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19987,'2018-04-13 08:00:25','Cron Request','','L','cron','','40.14s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19985,'2018-04-13 07:54:52','Cron Request','','L','cron','','246.34s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19786,'2018-04-12 20:03:08','Cron Request','','L','cron','','208.91s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20020,'2018-04-13 10:02:08','Cron Request','','L','cron','','139.12s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19953,'2018-04-13 06:04:48','Cron Request','','L','cron','','308.52s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19952,'2018-04-13 05:59:39','Cron Request','','L','cron','','92.89s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20021,'2018-04-13 10:04:41','Cron Request','','L','cron','','152.96s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20066,'2018-04-13 12:39:38','Cron Request','','L','cron','','240.97s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20091,'2018-04-13 14:04:48','Cron Request','','L','cron','','238.23s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20042,'2018-04-13 11:14:51','Cron Request','','L','cron','','47.77s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19973,'2018-04-13 07:15:59','Cron Request','','L','cron','','79.22s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19951,'2018-04-13 05:58:06','Cron Request','','L','cron','','192.40s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19950,'2018-04-13 05:54:54','Cron Request','','L','cron','','340.61s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19948,'2018-04-13 05:44:41','Cron Request','','L','cron','','217.86s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19983,'2018-04-13 07:49:44','Cron Request','','L','cron','','290.84s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19984,'2018-04-13 07:50:45','Cron Request','','L','cron','','61.69s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19971,'2018-04-13 07:09:41','Cron Request','','L','cron','','140.42s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19969,'2018-04-13 07:04:43','Cron Request','','L','cron','','347.40s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19968,'2018-04-13 06:58:56','Cron Request','','L','cron','','249.57s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19949,'2018-04-13 05:49:13','Cron Request','','L','cron','','271.92s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19982,'2018-04-13 07:44:53','Cron Request','','L','cron','','162.57s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19955,'2018-04-13 06:09:53','Cron Request','','L','cron','','191.45s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19941,'2018-04-13 05:19:43','Cron Request','','L','cron','','272.68s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19876,'2018-04-13 01:29:44','Cron Request','','L','cron','','306.95s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19768,'2018-04-12 19:04:39','Cron Request','','L','cron','','295.98s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19851,'2018-04-12 23:54:45','Cron Request','','L','cron','','309.61s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19784,'2018-04-12 19:55:14','Cron Request','','L','cron','','27.26s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19981,'2018-04-13 07:42:10','Cron Request','','L','cron','','148.18s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19956,'2018-04-13 06:14:40','Cron Request','','L','cron','','286.26s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19937,'2018-04-13 04:59:38','Cron Request','','L','cron','','111.37s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19938,'2018-04-13 05:04:43','Cron Request','','L','cron','','304.92s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19939,'2018-04-13 05:09:43','Cron Request','','L','cron','','300.01s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19923,'2018-04-13 04:09:43','Cron Request','','L','cron','','117.64s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19935,'2018-04-13 04:54:45','Cron Request','','L','cron','','284.74s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19936,'2018-04-13 04:57:47','Cron Request','','L','cron','','182.30s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19922,'2018-04-13 04:07:45','Cron Request','','L','cron','','182.99s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19921,'2018-04-13 04:04:42','Cron Request','','L','cron','','340.77s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19920,'2018-04-13 03:59:01','Cron Request','','L','cron','','256.42s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19844,'2018-04-12 23:29:49','Cron Request','','L','cron','','307.68s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19934,'2018-04-13 04:50:00','Cron Request','','L','cron','','86.39s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19742,'2018-04-12 17:39:38','Cron Request','','L','cron','','298.20s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19743,'2018-04-12 17:44:39','Cron Request','','L','cron','','300.54s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19917,'2018-04-13 03:49:39','Cron Request','','L','cron','','287.25s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19902,'2018-04-13 02:59:38','Cron Request','','L','cron','','60.18s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19897,'2018-04-13 02:40:55','Cron Request','','L','cron','','75.57s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19918,'2018-04-13 03:49:57','**WARNING. Unhealthy Cron Request**',' [<a target=\"_blank\" href=\"http://nxs.fyi/uhcr\">More info</a>] ','W','cron','','Too close (17.55s) to the previous one. ','Now - 03:49:57 | Previous - 03:49:39| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19916,'2018-04-13 03:44:52','Cron Request','','L','cron','','196.87s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19915,'2018-04-13 03:41:35','Cron Request','','L','cron','','116.93s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19875,'2018-04-13 01:24:37','Cron Request','','L','cron','','187.81s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19896,'2018-04-13 02:39:39','Cron Request','','L','cron','','298.24s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19899,'2018-04-13 02:49:14','Cron Request','','L','cron','','276.04s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19890,'2018-04-13 02:19:40','Cron Request','','L','cron','','308.29s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19772,'2018-04-12 19:20:32','Cron Request','','L','cron','','354.63s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19769,'2018-04-12 19:09:50','Cron Request','','L','cron','','311.56s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19900,'2018-04-13 02:54:39','Cron Request','','L','cron','','324.52s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19898,'2018-04-13 02:44:38','Cron Request','','L','cron','','223.26s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19889,'2018-04-13 02:14:32','Cron Request','','L','cron','','293.55s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19888,'2018-04-13 02:09:38','Cron Request','','L','cron','','230.87s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19887,'2018-04-13 02:05:47','Cron Request','','L','cron','','67.56s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19885,'2018-04-13 02:02:38','Cron Request','','L','cron','','116.09s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19886,'2018-04-13 02:04:40','Cron Request','','L','cron','','121.07s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19864,'2018-04-13 00:44:36','Cron Request','','L','cron','','126.99s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19841,'2018-04-12 23:19:38','Cron Request','','L','cron','','298.44s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19840,'2018-04-12 23:14:39','Cron Request','','L','cron','','136.32s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19866,'2018-04-13 00:54:58','Cron Request','','L','cron','','115.19s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19747,'2018-04-12 17:58:20','Cron Request','','L','cron','','227.77s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19748,'2018-04-12 17:59:42','Cron Request','','L','cron','','82.79s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19839,'2018-04-12 23:12:23','Cron Request','','L','cron','','163.07s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19874,'2018-04-13 01:21:29','Cron Request','','L','cron','','109.87s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19837,'2018-04-12 23:04:47','Cron Request','','L','cron','','91.03s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19833,'2018-04-12 22:49:47','Cron Request','','L','cron','','204.29s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19836,'2018-04-12 23:03:16','Cron Request','','L','cron','','213.30s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19819,'2018-04-12 22:03:23','Cron Request','','L','cron','','204.81s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19806,'2018-04-12 21:14:42','Cron Request','','L','cron','','235.77s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19818,'2018-04-12 21:59:58','Cron Request','','L','cron','','324.05s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19774,'2018-04-12 19:24:43','Cron Request','','L','cron','','203.65s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19767,'2018-04-12 18:59:43','Cron Request','','L','cron','','190.40s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19766,'2018-04-12 18:56:32','Cron Request','','L','cron','','100.24s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19763,'2018-04-12 18:48:47','Cron Request','','L','cron','','242.31s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20089,'2018-04-13 13:59:49','Cron Request','','L','cron','','312.45s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20088,'2018-04-13 13:54:36','Cron Request','','L','cron','','123.55s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19835,'2018-04-12 22:59:42','Cron Request','','L','cron','','292.58s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19834,'2018-04-12 22:54:50','Cron Request','','L','cron','','302.95s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19832,'2018-04-12 22:46:23','Cron Request','','L','cron','','95.98s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19746,'2018-04-12 17:54:32','Cron Request','','L','cron','','248.83s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19789,'2018-04-12 20:19:39','Cron Request','','L','cron','','296.87s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19783,'2018-04-12 19:54:46','Cron Request','','L','cron','','308.59s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19762,'2018-04-12 18:44:45','Cron Request','','L','cron','','231.11s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19749,'2018-04-12 18:04:41','Cron Request','','L','cron','','298.09s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19901,'2018-04-13 02:58:38','Cron Request','','L','cron','','239.40s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20073,'2018-04-13 13:04:58','Cron Request','','L','cron','','203.42s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19870,'2018-04-13 01:09:36','Cron Request','','L','cron','','271.62s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19761,'2018-04-12 18:40:54','Cron Request','','L','cron','','46.06s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19745,'2018-04-12 17:50:23','Cron Request','','L','cron','','43.24s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19744,'2018-04-12 17:49:40','Cron Request','','L','cron','','300.93s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19824,'2018-04-12 22:19:45','Cron Request','','L','cron','','304.56s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19817,'2018-04-12 21:54:34','Cron Request','','L','cron','','289.11s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19882,'2018-04-13 01:57:02','Cron Request','','L','cron','','107.73s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19883,'2018-04-13 01:58:55','Cron Request','','L','cron','','112.81s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19993,'2018-04-13 08:24:46','Cron Request','','L','cron','','302.22s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20029,'2018-04-13 10:31:58','Cron Request','','L','cron','','140.30s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19963,'2018-04-13 06:39:36','Cron Request','','L','cron','','297.76s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19809,'2018-04-12 21:28:16','Cron Request','','L','cron','','216.60s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19966,'2018-04-13 06:49:39','Cron Request','','L','cron','','298.19s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19967,'2018-04-13 06:54:46','Cron Request','','L','cron','','307.75s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19964,'2018-04-13 06:40:59','Cron Request','','L','cron','','83.22s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19781,'2018-04-12 19:47:04','Cron Request','','L','cron','','141.81s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19787,'2018-04-12 20:04:40','Cron Request','','L','cron','','92.05s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20070,'2018-04-13 12:54:48','Cron Request','','L','cron','','115.34s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20069,'2018-04-13 12:52:53','Cron Request','','L','cron','','190.04s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19779,'2018-04-12 19:39:41','Cron Request','','L','cron','','122.54s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19871,'2018-04-13 01:13:35','Cron Request','','L','cron','','239.16s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19868,'2018-04-13 01:04:41','Cron Request','','L','cron','','301.59s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19831,'2018-04-12 22:44:47','Cron Request','','L','cron','','306.09s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19797,'2018-04-12 20:44:37','Cron Request','','L','cron','','283.59s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19947,'2018-04-13 05:41:04','Cron Request','','L','cron','','79.64s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19815,'2018-04-12 21:46:07','Cron Request','','L','cron','','53.25s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19813,'2018-04-12 21:39:41','Cron Request','','L','cron','','121.67s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19796,'2018-04-12 20:39:54','Cron Request','','L','cron','','124.29s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20008,'2018-04-13 09:17:07','Cron Request','','L','cron','','149.54s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19814,'2018-04-12 21:45:14','Cron Request','','L','cron','','332.72s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20068,'2018-04-13 12:49:43','Cron Request','','L','cron','','317.87s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20087,'2018-04-13 13:52:33','Cron Request','','L','cron','','162.79s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20019,'2018-04-13 09:59:49','Cron Request','','L','cron','','300.69s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20105,'2018-04-13 14:54:29','Cron Request','','L','cron','','247.15s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20104,'2018-04-13 14:50:22','Cron Request','','L','cron','','255.87s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20102,'2018-04-13 14:44:45','Cron Request','','L','cron','','299.70s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20103,'2018-04-13 14:46:06','Cron Request','','L','cron','','80.81s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19895,'2018-04-13 02:34:41','Cron Request','','L','cron','','116.21s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19884,'2018-04-13 02:00:42','Cron Request','','L','cron','','107.53s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20049,'2018-04-13 11:39:39','Cron Request','','L','cron','','271.98s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20084,'2018-04-13 13:39:37','Cron Request','','L','cron','','222.89s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19946,'2018-04-13 05:39:44','Cron Request','','L','cron','','284.50s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19932,'2018-04-13 04:44:38','Cron Request','','L','cron','','299.08s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19933,'2018-04-13 04:48:33','Cron Request','','L','cron','','235.01s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19869,'2018-04-13 01:05:04','Cron Request','','L','cron','','23.48s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19867,'2018-04-13 00:59:39','Cron Request','','L','cron','','281.08s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19812,'2018-04-12 21:37:40','Cron Request','','L','cron','','167.59s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19865,'2018-04-13 00:53:03','Cron Request','','L','cron','','506.67s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20067,'2018-04-13 12:44:25','Cron Request','','L','cron','','287.36s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20058,'2018-04-13 12:15:20','Cron Request','','L','cron','','350.58s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20050,'2018-04-13 11:43:44','Cron Request','','L','cron','','245.06s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20005,'2018-04-13 09:04:38','Cron Request','','L','cron','','254.67s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19913,'2018-04-13 03:34:38','Cron Request','','L','cron','','99.52s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19931,'2018-04-13 04:39:39','Cron Request','','L','cron','','298.11s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20065,'2018-04-13 12:35:37','Cron Request','','L','cron','','51.74s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20048,'2018-04-13 11:35:07','Cron Request','','L','cron','','20.44s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20014,'2018-04-13 09:39:40','Cron Request','','L','cron','','298.34s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20075,'2018-04-13 13:10:24','Cron Request','','L','cron','','39.28s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19780,'2018-04-12 19:44:42','Cron Request','','L','cron','','301.05s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19881,'2018-04-13 01:55:14','Cron Request','','L','cron','','111.16s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19962,'2018-04-13 06:34:38','Cron Request','','L','cron','','106.74s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19795,'2018-04-12 20:37:50','Cron Request','','L','cron','','175.68s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19765,'2018-04-12 18:54:52','Cron Request','','L','cron','','313.40s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19848,'2018-04-12 23:44:38','Cron Request','','L','cron','','298.80s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20101,'2018-04-13 14:39:46','Cron Request','','L','cron','','139.56s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19778,'2018-04-12 19:37:38','Cron Request','','L','cron','','176.47s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19760,'2018-04-12 18:40:08','Cron Request','','L','cron','','330.25s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20100,'2018-04-13 14:37:26','Cron Request','','L','cron','','167.96s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19830,'2018-04-12 22:39:41','Cron Request','','L','cron','','130.78s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19829,'2018-04-12 22:37:30','Cron Request','','L','cron','','158.90s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19862,'2018-04-13 00:40:10','Cron Request','','L','cron','','332.07s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(19863,'2018-04-13 00:42:29','Cron Request','','L','cron','','138.81s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0),(20006,'2018-04-13 09:08:51','Cron Request','','L','cron','','253.07s after the previous one. ','| Cron called from 198.252.107.62 (WordPress/4.9.5; http://fromnepal.tk)',0);
/*!40000 ALTER TABLE `wped_nxs_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_nxs_query`
--

DROP TABLE IF EXISTS `wped_nxs_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_nxs_query` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `datecreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `postid` mediumint(9) DEFAULT NULL,
  `uid` bigint(20) NOT NULL DEFAULT '0',
  `nttype` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timetorun` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `refid` mediumint(9) DEFAULT NULL,
  `descr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extInfo` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_nxs_query`
--

LOCK TABLES `wped_nxs_query` WRITE;
/*!40000 ALTER TABLE `wped_nxs_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_nxs_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_options`
--

DROP TABLE IF EXISTS `wped_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=21449 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_options`
--

LOCK TABLES `wped_options` WRITE;
/*!40000 ALTER TABLE `wped_options` DISABLE KEYS */;
INSERT INTO `wped_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES (1,'siteurl','http://fromnepal.tk','yes'),(2,'home','http://fromnepal.tk','yes'),(3,'blogname','Fromnepal','yes'),(4,'blogdescription','Nepali News','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','alex.punk41@gmail.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','1','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','0','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','/%year%/%monthnum%/%day%/%postname%/','yes'),(29,'rewrite_rules','a:91:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:64:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:59:\"category/(.+?)/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:61:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:56:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:62:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:57:\"type/([^/]+)/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:49:\"feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:44:\"(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=4&cpage=$matches[1]\";s:58:\"comments/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:53:\"comments/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:61:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:56:\"search/(.+)/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:64:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:59:\"author/([^/]+)/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:86:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:81:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:73:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:68:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:60:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:55:\"([0-9]{4})/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:105:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:100:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:94:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:89:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:94:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:89:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:74:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:69:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:57:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:52:\"(.?.+?)/(feed|rdf|rss|rss2|atom|instant-articles)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:3:{i:0;s:49:\"fb-instant-articles/facebook-instant-articles.php\";i:1;s:67:\"social-networks-auto-poster-facebook-twitter-g/NextScripts_SNAP.php\";i:2;s:29:\"wp-automatic/wp-automatic.php\";}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'comment_max_links','2','yes'),(37,'gmt_offset','0','yes'),(38,'default_email_category','1','yes'),(39,'recently_edited','a:5:{i:0;s:76:\"/home/wikicele/public_html/fromnepal.tk/wp-content/themes/awaken/content.php\";i:1;s:74:\"/home/wikicele/public_html/fromnepal.tk/wp-content/themes/awaken/index.php\";i:2;s:75:\"/home/wikicele/public_html/fromnepal.tk/wp-content/themes/awaken/header.php\";i:3;s:74:\"/home/wikicele/public_html/fromnepal.tk/wp-content/themes/awaken/style.css\";i:4;s:0:\"\";}','no'),(40,'template','awaken','yes'),(41,'stylesheet','awaken','yes'),(42,'comment_whitelist','1','yes'),(43,'blacklist_keys','','no'),(44,'comment_registration','0','yes'),(45,'html_type','text/html','yes'),(46,'use_trackback','0','yes'),(47,'default_role','subscriber','yes'),(48,'db_version','38590','yes'),(49,'uploads_use_yearmonth_folders','1','yes'),(50,'upload_path','','yes'),(51,'blog_public','1','yes'),(52,'default_link_category','2','yes'),(53,'show_on_front','page','yes'),(54,'tag_base','','yes'),(55,'show_avatars','1','yes'),(56,'avatar_rating','G','yes'),(57,'upload_url_path','','yes'),(58,'thumbnail_size_w','150','yes'),(59,'thumbnail_size_h','150','yes'),(60,'thumbnail_crop','1','yes'),(61,'medium_size_w','300','yes'),(62,'medium_size_h','300','yes'),(63,'avatar_default','mystery','yes'),(64,'large_size_w','1024','yes'),(65,'large_size_h','1024','yes'),(66,'image_default_link_type','none','yes'),(67,'image_default_size','','yes'),(68,'image_default_align','','yes'),(69,'close_comments_for_old_posts','0','yes'),(70,'close_comments_days_old','14','yes'),(71,'thread_comments','1','yes'),(72,'thread_comments_depth','5','yes'),(73,'page_comments','0','yes'),(74,'comments_per_page','50','yes'),(75,'default_comments_page','newest','yes'),(76,'comment_order','asc','yes'),(77,'sticky_posts','a:0:{}','yes'),(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(79,'widget_text','a:4:{i:2;a:4:{s:5:\"title\";s:15:\"About This Site\";s:4:\"text\";s:62:\"The website features all Nepali as well as international news.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:3;a:4:{s:5:\"title\";s:7:\"Find Us\";s:4:\"text\";s:72:\"<strong>Address</strong>\r\n\r\nTangla, Kritripur\r\n\r\nFromnepal2074@gmail.com\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:4;a:4:{s:5:\"title\";s:15:\"About This Site\";s:4:\"text\";s:21:\"All About Nepali News\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(81,'uninstall_plugins','a:0:{}','no'),(82,'timezone_string','','yes'),(83,'page_for_posts','5','yes'),(84,'page_on_front','4','yes'),(85,'default_post_format','0','yes'),(86,'link_manager_enabled','0','yes'),(87,'finished_splitting_shared_terms','1','yes'),(88,'site_icon','0','yes'),(89,'medium_large_size_w','768','yes'),(90,'medium_large_size_h','0','yes'),(91,'initial_db_version','38590','yes'),(92,'wped_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"haveown_snap_accss\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(93,'fresh_site','0','yes'),(94,'widget_search','a:4:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;i:3;a:1:{s:5:\"title\";s:6:\"Search\";}i:4;a:1:{s:5:\"title\";s:6:\"Search\";}}','yes'),(95,'widget_recent-posts','a:4:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;i:3;a:1:{s:5:\"title\";s:12:\"Recent Posts\";}i:4;a:1:{s:5:\"title\";s:12:\"Recent Posts\";}}','yes'),(96,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(97,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(98,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(99,'sidebars_widgets','a:10:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-3\";i:1;s:6:\"text-2\";i:2;s:14:\"recent-posts-3\";}s:10:\"magazine-1\";a:0:{}s:10:\"magazine-2\";a:0:{}s:9:\"header-ad\";a:0:{}s:11:\"footer-left\";a:1:{i:0;s:6:\"text-3\";}s:10:\"footer-mid\";a:1:{i:0;s:6:\"text-4\";}s:12:\"footer-right\";a:2:{i:0;s:14:\"recent-posts-4\";i:1;s:8:\"search-4\";}s:26:\"awaken-woocommerce-sidebar\";a:0:{}s:13:\"array_version\";i:3;}','yes'),(100,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(101,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(102,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(103,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(104,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(105,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(106,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(107,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(108,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(109,'cron','a:7:{i:1523631290;a:1:{s:19:\"nxs_querypost_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:8:\"nxsquery\";s:4:\"args\";a:0:{}s:8:\"interval\";i:60;}}}i:1523631316;a:1:{s:17:\"wp_automatic_hook\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:13:\"once_a_minute\";s:4:\"args\";a:0:{}s:8:\"interval\";i:60;}}}i:1523633570;a:1:{s:16:\"nxs_hourly_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1523638075;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1523638076;a:2:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1523681293;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(110,'theme_mods_twentyseventeen','a:1:{s:18:\"custom_css_post_id\";i:-1;}','yes'),(21268,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1523594915;s:7:\"checked\";a:5:{s:6:\"awaken\";s:5:\"2.1.7\";s:12:\"destin-basic\";s:5:\"1.0.3\";s:13:\"twentyfifteen\";s:3:\"1.9\";s:15:\"twentyseventeen\";s:3:\"1.4\";s:13:\"twentysixteen\";s:3:\"1.4\";}s:8:\"response\";a:1:{s:15:\"twentyseventeen\";a:4:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.1.5.zip\";}}s:12:\"translations\";a:0:{}}','no'),(17361,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:21:\"alex.punk41@gmail.com\";s:7:\"version\";s:5:\"4.9.5\";s:9:\"timestamp\";i:1522817399;}','no'),(169,'instant-articles-option-publishing','{\"custom_rules\":\"\",\"publish_with_warnings\":\"1\"}','yes'),(170,'instant-articles-option-amp','{\"amp_stylesheet\":\"\"}','yes'),(21266,'_site_transient_timeout_theme_roots','1523596715','no'),(21267,'_site_transient_theme_roots','a:5:{s:6:\"awaken\";s:7:\"/themes\";s:12:\"destin-basic\";s:7:\"/themes\";s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}','no'),(195,'nxs_log_db_table_version','1.5','yes'),(188,'nxsSNAPNetworks_bck','a:1:{s:3:\"ver\";i:306;}','yes'),(189,'nxs_lBckTime','1523087886','no'),(164,'instant-articles-wizard-url','http://fromnepal.tk/wp-admin/admin.php?page=instant-articles-wizard','yes'),(165,'instant-articles-option-fb-page','{\"page_id\":\"121136541845094\"}','yes'),(166,'instant-articles-option-styles','{\"article_style\":\"default\",\"copyright\":\"\"}','yes'),(167,'instant-articles-option-ads','{\"ad_source\":\"fan\",\"fan_placement_id\":null,\"iframe_url\":\"\",\"embed_code\":\"\",\"dimensions\":\"300x250\"}','yes'),(168,'instant-articles-option-analytics','{\"embed_code\":\"\"}','yes'),(11846,'_transient_awaken_categories','1','yes'),(21114,'_transient_instantarticles_mod_1','2018-02-24 04:47:55','no'),(17841,'_transient_timeout_instantarticles_content_1','1524168882','no'),(17842,'_transient_instantarticles_content_1','<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n','no'),(21269,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1523594916;s:7:\"checked\";a:5:{s:19:\"akismet/akismet.php\";s:5:\"4.0.3\";s:9:\"hello.php\";s:3:\"1.6\";s:49:\"fb-instant-articles/facebook-instant-articles.php\";s:5:\"4.0.6\";s:67:\"social-networks-auto-poster-facebook-twitter-g/NextScripts_SNAP.php\";s:5:\"4.1.7\";s:29:\"wp-automatic/wp-automatic.php\";s:6:\"3.34.0\";}s:8:\"response\";a:1:{s:67:\"social-networks-auto-poster-facebook-twitter-g/NextScripts_SNAP.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:60:\"w.org/plugins/social-networks-auto-poster-facebook-twitter-g\";s:4:\"slug\";s:46:\"social-networks-auto-poster-facebook-twitter-g\";s:6:\"plugin\";s:67:\"social-networks-auto-poster-facebook-twitter-g/NextScripts_SNAP.php\";s:11:\"new_version\";s:5:\"4.2.1\";s:3:\"url\";s:77:\"https://wordpress.org/plugins/social-networks-auto-poster-facebook-twitter-g/\";s:7:\"package\";s:89:\"https://downloads.wordpress.org/plugin/social-networks-auto-poster-facebook-twitter-g.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:99:\"https://ps.w.org/social-networks-auto-poster-facebook-twitter-g/assets/icon-256x256.png?rev=1106267\";s:2:\"1x\";s:99:\"https://ps.w.org/social-networks-auto-poster-facebook-twitter-g/assets/icon-128x128.png?rev=1106267\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:100:\"https://ps.w.org/social-networks-auto-poster-facebook-twitter-g/assets/banner-772x250.png?rev=542111\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:3:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.3\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}s:49:\"fb-instant-articles/facebook-instant-articles.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:33:\"w.org/plugins/fb-instant-articles\";s:4:\"slug\";s:19:\"fb-instant-articles\";s:6:\"plugin\";s:49:\"fb-instant-articles/facebook-instant-articles.php\";s:11:\"new_version\";s:5:\"4.0.6\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/fb-instant-articles/\";s:7:\"package\";s:68:\"https://downloads.wordpress.org/plugin/fb-instant-articles.4.0.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:72:\"https://ps.w.org/fb-instant-articles/assets/icon-256x256.jpg?rev=1418996\";s:2:\"1x\";s:72:\"https://ps.w.org/fb-instant-articles/assets/icon-128x128.jpg?rev=1418996\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/fb-instant-articles/assets/banner-1544x500.jpg?rev=1418996\";s:2:\"1x\";s:74:\"https://ps.w.org/fb-instant-articles/assets/banner-772x250.jpg?rev=1418996\";}s:11:\"banners_rtl\";a:0:{}}}}','no'),(21113,'_transient_timeout_instantarticles_mod_1','1524168882','no'),(17359,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.5.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.5.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.5-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.5-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.5\";s:7:\"version\";s:5:\"4.9.5\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1523594914;s:15:\"version_checked\";s:5:\"4.9.5\";s:12:\"translations\";a:0:{}}','no'),(129,'can_compress_scripts','0','no'),(138,'theme_mods_destin-basic','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1519449680;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}','yes'),(139,'current_theme','Awaken','yes'),(140,'theme_mods_awaken','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:15:\"main_navigation\";i:2;s:14:\"top_navigation\";i:3;}s:18:\"custom_css_post_id\";i:-1;}','yes'),(141,'theme_switched','','yes'),(142,'widget_three_block_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(143,'widget_awaken_single_category_posts','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(144,'widget_dual_category_posts','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(145,'widget_awaken_medium_rectangle_ad','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(146,'widget_awaken_tabbed_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(147,'widget_awaken_video_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(14789,'category_children','a:0:{}','yes'),(151,'nav_menu_options','a:1:{s:8:\"auto_add\";a:0:{}}','yes'),(156,'recently_activated','a:0:{}','yes'),(197,'NXS_cronCheck','a:3:{s:18:\"cronCheckStartTime\";i:1519457573;s:10:\"cronChecks\";a:6:{i:0;s:97:\"[2018-02-24 07:32:53] - WP Cron called from 198.252.107.62 (WordPress/4.9.4; http://fromnepal.tk)\";i:1;s:97:\"[2018-02-24 07:34:03] - WP Cron called from 198.252.107.62 (WordPress/4.9.4; http://fromnepal.tk)\";i:2;s:97:\"[2018-02-24 07:35:07] - WP Cron called from 198.252.107.62 (WordPress/4.9.4; http://fromnepal.tk)\";i:3;s:97:\"[2018-02-24 07:39:19] - WP Cron called from 198.252.107.62 (WordPress/4.9.4; http://fromnepal.tk)\";i:4;s:97:\"[2018-02-24 07:44:35] - WP Cron called from 198.252.107.62 (WordPress/4.9.4; http://fromnepal.tk)\";i:5;s:97:\"[2018-02-24 07:47:40] - WP Cron called from 198.252.107.62 (WordPress/4.9.4; http://fromnepal.tk)\";}s:6:\"status\";i:1;}','yes'),(198,'nxs_last_nxs_cron','1523631269.55795693','no'),(285,'_transient_is_multi_author','0','yes'),(181,'wp_automatic_version','18','yes'),(183,'wp_automatic_version_updated','1522298326','yes'),(184,'wp_automatic_version_last','3.34.0\n','yes'),(193,'nxs_v4APIMn','1','no'),(194,'nxs_query_db_table_version','1.2','yes'),(3388,'nxsSNAPOptions_bck4','','yes');
/*!40000 ALTER TABLE `wped_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_postmeta`
--

DROP TABLE IF EXISTS `wped_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_postmeta`
--

LOCK TABLES `wped_postmeta` WRITE;
/*!40000 ALTER TABLE `wped_postmeta` DISABLE KEYS */;
INSERT INTO `wped_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES (1,2,'_wp_page_template','default'),(2,4,'_wp_page_template','layouts/magazine.php'),(8,9,'_menu_item_menu_item_parent','0'),(4,4,'_customize_changeset_uuid','8a9ec659-44fb-43a0-bd9f-c53a8954796f'),(7,9,'_menu_item_type','custom'),(6,5,'_customize_changeset_uuid','8a9ec659-44fb-43a0-bd9f-c53a8954796f'),(9,9,'_menu_item_object_id','9'),(10,9,'_menu_item_object','custom'),(11,9,'_menu_item_target',''),(12,9,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(13,9,'_menu_item_xfn',''),(14,9,'_menu_item_url','http://fromnepal.tk/'),(15,10,'_menu_item_type','post_type'),(16,10,'_menu_item_menu_item_parent','0'),(17,10,'_menu_item_object_id','5'),(18,10,'_menu_item_object','page'),(19,10,'_menu_item_target',''),(20,10,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(21,10,'_menu_item_xfn',''),(22,10,'_menu_item_url',''),(23,11,'_menu_item_type','custom'),(24,11,'_menu_item_menu_item_parent','0'),(25,11,'_menu_item_object_id','11'),(26,11,'_menu_item_object','custom'),(27,11,'_menu_item_target',''),(28,11,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(29,11,'_menu_item_xfn',''),(30,11,'_menu_item_url','http://fromnepal.tk/'),(31,12,'_menu_item_type','post_type'),(32,12,'_menu_item_menu_item_parent','0'),(33,12,'_menu_item_object_id','5'),(34,12,'_menu_item_object','page'),(35,12,'_menu_item_target',''),(36,12,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(37,12,'_menu_item_xfn',''),(38,12,'_menu_item_url',''),(44,1,'_is_empty_after_transformation','no'),(45,1,'_has_warnings_after_transformation','no'),(52,4,'_edit_lock','1519464506:1'),(53,4,'_edit_last','1');
/*!40000 ALTER TABLE `wped_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_posts`
--

DROP TABLE IF EXISTS `wped_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_posts`
--

LOCK TABLES `wped_posts` WRITE;
/*!40000 ALTER TABLE `wped_posts` DISABLE KEYS */;
INSERT INTO `wped_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES (1,1,'2018-02-24 04:47:55','2018-02-24 04:47:55','Welcome to WordPress. This is your first post. Edit or delete it, then start writing!','Hello world!','','publish','open','open','','hello-world','','','2018-02-24 04:47:55','2018-02-24 04:47:55','',0,'http://fromnepal.tk/?p=1',0,'post','',1),(2,1,'2018-02-24 04:47:55','2018-02-24 04:47:55','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://fromnepal.tk/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','publish','closed','open','','sample-page','','','2018-02-24 04:47:55','2018-02-24 04:47:55','',0,'http://fromnepal.tk/?page_id=2',0,'page','',0),(3,1,'2018-02-24 04:48:15','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2018-02-24 04:48:15','0000-00-00 00:00:00','',0,'http://fromnepal.tk/?p=3',0,'post','',0),(4,1,'2018-02-24 05:23:02','2018-02-24 05:23:02','CONTENT COMMING SOON...','Home','','publish','closed','closed','','home','','','2018-02-24 09:30:28','2018-02-24 09:30:28','',0,'http://fromnepal.tk/?page_id=4',0,'page','',0),(5,1,'2018-02-24 05:23:02','2018-02-24 05:23:02','','Blog','','publish','closed','closed','','blog','','','2018-02-24 05:23:02','2018-02-24 05:23:02','',0,'http://fromnepal.tk/?page_id=5',0,'page','',0),(17,1,'2018-02-24 09:30:28','2018-02-24 09:30:28','CONTENT COMMING SOON...','Home','','inherit','closed','closed','','4-revision-v1','','','2018-02-24 09:30:28','2018-02-24 09:30:28','',4,'http://fromnepal.tk/2018/02/24/4-revision-v1/',0,'revision','',0),(7,1,'2018-02-24 05:23:02','2018-02-24 05:23:02','Welcome to your site! This is your homepage, which is what most visitors will see when they come to your site for the first time.','Home','','inherit','closed','closed','','4-revision-v1','','','2018-02-24 05:23:02','2018-02-24 05:23:02','',4,'http://fromnepal.tk/2018/02/24/4-revision-v1/',0,'revision','',0),(8,1,'2018-02-24 05:23:02','2018-02-24 05:23:02','','Blog','','inherit','closed','closed','','5-revision-v1','','','2018-02-24 05:23:02','2018-02-24 05:23:02','',5,'http://fromnepal.tk/2018/02/24/5-revision-v1/',0,'revision','',0),(9,1,'2018-02-24 05:23:02','2018-02-24 05:23:02','','Home','','publish','closed','closed','','home','','','2018-02-24 05:23:02','2018-02-24 05:23:02','',0,'http://fromnepal.tk/2018/02/24/home/',0,'nav_menu_item','',0),(10,1,'2018-02-24 05:23:02','2018-02-24 05:23:02',' ','','','publish','closed','closed','','10','','','2018-02-24 05:23:02','2018-02-24 05:23:02','',0,'http://fromnepal.tk/2018/02/24/10/',1,'nav_menu_item','',0),(11,1,'2018-02-24 05:23:03','2018-02-24 05:23:03','','Home','','publish','closed','closed','','home-2','','','2018-02-24 05:23:03','2018-02-24 05:23:03','',0,'http://fromnepal.tk/2018/02/24/home-2/',0,'nav_menu_item','',0),(12,1,'2018-02-24 05:23:03','2018-02-24 05:23:03',' ','','','publish','closed','closed','','12','','','2018-02-24 05:23:03','2018-02-24 05:23:03','',0,'http://fromnepal.tk/2018/02/24/12/',1,'nav_menu_item','',0);
/*!40000 ALTER TABLE `wped_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_term_relationships`
--

DROP TABLE IF EXISTS `wped_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_term_relationships`
--

LOCK TABLES `wped_term_relationships` WRITE;
/*!40000 ALTER TABLE `wped_term_relationships` DISABLE KEYS */;
INSERT INTO `wped_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES (1,1,0),(9,2,0),(10,2,0),(11,3,0),(12,3,0);
/*!40000 ALTER TABLE `wped_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_term_taxonomy`
--

DROP TABLE IF EXISTS `wped_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_term_taxonomy`
--

LOCK TABLES `wped_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wped_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wped_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES (1,1,'category','',0,1),(2,2,'nav_menu','',0,2),(3,3,'nav_menu','',0,2),(4,4,'category','',0,0);
/*!40000 ALTER TABLE `wped_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_termmeta`
--

DROP TABLE IF EXISTS `wped_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_termmeta`
--

LOCK TABLES `wped_termmeta` WRITE;
/*!40000 ALTER TABLE `wped_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wped_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_terms`
--

DROP TABLE IF EXISTS `wped_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_terms`
--

LOCK TABLES `wped_terms` WRITE;
/*!40000 ALTER TABLE `wped_terms` DISABLE KEYS */;
INSERT INTO `wped_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES (1,'Uncategorized','uncategorized',0),(2,'Main Menu','main-menu',0),(3,'Top Menu','top-menu',0),(4,'News','news',0);
/*!40000 ALTER TABLE `wped_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_usermeta`
--

DROP TABLE IF EXISTS `wped_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_usermeta`
--

LOCK TABLES `wped_usermeta` WRITE;
/*!40000 ALTER TABLE `wped_usermeta` DISABLE KEYS */;
INSERT INTO `wped_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES (1,1,'nickname','fromnepal'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'syntax_highlighting','true'),(7,1,'comment_shortcuts','false'),(8,1,'admin_color','fresh'),(9,1,'use_ssl','0'),(10,1,'show_admin_bar_front','true'),(11,1,'locale',''),(12,1,'wped_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(13,1,'wped_user_level','10'),(14,1,'dismissed_wp_pointers','theme_editor_notice'),(15,1,'show_welcome_panel','1'),(16,1,'session_tokens','a:1:{s:64:\"1a5590f1e64a360cf53d405b4b37cc24d6006fefd9f520b77433458af97ab669\";a:4:{s:10:\"expiration\";i:1522471124;s:2:\"ip\";s:12:\"202.51.76.89\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.45 Safari/537.36\";s:5:\"login\";i:1522298324;}}'),(17,1,'wped_dashboard_quick_press_last_post_id','3'),(18,1,'community-events-location','a:1:{s:2:\"ip\";s:11:\"202.51.76.0\";}'),(19,1,'nav_menu_recently_edited','2'),(20,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),(21,1,'metaboxhidden_nav-menus','a:2:{i:0;s:26:\"add-post-type-wp_automatic\";i:1;s:12:\"add-post_tag\";}');
/*!40000 ALTER TABLE `wped_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wped_users`
--

DROP TABLE IF EXISTS `wped_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wped_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wped_users`
--

LOCK TABLES `wped_users` WRITE;
/*!40000 ALTER TABLE `wped_users` DISABLE KEYS */;
INSERT INTO `wped_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES (1,'fromnepal','$P$Bbps7UM2ygUX8EMHs77PgBjxA.pF2w/','fromnepal','alex.punk41@gmail.com','','2018-02-24 04:47:55','',0,'fromnepal');
/*!40000 ALTER TABLE `wped_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'wikicele_wp70'
--

--
-- Dumping routines for database 'wikicele_wp70'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-13  7:59:09

-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 22, 2016 at 01:24 AM
-- Server version: 5.6.28-log
-- PHP Version: 5.6.18-pl0-gentoo

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev_2016`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `accessId` int(11) NOT NULL,
  `access_fk_rolesId` int(11) NOT NULL,
  `access_fk_usersId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `articlesId` int(11) NOT NULL,
  `articles_fk_usersId` int(11) NOT NULL,
  `articlesDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `articlesTitle` varchar(255) NOT NULL,
  `articlesText` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `articles_comments`
--

CREATE TABLE `articles_comments` (
  `articles_commentsId` int(11) NOT NULL,
  `articles_commentsDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `articles_comments_fk_articlesId` int(11) NOT NULL,
  `articles_comments_fk_usersId` int(11) NOT NULL,
  `articles_commentsText` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `articles_meta`
--

CREATE TABLE `articles_meta` (
  `articles_metaId` int(11) NOT NULL,
  `articles_meta_fk_articlesId` int(11) NOT NULL,
  `articles_metaSetting` varchar(128) NOT NULL,
  `articles_metaValue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permissionsId` int(11) NOT NULL,
  `permissionsName` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `permissions_fk_roleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requirement`
--

CREATE TABLE `requirement` (
  `requirementId` int(11) NOT NULL,
  `requirementPagename` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `requirementAction` varchar(255) COLLATE utf8_danish_ci NOT NULL DEFAULT 'null',
  `requirement_fk_permissionsName` varchar(255) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `rolesId` int(11) NOT NULL,
  `rolesName` varchar(255) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`rolesId`, `rolesName`) VALUES
(2, 'Admin'),
(6, 'Logout'),
(3, 'Modorator'),
(1, 'Superadmin'),
(4, 'Superuser'),
(5, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settingsId` int(11) NOT NULL,
  `settingsName` varchar(128) NOT NULL,
  `settingsValue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settingsId`, `settingsName`, `settingsValue`) VALUES
(1, 'admin_email', 'djmadness@totalirc.net'),
(2, 'theme_selected', 'default'),
(4, 'website_description', 'Description for the website'),
(5, 'website_author', 'Christopher Moore'),
(6, 'website_keywords', 'Keyword, another keyword, and another keyword'),
(7, 'website_footer', 'Copyright DjMadness © 2003-2016'),
(10, 'website_charset', 'utf-8'),
(11, 'website_title', 'Project title');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usersId` int(11) NOT NULL,
  `usersUsername` varchar(64) NOT NULL,
  `usersPassword` varchar(128) NOT NULL,
  `usersDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usersId`, `usersUsername`, `usersPassword`, `usersDate`) VALUES
(1, 'DjMadness', '$2y$10$cRusDtIvUFmlc.DNK2dp1uIDQSTjwsJhGWH138NgvTZviIZ8deLXO', '2016-02-16 11:42:58'),
(32, 'rand_user47559', '$2y$10$keLaxN6vNIoUR1MoPvnJlOlidDGpY9S6XkJmKX2kSWtSi5RZBRwoS', '2016-02-16 11:54:53'),
(33, 'rand_user57112', '$2y$10$wTu8VTPvxNEbqd3rEuvExurtL/Scwz3m83zi6w5ITQt5jWC4iCAhq', '2016-02-16 11:54:53'),
(34, 'rand_user27421', '$2y$10$g4kFhc19EMdqlaV1PXsI8uePvXpTPUDqBSrrGnk4FbJk1F8hKzPaC', '2016-02-16 11:54:53'),
(35, 'rand_user38718', '$2y$10$juTMh2JiG2NJa/.hkumZrufW7orJ6z7xQij6zJR.rIXxIsJ/eTt1S', '2016-02-16 11:54:53'),
(36, 'rand_user34660', '$2y$10$kq7IfhstKPkqlXnOaVio2uOq4Kc.LAyHd7U9Md3gCF27l9IU9c.dy', '2016-02-16 11:54:54'),
(37, 'rand_user53717', '$2y$10$BtVrQoj7I7s0Gk6yD/i8meWadLYOnpDBe/p.T3.5e.sM9MuWjYWRq', '2016-02-16 11:54:54'),
(38, 'rand_user40704', '$2y$10$1th/dWZBRyXH7iEp/abRC.DiB4e8hoT6dFa0peoDnS2qfnjrVyajS', '2016-02-16 11:54:54'),
(39, 'rand_user12405', '$2y$10$pUnHbF2zvNB75nQ3vlJuquJptEhh4OO/ELW5yQnIxI4ssx88WbYH.', '2016-02-16 11:54:54'),
(40, 'rand_user63075', '$2y$10$DeEjsCQa9yO20nYQtKXZ9OUtwUdAdVoO5I7LtREZGi34942w6xL2m', '2016-02-16 11:54:54'),
(41, 'rand_user7185', '$2y$10$EWqWj0xegLmi2nnPBlkkw.S8YgBvgManECLYB1yNJH8nceMR3sqF6', '2016-02-16 11:54:54'),
(42, 'rand_user14458', '$2y$10$fzykIEn8QXrl24.Kkjkxoe5/rnORMw9B0TwvJs37r2fZ4ofUPrG.q', '2016-02-16 11:54:54'),
(43, 'rand_user60632', '$2y$10$YJXyQumsGX7pZz4MHJdz7u9FBfgCCaYOYDwvWs9K.MnBwLNRq4jcC', '2016-02-16 11:54:54'),
(44, 'rand_user62810', '$2y$10$Ryii7P15zTywPu.mh.sJ.OkMqcy0.bFp4v6G5Co7aHGhXbt8MMoca', '2016-02-16 11:54:54'),
(45, 'rand_user46671', '$2y$10$HwUhiY2OZKK6puiP55cIIeDTE/PydCoYAFLhjHh5OnByQubUO6mnG', '2016-02-16 11:54:54'),
(46, 'rand_user36231', '$2y$10$tlLVXYSUSq8GF/cXDx6yTOaGvH12FNCiNmWlbb3FJLGUeXsheN.om', '2016-02-16 11:54:54'),
(47, 'rand_user36492', '$2y$10$8YIlH9Gn4qV26UVoO4yAn.GQqH4fbxvW37EANeKGc0WorXqd32hZ2', '2016-02-16 11:54:54'),
(48, 'rand_user8971', '$2y$10$5WnqC9IFIIbgWAEOiMoYkObquNcUrjzhMNPryWVtGoM9Dx1WoeSgK', '2016-02-16 11:54:54'),
(49, 'rand_user32071', '$2y$10$E.fl8rnim98U3N7FaK9aQ.2b8kDqXR7t5RD49l3.1Btk2D/N5TyEK', '2016-02-16 11:54:55'),
(50, 'rand_user24989', '$2y$10$4tqhXqy00qdo0LH8BRIMl.saaH9YO2.pfJsnSuaxJPCLb2Ftx4Lve', '2016-02-16 11:54:55'),
(51, 'rand_user54771', '$2y$10$Uqzm5.ONWUwTfVmvYt6x6ey5xPKa91pJcHvz.0EBRp4Li3aA6yZ6.', '2016-02-16 11:54:55'),
(52, 'rand_user26055', '$2y$10$5WZUcBRB5bG1AtEgO4fyYe7reDINQDWklKJqzZVRS2QVkyyYAHvk.', '2016-02-16 11:54:55'),
(53, 'rand_user39899', '$2y$10$T1vB2oele6cRrgPukf4ymeCt8X6U1J.EEvrdDC2apI3Bm4cNloU5.', '2016-02-16 11:54:55'),
(54, 'rand_user50883', '$2y$10$UcW/nopBIkCiy/E1vSvDHOME3rMALplVWY0/0Pv/FERRdXUQiWBM2', '2016-02-16 11:54:55'),
(55, 'rand_user42389', '$2y$10$NdQ0IsIeiod6B77mf0roXeBZtMAXeaFQDN1pQ7C.x4ET9P66SMe5.', '2016-02-16 11:54:55'),
(56, 'rand_user47277', '$2y$10$lAgq7YHoDZ9A6VrZowAaVON5nUG32DMaGpcpZRe5A2osGuJkCICWm', '2016-02-16 11:54:55'),
(57, 'rand_user35342', '$2y$10$J.6BOZIgfAMJV5d2Xwq2JejFJluq250ZJMMDJ0w9SoCNepv1HDiMi', '2016-02-16 11:54:55'),
(58, 'rand_user31126', '$2y$10$2TGy.IkfqIErX5eYb1u7ceTjRMN9MRwLIySDHjHuFnc3.U/AyetaG', '2016-02-16 11:54:55'),
(59, 'rand_user65402', '$2y$10$W1qqQ4gkfmlUG2E5kUXXReD2qe3Aro1S.CAQKsstTVy/8TQae/BEu', '2016-02-16 11:54:55'),
(60, 'rand_user45918', '$2y$10$cczj4yIoYJ9KmDZ4GeJjTOt1X5H7EKLBe06Ha/72YcTcbUC0C/QJu', '2016-02-16 11:54:55'),
(61, 'rand_user9883', '$2y$10$Nq71t1Y56Cg/TqjkgX.JS.q1a3XPg6MME.GKKUnvEIr34PvtV8UiO', '2016-02-16 11:54:55'),
(62, 'rand_user12782', '$2y$10$2Y4obwy4JeUKCW.HZ8VdN.rzpmMt4hM0UM6gZKeW7m9LPyUgAUphG', '2016-02-16 11:54:55'),
(63, 'rand_user22833', '$2y$10$5BSGffVLbVV0cm4FTVZoGOGlvLjDF.HLpd2QoCt64bpvX6YzV6DpO', '2016-02-16 11:54:56'),
(64, 'rand_user18299', '$2y$10$YgKpxYCijJnX0y/uNA61tO0VpvHty9aZ7d9q99Ec2ZluHQuWfNV8K', '2016-02-16 11:54:56'),
(65, 'rand_user26399', '$2y$10$0gBojYrhkt7QjUS0.90Mt.QWljud2yn6l2duYes.S8mmRxJOxOA0S', '2016-02-16 11:54:56'),
(66, 'rand_user28399', '$2y$10$z7SBHLgAZsoZWQKyHNc1dO86w7oaMpyQ6arynz0kmrEqZK89HrCMS', '2016-02-16 11:54:56'),
(67, 'rand_user51264', '$2y$10$.vIu.WIUbI/oIxVdaf6aP.mPyFIqpX8EeWN7Nuq0SInpZbkxOAPuy', '2016-02-16 11:54:56'),
(68, 'rand_user14282', '$2y$10$ySnBXSL2h5zAI02p2kxzNurT8JRx8iv2wMg7okKpqBM.PhCClgLpK', '2016-02-16 11:54:56'),
(69, 'rand_user8209', '$2y$10$C33P/6u4e3P3G678etNr7OHVNQbYaTd2MH62iyXAC6OdoVPAUO1PG', '2016-02-16 11:54:56'),
(70, 'rand_user14590', '$2y$10$u2D/y009kiQWHYp7y9mrTeSb1YvQCjXoEjrleoIGsnIjRjmHFmMLW', '2016-02-16 11:54:56'),
(71, 'rand_user34509', '$2y$10$XzPw2J7AYzBfLks2MSNHdOSh4KTr6M9RTWxCeiS8h8mHKoGTgwfO6', '2016-02-16 11:54:56'),
(72, 'rand_user50886', '$2y$10$pLLkbnBOExedCc9XU4enr.05ht96eODLkI2rhrxMnUVNs4x5kXiq.', '2016-02-16 11:54:56'),
(73, 'rand_user26249', '$2y$10$u79IJuGLVTAAWB6D6qlSFO87GGoNbzsfudUEI5bAh6dtbBaiU9FXK', '2016-02-16 11:54:56'),
(74, 'rand_user23542', '$2y$10$ioPT7AGjaAlQk0HWjUXddOC4vvRURz23xoeSk2m6PZ8irhZIRZcQG', '2016-02-16 11:54:56'),
(75, 'rand_user20557', '$2y$10$/JqhfZXS4/n4EhG5sUTwtuBhTqvWMs9A0/hzdATc9TJWN6RbQr7ly', '2016-02-16 11:54:56'),
(76, 'rand_user7370', '$2y$10$5.EcIuKWxCNtCMjZ3yE33uag2nAhdhdO9Zd1IawcdFgEjxs5koSG2', '2016-02-16 11:54:57'),
(77, 'rand_user1873', '$2y$10$ktMeDXgIMEHA.ccI.BZGxur9jzXHk3mBRUA2zPFgqQ.Q4VZNDT/GW', '2016-02-16 11:54:57'),
(78, 'rand_user39405', '$2y$10$g8tjwZo.AAnyhRswMV4tr.Y9ckyZ.fPt24pED/gBGCRhNKcVosbBu', '2016-02-16 11:54:57'),
(79, 'rand_user5533', '$2y$10$5r3MVPhxLub1fNXzxyk12OUHPjCBFjUg8Y1AbTySlr7mZEsB6KC3a', '2016-02-16 11:54:57'),
(80, 'rand_user58956', '$2y$10$q0KzWzelOtojqqL0QJ5Cn.aPUv3UFT1dhzVs8w6sghVeH5OwpvnNi', '2016-02-16 11:54:57'),
(81, 'rand_user38983', '$2y$10$mJ0bRAjJ97hUFYGPweP5dOT8f.UBmiRfrTcBkOGafd8WsovEu6HXS', '2016-02-16 11:54:57'),
(82, 'rand_user22011', '$2y$10$WRGUlWb8qlY9HtomKcTW4uRrRcyqkGnNxYpSwKoFewm6jZvv0N3hW', '2016-02-16 11:54:57'),
(83, 'rand_user35191', '$2y$10$VGbdE6iEH/wDL7XRAYmvaeojXeMfX3KmwDqAQs/OO/fpMpanQ7sbu', '2016-02-16 11:54:57'),
(84, 'rand_user43832', '$2y$10$y9KhNgXuJgN60Kb0p0L9c.KSbvn10rqiEqyatFxHA2yT4YoO0s82C', '2016-02-16 11:54:57'),
(85, 'rand_user41169', '$2y$10$Il6bF2ZLHIgdHBl8ytUo2O8HfekM8tbQtpszmMBl23i2pvkXay3pe', '2016-02-16 11:54:57'),
(86, 'rand_user13824', '$2y$10$2Q1oU.QaSawr4NllgCF9M.r9vApH3VJKsJFEEmaWkQIUeO7lCqM/W', '2016-02-16 11:54:57'),
(87, 'rand_user1416', '$2y$10$kbo7eAs1LrtYVSA5KZ2Tm.zhRqxi.Q6iomFsiu/V3/SsVu4PP3nmS', '2016-02-16 11:54:57'),
(88, 'rand_user23670', '$2y$10$52ktMkWWEJpIh8tD6fbcY.WOjU5iA2JL9hVNZcuCob91uAhGdb5w.', '2016-02-16 11:54:57'),
(89, 'rand_user22966', '$2y$10$MOZIvKxvDi0frxTObkH19.cpekb6RHrCKeemWYgGwOakgqNbC8kCe', '2016-02-16 11:54:58'),
(90, 'rand_user15900', '$2y$10$DWuXBVZVtRCCxBHjMjyVK.dIbBZ6us8BG9t7U4yMWivg6q/J84ni6', '2016-02-16 11:54:58'),
(91, 'rand_user18072', '$2y$10$2uTLtbHTeVj/zJfmISb9OuFWGjXeBxuHkF5OxWFfKfuyUOFmTqhcq', '2016-02-16 11:54:58'),
(92, 'rand_user39789', '$2y$10$9mlQvGeDRPQUE/zcC7BPtOq2XtN1wIG/oHPPYcXAUw3YcVXFBa3Qa', '2016-02-16 11:54:58'),
(93, 'rand_user34408', '$2y$10$0xcMun6dRuHztIY.P941QuwTYXhsQ1dCV2XgGHJEBsM2QdmKtz80y', '2016-02-16 11:54:58'),
(94, 'rand_user57890', '$2y$10$TbAhUgT1TRymn92q8m9fz.KvzZhAO23XJrGc3Ns7fQvihbQG1uMMq', '2016-02-16 11:54:58'),
(95, 'rand_user32962', '$2y$10$5DlaPCT6Hj3hSkyuuk/7Fu/eCLfWCkW/5pP1aAiSfh9sCnYeHQBYm', '2016-02-16 11:54:58'),
(96, 'rand_user14236', '$2y$10$y.qwr3YCCjCbRykYfsF6a.csi2p0uNTV1yDlteDxl2bUC8KiW0XcC', '2016-02-16 11:54:58'),
(97, 'rand_user58692', '$2y$10$npZ52OeRq.ZWngdZbFtoT.o1fAx1yth2YJPeHrUz2c6eKgGhmLlmy', '2016-02-16 11:54:58'),
(98, 'rand_user37151', '$2y$10$6.LWp0DkvaMQqU.E6CeK2O6nftd2B8Ao4JNNephvaoQ4GJjeu.LIO', '2016-02-16 11:54:58'),
(99, 'rand_user19579', '$2y$10$JgA6bbshDaFvecaY1egAKe6cLZifuz.i3/tfNBfeUEOQEl8Nr3x/m', '2016-02-16 11:54:58'),
(100, 'rand_user25956', '$2y$10$yA4JyW.JF6Lk7wyIeeJ7aOkKVB4nEJdc9EweLd.oLUbZGc9GWQ4o6', '2016-02-16 11:54:58'),
(101, 'rand_user47092', '$2y$10$IARCG5Q5PMWVqZi7/MzqO.Fotd8i99RRnsK2Z6n4.XuwLUPAdNRFy', '2016-02-16 11:54:58'),
(102, 'rand_user14002', '$2y$10$GEav.CmsMM8esxkBjtxa4OdD.dEdzYuP4B/krv95e9AIPkPUtYqt2', '2016-02-16 11:54:58'),
(103, 'rand_user60061', '$2y$10$aq6TbRhFgrPlOxq6fmT6G.v0UfG5dRBl8zhisdIzQ22LhNmoj1jQK', '2016-02-16 11:54:59'),
(104, 'rand_user11564', '$2y$10$x87G7zGTpesDbw8pmfU9j.91cPGwERTcJOatvVmTKmKMlUElnfR3a', '2016-02-16 11:54:59'),
(105, 'rand_user58249', '$2y$10$KpYY7MaWZhcPIqpaiLoMpei8WQxHXvZY/HmEKuW/uLCpjM1KSpquy', '2016-02-16 11:54:59'),
(106, 'rand_user14016', '$2y$10$xatR7swYK13IzvoiCmX9NejxGq6Bv.ZbZQ89iGUbOkUnmm4UCpxMC', '2016-02-16 11:54:59'),
(107, 'rand_user24917', '$2y$10$YByv/NvckhIemgGHiu40YeUNMoMLAUxmdfmNyLu61/1NRzux9JRyS', '2016-02-16 11:54:59'),
(108, 'rand_user37053', '$2y$10$CuIMVyeURahqL/7ceL3r7Ow40iR7iPZ3H9qtkHf56xs4vuPAQlGGa', '2016-02-16 11:54:59'),
(109, 'rand_user10810', '$2y$10$3mWgPN6OvSi1VJeE1eXcBO1Zgmb5Eq4vnDGJbIi8M3pn0jM.sdon6', '2016-02-16 11:54:59'),
(110, 'rand_user24415', '$2y$10$1A/5UUhYrpwnQLnf0oTW8uffpy6Eld2XZXOzQDZpBHbP65wP9poxW', '2016-02-16 11:54:59'),
(111, 'rand_user61440', '$2y$10$ebEUa1GT/JPTK.V3MNkgVey4.Px5JYTbija0X9RAMKAKDc7iuWlrS', '2016-02-16 11:54:59'),
(112, 'rand_user60043', '$2y$10$ymjfGbZXrSsada/Oj/ybe.IdKqsUAZGy5S0CbdVUdI3FftBqf.m86', '2016-02-16 11:54:59'),
(113, 'rand_user64056', '$2y$10$iMsM1Vnru72tEt1VQiGgMO3lejeSFlruaD6/oRN0tcAiXWEbloYxO', '2016-02-16 11:54:59'),
(114, 'rand_user21229', '$2y$10$B9jFipYMoavqKYMPzHYNFeHh7/A4NsYTAqzsZw6LwYEZE0Hj/d.xG', '2016-02-16 11:54:59'),
(115, 'rand_user23705', '$2y$10$HlOwvBejMR7em4k2PjlwEO6KMAgUlhoi//ADm10hLMDlA3CFaouSG', '2016-02-16 11:54:59'),
(116, 'rand_user1060', '$2y$10$Gq3Q3BDPIH8aicEp1Gu2d.PzAUUcKMnxydR68gXFa8v0ykQ17Fd2K', '2016-02-16 11:55:00'),
(117, 'rand_user22448', '$2y$10$.QwvnuqnSq3LRtqmXciPjOZLJbB/UCSkolXh7vn2WFTFp.Bl014Bq', '2016-02-16 11:55:00'),
(118, 'rand_user60272', '$2y$10$GVR4TA/AHR/HrUrGZDTDxuIyAWCmfeFHKkRbhbLwLAEke8R5ogUEG', '2016-02-16 11:55:00'),
(119, 'rand_user38741', '$2y$10$CcXKy0/I7cslH2WwFy3tnOFRvIm4YRedPBs9ll27WgdzRTM6bwIV6', '2016-02-16 11:55:00'),
(120, 'rand_user25757', '$2y$10$u1qLAjk6DF0g2G/4g2m/KehjYLEA.NJQGhCgPQxW4qxbUgsVQbSri', '2016-02-16 11:55:00'),
(121, 'rand_user23668', '$2y$10$RAlglh3f4b94RIV.chDhk.eBvNQUoT1JCFBudaLpxlnW5pRrKC4Oe', '2016-02-16 11:55:00'),
(122, 'rand_user5233', '$2y$10$se6NxRrx5CxixXVkMiN9z.OTSrQAH/nGVAHhyma4qMwk3B1vR41WK', '2016-02-16 11:55:00'),
(123, 'rand_user14218', '$2y$10$VPtoQXThydTf3oRZWNocKO5mZiWgqXDMT352DI84fcAcJcqaczYeu', '2016-02-16 11:55:00'),
(124, 'rand_user22130', '$2y$10$ZspVxVlXKHUELAhdIcYnou6L/hVtpmJnfTTaZJ2ZtdyN2h0.ZEkLm', '2016-02-16 11:55:00'),
(125, 'rand_user53402', '$2y$10$uIHtKaWcpIMmyuMewbrNmOiN6ACnj19Dy/S1BVBVLL/vvebA1JHDC', '2016-02-16 11:55:00'),
(126, 'rand_user40425', '$2y$10$5gyVn1oq35Fq4URPmLtLkuURklEI0E7bB5DKK6KvKAR3C8f56VHsu', '2016-02-16 11:55:00'),
(127, 'rand_user20581', '$2y$10$i55A3hctaMMcFZa1ivI.SeJSckrSbHbGA56CMGfVDievo7xwwVhIe', '2016-02-16 11:55:00'),
(128, 'rand_user10019', '$2y$10$o3a1lVTLsnDhJ4UJLOuK3.kHBEijMyAYuvkUFLlEWaqsIc0e.i6Q6', '2016-02-16 11:55:00'),
(129, 'rand_user23300', '$2y$10$8gUtaqfm2Enh75cBsBr1he4aAU77..MilCb2WrbSXQHwi7YnYHRlu', '2016-02-16 11:55:00'),
(130, 'rand_user34352', '$2y$10$42.N/ImAKttnYRLxEKVNZuu4ofdMyJxskuucPPu4c.QRStXMA/X/G', '2016-02-16 11:55:01'),
(131, 'rand_user7407', '$2y$10$8j/G2IL6ylFS/N0EskqixOcsvlt91a9uPIvVfOySOB9LE2TgmCfAS', '2016-02-16 11:55:01'),
(132, 'rand_user7477', '$2y$10$SaN8MhyQ3JK8GVnFt1n.OuwpeK1XrWv0V8aZbpeJOs1IEoAgzf4fG', '2016-02-16 11:55:01'),
(133, 'rand_user51768', '$2y$10$frcqcz5HhPho2wCGM5cZq.YQ0PS6/7JDafhCYQtMr3hJ/kJdhA7WS', '2016-02-16 11:55:01'),
(134, 'rand_user15630', '$2y$10$NXneoIMmwAC6wVTlGhSApOjw.uGD6RPBTj.Wz0i0wyhzNHzc.4ewS', '2016-02-16 11:55:01'),
(135, 'rand_user1188', '$2y$10$WskAgXfiOa85wB.ZCr477e74Vao5dCvs0jbDRvK2jUaw3wfRAZVRa', '2016-02-16 11:55:01'),
(136, 'rand_user42563', '$2y$10$LFzftF/0uNri6K0kOU6G4OMKWW0pZbssN0LEwHIa6ObukUqPjEBzG', '2016-02-16 11:55:01'),
(137, 'rand_user62534', '$2y$10$Y2Gz8cQgygpG.LASyJZO6uLz6tSgieRhAKgvEe04lXGQBeiUsVE3.', '2016-02-16 11:55:01'),
(138, 'rand_user24052', '$2y$10$g2hBdcup2ZNHHkKkNEQhIOrPA50nnp4JaJn13ELnmjG03OBbnCVdi', '2016-02-16 11:55:01'),
(139, 'rand_user30890', '$2y$10$WoULdOZXGpAuL9kWbxrHi.4aeBn3PL0jSssXwCqNZNZcFDioUG91W', '2016-02-16 11:55:01'),
(140, 'rand_user15886', '$2y$10$Gxm2BfN2HCG.BdOBEjIN7O6sGYvq20qYHFf8DstdkwUKjV6GxIZ4S', '2016-02-16 11:55:01'),
(141, 'rand_user45020', '$2y$10$k4BjA7by6N/Bkn9/xXlqW.FrmtNPAj26dfo517Xd9H6mTw44a1XLS', '2016-02-16 11:55:01'),
(142, 'rand_user25250', '$2y$10$GaJZV606ZsqPQGwtIuGYDuYegrCyQ/0zwc2h5Ws6PH6dtmSNpRnpq', '2016-02-16 11:55:01'),
(143, 'rand_user9996', '$2y$10$xoROCPG5PZjSzh5MP0uDTez/skYb9zAJbuZMDGfym3jCZe1h5prAe', '2016-02-16 11:55:02'),
(144, 'rand_user36079', '$2y$10$7L4kbXbxXs6ecb4Py2dEwuXNtQb2m09w7x9I1dM2jtDStrg6/XQKm', '2016-02-16 11:55:02'),
(145, 'rand_user25574', '$2y$10$zROnAPNOvEHmdvSaVVlK.OWT9XV1nHZcIFBh3.9SYwIr4foybOL0y', '2016-02-16 11:55:02'),
(146, 'rand_user52583', '$2y$10$LA4KwOG.nWEi/GJybykvqeH/KEbnuPyUoHc4i4sex14oI5VbMgLb2', '2016-02-16 11:55:02'),
(147, 'rand_user2185', '$2y$10$dcomksAw8OWCujxYIH52MeR3U.xKZ8uHM/YblSx8xc6W4iWxb9iv.', '2016-02-16 11:55:02'),
(148, 'rand_user15866', '$2y$10$T4T1/qZor3pxa8dkNKuf9.zBWiCzD7eLXZ9p0iif2Yjg/khpAaqgC', '2016-02-16 11:55:02'),
(149, 'rand_user45502', '$2y$10$IOv0ha4/O.byZxknRDbINe8LlGm.D4Fy3aS1zPzDx/JVt7MuP59Ii', '2016-02-16 11:55:02'),
(150, 'rand_user19475', '$2y$10$UVsRw5TBdVtJQcpH.DXWJ.8mIibY7qD6S9Cek2Fjf/.F.CKRDtMqe', '2016-02-16 11:55:02'),
(151, 'rand_user50155', '$2y$10$UQFm65livlJZq7gzFAvpWOTdfSTYB96SsH.oC83zQrYNupCbX2miS', '2016-02-16 11:55:02'),
(152, 'rand_user3553', '$2y$10$BzVow1IMtjlo3idxkzT9F.poWr5JNKpjy4.Yt1LpWhQ0VGG3fDI9O', '2016-02-16 11:55:02'),
(153, 'rand_user45901', '$2y$10$j.NqK9SXj6Ohna3b/I1RL.8Giu9Rf8.ohTYgn5ciZPj8BZii2/Gwq', '2016-02-16 11:55:02'),
(154, 'rand_user20931', '$2y$10$6Oz1Nsve7Sa8jaROTwn0tOl9G2SpzYwit2YUrmNBEkBr7wgaBreqW', '2016-02-16 11:55:02'),
(155, 'rand_user60312', '$2y$10$i7jxyiYrqqDziQUNPQWArOaH4vUYdp7hzyaK4dj/2daQXQG/Uj6by', '2016-02-16 11:55:02'),
(156, 'rand_user37205', '$2y$10$lCBj30VNNnPv.iYdlJwgjOgUwiKl.nOqlHrf9/1OEk00Q6FvHxBYu', '2016-02-16 11:55:03'),
(157, 'rand_user22001', '$2y$10$8VNly87qxfodDakH59UNqO0zSwZY1b7LfnyZwDYrXPBSvflhILhL2', '2016-02-16 11:55:03'),
(158, 'rand_user43579', '$2y$10$YhXk94ubRIzS4i1s/GubNe23MFiQoUR8wQ4X952qF2eUiH5SpfRtm', '2016-02-16 11:55:03'),
(159, 'rand_user37182', '$2y$10$hma73w.l5mlHEb.Ta1ymD.hti6yB2vJyPBC6zNY0put93hu5prE1K', '2016-02-16 11:55:03'),
(160, 'rand_user13156', '$2y$10$3SXwKk5XqRjvs44PQJyUvOYhjiKpbDTFjsMFtyEx78xEDa8qpOs6m', '2016-02-16 11:55:03'),
(161, 'rand_user18746', '$2y$10$4LpmQTFDa0jL06cTowilau/MNwP7f8h6J/BglvqlXLZYJlFXQAZ7W', '2016-02-16 11:55:03'),
(162, 'rand_user33640', '$2y$10$G4w9IbKlDmcRzw6tjA8aP./ts6QGY3nEq5erfhHJd79hkCaEGkWpq', '2016-02-16 11:55:03'),
(163, 'rand_user45726', '$2y$10$C8ZprzOT3a2sU9MGJeZ1wu/qaZNFHIcuPmBR2.NxQV3xfROMcOLZm', '2016-02-16 11:55:03'),
(164, 'rand_user60477', '$2y$10$dj9mvuU69gY2r1LdG.0EjeldgJlOZj8/GiMZ09LpUpq3rDpJJIsHa', '2016-02-16 11:55:03'),
(165, 'rand_user2067', '$2y$10$wMaXGnxvdAkoZKb.DkJMR.ZXEZEXTN7cBu/wlBUy16.HQ6AaZ2icm', '2016-02-16 11:55:03'),
(166, 'rand_user28960', '$2y$10$3pv.mM8Oi4S6Ulza5LV3LeXYmaBmMQzHCT.QVc0ZRZpd0iiG6/EjC', '2016-02-16 11:55:03'),
(167, 'rand_user65085', '$2y$10$.MEh9DlXH7KoI9JEWJ/QUOPhiVMAkAZ4rNbrYPnUBaUvqvb7ubiP2', '2016-02-16 11:55:03'),
(168, 'rand_user12091', '$2y$10$yFc6NhO09ilbCam2vtl6peJenXYlCK46Bqoimi4SvKZCMDK8NPVXS', '2016-02-16 11:55:03'),
(169, 'rand_user31155', '$2y$10$ESZtKcz3Yvw9V2Jn7b.qJeEdp4mymuQYP6jM8MxVN/mpl.t52kXHS', '2016-02-16 11:55:04'),
(170, 'rand_user59021', '$2y$10$YsLUJUO9/9QjTku1P0aDMOh51l7gLYTLt9O56hPEtr2zIz4EfWJbC', '2016-02-16 11:55:04'),
(171, 'rand_user28550', '$2y$10$UzunywAYgl1o1CkuwA.OMuwqUPrI8z6fWglIkGnG82DCIfGGDHRMG', '2016-02-16 11:55:04'),
(172, 'rand_user37334', '$2y$10$SQmvQXuoFyAqBy6bzoxad.T9c.KNkig.ajYNNjJw.7uJCFuebynWe', '2016-02-16 11:55:04'),
(173, 'rand_user43302', '$2y$10$RoTK1Ec4VyxA.pPn4BdzT./Ls7RFY4WjB37Mn7xW2rkipSKIYhsuC', '2016-02-16 11:55:04'),
(174, 'rand_user43295', '$2y$10$uq1cieyl3SIbnlQzODUC.eQ2KTNnCoG73vkSTiYmlXTG7KsI5r.Fq', '2016-02-16 11:55:04'),
(175, 'rand_user17365', '$2y$10$1vwUsv0io.utcs4LSHd9oexIAKtdox.O2lBB1EiR/jl9BdogiRPOi', '2016-02-16 11:55:04'),
(176, 'rand_user43612', '$2y$10$Q27or1fkXt7T2hhb02Nc3OyCRavvxV6VXUOz510dMox0CckkfZkZW', '2016-02-16 11:55:04'),
(177, 'rand_user5819', '$2y$10$/rqmcPKuzDXjRRq.x2izV.eOgaGjzFbYt9lpJPYxY.2Ke235peKPG', '2016-02-16 11:55:04'),
(178, 'rand_user47806', '$2y$10$WwDX9rt90Ob0YD53/YUiLutCsYTYEfZwpDuqCC2z7tQ9SR9vmCFii', '2016-02-16 11:55:04'),
(179, 'rand_user50744', '$2y$10$4RVVKi.f8EWWsZmDbGq/ceXP2b28yEWwUPjZC5gbycVpXpLCtjIVK', '2016-02-16 11:55:04'),
(180, 'rand_user42350', '$2y$10$hdRt3iLnDsFdKqyL8qbSZez9rvmItay/oZtgaSTJJWvzr4JHMeU8i', '2016-02-16 11:55:04'),
(181, 'rand_user8099', '$2y$10$RCmk7AEhDJblQJeaSOlWHOQj185KmPDxiOCb39eHyuUkQT3ehvxyu', '2016-02-16 11:55:04'),
(182, 'rand_user15594', '$2y$10$YX8GT6tVZBc6o.R9nm0IUeOadS6aLM0qYNyaQb4YdAt8F8CEGH6X6', '2016-02-16 11:55:05'),
(183, 'rand_user29815', '$2y$10$RpVcVCxtiqv5L3r0SoTD9u1SCSLss2zOns5VkjuoSOnZWT9XEWCxO', '2016-02-16 11:55:05'),
(184, 'rand_user5535', '$2y$10$K9KQrAYSt1Gbo0G.AVlHaOVhB/uvw.11LDn94D13lJ0dJmXbIdfmO', '2016-02-16 11:55:05'),
(185, 'rand_user65378', '$2y$10$ftJBH6/SB4L6c2xJAtTKQuVH0fbL0VZcJlvmSYNk4c2ZU3Y6QwFwC', '2016-02-16 11:55:05'),
(186, 'rand_user51964', '$2y$10$MjJNEPSS7pK/x/dPR6MCienS3la0qmBuGvS8DateWVAfudFFsAZeK', '2016-02-16 11:55:05'),
(187, 'rand_user64399', '$2y$10$MI17FnjHnL8zlKj8yjBnZukGz6c29JG8nZvHhlsPURZsoFnwzLRA2', '2016-02-16 11:55:05'),
(188, 'rand_user31010', '$2y$10$dFhZWDD6nwGyjrCyswWBd.xpT.uqeYuw1xsUBpP.3nIsUkTwkm2cC', '2016-02-16 11:55:05'),
(189, 'rand_user59274', '$2y$10$sjCVgb63vX5cEzJroC22tefzGK8BUg1Ppua6hKl31Dxshn6.ADdN6', '2016-02-16 11:55:05'),
(190, 'rand_user52175', '$2y$10$BJOUG6uwLr/mThUD72n/Iuq0RA.vfkJMwJmyg/MpXzwPi504B0eVC', '2016-02-16 11:55:05'),
(191, 'rand_user35859', '$2y$10$vb371Nw1ZVV9ntMDVNJfvu3b12YifX/wMUOAMYgLjsPCFozhX.T7W', '2016-02-16 11:55:05'),
(192, 'rand_user63798', '$2y$10$Rje4/niUKv3iqlLKA7JIu.nStg6109cGHdGASCmQLhK2THfQiP7D2', '2016-02-16 11:55:05'),
(193, 'rand_user45217', '$2y$10$mrde9m4yYJ8Jlh0Zml5f0O5ZXxZgBsIM4OX0evjfAWLS85K3vUUuy', '2016-02-16 11:55:05'),
(194, 'rand_user15819', '$2y$10$k95tOY4XMRYGO/8MSYcqZOOajOVSK954hXj9E.Vh2WnAQdtPP.qge', '2016-02-16 11:55:05'),
(195, 'rand_user1643', '$2y$10$77hKSybs453PWiIqcdsoD.Qy.z07M07VaTO2voqLVQL18rrvYnY7u', '2016-02-16 11:55:06'),
(196, 'rand_user57153', '$2y$10$OCP76Fbps8R1X082mQC91O2.mEUbZblp7W5N0Y3tNVmiORH5QEon.', '2016-02-16 11:55:06'),
(197, 'rand_user41595', '$2y$10$qvP9Xbj8/HlIBxHQfS/IrOn.NVJLHUcD83dHkdpl9VoyPEgPp2uFS', '2016-02-16 11:55:06'),
(198, 'rand_user30747', '$2y$10$QxwAtnxYvvRHHojr6Mz/2exaCC6Y4by1hW22peoxydlWSzS80NI/u', '2016-02-16 11:55:06'),
(199, 'rand_user32742', '$2y$10$rKsr2PArLXxOxGjx/JI4hOyOgKfXC8oQIAF3av6k4q9tD7GLUSdmW', '2016-02-16 11:55:06'),
(200, 'rand_user17632', '$2y$10$N/J5uS4Z/2VaDXdCZ.rJ7enj9BXpjuZhSNTGh5T9zGk5KlDse0Hri', '2016-02-16 11:55:06'),
(201, 'rand_user54435', '$2y$10$YiErq/6FbBslovtqEq8pwehjax.wt7e1V0D3DqGp25.0Ag31dc5Ou', '2016-02-16 11:55:06'),
(202, 'rand_user25963', '$2y$10$d4ocy5uFh.cfNhbUmSznSuSXNdlGvZuRgqRpo.sct8JBoIv3H.4vW', '2016-02-16 11:55:06'),
(203, 'rand_user40641', '$2y$10$yRbLgi7daDT8VkKnHu79pe7VjbSCMKyJY6wFJaX8VLMAU2GMgKNRe', '2016-02-16 11:55:06'),
(204, 'rand_user30994', '$2y$10$BlsHEHZz0SyRN8JQ07OTH.VkAUJbsXYABr4eQPLd9dJvqVl0jjRMK', '2016-02-16 11:55:06'),
(205, 'rand_user42823', '$2y$10$S4exU3pGz3Wqfj94sfSiYeRcppZyXADmmrFDOlcA1zfAQXJzbv4Ae', '2016-02-16 11:55:06'),
(206, 'rand_user46943', '$2y$10$RDjD8LA3Br3PnwPhVVIHfeWWHb.TmqBcGH2HlmoEUcZdG793uSq16', '2016-02-16 11:55:06'),
(207, 'rand_user20240', '$2y$10$s3Drpg5uPhFWKqvsgu7SD.Agk7uKFhnYOBIwUktcRZD3PxrlptDq2', '2016-02-16 11:55:07'),
(208, 'rand_user40890', '$2y$10$uzp79OGkaTdGsdI7ukHit.1pSJuJtWE5hgbvNA.qmkdKni7r8ucdy', '2016-02-16 11:55:07'),
(209, 'rand_user54050', '$2y$10$39alcy/oZhmp6dYgfwtYQegfIr/JQd8EfeDBR4sztrDlySuqApYcO', '2016-02-16 11:55:07'),
(210, 'rand_user36741', '$2y$10$gmSDIupgnXiHo8HEGSFdkuX6dzTT2iRdtVEHQAXK9kIo.mwDWBesi', '2016-02-16 11:55:07'),
(211, 'rand_user20088', '$2y$10$xH3iP5vnXX2rEsCvYGB57O54dQKpYcNLjQfGix6bKjfyVywhlOwKi', '2016-02-16 11:55:07'),
(212, 'rand_user1939', '$2y$10$9vKUXFLN8C8OxByZqokKce3a16dII1UaG9zAH4jYNAHZQS29U9HLu', '2016-02-16 11:55:07'),
(213, 'rand_user37542', '$2y$10$oUHkAxVcA4WMQLknBFf8VO.jza4j0EKLiVCTv1j8PjXsmCJTtlmxe', '2016-02-16 11:55:07'),
(214, 'rand_user8981', '$2y$10$AeNO1ZtNymQXJorJAMN.x.OPQd9nPjD9fYrM0iolqMXKTzbUUmAQa', '2016-02-16 11:55:07'),
(215, 'rand_user4518', '$2y$10$DVS5.651ZEfR63WKZNC3pOKfMFafjcqt/tau8nhMNR/xo5rWTjHii', '2016-02-16 11:55:07'),
(216, 'rand_user47254', '$2y$10$wv4UQt44MDeG4d1zOTWRzORY193kvGjhZKFUnpym1kL62JLmCZ9wK', '2016-02-16 11:55:07'),
(217, 'rand_user24985', '$2y$10$JGf/GgHh/Mwr7iyX80waNOpvOm1s1URJeG20rnDOJKlGheJn772ba', '2016-02-16 11:55:07'),
(218, 'rand_user54507', '$2y$10$PJrjcWDEx0Y72xZcSTMA9OtJb2ALHTWlViCulKc8f.ZlP61/gmwJC', '2016-02-16 11:55:07'),
(219, 'rand_user32886', '$2y$10$nQDACWSSaeuPjU2Bg83AB.yHwzb8ruNCO/VWmZHoGm/WlsmIaEqgu', '2016-02-16 11:55:07'),
(220, 'rand_user47874', '$2y$10$MLjFaju.hNV7IXCWgf7w7egg9Ky6NSuU5EydvynbShEDJyMO6S6fG', '2016-02-16 11:55:08'),
(221, 'rand_user54887', '$2y$10$CdDtqucNI5F9/SgTJH2DDevDHPxu6o5KD9rdHf3B7nd7HEUpNAaqC', '2016-02-16 11:55:08'),
(222, 'rand_user18462', '$2y$10$RWrEwiF.CtPmRKb/TkNTj.svJNyv9wv78m7qCe.ZNyc1r8EZOcDTq', '2016-02-16 11:55:08'),
(223, 'rand_user2538', '$2y$10$d61YbjIf7HvChXFeO9XiUeFtZ9Nwpd1gO.EA5C7YnqPdVfMX5AsCy', '2016-02-16 11:55:08'),
(224, 'rand_user38289', '$2y$10$fJZ5Nvv5jwb2ICk58BuACedwaMr8vWaDCYN1mtgh7XPSrIBWC5XfW', '2016-02-16 11:55:08'),
(225, 'rand_user4757', '$2y$10$rKUdfzOxS4foaxviSnjaDeMet.OkYO5rmJ6HPdBTAF.Azc82ljIne', '2016-02-16 11:55:08'),
(226, 'rand_user59995', '$2y$10$dGn2CCepQnXUYYGp1eheT.Ca.so5oRLZzSg1JwbYBTl1nxmsbRCI.', '2016-02-16 11:55:08'),
(227, 'rand_user37235', '$2y$10$aApYzi/1w67FrfOvhenA2OfphTE/IEE7wDoy37NHXZJf/tEBnJ06m', '2016-02-16 11:55:08'),
(228, 'rand_user33699', '$2y$10$XzLo/TwYku0JpwYSaVZTuucvbVaOZKxew/hR1Kk0y5S/ItawWyo7e', '2016-02-16 11:55:08'),
(229, 'rand_user19018', '$2y$10$iWu7EHaSXubm5cKUIvvF6OuzteLhQKTLutJ/5xSeCuyry1fXbuEdi', '2016-02-16 11:55:08'),
(230, 'rand_user30382', '$2y$10$5N6pqR1F5/Z4hS8b3KlLVOsG.LdYyuCSz0GZNWZMQKJUS41rtKUZ2', '2016-02-16 11:55:08'),
(231, 'rand_user45853', '$2y$10$GdbMnXOgphsCLwO5vp2DB.sNFv50nRnDacqPXegbFVLqJA.WsDi/S', '2016-02-16 11:55:08'),
(232, 'rand_user58432', '$2y$10$qPAptOcG/3kDRTsN5M9b8.ZarJJ6z4ciJT3wgagER.zpefBLpqiz2', '2016-02-16 11:55:08'),
(233, 'rand_user58952', '$2y$10$CRzj/bveURwzMfQRaurkj.bjXoMtzUbqBbeaoS4ZBs/vhjvISYZ3i', '2016-02-16 11:55:09'),
(234, 'rand_user61382', '$2y$10$QGhudXjznRex.qFZHn4nquOqV7LKH7CtOhzTFxNfkUojjs8K.2dNy', '2016-02-16 11:55:09'),
(235, 'rand_user57237', '$2y$10$5pKnorzML.eDApVqQTewSO14WAb3PYHZhD4NC42QtmKqpcPBqTQqm', '2016-02-16 11:55:09'),
(236, 'rand_user24762', '$2y$10$UBYs2SlIMoWEpNttigWf9.CS/cm0D4zhGFNV./nd9HJSoRZYekHQS', '2016-02-16 11:55:09'),
(237, 'rand_user47919', '$2y$10$L3QzIhUHHs5PFvn9cYjWau/L0t6HIVW2oA/jHnm/S8HSeNzaGQtlu', '2016-02-16 11:55:09'),
(238, 'rand_user37547', '$2y$10$DWjK8q1JtSRp0yz4tNLLG.uVTLuF0GrzTrY2c8SN1.e3dsSYzKz2C', '2016-02-16 11:55:09'),
(239, 'rand_user53714', '$2y$10$xnPZBktA4x2HdVlYrXsXFu7YpXvTSeV60HL5K.LXmPt9TYNOP2Fd2', '2016-02-16 11:55:09'),
(240, 'rand_user18991', '$2y$10$3MXZJ9ln2K4QEFhta8R9yOfIfQbGweX.aOnrqlQPp0HYO7Apg2lcG', '2016-02-16 11:55:09'),
(241, 'rand_user55976', '$2y$10$OaUDrsgyYP0NQbhU7DTvGe8mrAqicj8uIHta8yLC3AzAWSdHiETJS', '2016-02-16 11:55:09'),
(242, 'rand_user16625', '$2y$10$7vxHYu3mxxHXCAZKovj2.uGtWbWd./RudysTjoG9TiKtDAAb.skWG', '2016-02-16 11:55:09'),
(243, 'rand_user55962', '$2y$10$Q0DS1yEihTvKsQ2OWWqN7.w7ECFewJYZSxjtONEKh6JHm0a7d7sDS', '2016-02-16 11:55:09'),
(244, 'rand_user45401', '$2y$10$Ay/KlL2CiXRlQ0Z0Noii.e2fszsYHulJwV1mcf5Hub59NDYhDN.AO', '2016-02-16 11:55:09'),
(245, 'rand_user31661', '$2y$10$N7MNcfgIj/XB1Z6iKcJ5Reon7aSLLK26n.2NR4K67NlBI1K/gBrti', '2016-02-16 11:55:09'),
(246, 'rand_user58227', '$2y$10$2zzic389wxwVfYMZJ40cMOBxjqr.ixlRR/zWA8jxUy1ZR4.Ff4Bu2', '2016-02-16 11:55:10'),
(247, 'rand_user34020', '$2y$10$1S.igzXSrETjYblxMEi9GOO/kLmmLqljPgSGV80QlbAVmclqa620O', '2016-02-16 11:55:10'),
(248, 'rand_user46020', '$2y$10$4pDcSQ9txtdTwCFHC48aJeLGms.JrqbLKwo7.Ykc8CQNE/i6uvAWq', '2016-02-16 11:55:10'),
(249, 'rand_user31475', '$2y$10$bLjeSNeToNxd6pACHKV9Zu6U4MSTkqopdh/MNWwSZhgUuhhJLhENK', '2016-02-16 11:55:10'),
(250, 'rand_user17627', '$2y$10$RKtGB2bth5IYGfHkJsWKw.mys3aA/kzVTyR/v27eBkTGEPNJ7ca1C', '2016-02-16 11:55:10'),
(251, 'rand_user4950', '$2y$10$H9LO1KytJnsbwTvtutCMouvPoKbSWoF6ALuRr8yVaALWf5D6PHxaS', '2016-02-16 11:55:10'),
(252, 'rand_user33729', '$2y$10$71/G8hNuJuHqaXvfqF/dZecypSvEfQUw0.76nQ22cS7FVKugQmXqu', '2016-02-16 11:55:10'),
(253, 'rand_user62373', '$2y$10$btT/uBG.zLwQiUgpbMqYB.X1KgBeGGgFJoNLuQkfDfWFGeqU725nS', '2016-02-16 11:55:10'),
(254, 'rand_user58336', '$2y$10$4YVV3eh5S/BGizjJXNKXseFT04uEa8JMQes74GFj66GfepNDJnXsO', '2016-02-16 11:55:10'),
(255, 'rand_user21479', '$2y$10$YMHYbZYbqHH8gpgwyQ8r3ONKZT8dqjkE6tgY8qMXhoVf/aWJ5UCc2', '2016-02-16 11:55:10'),
(256, 'rand_user42346', '$2y$10$qUE1oFZPuIO9xzT4xn1LBu8jkYcWHCjXU1uq2Y2TBNC8jtBYz/6JG', '2016-02-16 11:55:10'),
(257, 'rand_user28623', '$2y$10$4I1CzOeciwCI3IYrx3qgOeCKfa8LukrIKNk0.or6G6ekz/O1Bbybi', '2016-02-16 11:55:10'),
(258, 'rand_user15871', '$2y$10$gD3PigBx8vghi7uHLhvNJue1100vno0TrP2ieQxVEP60NyP7PqPNC', '2016-02-16 11:55:11'),
(259, 'rand_user19643', '$2y$10$opQ89Fa1gIpbdYoNY0N/Ge3atigEFbn4zpD8i2qK9FB5ILZq6kpLu', '2016-02-16 11:55:11'),
(260, 'rand_user58915', '$2y$10$07m4DYAUxOfeIRhusp1yj.0hrmWBoAot7B4UfzyRcSu07TVbBLCv2', '2016-02-16 11:55:11'),
(261, 'rand_user12501', '$2y$10$vVl7Tjtlvn8zO9SFZNPM/e54KGuO1wc4GLD4fqLJjCDPQ2C8GIClq', '2016-02-16 11:55:11'),
(262, 'rand_user4617', '$2y$10$o5MY0Bzbav.wDN2UcKlO/.QpfP.a7x482TNmFq364l5.h.ST8tUOK', '2016-02-16 11:55:11'),
(263, 'rand_user16511', '$2y$10$nQJYQgbhNGAadD8rAvzDM.g3.ckis68jQqhED733r36IsYd6BLzEq', '2016-02-16 11:55:11'),
(264, 'rand_user35500', '$2y$10$kbwNZlcQ0XeIbQ/Vg.uvSO0bgeXFURMiqFB/fh.EZ1DkXtH/Wmiby', '2016-02-16 11:55:11'),
(265, 'rand_user4025', '$2y$10$P2wcHgTNKl/ZjwQ5MGQIQufOrqBiSiQE6RAgeTcmqy9oZxtH.y2t2', '2016-02-16 11:55:11'),
(266, 'rand_user6813', '$2y$10$za6SqI4bHmyJWXCEbSdlo.Lfb3hS0xY/oGYkma74txLwY.oMsKI1u', '2016-02-16 11:55:11'),
(267, 'rand_user35547', '$2y$10$I4ghRmghDJBuOgUADbSjneTWqBssS3YFvziuCNwlGwEccnB98/oFa', '2016-02-16 11:55:11'),
(268, 'rand_user13769', '$2y$10$hO8x7UdFjbNXpHFQBil0quSsm9GqjgN1QVmEWilStF0AIRp0nVIcC', '2016-02-16 11:55:11'),
(269, 'rand_user30188', '$2y$10$hGHjnxcNwfCjuRYj0td1JOrsjtGpBgkUsGSMa1IQ/afv19gyZO1/e', '2016-02-16 11:55:11'),
(270, 'rand_user49162', '$2y$10$Mq5VoUSgglHZfaQQStwibOdn6Drnxpvg8pxQLbDdadAGWreOoFbrK', '2016-02-16 11:55:11'),
(271, 'rand_user54610', '$2y$10$cZk6n5BTjgNXbXXWGFJ.q.gB3T751/KW5V7/AWaUr82mNoPyVc3DK', '2016-02-16 11:55:11'),
(272, 'rand_user1729', '$2y$10$oEClkISuyRv5yD83kPGnYOyDye/gQw8RnrDQMFx4fDw3Yvbl47MgW', '2016-02-16 11:55:12'),
(273, 'rand_user60951', '$2y$10$flGof6PNkI70TG1T.CGEB.PB/ygUt2Rp44vB2sdINg4oD4bnaRAaS', '2016-02-16 11:55:12'),
(274, 'rand_user17430', '$2y$10$Ntskn1Ot/fVeS/Vbiyk3SOqBq6vtGUI5tEGeZ/oggR3SQY2sfvDC2', '2016-02-16 11:55:12'),
(275, 'rand_user9041', '$2y$10$Q7B/lbp8ulGVE7I8bohNaOsQzsd8faGQu.4CSFNyI.23OnVH/9/We', '2016-02-16 11:55:12'),
(276, 'rand_user28628', '$2y$10$PTc6McZAc5a0o0gHV.1cFugN.F9aGOS1Lr3IiIMtWfoSrqHbGc1fK', '2016-02-16 11:55:12'),
(277, 'rand_user52129', '$2y$10$AQUWyh2QSHybuuR0rkda1uCdTCJKPy0Zit3IvcE87giE5s3vMGQlG', '2016-02-16 11:55:12'),
(278, 'rand_user58118', '$2y$10$wiel.f68pU9Plnv/BPFbvOkyll3EuPG8ULAVvH5tTXcNrMjvCSJ.a', '2016-02-16 11:55:12'),
(279, 'rand_user14048', '$2y$10$cSVwNznFkOk9wCncBdVG.ulqdp6oRfmy7gbrgT7gKW0fedxwLg37C', '2016-02-16 11:55:12'),
(280, 'rand_user17513', '$2y$10$KermQacvW241i3/VzcTzn.X9KuumVZZGpYEuZq9/ejIhJo5Sr2vTG', '2016-02-16 11:55:12'),
(281, 'rand_user27765', '$2y$10$N7kAE5/87LPjfBTuskf4Yemej8hpyhBSQCVv.5cvXZeTheb4Ov7HO', '2016-02-16 11:55:12'),
(282, 'rand_user28567', '$2y$10$pJQuTcrznb46kAokWilsX.EDw.v2xWbpoYotWA5411pTS8PkWlzvW', '2016-02-16 11:55:12'),
(283, 'rand_user52536', '$2y$10$PSqBJoaiiRep5fXl0llrQuHMGg0tiJ6RuSBl6Xl5T3WRaM4CG.UO.', '2016-02-16 11:55:12'),
(284, 'rand_user32871', '$2y$10$QRld1X8U5Zktj4ZJGNVkgeTG6EphQwHh6k9WQPEm.A0KbhC.9vPW6', '2016-02-16 11:55:12'),
(285, 'rand_user36901', '$2y$10$5gRkULWd8VDCvaFxKbexcemOI89Ubw9uNThCS.W2Xd4tvzoyCOI7.', '2016-02-16 11:55:13'),
(286, 'rand_user58349', '$2y$10$5zccwK02.8PaEjScl014X.YsBXT90Ff8kxsOLWP5GRvA9Eo5M0mgq', '2016-02-16 11:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `users_meta`
--

CREATE TABLE `users_meta` (
  `users_metaId` int(11) NOT NULL,
  `users_metaSetting` varchar(128) NOT NULL,
  `users_metaValue` varchar(255) NOT NULL,
  `users_meta_fk_usersId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_meta`
--

INSERT INTO `users_meta` (`users_metaId`, `users_metaSetting`, `users_metaValue`, `users_meta_fk_usersId`) VALUES
(1, 'email', 'DjMadness@TotalIRC.Net', 1),
(31, 'email', 'rand_user47559@gmail.com', 32),
(32, 'email', 'rand_user57112@gmail.com', 33),
(33, 'email', 'rand_user27421@gmail.com', 34),
(34, 'email', 'rand_user38718@gmail.com', 35),
(35, 'email', 'rand_user34660@gmail.com', 36),
(36, 'email', 'rand_user53717@gmail.com', 37),
(37, 'email', 'rand_user40704@gmail.com', 38),
(38, 'email', 'rand_user12405@gmail.com', 39),
(39, 'email', 'rand_user63075@gmail.com', 40),
(40, 'email', 'rand_user7185@gmail.com', 41),
(41, 'email', 'rand_user14458@gmail.com', 42),
(42, 'email', 'rand_user60632@gmail.com', 43),
(43, 'email', 'rand_user62810@gmail.com', 44),
(44, 'email', 'rand_user46671@gmail.com', 45),
(45, 'email', 'rand_user36231@gmail.com', 46),
(46, 'email', 'rand_user36492@gmail.com', 47),
(47, 'email', 'rand_user8971@gmail.com', 48),
(48, 'email', 'rand_user32071@gmail.com', 49),
(49, 'email', 'rand_user24989@gmail.com', 50),
(50, 'email', 'rand_user54771@gmail.com', 51),
(51, 'email', 'rand_user26055@gmail.com', 52),
(52, 'email', 'rand_user39899@gmail.com', 53),
(53, 'email', 'rand_user50883@gmail.com', 54),
(54, 'email', 'rand_user42389@gmail.com', 55),
(55, 'email', 'rand_user47277@gmail.com', 56),
(56, 'email', 'rand_user35342@gmail.com', 57),
(57, 'email', 'rand_user31126@gmail.com', 58),
(58, 'email', 'rand_user65402@gmail.com', 59),
(59, 'email', 'rand_user45918@gmail.com', 60),
(60, 'email', 'rand_user9883@gmail.com', 61),
(61, 'email', 'rand_user12782@gmail.com', 62),
(62, 'email', 'rand_user22833@gmail.com', 63),
(63, 'email', 'rand_user18299@gmail.com', 64),
(64, 'email', 'rand_user26399@gmail.com', 65),
(65, 'email', 'rand_user28399@gmail.com', 66),
(66, 'email', 'rand_user51264@gmail.com', 67),
(67, 'email', 'rand_user14282@gmail.com', 68),
(68, 'email', 'rand_user8209@gmail.com', 69),
(69, 'email', 'rand_user14590@gmail.com', 70),
(70, 'email', 'rand_user34509@gmail.com', 71),
(71, 'email', 'rand_user50886@gmail.com', 72),
(72, 'email', 'rand_user26249@gmail.com', 73),
(73, 'email', 'rand_user23542@gmail.com', 74),
(74, 'email', 'rand_user20557@gmail.com', 75),
(75, 'email', 'rand_user7370@gmail.com', 76),
(76, 'email', 'rand_user1873@gmail.com', 77),
(77, 'email', 'rand_user39405@gmail.com', 78),
(78, 'email', 'rand_user5533@gmail.com', 79),
(79, 'email', 'rand_user58956@gmail.com', 80),
(80, 'email', 'rand_user38983@gmail.com', 81),
(81, 'email', 'rand_user22011@gmail.com', 82),
(82, 'email', 'rand_user35191@gmail.com', 83),
(83, 'email', 'rand_user43832@gmail.com', 84),
(84, 'email', 'rand_user41169@gmail.com', 85),
(85, 'email', 'rand_user13824@gmail.com', 86),
(86, 'email', 'rand_user1416@gmail.com', 87),
(87, 'email', 'rand_user23670@gmail.com', 88),
(88, 'email', 'rand_user22966@gmail.com', 89),
(89, 'email', 'rand_user15900@gmail.com', 90),
(90, 'email', 'rand_user18072@gmail.com', 91),
(91, 'email', 'rand_user39789@gmail.com', 92),
(92, 'email', 'rand_user34408@gmail.com', 93),
(93, 'email', 'rand_user57890@gmail.com', 94),
(94, 'email', 'rand_user32962@gmail.com', 95),
(95, 'email', 'rand_user14236@gmail.com', 96),
(96, 'email', 'rand_user58692@gmail.com', 97),
(97, 'email', 'rand_user37151@gmail.com', 98),
(98, 'email', 'rand_user19579@gmail.com', 99),
(99, 'email', 'rand_user25956@gmail.com', 100),
(100, 'email', 'rand_user47092@gmail.com', 101),
(101, 'email', 'rand_user14002@gmail.com', 102),
(102, 'email', 'rand_user60061@gmail.com', 103),
(103, 'email', 'rand_user11564@gmail.com', 104),
(104, 'email', 'rand_user58249@gmail.com', 105),
(105, 'email', 'rand_user14016@gmail.com', 106),
(106, 'email', 'rand_user24917@gmail.com', 107),
(107, 'email', 'rand_user37053@gmail.com', 108),
(108, 'email', 'rand_user10810@gmail.com', 109),
(109, 'email', 'rand_user24415@gmail.com', 110),
(110, 'email', 'rand_user61440@gmail.com', 111),
(111, 'email', 'rand_user60043@gmail.com', 112),
(112, 'email', 'rand_user64056@gmail.com', 113),
(113, 'email', 'rand_user21229@gmail.com', 114),
(114, 'email', 'rand_user23705@gmail.com', 115),
(115, 'email', 'rand_user1060@gmail.com', 116),
(116, 'email', 'rand_user22448@gmail.com', 117),
(117, 'email', 'rand_user60272@gmail.com', 118),
(118, 'email', 'rand_user38741@gmail.com', 119),
(119, 'email', 'rand_user25757@gmail.com', 120),
(120, 'email', 'rand_user23668@gmail.com', 121),
(121, 'email', 'rand_user5233@gmail.com', 122),
(122, 'email', 'rand_user14218@gmail.com', 123),
(123, 'email', 'rand_user22130@gmail.com', 124),
(124, 'email', 'rand_user53402@gmail.com', 125),
(125, 'email', 'rand_user40425@gmail.com', 126),
(126, 'email', 'rand_user20581@gmail.com', 127),
(127, 'email', 'rand_user10019@gmail.com', 128),
(128, 'email', 'rand_user23300@gmail.com', 129),
(129, 'email', 'rand_user34352@gmail.com', 130),
(130, 'email', 'rand_user7407@gmail.com', 131),
(131, 'email', 'rand_user7477@gmail.com', 132),
(132, 'email', 'rand_user51768@gmail.com', 133),
(133, 'email', 'rand_user15630@gmail.com', 134),
(134, 'email', 'rand_user1188@gmail.com', 135),
(135, 'email', 'rand_user42563@gmail.com', 136),
(136, 'email', 'rand_user62534@gmail.com', 137),
(137, 'email', 'rand_user24052@gmail.com', 138),
(138, 'email', 'rand_user30890@gmail.com', 139),
(139, 'email', 'rand_user15886@gmail.com', 140),
(140, 'email', 'rand_user45020@gmail.com', 141),
(141, 'email', 'rand_user25250@gmail.com', 142),
(142, 'email', 'rand_user9996@gmail.com', 143),
(143, 'email', 'rand_user36079@gmail.com', 144),
(144, 'email', 'rand_user25574@gmail.com', 145),
(145, 'email', 'rand_user52583@gmail.com', 146),
(146, 'email', 'rand_user2185@gmail.com', 147),
(147, 'email', 'rand_user15866@gmail.com', 148),
(148, 'email', 'rand_user45502@gmail.com', 149),
(149, 'email', 'rand_user19475@gmail.com', 150),
(150, 'email', 'rand_user50155@gmail.com', 151),
(151, 'email', 'rand_user3553@gmail.com', 152),
(152, 'email', 'rand_user45901@gmail.com', 153),
(153, 'email', 'rand_user20931@gmail.com', 154),
(154, 'email', 'rand_user60312@gmail.com', 155),
(155, 'email', 'rand_user37205@gmail.com', 156),
(156, 'email', 'rand_user22001@gmail.com', 157),
(157, 'email', 'rand_user43579@gmail.com', 158),
(158, 'email', 'rand_user37182@gmail.com', 159),
(159, 'email', 'rand_user13156@gmail.com', 160),
(160, 'email', 'rand_user18746@gmail.com', 161),
(161, 'email', 'rand_user33640@gmail.com', 162),
(162, 'email', 'rand_user45726@gmail.com', 163),
(163, 'email', 'rand_user60477@gmail.com', 164),
(164, 'email', 'rand_user2067@gmail.com', 165),
(165, 'email', 'rand_user28960@gmail.com', 166),
(166, 'email', 'rand_user65085@gmail.com', 167),
(167, 'email', 'rand_user12091@gmail.com', 168),
(168, 'email', 'rand_user31155@gmail.com', 169),
(169, 'email', 'rand_user59021@gmail.com', 170),
(170, 'email', 'rand_user28550@gmail.com', 171),
(171, 'email', 'rand_user37334@gmail.com', 172),
(172, 'email', 'rand_user43302@gmail.com', 173),
(173, 'email', 'rand_user43295@gmail.com', 174),
(174, 'email', 'rand_user17365@gmail.com', 175),
(175, 'email', 'rand_user43612@gmail.com', 176),
(176, 'email', 'rand_user5819@gmail.com', 177),
(177, 'email', 'rand_user47806@gmail.com', 178),
(178, 'email', 'rand_user50744@gmail.com', 179),
(179, 'email', 'rand_user42350@gmail.com', 180),
(180, 'email', 'rand_user8099@gmail.com', 181),
(181, 'email', 'rand_user15594@gmail.com', 182),
(182, 'email', 'rand_user29815@gmail.com', 183),
(183, 'email', 'rand_user5535@gmail.com', 184),
(184, 'email', 'rand_user65378@gmail.com', 185),
(185, 'email', 'rand_user51964@gmail.com', 186),
(186, 'email', 'rand_user64399@gmail.com', 187),
(187, 'email', 'rand_user31010@gmail.com', 188),
(188, 'email', 'rand_user59274@gmail.com', 189),
(189, 'email', 'rand_user52175@gmail.com', 190),
(190, 'email', 'rand_user35859@gmail.com', 191),
(191, 'email', 'rand_user63798@gmail.com', 192),
(192, 'email', 'rand_user45217@gmail.com', 193),
(193, 'email', 'rand_user15819@gmail.com', 194),
(194, 'email', 'rand_user1643@gmail.com', 195),
(195, 'email', 'rand_user57153@gmail.com', 196),
(196, 'email', 'rand_user41595@gmail.com', 197),
(197, 'email', 'rand_user30747@gmail.com', 198),
(198, 'email', 'rand_user32742@gmail.com', 199),
(199, 'email', 'rand_user17632@gmail.com', 200),
(200, 'email', 'rand_user54435@gmail.com', 201),
(201, 'email', 'rand_user25963@gmail.com', 202),
(202, 'email', 'rand_user40641@gmail.com', 203),
(203, 'email', 'rand_user30994@gmail.com', 204),
(204, 'email', 'rand_user42823@gmail.com', 205),
(205, 'email', 'rand_user46943@gmail.com', 206),
(206, 'email', 'rand_user20240@gmail.com', 207),
(207, 'email', 'rand_user40890@gmail.com', 208),
(208, 'email', 'rand_user54050@gmail.com', 209),
(209, 'email', 'rand_user36741@gmail.com', 210),
(210, 'email', 'rand_user20088@gmail.com', 211),
(211, 'email', 'rand_user1939@gmail.com', 212),
(212, 'email', 'rand_user37542@gmail.com', 213),
(213, 'email', 'rand_user8981@gmail.com', 214),
(214, 'email', 'rand_user4518@gmail.com', 215),
(215, 'email', 'rand_user47254@gmail.com', 216),
(216, 'email', 'rand_user24985@gmail.com', 217),
(217, 'email', 'rand_user54507@gmail.com', 218),
(218, 'email', 'rand_user32886@gmail.com', 219),
(219, 'email', 'rand_user47874@gmail.com', 220),
(220, 'email', 'rand_user54887@gmail.com', 221),
(221, 'email', 'rand_user18462@gmail.com', 222),
(222, 'email', 'rand_user2538@gmail.com', 223),
(223, 'email', 'rand_user38289@gmail.com', 224),
(224, 'email', 'rand_user4757@gmail.com', 225),
(225, 'email', 'rand_user59995@gmail.com', 226),
(226, 'email', 'rand_user37235@gmail.com', 227),
(227, 'email', 'rand_user33699@gmail.com', 228),
(228, 'email', 'rand_user19018@gmail.com', 229),
(229, 'email', 'rand_user30382@gmail.com', 230),
(230, 'email', 'rand_user45853@gmail.com', 231),
(231, 'email', 'rand_user58432@gmail.com', 232),
(232, 'email', 'rand_user58952@gmail.com', 233),
(233, 'email', 'rand_user61382@gmail.com', 234),
(234, 'email', 'rand_user57237@gmail.com', 235),
(235, 'email', 'rand_user24762@gmail.com', 236),
(236, 'email', 'rand_user47919@gmail.com', 237),
(237, 'email', 'rand_user37547@gmail.com', 238),
(238, 'email', 'rand_user53714@gmail.com', 239),
(239, 'email', 'rand_user18991@gmail.com', 240),
(240, 'email', 'rand_user55976@gmail.com', 241),
(241, 'email', 'rand_user16625@gmail.com', 242),
(242, 'email', 'rand_user55962@gmail.com', 243),
(243, 'email', 'rand_user45401@gmail.com', 244),
(244, 'email', 'rand_user31661@gmail.com', 245),
(245, 'email', 'rand_user58227@gmail.com', 246),
(246, 'email', 'rand_user34020@gmail.com', 247),
(247, 'email', 'rand_user46020@gmail.com', 248),
(248, 'email', 'rand_user31475@gmail.com', 249),
(249, 'email', 'rand_user17627@gmail.com', 250),
(250, 'email', 'rand_user4950@gmail.com', 251),
(251, 'email', 'rand_user33729@gmail.com', 252),
(252, 'email', 'rand_user62373@gmail.com', 253),
(253, 'email', 'rand_user58336@gmail.com', 254),
(254, 'email', 'rand_user21479@gmail.com', 255),
(255, 'email', 'rand_user42346@gmail.com', 256),
(256, 'email', 'rand_user28623@gmail.com', 257),
(257, 'email', 'rand_user15871@gmail.com', 258),
(258, 'email', 'rand_user19643@gmail.com', 259),
(259, 'email', 'rand_user58915@gmail.com', 260),
(260, 'email', 'rand_user12501@gmail.com', 261),
(261, 'email', 'rand_user4617@gmail.com', 262),
(262, 'email', 'rand_user16511@gmail.com', 263),
(263, 'email', 'rand_user35500@gmail.com', 264),
(264, 'email', 'rand_user4025@gmail.com', 265),
(265, 'email', 'rand_user6813@gmail.com', 266),
(266, 'email', 'rand_user35547@gmail.com', 267),
(267, 'email', 'rand_user13769@gmail.com', 268),
(268, 'email', 'rand_user30188@gmail.com', 269),
(269, 'email', 'rand_user49162@gmail.com', 270),
(270, 'email', 'rand_user54610@gmail.com', 271),
(271, 'email', 'rand_user1729@gmail.com', 272),
(272, 'email', 'rand_user60951@gmail.com', 273),
(273, 'email', 'rand_user17430@gmail.com', 274),
(274, 'email', 'rand_user9041@gmail.com', 275),
(275, 'email', 'rand_user28628@gmail.com', 276),
(276, 'email', 'rand_user52129@gmail.com', 277),
(277, 'email', 'rand_user58118@gmail.com', 278),
(278, 'email', 'rand_user14048@gmail.com', 279),
(279, 'email', 'rand_user17513@gmail.com', 280),
(280, 'email', 'rand_user27765@gmail.com', 281),
(281, 'email', 'rand_user28567@gmail.com', 282),
(282, 'email', 'rand_user52536@gmail.com', 283),
(283, 'email', 'rand_user32871@gmail.com', 284),
(284, 'email', 'rand_user36901@gmail.com', 285),
(285, 'email', 'rand_user58349@gmail.com', 286);

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

CREATE TABLE `users_profile` (
  `users_profileId` int(11) NOT NULL,
  `users_profileSetting` varchar(254) DEFAULT NULL,
  `users_profileValue` text,
  `users_profile_fk_usersId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_profile`
--

INSERT INTO `users_profile` (`users_profileId`, `users_profileSetting`, `users_profileValue`, `users_profile_fk_usersId`) VALUES
(1, 'profiletext', 'some text', 1),
(32, 'profiletext', 'some text', 32),
(33, 'profiletext', 'some text', 33),
(34, 'profiletext', 'some text', 34),
(35, 'profiletext', 'some text', 35),
(36, 'profiletext', 'some text', 36),
(37, 'profiletext', 'some text', 37),
(38, 'profiletext', 'some text', 38),
(39, 'profiletext', 'some text', 39),
(40, 'profiletext', 'some text', 40),
(41, 'profiletext', 'some text', 41),
(42, 'profiletext', 'some text', 42),
(43, 'profiletext', 'some text', 43),
(44, 'profiletext', 'some text', 44),
(45, 'profiletext', 'some text', 45),
(46, 'profiletext', 'some text', 46),
(47, 'profiletext', 'some text', 47),
(48, 'profiletext', 'some text', 48),
(49, 'profiletext', 'some text', 49),
(50, 'profiletext', 'some text', 50),
(51, 'profiletext', 'some text', 51),
(52, 'profiletext', 'some text', 52),
(53, 'profiletext', 'some text', 53),
(54, 'profiletext', 'some text', 54),
(55, 'profiletext', 'some text', 55),
(56, 'profiletext', 'some text', 56),
(57, 'profiletext', 'some text', 57),
(58, 'profiletext', 'some text', 58),
(59, 'profiletext', 'some text', 59),
(60, 'profiletext', 'some text', 60),
(61, 'profiletext', 'some text', 61),
(62, 'profiletext', 'some text', 62),
(63, 'profiletext', 'some text', 63),
(64, 'profiletext', 'some text', 64),
(65, 'profiletext', 'some text', 65),
(66, 'profiletext', 'some text', 66),
(67, 'profiletext', 'some text', 67),
(68, 'profiletext', 'some text', 68),
(69, 'profiletext', 'some text', 69),
(70, 'profiletext', 'some text', 70),
(71, 'profiletext', 'some text', 71),
(72, 'profiletext', 'some text', 72),
(73, 'profiletext', 'some text', 73),
(74, 'profiletext', 'some text', 74),
(75, 'profiletext', 'some text', 75),
(76, 'profiletext', 'some text', 76),
(77, 'profiletext', 'some text', 77),
(78, 'profiletext', 'some text', 78),
(79, 'profiletext', 'some text', 79),
(80, 'profiletext', 'some text', 80),
(81, 'profiletext', 'some text', 81),
(82, 'profiletext', 'some text', 82),
(83, 'profiletext', 'some text', 83),
(84, 'profiletext', 'some text', 84),
(85, 'profiletext', 'some text', 85),
(86, 'profiletext', 'some text', 86),
(87, 'profiletext', 'some text', 87),
(88, 'profiletext', 'some text', 88),
(89, 'profiletext', 'some text', 89),
(90, 'profiletext', 'some text', 90),
(91, 'profiletext', 'some text', 91),
(92, 'profiletext', 'some text', 92),
(93, 'profiletext', 'some text', 93),
(94, 'profiletext', 'some text', 94),
(95, 'profiletext', 'some text', 95),
(96, 'profiletext', 'some text', 96),
(97, 'profiletext', 'some text', 97),
(98, 'profiletext', 'some text', 98),
(99, 'profiletext', 'some text', 99),
(100, 'profiletext', 'some text', 100),
(101, 'profiletext', 'some text', 101),
(102, 'profiletext', 'some text', 102),
(103, 'profiletext', 'some text', 103),
(104, 'profiletext', 'some text', 104),
(105, 'profiletext', 'some text', 105),
(106, 'profiletext', 'some text', 106),
(107, 'profiletext', 'some text', 107),
(108, 'profiletext', 'some text', 108),
(109, 'profiletext', 'some text', 109),
(110, 'profiletext', 'some text', 110),
(111, 'profiletext', 'some text', 111),
(112, 'profiletext', 'some text', 112),
(113, 'profiletext', 'some text', 113),
(114, 'profiletext', 'some text', 114),
(115, 'profiletext', 'some text', 115),
(116, 'profiletext', 'some text', 116),
(117, 'profiletext', 'some text', 117),
(118, 'profiletext', 'some text', 118),
(119, 'profiletext', 'some text', 119),
(120, 'profiletext', 'some text', 120),
(121, 'profiletext', 'some text', 121),
(122, 'profiletext', 'some text', 122),
(123, 'profiletext', 'some text', 123),
(124, 'profiletext', 'some text', 124),
(125, 'profiletext', 'some text', 125),
(126, 'profiletext', 'some text', 126),
(127, 'profiletext', 'some text', 127),
(128, 'profiletext', 'some text', 128),
(129, 'profiletext', 'some text', 129),
(130, 'profiletext', 'some text', 130),
(131, 'profiletext', 'some text', 131),
(132, 'profiletext', 'some text', 132),
(133, 'profiletext', 'some text', 133),
(134, 'profiletext', 'some text', 134),
(135, 'profiletext', 'some text', 135),
(136, 'profiletext', 'some text', 136),
(137, 'profiletext', 'some text', 137),
(138, 'profiletext', 'some text', 138),
(139, 'profiletext', 'some text', 139),
(140, 'profiletext', 'some text', 140),
(141, 'profiletext', 'some text', 141),
(142, 'profiletext', 'some text', 142),
(143, 'profiletext', 'some text', 143),
(144, 'profiletext', 'some text', 144),
(145, 'profiletext', 'some text', 145),
(146, 'profiletext', 'some text', 146),
(147, 'profiletext', 'some text', 147),
(148, 'profiletext', 'some text', 148),
(149, 'profiletext', 'some text', 149),
(150, 'profiletext', 'some text', 150),
(151, 'profiletext', 'some text', 151),
(152, 'profiletext', 'some text', 152),
(153, 'profiletext', 'some text', 153),
(154, 'profiletext', 'some text', 154),
(155, 'profiletext', 'some text', 155),
(156, 'profiletext', 'some text', 156),
(157, 'profiletext', 'some text', 157),
(158, 'profiletext', 'some text', 158),
(159, 'profiletext', 'some text', 159),
(160, 'profiletext', 'some text', 160),
(161, 'profiletext', 'some text', 161),
(162, 'profiletext', 'some text', 162),
(163, 'profiletext', 'some text', 163),
(164, 'profiletext', 'some text', 164),
(165, 'profiletext', 'some text', 165),
(166, 'profiletext', 'some text', 166),
(167, 'profiletext', 'some text', 167),
(168, 'profiletext', 'some text', 168),
(169, 'profiletext', 'some text', 169),
(170, 'profiletext', 'some text', 170),
(171, 'profiletext', 'some text', 171),
(172, 'profiletext', 'some text', 172),
(173, 'profiletext', 'some text', 173),
(174, 'profiletext', 'some text', 174),
(175, 'profiletext', 'some text', 175),
(176, 'profiletext', 'some text', 176),
(177, 'profiletext', 'some text', 177),
(178, 'profiletext', 'some text', 178),
(179, 'profiletext', 'some text', 179),
(180, 'profiletext', 'some text', 180),
(181, 'profiletext', 'some text', 181),
(182, 'profiletext', 'some text', 182),
(183, 'profiletext', 'some text', 183),
(184, 'profiletext', 'some text', 184),
(185, 'profiletext', 'some text', 185),
(186, 'profiletext', 'some text', 186),
(187, 'profiletext', 'some text', 187),
(188, 'profiletext', 'some text', 188),
(189, 'profiletext', 'some text', 189),
(190, 'profiletext', 'some text', 190),
(191, 'profiletext', 'some text', 191),
(192, 'profiletext', 'some text', 192),
(193, 'profiletext', 'some text', 193),
(194, 'profiletext', 'some text', 194),
(195, 'profiletext', 'some text', 195),
(196, 'profiletext', 'some text', 196),
(197, 'profiletext', 'some text', 197),
(198, 'profiletext', 'some text', 198),
(199, 'profiletext', 'some text', 199),
(200, 'profiletext', 'some text', 200),
(201, 'profiletext', 'some text', 201),
(202, 'profiletext', 'some text', 202),
(203, 'profiletext', 'some text', 203),
(204, 'profiletext', 'some text', 204),
(205, 'profiletext', 'some text', 205),
(206, 'profiletext', 'some text', 206),
(207, 'profiletext', 'some text', 207),
(208, 'profiletext', 'some text', 208),
(209, 'profiletext', 'some text', 209),
(210, 'profiletext', 'some text', 210),
(211, 'profiletext', 'some text', 211),
(212, 'profiletext', 'some text', 212),
(213, 'profiletext', 'some text', 213),
(214, 'profiletext', 'some text', 214),
(215, 'profiletext', 'some text', 215),
(216, 'profiletext', 'some text', 216),
(217, 'profiletext', 'some text', 217),
(218, 'profiletext', 'some text', 218),
(219, 'profiletext', 'some text', 219),
(220, 'profiletext', 'some text', 220),
(221, 'profiletext', 'some text', 221),
(222, 'profiletext', 'some text', 222),
(223, 'profiletext', 'some text', 223),
(224, 'profiletext', 'some text', 224),
(225, 'profiletext', 'some text', 225),
(226, 'profiletext', 'some text', 226),
(227, 'profiletext', 'some text', 227),
(228, 'profiletext', 'some text', 228),
(229, 'profiletext', 'some text', 229),
(230, 'profiletext', 'some text', 230),
(231, 'profiletext', 'some text', 231),
(232, 'profiletext', 'some text', 232),
(233, 'profiletext', 'some text', 233),
(234, 'profiletext', 'some text', 234),
(235, 'profiletext', 'some text', 235),
(236, 'profiletext', 'some text', 236),
(237, 'profiletext', 'some text', 237),
(238, 'profiletext', 'some text', 238),
(239, 'profiletext', 'some text', 239),
(240, 'profiletext', 'some text', 240),
(241, 'profiletext', 'some text', 241),
(242, 'profiletext', 'some text', 242),
(243, 'profiletext', 'some text', 243),
(244, 'profiletext', 'some text', 244),
(245, 'profiletext', 'some text', 245),
(246, 'profiletext', 'some text', 246),
(247, 'profiletext', 'some text', 247),
(248, 'profiletext', 'some text', 248),
(249, 'profiletext', 'some text', 249),
(250, 'profiletext', 'some text', 250),
(251, 'profiletext', 'some text', 251),
(252, 'profiletext', 'some text', 252),
(253, 'profiletext', 'some text', 253),
(254, 'profiletext', 'some text', 254),
(255, 'profiletext', 'some text', 255),
(256, 'profiletext', 'some text', 256),
(257, 'profiletext', 'some text', 257),
(258, 'profiletext', 'some text', 258),
(259, 'profiletext', 'some text', 259),
(260, 'profiletext', 'some text', 260),
(261, 'profiletext', 'some text', 261),
(262, 'profiletext', 'some text', 262),
(263, 'profiletext', 'some text', 263),
(264, 'profiletext', 'some text', 264),
(265, 'profiletext', 'some text', 265),
(266, 'profiletext', 'some text', 266),
(267, 'profiletext', 'some text', 267),
(268, 'profiletext', 'some text', 268),
(269, 'profiletext', 'some text', 269),
(270, 'profiletext', 'some text', 270),
(271, 'profiletext', 'some text', 271),
(272, 'profiletext', 'some text', 272),
(273, 'profiletext', 'some text', 273),
(274, 'profiletext', 'some text', 274),
(275, 'profiletext', 'some text', 275),
(276, 'profiletext', 'some text', 276),
(277, 'profiletext', 'some text', 277),
(278, 'profiletext', 'some text', 278),
(279, 'profiletext', 'some text', 279),
(280, 'profiletext', 'some text', 280),
(281, 'profiletext', 'some text', 281),
(282, 'profiletext', 'some text', 282),
(283, 'profiletext', 'some text', 283),
(284, 'profiletext', 'some text', 284),
(285, 'profiletext', 'some text', 285),
(286, 'profiletext', 'some text', 286);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`accessId`),
  ADD KEY `access_fk_rolesId` (`access_fk_rolesId`),
  ADD KEY `access_fk_usersId` (`access_fk_usersId`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`articlesId`),
  ADD KEY `articles_fk_usersId` (`articles_fk_usersId`);

--
-- Indexes for table `articles_comments`
--
ALTER TABLE `articles_comments`
  ADD PRIMARY KEY (`articles_commentsId`),
  ADD KEY `articles_comments_fk_articlesId` (`articles_comments_fk_articlesId`,`articles_comments_fk_usersId`);

--
-- Indexes for table `articles_meta`
--
ALTER TABLE `articles_meta`
  ADD PRIMARY KEY (`articles_metaId`),
  ADD KEY `articles_meta_fk_articlesId` (`articles_meta_fk_articlesId`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permissionsId`),
  ADD KEY `permissions_fk_roleId` (`permissions_fk_roleId`);

--
-- Indexes for table `requirement`
--
ALTER TABLE `requirement`
  ADD PRIMARY KEY (`requirementId`),
  ADD KEY `requirement_fk_permissionsName` (`requirement_fk_permissionsName`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rolesId`),
  ADD UNIQUE KEY `rolesName` (`rolesName`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settingsId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usersId`),
  ADD UNIQUE KEY `usersUsername` (`usersUsername`);

--
-- Indexes for table `users_meta`
--
ALTER TABLE `users_meta`
  ADD PRIMARY KEY (`users_metaId`),
  ADD KEY `users_meta_fk_usersId` (`users_meta_fk_usersId`);

--
-- Indexes for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD PRIMARY KEY (`users_profileId`),
  ADD KEY `users_profile_fk_usersId` (`users_profile_fk_usersId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access`
--
ALTER TABLE `access`
  MODIFY `accessId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `articlesId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `articles_comments`
--
ALTER TABLE `articles_comments`
  MODIFY `articles_commentsId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `articles_meta`
--
ALTER TABLE `articles_meta`
  MODIFY `articles_metaId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permissionsId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `requirement`
--
ALTER TABLE `requirement`
  MODIFY `requirementId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `rolesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settingsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `usersId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;
--
-- AUTO_INCREMENT for table `users_meta`
--
ALTER TABLE `users_meta`
  MODIFY `users_metaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;
--
-- AUTO_INCREMENT for table `users_profile`
--
ALTER TABLE `users_profile`
  MODIFY `users_profileId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `access` (
  `accessId` int(11) NOT NULL,
  `access_fk_rolesId` int(11) NOT NULL,
  `access_fk_usersId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

CREATE TABLE `articles` (
  `articlesId` int(11) NOT NULL,
  `articles_fk_usersId` int(11) NOT NULL,
  `articlesDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `articles_fk_imageId` int(11) DEFAULT NULL,
  `articlesTitle` varchar(255) NOT NULL,
  `articlesText` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `articles_comments` (
  `articles_commentsId` int(11) NOT NULL,
  `articles_commentsDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `articles_comments_fk_articlesId` int(11) NOT NULL,
  `articles_comments_fk_usersId` int(11) NOT NULL,
  `articles_commentsText` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `articles_comments_meta` (
  `articles_comments_metaId` int(11) NOT NULL,
  `articles_comments_meta_fk_articles_commentsId` int(11) NOT NULL,
  `articles_comments_metaSetting` varchar(128) NOT NULL,
  `articles_comments_metaValue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `articles_meta` (
  `articles_metaId` int(11) NOT NULL,
  `articles_meta_fk_articlesId` int(11) NOT NULL,
  `articles_metaSetting` varchar(128) NOT NULL,
  `articles_metaValue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `image` (
  `imageId` int(11) NOT NULL,
  `imageFilename` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `imageDescription` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `imageDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

CREATE TABLE `navigation` (
  `navigationId` int(11) NOT NULL,
  `navigationName` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `navigationLink` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `navigationType` varchar(128) COLLATE utf8_danish_ci NOT NULL,
  `navigation_fk_imageId` int(11) DEFAULT NULL,
  `navigationPos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

CREATE TABLE `permissions` (
  `permissionsId` int(11) NOT NULL,
  `permissionsName` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `permissions_fk_roleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

CREATE TABLE `requirement` (
  `requirementId` int(11) NOT NULL,
  `requirementPagename` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `requirementAction` varchar(255) COLLATE utf8_danish_ci NOT NULL DEFAULT 'null',
  `requirement_fk_permissionsName` varchar(255) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

CREATE TABLE `roles` (
  `rolesId` int(11) NOT NULL,
  `rolesName` varchar(255) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

CREATE TABLE `settings` (
  `settingsId` int(11) NOT NULL,
  `settingsName` varchar(128) NOT NULL,
  `settingsValue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `usersId` int(11) NOT NULL,
  `usersUsername` varchar(64) NOT NULL,
  `usersPassword` varchar(128) NOT NULL,
  `usersDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users_meta` (
  `users_metaId` int(11) NOT NULL,
  `users_metaSetting` varchar(128) NOT NULL,
  `users_metaValue` varchar(255) NOT NULL,
  `users_meta_fk_usersId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users_profile` (
  `users_profileId` int(11) NOT NULL,
  `users_profileSetting` varchar(254) DEFAULT NULL,
  `users_profileValue` text,
  `users_profile_fk_usersId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `access`
  ADD PRIMARY KEY (`accessId`),
  ADD KEY `access_fk_rolesId` (`access_fk_rolesId`),
  ADD KEY `access_fk_usersId` (`access_fk_usersId`);

ALTER TABLE `articles`
  ADD PRIMARY KEY (`articlesId`),
  ADD KEY `articles_fk_usersId` (`articles_fk_usersId`),
  ADD KEY `articles_fk_imageId` (`articles_fk_imageId`);

ALTER TABLE `articles_comments`
  ADD PRIMARY KEY (`articles_commentsId`),
  ADD KEY `articles_comments_fk_articlesId` (`articles_comments_fk_articlesId`,`articles_comments_fk_usersId`);

ALTER TABLE `articles_comments_meta`
  ADD PRIMARY KEY (`articles_comments_metaId`),
  ADD KEY `articles_comments_meta_fk_articles_commentsId` (`articles_comments_meta_fk_articles_commentsId`);

ALTER TABLE `articles_meta`
  ADD PRIMARY KEY (`articles_metaId`),
  ADD KEY `articles_meta_fk_articlesId` (`articles_meta_fk_articlesId`);

ALTER TABLE `image`
  ADD PRIMARY KEY (`imageId`);

ALTER TABLE `navigation`
  ADD PRIMARY KEY (`navigationId`),
  ADD KEY `navigation_fk_imageId` (`navigation_fk_imageId`);

ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permissionsId`),
  ADD KEY `permissions_fk_roleId` (`permissions_fk_roleId`);

ALTER TABLE `requirement`
  ADD PRIMARY KEY (`requirementId`),
  ADD KEY `requirement_fk_permissionsName` (`requirement_fk_permissionsName`);

ALTER TABLE `roles`
  ADD PRIMARY KEY (`rolesId`),
  ADD UNIQUE KEY `rolesName` (`rolesName`);

ALTER TABLE `settings`
  ADD PRIMARY KEY (`settingsId`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`usersId`),
  ADD UNIQUE KEY `usersUsername` (`usersUsername`);

ALTER TABLE `users_meta`
  ADD PRIMARY KEY (`users_metaId`),
  ADD KEY `users_meta_fk_usersId` (`users_meta_fk_usersId`);

ALTER TABLE `users_profile`
  ADD PRIMARY KEY (`users_profileId`),
  ADD KEY `users_profile_fk_usersId` (`users_profile_fk_usersId`);


ALTER TABLE `access`
  MODIFY `accessId` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `articles`
  MODIFY `articlesId` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `articles_comments`
  MODIFY `articles_commentsId` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `articles_comments_meta`
  MODIFY `articles_comments_metaId` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `articles_meta`
  MODIFY `articles_metaId` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `image`
  MODIFY `imageId` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `navigation`
  MODIFY `navigationId` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `permissions`
  MODIFY `permissionsId` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `requirement`
  MODIFY `requirementId` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `roles`
  MODIFY `rolesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
ALTER TABLE `settings`
  MODIFY `settingsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
ALTER TABLE `users`
  MODIFY `usersId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;
ALTER TABLE `users_meta`
  MODIFY `users_metaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;
ALTER TABLE `users_profile`
  MODIFY `users_profileId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;
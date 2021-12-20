-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 20 déc. 2021 à 23:36
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sicad`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_fr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `label_fr`, `label_en`, `label_ar`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Actuality', 'Actualités', 'Actuality', 'المستجدات', 'Actuality-21fa', '2021-12-16 23:12:34', NULL),
(2, NULL, 'Reviews_press', 'Avis et Communiqués', 'Reviews and Press releases', 'إعلانات وبلاغات', 'Reviews-press-1994', '2021-12-16 23:16:21', NULL),
(3, NULL, 'Competitions', 'Concours', 'Competitions', 'مناظرات', 'Competitions-0741', '2021-12-16 23:18:53', NULL),
(23, 2, 'qsddd_e_hhjxcxcd_dfdf', 'hjhjxcxc', 'hjhj', 'hjhjh', 'qsddd-e-hhjxcxcd-dfdf-9031', '2021-12-19 23:15:20', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211125214534', '2021-12-08 00:04:02', 37),
('DoctrineMigrations\\Version20211203153119', '2021-12-08 00:04:02', 18),
('DoctrineMigrations\\Version20211204133732', '2021-12-08 00:04:02', 8),
('DoctrineMigrations\\Version20211204153615', '2021-12-08 00:04:02', 8),
('DoctrineMigrations\\Version20211205155015', '2021-12-08 00:04:02', 7),
('DoctrineMigrations\\Version20211207013550', '2021-12-08 00:04:02', 44),
('DoctrineMigrations\\Version20211216151703', '2021-12-16 16:17:40', 87);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(5, 1, 'E2MJWencsT93o8INPJzU', 'tGTZRh0l3JBN2PK03maF+ozImh0ut6uZUmYeaH5LKck=', '2021-12-15 20:57:23', '2021-12-15 21:57:23'),
(6, 1, 'Icq9plZ8Iku1No2vo2Zr', 'i7tsLv/Rmmna0clNOp6UbnL64SAsVMt/ksF4sfFadRQ=', '2021-12-15 22:54:37', '2021-12-15 23:54:37');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activate` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `grad_jobe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `function_job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`, `slug`, `address`, `tel`, `thumb`, `is_activate`, `is_deleted`, `grad_jobe`, `function_job`, `update_at`, `created_at`) VALUES
(1, 'saied.yassin@gmail.com', '[\"ROLE_USER\"]', '$2y$13$Zw59N9I/qhkUo9ybhlIBZO/CFoAZDJR4RIJw2QXr.r6wv.gBoEPSm', 'Saied', 'yassine', 'Saied-yassine-bba7', '11 rue ammar echabi omrane superieur Tunis', 58285472, 'big-pumpkin-61aff36331614207811397.jpg', 1, 0, 'administrator', 'department manager', '2021-12-16 23:28:51', '2021-11-08 16:56:52'),
(2, 'ss.yy@gmail.com', '[\"ROLE_USER\"]', '$2y$13$PMe.1r43jK29w0qRbwaI2ersLe5yg7Le578Qf.JsW2lyFVmg86dom', 'Jams', 'Dean', 'Jams-Dean-3d2e', 'st20 Ca Usa', 22147258, 'avatar.png', 1, 0, 'pricipale agent', NULL, '2021-12-08 21:26:49', '2021-11-14 16:57:11'),
(3, 'saisssed.yassin@gmail.com', '[\"ROLE_USER\"]', '$2y$13$lO7uEEf7np6zBLBe/.PVy.eJewFoHISK6FSmS70LEYpocBPdtYMgy', 'Saied', 'yassine', 'Saied-yassine-e6be', NULL, NULL, 'avatar.png', 1, 0, NULL, NULL, NULL, '2021-11-01 16:57:20'),
(4, 'lbron.jams@gmail.com', '[\"ROLE_USER\"]', '$2y$13$XmT82ZPxHjCDWZsZy/8qxu36QJF.L31kQwdW.GPyolmCaRuKM5OcS', 'lbron', 'jams', 'lbron-jams-1b48', '582th streat one cas--append LA 6625s', 55223369, NULL, 1, 0, NULL, NULL, NULL, '2021-12-06 16:57:26'),
(5, 'andre.Tarkofsky@gmail.com', '[\"ROLE_USER\"]', '$2y$13$DM5ahKDx9xpQNzPoXccFPeHhAllZd6bZ9Nn.yLw8IHnJ8TbJB5Ea2', 'andre', 'Tarkofsky', 'andre-Tarkofsky-5e42', '582th moscow 6625s', 55223369, NULL, 1, 0, NULL, NULL, NULL, '2021-12-07 16:57:33'),
(6, 'stanly.kubrick@gmail.com', '[\"ROLE_USER\"]', '$2y$13$cMlIQ1jq2fJqqyKkr1V5HuoGj5psppW0DRe8OWz2BAWlyJgDkJTOC', 'stanly', 'kubrick', 'stanly-kubrick-29ea', 'NY harlem 582th', 55223369, NULL, 1, 0, NULL, NULL, NULL, '2021-12-05 16:57:37'),
(7, 'jams.bond@gmail.com', '[\"ROLE_USER\"]', '$2y$13$s8rXoFe8e0sHg6cwlcLV4OtQldG5PE/Uce.uK4ukSSamLJ6GC7ELy', 'jams', 'bond', 'jams-bond-a7d9', 'liverpool Left-Back, LB, -, AFC Sunderland Youth', 55223369, NULL, 1, 0, NULL, NULL, NULL, '2021-12-12 16:57:41'),
(8, 'Joe.pesci@gmail.com', '[\"ROLE_USER\"]', '$2y$13$nxND8X2rotynMymmAiIi7.wMCUgCKzOaJHp1/9biufWr1kUd8FnRG', 'Joe', 'pesci', 'Joe-pesci-a044', '1946 Centre St. West Roxbury, MA', 55223369, NULL, 1, 0, NULL, NULL, NULL, '2021-12-01 16:57:44'),
(9, 'Robert.dinero@gmail.com', '[\"ROLE_USER\"]', '$2y$13$qTxQZ2xMpo1NLzL3zdmTFuMKnvhP1WdAdtSU0CBWvMtIiTqimJsV.', 'Robert', 'dinero', 'Robert-dinero-383f', 'Urban; 91 acres (36.8 ha)', 55223369, NULL, 1, 0, NULL, NULL, NULL, '2021-12-02 16:57:47');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_64C19C1727ACA70` (`parent_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

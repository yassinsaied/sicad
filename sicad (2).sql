-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 10 mars 2022 à 02:23
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
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title_fr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_fr` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_en` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_ar` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `is_valid` tinyint(1) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_news` date DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `category_id`, `title_fr`, `title_en`, `title_ar`, `content_fr`, `content_en`, `content_ar`, `created_at`, `updated_at`, `is_valid`, `is_published`, `slug`, `date_news`, `user_id`) VALUES
(50, 1, 'On sait depuis longtemps que travailler avec du texte lisible', 'There are many variations of passages of Lorem Ipsum available', 'مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل \"ألدوس بايج مايكر', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Why do we use it?</h2>\r\n\r\n<p><span style=\"color:#c0392b\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved&nbsp;</span></p>', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>\r\n\r\n<p><em>It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</em></p>\r\n\r\n<p>middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary.</p>', '<p style=\"text-align:right\">لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم امت مطبعة مجهولة بإيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قرص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>', '2022-03-10 00:05:33', NULL, 0, 0, 'On-sait-depuis-longtemps-que-travailler-avec-du-texte-lisible-0b58d', '2022-03-01', 1),
(51, 2, 'Qu\'est-ce que le Lorem Ipsum?', 'majority have suffered alteration in some form  by injected humour', 'منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ', '<p>ontrairement &agrave; une opinion r&eacute;pandue, le Lorem Ipsum n&#39;est pas simplement du texte al&eacute;atoire. Il trouve ses racines dans une oeuvre de la litt&eacute;rature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans. Un professeur du Hampden-Sydney College, en Virginie, s&#39;est int&eacute;ress&eacute; &agrave; un des mots latins les plus obscurs, consectetur, extrait d&#39;un passage du Lorem Ipsum, et en &eacute;tudiant tous les usages de ce mot dans la litt&eacute;rature classique, d&eacute;couvrit la source incontestable du Lorem Ipsum.</p>\r\n\r\n<p><u>Il provient en fait des sections 1.10.32 et 1.10.33 du &quot;De Finibus Bonorum et Malorum&quot; (Des Supr&ecirc;mes Biens et des Supr&ecirc;mes Maux) de Cic&eacute;ron. Cet ouvrage, tr&egrave;s populaire pendant la Renaissance, est un trait&eacute; sur la th&eacute;orie de l&#39;&eacute;thique. <em>Les premi&egrave;res lignes du Lorem Ipsum, &quot;Lorem ipsum dolor sit amet...&quot;, proviennent de la section 1.10.32.</em></u></p>', '<p>here are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>\r\n\r\n<p><span style=\"color:#f1c40f\"><em>It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</em></span></p>', '<p style=\"text-align:right\">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام &quot;هنا يوجد محتوى نصي، هنا يوجد محتوى نصي&quot; فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال &quot;lorem ipsum&quot; في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى .السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها</p>', '2022-03-10 00:19:01', NULL, 0, 0, 'Qu-est-ce-que-le-Lorem-Ipsum-7cb66', '2022-03-05', 1),
(52, 3, 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur', 'The standard Lorem Ipsum passage, used since the 1500s', 'ا أحد يحب الألم بذاته، يسعى ورائه أو يبتغيه، ببساطة لأنه الأل', '<p>Contrairement &agrave; une opinion r&eacute;pandue, le Lorem Ipsum n&#39;est pas simplement du texte al&eacute;atoire. Il trouve ses racines dans une oeuvre de la litt&eacute;rature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans. Un professeur du Hampden-Sydney College, en Virginie, s&#39;est int&eacute;ress&eacute; &agrave; un des mots latins les plus obscurs, consectetur, extrait d&#39;un passage du Lorem Ipsum.</p>\r\n\r\n<p>et en &eacute;tudiant tous les usages de ce mot dans la litt&eacute;rature classique, d&eacute;couvrit la source incontestable du Lorem Ipsum. Il provient en fait des sections 1.10.32 et 1.10.33 du &quot;De Finibus Bonorum et Malorum&quot; (Des Supr&ecirc;mes Biens et des Supr&ecirc;mes Maux) de Cic&eacute;ron. Cet ouvrage, tr&egrave;s populaire pendant la Renaissance, est un trait&eacute; sur la th&eacute;orie de l&#39;&eacute;thique. Les premi&egrave;res lignes du Lorem Ipsum, &quot;Lorem ipsum dolor sit amet...&quot;, proviennent de la section 1.10.32.</p>', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam.</p>\r\n\r\n<p>quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', '<p style=\"text-align:right\">هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ما شابه. وهذا ما يجعله أول مولّد نص لوريم إيبسوم حقيقي على الإنترنت.</p>', '2022-03-10 00:26:49', NULL, 0, 0, 'Neque-porro-quisquam-est-qui-dolorem-ipsum-quia-dolor-sit-amet-consectetur-b924a', '2022-03-03', 1),
(53, 36, 'On sait depuis longtemps que travailler avec du texte lisible', 'It has survived not only five centuries, but also the leap', 'إن كنت تستخدم هذا الموقع بشكل دائم وترغب في مساعدته، أرجو التبرع ولو بمبلغ', '<p>On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et emp&ecirc;che de se concentrer sur la mise en page elle-m&ecirc;me. L&#39;avantage du Lorem Ipsum sur un texte g&eacute;n&eacute;rique comme &#39;Du texte. Du texte. Du texte.</p>\r\n\r\n<p>&#39; est qu&#39;il poss&egrave;de une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du fran&ccedil;ais standard. De nombreuses suites logicielles de mise en page ou &eacute;diteurs de sites Web ont fait du Lorem Ipsum leur faux texte par d&eacute;faut, et une recherche pour &#39;Lorem Ipsum&#39; vous conduira vers de nombreux sites qui n&#39;en sont encore qu&#39;&agrave; leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d&#39;y rajouter de petits clins d&#39;oeil, voire des phrases embarassantes).</p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p style=\"text-align:right\">هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ما شابه. وهذا ما يجعله أول مولّد نص لوريم إيبسوم حقيقي على الإنترنت.</p>', '2022-03-10 00:48:02', NULL, 0, 0, 'On-sait-depuis-longtemps-que-travailler-avec-du-texte-lisible-c8696', '2022-03-12', 12);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `label_fr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `is_activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `label_fr`, `label_en`, `label_ar`, `slug`, `created_at`, `updated_at`, `is_activate`) VALUES
(1, NULL, 'Actualités', 'Actuality', 'المستجدات', 'Actuality-21fa', '2021-12-16 23:12:34', NULL, 1),
(2, NULL, 'Avis et Communiqués', 'Reviews and Press releases', 'إعلانات وبلاغات', 'Reviews-press-1994', '2021-12-16 23:16:21', NULL, 1),
(3, NULL, 'Concours', 'Competitions', 'مناظرات', 'Competitions-0741', '2021-12-16 23:18:53', NULL, 1),
(30, 2, 'L\'activité du Premier ministre', 'Activities of the Head of Government', 'Activités du Chef du Gouvernement', 'cxcxdddd-3160', '2022-01-02 17:38:45', '2022-03-10 00:36:57', 1),
(31, 1, 'institutions publiques', 'public institutions', 'المؤسسات العمومية', 'szazedsdsdddd-9753', '2022-01-02 17:38:57', '2022-03-10 00:32:56', 1),
(36, NULL, 'cahier des charges', 'Specifications', 'كراسات الشروط', 'cahier-des-charges-ea2b', '2022-03-10 00:40:24', NULL, 1);

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
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `article_id`, `name`) VALUES
(87, 50, '2e1abb901094ed27ee2c9045d7f87256.jpg'),
(88, 50, '2723d27303afb2fb41fc53ee9d02d752.jpg'),
(89, 51, '9a94e5fe121752d6bb930ef38d349e25.jpg'),
(90, 51, '51233061e5ec72f4883c4fd125116bca.jpg'),
(91, 51, 'a54a5e9516af517860a0c30f0d8b3b3e.jpg'),
(92, 52, '1942a853dbd6abf80666f426ff506815.png'),
(93, 52, 'c50ed977392971d6d31521f72f003d49.png'),
(94, 52, '92617afa391286629f97c03de18e6b96.jpg'),
(95, 53, '6b814ec02e9df0d5a0e46f44edae8ba5.png'),
(96, 53, '31bafc5e113f63c59a7a27a926b633dc.jpg'),
(97, 53, 'f1a8075ed4761591bf1bd57e3d790c4a.jpg');

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
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`, `slug`, `address`, `tel`, `thumb`, `is_activate`, `is_deleted`, `grad_jobe`, `function_job`, `update_at`, `created_at`) VALUES
(1, 'saied.yassin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$Zw59N9I/qhkUo9ybhlIBZO/CFoAZDJR4RIJw2QXr.r6wv.gBoEPSm', 'Saied', 'yassine', 'Saied-yassine-bba7', '11 rue ammar echabi omrane superieur Tunis', 58285472, 'big-pumpkin-61aff36331614207811397.jpg', 1, 0, 'administrator', 'department manager', '2021-12-16 23:28:51', '2021-11-08 16:56:52'),
(2, 'ss.yy@gmail.com', '[\"ROLE_AUTHEUR\"]', '$2y$13$PMe.1r43jK29w0qRbwaI2ersLe5yg7Le578Qf.JsW2lyFVmg86dom', 'Jams', 'Dean', 'Jams-Dean-3d2e', 'st20 Ca Usa', 22147258, 'avatar.png', 1, 0, 'pricipale agent', NULL, '2021-12-08 21:26:49', '2021-11-14 16:57:11'),
(3, 'saisssed.yassin@gmail.com', '[\"ROLE_AUTHEUR\"]', '$2y$13$lO7uEEf7np6zBLBe/.PVy.eJewFoHISK6FSmS70LEYpocBPdtYMgy', 'Saied', 'yassine', 'Saied-yassine-e6be', NULL, NULL, 'avatar.png', 1, 0, NULL, NULL, NULL, '2021-11-01 16:57:20'),
(4, 'lbron.jams@gmail.com', '[\"ROLE_AUTHEUR\"]', '$2y$13$XmT82ZPxHjCDWZsZy/8qxu36QJF.L31kQwdW.GPyolmCaRuKM5OcS', 'lbron', 'jams', 'lbron-jams-1b48', '582th streat one cas--append LA 6625s', 55223369, NULL, 0, 0, NULL, NULL, NULL, '2021-12-06 16:57:26'),
(5, 'andre.Tarkofsky@gmail.com', '[\"ROLE_VALIDATOR\"]', '$2y$13$DM5ahKDx9xpQNzPoXccFPeHhAllZd6bZ9Nn.yLw8IHnJ8TbJB5Ea2', 'andre', 'Tarkofsky', 'andre-Tarkofsky-5e42', '582th moscow 6625s', 55223369, NULL, 1, 0, NULL, NULL, NULL, '2021-12-07 16:57:33'),
(6, 'stanly.kubrick@gmail.com', '[\"ROLE_AUTHEUR\"]', '$2y$13$cMlIQ1jq2fJqqyKkr1V5HuoGj5psppW0DRe8OWz2BAWlyJgDkJTOC', 'stanly', 'kubrick', 'stanly-kubrick-29ea', 'NY harlem 582th', 55223369, NULL, 1, 0, NULL, NULL, NULL, '2021-12-05 16:57:37'),
(7, 'jams.bond@gmail.com', '[\"ROLE_AUTHEUR\"]', '$2y$13$s8rXoFe8e0sHg6cwlcLV4OtQldG5PE/Uce.uK4ukSSamLJ6GC7ELy', 'jams', 'bond', 'jams-bond-a7d9', 'liverpool Left-Back, LB, -, AFC Sunderland Youth', 55223369, NULL, 1, 0, NULL, NULL, NULL, '2021-12-12 16:57:41'),
(8, 'Joe.pesci@gmail.com', '[\"ROLE_AUTHEUR\"]', '$2y$13$nxND8X2rotynMymmAiIi7.wMCUgCKzOaJHp1/9biufWr1kUd8FnRG', 'Joe', 'pesci', 'Joe-pesci-a044', '1946 Centre St. West Roxbury, MA', 55223369, NULL, 0, 0, NULL, NULL, NULL, '2021-12-01 16:57:44'),
(9, 'Robert.dinero@gmail.com', '[\"ROLE_AUTHEUR\"]', '$2y$13$qTxQZ2xMpo1NLzL3zdmTFuMKnvhP1WdAdtSU0CBWvMtIiTqimJsV.', 'Robert', 'dinero', 'Robert-dinero-383f', 'Urban; 91 acres (36.8 ha)', 55223369, NULL, 1, 0, NULL, NULL, NULL, '2021-12-02 16:57:47'),
(12, 'yassin.yassin@gmail.com', '[\"ROLE_VALIDATOR\"]', '$2y$13$wJnNQ0p.6cRg8D1zljyUAekFfUoWy1gyUKQFSJhMw6TCD6M.khmNW', 'Yassine', 'Saied', 'Yassine-Saied-0c1c', 'MA - Massachusetts 02108 The city of BOSTON belongs to the Multi-counties.', 55123786, '242853338-408528584170199-2030622790430722273-n-62293b6105f34948667173.jpg', 1, 0, 'pricipale administrator', 'department manager', '2022-03-10 00:42:24', '2022-02-02 22:25:47'),
(13, 'zargaman@gmail.com', '[\"ROLE_AUTHEUR\"]', '$2y$13$J9begH2S83SWx.mIaUou9OG2d3ME0ceY9EvRl.UWW17r74j8GxLJy', 'zarga', 'man', 'zarga-man-1865', NULL, NULL, 'avatar.png', 0, 0, NULL, NULL, NULL, '2022-02-24 01:17:00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_23A0E6612469DE2` (`category_id`),
  ADD KEY `IDX_23A0E66A76ED395` (`user_id`);

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
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C53D045F7294869C` (`article_id`);

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
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E6612469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_23A0E66A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_C53D045F7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

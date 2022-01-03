-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 03 jan. 2022 à 01:46
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
  `date_news` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `category_id`, `title_fr`, `title_en`, `title_ar`, `content_fr`, `content_en`, `content_ar`, `created_at`, `updated_at`, `is_valid`, `is_published`, `slug`, `date_news`) VALUES
(29, 1, 'article test fr', 'article tes EN', 'لوريم ايبسوم دولار سيت أميت', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum :&nbsp;</p>\r\n\r\n<ul>\r\n	<li>It was popularised in the 1960s with the release of Letraset sheets containing</li>\r\n	<li>It was popularised in the 1960s with the release of Letraset sheets containing</li>\r\n	<li>It was popularised in the 1960s with the release of Letraset sheets containing</li>\r\n</ul>\r\n\r\n<p>standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,</p>', '<h2>Where can I get some?</h2>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '<p style=\"text-align:right\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد أكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواس أيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت نيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولبا كيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.&quot; &quot;سيت يتبيرسبايكياتيس يوندي أومنيس أستي ناتيس أيررور سيت فوليبتاتيم أكيسأنتييوم دولاريمكيو لايودانتيوم,توتام ريم أبيرأم,أيكيو أبسا كيواي أب أللو أنفينتوري فيرأتاتيس ايت كياسي أرشيتيكتو بيتاي فيتاي ديكاتا سيونت أكسبليكابو. نيمو أنيم أبسام فوليوباتاتيم كيواي فوليوبتاس سايت أسبيرناتشر أيوت أودايت أيوت فيوجايت, سيد كيواي كونسيكيونتشر ماجناي دولارس أيوس كيواي راتاشن فوليوبتاتيم سيكيواي نيسكايونت. نيكيو بوررو كيوايسكيوم ايست,كيواي دولوريم ايبسيوم كيوا دولار سايت أميت, كونسيكتيتيور,أديبايسكاي فيلايت, سيد كيواي نون نيومكيوام ايايوس موداي تيمبورا انكايديونت يوت لابوري أيت دولار ماجنام ألايكيوام كيوايرات فوليوبتاتيم. يوت اينايم أد مينيما فينيام, كيواس نوستريوم أكسيركايتاشيم يلامكوربوريس سيوسكايبيت لابورايوسام, نايساي يوت ألايكيوايد أكس أيا كوموداي كونسيكيواتشر؟ كيوايس أيوتيم فيل أيوم أيوري ريبريهينديرايت كيواي ان إيا فوليوبتاتي</span></p>', '2021-12-29 16:55:58', NULL, 1, 1, 'article-test-fr-cd29e', NULL),
(30, 1, 'loerm fr', 'loerm en', 'اربك تكست هو اول موقع يسمح لزواره', '<p>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, <span style=\"color:#e74c3c\">remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p style=\"margin-left:40px; text-align:right\">هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب&nbsp;<a href=\"http://www.lawwen.com/\" title=\"فوتوشوب\">فوتوشوب</a>&nbsp;وغيرها. مثال عندما تكتب ببرنامج التصميم&nbsp;<a href=\"http://www.lawwen.com/\" title=\"فوتوشوب\">فوتوشوب</a>&nbsp;في النسخ الغير معربة تلاحظ أن الحروف تكتب مقلوبة. هذا البرنامج&nbsp; &nbsp; يحل هذه المشكلة</p>\r\n\r\n<p style=\"text-align:right\">هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب&nbsp;<a href=\"http://www.lawwen.com/\" title=\"فوتوشوب\">فوتوشوب</a>&nbsp;وغيرها. مثال عندما تكتب ببرنامج التصميم&nbsp;<a href=\"http://www.lawwen.com/\" title=\"فوتوشوب\">فوتوشوب</a>&nbsp;في النسخ الغير معربة تلاحظ أن الحروف تكتب مقلوبة. هذا البرنامج يحل هذه المشكلة</p>', '2021-12-30 16:34:46', NULL, 0, 0, 'loerm-fr-9fe1c', NULL),
(31, 1, 'loerm fr', 'loerm en', 'اربك تكست هو اول موقع يسمح لزواره', '<p>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, <span style=\"color:#e74c3c\">remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p style=\"margin-left:40px; text-align:right\">هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب&nbsp;<a href=\"http://www.lawwen.com/\" title=\"فوتوشوب\">فوتوشوب</a>&nbsp;وغيرها. مثال عندما تكتب ببرنامج التصميم&nbsp;<a href=\"http://www.lawwen.com/\" title=\"فوتوشوب\">فوتوشوب</a>&nbsp;في النسخ الغير معربة تلاحظ أن الحروف تكتب مقلوبة. هذا البرنامج&nbsp; &nbsp; يحل هذه المشكلة</p>\r\n\r\n<p style=\"text-align:right\">هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب&nbsp;<a href=\"http://www.lawwen.com/\" title=\"فوتوشوب\">فوتوشوب</a>&nbsp;وغيرها. مثال عندما تكتب ببرنامج التصميم&nbsp;<a href=\"http://www.lawwen.com/\" title=\"فوتوشوب\">فوتوشوب</a>&nbsp;في النسخ الغير معربة تلاحظ أن الحروف تكتب مقلوبة. هذا البرنامج يحل هذه المشكلة</p>', '2021-12-30 16:37:06', NULL, 0, 0, 'loerm-fr-aa0bd', NULL),
(32, 1, 'loerm fr', 'loerm en', 'ما هو دور هذا البرنامج', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p style=\"text-align:right\">هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب فوتوشوب وغيرها. مثال عندما تكتب ببرنامج التصميم فوتوشوب في النسخ الغير معربة تلاحظ أن الحروف تكتب مقلوبة. هذا البرنامج يحل هذه المشكلة.</p>\r\n\r\n<p style=\"text-align:right\">هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب فوتوشوب وغيرها. مثال عندما تكتب ببرنامج التصميم فوتوشوب في النسخ الغير معربة تلاحظ أن الحروف تكتب مقلوبة. هذا البرنامج يحل هذه المشكلة.</p>\r\n\r\n<p style=\"text-align:right\">هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب فوتوشوب وغيرها. مثال عندما تكتب ببرنامج التصميم فوتوشوب في النسخ الغير معربة تلاحظ أن الحروف تكتب مقلوبة. هذا البرنامج يحل هذه المشكلة.</p>', '2021-12-30 16:39:57', NULL, 0, 0, 'loerm-fr-065db', NULL),
(33, 1, 'loerm fr', 'loerm en', 'ما هو دور هذا البرنامج', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p style=\"text-align:right\">هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب فوتوشوب وغيرها. مثال عندما تكتب ببرنامج التصميم فوتوشوب في النسخ الغير معربة تلاحظ أن الحروف تكتب مقلوبة. هذا البرنامج يحل هذه المشكلة.</p>\r\n\r\n<p style=\"text-align:right\">هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب فوتوشوب وغيرها. مثال عندما تكتب ببرنامج التصميم فوتوشوب في النسخ الغير معربة تلاحظ أن الحروف تكتب مقلوبة. هذا البرنامج يحل هذه المشكلة.</p>\r\n\r\n<p style=\"text-align:right\">هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب فوتوشوب وغيرها. مثال عندما تكتب ببرنامج التصميم فوتوشوب في النسخ الغير معربة تلاحظ أن الحروف تكتب مقلوبة. هذا البرنامج يحل هذه المشكلة.</p>', '2021-12-30 16:42:23', NULL, 0, 0, 'loerm-fr-ee3c0', NULL),
(41, 3, 'loerm fr', 'loerm en', 'الحريات الواردة في هذا الإعلان', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p style=\"text-align:right\">المادة 2 لكل إنسان حق التمتع بكافة الحقوق والحريات الواردة في هذا الإعلان، دون أي تمييز، كالتمييز بسبب العنصر أو اللون أو الجنس أو اللغة أو الدين أو الرأي السياسي أو أي رأي آخر، أو الأصل الوطني أو الإجتماعي أو الثروة أو الميلاد أو أي وضع آخر، دون أية تفرقة بين الرجال والنساء. وفضلاً عما تقدم فلن يكون هناك أي تمييز أساسه الوضع السياسي أو القانوني أو الدولي لبلد أو البقعة التي ينتمي إليها الفرد سواء كان هذا البلد أو تلك البقعة مستقلاً أو تحت الوصاية أو غير متمتع بالحكم الذاتي أو كانت سيادته خاضعة لأي قيد من القيود.</p>', '2021-12-31 00:06:44', NULL, 0, 0, 'loerm-fr-6ab81', '2021-12-24'),
(43, 2, 'loerm fr', 'loerm en', 'ةلب التوجه الحكومي لإرساء الإدارة الرقمية', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing <u>Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</u></p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to <em>make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</em></p>', '<p style=\"text-align:right\">وزير أملاك الدولة والشؤون العقارية يفتتح يوما دراسيا حول التبادل البيني للمعلومات ويؤكد على أهمية التحول الرقمي للدّيوان الوطني للملكية العقارية. شدّد وزير أملاك الدولة والشؤون العقارية السيد محمد الرّقيق، على أهمية تحقيق التحول الرقمي في الخدمات المسداة من قبل الدّيوان الوطني للملكية العقارية.&nbsp;</p>\r\n\r\n<p style=\"text-align:right\">جاء ذلك لدى افتتاحه اليوم الجمعة 19نوفمبر 2021، فعاليات اليوم الدراسي حول التبادل البيني للمعطيات والمعلومات الذي ينظمه الديوان الوطني للملكية العقارية بالاشتراك مع السجل الوطني للمؤسسات.&nbsp;</p>\r\n\r\n<p style=\"text-align:right\">وأوضح الوزير أن هذه المسألة تتنزل صلب التوجه الحكومي لإرساء الإدارة الرقمية وتحسين جودة الخدمات الادارية، مضيفاأن ذلك سيكون كفيلا بإحداث نقلة نوعية في الخدمات التي يسديها الديوان الوطني للملكية العقارية على مستوى السجل العقاري.&nbsp;</p>\r\n\r\n<p style=\"text-align:right\">كما أكد الوزير على أهمية ربط الصلة بين مؤسستي الديوان الوطني للملكية العقارية والسجل الوطني للمؤسسات بما يحقق الترابط البيني للمعلومات و البيانات بينهما، موضحا ان&nbsp; الترابط البيني للبيانات بات يشكل الشريان الحيوي لدعم الاقتصاد الوطني و تشجيع المشاريع التنموية في جميع المجالات و خاصة على مستوى الاستثمار العقاري و تحسين مناخ الأعمال، عبر تفعيل جملة من الاصلاحات الهيكلية في المعاملات الاقتصادية بما في ذلك الحط من الآجال و التقليص من الوثائق المطلوبة لتكوين المؤسسات كمؤشر يعتمده البنك العالمي في التصنيف الدولي الخاص بتحسين مناخ الاستثمار في الدول.&nbsp;</p>', '2021-12-31 19:50:34', NULL, 0, 0, 'loerm-fr-2f7b7', '2021-12-24'),
(44, 1, 'loerm fr', 'loerm en', 'الخدمات الادارية، مضيفاأن ذل', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into <span style=\"color:#27ae60\">electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. <span style=\"color:#c0392b\">It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>', '<p style=\"text-align:right\"><em>وزير أملاك الدولة والشؤون العقارية يفتتح يوما دراسيا حول التبادل البيني للمعلومات ويؤكد على أهمية التحول الرقمي للدّيوان الوطني للملكية العقارية. شدّد وزير أملاك الدولة والشؤون العقارية السيد محمد الرّقيق، على أهمية تحقيق التحول الرقمي في الخدمات المسداة من قبل الدّيوان الوطني للملكية العقارية.&nbsp;</em></p>\r\n\r\n<p style=\"text-align:right\">جاء ذلك لدى افتتاحه اليوم الجمعة 19نوفمبر 2021، فعاليات اليوم الدراسي حول التبادل البيني للمعطيات والمعلومات الذي ينظمه الديوان الوطني للملكية العقارية بالاشتراك مع السجل الوطني للمؤسسات.&nbsp;</p>\r\n\r\n<p style=\"text-align:right\">وأوضح الوزير أن هذه المسألة تتنزل صلب التوجه الحكومي لإرساء الإدارة الرقمية وتحسين جودة الخدمات الادارية، مضيفاأن ذلك سيكون كفيلا بإحداث نقلة نوعية في الخدمات التي يسديها الديوان الوطني للملكية العقارية على مستوى السجل العقاري.&nbsp;</p>\r\n\r\n<p style=\"text-align:right\">كما أكد الوزير على أهمية ربط الصلة بين مؤسستي الديوان الوطني للملكية العقارية والسجل الوطني للمؤسسات بما يحقق الترابط البيني للمعلومات و البيانات بينهما، موضحا ان&nbsp; الترابط البيني للبيانات بات يشكل الشريان الحيوي لدعم الاقتصاد الوطني و تشجيع المشاريع التنموية في جميع المجالات و خاصة على مستوى الاستثمار العقاري و تحسين مناخ الأعمال، عبر تفعيل جملة من الاصلاحات الهيكلية في المعاملات الاقتصادية بما في ذلك الحط من الآجال و التقليص من الوثائق المطلوبة لتكوين المؤسسات كمؤشر يعتمده البنك العالمي في التصنيف الدولي الخاص بتحسين مناخ الاستثمار في الدول.&nbsp;</p>', '2021-12-31 19:54:03', NULL, 0, 0, 'loerm-fr-66ee2', '2021-12-24'),
(45, 1, 'La commande ORDER BY permet de trier les lignes dans un résultat d’une requête SQL', 'is simply dummy text of the printing and typesetting industry.', 'تثمن الوزارتين العمل المشترك لمصالحهما التقنية و الفنية و القانونية من أجل إنجاز خدمة جواز التلقيح', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p style=\"text-align:right\">عملا بالمرسوم الرئاسي عدد 1 لسنة 2021 المؤرخ في 22 أكتوبر 2021 المتعلق بجواز التلقيح الخاص بفيروس كوفيد 19 و انطلاقا من توصيات اللجنة العلمية لمجابهة فيروس كورونا، يهمّ وزارتي الصحة و تكنولوجيات الاتصال أن تعلنا للرأي العام إطلاق خدمة جواز التلقيح عبر المنظومة الوطنية للتسجيل ايفاكس &quot;فضاء المواطن&quot; على أن يصبح الاستظهار به وجوبا في التاريخ و الفضاءات التي حددها المرسوم الرئاسي.</p>\r\n\r\n<p style=\"text-align:right\">وإذ تثمن الوزارتين العمل المشترك لمصالحهما التقنية و الفنية و القانونية من أجل إنجاز خدمة جواز التلقيح في ظرف قياسي حتمه الوضع الوبائي ، وتعزيزا لجهود الدولة في تدعيم الحملة الوطنية للتلقيح وتحقيق المناعة الجماعية في أسرع وقت ممكن حفاظا لأرواح التونسيين والتونسييات، فإنه من المهم التأكيد على أنه:</p>', '2022-01-01 01:20:13', NULL, 1, 1, 'La-commande-ORDER-BY-permet-de-trier-les-lignes-dans-un-resultat-d-une-requete-SQL-0884d', '2022-01-01'),
(46, 1, 'Le ministre des domaines de l’Etat insiste sur l’interconnexion des données et l’obligation de la di', 'is simply dummy text of the printing and typesetting industry.', 'تثمن الوزارتين العمل المشترك لمصالحهما التقنية و الفنية و القانونية من أجل إنجاز خدمة جواز التلقيح', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p style=\"text-align:right\">عملا بالمرسوم الرئاسي عدد 1 لسنة 2021 المؤرخ في 22 أكتوبر 2021 المتعلق بجواز التلقيح الخاص بفيروس كوفيد 19 و انطلاقا من توصيات اللجنة العلمية لمجابهة فيروس كورونا، يهمّ وزارتي الصحة و تكنولوجيات الاتصال أن تعلنا للرأي العام إطلاق خدمة جواز التلقيح عبر المنظومة الوطنية للتسجيل ايفاكس &quot;فضاء المواطن&quot; على أن يصبح الاستظهار به وجوبا في التاريخ و الفضاءات التي حددها المرسوم الرئاسي.</p>\r\n\r\n<p style=\"text-align:right\">وإذ تثمن الوزارتين العمل المشترك لمصالحهما التقنية و الفنية و القانونية من أجل إنجاز خدمة جواز التلقيح في ظرف قياسي حتمه الوضع الوبائي ، وتعزيزا لجهود الدولة في تدعيم الحملة الوطنية للتلقيح وتحقيق المناعة الجماعية في أسرع وقت ممكن حفاظا لأرواح التونسيين والتونسييات، فإنه من المهم التأكيد على أنه:</p>', '2022-01-01 03:06:13', NULL, 0, 0, 'Le-ministre-des-domaines-de-l-Etat-insiste-sur-l-interconnexion-des-donnees-et-l-obligation-de-la-di-b7898', '2022-01-01'),
(47, 2, 'Vous pouvez également personnaliser la marge avec des utilitaires d\'espacement pour la marge supérieure, pour la marge inférieure et my pour la marge supérieure et inférieure', 'ou can also customize margin with spacing utilities  for margin top,  for margin bottom and my for margin top and bottom', 'بالنسبة لمركبات الكربون الكلورية فلورية ومركبات الكربون الهيدروكلورية فلورية والهالونات: أرغون بلازما آرك؛', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', '<p style=\"text-align:right\">وجميع مصابيح النيون الأخرى تستخدم الزئبق مع غازات خاملة من بينها الكريبتون&nbsp;<a href=\"https://context.reverso.net/translation/arabic-english/%D9%88%D8%A7%D9%84%D8%A2%D8%B1%D8%BA%D9%88%D9%86\" rel=\"nofollow\"><em>والآرغون</em></a>&nbsp;والهليوموجميع مصابيح النيون الأخرى تستخدم الزئبق مع غازات خاملة من بينها الكريبتون&nbsp;<a href=\"https://context.reverso.net/translation/arabic-english/%D9%88%D8%A7%D9%84%D8%A2%D8%B1%D8%BA%D9%88%D9%86\" rel=\"nofollow\"><em>والآرغون</em></a>&nbsp;والهليوموجميع مصابيح النيون الأخرى تستخدم الزئبق مع غازات خاملة من بينها الكريبتون&nbsp;<a href=\"https://context.reverso.net/translation/arabic-english/%D9%88%D8%A7%D9%84%D8%A2%D8%B1%D8%BA%D9%88%D9%86\" rel=\"nofollow\"><em>والآرغون</em></a>&nbsp;والهليوموجميع مصابيح النيون الأخرى تستخدم الزئبق مع غازات خاملة من بينها الكريبتون&nbsp;<a href=\"https://context.reverso.net/translation/arabic-english/%D9%88%D8%A7%D9%84%D8%A2%D8%B1%D8%BA%D9%88%D9%86\" rel=\"nofollow\"><em>والآرغون</em></a>&nbsp;والهليوموجميع مصابيح النيون الأخرى تستخدم الزئبق مع غازات خاملة من بينها الكريبتون&nbsp;<a href=\"https://context.reverso.net/translation/arabic-english/%D9%88%D8%A7%D9%84%D8%A2%D8%B1%D8%BA%D9%88%D9%86\" rel=\"nofollow\"><em>والآرغون</em></a>&nbsp;والهليوموجميع مصابيح النيون الأخرى تستخدم الزئبق مع غازات خاملة من بينها الكريبتون&nbsp;<a href=\"https://context.reverso.net/translation/arabic-english/%D9%88%D8%A7%D9%84%D8%A2%D8%B1%D8%BA%D9%88%D9%86\" rel=\"nofollow\"><em>والآرغون</em></a>&nbsp;والهليوموجميع مصابيح النيون الأخرى تستخدم الزئبق مع غازات خاملة من بينها الكريبتون&nbsp;<a href=\"https://context.reverso.net/translation/arabic-english/%D9%88%D8%A7%D9%84%D8%A2%D8%B1%D8%BA%D9%88%D9%86\" rel=\"nofollow\"><em>والآرغون</em></a>&nbsp;والهليوموجميع مصابيح النيون .الأخرى تستخدم الزئبق مع غازات خاملة من بينها الكريبتون&nbsp;<a href=\"https://context.reverso.net/translation/arabic-english/%D9%88%D8%A7%D9%84%D8%A2%D8%B1%D8%BA%D9%88%D9%86\" rel=\"nofollow\"><em>والآرغون</em></a>&nbsp;والهليوم</p>', '2022-01-03 01:32:04', NULL, 0, 0, 'Vous-pouvez-egalement-personnaliser-la-marge-avec-des-utilitaires-d-espacement-pour-la-marge-superieure-pour-la-marge-inferieure-et-my-pour-la-marge-superieure-et-inferieure-40452', '2021-12-30');

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
(23, 2, 'qsddd_e_hhjxcxcd_dfdf', 'hjhjxcxc', 'hjhj', 'hjhjh', 'qsddd-e-hhjxcxcd-dfdf-9031', '2021-12-19 23:15:20', NULL),
(24, 2, 'sssssssssszezegthy', 'sdsd', 'sdsd', 'sdsd', 'sssssssssszezegthy-b28b', '2021-12-22 22:00:46', NULL),
(25, 2, 'cvcvc', 'cvcv', 'cvcv', 'cvcvcv', 'cvcvc-7c82', '2021-12-28 01:37:32', NULL),
(26, 1, 'sdsdsdsdzzzzz', 'sdsdsdsd', 'sdsdsd', 'sdsdzzzz', 'sdsdsdsdzzzzz-2462', '2022-01-02 17:37:26', NULL),
(29, 3, 'qsddd_e_deeeeeeee', 'ee', 'eee', 'eee', 'qsddd-e-deeeeeeee-809b', '2022-01-02 17:38:17', NULL),
(30, 2, 'cxcxdddd', 'dddd', 'dddd', 'dddd', 'cxcxdddd-3160', '2022-01-02 17:38:45', NULL),
(31, 1, 'szazedsdsdddd', 'ddd', 'dddd', 'dddd', 'szazedsdsdddd-9753', '2022-01-02 17:38:57', NULL);

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
(43, 29, 'f127b7923fc990a13792e5f382a36cd5.jpg'),
(44, 29, 'e13c3ee244c1c49dc68a5604db11d4cf.jpg'),
(45, 29, '4e991b1a7cda0a74e052f56820c2869d.jpg'),
(46, 30, '485f70baaed016a5d81d3f6946710db2.jpg'),
(47, 30, 'dbe3c0b9b826321733be95e5f5fd55c0.png'),
(48, 31, 'bd096ba98bab8d99901f92a0a227a91d.jpg'),
(49, 31, '04bcd5f2ffc292e9d72f53fb0423a0d6.jpg'),
(50, 32, 'ccdf85d2344094c0aacd5a1c44d2d318.jpg'),
(51, 32, '4de0c846ed82bfaf7b94524de356e75b.jpg'),
(52, 32, '279570461f1c7f07c3ea3e50e086fd09.jpg'),
(53, 33, '7950f7ee2ca443056f2a8f17ae9aefe6.png'),
(54, 33, 'f6db963e174100c0fcbf73835d7ab481.png'),
(59, 41, '77eaae5010251d9b726db4f003802a13.jpg'),
(60, 41, 'f851e46d029e7ddb3cc50fac7a308264.jpg'),
(61, 41, '33d69eb62f0b1affaf2721d935a7d16f.jpg'),
(62, 41, 'bf99e3e1bf0348681fa91a8c20ce87ed.png'),
(63, 41, 'aa2177887e96569959cca58ee84d5f87.jpg'),
(64, 44, 'b768c0bf253f1c847692b4a9e4b63b3c.jpg'),
(65, 44, '8dd22d9286bdbfcd22b018c16b6b503f.jpg'),
(66, 44, '41b35923f9917545f1c800277342a39b.jpg'),
(67, 44, 'e622456552815aa5e3f36b7e0daf723e.jpg'),
(68, 44, '7512ebb1bd7ff7995cabaffa544377b4.jpg'),
(69, 44, '6b37d08ba7d61090dba773bef6e42b65.jpg'),
(70, 45, '14a00eef60a8367cf8c06d9236a5471d.jpg'),
(71, 45, '50639611e7e64b42af7b7c72419302c6.jpg'),
(72, 45, '92a367c8fc5091eebefcf4fa95009fa6.jpg'),
(73, 47, '54943809faa88487451ae7e728462525.jpg'),
(74, 47, 'ea1ad6b575020bce93f5926d92204e8a.jpg'),
(75, 47, '9bbe31362058867cb2be95858381181d.jpg');

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
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_23A0E6612469DE2` (`category_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

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
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E6612469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

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

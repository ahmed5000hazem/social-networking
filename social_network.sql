-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2021 at 07:44 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_network`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `postId` bigint(20) UNSIGNED NOT NULL,
  `reported` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `created_at`, `updated_at`, `comment`, `userId`, `postId`, `reported`) VALUES
(72, '2021-03-12 13:53:47', '2021-03-12 13:53:47', 'hi', 1, 21, 0),
(73, '2021-03-12 13:53:49', '2021-03-12 13:53:49', 'hi', 1, 21, 0),
(74, '2021-03-12 13:53:51', '2021-03-12 13:53:51', 'hi', 1, 21, 0),
(75, '2021-03-12 13:53:53', '2021-03-12 13:53:53', 'hi', 1, 21, 0),
(76, '2021-03-12 13:53:54', '2021-03-12 13:53:54', 'hi', 1, 21, 0),
(77, '2021-03-12 13:53:56', '2021-03-12 13:53:56', 'hi', 1, 21, 0),
(78, '2021-03-12 13:53:58', '2021-03-12 13:53:58', 'hi', 1, 21, 0),
(79, '2021-03-12 13:54:00', '2021-03-12 13:54:00', 'hi', 1, 21, 0),
(80, '2021-03-12 13:54:01', '2021-03-12 13:54:01', 'hi', 1, 21, 0),
(81, '2021-03-12 13:54:03', '2021-03-12 13:54:03', 'hi', 1, 21, 0),
(82, '2021-03-12 13:54:05', '2021-03-12 13:54:05', 'hi', 1, 21, 0),
(83, '2021-03-12 13:54:07', '2021-03-12 13:54:07', 'hi', 1, 21, 0),
(84, '2021-03-12 13:54:16', '2021-03-12 13:54:16', 'good', 1, 21, 0),
(85, '2021-03-12 13:54:17', '2021-03-12 13:54:17', 'good', 1, 21, 0),
(86, '2021-03-12 13:54:19', '2021-03-12 13:54:19', 'good', 1, 21, 0),
(87, '2021-03-12 13:54:20', '2021-03-12 13:54:20', 'good', 1, 21, 0),
(88, '2021-03-12 13:54:22', '2021-03-12 13:54:22', 'good', 1, 21, 0),
(89, '2021-03-12 13:54:24', '2021-03-12 13:54:24', 'good', 1, 21, 0),
(90, '2021-03-12 13:54:26', '2021-03-12 13:54:26', 'good', 1, 21, 0),
(91, '2021-03-12 13:54:27', '2021-03-12 13:54:27', 'good', 1, 21, 0),
(92, '2021-03-30 22:57:32', '2021-03-30 22:57:32', 'ahmed', 1, 60, 0);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `following_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`id`, `follower_id`, `following_id`, `created_at`, `updated_at`) VALUES
(10, 1, 2, '2021-03-24', '2021-03-24'),
(11, 1, 3, '2021-03-24', '2021-03-24'),
(24, 1, 105, '2021-04-05', '2021-04-05'),
(25, 105, 1, '2021-04-05', '2021-04-05');

-- --------------------------------------------------------

--
-- Table structure for table `friendships`
--

CREATE TABLE `friendships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `userOneId` bigint(20) UNSIGNED NOT NULL,
  `userTwoId` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `acceptedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `friendships`
--

INSERT INTO `friendships` (`id`, `created_at`, `updated_at`, `userOneId`, `userTwoId`, `status`, `acceptedAt`) VALUES
(34, '2021-04-05 10:41:12', '2021-04-05 10:41:24', 1, 105, 1, '2021-04-05 12:41:12');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creatorId` bigint(20) UNSIGNED NOT NULL,
  `bio` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `groupQuestions` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reported` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `creatorId`, `bio`, `groupQuestions`, `created_at`, `updated_at`, `reported`) VALUES
(1, 'lorem_group', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', NULL, '2021-02-20 13:08:15', '2021-02-20 13:08:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `userId` bigint(20) UNSIGNED NOT NULL,
  `commentId` bigint(20) UNSIGNED DEFAULT NULL,
  `postId` bigint(20) UNSIGNED DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `groupId` bigint(20) UNSIGNED DEFAULT NULL,
  `pageId` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `created_at`, `updated_at`, `userId`, `commentId`, `postId`, `identifier`, `image`, `groupId`, `pageId`) VALUES
(2, '2021-02-26 04:03:22', '2021-02-26 04:03:22', 2, NULL, NULL, 'profile', '1614312202-687209324.jpeg', NULL, NULL),
(3, '2021-02-26 04:04:39', '2021-02-26 04:04:39', 2, NULL, NULL, 'profile', '1614312279-459545245.jpeg', NULL, NULL),
(4, '2021-02-26 05:06:40', '2021-02-26 05:06:40', 2, NULL, NULL, 'cover', '1614316000-764753347.jpeg', NULL, NULL),
(5, '2021-02-26 05:32:25', '2021-02-26 05:32:25', 2, NULL, NULL, 'cover', '1614317545-664126237.jpg', NULL, NULL),
(9, '2021-02-26 23:59:46', '2021-02-26 23:59:46', 1, NULL, 112, 'post', '1614383986-495773952.jpg', NULL, NULL),
(10, '2021-02-26 23:59:53', '2021-02-26 23:59:53', 1, NULL, 113, 'post', '1614383993-411921446.jpg', NULL, NULL),
(13, '2021-02-27 00:34:02', '2021-02-27 00:34:02', 1, NULL, NULL, 'profile', '1614386042-106005064.jpeg', NULL, NULL),
(14, '2021-03-03 08:40:03', '2021-03-03 08:40:03', 1, NULL, NULL, 'profile', '1614760803-480166075.jpg', NULL, NULL),
(15, '2021-03-03 08:40:52', '2021-03-03 08:40:52', 1, NULL, NULL, 'profile', '1614760852-675078042.jpg', NULL, NULL),
(19, '2021-03-12 19:18:39', '2021-03-12 19:18:39', 1, NULL, NULL, 'cover', '1615576719-823860098.jpeg', NULL, NULL),
(20, '2021-03-12 19:21:38', '2021-03-12 19:21:38', 1, NULL, NULL, 'cover', '1615576898-51991164.jpeg', NULL, NULL),
(21, '2021-03-12 21:16:30', '2021-03-12 21:16:30', 1, NULL, NULL, 'profile', '1615583790-647116553.jpg', NULL, NULL),
(22, '2021-03-12 21:16:48', '2021-03-12 21:16:48', 1, NULL, NULL, 'cover', '1615583808-447396216.jpeg', NULL, NULL),
(24, '2021-03-26 02:57:54', '2021-03-16 23:42:42', 2, NULL, 24, 'post', '1615938162-226218304.jpg', NULL, NULL),
(37, '2021-03-30 19:34:25', '2021-03-30 19:34:25', 1, NULL, 47, 'post', '1617132865-624731500.jpeg', NULL, NULL),
(38, '2021-03-30 19:34:25', '2021-03-30 19:34:25', 1, NULL, 47, 'post', '1617132865-88621436.jpg', NULL, NULL),
(39, '2021-03-30 19:34:25', '2021-03-30 19:34:25', 1, NULL, 47, 'post', '1617132865-412025415.png', NULL, NULL),
(40, '2021-03-30 19:34:25', '2021-03-30 19:34:25', 1, NULL, 47, 'post', '1617132865-162523529.jpg', NULL, NULL),
(41, '2021-03-30 19:34:25', '2021-03-30 19:34:25', 1, NULL, 47, 'post', '1617132865-473517682.jpg', NULL, NULL),
(42, '2021-03-31 00:14:58', '2021-03-31 00:14:58', 1, NULL, 48, 'post', '1617149698-924452897.jpg', NULL, NULL),
(43, '2021-03-31 00:33:14', '2021-03-31 00:33:14', 1, NULL, 51, 'post', '1617150794-272978312.jpg', NULL, NULL),
(44, '2021-03-31 00:33:23', '2021-03-31 00:33:23', 1, NULL, 52, 'post', '1617150803-442462642.jpg', NULL, NULL),
(45, '2021-03-31 00:37:25', '2021-03-31 00:37:25', 1, NULL, 53, 'post', '1617151045-54700499.jpg', NULL, NULL),
(46, '2021-03-31 00:37:31', '2021-03-31 00:37:31', 1, NULL, 54, 'post', '1617151051-976991308.jpg', NULL, NULL),
(47, '2021-03-31 00:46:58', '2021-03-31 00:46:58', 1, NULL, 55, 'post', '1617151618-79817262.jpg', NULL, NULL),
(48, '2021-03-31 00:48:16', '2021-03-31 00:48:16', 1, NULL, 56, 'post', '1617151696-54486143.jpg', NULL, NULL),
(49, '2021-04-03 18:28:09', '2021-04-03 18:28:09', 1, NULL, 61, 'post', '1617474489-922588475.png', NULL, NULL),
(50, '2021-04-03 18:40:02', '2021-04-03 18:40:02', 105, NULL, 62, 'post', '1617475202-684630196.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2021_01_01_200740_create_users_table', 1),
(4, '2021_01_01_200923_create_posts_table', 1),
(5, '2021_01_01_201005_create_groups_table', 1),
(6, '2021_01_01_201147_create_subscribed_groups_table', 1),
(7, '2021_01_01_201227_create_comments_table', 1),
(8, '2021_01_01_201323_create_replies_table', 1),
(9, '2021_01_01_201441_create_videos_table', 1),
(10, '2021_01_01_201621_create_notifications_table', 1),
(11, '2021_01_01_201641_create_images_table', 1),
(12, '2021_01_01_201707_create_reacts_table', 1),
(13, '2021_01_01_201733_create_friendships_table', 1),
(14, '2021_01_01_201802_create_reports_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `notification` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL DEFAULT 'has no description',
  `reported` tinyint(1) NOT NULL DEFAULT 0,
  `finishReporteDate` date DEFAULT NULL,
  `reporteCount` tinyint(4) NOT NULL DEFAULT 0,
  `creatorId` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pagesfollowing`
--

CREATE TABLE `pagesfollowing` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pageId` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `postText` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `reported` tinyint(1) DEFAULT 0,
  `pageId` bigint(20) UNSIGNED DEFAULT NULL,
  `loves` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `withImage` tinyint(1) NOT NULL DEFAULT 0,
  `iReacted` tinyint(1) NOT NULL DEFAULT 0,
  `withVideo` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `postText`, `user_id`, `group_id`, `created_at`, `updated_at`, `reported`, `pageId`, `loves`, `withImage`, `iReacted`, `withVideo`) VALUES
(21, 'the first post', 2, NULL, '2021-03-12 13:53:32', '2021-04-02 01:13:58', 0, NULL, 1, 0, 0, 0),
(22, 'it\'s me, i am using social', 2, NULL, '2021-03-12 14:32:19', '2021-04-02 02:04:05', 0, NULL, 1, 0, 0, 0),
(24, 'حبايبى الى واحشينى', 3, NULL, '2021-03-16 21:42:42', '2021-03-16 21:42:50', 0, NULL, 0, 1, 0, 0),
(25, 'فيديو جديد اهو ياشباب', 3, NULL, '2021-03-26 21:43:31', '2021-03-16 21:43:31', 0, NULL, 0, 0, 0, 0),
(28, '', 3, NULL, '2021-03-16 21:49:13', '2021-03-17 14:17:51', 0, NULL, 1, 0, 1, 1),
(47, '', 1, NULL, '2021-03-30 17:34:25', '2021-03-30 17:34:25', 0, NULL, 0, 1, 0, 0),
(48, '', 1, NULL, '2021-03-30 22:14:58', '2021-03-30 22:14:58', 0, NULL, 0, 0, 0, 0),
(49, '', 1, NULL, '2021-03-30 22:32:26', '2021-03-30 22:32:26', 0, NULL, 0, 0, 0, 0),
(50, '', 1, NULL, '2021-03-30 22:32:57', '2021-03-30 22:32:57', 0, NULL, 0, 0, 0, 0),
(51, '', 1, NULL, '2021-03-30 22:33:14', '2021-03-30 22:33:14', 0, NULL, 0, 1, 0, 0),
(52, '', 1, NULL, '2021-03-30 22:33:23', '2021-03-30 22:33:23', 0, NULL, 0, 1, 0, 0),
(53, '', 1, NULL, '2021-03-30 22:37:25', '2021-03-30 22:37:25', 0, NULL, 0, 1, 0, 0),
(54, '', 1, NULL, '2021-03-30 22:37:31', '2021-03-30 22:37:31', 0, NULL, 0, 1, 0, 0),
(55, '', 1, NULL, '2021-03-30 22:46:58', '2021-03-30 22:46:58', 0, NULL, 0, 1, 0, 0),
(56, '', 1, NULL, '2021-03-30 22:48:16', '2021-03-30 22:48:16', 0, NULL, 0, 1, 0, 0),
(57, '', 1, NULL, '2021-03-30 22:48:51', '2021-03-30 22:48:51', 0, NULL, 0, 0, 0, 1),
(58, 'ahmed is a good man', 1, NULL, '2021-03-30 22:50:15', '2021-03-30 22:50:15', 0, NULL, 0, 0, 0, 1),
(59, '', 1, NULL, '2021-03-30 22:51:31', '2021-04-03 16:37:08', 0, NULL, 2, 0, 0, 0),
(60, 'i\'m safe', 1, NULL, '2021-03-30 22:56:27', '2021-03-31 22:01:29', 0, NULL, 1, 0, 1, 0),
(61, '', 1, NULL, '2021-04-03 16:28:09', '2021-04-04 00:07:50', 0, NULL, 2, 1, 1, 0),
(62, '', 105, NULL, '2021-04-03 16:40:02', '2021-04-05 05:50:32', 0, NULL, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reacts`
--

CREATE TABLE `reacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loves` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `postId` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reacts`
--

INSERT INTO `reacts` (`id`, `loves`, `created_at`, `updated_at`, `postId`, `userId`) VALUES
(48, 0, '2021-04-02 01:13:58', '2021-04-02 01:13:58', 21, 1),
(49, 0, '2021-04-02 01:13:58', '2021-04-02 01:13:58', 21, 2),
(51, 0, '2021-04-02 02:04:05', '2021-04-02 02:04:05', 22, 1),
(58, 0, '2021-04-03 16:29:08', '2021-04-03 16:29:08', 59, 1),
(59, 0, '2021-04-03 16:36:45', '2021-04-03 16:36:45', 61, 105),
(60, 0, '2021-04-03 16:37:08', '2021-04-03 16:37:08', 59, 105),
(62, 0, '2021-04-04 00:07:50', '2021-04-04 00:07:50', 61, 1),
(63, 0, '2021-04-05 05:50:32', '2021-04-05 05:50:32', 62, 1);

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commentId` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reported` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reporterId` bigint(20) UNSIGNED NOT NULL,
  `postId` bigint(20) UNSIGNED DEFAULT NULL,
  `commentId` bigint(20) UNSIGNED DEFAULT NULL,
  `replyId` bigint(20) UNSIGNED DEFAULT NULL,
  `groupId` bigint(20) UNSIGNED DEFAULT NULL,
  `userId` bigint(20) UNSIGNED DEFAULT NULL,
  `pageId` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribed_groups`
--

CREATE TABLE `subscribed_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `groupId` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `acceptedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `userAnswers` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systemadmins`
--

CREATE TABLE `systemadmins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `pageId` bigint(20) UNSIGNED NOT NULL,
  `groupId` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_avatar` text COLLATE utf8mb4_unicode_ci DEFAULT 'default_avatar.jpg',
  `user_cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default_cover.jpg',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workPlace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interests` text COLLATE utf8mb4_unicode_ci DEFAULT '[]',
  `languages` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reported` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finishReporteDate` date DEFAULT NULL,
  `reporteCount` tinyint(4) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `graduate` tinyint(1) DEFAULT 0,
  `studying_at` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finish_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studying_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `user_avatar`, `user_cover`, `phone`, `email`, `country`, `city`, `workPlace`, `education`, `bio`, `interests`, `languages`, `gender`, `created_at`, `updated_at`, `reported`, `remember_token`, `finishReporteDate`, `reporteCount`, `date_of_birth`, `graduate`, `studying_at`, `start_year`, `finish_year`, `studying_city`) VALUES
(1, 'ahmed', 'hazem', 'ah', '$2y$10$F349F285sVPW/VVgGUXafeEhu7tIYKa4.7csDYPEBsdxowkaBCzsK', '1615583790-647116553.jpg', '1615583808-447396216.jpeg', '01013261995', 'ah@a.com', 'eg', 'الوراق', NULL, NULL, 'lkfnsjklghjnsamcvhasbv\r\nlkfnsjklghjnsamcvhasbvlkfnsjklghjnsamcvhasbvlkfnsjklghjnsamcvhasbvlkfnsjklghjnsamcvhasbvlkfnsjklghjnsamcvhasbv\r\nlkfnsjklghjnsamcvhasbv\r\nlkfnsjklghjnsamcvhasbv\r\nlkfnsjklghjnsamcvhasbv', '[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\\u0631\\u0643\\u0648\\u0628 \\u0627\\u0644\\u062f\\u0631\\u0627\\u062c\\u0629\",\"\\u0627\\u0644\\u0633\\u0641\\u0631\"]', NULL, 'male', '2021-02-13 04:04:47', '2021-03-19 14:09:00', 0, 'rRGFdLztVOaXiES5FpzA3v9gsHHYDoJ9gzTL4Zc1Q3ij81YGlgIoBjzWHLaF', NULL, NULL, NULL, 0, 'fayoum university', '2020', '2024', 'fayoum'),
(2, 'ahmed', 'hazme', 'a', '$2y$10$GC1w5LkjER3jbpmAVWM08OSsLVugbG4X5UykvK3YCr//EiphG/OOu', 'default_avatar.jpg', 'default_cover.jpg', '01121143200', 'a@a.com', NULL, NULL, NULL, NULL, NULL, '\'[]\'', NULL, 'male', '2021-02-13 04:20:39', '2021-02-13 04:20:39', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(3, 'ahmde', 'gasdf', 'o', '$2y$10$OgviUIOaeMopdY6I6Z1pSODxbULVLFU2.UF64DEdp6h3/jfSC4tkW', 'default_avatar.jpg', 'default_cover.jpg', '01121143200', 'o@o.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-17 20:22:16', '2021-02-17 20:22:16', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(4, 'firstname', 'lastname', 'username0', '$2y$10$f3ouzTvoo7ksRCl7H0XEuOK/ezkqGVcFeu2Z97pGFmhVIrf7B5BIC', 'default_avatar.jpg', 'default_cover.jpg', 'phone', 'email0@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:51', '2021-02-20 11:47:51', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(5, 'firstname', 'lastname', 'username1', '$2y$10$6va1i4fPVnoGKCvdCAxqQep.NmaQ4DyBiUIK1DV9l9qPE7fnxuGGm', 'default_avatar.jpg', 'default_cover.jpg', 'phone', 'email1@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:51', '2021-02-20 11:47:51', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(6, 'firstname', 'lastname', 'username2', '$2y$10$9lu/qhHnOkKVsYSc3H5KFuk2cQrHfoZ7u5Mtimjm3uPmBlDF/hkL6', NULL, 'default_cover.jpg', 'phone', 'email2@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:51', '2021-02-20 11:47:51', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(7, 'firstname', 'lastname', 'username3', '$2y$10$RUFuy6W95uekJ0NDkcO6EeUhIb4Gjz8bWjTyqEiifkxQXbc9jc6yS', NULL, 'default_cover.jpg', 'phone', 'email3@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:51', '2021-02-20 11:47:51', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(8, 'firstname', 'lastname', 'username4', '$2y$10$Eey9C/yI1RVxk27xlcsm7OkRKX01oERCRttf3QZQRGduna0OqhOqa', NULL, 'default_cover.jpg', 'phone', 'email4@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(9, 'firstname', 'lastname', 'username5', '$2y$10$37ILpT5m68blm0BiSp928OD1B3fcbZFn/bEO6aeK34IVxVS3qaoEO', NULL, 'default_cover.jpg', 'phone', 'email5@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(10, 'firstname', 'lastname', 'username6', '$2y$10$Fh0figa3cHtCnauMYUpP5ejpiZZ.8QnnvVxGv6.i.37lISDM6DZ9q', NULL, 'default_cover.jpg', 'phone', 'email6@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(11, 'firstname', 'lastname', 'username7', '$2y$10$oe5vG.OcPzECuE5ZsOCK8OPos/PLTzAKEXXoDutBtiRKasSfzLgOi', NULL, 'default_cover.jpg', 'phone', 'email7@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(12, 'firstname', 'lastname', 'username8', '$2y$10$yih4T5vJ/nlF8/yeRwIqOOxEW3F6FT2nfc/JvRrDk/jKWdz11fqkm', NULL, 'default_cover.jpg', 'phone', 'email8@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(13, 'firstname', 'lastname', 'username9', '$2y$10$93T2PV.VaJZ57ewU76VE0OiUOTuAMyX663Ndp6LeE.QvBI29a65dm', NULL, 'default_cover.jpg', 'phone', 'email9@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(14, 'firstname', 'lastname', 'username10', '$2y$10$XwXfYM6aW/YvFYe5YfwLmuxn/mZZrTsdK9iu7BeQhZetyXN4kFLW.', NULL, 'default_cover.jpg', 'phone', 'email10@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(15, 'firstname', 'lastname', 'username11', '$2y$10$6NYyvAXG3Y08A0Zk2G6z/uIeSPL.IMpzNE2Lpypoy4itfELWI4fOm', NULL, 'default_cover.jpg', 'phone', 'email11@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(16, 'firstname', 'lastname', 'username12', '$2y$10$FdWKudiyHIHDDkBRPMCd5O9JRQzGMaLtbxXAbzU9eafmHqaV5d.ci', NULL, 'default_cover.jpg', 'phone', 'email12@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(17, 'firstname', 'lastname', 'username13', '$2y$10$CE5.OWuWFIDOobmmc9rNTuwFoNOek6ntDEGEbP.TQjAx.OHOV5Uu.', NULL, 'default_cover.jpg', 'phone', 'email13@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(18, 'firstname', 'lastname', 'username14', '$2y$10$RXqR5MwkyCr1ZL7dCmq0/.M.WzBcm7K8d/ppLJDTjuQgO1GJR/6Fa', NULL, 'default_cover.jpg', 'phone', 'email14@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(19, 'firstname', 'lastname', 'username15', '$2y$10$P5UBIockXwM2jWNDYfBWQu16gEfLP4utDkIYwZG/2nfMAb2GK92Ny', NULL, 'default_cover.jpg', 'phone', 'email15@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(20, 'firstname', 'lastname', 'username16', '$2y$10$7MKZDjA9/wxJ5NC39dCw6.qudoIN.tV9M/YaYZpoPvXVpQFI6c1eW', NULL, 'default_cover.jpg', 'phone', 'email16@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(21, 'firstname', 'lastname', 'username17', '$2y$10$undamfnK/N9N5dQaGuMfR.UQ/QDlWszRJobNIIsfmLfA5q/3IgzjK', NULL, 'default_cover.jpg', 'phone', 'email17@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:52', '2021-02-20 11:47:52', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(22, 'firstname', 'lastname', 'username18', '$2y$10$VmOzzepS2kB4rE6KPkfSM.d68P27au3XCgq7UaxurHw71zYE58/1O', NULL, 'default_cover.jpg', 'phone', 'email18@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:53', '2021-02-20 11:47:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(23, 'firstname', 'lastname', 'username19', '$2y$10$OuxkO9GGUGyxmTHtP5SPHOcBSpzqGiSrmSYsleQclRb2jCmdYsP.i', NULL, 'default_cover.jpg', 'phone', 'email19@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:53', '2021-02-20 11:47:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(24, 'firstname', 'lastname', 'username20', '$2y$10$IJy2wR1.utDLdE9w9w4TAOOD/MANKmGv1k5ObO1TYHaWm0R3LRVEe', NULL, 'default_cover.jpg', 'phone', 'email20@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:53', '2021-02-20 11:47:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(25, 'firstname', 'lastname', 'username21', '$2y$10$ug23VPX7G85DFQlsZnbCvehDn4yW7s0PWbn/Fh6auIpKIxcDfgmdy', NULL, 'default_cover.jpg', 'phone', 'email21@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:53', '2021-02-20 11:47:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(26, 'firstname', 'lastname', 'username22', '$2y$10$Jkn3edFMj2twcWMDeZMaxOojSzWvb9LgFBvnkjJVWfMQeDOW6Q6Ii', NULL, 'default_cover.jpg', 'phone', 'email22@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:53', '2021-02-20 11:47:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(27, 'firstname', 'lastname', 'username23', '$2y$10$A4YcakHRzY3mkCL0CgqZfuBdMl4tWuPlSzXQ2G89kCalZocsAcNP.', NULL, 'default_cover.jpg', 'phone', 'email23@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:53', '2021-02-20 11:47:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(28, 'firstname', 'lastname', 'username24', '$2y$10$8iQmkC4Kwyy69aGPmEKNluq7Z7jwEMDx0CiV5dfC6mpdRILJAjT0m', NULL, 'default_cover.jpg', 'phone', 'email24@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:53', '2021-02-20 11:47:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(29, 'firstname', 'lastname', 'username25', '$2y$10$bp9ZMQraKx5LgpyEAX0eceH3TZxcQBjRV8DWVI/mXrQsF38iUsOIO', NULL, 'default_cover.jpg', 'phone', 'email25@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:53', '2021-02-20 11:47:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(30, 'firstname', 'lastname', 'username26', '$2y$10$Bdoh62Q2LY.y.1OntA/ykeFr7.dChDo4hJZ.kjedPQHDD5YjM2tGm', NULL, 'default_cover.jpg', 'phone', 'email26@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:53', '2021-02-20 11:47:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(31, 'firstname', 'lastname', 'username27', '$2y$10$Lv1Mxgvk9kQ47odhO2VX7uKg/lMhpvMzHTlC.tfrSetlbh1YPMccm', NULL, 'default_cover.jpg', 'phone', 'email27@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:53', '2021-02-20 11:47:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(32, 'firstname', 'lastname', 'username28', '$2y$10$.owAbDgu.V35xP463rB/pucfnlhtroZXL5ovx/zuLZYFvGsYYgZGm', NULL, 'default_cover.jpg', 'phone', 'email28@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:53', '2021-02-20 11:47:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(33, 'firstname', 'lastname', 'username29', '$2y$10$Q/QhUWNcOnlQxCUE5t9I9.7OZCDWTAwYin6FnVeyOkB5dS8TiFVEK', NULL, 'default_cover.jpg', 'phone', 'email29@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:53', '2021-02-20 11:47:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(34, 'firstname', 'lastname', 'username30', '$2y$10$IjDk4ucjK2jbCWbM7aB14unHD/u7/ubCTLnpNd5QmYSyvdz6h2NKS', NULL, 'default_cover.jpg', 'phone', 'email30@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:53', '2021-02-20 11:47:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(35, 'firstname', 'lastname', 'username31', '$2y$10$Wt7HVVMU1ukk8rgQ6wRpNOLB6gxyEg9.yc89I4RtA.6ojkTPINB82', NULL, 'default_cover.jpg', 'phone', 'email31@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:54', '2021-02-20 11:47:54', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(36, 'firstname', 'lastname', 'username32', '$2y$10$af3nJg.o0tL9/IcQnITI3uKEP63ZF/rg2erDLP9GTh/gSJ1HIZ26.', NULL, 'default_cover.jpg', 'phone', 'email32@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:54', '2021-02-20 11:47:54', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(37, 'firstname', 'lastname', 'username33', '$2y$10$yfvdIB4hNobcBfe7QhYWiueVlRvW8JNwsEOczAf67SLqaebT.fQa6', NULL, 'default_cover.jpg', 'phone', 'email33@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:54', '2021-02-20 11:47:54', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(38, 'firstname', 'lastname', 'username34', '$2y$10$12oOYl8oBAcfvGhhj79J7uyygUCMUaFNPgfnjzLme8xXJNDEtkiZS', NULL, 'default_cover.jpg', 'phone', 'email34@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:54', '2021-02-20 11:47:54', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(39, 'firstname', 'lastname', 'username35', '$2y$10$dgLq4iiBwZVazV9Jqb6AbuDXQtZAqhhdF6w611AP.FYki7aai2q7C', NULL, 'default_cover.jpg', 'phone', 'email35@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:54', '2021-02-20 11:47:54', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(40, 'firstname', 'lastname', 'username36', '$2y$10$9DnwhVx2SjgZ0G0n7ViSgOKUQeXUtFY0xOLjpayKHXP5DF3yjjG6G', NULL, 'default_cover.jpg', 'phone', 'email36@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:54', '2021-02-20 11:47:54', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(41, 'firstname', 'lastname', 'username37', '$2y$10$eezwbzPwLq4VzYJRxi2D4eZQq/SkYio7MXeEpRNX/y2cktoIxko5i', NULL, 'default_cover.jpg', 'phone', 'email37@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:54', '2021-02-20 11:47:54', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(42, 'firstname', 'lastname', 'username38', '$2y$10$NU57o0hkMAq8h1rv4qLzIuz7T8g0NyNSk63V3iTurCG/ySAnizor.', NULL, 'default_cover.jpg', 'phone', 'email38@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:54', '2021-02-20 11:47:54', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(43, 'firstname', 'lastname', 'username39', '$2y$10$luKkMYnWh2jnm8lKGxcAXuiSAQcLNoEUKdRxEuajCZHwAUj/V3tY2', NULL, 'default_cover.jpg', 'phone', 'email39@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:54', '2021-02-20 11:47:54', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(44, 'firstname', 'lastname', 'username40', '$2y$10$Io6FHU.wEnGPK2dcwCHGjujMXs9pMJuaZWGagXvIpB93PSOvmzADC', NULL, 'default_cover.jpg', 'phone', 'email40@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:54', '2021-02-20 11:47:54', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(45, 'firstname', 'lastname', 'username41', '$2y$10$BdBheZQtbOdcghnViFEe6e8pyHPa68DDm9Jms.du2/spa3M9QYo0C', NULL, 'default_cover.jpg', 'phone', 'email41@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:54', '2021-02-20 11:47:54', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(46, 'firstname', 'lastname', 'username42', '$2y$10$PlGAd/1pYHRFEkzpxhPEQuPwY5X8ZRJXZotYrUvsveUFGcTaSf7Oa', NULL, 'default_cover.jpg', 'phone', 'email42@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:54', '2021-02-20 11:47:54', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(47, 'firstname', 'lastname', 'username43', '$2y$10$HhGcH0HbAUlct4C2fYwcgO2amMKUVYs9IMAKfvim/PwMnsutRWS3W', NULL, 'default_cover.jpg', 'phone', 'email43@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(48, 'firstname', 'lastname', 'username44', '$2y$10$RM.CdmsAm7UOhvDKM1s6Q.HFgthApoIhBZ6Umn8Z1TCi9wGjnaK6u', NULL, 'default_cover.jpg', 'phone', 'email44@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(49, 'firstname', 'lastname', 'username45', '$2y$10$IzzW6xt5JFwoC1n1vwAXheoeB2g.2CIH4LiObZcm2xzLaXGRZgc9e', NULL, 'default_cover.jpg', 'phone', 'email45@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(50, 'firstname', 'lastname', 'username46', '$2y$10$.F8KqvpaKzBOHpwAaCaTneZdS10drBiUNvMaXbB3GvwHNKPNjSDiy', NULL, 'default_cover.jpg', 'phone', 'email46@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(51, 'firstname', 'lastname', 'username47', '$2y$10$eI6J1Pju7vkajBRV3YFYieg.uNkiODfzYZLbFKZSgyfOPr4Dl19KC', NULL, 'default_cover.jpg', 'phone', 'email47@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(52, 'firstname', 'lastname', 'username48', '$2y$10$f1YPzNF281.RF4ElGqSc/OO.nBEwHikaPh1JjUNhV.N8I4u0/1ciC', NULL, 'default_cover.jpg', 'phone', 'email48@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(53, 'firstname', 'lastname', 'username49', '$2y$10$jSoyro1z/8yI08MrEuhi8OlR69kZugC4Rl3W1fP2GKUj1cOArEnqa', NULL, 'default_cover.jpg', 'phone', 'email49@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(54, 'firstname', 'lastname', 'username50', '$2y$10$qK8oeP2nvTQ7VlUrlabVGOIOu2VWRYRoQ1ZlR9EwbRpWQR3LCGtGG', NULL, 'default_cover.jpg', 'phone', 'email50@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(55, 'firstname', 'lastname', 'username51', '$2y$10$Lk5dvf2dUr/K3if89nd3juj1PVOOkpppnxh6f1ddkE.IuCeMGTdyG', NULL, 'default_cover.jpg', 'phone', 'email51@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(56, 'firstname', 'lastname', 'username52', '$2y$10$L1xTvoLKVMU/I3GlX6iR0OwblyJupswzrymumGn9HbGmvPQDum0D6', NULL, 'default_cover.jpg', 'phone', 'email52@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(57, 'firstname', 'lastname', 'username53', '$2y$10$dDeA9dnG2sxSO5vzJaMVeOjj.IBqi2a1xmi4X226ry2e04irAToSa', NULL, 'default_cover.jpg', 'phone', 'email53@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(58, 'firstname', 'lastname', 'username54', '$2y$10$VcHyytwPLkOaep3Hl0x77uvmmbIaq5ilgtqDoILoSv8GGcXf2gcmy', NULL, 'default_cover.jpg', 'phone', 'email54@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(59, 'firstname', 'lastname', 'username55', '$2y$10$e7DtO4LWq2cq8u0PsgwtJuqqL3.4ZXCETH7X4F3E2JdP4qqD7HYAa', NULL, 'default_cover.jpg', 'phone', 'email55@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(60, 'firstname', 'lastname', 'username56', '$2y$10$0zLctvX096AzDs6LW1YveeemlNBIEmEXAuKqgFofT.R7pJ8GJ./d2', NULL, 'default_cover.jpg', 'phone', 'email56@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:55', '2021-02-20 11:47:55', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(61, 'firstname', 'lastname', 'username57', '$2y$10$IRa.A5KsC1y9OLMcqXUalOhwJSw6qNvvTWZN66o5vdiktqtZBT9T2', NULL, 'default_cover.jpg', 'phone', 'email57@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(62, 'firstname', 'lastname', 'username58', '$2y$10$E8FqZgBSgVSAA7wzACjg6eujpLFYh8NwLc4WP/6xEcdyK8qcZo0la', NULL, 'default_cover.jpg', 'phone', 'email58@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(63, 'firstname', 'lastname', 'username59', '$2y$10$TeWk3JvtQOr/dq.Rju4BEO.hoFAh5wMTAHGqPRQeMJDkPouYJ7zB6', NULL, 'default_cover.jpg', 'phone', 'email59@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(64, 'firstname', 'lastname', 'username60', '$2y$10$OqIozioBBTJWYnzAh9uWae4qGzGTno0sxWVSVuy/VpQoUJ9q/3pv2', NULL, 'default_cover.jpg', 'phone', 'email60@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(65, 'firstname', 'lastname', 'username61', '$2y$10$O/N9QmmhORkNgd3HXCQYbuPjkqBdJSYRfyYbn5Wmt9FNFY.CkEJYG', NULL, 'default_cover.jpg', 'phone', 'email61@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(66, 'firstname', 'lastname', 'username62', '$2y$10$s9Qz.LqFvcyE1rzSMGFCw.FLBAqQTqCj1AMueTsgVZB8Yo3opI11u', NULL, 'default_cover.jpg', 'phone', 'email62@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(67, 'firstname', 'lastname', 'username63', '$2y$10$J7q7g1WHc8bgBMQ1b.gmB.Jf.PSUeqBCk2iN5FrBfvfawyC2wmblu', NULL, 'default_cover.jpg', 'phone', 'email63@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(68, 'firstname', 'lastname', 'username64', '$2y$10$w/vlR43f1T6QaQvKzJvFseqcDD7rK8cF/eWN1NeRNWEVQCV3//RJe', NULL, 'default_cover.jpg', 'phone', 'email64@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(69, 'firstname', 'lastname', 'username65', '$2y$10$qzO1jL0xY.GZZonxOSyMr.Hwl1wa/MTTeVd6wSKjqTECLtZp2bMx.', NULL, 'default_cover.jpg', 'phone', 'email65@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(70, 'firstname', 'lastname', 'username66', '$2y$10$GF0knETldNyLVhq7oNO8tuVNECRORPsk755/W4jLc63mhTSlycnM6', NULL, 'default_cover.jpg', 'phone', 'email66@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(71, 'firstname', 'lastname', 'username67', '$2y$10$mSXJ305jK2TCjAmKwLjp1eE6A/S5D7lLV8/OpMQSEj1deU13U16Di', NULL, 'default_cover.jpg', 'phone', 'email67@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(72, 'firstname', 'lastname', 'username68', '$2y$10$rnx0lbs3mFVX/DtVhyVcseIDNxuIYY1zFzfzZmyh1NYjiHJjSWjZi', NULL, 'default_cover.jpg', 'phone', 'email68@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(73, 'firstname', 'lastname', 'username69', '$2y$10$FP.e7qCupWFnTXwHa73E7OxhH2ce6DIBgLz1iHdClduVQ7qnNbh2G', NULL, 'default_cover.jpg', 'phone', 'email69@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(74, 'firstname', 'lastname', 'username70', '$2y$10$XkkYlZsuQ0XkkZuVxzwNLOi4lGQV7oUmJym2rRqqsEApwVcMUOEIe', NULL, 'default_cover.jpg', 'phone', 'email70@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:56', '2021-02-20 11:47:56', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(75, 'firstname', 'lastname', 'username71', '$2y$10$oi1IzxM6YwlztnVPc/Khxe0b4HIz9JqmVaZxbFA.TRS5aMzrzMQfe', NULL, 'default_cover.jpg', 'phone', 'email71@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(76, 'firstname', 'lastname', 'username72', '$2y$10$.KRwlY3BQiuIdOybBwLkieocPPD3MHWDvf4jA1Il6kRBWUGPZZYbK', NULL, 'default_cover.jpg', 'phone', 'email72@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(77, 'firstname', 'lastname', 'username73', '$2y$10$3.ExsA7ny3DvXUN55qQ3hONYVLmpJ8xhmI/29q3kUyBxVS4EwuBSa', NULL, 'default_cover.jpg', 'phone', 'email73@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(78, 'firstname', 'lastname', 'username74', '$2y$10$T92L.D8huVjAY4oqopRXnurx66qOVGsdnOay8aO.UjsTlnFCjOGLy', NULL, 'default_cover.jpg', 'phone', 'email74@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(79, 'firstname', 'lastname', 'username75', '$2y$10$YJUNtFCLqIB/caFnXQeJRuYFmS3EMuXcHrgghNlu7ZXUh6g4//Y3u', NULL, 'default_cover.jpg', 'phone', 'email75@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(80, 'firstname', 'lastname', 'username76', '$2y$10$d0KQEPy4rdPLeEQzMSlyQe.ACclKNTUWHSFpmLnT3CuOwwwMkbsS.', NULL, 'default_cover.jpg', 'phone', 'email76@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(81, 'firstname', 'lastname', 'username77', '$2y$10$JSrTTjWYDyQ08OqWfU6beO7IDinkkPAK52b0RHjF0HHE/V7wGbrN2', NULL, 'default_cover.jpg', 'phone', 'email77@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(82, 'firstname', 'lastname', 'username78', '$2y$10$Hj8gJKsBcZsytGptbAMO.eOVVC26rVQxvm.B70jgp7y8oRgNuyJSS', NULL, 'default_cover.jpg', 'phone', 'email78@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(83, 'firstname', 'lastname', 'username79', '$2y$10$Ak6wKEzB/mndBhZPojSeN.KyOMMYHiXKfPhyk4/E1TC3S.9erj6B.', NULL, 'default_cover.jpg', 'phone', 'email79@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(84, 'firstname', 'lastname', 'username80', '$2y$10$XefTbiQY2X/bjsscpmE82uPzhQ/q5NPK6i0PgYTAdojwQuctwBdxC', NULL, 'default_cover.jpg', 'phone', 'email80@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(85, 'firstname', 'lastname', 'username81', '$2y$10$PlnXA9V7rMbHKsm38kSeqe9Cmsy8MNv/o8a7ZazR1S5CkQqYIP36a', NULL, 'default_cover.jpg', 'phone', 'email81@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(86, 'firstname', 'lastname', 'username82', '$2y$10$Zr0zeK/ytfCs5htaIFOxauZtGbLSnBiI01/C5PxlBe6brsQaAeL4C', NULL, 'default_cover.jpg', 'phone', 'email82@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(87, 'firstname', 'lastname', 'username83', '$2y$10$.7YMpox6T4OpZCFrYct7t.RJponr.xdYzPhDZVtjlPL/7xCdZOatS', NULL, 'default_cover.jpg', 'phone', 'email83@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(88, 'firstname', 'lastname', 'username84', '$2y$10$LOLBMI4fgOb.mH0PaVMqzuf8Y3aDCCsvPAeNLygmzgqLj/Bs6UoB2', NULL, 'default_cover.jpg', 'phone', 'email84@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:57', '2021-02-20 11:47:57', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(89, 'firstname', 'lastname', 'username85', '$2y$10$CTJWHpItePf/Eq/cGyhjuudrypxt9mcOoX6vJLDlATft0RHb.M9QC', NULL, 'default_cover.jpg', 'phone', 'email85@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(90, 'firstname', 'lastname', 'username86', '$2y$10$RrHKJZJcuNN5kijza/EHc.kYi3tRP0Rxw9RARsUyvq8/cPgosofhW', NULL, 'default_cover.jpg', 'phone', 'email86@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(91, 'firstname', 'lastname', 'username87', '$2y$10$eN1hxUBWKJXgtukFremdd.wo5zHrzWU3MGr2alP.LZak593e63s2e', NULL, 'default_cover.jpg', 'phone', 'email87@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(92, 'firstname', 'lastname', 'username88', '$2y$10$NsyKJkO8SL/n5MAdmzKXVehL/hQz3pUxl3Vz5I65XXOG7CHrKTesS', NULL, 'default_cover.jpg', 'phone', 'email88@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(93, 'firstname', 'lastname', 'username89', '$2y$10$EUQy5HqeY6A8kPHpF/WXVewcHgRqnpwyH2qAAHCxMJVUCi2PFcCsy', NULL, 'default_cover.jpg', 'phone', 'email89@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(94, 'firstname', 'lastname', 'username90', '$2y$10$aAbdYkYrVrbK5blMygbp2OB8Z7s357ltvOSMXrWqM/zPeuXd2OuTy', NULL, 'default_cover.jpg', 'phone', 'email90@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(95, 'firstname', 'lastname', 'username91', '$2y$10$MQh23MQBqri3mZPonvD6q.JwuY1NC41n5ZZyLRuvA/9fjr9ijRe0W', NULL, 'default_cover.jpg', 'phone', 'email91@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(96, 'firstname', 'lastname', 'username92', '$2y$10$9sZRZOV0j6dhS2qsyyQBKOIjA9r056RT0VlbZwLrJOiAXBIjL6bEm', NULL, 'default_cover.jpg', 'phone', 'email92@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(97, 'firstname', 'lastname', 'username93', '$2y$10$BnTgq8pr7rQ2gAqwgsBeJObqp5NjzLGPHp3U8WgSXgoy52YH4lpQS', NULL, 'default_cover.jpg', 'phone', 'email93@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(98, 'firstname', 'lastname', 'username94', '$2y$10$IEWej6yuoszBrqurpcM0vOIh1a6AaUZZI9ruNXzN2j/xe0HFMzL9S', NULL, 'default_cover.jpg', 'phone', 'email94@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(99, 'firstname', 'lastname', 'username95', '$2y$10$euEZ.QL7gOpRcUKSbfy.t.x8Nh85PGdO.Q.nNB6SNC4EBm03zUtWC', NULL, 'default_cover.jpg', 'phone', 'email95@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(100, 'firstname', 'lastname', 'username96', '$2y$10$xyhmKFH.QtEQc2tZ7jJ0FuNpncRu9kIDQ.KNMf4Pv06OqV8JHc20.', NULL, 'default_cover.jpg', 'phone', 'email96@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(101, 'firstname', 'lastname', 'username97', '$2y$10$dBFJsDVD76wWLxXriMn2EOuvMKV.mzBdX6nIjY0BHIxSwl4sE7n.S', NULL, 'default_cover.jpg', 'phone', 'email97@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(102, 'firstname', 'lastname', 'username98', '$2y$10$vOw09fSSPnZwT6XBGEY9kerw31QRzDvd2bQwY0zIPc7jDMSZRtV9i', NULL, 'default_cover.jpg', 'phone', 'email98@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:58', '2021-02-20 11:47:58', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(103, 'firstname', 'lastname', 'username99', '$2y$10$Pt8y1UwEVSSq.Ot4/zLpb.noGphsF2JyPKuzrimaSUrsenmRNu2PS', NULL, 'default_cover.jpg', 'phone', 'email99@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:59', '2021-02-20 11:47:59', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(104, 'firstname', 'lastname', 'username100', '$2y$10$hNjDpIUCjuXA88/ddFI.eeqEngIn3dERl67iKCjXZ/35qWrJeKXSy', NULL, 'default_cover.jpg', 'phone', 'email100@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'femail', '2021-02-20 11:47:59', '2021-02-20 11:47:59', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(105, 'kerollos', 'nabil', 'kerollosnabil753', '$2y$10$/tOqmvDmD06mRsVaIJEPBOThZFmoGv4TvRgWq9LYKOOBOlAPYtnUi', 'default_avatar.jpg', 'default_cover.jpg', '01559227444', 'kerollosnabil753@gmail.com', NULL, NULL, NULL, NULL, NULL, '[]', NULL, 'male', '2021-04-03 16:35:09', '2021-04-03 16:35:09', 0, 'pX7AADw2fc9Xijut6LQsZdvqMOCSILC8KxBW4yTRod62Vx3z2QpZTh6jyRr4', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `postId` bigint(20) UNSIGNED NOT NULL,
  `video` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentId` bigint(20) UNSIGNED DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupId` bigint(20) UNSIGNED DEFAULT NULL,
  `pageId` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `created_at`, `updated_at`, `userId`, `postId`, `video`, `commentId`, `identifier`, `groupId`, `pageId`) VALUES
(1, '2021-02-26 22:32:36', '2021-02-26 22:32:36', 1, 116, '1614385956-120345172.mp4', NULL, 'post', NULL, NULL),
(5, '2021-03-16 21:49:13', '2021-03-16 21:49:13', 1, 28, '1615938553-666352295.mp4', NULL, 'post', NULL, NULL),
(6, '2021-03-30 22:48:51', '2021-03-30 22:48:51', 1, 57, '1617151731-737693130.mp4', NULL, 'post', NULL, NULL),
(7, '2021-03-30 22:50:15', '2021-03-30 22:50:15', 1, 58, '1617151815-801620274.mp4', NULL, 'post', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_usesr_id_foreign` (`userId`),
  ADD KEY `comment_post_id_foreign` (`postId`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follows_follower_user_id` (`follower_id`),
  ADD KEY `follows_following_user_id` (`following_id`);

--
-- Indexes for table `friendships`
--
ALTER TABLE `friendships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friendships_user_one_id_foreign` (`userOneId`),
  ADD KEY `friendships_user_two_id_foreign` (`userTwoId`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_creator_id` (`creatorId`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_user_id_foreign` (`userId`),
  ADD KEY `images_comment_id_foreign` (`commentId`),
  ADD KEY `images_post_id_foreign` (`postId`),
  ADD KEY `images_group_id_foreign` (`groupId`),
  ADD KEY `images_page_id_foreign` (`pageId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`userId`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagesfollowing`
--
ALTER TABLE `pagesfollowing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pagesfollowing_user_id_foreign` (`userId`),
  ADD KEY `pagesfollowing_page_id_foreign` (`pageId`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_group_id_foreign` (`group_id`),
  ADD KEY `posts_page_id_foreign` (`pageId`),
  ADD KEY `post_created_at_index` (`created_at`);

--
-- Indexes for table `reacts`
--
ALTER TABLE `reacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reacts_post_id_foreign` (`postId`),
  ADD KEY `reacts_user_id_foreign` (`userId`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reply_user_id_foreign` (`userId`),
  ADD KEY `reply_comment_id_foreign` (`commentId`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_reporter_id_foreign` (`reporterId`),
  ADD KEY `reports_post_id_foreign` (`postId`),
  ADD KEY `reports_comment_id_foreign` (`commentId`),
  ADD KEY `reports_reply_id_foreign` (`replyId`),
  ADD KEY `reports_group_id_foreign` (`groupId`),
  ADD KEY `reports_user_id_foreign` (`userId`),
  ADD KEY `reports_page_id_foreign` (`pageId`);

--
-- Indexes for table `subscribed_groups`
--
ALTER TABLE `subscribed_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriped_group_usesr_id_foreign` (`userId`),
  ADD KEY `subscriped_group_group_id_foreign` (`groupId`);

--
-- Indexes for table `systemadmins`
--
ALTER TABLE `systemadmins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `systemadmins_user_id_foreign` (`userId`),
  ADD KEY `systemadmins_page_id_foreign` (`pageId`),
  ADD KEY `systemadmins_group_id_foreign` (`groupId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_user_id_foreign` (`userId`),
  ADD KEY `videos_group_id_foreign` (`groupId`),
  ADD KEY `videos_post_id_foreign` (`postId`),
  ADD KEY `videos_comment_id_foreign` (`commentId`),
  ADD KEY `videos_page_id_foreign` (`pageId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `friendships`
--
ALTER TABLE `friendships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagesfollowing`
--
ALTER TABLE `pagesfollowing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `reacts`
--
ALTER TABLE `reacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribed_groups`
--
ALTER TABLE `subscribed_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemadmins`
--
ALTER TABLE `systemadmins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comment_post_id_foreign` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_usesr_id_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_follower_user_id` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `follows_following_user_id` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `friendships`
--
ALTER TABLE `friendships`
  ADD CONSTRAINT `friendships_user_one_id_foreign` FOREIGN KEY (`userOneId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friendships_user_two_id_foreign` FOREIGN KEY (`userTwoId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_creator_id` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_comment_id_foreign` FOREIGN KEY (`commentId`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `images_group_id_foreign` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `images_page_id_foreign` FOREIGN KEY (`pageId`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `images_post_id_foreign` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `images_user_id_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pagesfollowing`
--
ALTER TABLE `pagesfollowing`
  ADD CONSTRAINT `pagesfollowing_page_id_foreign` FOREIGN KEY (`pageId`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pagesfollowing_user_id_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_page_id_foreign` FOREIGN KEY (`pageId`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reacts`
--
ALTER TABLE `reacts`
  ADD CONSTRAINT `reacts_post_id_foreign` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reacts_user_id_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `reply_comment_id_foreign` FOREIGN KEY (`commentId`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reply_user_id_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_comment_id_foreign` FOREIGN KEY (`commentId`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_group_id_foreign` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_page_id_foreign` FOREIGN KEY (`pageId`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_post_id_foreign` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_reply_id_foreign` FOREIGN KEY (`replyId`) REFERENCES `replies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_reporter_id_foreign` FOREIGN KEY (`reporterId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_user_id_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subscribed_groups`
--
ALTER TABLE `subscribed_groups`
  ADD CONSTRAINT `subscriped_group_group_id_foreign` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `subscriped_group_usesr_id_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `systemadmins`
--
ALTER TABLE `systemadmins`
  ADD CONSTRAINT `systemadmins_group_id_foreign` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `systemadmins_page_id_foreign` FOREIGN KEY (`pageId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `systemadmins_user_id_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_comment_id_foreign` FOREIGN KEY (`commentId`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_group_id_foreign` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_page_id_foreign` FOREIGN KEY (`pageId`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_post_id_foreign` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_user_id_foreign` FOREIGN KEY (`userId`) REFERENCES `videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

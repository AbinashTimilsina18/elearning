-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2025 at 12:58 PM
-- Server version: 10.6.20-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoppycart`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add deal', 7, 'add_deal'),
(26, 'Can change deal', 7, 'change_deal'),
(27, 'Can delete deal', 7, 'delete_deal'),
(28, 'Can view deal', 7, 'view_deal'),
(29, 'Can add deals', 8, 'add_deals'),
(30, 'Can change deals', 8, 'change_deals'),
(31, 'Can delete deals', 8, 'delete_deals'),
(32, 'Can view deals', 8, 'view_deals'),
(33, 'Can add discount', 9, 'add_discount'),
(34, 'Can change discount', 9, 'change_discount'),
(35, 'Can delete discount', 9, 'delete_discount'),
(36, 'Can view discount', 9, 'view_discount'),
(37, 'Can add offer', 10, 'add_offer'),
(38, 'Can change offer', 10, 'change_offer'),
(39, 'Can delete offer', 10, 'delete_offer'),
(40, 'Can view offer', 10, 'view_offer'),
(41, 'Can add video', 11, 'add_video'),
(42, 'Can change video', 11, 'change_video'),
(43, 'Can delete video', 11, 'delete_video'),
(44, 'Can view video', 11, 'view_video'),
(45, 'Can add product', 12, 'add_product'),
(46, 'Can change product', 12, 'change_product'),
(47, 'Can delete product', 12, 'delete_product'),
(48, 'Can view product', 12, 'view_product'),
(49, 'Can add subscriber', 13, 'add_subscriber'),
(50, 'Can change subscriber', 13, 'change_subscriber'),
(51, 'Can delete subscriber', 13, 'delete_subscriber'),
(52, 'Can view subscriber', 13, 'view_subscriber'),
(53, 'Can add team', 14, 'add_team'),
(54, 'Can change team', 14, 'change_team'),
(55, 'Can delete team', 14, 'delete_team'),
(56, 'Can view team', 14, 'view_team'),
(57, 'Can add cart', 15, 'add_cart'),
(58, 'Can change cart', 15, 'change_cart'),
(59, 'Can delete cart', 15, 'delete_cart'),
(60, 'Can view cart', 15, 'view_cart'),
(61, 'Can add category', 16, 'add_category'),
(62, 'Can change category', 16, 'change_category'),
(63, 'Can delete category', 16, 'delete_category'),
(64, 'Can view category', 16, 'view_category'),
(65, 'Can add order', 17, 'add_order'),
(66, 'Can change order', 17, 'change_order'),
(67, 'Can delete order', 17, 'delete_order'),
(68, 'Can view order', 17, 'view_order'),
(69, 'Can add contact', 18, 'add_contact'),
(70, 'Can change contact', 18, 'change_contact'),
(71, 'Can delete contact', 18, 'delete_contact'),
(72, 'Can view contact', 18, 'view_contact');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$9XWUsfDP6RycMJVy1hK1d3$lFQmFk3CLN9H+W+0YiNw1vZYws38F/DtOGUtj7sLGyA=', '2025-03-12 13:33:21.384343', 1, 'Bibek', '', '', '', 1, 1, '2025-01-20 08:08:42.801992'),
(2, 'pbkdf2_sha256$870000$TRd7AOVsw05yGZeiJJywDp$OJIDmZwcWX9lT8RkH/C2RKv9zWF5wKUtUJ1lvSmxBBE=', '2025-03-12 13:32:17.623521', 0, 'Ram', '', '', '', 0, 1, '2025-02-01 15:25:35.355964');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-01-20 08:11:32.001022', '1', 'Deal object (1)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2025-01-20 08:13:30.789051', '1', 'Deal object (1)', 3, '', 7, 1),
(3, '2025-01-20 08:14:30.319620', '2', 'Deal object (2)', 1, '[{\"added\": {}}]', 7, 1),
(4, '2025-01-20 08:15:19.591709', '3', 'Deal object (3)', 1, '[{\"added\": {}}]', 7, 1),
(5, '2025-01-20 08:16:26.642784', '1', 'Deals object (1)', 1, '[{\"added\": {}}]', 8, 1),
(6, '2025-01-20 08:17:26.601562', '2', 'Deals object (2)', 1, '[{\"added\": {}}]', 8, 1),
(7, '2025-01-20 08:17:52.714299', '3', 'Deals object (3)', 1, '[{\"added\": {}}]', 8, 1),
(8, '2025-01-20 08:18:18.010537', '4', 'Deals object (4)', 1, '[{\"added\": {}}]', 8, 1),
(9, '2025-01-20 08:18:43.678840', '5', 'Deals object (5)', 1, '[{\"added\": {}}]', 8, 1),
(10, '2025-01-20 08:19:07.205160', '6', 'Deals object (6)', 1, '[{\"added\": {}}]', 8, 1),
(11, '2025-01-20 08:20:34.477951', '1', 'Discount object (1)', 1, '[{\"added\": {}}]', 9, 1),
(12, '2025-01-20 08:20:51.253402', '2', 'Discount object (2)', 1, '[{\"added\": {}}]', 9, 1),
(13, '2025-01-20 08:21:13.690996', '3', 'Discount object (3)', 1, '[{\"added\": {}}]', 9, 1),
(14, '2025-01-20 08:21:36.281561', '4', 'Discount object (4)', 1, '[{\"added\": {}}]', 9, 1),
(15, '2025-01-20 08:21:58.529385', '5', 'Discount object (5)', 1, '[{\"added\": {}}]', 9, 1),
(16, '2025-01-20 08:22:18.196412', '6', 'Discount object (6)', 1, '[{\"added\": {}}]', 9, 1),
(17, '2025-01-20 08:23:47.421960', '1', 'Offer object (1)', 1, '[{\"added\": {}}]', 10, 1),
(18, '2025-01-20 08:24:12.571106', '2', 'Offer object (2)', 1, '[{\"added\": {}}]', 10, 1),
(19, '2025-01-20 08:24:32.574873', '3', 'Offer object (3)', 1, '[{\"added\": {}}]', 10, 1),
(20, '2025-01-20 08:24:59.503265', '4', 'Offer object (4)', 1, '[{\"added\": {}}]', 10, 1),
(21, '2025-01-20 08:25:26.498459', '5', 'Offer object (5)', 1, '[{\"added\": {}}]', 10, 1),
(22, '2025-01-20 08:25:46.574201', '6', 'Offer object (6)', 1, '[{\"added\": {}}]', 10, 1),
(23, '2025-01-20 11:02:55.835451', '1', 'Video object (1)', 1, '[{\"added\": {}}]', 11, 1),
(24, '2025-01-20 11:18:28.267246', '1', 'Product object (1)', 1, '[{\"added\": {}}]', 12, 1),
(25, '2025-01-20 11:22:07.486043', '2', 'Product object (2)', 1, '[{\"added\": {}}]', 12, 1),
(26, '2025-01-20 11:22:50.337403', '3', 'Product object (3)', 1, '[{\"added\": {}}]', 12, 1),
(27, '2025-01-20 11:23:28.276338', '4', 'Product object (4)', 1, '[{\"added\": {}}]', 12, 1),
(28, '2025-01-20 13:56:00.608922', '1', 'Video object (1)', 2, '[{\"changed\": {\"fields\": [\"Video\"]}}]', 11, 1),
(29, '2025-01-20 13:57:51.018503', '1', 'Video object (1)', 2, '[{\"changed\": {\"fields\": [\"Video\"]}}]', 11, 1),
(30, '2025-01-20 15:32:18.622769', '1', 'Subscriber object (1)', 3, '', 13, 1),
(31, '2025-01-20 16:11:49.026441', '2', 'Subscriber object (2)', 3, '', 13, 1),
(32, '2025-01-20 16:11:55.091261', '3', 'Subscriber object (3)', 3, '', 13, 1),
(33, '2025-01-21 13:33:17.345649', '1', 'Walter White', 1, '[{\"added\": {}}]', 14, 1),
(34, '2025-01-21 13:34:17.515700', '2', 'Sarah Jhonson', 1, '[{\"added\": {}}]', 14, 1),
(35, '2025-01-21 13:35:18.122402', '3', 'William Anderson', 1, '[{\"added\": {}}]', 14, 1),
(36, '2025-01-21 13:39:09.407425', '1', 'Walter White', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 14, 1),
(37, '2025-01-23 08:16:05.079457', '5', 'Product object (5)', 1, '[{\"added\": {}}]', 12, 1),
(38, '2025-01-23 08:17:08.265429', '6', 'Product object (6)', 1, '[{\"added\": {}}]', 12, 1),
(39, '2025-01-23 08:17:52.552990', '7', 'Product object (7)', 1, '[{\"added\": {}}]', 12, 1),
(40, '2025-01-23 08:18:26.836282', '8', 'Product object (8)', 1, '[{\"added\": {}}]', 12, 1),
(41, '2025-01-23 08:19:02.293509', '9', 'Product object (9)', 1, '[{\"added\": {}}]', 12, 1),
(42, '2025-01-23 08:23:46.821886', '1', 'Product object (1)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 12, 1),
(43, '2025-01-23 08:23:54.134443', '2', 'Product object (2)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 12, 1),
(44, '2025-01-23 08:24:00.451817', '3', 'Product object (3)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 12, 1),
(45, '2025-01-23 08:24:06.728806', '4', 'Product object (4)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 12, 1),
(46, '2025-01-26 07:32:16.965278', '5', 'Product object (5)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 12, 1),
(47, '2025-01-26 07:34:32.156564', '1', 'Product object (1)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 12, 1),
(48, '2025-01-26 07:35:05.531073', '2', 'Product object (2)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 12, 1),
(49, '2025-01-26 07:36:09.378390', '3', 'Product object (3)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 12, 1),
(50, '2025-01-26 07:36:53.631573', '4', 'Product object (4)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 12, 1),
(51, '2025-01-26 07:38:44.280016', '6', 'Product object (6)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 12, 1),
(52, '2025-01-26 07:39:12.364874', '7', 'Product object (7)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 12, 1),
(53, '2025-01-26 07:39:56.138590', '8', 'Product object (8)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 12, 1),
(54, '2025-01-26 07:41:00.136276', '9', 'Product object (9)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 12, 1),
(55, '2025-01-26 09:23:01.062068', '1', 'Deals object (1)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 8, 1),
(56, '2025-01-26 09:28:44.293266', '2', 'Deals object (2)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 8, 1),
(57, '2025-01-26 09:29:02.729945', '3', 'Deals object (3)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 8, 1),
(58, '2025-01-26 09:29:16.727274', '4', 'Deals object (4)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 8, 1),
(59, '2025-01-26 09:29:28.270400', '5', 'Deals object (5)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 8, 1),
(60, '2025-01-26 09:29:44.129728', '6', 'Deals object (6)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 8, 1),
(61, '2025-01-26 10:09:52.631717', '1', 'Discount object (1)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 9, 1),
(62, '2025-01-26 10:10:03.496024', '2', 'Discount object (2)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 9, 1),
(63, '2025-01-26 10:10:12.182053', '3', 'Discount object (3)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 9, 1),
(64, '2025-01-26 10:10:22.362599', '3', 'Discount object (3)', 2, '[]', 9, 1),
(65, '2025-01-26 10:10:33.855058', '4', 'Discount object (4)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 9, 1),
(66, '2025-01-26 10:10:46.094273', '5', 'Discount object (5)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 9, 1),
(67, '2025-01-26 10:10:55.330570', '6', 'Discount object (6)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 9, 1),
(68, '2025-01-26 11:24:21.605892', '1', 'Offer object (1)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 10, 1),
(69, '2025-01-26 11:24:39.749162', '2', 'Offer object (2)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 10, 1),
(70, '2025-01-26 11:24:58.195131', '3', 'Offer object (3)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 10, 1),
(71, '2025-01-26 11:25:11.585391', '4', 'Offer object (4)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 10, 1),
(72, '2025-01-26 11:25:25.440659', '6', 'Offer object (6)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 10, 1),
(73, '2025-01-26 11:26:14.476214', '5', 'Offer object (5)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Price\"]}}]', 10, 1),
(74, '2025-01-26 11:33:13.918228', '1', 'Deals object (1)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 8, 1),
(75, '2025-01-26 11:33:19.603675', '2', 'Deals object (2)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 8, 1),
(76, '2025-01-26 11:33:26.739809', '3', 'Deals object (3)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 8, 1),
(77, '2025-01-26 11:33:33.730493', '4', 'Deals object (4)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 8, 1),
(78, '2025-01-26 11:33:42.446264', '4', 'Deals object (4)', 2, '[]', 8, 1),
(79, '2025-01-26 11:33:47.956864', '5', 'Deals object (5)', 2, '[]', 8, 1),
(80, '2025-01-26 11:33:55.805039', '5', 'Deals object (5)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 8, 1),
(81, '2025-01-26 11:34:02.821883', '6', 'Deals object (6)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 8, 1),
(82, '2025-01-26 11:36:25.456316', '1', 'Discount object (1)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 9, 1),
(83, '2025-01-26 11:36:30.785433', '2', 'Discount object (2)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 9, 1),
(84, '2025-01-26 11:36:37.158408', '3', 'Discount object (3)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 9, 1),
(85, '2025-01-26 11:36:42.721823', '4', 'Discount object (4)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 9, 1),
(86, '2025-01-26 11:36:46.730126', '4', 'Discount object (4)', 2, '[]', 9, 1),
(87, '2025-01-26 11:36:51.742829', '5', 'Discount object (5)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 9, 1),
(88, '2025-01-26 11:36:57.217756', '6', 'Discount object (6)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 9, 1),
(89, '2025-01-26 11:37:21.698049', '1', 'Offer object (1)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 10, 1),
(90, '2025-01-26 11:37:27.537286', '2', 'Offer object (2)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 10, 1),
(91, '2025-01-26 11:37:33.105966', '3', 'Offer object (3)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 10, 1),
(92, '2025-01-26 11:37:38.414886', '4', 'Offer object (4)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 10, 1),
(93, '2025-01-26 11:37:53.051714', '5', 'Offer object (5)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 10, 1),
(94, '2025-01-26 11:38:05.911934', '6', 'Offer object (6)', 2, '[{\"changed\": {\"fields\": [\"Trending\"]}}]', 10, 1),
(95, '2025-01-28 08:13:59.303556', '10', 'Product object (10)', 1, '[{\"added\": {}}]', 12, 1),
(96, '2025-01-28 08:17:38.417267', '11', 'Product object (11)', 1, '[{\"added\": {}}]', 12, 1),
(97, '2025-01-28 08:20:17.912638', '12', 'Product object (12)', 1, '[{\"added\": {}}]', 12, 1),
(98, '2025-01-28 08:21:02.560982', '13', 'Product object (13)', 1, '[{\"added\": {}}]', 12, 1),
(99, '2025-01-28 08:21:45.885828', '14', 'Product object (14)', 1, '[{\"added\": {}}]', 12, 1),
(100, '2025-01-28 08:22:39.257640', '15', 'Product object (15)', 1, '[{\"added\": {}}]', 12, 1),
(101, '2025-01-28 08:23:00.859464', '15', 'Product object (15)', 2, '[]', 12, 1),
(102, '2025-01-28 08:30:28.884115', '16', 'Product object (16)', 1, '[{\"added\": {}}]', 12, 1),
(103, '2025-01-28 08:34:38.065541', '17', 'Product object (17)', 1, '[{\"added\": {}}]', 12, 1),
(104, '2025-01-28 08:38:24.381590', '18', 'Product object (18)', 1, '[{\"added\": {}}]', 12, 1),
(105, '2025-01-28 08:45:40.472519', '18', 'Product object (18)', 2, '[{\"changed\": {\"fields\": [\"Discount\"]}}]', 12, 1),
(106, '2025-01-28 08:46:17.456560', '19', 'Product object (19)', 1, '[{\"added\": {}}]', 12, 1),
(107, '2025-01-28 08:47:05.473273', '20', 'Product object (20)', 1, '[{\"added\": {}}]', 12, 1),
(108, '2025-01-28 08:48:36.892624', '21', 'Product object (21)', 1, '[{\"added\": {}}]', 12, 1),
(109, '2025-01-28 08:49:34.859338', '22', 'Product object (22)', 1, '[{\"added\": {}}]', 12, 1),
(110, '2025-01-28 08:50:33.703787', '23', 'Product object (23)', 1, '[{\"added\": {}}]', 12, 1),
(111, '2025-01-28 08:51:13.576263', '24', 'Product object (24)', 1, '[{\"added\": {}}]', 12, 1),
(112, '2025-01-28 08:52:32.654503', '25', 'Product object (25)', 1, '[{\"added\": {}}]', 12, 1),
(113, '2025-01-28 08:53:25.485187', '26', 'Product object (26)', 1, '[{\"added\": {}}]', 12, 1),
(114, '2025-01-28 08:54:52.285420', '17', 'Product object (17)', 2, '[{\"changed\": {\"fields\": [\"Offer\"]}}]', 12, 1),
(115, '2025-01-28 09:05:31.944717', '12', 'Cart object (12)', 2, '[{\"changed\": {\"fields\": [\"Products\"]}}]', 15, 1),
(116, '2025-01-28 09:32:45.232739', '1', 'Men\'s Product', 1, '[{\"added\": {}}]', 16, 1),
(117, '2025-01-28 09:33:36.553735', '1', 'Mens Product', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 16, 1),
(118, '2025-01-28 09:33:58.297253', '1', 'Product object (1)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(119, '2025-02-01 13:23:01.521089', '2', 'Bibek - Checkered Casual Shirt', 2, '[]', 17, 1),
(120, '2025-02-01 14:44:42.287057', '6', 'ajay', 3, '', 18, 1),
(121, '2025-02-01 14:44:46.084961', '5', 'ram', 3, '', 18, 1),
(122, '2025-02-01 14:44:51.014902', '4', 'ram', 3, '', 18, 1),
(123, '2025-02-01 14:44:57.339894', '3', 'ram', 3, '', 18, 1),
(124, '2025-02-01 14:45:02.386475', '2', 'ram', 3, '', 18, 1),
(125, '2025-02-01 14:45:06.722334', '1', 'ram', 3, '', 18, 1),
(126, '2025-02-01 15:04:32.196861', '7', 'ajay', 3, '', 18, 1),
(127, '2025-02-01 15:25:36.638656', '2', 'Ram', 1, '[{\"added\": {}}]', 4, 1),
(128, '2025-03-10 12:34:47.187725', '2', 'Womens Wear', 1, '[{\"added\": {}}]', 16, 1),
(129, '2025-03-10 12:35:43.523578', '3', 'Office', 1, '[{\"added\": {}}]', 16, 1),
(130, '2025-03-10 12:37:32.567381', '4', 'Other', 1, '[{\"added\": {}}]', 16, 1),
(131, '2025-03-10 12:39:45.269510', '26', 'Product object (26)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(132, '2025-03-10 12:57:46.202418', '3', 'Kids', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]', 16, 1),
(133, '2025-03-10 12:58:12.743055', '25', 'Product object (25)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(134, '2025-03-10 12:58:39.382540', '24', 'Product object (24)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(135, '2025-03-10 12:58:48.510535', '23', 'Product object (23)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(136, '2025-03-10 12:59:04.963597', '22', 'Product object (22)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(137, '2025-03-10 12:59:18.380579', '21', 'Product object (21)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(138, '2025-03-10 12:59:52.552339', '20', 'Product object (20)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(139, '2025-03-10 13:00:13.097803', '19', 'Product object (19)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(140, '2025-03-10 13:02:10.210297', '1', 'Product object (1)', 2, '[]', 12, 1),
(141, '2025-03-10 13:05:17.591129', '1', 'Mens', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 16, 1),
(142, '2025-03-10 13:05:29.051689', '2', 'Womens', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 16, 1),
(143, '2025-03-10 13:06:10.749748', '2', 'Product object (2)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(144, '2025-03-10 13:06:22.816695', '3', 'Product object (3)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(145, '2025-03-10 13:06:37.375807', '4', 'Product object (4)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(146, '2025-03-10 13:07:21.644089', '5', 'Product object (5)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(147, '2025-03-10 13:07:33.321118', '6', 'Product object (6)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(148, '2025-03-10 13:07:46.962273', '7', 'Product object (7)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(149, '2025-03-10 13:07:59.793610', '8', 'Product object (8)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(150, '2025-03-10 13:08:53.505774', '9', 'Product object (9)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(151, '2025-03-10 13:09:03.961643', '10', 'Product object (10)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(152, '2025-03-10 13:09:28.911855', '11', 'Product object (11)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(153, '2025-03-10 13:09:37.317562', '12', 'Product object (12)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(154, '2025-03-10 13:09:49.973834', '13', 'Product object (13)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(155, '2025-03-10 13:10:25.324348', '13', 'Product object (13)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(156, '2025-03-10 13:10:36.381296', '14', 'Product object (14)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(157, '2025-03-10 13:10:50.771772', '15', 'Product object (15)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(158, '2025-03-10 13:11:00.596011', '16', 'Product object (16)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(159, '2025-03-10 13:11:13.458106', '17', 'Product object (17)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(160, '2025-03-10 13:11:25.872869', '18', 'Product object (18)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(161, '2025-03-10 13:11:41.715234', '19', 'Product object (19)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(162, '2025-03-10 13:12:04.410435', '21', 'Product object (21)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(163, '2025-03-10 13:12:43.299933', '14', 'Product object (14)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(164, '2025-03-10 13:13:26.752504', '14', 'Product object (14)', 2, '[]', 12, 1),
(165, '2025-03-10 13:14:10.353806', '14', 'Product object (14)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(166, '2025-03-10 13:14:41.927111', '14', 'Product object (14)', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 12, 1),
(167, '2025-03-10 13:42:18.010068', '9', 'Bibek', 3, '', 18, 1),
(168, '2025-03-10 13:42:18.010165', '8', 'Bibek', 3, '', 18, 1),
(169, '2025-03-10 13:42:26.576253', '11', 'Bibek', 3, '', 18, 1),
(170, '2025-03-10 13:42:26.576347', '10', 'Ram', 3, '', 18, 1),
(171, '2025-03-10 13:47:14.897554', '12', 'Bibek', 3, '', 18, 1),
(172, '2025-03-10 13:49:42.961966', '13', 'Bibek', 1, '[{\"added\": {}}]', 18, 1),
(173, '2025-03-10 13:56:24.311802', '13', 'Bibek', 2, '[]', 18, 1),
(174, '2025-03-10 14:00:18.866229', '14', 'Bibek', 1, '[{\"added\": {}}]', 18, 1),
(175, '2025-03-12 13:34:55.016565', '9', 'Subscriber object (9)', 3, '', 13, 1),
(176, '2025-03-12 13:34:55.016621', '8', 'Subscriber object (8)', 3, '', 13, 1),
(177, '2025-03-12 13:34:55.016647', '7', 'Subscriber object (7)', 3, '', 13, 1),
(178, '2025-03-12 13:34:55.016671', '6', 'Subscriber object (6)', 3, '', 13, 1),
(179, '2025-03-12 13:34:55.016693', '5', 'Subscriber object (5)', 3, '', 13, 1),
(180, '2025-03-12 13:34:55.016715', '4', 'Subscriber object (4)', 3, '', 13, 1),
(181, '2025-03-12 13:35:04.312417', '17', 'Bibek', 3, '', 18, 1),
(182, '2025-03-12 13:35:04.312448', '16', 'Bibek', 3, '', 18, 1),
(183, '2025-03-12 13:35:04.312464', '15', 'Ram', 3, '', 18, 1),
(184, '2025-03-12 13:35:04.312477', '14', 'Bibek', 3, '', 18, 1),
(185, '2025-03-12 13:35:04.312488', '13', 'Bibek', 3, '', 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(16, 'products', 'category'),
(7, 'products', 'deal'),
(8, 'products', 'deals'),
(9, 'products', 'discount'),
(10, 'products', 'offer'),
(12, 'products', 'product'),
(13, 'products', 'subscriber'),
(11, 'products', 'video'),
(6, 'sessions', 'session'),
(15, 'userpage', 'cart'),
(18, 'userpage', 'contact'),
(17, 'userpage', 'order'),
(14, 'userpage', 'team');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-01-20 08:07:20.003561'),
(2, 'auth', '0001_initial', '2025-01-20 08:07:20.336245'),
(3, 'admin', '0001_initial', '2025-01-20 08:07:20.428381'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-01-20 08:07:20.434487'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-01-20 08:07:20.442722'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-01-20 08:07:20.499100'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-01-20 08:07:20.536736'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-01-20 08:07:20.558538'),
(9, 'auth', '0004_alter_user_username_opts', '2025-01-20 08:07:20.566151'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-01-20 08:07:20.602721'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-01-20 08:07:20.604542'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-01-20 08:07:20.611246'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-01-20 08:07:20.631072'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-01-20 08:07:20.649807'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-01-20 08:07:20.669194'),
(16, 'auth', '0011_update_proxy_permissions', '2025-01-20 08:07:20.679389'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-01-20 08:07:20.698489'),
(18, 'products', '0001_initial', '2025-01-20 08:07:20.715610'),
(19, 'products', '0002_deal_name', '2025-01-20 08:07:20.731393'),
(20, 'products', '0003_deals', '2025-01-20 08:07:20.743905'),
(21, 'products', '0004_discount', '2025-01-20 08:07:20.756002'),
(22, 'products', '0005_alter_deals_description', '2025-01-20 08:07:20.783667'),
(23, 'products', '0006_offer', '2025-01-20 08:07:20.794998'),
(24, 'sessions', '0001_initial', '2025-01-20 08:07:20.820787'),
(25, 'products', '0007_remove_deal_name', '2025-01-20 08:11:21.970466'),
(26, 'products', '0008_deal_name', '2025-01-20 08:13:14.324110'),
(27, 'products', '0009_video', '2025-01-20 11:00:10.824775'),
(28, 'products', '0010_product', '2025-01-20 11:10:03.901237'),
(29, 'products', '0011_subscriber', '2025-01-20 11:40:10.087877'),
(30, 'products', '0012_rename_subscriber_subscription', '2025-01-20 13:06:46.047747'),
(31, 'products', '0013_delete_subscription', '2025-01-20 13:06:46.063892'),
(32, 'products', '0014_product_description', '2025-01-20 13:06:46.065562'),
(33, 'products', '0015_subscriber', '2025-01-20 13:06:46.066856'),
(34, 'products', '0016_delete_subscriber_remove_product_description', '2025-01-20 13:06:46.068106'),
(35, 'products', '0017_subscriber', '2025-01-20 13:13:44.691327'),
(36, 'products', '0018_delete_subscriber_video_video', '2025-01-20 13:53:36.311304'),
(37, 'products', '0019_subscriber', '2025-01-20 15:05:48.732728'),
(38, 'userpage', '0001_initial', '2025-01-21 13:26:03.201837'),
(39, 'products', '0020_product_trending', '2025-01-23 08:23:09.513751'),
(40, 'products', '0021_product_description', '2025-01-26 07:30:48.702523'),
(41, 'products', '0022_deals_name_deals_price', '2025-01-26 09:21:32.725206'),
(42, 'products', '0023_discount_name_discount_price_discount_trending', '2025-01-26 10:09:27.360451'),
(43, 'products', '0024_deals_trending', '2025-01-26 10:30:09.866537'),
(44, 'products', '0025_offer_name_offer_price_offer_trending', '2025-01-26 10:31:20.447267'),
(45, 'userpage', '0002_cart', '2025-01-28 06:54:49.044322'),
(46, 'products', '0026_alter_product_dprice', '2025-01-28 08:00:24.619431'),
(47, 'products', '0027_delete_deals_delete_discount_delete_offer_and_more', '2025-01-28 08:06:26.211374'),
(48, 'products', '0028_alter_product_dprice', '2025-01-28 08:13:48.359186'),
(49, 'products', '0029_category', '2025-01-28 09:22:58.307517'),
(50, 'products', '0030_product_category', '2025-01-28 09:23:40.776197'),
(51, 'userpage', '0003_order', '2025-01-28 10:03:24.935825'),
(52, 'userpage', '0004_contact', '2025-02-01 14:08:00.584335'),
(53, 'userpage', '0005_contact_created_at', '2025-02-01 14:14:59.152327'),
(54, 'userpage', '0006_contact_user', '2025-02-01 14:40:30.403226'),
(55, 'userpage', '0007_alter_contact_phone_number', '2025-03-10 13:49:33.662937');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7kua3djok4hhr8rsp3tpd5avh0cuj0l1', '.eJxVjDsOwjAQBe_iGlneteMPJX3OYPm3OIAcKU4qxN2RpRTQvpl5b-bDsVd_9LL5JbMrA3b53WJIz9IGyI_Q7itPa9u3JfKh8JN2Pq-5vG6n-3dQQ6-jRhkUgDAFAJGKUJN2ZLNKk8yILluQMVrSBEhCS2sgQnCGUBRMpNjnC8HFNzQ:1tsMD3:0CNdxGcVJT_QWEwO-8MavXC6DPtS5hF05_ccF12z8EI', '2025-03-26 13:33:21.387895'),
('8u45xjeo86a6jjbsa7x15e347g5xpk29', '.eJxVjDsOwjAQBe_iGlneteMPJX3OYPm3OIAcKU4qxN2RpRTQvpl5b-bDsVd_9LL5JbMrA3b53WJIz9IGyI_Q7itPa9u3JfKh8JN2Pq-5vG6n-3dQQ6-jRhkUgDAFAJGKUJN2ZLNKk8yILluQMVrSBEhCS2sgQnCGUBRMpNjnC8HFNzQ:1tZmqM:AyKAnIUHCRifpaZn4KR-kFSB2bvGpyCSHGbQP-rgPT8', '2025-02-03 08:09:10.646327'),
('avtjfjvo5ewxxppo78bqdktmu77inw78', '.eJxVjDsOwjAQBe_iGlneteMPJX3OYPm3OIAcKU4qxN2RpRTQvpl5b-bDsVd_9LL5JbMrA3b53WJIz9IGyI_Q7itPa9u3JfKh8JN2Pq-5vG6n-3dQQ6-jRhkUgDAFAJGKUJN2ZLNKk8yILluQMVrSBEhCS2sgQnCGUBRMpNjnC8HFNzQ:1tbx7f:qUBAXFCBXcEGf4wvqyJ4d77x4clnaRZu64dTxCOoTQ4', '2025-02-09 07:31:59.664498'),
('h4tjmjclyhh9rm3o1gdw9n131vo3xxkm', '.eJxVjDsOwjAQBe_iGlneteMPJX3OYPm3OIAcKU4qxN2RpRTQvpl5b-bDsVd_9LL5JbMrA3b53WJIz9IGyI_Q7itPa9u3JfKh8JN2Pq-5vG6n-3dQQ6-jRhkUgDAFAJGKUJN2ZLNKk8yILluQMVrSBEhCS2sgQnCGUBRMpNjnC8HFNzQ:1taEAa:iXHWkJMOKLV9ACGDhUr5rK5f96sL_RgKrMFbH-nQFWw', '2025-02-04 13:19:52.962469'),
('x8wjkcgthh6qzja1sv28ac99v1mqzwa4', '.eJxVjDsOwjAQBe_iGlneteMPJX3OYPm3OIAcKU4qxN2RpRTQvpl5b-bDsVd_9LL5JbMrA3b53WJIz9IGyI_Q7itPa9u3JfKh8JN2Pq-5vG6n-3dQQ6-jRhkUgDAFAJGKUJN2ZLNKk8yILluQMVrSBEhCS2sgQnCGUBRMpNjnC8HFNzQ:1taEAd:4Fz21oYxlR-UfZaPLs5_zefwpn_ek9FN0PK-_0LvfUs', '2025-02-04 13:19:55.691277'),
('x9rlukov3kdw9fpvgswwxe7irqv6rjhp', '.eJxVjDsOwjAQBe_iGlneteMPJX3OYPm3OIAcKU4qxN2RpRTQvpl5b-bDsVd_9LL5JbMrA3b53WJIz9IGyI_Q7itPa9u3JfKh8JN2Pq-5vG6n-3dQQ6-jRhkUgDAFAJGKUJN2ZLNKk8yILluQMVrSBEhCS2sgQnCGUBRMpNjnC8HFNzQ:1trpKN:JNG0d76Y5XVH3Pvf_-uqDUjdndQ3JOP4IaoAXvWhg0A', '2025-03-25 02:26:43.349705');

-- --------------------------------------------------------

--
-- Table structure for table `products_category`
--

CREATE TABLE `products_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_category`
--

INSERT INTO `products_category` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Mens', '', '2025-01-28 09:32:45.231752'),
(2, 'Womens', 'This is women Category', '2025-03-10 12:34:47.186449'),
(3, 'Kids', 'This is Kids Category', '2025-03-10 12:35:43.522245'),
(4, 'Other', 'This is Other Category', '2025-03-10 12:37:32.566189');

-- --------------------------------------------------------

--
-- Table structure for table `products_deal`
--

CREATE TABLE `products_deal` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_deal`
--

INSERT INTO `products_deal` (`id`, `image`, `description`, `name`) VALUES
(2, 'static/uploads/banner5_WOxWkJv.jpg', 'Platform Velvet', 'Sandals'),
(3, 'static/uploads/banner4_3rqaQMP.jpg', 'Pebbled Weekend', 'Bag');

-- --------------------------------------------------------

--
-- Table structure for table `products_product`
--

CREATE TABLE `products_product` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `dprice` decimal(10,2) DEFAULT NULL,
  `oprice` decimal(10,2) NOT NULL,
  `trending` tinyint(1) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `deal` tinyint(1) DEFAULT NULL,
  `discount` tinyint(1) DEFAULT NULL,
  `offer` tinyint(1) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_product`
--

INSERT INTO `products_product` (`id`, `image`, `name`, `dprice`, `oprice`, `trending`, `description`, `deal`, `discount`, `offer`, `category_id`) VALUES
(1, 'static/uploads/shop-1.jpg', 'Checkered Casual Shirt', 975.00, 899.99, 1, 'A checkered casual shirt is a classic, laid-back wardrobe essential. Featuring a timeless plaid or gingham pattern, it’s perfect for creating a relaxed, effortless look. Made from soft fabrics like cotton or flannel, it offers comfort and breathability, ideal for everyday wear. Whether worn buttoned up or open over a tee, it pairs well with jeans, chinos, or shorts, making it a versatile option for both casual outings and weekend adventures.', 0, 0, 0, 1),
(2, 'static/uploads/shop-2.jpg', 'Cotton Flared Kurta', 775.00, 599.99, 1, 'A cotton flared kurta is a breezy, comfortable traditional garment, perfect for casual or semi-formal occasions. Made from soft, breathable cotton, it features a relaxed fit with a flared silhouette that provides both style and ease of movement. With intricate patterns, embroidery, or solid colors, this kurta can be dressed up with accessories or paired with leggings or trousers for a chic, everyday look. Ideal for warm weather or layering during cooler seasons.', 0, 0, 0, 2),
(3, 'static/uploads/shop-3.jpg', 'Men Casual Shirt', 875.00, 799.99, 1, 'A men’s casual shirt is a versatile wardrobe staple, designed for everyday wear. Typically made from comfortable fabrics like cotton, linen, or blends, it comes in a variety of patterns, colors, and styles—from solid tones to checks or stripes. Whether it\'s a button-down, short-sleeve, or long-sleeve design, this shirt pairs well with jeans, chinos, or shorts, offering a laid-back yet polished look for casual outings, weekends, or relaxed office days.', 0, 0, 0, 1),
(4, 'static/uploads/shop-4.jpg', 'Blend Straight Kurta', 475.00, 399.99, 1, 'A blend straight kurta is a modern twist on traditional attire, offering comfort and style. Made from a fabric blend, it combines the softness of cotton with durability and easy maintenance. Featuring a straight cut, it offers a relaxed, clean silhouette that’s both flattering and versatile. Perfect for casual outings, family gatherings, or festive occasions, this kurta pairs well with trousers, jeans, or churidars, making it a great option for a contemporary yet traditional look.', 0, 0, 0, 2),
(5, 'static/uploads/shop-5.jpg', 'Women Maroon Top', 575.00, 299.99, 0, 'A women’s maroon top is a stylish, versatile piece that adds a pop of rich color to any wardrobe. It can range from casual to semi-formal styles, offering options like short sleeves, long sleeves, or sleeveless designs. Made from various fabrics such as cotton, silk, or jersey, it’s perfect for layering or wearing alone, and pairs well with jeans, skirts, or trousers. Ideal for both day-to-day wear or dressed up for an evening out.', 0, 0, 0, 2),
(6, 'static/uploads/shop-6.jpg', 'Pink Shirt', 775.00, 699.99, 0, 'A pink shirt is a stylish and refreshing wardrobe piece that adds a pop of color to any outfit. Available in various shades, from soft pastel pinks to vibrant fuchsias, it can be dressed up or down depending on the occasion. Made from breathable fabrics like cotton or linen, it\'s comfortable and versatile, perfect for both casual outings and semi-formal events. Pair it with jeans, chinos, or skirts for an effortless yet chic look.', 0, 0, 0, 1),
(7, 'static/uploads/shop-7.jpg', 'Dark Blue Top', 675.00, 599.99, 0, 'A dark blue top is a timeless and versatile piece, perfect for any wardrobe. Its deep, rich hue adds sophistication and pairs easily with a variety of bottoms, from jeans to skirts. Whether it\'s a simple tee, blouse, or knit, the dark blue color makes it ideal for both casual and semi-formal looks. Made from comfortable fabrics like cotton, jersey, or silk, it\'s a go-to option for effortless style in any season.', 0, 0, 0, 2),
(8, 'static/uploads/shop-8.jpg', 'White T-Shirt', 675.00, 599.99, 0, 'A white t-shirt is a timeless and essential wardrobe staple, offering a clean, simple look that pairs with almost anything. Made from soft, breathable materials like cotton, it’s perfect for layering or wearing on its own. Whether it’s a classic crew neck, v-neck, or oversized style, a white t-shirt can be dressed up with accessories or kept casual with jeans or shorts. Its versatility makes it ideal for daily wear, casual outings, or even as a base layer for more polished looks.', 0, 0, 0, 1),
(9, 'static/uploads/shop-9.jpg', 'Pink Bag', 675.00, 599.99, 0, 'A pink bag adds a fun, vibrant pop of color to any outfit. Whether it’s a chic handbag, a trendy crossbody, or a casual tote, the pink shade brings a playful and feminine touch. Made from a variety of materials like leather, canvas, or synthetic fabrics, it offers both style and practicality. Perfect for day-to-day use, it can easily hold your essentials while complementing both casual and dressy looks.', 0, 0, 0, 2),
(10, 'static/uploads/d1_IJfW6Gi.jpg', 'Formal Wear', NULL, 100.00, 0, 'Min. 40% Off on Formal Wear', 1, 0, 0, 1),
(11, 'static/uploads/d2_xiqQTHG.jpg', 'Active Wear', NULL, 50.00, 0, 'Min. 60% Off on Active Wear', 1, 0, 0, 1),
(12, 'static/uploads/d3_PO2Rw9I.jpg', 'Shoes', NULL, 100.00, 0, 'Min. 40% Off on Shoes', 1, 0, 0, 1),
(13, 'static/uploads/d4_nJVuqjN.jpg', 'Shirts', NULL, 50.00, 0, 'Min. 50% Off on Shirts', 1, 0, 0, 2),
(14, 'static/uploads/d5_oIz8RSk.jpg', 'Clothing', NULL, 80.00, 0, 'Min. 50% Off on Clothing', 1, 0, 0, 2),
(15, 'static/uploads/d6_cJdxOlb.jpg', 'Sandles', NULL, 100.00, 0, 'Min. 60% Off on Sandles', 1, 0, 0, 2),
(16, 'static/uploads/dis1_0pmDsz7.jpg', 'Swings', NULL, 200.00, 0, 'Min. 40% Off on Swings', 0, 1, 0, 4),
(17, 'static/uploads/dis2_N9vRfUc.jpg', 'Office Chairs', NULL, 150.00, 0, 'Min. 30% Off on Office Chairs', 0, 1, 1, 4),
(18, 'static/uploads/dis3_iOZvc9e.jpg', 'Glass Mirror', NULL, 200.00, 0, 'Min. 40% Off on Glass Mirror', 0, 1, 0, 4),
(19, 'static/uploads/dis4_urgcsdo.jpg', 'Makeup Kit', NULL, 200.00, 0, 'Min. 50% Off on Makeup Kit', 0, 1, 0, 2),
(20, 'static/uploads/dis5_ivjnePe.jpg', 'Handbgs', NULL, 100.00, 0, 'Min. 60% Off on Handbgs', 0, 1, 0, 2),
(21, 'static/uploads/dis6_WOZWowe.jpg', 'Perfumes', NULL, 50.00, 0, 'Min. 40% Off on Perfumes', 0, 1, 0, 4),
(22, 'static/uploads/o1_oB4tH4P.jpg', 'Kids Wear', NULL, 150.00, 0, '40% Off on Kids Wear', 0, 0, 1, 3),
(23, 'static/uploads/o2_gign8Dc.jpg', 'Face Packs', NULL, 30.00, 0, 'Min. 30% Off on Face Packs', 0, 0, 1, 4),
(24, 'static/uploads/o3_AYxxPpW.jpg', 'Women Heels', NULL, 80.00, 0, 'Min. 30% Off on Women Heels', 0, 0, 1, 2),
(25, 'static/uploads/o4_ru2eVxy.jpg', 'Baby Toys', NULL, 100.00, 0, 'Min. 40% Off on Baby Toys', 0, 0, 1, 3),
(26, 'static/uploads/o5_l4bHRVt.jpg', 'Herbal Products', NULL, 150.00, 0, 'Min. 60% Off on Herbal Products', 0, 0, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `products_subscriber`
--

CREATE TABLE `products_subscriber` (
  `id` bigint(20) NOT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_video`
--

CREATE TABLE `products_video` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `video` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_video`
--

INSERT INTO `products_video` (`id`, `image`, `description`, `video`) VALUES
(1, 'static/uploads/banner5_TUePcMe.jpg', 'Pre-Fall Collection,That mid-summer\r\ncraving for fall styles?', 'https://www.pexels.com/video/a-woman-working-on-an-electronic-tablet-2675511/');

-- --------------------------------------------------------

--
-- Table structure for table `userpage_cart`
--

CREATE TABLE `userpage_cart` (
  `id` bigint(20) NOT NULL,
  `products_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userpage_cart`
--

INSERT INTO `userpage_cart` (`id`, `products_id`, `user_id`) VALUES
(29, 4, 1),
(30, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userpage_contact`
--

CREATE TABLE `userpage_contact` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `subject` varchar(1000) NOT NULL,
  `message` varchar(5000) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpage_order`
--

CREATE TABLE `userpage_order` (
  `id` bigint(20) NOT NULL,
  `total_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `payment_method` varchar(10) NOT NULL,
  `payment_status` tinyint(1) DEFAULT NULL,
  `phone_no` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `products_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userpage_order`
--

INSERT INTO `userpage_order` (`id`, `total_price`, `quantity`, `status`, `payment_method`, `payment_status`, `phone_no`, `address`, `created_at`, `products_id`, `user_id`) VALUES
(2, 899, 1, 'Pending', 'cash', NULL, '9800000000', 'Bagmati-05, Makawanpur', '2025-02-01 13:21:12.407660', 1, 1),
(3, 200, 1, 'Pending', 'cash', NULL, '9800000000', 'Madhyapur,Thimi', '2025-02-06 09:13:52.825538', 18, 1),
(4, 400, 2, 'Pending', 'esewa', NULL, '9800000002', 'Bagmati-05, Makawanpur', '2025-03-10 13:16:29.025799', 16, 1),
(5, 200, 1, 'Pending', 'esewa', NULL, '9800000002', 'Bagmati-05, Makawanpur', '2025-03-10 13:16:44.774548', 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userpage_team`
--

CREATE TABLE `userpage_team` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `position` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userpage_team`
--

INSERT INTO `userpage_team` (`id`, `image`, `name`, `position`) VALUES
(1, 'static/uploads/team1.jpg', 'Walter White', 'Executive Officer'),
(2, 'static/uploads/team2.jpg', 'Sarah Jhonson', 'Product Manager'),
(3, 'static/uploads/team3.jpg', 'William Anderson', 'Sales Manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `products_category`
--
ALTER TABLE `products_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `products_deal`
--
ALTER TABLE `products_deal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_product`
--
ALTER TABLE `products_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_product_category_id_9b594869_fk_products_category_id` (`category_id`);

--
-- Indexes for table `products_subscriber`
--
ALTER TABLE `products_subscriber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_video`
--
ALTER TABLE `products_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userpage_cart`
--
ALTER TABLE `userpage_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userpage_cart_products_id_d51e2f4f_fk_products_product_id` (`products_id`),
  ADD KEY `userpage_cart_user_id_7285a190_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `userpage_contact`
--
ALTER TABLE `userpage_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userpage_contact_user_id_f6832e53_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `userpage_order`
--
ALTER TABLE `userpage_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userpage_order_products_id_2fa5a17f_fk_products_product_id` (`products_id`),
  ADD KEY `userpage_order_user_id_4c9c8df5_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `userpage_team`
--
ALTER TABLE `userpage_team`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `products_category`
--
ALTER TABLE `products_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products_deal`
--
ALTER TABLE `products_deal`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products_product`
--
ALTER TABLE `products_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `products_subscriber`
--
ALTER TABLE `products_subscriber`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products_video`
--
ALTER TABLE `products_video`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userpage_cart`
--
ALTER TABLE `userpage_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `userpage_contact`
--
ALTER TABLE `userpage_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `userpage_order`
--
ALTER TABLE `userpage_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userpage_team`
--
ALTER TABLE `userpage_team`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `products_product`
--
ALTER TABLE `products_product`
  ADD CONSTRAINT `products_product_category_id_9b594869_fk_products_category_id` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`);

--
-- Constraints for table `userpage_cart`
--
ALTER TABLE `userpage_cart`
  ADD CONSTRAINT `userpage_cart_products_id_d51e2f4f_fk_products_product_id` FOREIGN KEY (`products_id`) REFERENCES `products_product` (`id`),
  ADD CONSTRAINT `userpage_cart_user_id_7285a190_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `userpage_contact`
--
ALTER TABLE `userpage_contact`
  ADD CONSTRAINT `userpage_contact_user_id_f6832e53_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `userpage_order`
--
ALTER TABLE `userpage_order`
  ADD CONSTRAINT `userpage_order_products_id_2fa5a17f_fk_products_product_id` FOREIGN KEY (`products_id`) REFERENCES `products_product` (`id`),
  ADD CONSTRAINT `userpage_order_user_id_4c9c8df5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

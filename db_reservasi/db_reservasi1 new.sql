-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2021 at 09:59 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_reservasi1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms_apicustom`
--

CREATE TABLE `cms_apicustom` (
  `id` int(10) UNSIGNED NOT NULL,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kolom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_query_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sql_where` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responses` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_apikey`
--

CREATE TABLE `cms_apikey` (
  `id` int(10) UNSIGNED NOT NULL,
  `screetkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_dashboard`
--

CREATE TABLE `cms_dashboard` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_email_queues`
--

CREATE TABLE `cms_email_queues` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_attachments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_email_templates`
--

CREATE TABLE `cms_email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_email_templates`
--

INSERT INTO `cms_email_templates` (`id`, `name`, `slug`, `subject`, `content`, `description`, `from_name`, `from_email`, `cc_email`, `created_at`, `updated_at`) VALUES
(1, 'Email Template Forgot Password Backend', 'forgot_password_backend', NULL, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', NULL, '2021-09-15 03:20:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_logs`
--

CREATE TABLE `cms_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_logs`
--

INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-15 03:34:36', NULL),
(2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-15 03:35:34', NULL),
(3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-15 03:35:38', NULL),
(4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-15 03:36:08', NULL),
(5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-15 03:36:15', NULL),
(6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-15 03:37:48', NULL),
(7, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-15 04:30:44', NULL),
(8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-15 04:33:04', NULL),
(9, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-15 05:32:34', NULL),
(10, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_customers/add-save', 'Add New Data Aulia Rahman at Customer', '', 1, '2021-09-15 05:42:05', NULL),
(11, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-15 07:03:19', NULL),
(12, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_customers/add-save', 'Add New Data Uzal10 at Customer', '', 1, '2021-09-15 07:04:00', NULL),
(13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', ' logout', '', NULL, '2021-09-15 07:40:39', NULL),
(14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-15 09:14:11', NULL),
(15, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-15 20:00:02', NULL),
(16, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', ' logout', '', NULL, '2021-09-15 22:04:14', NULL),
(17, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-18 03:12:15', NULL),
(18, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_customers/delete/3', 'Delete data 0983409328 at Customer', '', 1, '2021-09-18 04:41:41', NULL),
(19, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_customers/delete/4', 'Delete data 3984092384 at Customer', '', 1, '2021-09-18 04:43:09', NULL),
(20, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_customers/delete/5', 'Delete data 30894092480 at Customer', '', 1, '2021-09-18 05:16:44', NULL),
(21, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_customers/delete/6', 'Delete data 9834098234 at Customer', '', 1, '2021-09-18 05:21:33', NULL),
(22, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-23 23:44:33', NULL),
(23, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menus/add-save', 'Add New Data Nasi Ayam Goreng at Menu', '', 1, '2021-09-24 00:12:15', NULL),
(24, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/add-save', 'Add New Data Sektor 1 at Region', '', 1, '2021-09-24 00:22:46', NULL),
(25, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/add-save', 'Add New Data Meja01 at Meja', '', 1, '2021-09-24 00:24:39', NULL),
(26, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-24 02:03:04', NULL),
(27, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-24 22:45:24', NULL),
(28, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-24 22:50:47', NULL),
(29, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-25 05:55:38', NULL),
(30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2021-09-28 13:25:38', NULL),
(31, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/12', 'Delete data Customer at Module Generator', '', 1, '2021-09-28 13:26:09', NULL),
(32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost:8000/admin/man_users/add-save', 'Add New Data Jack Grealish at Customer', '', 1, '2021-09-28 13:30:22', NULL),
(33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2021-09-28 13:32:31', NULL),
(34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2021-09-28 13:34:08', NULL),
(35, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-28 13:34:57', NULL),
(36, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-28 13:37:28', NULL),
(37, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-28 13:38:08', NULL),
(38, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-28 13:49:04', NULL),
(39, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/17', 'Delete data Customer at Module Generator', '', 1, '2021-09-28 13:49:35', NULL),
(40, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-28 13:50:59', NULL),
(41, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-28 13:51:19', NULL),
(42, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-28 14:05:32', NULL),
(43, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-28 14:23:57', NULL),
(44, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-28 20:23:16', NULL),
(45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-28 20:24:14', NULL),
(46, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-28 23:17:14', NULL),
(47, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/18', 'Delete data Customer at Module Generator', '', 1, '2021-09-28 23:17:41', NULL),
(48, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/19', 'Delete data Customer at Module Generator', '', 1, '2021-09-28 23:21:25', NULL),
(49, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_users/add-save', 'Add New Data Ember Spirit at Customer', '', 1, '2021-09-28 23:24:58', NULL),
(50, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-28 23:34:41', NULL),
(51, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-28 23:39:22', NULL),
(52, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menus/add-save', 'Add New Data Nasi Rawon at Menu', '', 1, '2021-09-28 23:40:24', NULL),
(53, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menus/add-save', 'Add New Data Ayam Geprek at Menu', '', 1, '2021-09-28 23:40:57', NULL),
(54, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/14', 'Delete data Order at Module Generator', '', 1, '2021-09-28 23:44:27', NULL),
(55, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/22', 'Delete data Order at Module Generator', '', 1, '2021-09-28 23:49:47', NULL),
(56, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/delete/12', 'Delete data Order at Menu Management', '', 1, '2021-09-28 23:52:12', NULL),
(57, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/23', 'Delete data Order at Module Generator', '', 1, '2021-09-29 00:01:57', NULL),
(58, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/24', 'Delete data Order at Module Generator', '', 1, '2021-09-29 00:13:36', NULL),
(59, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 00:19:22', NULL),
(60, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-29 00:20:03', NULL),
(61, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-29 00:20:17', NULL),
(62, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/add-save', 'Add New Data Meja02 at Meja', '', 1, '2021-09-29 00:32:24', NULL),
(63, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/add-save', 'Add New Data Meja03 at Meja', '', 1, '2021-09-29 00:32:34', NULL),
(64, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/delete/10', 'Delete data Order Menu at Menu Management', '', 1, '2021-09-29 00:33:48', NULL),
(65, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/add-save', 'Add New Data Order Menu at Menu Management', '', 1, '2021-09-29 00:35:30', NULL),
(66, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/4', 'Delete data 4 at Order Menu', '', 1, '2021-09-29 00:41:20', NULL),
(67, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/3', 'Delete data 3 at Order Menu', '', 1, '2021-09-29 00:41:27', NULL),
(68, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/2', 'Delete data 2 at Order Menu', '', 1, '2021-09-29 00:41:31', NULL),
(69, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/1', 'Delete data 1 at Order Menu', '', 1, '2021-09-29 00:41:35', NULL),
(70, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/4', 'Delete data 4 at Order', '', 1, '2021-09-29 00:41:42', NULL),
(71, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/3', 'Delete data 3 at Order', '', 1, '2021-09-29 00:41:46', NULL),
(72, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/2', 'Delete data 2 at Order', '', 1, '2021-09-29 00:41:50', NULL),
(73, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/1', 'Delete data 1 at Order', '', 1, '2021-09-29 00:41:54', NULL),
(74, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 00:42:51', NULL),
(75, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-29 00:43:15', NULL),
(76, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 00:43:55', NULL),
(77, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-29 00:44:21', NULL),
(78, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 00:46:57', NULL),
(79, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 00:48:25', NULL),
(80, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/delete/1', 'Delete data Sektor 1 at Region', '', 1, '2021-09-29 00:53:10', NULL),
(81, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/16', 'Delete data Meja at Module Generator', '', 1, '2021-09-29 00:54:54', NULL),
(82, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/add-save', 'Add New Data Sektor1 at Region', '', 1, '2021-09-29 00:57:32', NULL),
(83, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/3', 'Update data Meja03 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td></td><td>2</td></tr></tbody></table>', 1, '2021-09-29 00:58:55', NULL),
(84, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/2', 'Update data Meja02 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td></td><td>2</td></tr></tbody></table>', 1, '2021-09-29 00:59:04', NULL),
(85, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/1', 'Update data Meja01 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td></td><td>2</td></tr></tbody></table>', 1, '2021-09-29 00:59:11', NULL),
(86, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/add-save', 'Add New Data Sektor2 at Region', '', 1, '2021-09-29 01:07:59', NULL),
(87, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/add-save', 'Add New Data Sektor3 at Region', '', 1, '2021-09-29 01:09:09', NULL),
(88, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/users/add-save', 'Add New Data Kasir at Users Management', '', 1, '2021-09-29 01:17:37', NULL),
(89, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-29 01:17:45', NULL),
(90, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-29 01:18:09', NULL),
(91, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/users/edit-save/2', 'Update data Kasir at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$l58RmG436iA0qMNBwGsD9OSOsMRA5sy2Gx.KSieMbzfuOqeC00vQy</td><td>$2y$10$Z7/2.ThzDOMQhk34XsRDv.wzhwTv17Xo2NxLTq1QIm57aofsVNQES</td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-29 01:18:28', NULL),
(92, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-29 01:18:36', NULL),
(93, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'kasir1@gmail.com login with IP Address ::1', '', 2, '2021-09-29 01:18:46', NULL),
(94, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'kasir1@gmail.com logout', '', 2, '2021-09-29 01:18:55', NULL),
(95, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-29 01:19:01', NULL),
(96, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/users/edit-save/2', 'Update data Kasir at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$Z7/2.ThzDOMQhk34XsRDv.wzhwTv17Xo2NxLTq1QIm57aofsVNQES</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-29 01:19:30', NULL),
(97, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-29 01:20:05', NULL),
(98, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'kasir1@gmail.com login with IP Address ::1', '', 2, '2021-09-29 01:20:17', NULL),
(99, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'kasir1@gmail.com logout', '', 2, '2021-09-29 01:20:28', NULL),
(100, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-29 01:20:35', NULL),
(101, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/users/edit-save/2', 'Update data Pelayan at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Kasir</td><td>Pelayan</td></tr><tr><td>email</td><td>kasir1@gmail.com</td><td>pelayan1@gmail.com</td></tr><tr><td>password</td><td>$2y$10$Z7/2.ThzDOMQhk34XsRDv.wzhwTv17Xo2NxLTq1QIm57aofsVNQES</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-29 01:20:56', NULL),
(102, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/9', 'Update data Customer at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr></tbody></table>', 1, '2021-09-29 01:22:20', NULL),
(103, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/14', 'Update data Order at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2021-09-29 01:22:38', NULL),
(104, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/15', 'Update data Order Menu at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2021-09-29 01:22:55', NULL),
(105, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/9', 'Update data Customer at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2021-09-29 01:23:08', NULL),
(106, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/2', 'Update data Menu at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2021-09-29 01:23:18', NULL),
(107, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/16', 'Update data Meja at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', 1, '2021-09-29 01:23:29', NULL),
(108, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-29 01:23:34', NULL),
(109, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'pelayan1@gmail.com login with IP Address ::1', '', 2, '2021-09-29 01:23:57', NULL),
(110, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'pelayan1@gmail.com logout', '', 2, '2021-09-29 01:25:03', NULL),
(111, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-29 01:25:08', NULL),
(112, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/21', 'Delete data Order Menu at Module Generator', '', 1, '2021-09-29 01:30:42', NULL),
(113, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/delete/15', 'Delete data Order Menu at Menu Management', '', 1, '2021-09-29 01:31:24', NULL),
(114, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/6', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>0</td><td>2</td></tr></tbody></table>', 1, '2021-09-29 01:35:01', NULL),
(115, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/5', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>0</td><td>3</td></tr></tbody></table>', 1, '2021-09-29 01:35:08', NULL),
(116, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/17', 'Update data Order Menu at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2021-09-29 01:36:27', NULL),
(117, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 01:53:12', NULL),
(118, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-29 02:41:57', NULL),
(119, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-29 03:34:41', NULL),
(120, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/7', 'Delete data 7 at Order', '', 1, '2021-09-29 03:37:02', NULL),
(121, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/6', 'Delete data 6 at Order', '', 1, '2021-09-29 03:37:07', NULL),
(122, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/5', 'Delete data 5 at Order', '', 1, '2021-09-29 03:37:12', NULL),
(123, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 03:37:32', NULL),
(124, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/edit-save/8', 'Update data  at Order', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_harga</td><td></td><td></td></tr><tr><td>total_makanan</td><td></td><td></td></tr><tr><td>total_minuman</td><td></td><td></td></tr><tr><td>tota_harga_makanan</td><td></td><td></td></tr><tr><td>total_harga_minuman</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-29 03:38:04', NULL),
(125, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-29 03:41:52', NULL),
(126, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/delete/2', 'Delete data Menu at Menu Management', '', 1, '2021-09-29 03:47:11', NULL),
(127, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/delete/18', 'Delete data New Menu at Menu Management', '', 1, '2021-09-29 03:48:27', NULL),
(128, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/add-save', 'Add New Data Menu at Menu Management', '', 1, '2021-09-29 03:48:59', NULL),
(129, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/13', 'Delete data Menu at Module Generator', '', 1, '2021-09-29 03:56:53', NULL),
(130, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/new_man_menus/add-save', 'Add New Data Es Kopi Susu at Menu', '', 1, '2021-09-29 04:00:43', NULL),
(131, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/new_man_menus/edit-save/3', 'Update data Ayam Geprek at Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>cathegory</td><td>makanan</td><td>Makanan</td></tr></tbody></table>', 1, '2021-09-29 04:00:57', NULL),
(132, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/new_man_menus/edit-save/2', 'Update data Nasi Rawon at Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>cathegory</td><td>makanan</td><td>Makanan</td></tr></tbody></table>', 1, '2021-09-29 04:01:04', NULL),
(133, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/new_man_menus/edit-save/1', 'Update data Nasi Ayam Goreng at Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>cathegory</td><td>makanan</td><td>Makanan</td></tr></tbody></table>', 1, '2021-09-29 04:01:12', NULL),
(134, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/6', 'Delete data 6 at Order Menu', '', 1, '2021-09-29 04:02:36', NULL),
(135, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/5', 'Delete data 5 at Order Menu', '', 1, '2021-09-29 04:02:40', NULL),
(136, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-29 04:02:50', NULL),
(137, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-29 04:03:01', NULL),
(138, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-29 04:04:28', NULL),
(139, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 04:04:59', NULL),
(140, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-29 04:06:01', NULL),
(141, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-29 04:13:20', NULL),
(142, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-29 04:13:23', NULL),
(143, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-09-29 05:08:06', NULL),
(144, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-29 12:17:55', NULL),
(145, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 12:28:10', NULL),
(146, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/edit-save/10', 'Update data  at Order', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_harga</td><td></td><td></td></tr><tr><td>total_makanan</td><td></td><td></td></tr><tr><td>total_minuman</td><td></td><td></td></tr><tr><td>tota_harga_makanan</td><td></td><td></td></tr><tr><td>total_harga_minuman</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-29 12:32:05', NULL),
(147, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/10', 'Delete data 10 at Order', '', 1, '2021-09-29 12:32:15', NULL),
(148, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/11', 'Delete data 11 at Order', '', 1, '2021-09-29 12:32:23', NULL),
(149, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/8', 'Delete data 8 at Order', '', 1, '2021-09-29 12:32:29', NULL),
(150, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 12:32:59', NULL),
(151, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 12:33:25', NULL),
(152, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/edit-save/13', 'Update data  at Order', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_harga</td><td></td><td></td></tr><tr><td>total_makanan</td><td></td><td></td></tr><tr><td>total_minuman</td><td></td><td></td></tr><tr><td>tota_harga_makanan</td><td></td><td></td></tr><tr><td>total_harga_minuman</td><td></td><td></td></tr><tr><td>status</td><td>Diproses</td><td>Menunggu Pembayaran</td></tr></tbody></table>', 1, '2021-09-29 12:36:22', NULL),
(153, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/14', 'Delete data 14 at Order', '', 1, '2021-09-29 12:40:34', NULL),
(154, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/edit-save/13', 'Update data  at Order', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_harga</td><td></td><td></td></tr><tr><td>total_makanan</td><td></td><td></td></tr><tr><td>total_minuman</td><td></td><td></td></tr><tr><td>tota_harga_makanan</td><td></td><td></td></tr><tr><td>total_harga_minuman</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-29 12:40:46', NULL),
(155, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/13', 'Delete data 13 at Order', '', 1, '2021-09-29 12:40:52', NULL),
(156, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/9', 'Delete data 9 at Order', '', 1, '2021-09-29 12:41:00', NULL),
(157, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/12', 'Delete data 12 at Order', '', 1, '2021-09-29 12:41:06', NULL),
(158, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 12:41:23', NULL),
(159, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 12:41:44', NULL),
(160, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 12:42:10', NULL),
(161, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 12:42:35', NULL),
(162, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 12:44:27', NULL),
(163, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 12:44:51', NULL),
(164, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/10', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_id</td><td>9</td><td>15</td></tr></tbody></table>', 1, '2021-09-29 12:45:53', NULL),
(165, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/9', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_id</td><td>10</td><td>17</td></tr></tbody></table>', 1, '2021-09-29 12:46:01', NULL),
(166, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/8', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_id</td><td>9</td><td>18</td></tr></tbody></table>', 1, '2021-09-29 12:46:09', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(167, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/7', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_id</td><td>8</td><td>16</td></tr></tbody></table>', 1, '2021-09-29 12:46:20', NULL),
(168, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-29 13:01:41', NULL),
(169, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-29 13:26:32', NULL),
(170, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/11', 'Delete data 11 at Order Menu', '', 1, '2021-09-29 13:28:32', NULL),
(171, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-29 13:30:39', NULL),
(172, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-29 13:31:18', NULL),
(173, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', ' logout', '', NULL, '2021-09-29 13:36:52', NULL),
(174, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-09-30 01:09:04', NULL),
(175, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/29', 'Delete data New Customer at Module Generator', '', 1, '2021-09-30 01:30:36', NULL),
(176, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/20', 'Delete data Customer at Module Generator', '', 1, '2021-09-30 01:30:44', NULL),
(177, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_users30/edit-save/12', 'Update data Mustakim at Customer', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>chekcin</td><td>YES</td><td>NO</td></tr><tr><td>password</td><td>$2y$10$gvc74H25YnFYUKqIWfE9s.QHnjfDk6U7yxk2K6R98Hf9N1hQJpukq</td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-30 01:34:10', NULL),
(178, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_users30/edit-save/11', 'Update data Farzan at Customer', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$q6Q6A1XV1Nu.GeBbwAjiFuprle5MbpcuzGXceWTYNOiJoR2z8Hr7.</td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-30 01:34:23', NULL),
(179, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_users30/edit-save/10', 'Update data Aubameyang at Customer', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>chekcin</td><td>YES</td><td>NO</td></tr><tr><td>password</td><td>$2y$10$79.JnhzSEPuUQFhM04Tjbeo9G3Lj5YDt864Ya6QaY0fNhI7iHs4Di</td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-30 01:35:02', NULL),
(180, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_users30/add-save', 'Add New Data Granit at Customer', '', 1, '2021-09-30 01:36:16', NULL),
(181, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/21', 'Update data Customer at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>0</td><td></td></tr><tr><td>is_dashboard</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2021-09-30 01:40:47', NULL),
(182, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/19', 'Update data Menu at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>0</td><td></td></tr><tr><td>is_dashboard</td><td>0</td><td>1</td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2021-09-30 01:41:20', NULL),
(183, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/19', 'Update data Menu at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2021-09-30 01:41:53', NULL),
(184, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/21', 'Update data Customer at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2021-09-30 01:42:03', NULL),
(185, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/delete/4', 'Delete data Region at Menu Management', '', 1, '2021-09-30 01:51:26', NULL),
(186, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/add-save', 'Add New Data Meja at Menu Management', '', 1, '2021-09-30 01:52:10', NULL),
(187, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/delete/16', 'Delete data Meja at Menu Management', '', 1, '2021-09-30 01:52:33', NULL),
(188, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/add-save', 'Add New Data Region at Menu Management', '', 1, '2021-09-30 01:53:04', NULL),
(189, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/edit-save/4', 'Update data Sektor3 at Region', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>udpated_at</td><td>2021-09-29 08:09:00</td><td></td></tr></tbody></table>', 1, '2021-09-30 01:53:18', NULL),
(190, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/3', 'Update data Meja03 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2021-09-30 01:54:04', NULL),
(191, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/add-save', 'Add New Data Sektor4 at Region', '', 1, '2021-09-30 01:55:11', NULL),
(192, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/add-save', 'Add New Data Meja04 at Meja', '', 1, '2021-09-30 01:55:30', NULL),
(193, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/delete/5', 'Delete data Sektor4 at Region', '', 1, '2021-09-30 01:57:11', NULL),
(194, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/delete/4', 'Delete data Sektor3 at Region', '', 1, '2021-09-30 01:57:19', NULL),
(195, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/delete/3', 'Delete data Sektor2 at Region', '', 1, '2021-09-30 01:57:24', NULL),
(196, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/delete/2', 'Delete data Sektor1 at Region', '', 1, '2021-09-30 01:57:29', NULL),
(197, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/add-save', 'Add New Data Sektor1 at Region', '', 1, '2021-09-30 01:57:56', NULL),
(198, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/4', 'Update data Meja04 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>5</td><td>6</td></tr></tbody></table>', 1, '2021-09-30 01:58:08', NULL),
(199, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/3', 'Update data Meja03 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>2</td><td>6</td></tr></tbody></table>', 1, '2021-09-30 01:58:24', NULL),
(200, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/add-save', 'Add New Data Sektor2 at Region', '', 1, '2021-09-30 01:58:39', NULL),
(201, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/2', 'Update data Meja02 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>2</td><td>7</td></tr></tbody></table>', 1, '2021-09-30 01:58:50', NULL),
(202, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/1', 'Update data Meja01 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>2</td><td>7</td></tr></tbody></table>', 1, '2021-09-30 01:58:57', NULL),
(203, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/4', 'Update data Meja04 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2021-09-30 02:07:54', NULL),
(204, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/3', 'Update data Meja03 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>6</td><td>7</td></tr></tbody></table>', 1, '2021-09-30 02:08:01', NULL),
(205, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/2', 'Update data Meja02 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>7</td><td>6</td></tr></tbody></table>', 1, '2021-09-30 02:08:08', NULL),
(206, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/1', 'Update data Meja01 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>7</td><td>6</td></tr></tbody></table>', 1, '2021-09-30 02:08:15', NULL),
(207, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/26', 'Delete data Meja at Module Generator', '', 1, '2021-09-30 02:12:06', NULL),
(208, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/15', 'Delete data Region at Module Generator', '', 1, '2021-09-30 02:12:56', NULL),
(209, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/delete/23', 'Delete data Region at Menu Management', '', 1, '2021-09-30 02:13:15', NULL),
(210, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/delete/22', 'Delete data Meja at Menu Management', '', 1, '2021-09-30 02:13:26', NULL),
(211, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/4', 'Update data Meja04 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2021-09-30 02:14:34', NULL),
(212, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/new_regions/edit-save/7', 'Update data Sektor2 at New Region', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>tables_id</td><td>0</td><td>1</td></tr><tr><td>udpated_at</td><td>2021-09-30 08:58:39</td><td></td></tr></tbody></table>', 1, '2021-09-30 02:17:50', NULL),
(213, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/new_regions/edit-save/6', 'Update data Sektor1 at New Region', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>tables_id</td><td>0</td><td>1</td></tr><tr><td>udpated_at</td><td>2021-09-30 08:57:56</td><td></td></tr></tbody></table>', 1, '2021-09-30 02:18:01', NULL),
(214, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/new_regions/delete/7', 'Delete data Sektor2 at Region', '', 1, '2021-09-30 02:21:27', NULL),
(215, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/new_regions/delete/6', 'Delete data Sektor1 at Region', '', 1, '2021-09-30 02:21:31', NULL),
(216, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/31', 'Delete data Region at Module Generator', '', 1, '2021-09-30 02:22:08', NULL),
(217, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/14', 'Update data Order at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>icon</td><td>fa fa-glass</td><td>fa fa-table</td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2021-09-30 02:23:10', NULL),
(218, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/14', 'Update data Order at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>icon</td><td>fa fa-table</td><td>fa fa-glass</td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2021-09-30 02:24:00', NULL),
(219, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/25', 'Update data Meja at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-glass</td><td>fa fa-table</td></tr><tr><td>sorting</td><td>8</td><td></td></tr></tbody></table>', 1, '2021-09-30 02:24:16', NULL),
(220, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/add-save', 'Add New Data Meja05 at Meja', '', 1, '2021-09-30 02:33:04', NULL),
(221, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/33', 'Delete data Region at Module Generator', '', 1, '2021-09-30 02:33:28', NULL),
(222, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/add-save', 'Add New Data Sektor1 at Region', '', 1, '2021-09-30 02:46:20', NULL),
(223, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/add-save', 'Add New Data Sektor2 at Region', '', 1, '2021-09-30 02:47:16', NULL),
(224, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/add-save', 'Add New Data Sektor3 at Region', '', 1, '2021-09-30 02:48:10', NULL),
(225, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/10', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2021-09-30 02:48:37', NULL),
(226, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/12', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>4</td><td>8</td></tr></tbody></table>', 1, '2021-09-30 02:48:43', NULL),
(227, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/9', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>3</td><td>9</td></tr></tbody></table>', 1, '2021-09-30 02:48:51', NULL),
(228, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/8', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>3</td><td>9</td></tr></tbody></table>', 1, '2021-09-30 02:48:58', NULL),
(229, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/7', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>2</td><td>10</td></tr></tbody></table>', 1, '2021-09-30 02:49:05', NULL),
(230, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/12', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_id</td><td>21</td><td>17</td></tr></tbody></table>', 1, '2021-09-30 02:50:10', NULL),
(231, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/12', 'Delete data 12 at Order Menu', '', 1, '2021-09-30 02:51:30', NULL),
(232, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/edit-save/10', 'Update data Sektor3 at Region', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>table_id</td><td>1</td><td>3</td></tr><tr><td>udpated_at</td><td>2021-09-30 09:48:10</td><td></td></tr></tbody></table>', 1, '2021-09-30 02:56:20', NULL),
(233, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/edit-save/9', 'Update data Sektor2 at Region', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>table_id</td><td>5</td><td>2</td></tr><tr><td>udpated_at</td><td>2021-09-30 09:47:16</td><td></td></tr></tbody></table>', 1, '2021-09-30 02:56:29', NULL),
(234, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/edit-save/10', 'Update data Sektor3 at Region', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>table_id</td><td>3</td><td>5</td></tr><tr><td>udpated_at</td><td>2021-09-30 09:48:10</td><td></td></tr></tbody></table>', 1, '2021-09-30 02:57:07', NULL),
(235, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-30 02:57:26', NULL),
(236, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-30 03:01:51', NULL),
(237, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/13', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_id</td><td>22</td><td>15</td></tr></tbody></table>', 1, '2021-09-30 03:02:00', NULL),
(238, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/13', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_id</td><td>15</td><td>17</td></tr></tbody></table>', 1, '2021-09-30 03:02:09', NULL),
(239, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/13', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_id</td><td>17</td><td>18</td></tr></tbody></table>', 1, '2021-09-30 03:02:19', NULL),
(240, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/13', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_id</td><td>18</td><td>22</td></tr></tbody></table>', 1, '2021-09-30 03:02:37', NULL),
(241, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/new_man_menus/edit-save/4', 'Update data Es Kopi Susu at Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>description</td><td></td><td>Minuman yang sangat enak dan terasa kopinya</td></tr></tbody></table>', 1, '2021-09-30 03:08:03', NULL),
(242, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/new_man_menus/add-save', 'Add New Data Soto Daging at Menu', '', 1, '2021-09-30 03:10:30', NULL),
(243, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/28', 'Delete data Menu at Module Generator', '', 1, '2021-09-30 03:15:58', NULL),
(244, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/delete/28', 'Delete data New Menu at Menu Management', '', 1, '2021-09-30 03:16:42', NULL),
(245, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/delete/19', 'Delete data Menu at Menu Management', '', 1, '2021-09-30 03:16:47', NULL),
(246, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/add-save', 'Add New Data Menu at Menu Management', '', 1, '2021-09-30 03:17:07', NULL),
(247, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/32', 'Delete data Meja at Module Generator', '', 1, '2021-09-30 04:25:15', NULL),
(248, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/34', 'Delete data Sektor at Module Generator', '', 1, '2021-09-30 04:25:22', NULL),
(249, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/5', 'Update data Meja05 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>0</td><td></td></tr></tbody></table>', 1, '2021-09-30 04:31:11', NULL),
(250, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/4', 'Update data Meja04 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>0</td><td></td></tr></tbody></table>', 1, '2021-09-30 04:31:23', NULL),
(251, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/1', 'Update data Meja01 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>0</td><td></td></tr></tbody></table>', 1, '2021-09-30 04:31:33', NULL),
(252, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/5', 'Update data Meja05 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>0</td><td></td></tr></tbody></table>', 1, '2021-09-30 04:53:30', NULL),
(253, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/delete/5', 'Delete data Meja05 at Meja', '', 1, '2021-09-30 04:54:51', NULL),
(254, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/delete/4', 'Delete data Meja04 at Meja', '', 1, '2021-09-30 04:54:55', NULL),
(255, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/delete/3', 'Delete data Meja03 at Meja', '', 1, '2021-09-30 04:54:59', NULL),
(256, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/delete/2', 'Delete data Meja02 at Meja', '', 1, '2021-09-30 04:55:03', NULL),
(257, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/delete/1', 'Delete data Meja01 at Meja', '', 1, '2021-09-30 04:55:06', NULL),
(258, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/add-save', 'Add New Data Meja01 at Meja', '', 1, '2021-09-30 04:56:10', NULL),
(259, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/edit-save/6', 'Update data Meja01 at Meja', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-30 04:56:19', NULL),
(260, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/delete/6', 'Delete data Meja01 at Meja', '', 1, '2021-09-30 04:56:25', NULL),
(261, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/edit-save/8', 'Update data Sektor1 at Region', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>udpated_at</td><td>2021-09-30 09:46:20</td><td></td></tr></tbody></table>', 1, '2021-09-30 04:57:47', NULL),
(262, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/add-save', 'Add New Data Meja01 at Meja', '', 1, '2021-09-30 04:58:16', NULL),
(263, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/delete/7', 'Delete data Meja01 at Meja', '', 1, '2021-09-30 04:58:55', NULL),
(264, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/delete/10', 'Delete data Sektor3 at Region', '', 1, '2021-09-30 05:00:51', NULL),
(265, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/delete/9', 'Delete data Sektor2 at Region', '', 1, '2021-09-30 05:00:55', NULL),
(266, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/delete/8', 'Delete data Sektor1 at Region', '', 1, '2021-09-30 05:00:58', NULL),
(267, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/add-save', 'Add New Data Sektor1 at Region', '', 1, '2021-09-30 05:01:20', NULL),
(268, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/add-save', 'Add New Data Sektor2 at Region', '', 1, '2021-09-30 05:01:27', NULL),
(269, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/add-save', 'Add New Data Meja01 at Meja', '', 1, '2021-09-30 05:10:37', NULL),
(270, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/add-save', 'Add New Data Meja02 at Meja', '', 1, '2021-09-30 05:11:16', NULL),
(271, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/add-save', 'Add New Data Sektor3 at Region', '', 1, '2021-09-30 05:12:29', NULL),
(272, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_tables/add-save', 'Add New Data Meja05 at Meja', '', 1, '2021-09-30 05:12:49', NULL),
(273, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/edit-save/22', 'Update data  at Order', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>table_id</td><td>5</td><td>8</td></tr><tr><td>total_harga</td><td></td><td></td></tr><tr><td>total_makanan</td><td></td><td></td></tr><tr><td>total_minuman</td><td></td><td></td></tr><tr><td>tota_harga_makanan</td><td></td><td></td></tr><tr><td>total_harga_minuman</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-30 05:15:35', NULL),
(274, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/edit-save/21', 'Update data  at Order', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_harga</td><td></td><td></td></tr><tr><td>total_makanan</td><td></td><td></td></tr><tr><td>total_minuman</td><td></td><td></td></tr><tr><td>tota_harga_makanan</td><td></td><td></td></tr><tr><td>total_harga_minuman</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-30 05:15:43', NULL),
(275, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/edit-save/20', 'Update data  at Order', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>table_id</td><td>1</td><td>10</td></tr><tr><td>total_harga</td><td></td><td></td></tr><tr><td>total_makanan</td><td></td><td></td></tr><tr><td>total_minuman</td><td></td><td></td></tr><tr><td>tota_harga_makanan</td><td></td><td></td></tr><tr><td>total_harga_minuman</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-30 05:15:54', NULL),
(276, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/edit-save/19', 'Update data  at Order', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_harga</td><td></td><td></td></tr><tr><td>total_makanan</td><td></td><td></td></tr><tr><td>total_minuman</td><td></td><td></td></tr><tr><td>tota_harga_makanan</td><td></td><td></td></tr><tr><td>total_harga_minuman</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-30 05:16:08', NULL),
(277, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/edit-save/18', 'Update data  at Order', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_harga</td><td></td><td></td></tr><tr><td>total_makanan</td><td></td><td></td></tr><tr><td>total_minuman</td><td></td><td></td></tr><tr><td>tota_harga_makanan</td><td></td><td></td></tr><tr><td>total_harga_minuman</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-30 05:16:17', NULL),
(278, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/edit-save/17', 'Update data  at Order', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>table_id</td><td>3</td><td>9</td></tr><tr><td>total_harga</td><td></td><td></td></tr><tr><td>total_makanan</td><td></td><td></td></tr><tr><td>total_minuman</td><td></td><td></td></tr><tr><td>tota_harga_makanan</td><td></td><td></td></tr><tr><td>total_harga_minuman</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-30 05:16:26', NULL),
(279, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/edit-save/16', 'Update data  at Order', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>table_id</td><td>1</td><td>8</td></tr><tr><td>total_harga</td><td></td><td></td></tr><tr><td>total_makanan</td><td></td><td></td></tr><tr><td>total_minuman</td><td></td><td></td></tr><tr><td>tota_harga_makanan</td><td></td><td></td></tr><tr><td>total_harga_minuman</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-30 05:16:33', NULL),
(280, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/edit-save/15', 'Update data  at Order', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>table_id</td><td>1</td><td>8</td></tr><tr><td>total_harga</td><td></td><td></td></tr><tr><td>total_makanan</td><td></td><td></td></tr><tr><td>total_minuman</td><td></td><td></td></tr><tr><td>tota_harga_makanan</td><td></td><td></td></tr><tr><td>total_harga_minuman</td><td></td><td></td></tr></tbody></table>', 1, '2021-09-30 05:16:42', NULL),
(281, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/13', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>10</td><td>11</td></tr></tbody></table>', 1, '2021-09-30 05:17:32', NULL),
(282, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/10', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>region_id</td><td>8</td><td>12</td></tr></tbody></table>', 1, '2021-09-30 05:17:42', NULL),
(283, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/13', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>jumlah_menu</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2021-09-30 05:24:18', NULL),
(284, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-30 05:28:15', NULL),
(285, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/14', 'Delete data 14 at Order Menu', '', 1, '2021-09-30 05:28:55', NULL),
(286, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-30 05:30:12', NULL),
(287, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/15', 'Delete data 15 at Order Menu', '', 1, '2021-09-30 05:32:04', NULL),
(288, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-30 05:33:56', NULL),
(289, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-30 05:34:13', NULL),
(290, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/17', 'Delete data 17 at Order Menu', '', 1, '2021-09-30 05:38:04', NULL),
(291, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/16', 'Delete data 16 at Order Menu', '', 1, '2021-09-30 05:38:08', NULL),
(292, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-30 05:38:38', NULL),
(293, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/18', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>order_id</td><td>22</td><td>18</td></tr></tbody></table>', 1, '2021-09-30 05:43:48', NULL),
(294, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/18', 'Delete data 18 at Order Menu', '', 1, '2021-09-30 05:43:53', NULL),
(295, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/add-save', 'Add New Data  at Order', '', 1, '2021-09-30 05:45:39', NULL),
(296, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-30 05:46:23', NULL),
(297, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/19', 'Delete data 19 at Order Menu', '', 1, '2021-09-30 05:57:43', NULL),
(298, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-30 05:59:25', NULL),
(299, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/20', 'Delete data 20 at Order Menu', '', 1, '2021-09-30 05:59:33', NULL),
(300, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-30 06:01:00', NULL),
(301, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-30 06:01:12', NULL),
(302, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/add-save', 'Add New Data  at Order Menu', '', 1, '2021-09-30 06:03:16', NULL),
(303, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/23', 'Delete data 23 at Order Menu', '', 1, '2021-09-30 06:03:23', NULL),
(304, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/22', 'Delete data 22 at Order Menu', '', 1, '2021-09-30 06:03:27', NULL),
(305, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/delete/21', 'Delete data 21 at Order Menu', '', 1, '2021-09-30 06:03:32', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(306, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/delete/32', 'Delete data New Order Menu at Menu Management', '', 1, '2021-09-30 06:10:54', NULL),
(307, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-10-06 13:18:50', NULL),
(308, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_new_menus/add-save', 'Add New Data Soto at Menu', '', 1, '2021-10-06 13:19:59', NULL),
(309, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_new_menus/add-save', 'Add New Data Burger at Menu', '', 1, '2021-10-06 13:22:31', NULL),
(310, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_new_menus/delete/4', 'Delete data Es Kopi Susu at Menu', '', 1, '2021-10-06 13:23:09', NULL),
(311, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/13', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>menu_id</td><td>4</td><td>7</td></tr></tbody></table>', 1, '2021-10-06 14:53:49', NULL),
(312, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/8', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>menu_id</td><td>4</td><td>6</td></tr></tbody></table>', 1, '2021-10-06 14:53:59', NULL),
(313, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-10-06 23:31:01', NULL),
(314, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_new_menus/add-save', 'Add New Data Soto Enak at Menu', '', 1, '2021-10-07 00:51:09', NULL),
(315, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_new_menus/edit-save/8', 'Update data Soto Enak at Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>description</td><td>Kebab Enak</td><td>Soto Enak</td></tr></tbody></table>', 1, '2021-10-07 00:51:27', NULL),
(316, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_new_menus/delete/7', 'Delete data Burger at Menu', '', 1, '2021-10-07 00:52:11', NULL),
(317, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_menu_order/edit-save/13', 'Update data  at Order Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>menu_id</td><td>7</td><td>1</td></tr></tbody></table>', 1, '2021-10-07 01:47:47', NULL),
(318, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/38', 'Delete data New Order Menu at Module Generator', '', 1, '2021-10-07 01:56:09', NULL),
(319, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_new_menus/edit-save/1', 'Update data Nasi Ayam Bakar at Menu', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Nasi Ayam Goreng</td><td>Nasi Ayam Bakar</td></tr></tbody></table>', 1, '2021-10-07 04:58:02', NULL),
(320, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/edit-save/13', 'Update data Sektor3 at Region', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2021-10/whatsapp_image_2021_07_09_at_052828_1.jpeg</td></tr><tr><td>udpated_at</td><td>2021-09-30 12:12:29</td><td></td></tr></tbody></table>', 1, '2021-10-07 05:45:21', NULL),
(321, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/edit-save/12', 'Update data Sektor2 at Region', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2021-10/146429627_246784780304422_4097682017304052973_n.jpg</td></tr><tr><td>udpated_at</td><td>2021-09-30 12:01:27</td><td></td></tr></tbody></table>', 1, '2021-10-07 05:45:43', NULL),
(322, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_regions/edit-save/11', 'Update data Sektor1 at Region', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2021-10/whatsapp_image_2021_07_09_at_052825_1.jpeg</td></tr><tr><td>udpated_at</td><td>2021-09-30 12:01:20</td><td></td></tr></tbody></table>', 1, '2021-10-07 05:46:08', NULL),
(323, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/delete/24', 'Delete data 24 at Order', '', 1, '2021-10-07 05:46:36', NULL),
(324, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/module_generator/delete/37', 'Delete data Sektor at Module Generator', '', 1, '2021-10-07 05:50:06', NULL),
(325, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/reservasi1/public/admin/menu_management/edit-save/33', 'Update data Sektor at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-glass</td><td>fa fa-map-marker</td></tr><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>', 1, '2021-10-07 05:51:13', NULL),
(326, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-10-11 13:28:21', NULL),
(327, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'http://localhost/reservasi1/public/admin/man_orders/edit-save/23', 'Update data  at Order', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_harga</td><td></td><td></td></tr><tr><td>total_makanan</td><td></td><td></td></tr><tr><td>total_minuman</td><td></td><td></td></tr><tr><td>total_harga_makanan</td><td></td><td></td></tr><tr><td>total_harga_minuman</td><td></td><td></td></tr><tr><td>check_in</td><td></td><td></td></tr><tr><td>keranjang_status</td><td></td><td></td></tr></tbody></table>', 1, '2021-10-11 13:29:12', NULL),
(328, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-10-13 05:28:03', NULL),
(329, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2021-10-13 05:31:50', NULL),
(330, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'http://localhost:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-10-13 05:32:14', NULL),
(331, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'http://localhost/reservasi1/public/admin/logout', 'admin@crudbooster.com logout', '', 1, '2021-10-13 05:32:40', NULL),
(332, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'http://localhost/reservasi1/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2021-10-15 06:16:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_menus`
--

CREATE TABLE `cms_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_dashboard` tinyint(1) NOT NULL DEFAULT 0,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_menus`
--

INSERT INTO `cms_menus` (`id`, `name`, `type`, `path`, `color`, `icon`, `parent_id`, `is_active`, `is_dashboard`, `id_cms_privileges`, `sorting`, `created_at`, `updated_at`) VALUES
(14, 'Order', 'Route', 'AdminManOrdersControllerGetIndex', 'normal', 'fa fa-glass', 0, 1, 0, 1, 3, '2021-09-29 00:15:48', '2021-09-30 02:23:59'),
(17, 'Order Menu', 'Route', 'AdminManMenuOrderControllerGetIndex', 'normal', 'fa fa-list', 0, 1, 0, 1, 4, '2021-09-29 01:32:22', '2021-09-29 01:36:26'),
(21, 'Customer', 'Route', 'AdminManUsers30ControllerGetIndex', 'normal', 'fa fa-users', 0, 1, 0, 1, 1, '2021-09-30 01:31:17', '2021-09-30 01:42:02'),
(29, 'Menu', 'Module', 'man_new_menus', 'normal', 'fa fa-star', 0, 1, 0, 1, 2, '2021-09-30 03:17:07', NULL),
(30, 'Meja', 'Route', 'AdminManTablesControllerGetIndex', NULL, 'fa fa-table', 0, 1, 0, 1, 5, '2021-09-30 04:25:46', NULL),
(33, 'Sektor', 'Route', 'AdminManRegionsControllerGetIndex', 'normal', 'fa fa-map-marker', 0, 1, 0, 1, 6, '2021-10-07 05:50:24', '2021-10-07 05:51:13');

-- --------------------------------------------------------

--
-- Table structure for table `cms_menus_privileges`
--

CREATE TABLE `cms_menus_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_menus_privileges`
--

INSERT INTO `cms_menus_privileges` (`id`, `id_cms_menus`, `id_cms_privileges`) VALUES
(1, 1, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(22, 15, 3),
(23, 15, 2),
(24, 15, 1),
(25, 9, 3),
(26, 9, 2),
(27, 9, 1),
(28, 2, 3),
(29, 2, 2),
(30, 2, 1),
(31, 16, 3),
(32, 16, 2),
(33, 16, 1),
(35, 17, 3),
(36, 17, 2),
(37, 17, 1),
(38, 18, 1),
(42, 20, 1),
(48, 19, 3),
(49, 19, 2),
(50, 19, 1),
(51, 21, 1),
(52, 22, 3),
(53, 22, 2),
(54, 22, 1),
(55, 23, 3),
(56, 23, 2),
(57, 23, 1),
(58, 24, 1),
(63, 14, 3),
(64, 14, 2),
(65, 14, 1),
(66, 25, 1),
(67, 26, 1),
(68, 27, 1),
(69, 28, 1),
(70, 29, 3),
(71, 29, 2),
(72, 29, 1),
(73, 30, 1),
(74, 31, 1),
(75, 32, 1),
(77, 33, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_moduls`
--

CREATE TABLE `cms_moduls` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_moduls`
--

INSERT INTO `cms_moduls` (`id`, `name`, `icon`, `path`, `table_name`, `controller`, `is_protected`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Notifications', 'fa fa-cog', 'notifications', 'cms_notifications', 'NotificationsController', 1, 1, '2021-09-15 03:20:29', NULL, NULL),
(2, 'Privileges', 'fa fa-cog', 'privileges', 'cms_privileges', 'PrivilegesController', 1, 1, '2021-09-15 03:20:29', NULL, NULL),
(3, 'Privileges Roles', 'fa fa-cog', 'privileges_roles', 'cms_privileges_roles', 'PrivilegesRolesController', 1, 1, '2021-09-15 03:20:29', NULL, NULL),
(4, 'Users Management', 'fa fa-users', 'users', 'cms_users', 'AdminCmsUsersController', 0, 1, '2021-09-15 03:20:29', NULL, NULL),
(5, 'Settings', 'fa fa-cog', 'settings', 'cms_settings', 'SettingsController', 1, 1, '2021-09-15 03:20:29', NULL, NULL),
(6, 'Module Generator', 'fa fa-database', 'module_generator', 'cms_moduls', 'ModulsController', 1, 1, '2021-09-15 03:20:29', NULL, NULL),
(7, 'Menu Management', 'fa fa-bars', 'menu_management', 'cms_menus', 'MenusController', 1, 1, '2021-09-15 03:20:29', NULL, NULL),
(8, 'Email Templates', 'fa fa-envelope-o', 'email_templates', 'cms_email_templates', 'EmailTemplatesController', 1, 1, '2021-09-15 03:20:29', NULL, NULL),
(9, 'Statistic Builder', 'fa fa-dashboard', 'statistic_builder', 'cms_statistics', 'StatisticBuilderController', 1, 1, '2021-09-15 03:20:29', NULL, NULL),
(10, 'API Generator', 'fa fa-cloud-download', 'api_generator', '', 'ApiCustomController', 1, 1, '2021-09-15 03:20:29', NULL, NULL),
(11, 'Log User Access', 'fa fa-flag-o', 'logs', 'cms_logs', 'LogsController', 1, 1, '2021-09-15 03:20:29', NULL, NULL),
(12, 'Customer', 'fa fa-user', 'man_customers', 'customers', 'AdminManCustomersController', 0, 0, '2021-09-15 05:41:17', NULL, '2021-09-28 13:26:09'),
(13, 'Menu', 'fa fa-star', 'man_menus', 'menus', 'AdminManMenusController', 0, 0, '2021-09-24 00:10:10', NULL, '2021-09-29 03:56:53'),
(14, 'Order', 'fa fa-reorder', 'users', 'users', 'AdminManOrdersController', 0, 0, '2021-09-24 00:15:08', NULL, '2021-09-28 23:44:27'),
(15, 'Region', 'fa fa-map-marker', 'man_regions', 'regions', 'AdminManRegionsController', 0, 0, '2021-09-24 00:18:08', NULL, '2021-09-30 02:12:56'),
(16, 'Meja', 'fa fa-reorder', 'man_tables', 'tables', 'AdminManTablesController', 0, 0, '2021-09-24 00:23:48', NULL, '2021-09-29 00:54:54'),
(17, 'Customer', 'fa fa-user', 'man_users', 'users', 'AdminManUsersController', 0, 0, '2021-09-28 13:26:42', NULL, '2021-09-28 13:49:35'),
(18, 'Customer', 'fa fa-users', 'man_customers', 'customers', 'AdminManCustomersController', 0, 0, '2021-09-28 13:50:08', NULL, '2021-09-28 23:17:41'),
(19, 'Customer', 'fa fa-users', 'man_users', 'users', 'AdminManUsersController', 0, 0, '2021-09-28 23:18:16', NULL, '2021-09-28 23:21:26'),
(20, 'Customer', 'fa fa-users', 'man_users', 'users', 'AdminManUsersController', 0, 0, '2021-09-28 23:21:49', NULL, '2021-09-30 01:30:44'),
(21, 'Order Menu', 'fa fa-reorder', 'man_menu_order', 'menu_order', 'AdminManMenuOrderController', 0, 0, '2021-09-28 23:30:31', NULL, '2021-09-29 01:30:42'),
(22, 'Order', 'fa fa-glass', 'man_orders', 'orders', 'AdminManOrdersController', 0, 0, '2021-09-28 23:45:22', NULL, '2021-09-28 23:49:47'),
(23, 'Order', 'fa fa-glass', 'man_orders', 'orders', 'AdminManOrdersController', 0, 0, '2021-09-28 23:51:47', NULL, '2021-09-29 00:01:57'),
(24, 'Order', 'fa fa-glass', 'man_orders', 'orders', 'AdminManOrdersController', 0, 0, '2021-09-29 00:07:10', NULL, '2021-09-29 00:13:37'),
(25, 'Order', 'fa fa-glass', 'man_orders', 'orders', 'AdminManOrdersController', 0, 0, '2021-09-29 00:15:48', NULL, NULL),
(26, 'Meja', 'fa fa-table', 'man_tables', 'tables', 'AdminManTablesController', 0, 0, '2021-09-29 00:55:19', NULL, '2021-09-30 02:12:06'),
(27, 'Order Menu', 'fa fa-list', 'man_menu_order', 'menu_order', 'AdminManMenuOrderController', 0, 0, '2021-09-29 01:32:21', NULL, NULL),
(28, 'Menu', 'fa fa-star', 'new_man_menus', 'menus', 'AdminNewManMenusController', 0, 0, '2021-09-29 03:46:45', NULL, '2021-09-30 03:15:58'),
(29, 'New Customer', 'fa fa-user', 'man_users29', 'users', 'AdminManUsers29Controller', 0, 0, '2021-09-30 01:19:40', NULL, '2021-09-30 01:30:36'),
(30, 'Customer', 'fa fa-users', 'man_users30', 'users', 'AdminManUsers30Controller', 0, 0, '2021-09-30 01:31:17', NULL, NULL),
(31, 'Region', 'fa fa-map-marker', 'new_regions', 'regions', 'AdminNewRegionsController', 0, 0, '2021-09-30 02:09:21', NULL, '2021-09-30 02:22:09'),
(32, 'Meja', 'fa fa-glass', 'man_tables', 'tables', 'AdminManTablesController', 0, 0, '2021-09-30 02:13:52', NULL, '2021-09-30 04:25:15'),
(33, 'Region', 'fa fa-map-marker', 'man_regions', 'regions', 'AdminManRegionsController', 0, 0, '2021-09-30 02:29:03', NULL, '2021-09-30 02:33:28'),
(34, 'Sektor', 'fa fa-map-marker', 'man_regions', 'regions', 'AdminManRegionsController', 0, 0, '2021-09-30 02:38:21', NULL, '2021-09-30 04:25:22'),
(35, 'Menu', 'fa fa-star', 'man_new_menus', 'menus', 'AdminManNewMenusController', 0, 0, '2021-09-30 03:15:21', NULL, NULL),
(36, 'Meja', 'fa fa-table', 'man_tables', 'tables', 'AdminManTablesController', 0, 0, '2021-09-30 04:25:45', NULL, NULL),
(37, 'Sektor', 'fa fa-map-marker', 'man_regions', 'regions', 'AdminManRegionsController', 0, 0, '2021-09-30 04:27:43', NULL, '2021-10-07 05:50:06'),
(38, 'New Order Menu', 'fa fa-glass', 'new_menu_order', 'menu_order', 'AdminNewMenuOrderController', 0, 0, '2021-09-30 06:06:55', NULL, '2021-10-07 01:56:09'),
(39, 'Sektor', 'fa fa-map-marker', 'man_regions', 'regions', 'AdminManRegionsController', 0, 0, '2021-10-07 05:50:24', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_notifications`
--

CREATE TABLE `cms_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_privileges`
--

CREATE TABLE `cms_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_privileges`
--

INSERT INTO `cms_privileges` (`id`, `name`, `is_superadmin`, `theme_color`, `created_at`, `updated_at`) VALUES
(1, 'Super Administrator', 1, 'skin-red', '2021-09-15 03:20:32', NULL),
(2, 'Admin Pelayan', 0, 'skin-blue', NULL, NULL),
(3, 'Admin Kasir', 0, 'skin-blue-light', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_privileges_roles`
--

CREATE TABLE `cms_privileges_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_privileges_roles`
--

INSERT INTO `cms_privileges_roles` (`id`, `is_visible`, `is_create`, `is_read`, `is_edit`, `is_delete`, `id_cms_privileges`, `id_cms_moduls`, `created_at`, `updated_at`) VALUES
(15, 1, 1, 1, 1, 1, 1, 12, NULL, NULL),
(16, 1, 1, 1, 1, 1, 1, 4, NULL, NULL),
(17, 1, 1, 1, 1, 1, 1, 13, NULL, NULL),
(18, 1, 1, 1, 1, 1, 1, 14, NULL, NULL),
(19, 1, 1, 1, 1, 1, 1, 15, NULL, NULL),
(20, 1, 1, 1, 1, 1, 1, 16, NULL, NULL),
(21, 1, 1, 1, 1, 1, 1, 17, NULL, NULL),
(22, 1, 1, 1, 1, 1, 1, 18, NULL, NULL),
(23, 1, 1, 1, 1, 1, 1, 19, NULL, NULL),
(24, 1, 1, 1, 1, 1, 1, 20, NULL, NULL),
(25, 1, 1, 1, 1, 1, 1, 21, NULL, NULL),
(26, 1, 1, 1, 1, 1, 1, 22, NULL, NULL),
(27, 1, 1, 1, 1, 1, 1, 23, NULL, NULL),
(28, 1, 1, 1, 1, 1, 1, 24, NULL, NULL),
(29, 1, 1, 1, 1, 1, 1, 25, NULL, NULL),
(30, 1, 1, 1, 1, 1, 1, 26, NULL, NULL),
(38, 1, 1, 1, 1, 1, 3, 20, NULL, NULL),
(39, 1, 1, 1, 1, 1, 3, 26, NULL, NULL),
(40, 1, 1, 1, 1, 1, 3, 13, NULL, NULL),
(41, 1, 1, 1, 1, 1, 3, 25, NULL, NULL),
(42, 1, 1, 1, 1, 1, 3, 21, NULL, NULL),
(43, 1, 1, 1, 1, 1, 3, 15, NULL, NULL),
(50, 1, 0, 0, 0, 0, 2, 20, NULL, NULL),
(51, 1, 0, 0, 0, 0, 2, 26, NULL, NULL),
(52, 1, 0, 0, 0, 0, 2, 13, NULL, NULL),
(53, 1, 0, 0, 0, 0, 2, 25, NULL, NULL),
(54, 1, 0, 0, 0, 0, 2, 21, NULL, NULL),
(55, 1, 0, 0, 0, 0, 2, 15, NULL, NULL),
(56, 1, 1, 1, 1, 1, 1, 27, NULL, NULL),
(57, 1, 1, 1, 1, 1, 1, 28, NULL, NULL),
(58, 1, 1, 1, 1, 1, 1, 29, NULL, NULL),
(59, 1, 1, 1, 1, 1, 1, 30, NULL, NULL),
(60, 1, 1, 1, 1, 1, 1, 31, NULL, NULL),
(61, 1, 1, 1, 1, 1, 1, 32, NULL, NULL),
(62, 1, 1, 1, 1, 1, 1, 33, NULL, NULL),
(63, 1, 1, 1, 1, 1, 1, 34, NULL, NULL),
(64, 1, 1, 1, 1, 1, 1, 35, NULL, NULL),
(65, 1, 1, 1, 1, 1, 1, 36, NULL, NULL),
(66, 1, 1, 1, 1, 1, 1, 37, NULL, NULL),
(67, 1, 1, 1, 1, 1, 1, 38, NULL, NULL),
(68, 1, 1, 1, 1, 1, 1, 39, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_settings`
--

CREATE TABLE `cms_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_input_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataenum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_settings`
--

INSERT INTO `cms_settings` (`id`, `name`, `content`, `content_input_type`, `dataenum`, `helper`, `created_at`, `updated_at`, `group_setting`, `label`) VALUES
(1, 'login_background_color', NULL, 'text', NULL, 'Input hexacode', '2021-09-15 03:20:30', NULL, 'Login Register Style', 'Login Background Color'),
(2, 'login_font_color', NULL, 'text', NULL, 'Input hexacode', '2021-09-15 03:20:30', NULL, 'Login Register Style', 'Login Font Color'),
(3, 'login_background_image', 'uploads/2021-09/db0af9a1f165ff53e4165d6c28b7176a.jpg', 'upload_image', NULL, NULL, '2021-09-15 03:20:30', NULL, 'Login Register Style', 'Login Background Image'),
(4, 'email_sender', 'support@crudbooster.com', 'text', NULL, NULL, '2021-09-15 03:20:30', NULL, 'Email Setting', 'Email Sender'),
(5, 'smtp_driver', 'mail', 'select', 'smtp,mail,sendmail', NULL, '2021-09-15 03:20:30', NULL, 'Email Setting', 'Mail Driver'),
(6, 'smtp_host', '', 'text', NULL, NULL, '2021-09-15 03:20:30', NULL, 'Email Setting', 'SMTP Host'),
(7, 'smtp_port', '25', 'text', NULL, 'default 25', '2021-09-15 03:20:30', NULL, 'Email Setting', 'SMTP Port'),
(8, 'smtp_username', '', 'text', NULL, NULL, '2021-09-15 03:20:30', NULL, 'Email Setting', 'SMTP Username'),
(9, 'smtp_password', '', 'text', NULL, NULL, '2021-09-15 03:20:30', NULL, 'Email Setting', 'SMTP Password'),
(10, 'appname', 'Sistem Reservasi Gartenhutte', 'text', NULL, NULL, '2021-09-15 03:20:30', NULL, 'Application Setting', 'Application Name'),
(11, 'default_paper_size', 'Legal', 'text', NULL, 'Paper size, ex : A4, Legal, etc', '2021-09-15 03:20:30', NULL, 'Application Setting', 'Default Paper Print Size'),
(12, 'logo', 'uploads/2021-09/71aea7afa066d1f62009ab41240e4daf.jpg', 'upload_image', NULL, NULL, '2021-09-15 03:20:30', NULL, 'Application Setting', 'Logo'),
(13, 'favicon', 'uploads/2021-09/490489f79eeb2fb5be8eb47c7155da4e.jpg', 'upload_image', NULL, NULL, '2021-09-15 03:20:30', NULL, 'Application Setting', 'Favicon'),
(14, 'api_debug_mode', 'true', 'select', 'true,false', NULL, '2021-09-15 03:20:30', NULL, 'Application Setting', 'API Debug Mode'),
(15, 'google_api_key', NULL, 'text', NULL, NULL, '2021-09-15 03:20:30', NULL, 'Application Setting', 'Google API Key'),
(16, 'google_fcm_key', NULL, 'text', NULL, NULL, '2021-09-15 03:20:30', NULL, 'Application Setting', 'Google FCM Key');

-- --------------------------------------------------------

--
-- Table structure for table `cms_statistics`
--

CREATE TABLE `cms_statistics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_statistic_components`
--

CREATE TABLE `cms_statistic_components` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`id`, `name`, `photo`, `email`, `password`, `id_cms_privileges`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Super Admin', NULL, 'admin@crudbooster.com', '$2y$10$6eK3sjFxyJ7TNdIURvwAneh9GzqU4iNm1EYBawaaKdny7wGi8FUMm', 1, '2021-09-15 03:20:29', NULL, 'Active'),
(2, 'Pelayan', 'uploads/1/2021-09/91398517_647194716114459_3122422658396045501_n.jpg', 'pelayan1@gmail.com', '$2y$10$Z7/2.ThzDOMQhk34XsRDv.wzhwTv17Xo2NxLTq1QIm57aofsVNQES', 2, '2021-09-29 01:17:37', '2021-09-29 01:20:56', NULL);

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
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cathegory` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `price`, `photo`, `description`, `cathegory`, `created_at`, `updated_at`) VALUES
(1, 'Nasi Ayam Bakar', 15000, 'uploads/1/2021-09/whatsapp_image_2021_07_09_at_052824.jpeg', 'Sangat enak dan Lezat', 'Makanan', '2021-09-24 00:12:15', '2021-10-07 04:58:02'),
(2, 'Nasi Rawon', 10000, 'uploads/1/2021-09/whatsapp_image_2021_07_09_at_050725.jpeg', 'sangat enak dan lezat', 'Makanan', '2021-09-28 23:40:24', '2021-09-29 04:01:04'),
(3, 'Ayam Geprek', 13000, 'uploads/1/2021-09/whatsapp_image_2021_07_09_at_052833.jpeg', 'sangat enak dan lezat', 'Makanan', '2021-09-28 23:40:57', '2021-09-29 04:00:56'),
(5, 'Soto Daging', 15000, 'uploads/1/2021-09/whatsapp_image_2021_07_09_at_052834.jpeg', 'Sangat Enak Dan Lezat Dengan Daging Pilihan', 'Makanan', '2021-09-30 03:10:30', '2021-09-30 03:10:30'),
(6, 'Soto', 10000, 'uploads/1/2021-10/whatsapp_image_2021_07_09_at_052832_1.jpeg', 'Soto yang sangat lezat dan enak', 'Makanan', '2021-10-06 13:19:59', '2021-10-06 13:19:59'),
(8, 'Soto Enak', 10000, 'uploads/1/2021-10/whatsapp_image_2021_07_09_at_052834.jpeg', 'Soto Enak', 'Snack', '2021-10-07 00:51:09', '2021-10-07 00:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `menu_order`
--

CREATE TABLE `menu_order` (
  `id` int(11) NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `jumlah_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_order`
--

INSERT INTO `menu_order` (`id`, `order_id`, `menu_id`, `created_at`, `updated_at`, `jumlah_harga`) VALUES
(7, 16, 3, '2021-09-29 04:02:50', '2021-09-30 02:49:05', 0),
(8, 18, 6, '2021-09-29 04:03:00', '2021-10-06 14:53:59', 0),
(9, 17, 1, '2021-09-29 04:04:28', '2021-09-30 02:48:51', 0),
(10, 15, 3, '2021-09-29 04:06:01', '2021-09-30 05:17:42', 0),
(13, 22, 1, '2021-09-30 03:01:51', '2021-10-07 01:47:47', 0);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2016_08_07_145904_add_table_cms_apicustom', 2),
(5, '2016_08_07_150834_add_table_cms_dashboard', 2),
(6, '2016_08_07_151210_add_table_cms_logs', 2),
(7, '2016_08_07_151211_add_details_cms_logs', 2),
(8, '2016_08_07_152014_add_table_cms_privileges', 2),
(9, '2016_08_07_152214_add_table_cms_privileges_roles', 2),
(10, '2016_08_07_152320_add_table_cms_settings', 2),
(11, '2016_08_07_152421_add_table_cms_users', 2),
(12, '2016_08_07_154624_add_table_cms_menus_privileges', 2),
(13, '2016_08_07_154624_add_table_cms_moduls', 2),
(14, '2016_08_17_225409_add_status_cms_users', 2),
(15, '2016_08_20_125418_add_table_cms_notifications', 2),
(16, '2016_09_04_033706_add_table_cms_email_queues', 2),
(17, '2016_09_16_035347_add_group_setting', 2),
(18, '2016_09_16_045425_add_label_setting', 2),
(19, '2016_09_17_104728_create_nullable_cms_apicustom', 2),
(20, '2016_10_01_141740_add_method_type_apicustom', 2),
(21, '2016_10_01_141846_add_parameters_apicustom', 2),
(22, '2016_10_01_141934_add_responses_apicustom', 2),
(23, '2016_10_01_144826_add_table_apikey', 2),
(24, '2016_11_14_141657_create_cms_menus', 2),
(25, '2016_11_15_132350_create_cms_email_templates', 2),
(26, '2016_11_15_190410_create_cms_statistics', 2),
(27, '2016_11_17_102740_create_cms_statistic_components', 2),
(28, '2017_06_06_164501_add_deleted_at_cms_moduls', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `table_id` int(11) DEFAULT NULL,
  `kasir_id` int(11) UNSIGNED DEFAULT NULL,
  `pelayan_id` int(11) UNSIGNED DEFAULT NULL,
  `kode` varchar(50) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `total_makanan` int(11) DEFAULT NULL,
  `total_minuman` int(11) DEFAULT NULL,
  `total_harga_makanan` int(11) DEFAULT NULL,
  `total_harga_minuman` int(11) DEFAULT NULL,
  `kapan_pesan` timestamp NOT NULL DEFAULT current_timestamp(),
  `kapan_bayar` timestamp NOT NULL DEFAULT current_timestamp(),
  `rencana_tiba` timestamp NOT NULL DEFAULT current_timestamp(),
  `kapan_tiba` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL,
  `kapan_pesanan_selesai` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `jenis` varchar(10) DEFAULT NULL,
  `check_in` char(1) DEFAULT NULL,
  `keranjang_status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `table_id`, `kasir_id`, `pelayan_id`, `kode`, `total_harga`, `total_makanan`, `total_minuman`, `total_harga_makanan`, `total_harga_minuman`, `kapan_pesan`, `kapan_bayar`, `rencana_tiba`, `kapan_tiba`, `status`, `kapan_pesanan_selesai`, `created_at`, `updated_at`, `jenis`, `check_in`, `keranjang_status`) VALUES
(15, 10, 8, 2, 2, 'DI210929194110', NULL, NULL, NULL, NULL, NULL, '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', 'Menunggu Pembayaran', '2021-09-28 17:00:00', '2021-09-29 12:41:23', '2021-09-30 05:16:42', 'Ditempat', '', ''),
(16, 2, 8, 2, 2, 'RS21092919412', NULL, NULL, NULL, NULL, NULL, '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', 'Menunggu Pembayaran', '2021-09-28 17:00:00', '2021-09-29 12:41:44', '2021-09-30 05:16:33', 'Reservasi', '', ''),
(17, 7, 9, 2, 2, 'DI21092919427', NULL, NULL, NULL, NULL, NULL, '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', 'Diproses', '2021-09-28 17:00:00', '2021-09-29 12:42:09', '2021-09-30 05:16:26', 'Ditempat', '', ''),
(18, 9, 9, 2, 2, 'DI21092919429', NULL, NULL, NULL, NULL, NULL, '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', 'Menunggu Pembayaran', '2021-09-28 17:00:00', '2021-09-29 12:42:35', '2021-09-30 05:16:17', 'Ditempat', '', ''),
(19, 4, 9, 2, 2, 'DI21092919444', NULL, NULL, NULL, NULL, NULL, '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', 'Diproses', '2021-09-28 17:00:00', '2021-09-29 12:44:27', '2021-09-30 05:16:08', 'Ditempat', '', ''),
(20, 8, 10, 2, 2, 'DI21092919448', NULL, NULL, NULL, NULL, NULL, '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', 'Selesai', '2021-09-28 17:00:00', '2021-09-29 12:44:50', '2021-09-30 05:15:54', 'Ditempat', '', ''),
(21, 7, 9, 2, 2, 'DI21092920307', NULL, NULL, NULL, NULL, NULL, '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', '2021-09-28 17:00:00', 'Diproses', '2021-09-28 17:00:00', '2021-09-29 13:30:39', '2021-09-30 05:15:43', 'Ditempat', '', ''),
(22, 13, 8, 2, 2, 'DI210930095713', NULL, NULL, NULL, NULL, NULL, '2021-09-29 17:00:00', '2021-09-29 17:00:00', '2021-09-29 17:00:00', '2021-09-29 17:00:00', 'Menunggu Pembayaran', '2021-09-29 17:00:00', '2021-09-30 02:57:26', '2021-09-30 05:15:35', 'Ditempat', '', ''),
(23, 7, 9, 2, 2, 'DI21093012457', NULL, NULL, NULL, NULL, NULL, '2021-09-29 17:00:00', '2021-09-29 17:00:00', '2021-09-29 17:00:00', '2021-09-29 17:00:00', 'Menunggu Pembayaran', '2021-09-29 17:00:00', '2021-09-30 05:45:39', '2021-10-11 13:29:12', 'Ditempat', '', '');

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
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `udpated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`, `photo`, `created_at`, `udpated_at`) VALUES
(11, 'Sektor1', 'uploads/1/2021-10/whatsapp_image_2021_07_09_at_052825_1.jpeg', '2021-09-30 05:01:20', '2021-09-30 05:01:20'),
(12, 'Sektor2', 'uploads/1/2021-10/146429627_246784780304422_4097682017304052973_n.jpg', '2021-09-30 05:01:27', '2021-09-30 05:01:27'),
(13, 'Sektor3', 'uploads/1/2021-10/whatsapp_image_2021_07_09_at_052828_1.jpeg', '2021-09-30 05:12:29', '2021-09-30 05:12:29');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `region_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `capacity` varchar(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `region_id`, `name`, `capacity`, `created_at`, `updated_at`, `is_available`) VALUES
(8, 11, 'Meja01', '4', '2021-09-30 05:10:37', '2021-09-30 05:10:37', 0),
(9, 12, 'Meja02', '4', '2021-09-30 05:11:16', '2021-09-30 05:11:16', 0),
(10, 13, 'Meja05', '4', '2021-09-30 05:12:49', '2021-09-30 05:12:49', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Uzal', '345643345435', 'uzal11@gmail.com', '$2y$10$YRcxL7H2bf3wI7FoHG4nF..pnRe6J/wXX4W02P/QtrMi.MxteRlie', 'fC2MJD0yf54TpEGyybQaL0sPJ1ON8gF8cwtV7BjdQW62SUsK5c6XlAF9tyBw', '2021-09-11 06:55:33', '2021-09-11 06:55:33'),
(2, 'Aulia Rahman', '45345345', 'aulia3244@gmail.com', '$2y$10$thVQak4pGhsiPf.Fiavt4.VDlGmTjKMV3HI5wiqDipkHrJ6rqA95C', 'EnrYXFE8yb6h85ZhrEDJQuyN9NxTU9HvlIgkhTFjUoJcBMqAJth4LxqQfLN4', '2021-09-12 03:08:02', '2021-10-08 13:41:29'),
(3, 'Super Uzal', '3948032948', 'superuzal10@gmail.com', '$2y$10$iGMTSN8YH/5bCOqDaZefzeiJNZFNbmYhczdLbkMmeh0m9kzWkPoha', NULL, '2021-09-28 13:24:36', '2021-09-28 13:24:36'),
(4, 'Jack Grealish', '09340920985', 'jackgrealish@gmail.com', '$2y$10$EfTfWHhR/TtFfhGljdaVr.3eetAPvCSGHkDDEex9l07jzqQ4udwee', NULL, '2021-09-28 13:30:21', NULL),
(5, 'Tomiyasu', '840234', 'tomiyasu@gmail.com', '$2y$10$OOOd3nftN9lywPhXiCHvpuF5i6KqiqoPbVl9LNwH1lXq8rQBsg/9G', NULL, '2021-09-28 13:31:40', '2021-09-28 13:31:40'),
(6, 'Phantom Assasins', '94890', 'pa@gmail.com', '$2y$10$kvK8JXYe6in8CHyyp412E.czqRwPKa/Xyc.ryhT.3ViJBiyWpwThy', NULL, '2021-09-28 23:13:05', '2021-09-28 23:13:05'),
(7, 'Ember Spirit', '20384903', 'ember@gmail.com', '$2y$10$9Qpvn9jzYkyimSDYZQIEwObEBVXFumS6cPwiL/eR41RsGrXgIXb3a', NULL, '2021-09-28 23:24:57', NULL),
(8, 'Smith Rowe', '82048239', 'smith@gmail.com', '$2y$10$7h9E0nBjC0Q1ooQH.WttdO38MtbCOr55m2AZDSez4KW.J15io5gmS', NULL, '2021-09-29 01:39:06', '2021-09-29 01:39:06'),
(9, 'Saka', '430480293', 'saka@gmail.com', '$2y$10$M9aO2UYp7g0CUxNQmiDXr.QnWY.TZlv5Bm13SJq0n.K73jA97GAGi', NULL, '2021-09-29 01:41:26', '2021-09-29 01:41:26'),
(10, 'Aubameyang', '0402938', 'auba@gmail.com', '$2y$10$79.JnhzSEPuUQFhM04Tjbeo9G3Lj5YDt864Ya6QaY0fNhI7iHs4Di', NULL, '2021-09-29 01:44:21', '2021-09-30 01:35:02'),
(11, 'Farzan', '982048', 'farzan@gmail.com', '$2y$10$q6Q6A1XV1Nu.GeBbwAjiFuprle5MbpcuzGXceWTYNOiJoR2z8Hr7.', NULL, '2021-09-29 01:48:47', '2021-09-30 01:34:23'),
(12, 'Mustakim', '208420394', 'mustakim@gmail.com', '$2y$10$gvc74H25YnFYUKqIWfE9s.QHnjfDk6U7yxk2K6R98Hf9N1hQJpukq', NULL, '2021-09-29 13:11:11', '2021-09-30 01:34:10'),
(13, 'Granit', '093482093', 'granit@gmail.com', '$2y$10$rFxtHaKiAc1haMGDnQH61OlGpZuSIe7qM5AcdXr0oC9nteVAYxNFq', NULL, '2021-09-30 01:36:16', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_apikey`
--
ALTER TABLE `cms_apikey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_email_templates`
--
ALTER TABLE `cms_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_logs`
--
ALTER TABLE `cms_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_menus`
--
ALTER TABLE `cms_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_moduls`
--
ALTER TABLE `cms_moduls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_notifications`
--
ALTER TABLE `cms_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_privileges`
--
ALTER TABLE `cms_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_settings`
--
ALTER TABLE `cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_statistics`
--
ALTER TABLE `cms_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_order`
--
ALTER TABLE `menu_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_menu_order_orders` (`order_id`),
  ADD KEY `FK_menu_order_menus` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_orders_users` (`user_id`),
  ADD KEY `FK_orders_tables` (`table_id`),
  ADD KEY `FK_orders_cms_users` (`kasir_id`),
  ADD KEY `FK_orders_cms_users_2` (`pelayan_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tables_regions` (`region_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_apikey`
--
ALTER TABLE `cms_apikey`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_email_templates`
--
ALTER TABLE `cms_email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_logs`
--
ALTER TABLE `cms_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=333;

--
-- AUTO_INCREMENT for table `cms_menus`
--
ALTER TABLE `cms_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `cms_moduls`
--
ALTER TABLE `cms_moduls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `cms_notifications`
--
ALTER TABLE `cms_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_privileges`
--
ALTER TABLE `cms_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `cms_settings`
--
ALTER TABLE `cms_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cms_statistics`
--
ALTER TABLE `cms_statistics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `menu_order`
--
ALTER TABLE `menu_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_order`
--
ALTER TABLE `menu_order`
  ADD CONSTRAINT `FK_menu_order_menus` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_menu_order_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_orders_cms_users` FOREIGN KEY (`kasir_id`) REFERENCES `cms_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_orders_cms_users_2` FOREIGN KEY (`pelayan_id`) REFERENCES `cms_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_orders_tables` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tables`
--
ALTER TABLE `tables`
  ADD CONSTRAINT `FK_tables_regions` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

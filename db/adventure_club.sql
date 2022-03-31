-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2022 at 01:04 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adventure_club`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `image`, `content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'http://adventuresclub.net/admin/public/images/about.jpg', 'Are you one of those people who respond to “Take a hike!” with “Yes please!”? Then trekking is your adventure travel soul mate. So much of this big, beautiful world can only be reached by mountain trails and rugged foot paths. Whether you’re an experienced climber or just dipping your toes in the water, breathtaking (literally) trails around the world are calling you to put boots to dirt and hit the road.', '2021-08-24 21:57:28', '2021-08-24 21:57:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `activity`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Transportation from gathering area', 1, '2021-07-01 23:45:13', '2021-07-01 23:45:13', NULL),
(2, 'Drinks', 1, '2021-07-01 23:45:13', '2021-07-01 23:45:13', NULL),
(3, 'Snacks', 1, '2021-07-01 23:45:13', '2021-07-01 23:45:13', NULL),
(5, 'Sand bashing', 1, '2021-07-01 23:45:13', '2021-07-01 23:45:13', NULL),
(7, 'Climbing', 1, '2021-07-01 23:45:13', '2021-07-01 23:45:13', NULL),
(8, 'Swimming', 1, '2021-07-01 23:45:13', '2021-07-01 23:45:13', NULL),
(9, 'Learning', 1, '2021-10-19 13:31:33', '2021-10-19 13:31:33', NULL),
(10, 'Cooking', 1, '2021-10-19 13:32:01', '2021-10-19 13:32:01', NULL),
(11, 'Camping', 1, '2021-10-19 13:32:15', '2021-10-19 13:32:15', NULL),
(12, 'Abseiling', 1, '2021-10-19 13:33:08', '2021-10-19 13:33:08', NULL),
(13, 'Hiking', 1, '2021-10-19 13:33:32', '2021-10-19 13:33:32', NULL),
(14, 'Timekeeping', 1, '2021-10-19 13:34:32', '2021-10-19 13:34:32', NULL),
(15, 'Gears', 1, '2021-10-19 13:34:45', '2021-10-19 13:34:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `aimed`
--

CREATE TABLE `aimed` (
  `Id` int(11) NOT NULL,
  `AimedName` varchar(200) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aimed`
--

INSERT INTO `aimed` (`Id`, `AimedName`, `created_at`, `updated_at`) VALUES
(5, 'Kids', '2021-10-19 13:39:27', '2021-10-19 13:39:27'),
(6, 'Youngsters', '2021-10-19 13:40:06', '2021-10-19 13:40:06'),
(7, 'Gents', '2021-10-19 13:40:41', '2021-10-19 13:40:41'),
(8, 'Ladies', '2021-10-19 13:40:54', '2021-10-19 13:40:54'),
(9, 'Multigender', '2021-10-19 13:41:40', '2021-10-19 13:41:40');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reach_for` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `banner`, `thumbnail`, `title`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'banners/1624982871.jpg', '/banners/thumbs/1624982871.jpg', 'Reference site about Lorem Ipsum', 1, NULL, '2021-06-29 21:37:51', '2021-06-29 21:37:51'),
(2, 'banners/1624982877.jpg', '/banners/thumbs/1624982877.jpg', 'HP says it is Windows 11 ready', 1, NULL, '2021-06-29 21:37:58', '2021-06-29 21:37:58'),
(3, 'banners/1624982885.jpg', '/banners/thumbs/1624982885.jpg', 'Microsoft is bringing Android apps to Windows: How they will work', 1, NULL, '2021-06-29 21:38:05', '2021-06-29 21:38:05'),
(4, 'banners/1624982892.jpg', '/banners/thumbs/1624982892.jpg', 'Encryption best practices for better cloud security', 1, NULL, '2021-06-29 21:38:12', '2021-06-29 21:38:12'),
(5, 'banners/1624982900.jpg', '/banners/thumbs/1624982900.jpg', 'Reference site about Lorem Ipsum', 1, NULL, '2021-06-29 21:38:20', '2021-06-29 21:38:20'),
(6, 'banners/1624982907.jpg', '/banners/thumbs/1624982907.jpg', 'HP says it is Windows 11 ready', 1, NULL, '2021-06-29 21:38:27', '2021-06-29 21:38:27'),
(7, 'banners/1627960637.jpg', '/banners/thumbs/1627960637.jpg', 'Reference site about Lorem Ipsum', 1, NULL, '2021-08-03 08:47:17', '2021-08-03 08:47:17'),
(8, 'banners/1627961275.jpg', '/banners/thumbs/1627961275.jpg', 'Reference site about Lorem Ipsum', 1, NULL, '2021-08-03 08:57:55', '2021-08-03 08:57:55'),
(9, 'banners/1627962854.jpg', '/banners/thumbs/1627962854.jpg', 'Reference site about Lorem Ipsum', 1, NULL, '2021-08-03 09:24:14', '2021-08-03 09:24:14'),
(10, 'banners/1627963022.jpg', '/banners/thumbs/1627963022.jpg', 'Reference site about Lorem Ipsum', 1, NULL, '2021-08-03 09:27:02', '2021-08-03 09:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `become_partner`
--

CREATE TABLE `become_partner` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `cr_name` varchar(255) DEFAULT NULL,
  `cr_number` varchar(255) DEFAULT NULL,
  `cr_copy` varchar(255) DEFAULT NULL,
  `debit_card` varchar(255) DEFAULT NULL,
  `visa_card` enum('1','0') NOT NULL DEFAULT '0',
  `payon_arrival` enum('1','0') DEFAULT '0' COMMENT '''1'' Active , ''0'' Inactive',
  `paypal` varchar(255) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `account_holdername` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `is_online` enum('1','0') NOT NULL DEFAULT '1' COMMENT '''1'' Active , ''0'' Inactive',
  `is_approved` enum('1','0') NOT NULL DEFAULT '0' COMMENT '''1'' Approve, ''0'' Unapprove',
  `packages_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `become_partner`
--

INSERT INTO `become_partner` (`id`, `user_id`, `company_name`, `address`, `location`, `description`, `license`, `cr_name`, `cr_number`, `cr_copy`, `debit_card`, `visa_card`, `payon_arrival`, `paypal`, `bankname`, `account_holdername`, `account_number`, `is_online`, `is_approved`, `packages_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 1255, 'dfgdfg', 'dgfdgdf', 'rtyrty', 'sgdsg', 'xdgvdxv', 'drter', 'xdvxdv', NULL, '7567566756756', '', '1', 'yrtgbcbcvsdfsefhttp', 'testdata', 'holfgdrerfhgvvgn', 'cvvnhghuyterdd', '1', '1', 6, '2022-03-14 15:12:57', '2022-03-14 09:52:01', '2022-03-14 15:12:57', '2022-03-14 09:42:57'),
(2, 1256, 'ARK NEW TECH', '456456', '456', NULL, '1', '45645', '45645', '20220314160727-2.jpg', NULL, '', '0', NULL, NULL, NULL, NULL, '1', '0', 3, '2022-03-15 15:29:29', '2022-03-30 09:05:05', '2022-03-14 16:07:27', '2022-03-14 10:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `adult` tinyint(3) UNSIGNED NOT NULL,
  `kids` tinyint(3) UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_amount` decimal(16,2) NOT NULL,
  `total_amount` decimal(16,2) NOT NULL,
  `discounted_amount` decimal(16,2) NOT NULL,
  `future_plan` tinyint(1) NOT NULL DEFAULT 0,
  `booking_date` date NOT NULL,
  `currency` int(10) UNSIGNED NOT NULL,
  `coupon_applied` tinyint(1) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=Pending,1=Payment Done,2=Cancelled,3=Accepted',
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `cancelled_reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=Pending,1=Success,2=Failed',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `service_id`, `adult`, `kids`, `message`, `unit_amount`, `total_amount`, `discounted_amount`, `future_plan`, `booking_date`, `currency`, `coupon_applied`, `status`, `updated_by`, `cancelled_reason`, `payment_status`, `created_at`) VALUES
(1, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12466.00', 0, '2021-07-22', 0, 1, 2, 1, NULL, 0, '2021-07-21 01:55:26'),
(2, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12466.00', 0, '2021-07-22', 0, 1, 2, NULL, NULL, 0, '2021-07-21 01:56:57'),
(3, 1224, 5002, 1, 1, 'uyyEEEreeEeee g g g g', '5000.00', '10000.00', '10000.00', 0, '2021-07-23', 1, 0, 2, 1, NULL, 0, '2021-07-21 02:10:31'),
(4, 1224, 5000, 3, 4, 'you have \njj\nl\nl\nl', '2500.00', '17500.00', '17500.00', 0, '2021-07-30', 0, 0, 0, NULL, NULL, 0, '2021-07-21 02:15:54'),
(5, 1224, 5000, 1, 1, 'yuy\niu\niu', '2500.00', '5000.00', '5000.00', 0, '2021-07-31', 0, 0, 0, NULL, NULL, 0, '2021-07-21 02:25:45'),
(6, 1225, 5000, 1, 1, 'vuvuch u', '2500.00', '5000.00', '5000.00', 0, '2021-07-30', 0, 0, 0, NULL, NULL, 0, '2021-07-21 02:49:10'),
(7, 1234, 5000, 1, 1, 'Juju\nNonmembers', '2500.00', '5000.00', '5000.00', 0, '2021-07-24', 0, 0, 0, NULL, NULL, 0, '2021-07-22 13:29:51'),
(8, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 0, '2021-07-15', 0, 0, 2, NULL, NULL, 0, '2021-07-24 03:36:09'),
(9, 1240, 5000, 4, 2, 'jvivi', '2500.00', '15000.00', '15000.00', 0, '2021-07-30', 0, 0, 0, NULL, NULL, 0, '2021-07-24 05:10:01'),
(10, 1240, 5000, 2, 2, 'j', '2500.00', '10000.00', '10000.00', 0, '2021-07-30', 0, 0, 1, 1, NULL, 0, '2021-07-24 09:29:02'),
(11, 1243, 5001, 1, 2, 'hyyy', '2500.00', '7500.00', '7500.00', 0, '2000-12-12', 0, 0, 1, 1, NULL, 0, '2021-07-24 15:43:49'),
(12, 1243, 5001, 2, 1, 'hyyy', '2500.00', '7500.00', '7500.00', 0, '2000-12-12', 0, 0, 2, 1, NULL, 0, '2021-07-24 15:45:02'),
(13, 1240, 5000, 1, 1, 'you', '2500.00', '5000.00', '5000.00', 0, '2021-07-25', 0, 0, 1, 1, NULL, 0, '2021-07-24 15:49:22'),
(14, 1256, 5004, 2, 2, 'this is planning', '2.00', '8.00', '8.00', 0, '2021-07-25', 2, 0, 2, 1, NULL, 0, '2021-07-24 22:35:10'),
(15, 1255, 5000, 1, 1, 'hy', '2500.00', '5000.00', '5000.00', 0, '2000-12-12', 0, 0, 2, 1, NULL, 0, '2021-07-24 23:39:57'),
(16, 1257, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 1, '2021-07-26', 0, 0, 0, NULL, NULL, 0, '2021-07-25 10:21:21'),
(17, 1255, 5000, 1, 1, 'vhcuc vuvu jvib', '2500.00', '5000.00', '5000.00', 0, '2021-07-29', 0, 0, 0, NULL, NULL, 0, '2021-07-26 01:34:54'),
(18, 1255, 5001, 1, 1, 'hggghg g gv', '2500.00', '5000.00', '5000.00', 0, '2021-08-10', 0, 0, 0, NULL, NULL, 0, '2021-07-27 04:41:42'),
(19, 1255, 5001, 1, 1, 'test', '2500.00', '5000.00', '5000.00', 0, '2000-12-12', 0, 0, 0, NULL, NULL, 0, '2021-07-27 15:42:58'),
(20, 1255, 5000, 1, 1, 'test', '2500.00', '5000.00', '5000.00', 0, '2021-12-12', 0, 0, 0, NULL, NULL, 1, '2021-07-27 15:44:42'),
(21, 1255, 5000, 1, 1, 'hy', '2500.00', '5000.00', '5000.00', 0, '2021-01-08', 0, 0, 1, 1, NULL, 0, '2021-07-27 15:46:55'),
(22, 1255, 5000, 1, 1, 'Hy', '2500.00', '5000.00', '5000.00', 0, '2021-01-07', 0, 0, 1, 1, NULL, 0, '2021-07-27 15:50:37'),
(23, 1255, 5009, 1, 1, 'hy', '100000.00', '200000.00', '200000.00', 0, '2000-12-12', 2, 0, 0, NULL, NULL, 0, '2021-07-28 14:11:47'),
(24, 1255, 5018, 1, 1, 'dxg', '100000.00', '200000.00', '200000.00', 0, '2021-08-17', 4, 0, 2, 1, NULL, 0, '2021-08-01 22:26:03'),
(25, 1255, 5018, 1, 1, 'df', '100000.00', '200000.00', '200000.00', 0, '2021-10-05', 4, 0, 1, 1, NULL, 0, '2021-08-01 22:26:39'),
(26, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 0, '2021-07-15', 0, 0, 2, NULL, NULL, 0, '2021-08-05 22:23:21'),
(27, 1257, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 1, '2021-08-26', 0, 0, 0, NULL, NULL, 0, '2021-08-05 22:35:15'),
(28, 1257, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 1, '2021-08-26', 0, 0, 0, NULL, NULL, 0, '2021-08-05 22:43:06'),
(29, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 0, '2021-07-15', 0, 0, 2, NULL, NULL, 1, '2021-08-05 22:46:27'),
(30, 1255, 5020, 1, 1, 'yvybyby vyby', '5000.00', '10000.00', '10000.00', 1, '2021-08-31', 1, 0, 0, NULL, NULL, 0, '2021-08-05 23:27:34'),
(31, 1255, 5020, 1, 1, 'tctgbyv vtv', '5000.00', '10000.00', '10000.00', 0, '2021-08-06', 1, 0, 0, NULL, NULL, 0, '2021-08-05 23:28:49'),
(32, 1284, 5020, 1, 1, 'fxgcyvu h h y', '5000.00', '10000.00', '10000.00', 0, '2021-08-20', 1, 0, 0, NULL, NULL, 0, '2021-08-13 22:56:58'),
(33, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 0, '2021-07-15', 0, 0, 2, NULL, NULL, 0, '2021-09-22 23:08:14'),
(34, 1292, 5020, 1, 1, 'edd', '5000.00', '10000.00', '10000.00', 1, '2021-09-29', 1, 0, 0, NULL, NULL, 0, '2021-09-22 23:53:37'),
(35, 1292, 5020, 1, 1, 'cc', '5000.00', '10000.00', '10000.00', 0, '2021-09-30', 1, 0, 0, NULL, NULL, 0, '2021-09-22 23:54:01'),
(36, 1292, 5020, 1, 2, 'vyc', '5000.00', '15000.00', '15000.00', 0, '2021-09-24', 1, 0, 0, NULL, NULL, 0, '2021-09-23 00:17:04'),
(37, 1292, 5020, 3, 4, 'ivuvu', '5000.00', '35000.00', '35000.00', 0, '2021-09-24', 1, 0, 0, NULL, NULL, 0, '2021-09-23 00:18:10'),
(38, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 0, '2021-07-15', 0, 0, 2, NULL, NULL, 0, '2021-09-23 00:18:38'),
(39, 1292, 5020, 2, 2, 'ggjcvvhc\njvivi\nhxyc', '5000.00', '20000.00', '20000.00', 0, '2021-09-30', 1, 0, 0, NULL, NULL, 0, '2021-09-23 00:30:28'),
(40, 1292, 5020, 2, 1, 'jbv', '5000.00', '15000.00', '15000.00', 0, '2021-09-24', 1, 0, 0, NULL, NULL, 0, '2021-09-23 00:34:42'),
(41, 1292, 5020, 1, 1, 'yfyf', '5000.00', '10000.00', '10000.00', 1, '2021-09-24', 1, 0, 0, NULL, NULL, 0, '2021-09-23 00:48:17'),
(42, 1292, 5020, 4, 3, 'yr dyc', '5000.00', '35000.00', '35000.00', 1, '2021-09-25', 1, 0, 0, NULL, NULL, 0, '2021-09-23 00:49:26'),
(43, 1292, 5020, 1, 1, 'gg', '5000.00', '10000.00', '10000.00', 1, '2021-09-30', 1, 0, 0, NULL, NULL, 0, '2021-09-23 00:50:21'),
(44, 1292, 5020, 1, 1, 'cf', '5000.00', '10000.00', '10000.00', 1, '2021-09-24', 1, 0, 0, NULL, NULL, 0, '2021-09-23 00:57:06'),
(45, 1291, 5020, 2, 2, 'gh', '5000.00', '20000.00', '20000.00', 1, '2021-09-25', 1, 0, 0, NULL, NULL, 0, '2021-09-23 22:48:39'),
(46, 1295, 5020, 1, 1, 'gxt', '5000.00', '10000.00', '10000.00', 1, '2021-09-29', 1, 0, 0, NULL, NULL, 0, '2021-09-28 21:39:40'),
(49, 1294, 5020, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '5000.00', '25000.00', '25000.00', 1, '2021-11-26', 1, 0, 0, NULL, NULL, 0, '2021-09-28 22:24:13'),
(50, 1294, 5020, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '5000.00', '25000.00', '25000.00', 1, '2021-11-26', 1, 0, 0, NULL, NULL, 0, '2021-09-30 21:11:23'),
(51, 1299, 5020, 1, 1, '5g5', '5000.00', '10000.00', '10000.00', 1, '2022-06-10', 1, 0, 0, NULL, NULL, 0, '2021-10-02 17:40:02'),
(52, 1295, 5020, 1, 1, 'gg', '5000.00', '10000.00', '10000.00', 1, '2021-10-12', 1, 0, 0, NULL, NULL, 0, '2021-10-10 02:34:19'),
(53, 1295, 5020, 1, 1, 'hhj', '5000.00', '10000.00', '10000.00', 0, '2021-10-12', 1, 0, 0, NULL, NULL, 0, '2021-10-10 02:50:53'),
(54, 1295, 5020, 1, 1, 'gbh', '5000.00', '10000.00', '10000.00', 1, '2021-10-20', 1, 0, 0, NULL, NULL, 0, '2021-10-10 03:00:19'),
(55, 1295, 5020, 1, 1, 'bbj', '5000.00', '10000.00', '10000.00', 1, '2021-10-14', 1, 0, 1, 1, NULL, 0, '2021-10-10 04:11:17'),
(56, 1290, 5020, 2, 2, 'yxyfuf', '5000.00', '20000.00', '20000.00', 0, '2021-10-01', 1, 0, 2, NULL, NULL, 0, '2021-10-13 22:19:57'),
(57, 1290, 5020, 1, 1, 'huvyv', '5000.00', '10000.00', '10000.00', 1, '2021-10-14', 1, 0, 2, NULL, NULL, 0, '2021-10-13 22:21:26'),
(58, 1290, 5020, 1, 1, 'cyct', '5000.00', '10000.00', '10000.00', 0, '2021-10-21', 1, 0, 2, NULL, NULL, 0, '2021-10-20 00:44:19'),
(59, 1290, 5020, 1, 1, 'cguu', '5000.00', '10000.00', '10000.00', 0, '2021-10-25', 1, 0, 2, NULL, NULL, 0, '2021-10-22 23:25:55'),
(60, 1296, 5020, 1, 1, 'cjcu', '5000.00', '10000.00', '10000.00', 1, '2021-10-27', 1, 0, 0, NULL, NULL, 0, '2021-10-23 22:55:48'),
(61, 1301, 5020, 1, 1, 'hct', '5000.00', '10000.00', '10000.00', 1, '2021-11-14', 1, 0, 2, NULL, NULL, 0, '2021-11-13 13:21:06'),
(62, 1291, 5020, 2, 2, 'gyvyv', '5000.00', '20000.00', '20000.00', 0, '2021-11-24', 1, 0, 0, NULL, NULL, 0, '2021-11-23 22:39:34'),
(63, 1302, 5020, 1, 1, 't', '5000.00', '10000.00', '10000.00', 1, '2021-12-10', 1, 0, 2, NULL, NULL, 0, '2021-12-04 14:37:29'),
(64, 1302, 5020, 1, 1, 'bnm', '5000.00', '10000.00', '10000.00', 1, '2021-12-10', 1, 0, 2, NULL, NULL, 0, '2021-12-04 14:46:10'),
(65, 1302, 5020, 1, 1, 'yvtv', '5000.00', '10000.00', '10000.00', 1, '2021-12-06', 1, 0, 2, NULL, NULL, 0, '2021-12-04 15:37:59'),
(66, 1302, 5020, 1, 1, 'hv', '5000.00', '10000.00', '10000.00', 1, '2021-12-06', 1, 0, 2, NULL, NULL, 0, '2021-12-04 15:38:54'),
(67, 1302, 5020, 1, 1, 'bb', '5000.00', '10000.00', '10000.00', 1, '2021-12-08', 1, 0, 2, NULL, NULL, 0, '2021-12-04 15:56:27'),
(68, 1302, 5020, 1, 1, 'g', '5000.00', '10000.00', '10000.00', 0, '2021-12-05', 1, 0, 2, NULL, NULL, 0, '2021-12-04 16:21:31'),
(69, 1302, 5020, 1, 1, 'vhh', '5000.00', '10000.00', '10000.00', 1, '2021-12-05', 1, 0, 2, NULL, NULL, 0, '2021-12-04 16:29:03'),
(70, 1302, 5020, 1, 1, 'h', '5000.00', '10000.00', '10000.00', 0, '2021-12-08', 1, 0, 2, NULL, NULL, 0, '2021-12-04 16:30:52'),
(71, 1302, 5020, 1, 1, 'g', '5000.00', '10000.00', '10000.00', 1, '2021-12-30', 1, 0, 2, NULL, NULL, 0, '2021-12-04 16:31:46'),
(72, 1302, 5020, 1, 1, 'tvv', '5000.00', '10000.00', '10000.00', 1, '2021-12-10', 1, 0, 2, NULL, NULL, 0, '2021-12-04 17:01:03'),
(73, 1302, 5021, 1, 1, 'yuuvhi', '10.00', '20.00', '20.00', 0, '2021-12-06', 1, 0, 2, NULL, NULL, 0, '2021-12-04 17:03:00'),
(74, 1302, 5020, 1, 1, 'uc', '5000.00', '10000.00', '10000.00', 0, '2021-12-10', 1, 0, 2, NULL, NULL, 0, '2021-12-04 17:10:14'),
(75, 1302, 5020, 1, 1, 'gh', '5000.00', '10000.00', '10000.00', 0, '2021-12-07', 1, 0, 2, NULL, NULL, 0, '2021-12-05 13:06:32'),
(76, 1302, 5020, 1, 1, 'yb', '5000.00', '10000.00', '10000.00', 1, '2021-12-07', 1, 0, 2, NULL, NULL, 0, '2021-12-05 13:18:00'),
(77, 1302, 5020, 1, 1, 'yv', '5000.00', '10000.00', '10000.00', 0, '2021-12-08', 1, 0, 2, NULL, NULL, 0, '2021-12-05 13:40:47'),
(78, 1302, 5020, 1, 1, 'g', '5000.00', '10000.00', '10000.00', 1, '2021-12-16', 1, 0, 2, NULL, NULL, 0, '2021-12-05 13:42:59'),
(79, 1302, 5020, 1, 1, 'yv', '5000.00', '10000.00', '10000.00', 1, '2021-12-09', 1, 0, 2, NULL, NULL, 0, '2021-12-05 17:10:03'),
(80, 1302, 5020, 1, 1, 'gg', '5000.00', '10000.00', '10000.00', 0, '2021-12-23', 1, 0, 2, NULL, NULL, 0, '2021-12-05 17:18:50'),
(81, 1302, 5020, 1, 1, 'gg', '5000.00', '10000.00', '10000.00', 0, '2021-12-16', 1, 0, 2, NULL, NULL, 0, '2021-12-05 18:38:27'),
(82, 1302, 5020, 1, 1, 'tvgu', '5000.00', '10000.00', '10000.00', 1, '2021-12-15', 1, 0, 2, NULL, NULL, 0, '2021-12-05 18:43:27'),
(83, 1302, 5020, 1, 1, 'vghy', '5000.00', '10000.00', '10000.00', 1, '2021-12-09', 1, 0, 2, NULL, NULL, 0, '2021-12-05 18:44:48'),
(84, 1302, 5020, 1, 1, 'xex', '5000.00', '10000.00', '10000.00', 1, '2021-12-30', 1, 0, 2, NULL, NULL, 0, '2021-12-05 19:25:10'),
(85, 1302, 5020, 1, 1, 'u', '5000.00', '10000.00', '10000.00', 1, '2021-12-31', 1, 0, 2, NULL, NULL, 0, '2021-12-05 19:25:39'),
(86, 1302, 5021, 1, 1, 'ttb', '10.00', '20.00', '20.00', 1, '2021-12-10', 1, 0, 2, NULL, NULL, 0, '2021-12-05 22:04:43'),
(87, 1302, 5020, 1, 1, 'v', '5000.00', '10000.00', '10000.00', 0, '2021-12-16', 1, 0, 3, NULL, NULL, 0, '2021-12-05 22:09:56'),
(88, 1302, 5020, 1, 1, 'gvt', '5000.00', '10000.00', '10000.00', 1, '2021-12-16', 1, 0, 0, NULL, NULL, 0, '2021-12-05 22:10:23'),
(89, 1302, 5020, 1, 1, 'b', '5000.00', '10000.00', '10000.00', 0, '2021-12-14', 1, 0, 3, NULL, NULL, 0, '2021-12-05 22:10:49'),
(90, 1302, 5020, 1, 1, 'b', '5000.00', '10000.00', '10000.00', 0, '2021-12-14', 1, 0, 0, NULL, NULL, 0, '2021-12-05 22:10:50'),
(91, 1302, 5020, 1, 1, 'ngyyn', '5000.00', '10000.00', '10000.00', 1, '2021-12-11', 1, 0, 0, NULL, NULL, 0, '2021-12-07 01:14:26'),
(92, 1302, 5021, 1, 1, 'h', '10.00', '20.00', '20.00', 0, '2021-12-25', 1, 0, 0, NULL, NULL, 0, '2021-12-07 01:22:56'),
(93, 1302, 5021, 1, 1, 'h', '10.00', '20.00', '20.00', 0, '2021-12-25', 1, 0, 0, NULL, NULL, 0, '2021-12-07 01:22:56'),
(94, 1300, 5020, 2, 3, 'hh', '5000.00', '25000.00', '25000.00', 1, '2021-12-24', 1, 0, 2, NULL, NULL, 0, '2021-12-11 22:35:55'),
(95, 1304, 5020, 1, 1, 'tvv v', '5000.00', '10000.00', '10000.00', 1, '2021-12-17', 1, 0, 3, NULL, NULL, 0, '2021-12-16 18:32:42'),
(96, 1304, 5020, 1, 1, 'h', '5000.00', '10000.00', '10000.00', 1, '2021-12-17', 1, 0, 3, NULL, NULL, 0, '2021-12-16 22:31:19'),
(97, 1306, 5020, 1, 1, 'v', '5000.00', '10000.00', '10000.00', 1, '2021-12-18', 1, 0, 2, NULL, NULL, 0, '2021-12-17 23:14:06'),
(98, 1306, 5020, 1, 1, 'ffg', '5000.00', '10000.00', '10000.00', 1, '2021-12-18', 1, 0, 2, NULL, NULL, 0, '2021-12-17 23:30:21'),
(99, 1306, 5020, 1, 1, 'yy', '5000.00', '10000.00', '10000.00', 0, '2021-12-18', 1, 0, 2, NULL, NULL, 0, '2021-12-17 23:31:38'),
(100, 1306, 5020, 1, 1, 'fr', '5000.00', '10000.00', '10000.00', 1, '2021-12-19', 1, 0, 2, NULL, NULL, 0, '2021-12-18 00:12:47'),
(101, 1306, 5020, 1, 1, 'ff', '5000.00', '10000.00', '10000.00', 1, '2021-12-20', 1, 0, 3, NULL, NULL, 0, '2021-12-18 00:14:48'),
(102, 1304, 5020, 1, 1, 'hh', '5000.00', '10000.00', '10000.00', 1, '2021-12-20', 1, 0, 0, NULL, NULL, 0, '2021-12-19 15:06:23'),
(103, 1304, 5020, 1, 1, 'v', '5000.00', '10000.00', '10000.00', 1, '2021-12-20', 1, 0, 0, NULL, NULL, 0, '2021-12-19 17:09:13'),
(104, 1304, 5020, 0, 0, 'hbbj', '5000.00', '0.00', '0.00', 1, '2021-12-22', 1, 0, 0, NULL, NULL, 0, '2021-12-21 23:26:43'),
(105, 1304, 5020, 0, 0, 'hhyy', '5000.00', '0.00', '0.00', 0, '2021-12-20', 1, 0, 0, NULL, NULL, 0, '2021-12-21 23:48:06'),
(106, 1304, 5021, 0, 0, 'hzdbdn', '10.00', '0.00', '0.00', 1, '2021-12-23', 1, 0, 0, NULL, NULL, 0, '2021-12-22 00:02:07'),
(107, 1304, 5021, 0, 0, 'bxbdb', '10.00', '0.00', '0.00', 1, '2021-12-23', 1, 0, 0, NULL, NULL, 0, '2021-12-22 01:15:35'),
(108, 1304, 5021, 0, 0, 'bhe', '10.00', '0.00', '0.00', 0, '2021-12-23', 1, 0, 0, NULL, NULL, 0, '2021-12-22 01:16:22'),
(109, 1304, 5020, 0, 0, 'rghrh', '5000.00', '0.00', '0.00', 1, '2021-12-24', 1, 0, 0, NULL, NULL, 0, '2021-12-22 01:17:16'),
(110, 1304, 5020, 0, 0, 'xx', '5000.00', '0.00', '0.00', 1, '2021-12-25', 1, 0, 0, NULL, NULL, 0, '2021-12-22 01:18:19'),
(111, 1304, 5021, 0, 0, 'vb', '10.00', '0.00', '0.00', 1, '2021-12-23', 1, 0, 0, NULL, NULL, 0, '2021-12-22 01:26:59'),
(112, 1304, 5021, 0, 0, 'jji', '10.00', '0.00', '0.00', 1, '2021-12-24', 1, 0, 0, NULL, NULL, 0, '2021-12-22 01:29:24'),
(113, 1304, 5020, 1, 1, 'uhu', '5000.00', '10000.00', '10000.00', 1, '2022-09-01', 1, 0, 2, NULL, NULL, 0, '2022-01-02 15:00:36'),
(114, 1304, 5020, 0, 1, 'ggyg', '5000.00', '5000.00', '5000.00', 1, '2022-09-01', 1, 0, 2, NULL, NULL, 0, '2022-01-02 15:20:13'),
(115, 1304, 5021, 1, 1, 'tj5', '10.00', '20.00', '20.00', 0, '2022-09-01', 1, 0, 2, NULL, NULL, 0, '2022-01-02 15:26:30'),
(116, 1304, 5020, 0, 0, 'yyy', '5000.00', '0.00', '0.00', 0, '2022-09-01', 1, 0, 2, NULL, NULL, 0, '2022-01-02 23:34:39'),
(117, 1304, 5020, 1, 4, 'pdgunj', '5000.00', '25000.00', '25000.00', 1, '2022-04-01', 1, 0, 2, NULL, NULL, 0, '2022-01-03 01:57:06'),
(118, 1304, 5020, 1, 0, 'gg', '5000.00', '5000.00', '5000.00', 0, '2022-12-02', 1, 0, 2, NULL, NULL, 0, '2022-01-11 15:41:26'),
(119, 1304, 5096, 1, 2, 'vyvy', '55.00', '165.00', '165.00', 1, '2022-12-03', 0, 0, 2, NULL, NULL, 0, '2022-02-02 22:41:02'),
(120, 1304, 5096, 0, 0, 'bg', '55.00', '0.00', '0.00', 0, '2022-06-03', 0, 0, 2, NULL, NULL, 0, '2022-02-02 22:42:12'),
(121, 1304, 5096, 1, 0, 'tester', '55.00', '55.00', '55.00', 0, '2022-11-02', 0, 0, 2, NULL, NULL, 0, '2022-02-03 21:27:19'),
(122, 1304, 5096, 2, 0, 'tester', '55.00', '110.00', '110.00', 0, '2022-04-02', 0, 0, 2, NULL, NULL, 0, '2022-02-03 21:28:25'),
(123, 1304, 5096, 0, 0, 'tester 2', '55.00', '0.00', '0.00', 0, '2022-04-02', 0, 0, 2, NULL, NULL, 0, '2022-02-03 21:30:43'),
(124, 1304, 5096, 3, 3, 'hiib', '55.00', '330.00', '330.00', 1, '2022-02-11', 0, 0, 2, NULL, NULL, 0, '2022-02-05 21:05:28'),
(125, 1304, 5096, 2, 2, 'ev', '55.00', '220.00', '220.00', 0, '2022-02-16', 0, 0, 0, NULL, NULL, 0, '2022-02-09 00:29:57'),
(126, 1304, 5097, 1, 0, 'yujjj', '10.00', '10.00', '10.00', 0, '2022-02-20', 0, 0, 0, NULL, NULL, 0, '2022-02-14 23:20:53'),
(127, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 0, '2021-07-15', 0, 0, 0, NULL, NULL, 0, '2022-02-17 22:13:01'),
(128, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 0, '2021-07-15', 0, 0, 0, NULL, NULL, 0, '2022-02-17 22:13:04'),
(129, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 0, '2021-07-15', 0, 0, 0, NULL, NULL, 0, '2022-02-17 22:13:06'),
(130, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 0, '2021-07-15', 0, 0, 0, NULL, NULL, 0, '2022-02-17 22:13:08'),
(131, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 0, '2021-07-15', 0, 0, 0, NULL, NULL, 0, '2022-02-17 22:13:11'),
(132, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 0, '2021-07-15', 0, 0, 0, NULL, NULL, 0, '2022-02-17 22:13:15'),
(133, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 0, '2021-07-15', 0, 0, 0, NULL, NULL, 0, '2022-02-17 22:13:18'),
(134, 1146, 5000, 3, 2, 'Skiing is the best adventure thing you can do in Gulmarg, J&K. For those who love adrenaline junkies, skiing is what you can experience. The ski hill in Gulmarg is serviced by Gondola where the lift tips is about 4,000m with the summit of Mt. Apharwat', '2500.00', '12500.00', '12500.00', 0, '2021-07-15', 0, 0, 1, 1, NULL, 0, '2022-02-17 22:13:33'),
(135, 1304, 5099, 3, 0, 'tour', '12.00', '36.00', '36.00', 0, '2022-03-10', 0, 0, 1, 1, NULL, 0, '2022-02-20 00:34:33'),
(136, 1383, 5015, 5, 2, 'vg', '5000.00', '35000.00', '35000.00', 1, '2022-03-10', 1, 0, 0, NULL, NULL, 0, '2022-03-04 22:47:50'),
(137, 1393, 5110, 2, 0, 'bbb', '22.00', '44.00', '44.00', 0, '2022-03-12', 0, 0, 0, NULL, NULL, 0, '2022-03-06 22:03:01'),
(138, 1393, 5110, 1, 0, 'bb', '22.00', '22.00', '22.00', 1, '2022-03-13', 0, 0, 0, NULL, NULL, 0, '2022-03-07 01:19:54'),
(139, 1393, 5111, 2, 1, 'bjjn h bh', '22.00', '66.00', '66.00', 0, '2022-03-11', 0, 0, 0, NULL, NULL, 0, '2022-03-07 01:52:19'),
(140, 1393, 5112, 1, 1, 'full', '96.00', '192.00', '192.00', 0, '2022-03-11', 0, 0, 0, NULL, NULL, 0, '2022-03-07 02:19:49'),
(141, 1393, 5113, 1, 0, 'bb', '55.00', '55.00', '55.00', 1, '2022-03-12', 0, 0, 1, 1, NULL, 0, '2022-03-08 01:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `city`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Delhi', '2021-07-12 02:39:26', '2021-07-12 02:39:26', NULL),
(2, 2, 'Ghaziabad', '2021-07-12 02:39:26', '2021-07-12 02:39:26', '2021-07-23 16:06:08'),
(3, 1, 'Delhi', '2021-07-12 02:39:32', '2021-07-12 02:39:32', NULL),
(4, 2, 'Ghaziabad', '2021-07-12 02:39:32', '2021-07-12 02:39:32', '2021-08-26 22:11:35'),
(5, 8, 'kkkkkkkkkkkkkkkkkkkk', '2021-07-21 05:24:14', '2021-07-21 05:24:14', '2021-08-04 15:32:12'),
(6, 2, 'kkkkkkkkkkkkkkkkkkkk', '2021-07-21 05:34:40', '2021-07-21 05:34:40', '2021-07-23 16:06:15'),
(7, 4, 'kkkkkkkkkkkkkkkkkkkk', '2021-07-21 05:34:47', '2021-07-21 05:34:47', '2021-07-22 14:50:25'),
(8, 4, 'kkkkkkkkkkkkkkkkkkkk', '2021-07-21 05:34:53', '2021-07-21 05:34:53', '2021-07-22 14:50:20'),
(9, 3, 'kanpur', '2021-07-22 02:52:37', '2021-07-22 02:52:37', '2021-07-22 14:50:13'),
(10, 1, 'mohali', '2021-08-29 00:42:11', '2021-08-29 00:42:11', NULL),
(11, 1, 'sdf', '2021-08-29 00:42:40', '2021-08-29 00:42:40', '2021-08-29 00:42:59'),
(12, 4, 'noida', '2021-09-25 15:24:17', '2021-09-25 15:24:17', '2021-09-25 15:39:46'),
(13, 7, 'Adamddsdsff', '2021-09-25 15:40:52', '2021-09-25 15:40:52', '2021-10-19 15:20:22'),
(14, 7, 'Adam', '2021-09-25 15:41:04', '2021-09-25 15:41:04', '2021-10-19 15:20:27'),
(15, 7, 'As Sib', '2021-09-25 15:41:49', '2021-09-25 15:41:49', '2021-10-19 15:20:32'),
(16, 1, 'spn', '2021-09-25 15:52:29', '2021-09-25 15:52:29', NULL),
(17, 7, 'Izki', '2021-09-25 16:11:27', '2021-09-25 16:11:27', '2021-10-19 15:20:36'),
(18, 1, 'Adam', '2021-10-14 11:31:49', '2021-10-14 11:31:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contactuspurposes`
--

CREATE TABLE `contactuspurposes` (
  `Id` int(11) NOT NULL,
  `contactuspurposeName` varchar(200) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contactuspurposes`
--

INSERT INTO `contactuspurposes` (`Id`, `contactuspurposeName`, `created_at`, `updated_at`) VALUES
(1, 'Kids', '2021-09-01 22:47:38', '2021-09-01 22:47:38'),
(4, 'test2', '2021-09-05 23:19:52', '2021-09-05 23:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us_purpose`
--

CREATE TABLE `contact_us_purpose` (
  `id` int(10) UNSIGNED NOT NULL,
  `purpose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `contact_us_purpose`
--

INSERT INTO `contact_us_purpose` (`id`, `purpose`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Enquiry', 1, '2021-07-14 10:14:22', '2021-07-14 10:14:22', NULL),
(2, 'Testing', 1, '2021-07-14 10:14:22', '2021-07-14 10:14:22', NULL),
(3, 'Question', 1, '2021-07-14 10:14:22', '2021-07-14 10:14:22', NULL),
(4, 'Money deduction', 1, '2021-07-14 10:14:22', '2021-07-14 10:14:22', NULL),
(5, 'Timing', 1, '2021-07-14 10:14:22', '2021-07-14 10:14:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country` varchar(250) CHARACTER SET latin1 NOT NULL,
  `short_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `code` varchar(200) CHARACTER SET latin1 NOT NULL,
  `currency` varchar(100) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country`, `short_name`, `code`, `currency`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'India', 'IND', '+91', '', 'INDIA', '1', '2020-07-18 13:14:16', '2020-07-18 13:14:16', NULL),
(2, 'United State Of America', 'USA', '+1', '', 'United State Of America', '1', '2020-07-18 13:14:16', '2020-07-18 13:14:16', '2021-10-14 11:32:33'),
(3, 'United Arab Emirates', 'UAE', '+971', '', 'United Arab Emirates', '1', '2020-07-18 13:14:16', '2020-07-18 13:14:16', '2021-10-14 11:32:33'),
(4, 'Australia', 'AUS', '+61', '', 'Australia', '1', '2020-07-18 13:14:16', '2020-07-18 13:14:16', '2021-10-14 11:32:33'),
(5, 'Pakistan', 'PAK', '+92', '', 'Pakistan', '1', '2020-07-18 13:14:16', '2020-07-18 13:14:16', '2021-10-14 11:32:33'),
(7, 'Oman', 'OMN', '+968', '', 'Oman', '1', '2021-07-19 10:39:31', '2021-07-19 10:39:31', NULL),
(14, 'INDONESEA', 'INDO', '+62', 'indo doller', '', '1', '2021-09-25 10:12:48', '2021-09-25 10:12:48', '2021-10-14 11:32:33'),
(15, 'JAPAN', 'JAN', '+7', '50', '', '1', '2021-09-25 10:24:49', '2021-09-25 10:24:49', '2021-10-14 11:32:33'),
(16, 'RUSSIA', 'RUS', '+965', '50', '', '1', '2021-09-25 10:39:56', '2021-09-25 10:39:56', '2021-10-14 11:32:33'),
(17, 'GERMANY', 'GRY', '+43', 'gry doller', '', '1', '2021-09-28 16:38:29', '2021-09-28 16:38:29', '2021-10-14 11:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Sign` varchar(200) CHARACTER SET utf16 NOT NULL,
  `name` varchar(250) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 NOT NULL DEFAULT '1',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `Sign`, `name`, `description`, `status`, `updated_at`, `created_at`) VALUES
(7, 'OMR', 'OMR', 'Sultanat of Oman (OMR)', '', '1', '2021-10-19 09:17:28', '2021-10-19 09:17:28'),
(8, 'OMR', '', 'Afghanistan (AFN)', '', '1', '2021-10-19 09:17:52', '2021-10-19 09:17:52'),
(9, 'OMR', '', 'Bangladesh (BDT)', '', '1', '2021-10-19 09:18:03', '2021-10-19 09:18:03'),
(10, 'OMR', '', 'Bhutan (BTN)', '', '1', '2021-10-19 09:18:14', '2021-10-19 09:18:14'),
(11, 'OMR', '', 'Cambodia (KHR)', '', '1', '2021-10-19 09:18:24', '2021-10-19 09:18:24'),
(12, 'OMR', '', 'China (CNY)', '', '1', '2021-10-19 09:18:34', '2021-10-19 09:18:34'),
(13, 'OMR', '', 'India (INR)', '', '1', '2021-10-19 09:18:43', '2021-10-19 09:18:43'),
(14, 'OMR', '', 'Israel (ILS)', '', '1', '2021-10-19 09:18:52', '2021-10-19 09:18:52'),
(15, 'Rupey', '', 'Japan (JPY)', '', '1', '2021-10-19 09:19:05', '2021-10-19 09:19:05'),
(16, 'Doller', '', 'Kuwait (KWD)', '', '1', '2021-10-19 09:19:16', '2021-10-19 09:19:16'),
(17, 'OMR', '', 'Laos (LAK)', '', '1', '2021-10-19 09:19:26', '2021-10-19 09:19:26'),
(18, 'OMR', '', 'Malaysia (MYR)', '', '1', '2021-10-19 09:19:36', '2021-10-19 09:19:36'),
(19, 'OMR', '', 'Nepal (NPR)', '', '1', '2021-10-19 09:19:43', '2021-10-19 09:19:43'),
(20, 'OMR', '', 'North Korea (KPW)', '', '1', '2021-10-19 09:20:03', '2021-10-19 09:20:03'),
(21, 'OMR', '', 'Philippines (PHP)', '', '1', '2021-10-19 09:20:13', '2021-10-19 09:20:13'),
(22, 'OMR', '', 'South Korea (KRW)', '', '1', '2021-10-19 09:20:23', '2021-10-19 09:20:23'),
(23, 'OMR', '', 'United Arab Emirates (AED)', '', '1', '2021-10-19 09:20:35', '2021-10-19 09:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `dependency`
--

CREATE TABLE `dependency` (
  `id` int(11) NOT NULL,
  `dependency_name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dependency`
--

INSERT INTO `dependency` (`id`, `dependency_name`, `updated_at`, `created_at`) VALUES
(1, 'Wather', '2022-03-08 08:50:04', '2021-08-28 19:39:38'),
(2, 'Health Condition', '2022-03-08 08:50:04', '2021-08-28 19:39:38'),
(3, 'Licence', '2022-03-08 08:50:04', '2021-08-28 19:39:38');

-- --------------------------------------------------------

--
-- Table structure for table `durations`
--

CREATE TABLE `durations` (
  `id` int(10) UNSIGNED NOT NULL,
  `duration` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `minutes` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `durations`
--

INSERT INTO `durations` (`id`, `duration`, `minutes`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, '15 Minutes', 0, 1, '2021-10-19 13:23:23', '2021-10-19 13:23:23', NULL),
(14, '30 Minutes', 0, 1, '2021-10-19 13:23:34', '2021-10-19 13:23:34', NULL),
(15, '45 Minutes', 0, 1, '2021-10-19 13:23:53', '2021-10-19 13:23:53', NULL),
(16, '1 Hour', 0, 1, '2021-10-19 13:24:10', '2021-10-19 13:24:10', NULL),
(17, '2 Hours', 0, 1, '2021-10-19 13:24:36', '2021-10-19 13:24:36', NULL),
(18, '3 Hours', 0, 1, '2021-10-19 13:24:53', '2021-10-19 13:24:53', NULL),
(19, '4 Hours', 0, 1, '2021-10-19 13:25:02', '2021-10-19 13:25:02', NULL),
(20, '5 Hours', 0, 1, '2021-10-19 13:25:10', '2021-10-19 13:25:10', NULL),
(21, '6 Hours', 0, 1, '2021-10-19 13:25:26', '2021-10-19 13:25:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES
(1, 1393, 5000, '2022-01-01 19:31:13', '2022-01-02 22:09:56'),
(2, 1146, 5002, '2022-02-17 22:14:24', '2022-02-17 22:14:33');

-- --------------------------------------------------------

--
-- Table structure for table `get_all_paymentmode`
--

CREATE TABLE `get_all_paymentmode` (
  `id` int(11) NOT NULL,
  `payment_name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `payment_image` varchar(200) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `get_all_paymentmode`
--

INSERT INTO `get_all_paymentmode` (`id`, `payment_name`, `payment_image`) VALUES
(1, 'Bank Muskat', ''),
(2, 'pay on arrival', '');

-- --------------------------------------------------------

--
-- Table structure for table `health_conditions`
--

CREATE TABLE `health_conditions` (
  `id` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `health_conditions`
--

INSERT INTO `health_conditions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Good condition', '2021-09-01 22:47:38', '2021-09-01 22:47:38'),
(4, 'Bone weakness', '2021-09-05 07:05:45', '2021-09-05 07:05:45'),
(6, 'Breath weakness', '2021-09-22 21:46:23', '2021-09-22 21:46:23'),
(7, 'Muscles issues', '2021-09-22 21:46:44', '2021-09-22 21:46:44'),
(8, 'Backbone issues', '2021-09-22 21:47:04', '2021-09-22 21:47:04'),
(9, 'Joints issues', '2021-09-22 21:47:24', '2021-09-22 21:47:24'),
(10, 'Ligament issues', '2021-09-22 21:49:44', '2021-09-22 21:49:44'),
(11, 'Not good conditions', '2021-09-22 21:49:44', '2021-09-22 21:49:44'),
(12, 'High blood pressure', '2021-09-22 21:50:20', '2021-09-22 21:50:20'),
(13, 'Low blood pressure', '2021-09-22 21:50:20', '2021-09-22 21:50:20'),
(14, 'High diabetes', '2021-09-22 21:50:42', '2021-09-22 21:50:42');

-- --------------------------------------------------------

--
-- Table structure for table `heights`
--

CREATE TABLE `heights` (
  `Id` int(11) NOT NULL,
  `heightName` varchar(200) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `heights`
--

INSERT INTO `heights` (`Id`, `heightName`, `created_at`, `updated_at`) VALUES
(6, 'Between 122cm (4ft) and 130cm (4.27ft)', '2021-10-19 14:30:42', '2021-10-19 14:30:42'),
(7, 'Between 130cm (4.27ft) and 140cm (4.59ft)', '2021-10-19 14:30:58', '2021-10-19 14:30:58'),
(8, 'Between 140cm (4.59ft) and 150cm (4.92ft)', '2021-10-19 14:31:07', '2021-10-19 14:31:07'),
(9, 'Between 150cm (4.92ft) and 160cm (5.25ft)', '2021-10-19 14:31:17', '2021-10-19 14:31:17'),
(10, 'Between 160cm (5.25ft) and 170cm (5.58ft)', '2021-10-19 14:31:30', '2021-10-19 14:31:30'),
(11, 'Between 170cm (5.58ft) and 180cm (5.91ft)', '2021-10-19 14:31:39', '2021-10-19 14:31:39'),
(12, 'Between 180cm (5.91ft) and 190cm (6.23ft)', '2021-10-19 14:31:53', '2021-10-19 14:31:53'),
(13, 'Between 190cm (6.23ft) and 200cm (6.56ft)', '2021-10-19 14:32:01', '2021-10-19 14:32:01'),
(14, 'Between 200cm (6.56ft) and 201cm (6.59ft)', '2021-10-19 14:32:10', '2021-10-19 14:32:10');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`, `description`, `status`, `updated_at`, `created_at`) VALUES
(1, 'hn', 'Hindi', 'Hindi', '1', '2020-07-18 13:14:16', '2020-07-18 13:14:16'),
(2, 'en', 'English', 'English', '1', '2020-07-18 13:14:16', '2020-07-18 13:14:16'),
(3, 'fr', 'French', 'French', '1', '2020-07-18 13:14:16', '2020-07-18 13:14:16'),
(4, 'zh-hans', 'Chinese', 'Chinese', '1', '2020-07-18 13:14:16', '2020-07-18 13:14:16'),
(5, 'ar', 'Arabic', 'Arabic', '1', '2020-07-18 13:14:16', '2020-07-18 13:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT current_timestamp(),
  `send_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `sender_id`, `user_id`, `title`, `message`, `is_approved`, `created_at`, `send_at`) VALUES
(1, 1, 1290, 'Your request has bee Unapproved', 'Now you may proceed to buy subscription package & will be able to provide your service.', '0', '2022-03-14 12:40:44', NULL),
(2, 1, 1290, 'Your request has bee approved', 'Now you may proceed to buy subscription package & will be able to provide your service.', '0', '2022-03-14 12:40:49', NULL),
(3, 1, 1290, 'Your request has bee Unapproved', 'Now you may proceed to buy subscription package & will be able to provide your service.', '0', '2022-03-14 12:40:59', NULL),
(4, 1, 1290, 'Your request has bee approved', 'Now you may proceed to buy subscription package & will be able to provide your service.', '0', '2022-03-14 12:43:49', NULL),
(5, 1, 1290, 'Your request has bee approved', 'Now you may proceed to buy subscription package & will be able to provide your service.', '0', '2022-03-14 12:43:57', NULL),
(6, 1, 1255, 'Your request has been approved', 'Now you may proceed to buy subscription package & will be able to provide your service.', '1', '2022-03-14 15:12:16', NULL),
(7, 1, 1255, 'Your request has been approved', 'Now you may proceed to buy subscription package & will be able to provide your service.', '1', '2022-03-14 15:22:01', NULL),
(8, 1, 1256, 'Your request has been approved', 'Now you may proceed to buy subscription package & will be able to provide your service.', '1', '2022-03-30 14:35:04', NULL),
(9, 1, 1256, 'Your request has been Unapproved', 'Now you may proceed to buy subscription package & will be able to provide your service.', '0', '2022-03-30 14:35:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `otp_on` tinyint(3) UNSIGNED DEFAULT 1 COMMENT '1=Mobile,2=Email',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=SignUp,2=Forgot Password,3=Login,4=ChnageMobileNumber',
  `email` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `mobile_code` tinyint(4) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `otp` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1=Verified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `user_id`, `otp_on`, `type`, `email`, `mobile_code`, `mobile`, `otp`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 1354, 1, 1, NULL, 91, 7905848399, 6500, '2022-03-02 00:03:52', '2022-03-02 00:04:26', NULL, 0),
(2, 1355, 1, 1, NULL, 91, 7905848366, 8782, '2022-03-02 00:04:36', '2022-03-02 00:04:36', NULL, 0),
(3, 1356, 1, 1, NULL, 127, 96183588, 3763, '2022-03-02 00:05:00', '2022-03-02 00:05:00', NULL, 0),
(4, 1350, 1, 1, NULL, 127, 96183589, 2290, '2022-03-02 00:05:08', '2022-03-02 00:05:08', NULL, 0),
(5, 1357, 1, 1, NULL, 127, 96183559, 9023, '2022-03-02 00:05:19', '2022-03-02 00:05:19', NULL, 0),
(6, 1358, 1, 1, NULL, 127, 96183859, 1526, '2022-03-02 00:05:29', '2022-03-02 00:07:13', NULL, 0),
(7, 1359, 1, 1, NULL, 127, 96883859, 8461, '2022-03-02 00:05:37', '2022-03-02 00:05:48', NULL, 0),
(8, 1360, 1, 1, NULL, 127, 9, 5844, '2022-03-02 00:05:57', '2022-03-02 00:05:57', NULL, 0),
(9, 1361, 1, 1, NULL, 127, 96183859000, 2511, '2022-03-02 00:06:40', '2022-03-02 00:06:40', NULL, 0),
(10, 1362, 1, 1, NULL, 127, 961838590, 5059, '2022-03-02 00:06:59', '2022-03-02 00:06:59', NULL, 0),
(11, 1363, 1, 1, NULL, 127, 16183859, 8394, '2022-03-02 00:07:30', '2022-03-02 00:07:30', NULL, 0),
(12, 1364, 1, 1, NULL, 96, 98183859, 6111, '2022-03-02 00:07:49', '2022-03-02 00:08:08', NULL, 0),
(13, 1365, 1, 1, NULL, 127, 98193859, 3128, '2022-03-02 00:08:32', '2022-03-02 00:08:32', NULL, 0),
(14, 1366, 1, 1, NULL, 127, 98193851, 6368, '2022-03-02 00:08:41', '2022-03-02 00:08:41', NULL, 0),
(15, 1367, 1, 1, NULL, 127, 98193881, 3421, '2022-03-02 00:10:24', '2022-03-02 00:15:15', NULL, 0),
(16, 1318, 1, 1, NULL, 91, 7905848385, 3296, '2022-03-02 00:14:46', '2022-03-02 00:14:46', NULL, 0),
(18, 1369, 1, 1, NULL, 127, 9819389, 8670, '2022-03-02 00:21:29', '2022-03-02 00:21:29', NULL, 0),
(19, 1370, 1, 1, NULL, 127, 9819387, 3102, '2022-03-02 00:21:51', '2022-03-02 00:21:51', NULL, 0),
(20, 1371, 1, 1, NULL, 127, 9612345678, 2580, '2022-03-02 00:22:17', '2022-03-02 00:22:17', NULL, 0),
(22, 1373, 1, 1, NULL, 127, 96123400, 5818, '2022-03-03 21:52:19', '2022-03-03 21:52:19', NULL, 0),
(23, 1374, 1, 1, NULL, 127, 961234555, 6399, '2022-03-03 21:53:28', '2022-03-03 21:53:28', NULL, 0),
(25, 1376, 1, 1, NULL, 127, 96123454, 6835, '2022-03-03 21:59:21', '2022-03-03 21:59:59', NULL, 0),
(27, 1378, 1, 1, NULL, 91, 9627224181, 2846, '2022-03-03 22:13:45', '2022-03-03 22:13:45', NULL, 0),
(29, 1380, 1, 1, NULL, 127, 961234588, 4043, '2022-03-03 23:10:13', '2022-03-03 23:10:13', NULL, 0),
(31, 1382, 1, 1, NULL, 91, 6394309269, 5351, '2022-03-03 23:23:45', '2022-03-03 23:23:45', NULL, 0),
(38, 1389, 1, 1, NULL, 127, 9658253838, 6148, '2022-03-05 19:44:26', '2022-03-05 19:44:26', NULL, 0),
(39, 1390, 1, 1, NULL, 91, 9627204147, 5095, '2022-03-05 19:44:49', '2022-03-05 19:44:49', NULL, 0),
(44, 1339, 1, 1, NULL, 127, 96000891, 9068, '2022-03-07 19:34:20', '2022-03-07 19:39:13', NULL, 0),
(47, 1335, 1, 1, NULL, 127, 95378573, 7112, '2022-03-08 00:05:18', '2022-03-08 00:06:14', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `cost` varchar(11) NOT NULL,
  `offer_cost` varchar(225) NOT NULL,
  `days` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `title`, `symbol`, `duration`, `cost`, `offer_cost`, `days`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Startup', '$', '1 Week', '25.00', '0.00', 7, 1, '2021-07-30 16:05:39', '2021-10-09 01:02:12', '2021-10-09 01:02:12'),
(2, 'Advanced', '$', '3 Months', '100.00', '50.00', 30, 1, '2021-07-30 16:07:16', '2021-07-30 16:07:16', '0000-00-00 00:00:00'),
(3, 'Platinum', '$', '6 Months', '150.00', '100.00', 180, 1, '2021-07-30 16:07:37', '2021-07-30 16:07:37', '0000-00-00 00:00:00'),
(4, 'Diamond', '$', '12 Months', '200.00', '150.00', 360, 1, '2021-07-30 16:08:01', '2021-09-29 08:03:05', '0000-00-00 00:00:00'),
(6, 'Free', '', '1', '0.00', '0.00', 0, 1, '2022-03-12 17:45:05', '2022-03-12 17:45:05', '0000-00-00 00:00:00'),
(7, 'GOLD', '', '2', '20.00', '0.00', 0, 1, '2022-03-13 15:50:16', '2022-03-13 15:50:16', '0000-00-00 00:00:00'),
(8, '5675675', '', '4', '0', '', 0, 0, '2022-03-14 15:15:34', '2022-03-14 15:15:34', '0000-00-00 00:00:00'),
(9, 'Test', '', '1', '345', '', 0, 0, '2022-03-28 17:27:10', '2022-03-28 17:27:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `package_detail`
--

CREATE TABLE `package_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Exclude,1=Include'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `package_detail`
--

INSERT INTO `package_detail` (`id`, `package_id`, `title`, `type`) VALUES
(1, 1, 'This is first includes', 1),
(2, 1, 'This is first excludes', 0),
(3, 2, 'This is first includes', 1),
(4, 2, 'This is first excludes', 0),
(5, 3, 'This is first includes', 1),
(6, 3, 'This is first excludes', 0),
(7, 4, 'This is first includes', 1),
(8, 4, 'This is first excludes', 0),
(9, 5, 'Sample message 1', 1),
(10, 5, 'Sample message 2', 1),
(11, 5, 'Sample message 3', 1),
(12, 5, 'Sample message 5', 0),
(13, 5, 'Sample message 6', 0),
(14, 5, 'Sample message 7', 0),
(15, 8, '80987089089089089098jhkghfjgjhgj', 1),
(16, 8, '80987089089089089098jhkghfjgjhgj', 0),
(17, 9, '1tryeryereryyrty', 1),
(18, 9, '2rtyrtyyyyyyyyyyrty', 1),
(19, 9, '3rtytryerttryrtytry', 1),
(20, 9, 'a456456546546456', 0),
(21, 9, 'b456546456546546', 0),
(22, 9, 'c6546456456456456', 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `token` varchar(100) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(0, 'shradha15.kapoor@gmail.com', '$2y$10$KTKmlmEwXqQPzzu7ucqcluzxlCSj2AsF65v85utK3K0Qj2tAwGFRO', '2021-05-22 18:17:20'),
(0, 'shradha15.kapoor@gmail.com', 'E6W1NSupNu1YqsWlFJYn4wpRxtB7DYN4CYh8yKZ9faTJdz1uwHMNMr6ujw1GvTkB', '2021-05-22 18:19:39'),
(0, 'shradha15.kapoor@gmail.com', 'xpcHc0gMjJMSlF1nHMmGmegMjHHNFHuKugKepEcvS2n1tsIs98OU3vjvIvpplhgJ', '2021-05-22 22:22:56'),
(0, 'shradha15.kapoor@gmail.com', 'J3XwC9BQnMfOo1WZnF1ZYJmzZ3S0m6JSA58EeHsCxjbbndsjcuyD7eIXuvaEqr5U', '2021-05-22 22:23:39'),
(0, 'shradha15.kapoor@gmail.com', '9QSykz6PWU9dUfhvV5zkNDqNfv4rk3FS5NirzAryN3xzJhtE60hwXSYHyDPGXK7J', '2021-05-22 22:36:28'),
(0, 'shradha15.kapoor@gmail.com', '1V8UhoCHDeDw0ArilJ6ebaSgRnaxVAhHjFNw1FFresLJtygrv0ycqH9zFO2ytbFv', '2021-05-22 22:37:07'),
(0, 'shradha15.kapoor@gmail.com', 'qxy6KXuXydH1gbAECmrsZ8Iiyib5kqAdACQY29KEREX4OGaTI8SLPuPy2W6sHuiW', '2021-05-22 22:39:10'),
(0, 'shradha15.kapoor@gmail.com', 'MwIy6mJvAijCKFvC0EfpNzFP7wPT2V4uru5NNyEZMWGp1X7uNvlVIdYfHB3qyHs9', '2021-05-22 22:58:08'),
(0, 'shradha15.kapoor@gmail.com', 'x9vRWpuB5lYbiELTW3umEvHALTWl1nZF3ILDP2DwGw6FXWTAfKu2Cw3okwx9WUyL', '2021-05-22 23:39:27'),
(0, 'shradha15.kapoor@gmail.com', 'gjaDcfwITVBVa3g3uY2HOKg2EZ5rwgFwHwVSEpzmXL09Qi9i3CJHIFcDr2ZKkRsR', '2021-06-04 19:45:40'),
(0, 'admin@gmail.com', 'BwRVTgZaxkHcaOT7WMQfas64wx6iDxOsQyyo08dQKOdXSfGWakw8C46SFrpJY1px', '2021-06-23 12:21:02'),
(0, 'admin@gmail.com', 'gTlXWnMDNkoon8RE2Qg8ZZNFUMyznfhuZhzAp8b97Gn5GgNaPcLABxoUXuxAbAfO', '2021-07-12 15:42:19'),
(0, 'admin@gmail.com', 'MrnQz3AvLOqkmoKqAHhe4F76i4CPBPX7zffWTTPXYqUWtA7CyegYpv55UteO68yF', '2021-08-09 13:00:17'),
(0, 'admin@gmail.com', 'iAZe6hdFLLkqQOcYG3jOeYOuIkLW2pBc5gkAkUnHSJZJcFJZDcpEvLGBilM2MSpx', '2021-08-09 13:08:01'),
(0, 'admin@gmail.com', 'bngrvIqW9o2GvOEUEtg0aF2Qa7Dv01phwLjHGbglvieAeZ59etjUltxGHffnEZLC', '2021-08-09 13:08:27'),
(0, 'admin@gmail.com', 'XO90mDIlYSXCZGAXoCfFf2MOep4Lkhrts6fGGDv4gEpYlnLgi6kdMkdQDkRzWN60', '2021-08-09 13:08:34');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `transaction_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_date` datetime NOT NULL,
  `account_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '1=Success,2=Failed',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `service_id`, `booking_id`, `payment_method`, `amount`, `transaction_id`, `transaction_date`, `account_name`, `status`, `created_at`) VALUES
(1, 1255, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-08-05 01:09:38'),
(2, 1146, 5000, 29, 'Online', '12500.00', '236527653456345', '2021-08-19 00:00:00', 'Abc', 1, '2021-08-05 23:16:03'),
(3, 1255, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-08-05 23:21:25'),
(4, 1255, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-08-06 02:14:56'),
(5, 1290, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-13 23:22:22'),
(6, 1290, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-23 03:25:06'),
(7, 1290, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-23 03:25:10'),
(8, 1290, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-23 03:31:32'),
(9, 1290, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-23 03:31:59'),
(10, 1290, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-23 03:32:08'),
(11, 1290, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-23 03:35:09'),
(12, 1290, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-23 03:51:43'),
(13, 1290, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-23 04:05:55'),
(14, 1290, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-23 04:05:56'),
(15, 1290, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-23 04:09:33'),
(16, 1290, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-23 04:32:26'),
(17, 1296, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-23 22:56:08'),
(18, 1296, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-10-23 23:47:39'),
(19, 1291, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-11-23 23:30:00'),
(20, 1291, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-11-23 23:30:02'),
(21, 1291, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-11-23 23:36:46'),
(22, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 12:33:21'),
(23, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 13:06:51'),
(24, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 13:11:14'),
(25, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 13:18:11'),
(26, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 13:43:15'),
(27, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 16:23:19'),
(28, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 17:00:39'),
(29, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 17:10:47'),
(30, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 17:16:44'),
(31, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 17:39:55'),
(32, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 18:20:11'),
(33, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 18:52:07'),
(34, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 19:00:00'),
(35, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 19:02:35'),
(36, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 19:04:01'),
(37, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 19:17:30'),
(38, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 19:39:00'),
(39, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 21:20:50'),
(40, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 21:37:47'),
(41, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 21:39:23'),
(42, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 21:40:31'),
(43, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 21:51:15'),
(44, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 21:53:34'),
(45, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 22:07:37'),
(46, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 22:21:24'),
(47, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 22:26:22'),
(48, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-05 23:15:43'),
(49, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-06 00:21:03'),
(50, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-07 00:14:28'),
(51, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-07 00:58:12'),
(52, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-07 01:14:41'),
(53, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-07 01:23:07'),
(54, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-07 23:28:18'),
(55, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-08 00:01:48'),
(56, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-08 00:14:13'),
(57, 1302, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-08 00:19:16'),
(58, 1300, 5000, 20, 'Online', '10000.00', '10000', '2021-07-10 00:00:00', 'Abc', 1, '2021-12-11 22:36:12');

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `PersonID` int(11) DEFAULT NULL,
  `LastName` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `FirstName` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `City` varchar(255) CHARACTER SET latin1 DEFAULT 'Dubai'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`PersonID`, `LastName`, `FirstName`, `Address`, `City`) VALUES
(NULL, NULL, NULL, NULL, 'Dubai'),
(NULL, NULL, NULL, NULL, 'Lahore');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policy`
--

CREATE TABLE `privacy_policy` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `privacy_policy`
--

INSERT INTO `privacy_policy` (`id`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cybersecurity should underpin digital payment infrastructures', 'As we come close to a year of being separated from our colleagues, friends, family, and conductingboth our professional and personal lives through our laptop and phone screens - its a good time totake a step back and re-evaluate the p', '2021-07-28 05:05:25', '2021-07-28 05:05:25', NULL),
(2, 'Tapping into the data boom with DBaaS', 'MultiCloud is here to stay and is slowly becoming inevitable for many organizations. At the same time, it is important to go beyond the hype of the buzzword and understand where it can help,andwhere it cannot. One of the common benef', '2021-07-28 05:05:25', '2021-07-28 05:05:25', NULL),
(3, 'IoT Security: Is Blockchain the way to go?', 'The first-generation blockchain has demonstrated immense value being a secure and cost effective way for recording and maintaining history of transactions for asset tracking purposes. What makes Blockchain secure is the fact that it is a', '2021-07-28 05:05:25', '2021-07-28 05:05:25', NULL),
(4, 'As we increase our tech-dependence, be vigilant about protecting data', 'Like much of the world, Indias enterprises saw a significant advancement in technology use over the past year, and the digital transformation of enterprises is expected to maintain its momentum.The business opportunities presented by', '2021-07-28 05:05:25', '2021-07-28 05:05:25', NULL),
(5, 'Recommended yoga adventure travel programs:', 'Is there anything like being within arms reach of a lion to prickle your senses and make you feel alive? Take a walk on the wild side. Channel your inner Indiana Jones with an adventure travel program unlike anything you’ve ever done before. Safari travelers can expect plenty of hair-raising, tail-spinning sights in unlikely destinations.', '2021-07-28 05:05:25', '2021-07-28 05:05:25', NULL),
(6, 'Recommended summer camp programs:', 'That one time at band camp” became a cliche for a reason: because summer camp is the ultimate source of absurd and wonderful adventures – the kind you can embarrass your grandchildren with for decades to come. Count on plenty of crafting with natural materials, group hiking, and schmoozing with co-eds on your summer camp adventure travel program. The campfire songs and s’mores at the end of each night are just the icing on the cake.', '2021-07-28 05:05:25', '2021-07-28 05:05:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET latin1 NOT NULL,
  `status` enum('1','0') CHARACTER SET latin1 NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pick and drop from gathering location', '1', '2022-03-08 08:50:04', '2020-07-21 08:36:17'),
(2, 'Team introduction (welcome tea)', '1', '2022-03-08 08:50:04', '2020-07-21 08:36:17'),
(3, 'Brief on the planned distination', '1', '2022-03-08 08:50:04', '2020-07-21 08:36:17'),
(4, 'Drive to the hike start point.', '1', '2022-03-08 08:50:04', '2020-07-21 08:36:17'),
(19, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-22 12:59:07'),
(20, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-22 12:59:07'),
(21, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-22 12:59:07'),
(22, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-22 12:59:07'),
(23, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-22 13:02:45'),
(24, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-22 13:02:45'),
(25, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-22 13:02:45'),
(26, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-22 13:02:45'),
(27, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-22 13:07:28'),
(28, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-22 13:07:28'),
(29, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-22 13:07:28'),
(30, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-22 13:07:28'),
(31, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-23 05:38:51'),
(32, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-23 05:38:51'),
(33, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-23 05:38:51'),
(34, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-23 05:38:51'),
(35, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-23 08:40:36'),
(36, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-23 08:40:36'),
(37, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-23 08:40:36'),
(38, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-23 08:40:36'),
(39, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-23 08:40:48'),
(40, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-23 08:40:48'),
(41, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-23 08:40:48'),
(42, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-23 08:40:48'),
(43, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-23 10:47:37'),
(44, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-23 10:47:37'),
(45, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-23 10:47:37'),
(46, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-23 10:47:37'),
(47, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-23 10:52:00'),
(48, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-23 10:52:00'),
(49, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-23 10:52:00'),
(50, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-23 10:52:00'),
(51, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-23 10:52:54'),
(52, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-23 10:52:54'),
(53, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-23 10:52:54'),
(54, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-23 10:52:54'),
(55, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-23 10:58:41'),
(56, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-23 10:58:41'),
(57, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-23 10:58:41'),
(58, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-23 10:58:41'),
(59, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-23 11:39:30'),
(60, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-23 11:39:30'),
(61, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-23 11:39:30'),
(62, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-23 11:39:30'),
(63, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 04:55:59'),
(64, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-24 04:55:59'),
(65, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-24 04:55:59'),
(66, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-24 04:55:59'),
(67, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:05:56'),
(68, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-24 11:05:56'),
(69, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-24 11:05:56'),
(70, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-24 11:05:56'),
(71, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:07:31'),
(72, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:07:51'),
(73, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:08:05'),
(74, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:08:18'),
(75, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:09:05'),
(76, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:09:25'),
(77, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:10:59'),
(78, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:00'),
(79, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:08'),
(80, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:08'),
(81, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:17'),
(82, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:17'),
(83, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:17'),
(84, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:17'),
(85, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:37'),
(86, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:37'),
(87, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:37'),
(88, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:37'),
(89, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:46'),
(90, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:46'),
(91, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:46'),
(92, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-24 11:20:46'),
(93, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:21:01'),
(94, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-24 11:21:01'),
(95, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-24 11:21:01'),
(96, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-24 11:21:01'),
(97, 'hello', '1', '2022-03-08 08:50:04', '2020-09-24 11:23:01'),
(98, 'hello', '1', '2022-03-08 08:50:04', '2020-09-24 11:23:31'),
(99, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:23:56'),
(100, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-24 11:23:56'),
(101, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-24 11:23:56'),
(102, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-24 11:23:56'),
(103, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:25:01'),
(104, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-24 11:25:01'),
(105, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-24 11:25:01'),
(106, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-24 11:25:01'),
(107, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:26:01'),
(108, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-24 11:26:01'),
(109, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-24 11:26:01'),
(110, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-24 11:26:01'),
(111, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-24 11:26:07'),
(112, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-24 11:26:07'),
(113, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-24 11:26:07'),
(114, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-24 11:26:07'),
(115, 'hello', '1', '2022-03-08 08:50:04', '2020-09-24 11:26:29'),
(116, 'hello', '1', '2022-03-08 08:50:04', '2020-09-24 11:26:52'),
(117, 'hello', '1', '2022-03-08 08:50:04', '2020-09-24 11:27:02'),
(118, 'hello', '1', '2022-03-08 08:50:04', '2020-09-24 11:27:17'),
(119, 'hello', '1', '2022-03-08 08:50:04', '2020-09-24 11:27:48'),
(120, 'hello', '1', '2022-03-08 08:50:04', '2020-09-24 11:35:17'),
(121, 'test1', '1', '2022-03-08 08:50:04', '2020-09-24 11:39:28'),
(122, 'hhb', '1', '2022-03-08 08:50:04', '2020-09-24 11:43:19'),
(123, 'ff', '1', '2022-03-08 08:50:04', '2020-09-24 11:50:21'),
(124, 'prg-2', '1', '2022-03-08 08:50:04', '2020-09-25 05:05:50'),
(125, 'prg-1', '1', '2022-03-08 08:50:04', '2020-09-25 05:05:50'),
(126, 'prg-3', '1', '2022-03-08 08:50:04', '2020-09-25 05:05:50'),
(127, 'prg-4', '1', '2022-03-08 08:50:04', '2020-09-25 05:05:50');

-- --------------------------------------------------------

--
-- Table structure for table `promocode`
--

CREATE TABLE `promocode` (
  `id` int(11) NOT NULL,
  `promocode_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '''0''=>InActive,''1''=>Active',
  `discount_type` enum('A','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '''A''=>''Amount'', ''P''=>''Percentage''',
  `discount_amount` int(11) NOT NULL,
  `redeemed_count` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `promocode`
--

INSERT INTO `promocode` (`id`, `promocode_name`, `code`, `status`, `discount_type`, `discount_amount`, `redeemed_count`, `start_date`, `end_date`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'pnaewwiq', 'HSUQowYV', '0', 'A', 22, 33, '2021-07-08', '2021-07-19', 'edfdf', '2021-07-08 16:45:49', '2022-03-08 08:50:04', NULL),
(2, 'testdata1g', 'PER55YET', '1', 'A', 34, 44, '2021-07-11', '2021-07-19', 'dfdff', '2021-07-08 17:30:10', '2022-03-08 08:50:04', NULL),
(3, 'testdata12r', 'PER2Y2ET', '1', 'A', 34, 44, '2021-07-12', '2021-07-19', 'dfdff', '2021-07-08 17:31:16', '2022-03-08 08:50:04', NULL),
(4, 'testdata12re', 'PER2Y2Etr', '1', 'A', 34, 44, '2021-07-12', '2021-07-19', 'dfdff', '2021-07-08 18:08:40', '2022-03-08 08:50:04', NULL),
(5, '50off', 'offcode567', '1', 'A', 50, 600, '2021-08-29', '2021-09-15', 'hgjhkhjkjkj', '2021-09-28 21:56:20', '2022-03-08 08:50:04', NULL),
(6, 'OOREDOO', 'ooredoo-xyz789', '1', 'P', 25, 90, '2021-10-01', '2021-10-31', 'OOREDOO promo code', '2021-10-19 12:45:01', '2022-03-08 08:50:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promocode_users`
--

CREATE TABLE `promocode_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `promocode_id` int(10) UNSIGNED NOT NULL,
  `promocode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `disc_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `disc_amt` decimal(16,2) NOT NULL,
  `service_amt_befor_disc` decimal(16,2) NOT NULL,
  `service_amt_after_disc` decimal(16,2) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `promocode_users`
--

INSERT INTO `promocode_users` (`id`, `booking_id`, `user_id`, `service_id`, `promocode_id`, `promocode`, `disc_type`, `disc_amt`, `service_amt_befor_disc`, `service_amt_after_disc`, `created_at`) VALUES
(1, 1, 1146, 5001, 4, 'PER2Y2Etr', 'A', '34.00', '7500.00', '7466.00', '2021-07-11 00:23:43'),
(2, 27, 1147, 5000, 4, 'PER2Y2Etr', 'A', '34.00', '12500.00', '12466.00', '2021-07-18 02:24:48'),
(3, 28, 1146, 5000, 4, 'PER2Y2Etr', 'A', '34.00', '12500.00', '12466.00', '2021-07-18 02:25:37'),
(4, 29, 1146, 5000, 4, 'PER2Y2Etr', 'A', '34.00', '12500.00', '12466.00', '2021-07-18 02:25:45'),
(5, 1, 1146, 5000, 4, 'PER2Y2Etr', 'A', '34.00', '12500.00', '12466.00', '2021-07-21 01:55:26'),
(6, 2, 1146, 5000, 4, 'PER2Y2Etr', 'A', '34.00', '12500.00', '12466.00', '2021-07-21 01:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `question_reports`
--

CREATE TABLE `question_reports` (
  `id` int(11) NOT NULL,
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailid` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `question_reports`
--

INSERT INTO `question_reports` (`id`, `username`, `emailid`, `mobile`, `country`, `purpose`, `question`) VALUES
(1, 'ADMIN', 'admin@gmail.com', 9988448455, 'india', 'testing purpose only', 'how was your first advanture tour.');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `region` varchar(200) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `country_id`, `region`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'India', 1, '2021-07-06 00:36:49', '2021-07-06 00:36:49', NULL),
(2, 1, 'Central India', 1, '2021-07-06 00:40:00', '2021-07-06 00:40:00', NULL),
(3, 1, 'East India', 1, '2021-07-06 00:40:00', '2021-07-06 00:40:00', NULL),
(4, 1, 'North India', 1, '2021-07-06 00:40:00', '2021-07-06 00:40:00', '2021-08-04 15:32:20'),
(5, 3, 'UAE', 1, '2021-07-06 00:40:00', '2021-07-06 00:40:00', '2021-07-22 14:50:53'),
(6, 2, 'California', 1, '2021-07-06 00:40:00', '2021-07-06 00:40:00', '2021-07-22 14:50:42'),
(7, 3, 'West UAE', 1, '2021-07-06 00:40:00', '2021-07-06 00:40:00', '2021-07-22 12:23:09'),
(12, 1, 'bareilly', 1, '2021-08-29 00:43:21', '2021-08-29 00:43:21', NULL),
(13, 1, 'dehradun', 1, '2021-09-21 22:58:22', '2021-09-21 22:58:22', NULL),
(14, 7, 'Adam', 1, '2021-09-25 15:43:34', '2021-09-25 15:43:34', '2021-10-19 15:20:50'),
(15, 7, 'Al BuraimiQWDDD', 1, '2021-09-25 15:44:05', '2021-09-25 15:44:05', '2021-10-19 15:20:53'),
(16, 1, 'noida', 1, '2021-09-25 15:53:01', '2021-09-25 15:53:01', NULL),
(17, 1, 'U.P', 1, '2021-09-25 16:13:03', '2021-09-25 16:13:03', NULL),
(18, 1, 'MP', 1, '2021-09-25 16:14:03', '2021-09-25 16:14:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'Manage Partner Requests'),
(2, 'Manage Activity Requests'),
(3, 'Manage and view Partner requests'),
(4, 'Manage Promocodes add, delete, and view'),
(5, 'View Transactions'),
(6, 'Manage Announcements Add, Edit and Delete'),
(7, 'Manage Country Add, Edit and Delete'),
(8, 'Manage Country Add, Edit and Delete'),
(9, 'Manage Locations Add, Edit and Delete'),
(10, 'Manage Admin Add, Edit and Delete'),
(11, 'Manage Chat Allow and Decline Client Chat Access'),
(12, 'Manage Administration Add, Edit and Delete');

-- --------------------------------------------------------

--
-- Table structure for table `role_assignments`
--

CREATE TABLE `role_assignments` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `role_assignments`
--

INSERT INTO `role_assignments` (`id`, `country_id`, `role_id`, `sort`) VALUES
(173, 1, 1, 0),
(174, 1, 2, 0),
(175, 1, 3, 0),
(176, 2, 1, 0),
(177, 2, 2, 0),
(178, 2, 3, 0),
(179, 4, 10, 0),
(180, 4, 11, 0),
(181, 4, 12, 0),
(182, 7, 1, 0),
(183, 7, 2, 0),
(184, 7, 3, 0),
(185, 15, 6, 0),
(186, 15, 7, 0),
(187, 15, 2, 0),
(188, 15, 3, 0),
(189, 15, 4, 0),
(190, 15, 5, 0),
(191, 1, 4, 0),
(192, 1, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner` int(10) UNSIGNED NOT NULL,
  `adventure_name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `country` int(10) UNSIGNED NOT NULL,
  `region` int(10) UNSIGNED NOT NULL,
  `service_sector` int(10) UNSIGNED NOT NULL,
  `service_category` int(10) UNSIGNED NOT NULL,
  `service_type` int(10) UNSIGNED NOT NULL,
  `service_level` int(10) UNSIGNED NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `available_seats` tinyint(3) UNSIGNED NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `write_information` text CHARACTER SET latin1 DEFAULT NULL,
  `service_plan` tinyint(1) DEFAULT NULL,
  `availability` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `geo_location` text CHARACTER SET latin1 DEFAULT NULL,
  `specific_address` text CHARACTER SET latin1 DEFAULT NULL,
  `cost_inc` decimal(10,2) NOT NULL,
  `cost_exc` decimal(10,2) NOT NULL,
  `currency` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `points` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `pre_requisites` text CHARACTER SET latin1 DEFAULT NULL,
  `minimum_requirements` text CHARACTER SET latin1 DEFAULT NULL,
  `terms_conditions` text CHARACTER SET latin1 DEFAULT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Pending,1=Accept,2=Decline',
  `image` varchar(200) CHARACTER SET latin1 NOT NULL,
  `descreption` mediumtext CHARACTER SET latin1 NOT NULL,
  `favourite_image` varchar(200) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `owner`, `adventure_name`, `country`, `region`, `service_sector`, `service_category`, `service_type`, `service_level`, `duration`, `available_seats`, `start_date`, `end_date`, `write_information`, `service_plan`, `availability`, `geo_location`, `specific_address`, `cost_inc`, `cost_exc`, `currency`, `points`, `pre_requisites`, `minimum_requirements`, `terms_conditions`, `recommended`, `status`, `image`, `descreption`, `favourite_image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1293, 'Test services', 1, 2, 21, 1, 1, 8, 20, 255, '2022-03-12 00:00:00', '2022-03-31 00:00:00', '34534543', 1, NULL, NULL, 'sdfsdfsdfsdf ewrwer 4324 ddgdfg 34324234 dgdfgfdg', '2500.00', '255.00', '1', 0, 'This is the jhjhgjh', 'fjhgjhgjh', 'jgjhgjh', 1, 0, '', '', '', '2022-03-11 15:57:31', '2022-03-11 15:57:31', NULL),
(2, 1263, 'Test services4535', 1, 3, 22, 1, 9, 8, 21, 255, '2022-03-31 00:00:00', '2022-04-30 00:00:00', '567567', 1, NULL, NULL, 'sdfsdfsdfsdf ewrwer 4324 ddgdfg 34324234 dgdfgfdg', '2500.00', '255.00', '1', 0, '456456', '45645', '45645', 1, 0, '', '', '', '2022-03-30 15:48:39', '2022-03-30 15:48:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_activities`
--

CREATE TABLE `service_activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `activity_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `service_activities`
--

INSERT INTO `service_activities` (`id`, `service_id`, `activity_id`) VALUES
(1, 4, '1'),
(2, 4, '3'),
(3, 4, '5'),
(4, 4, '7'),
(5, 5, '1'),
(6, 5, '2'),
(7, 5, '4'),
(8, 6, '8'),
(9, 6, '9'),
(10, 6, '10'),
(11, 5003, '7'),
(12, 5004, '3'),
(13, 5005, '1'),
(14, 5006, '1'),
(15, 5007, '7'),
(16, 5008, '2'),
(17, 5009, '10'),
(18, 5010, '1'),
(19, 5011, '1'),
(20, 5012, '3'),
(21, 5013, '2'),
(22, 5014, '7'),
(23, 5015, '7'),
(24, 5016, '2'),
(25, 5017, '2'),
(26, 5018, '1'),
(27, 5019, '1'),
(28, 5020, '1'),
(29, 5022, '1'),
(30, 5049, 'one'),
(31, 5049, 'two'),
(32, 5049, 'three'),
(33, 5050, 'one'),
(34, 5050, 'two'),
(35, 5050, 'three'),
(36, 5051, 'one'),
(37, 5051, 'two'),
(38, 5051, 'three'),
(39, 5052, 'one'),
(40, 5052, 'two'),
(41, 5052, 'three'),
(42, 5054, 'one'),
(43, 5054, 'two'),
(44, 5054, 'three'),
(45, 5057, 'one'),
(46, 5057, 'two'),
(47, 5057, 'three'),
(48, 5058, 'one'),
(49, 5058, 'two'),
(50, 5058, 'three'),
(51, 5060, 'one'),
(52, 5060, 'two'),
(53, 5060, 'three'),
(54, 5061, 'one'),
(55, 5061, 'two'),
(56, 5061, 'three'),
(57, 5062, 'one'),
(58, 5062, 'two'),
(59, 5062, 'three'),
(60, 5069, 'one'),
(61, 5069, 'two'),
(62, 5069, 'three'),
(63, 5071, 'one'),
(64, 5071, 'two'),
(65, 5071, 'three'),
(66, 5072, 'one'),
(67, 5072, 'two'),
(68, 5072, 'three'),
(69, 5073, 'one'),
(70, 5073, 'two'),
(71, 5073, 'three'),
(72, 5074, 'one'),
(73, 5074, 'two'),
(74, 5074, 'three'),
(75, 5077, 'Transportation from gathering area'),
(76, 5077, 'Snacks'),
(77, 5077, 'Bike Riding'),
(78, 5077, 'Sand bashing'),
(79, 5077, 'Sand skiing'),
(80, 5077, 'Climbing'),
(81, 5077, 'Swimming'),
(82, 5079, 'Transportation from gathering area'),
(83, 5079, 'Drinks'),
(84, 5080, 'Drinks'),
(85, 5080, 'Bike Riding'),
(86, 5081, 'Bike Riding'),
(87, 5081, 'Sand skiing'),
(88, 5082, 'Bike Riding'),
(89, 5082, 'Sand skiing'),
(90, 5083, 'Transportation from gathering area'),
(91, 5083, 'Snacks'),
(92, 5084, 'Snacks'),
(93, 5085, 'one'),
(94, 5085, 'two'),
(95, 5085, 'three'),
(96, 5086, 'one'),
(97, 5086, 'two'),
(98, 5086, 'three'),
(99, 5087, 'one'),
(100, 5087, 'two'),
(101, 5087, 'three'),
(102, 5088, 'one'),
(103, 5088, 'two'),
(104, 5088, 'three'),
(105, 5092, 'Bike Riding'),
(106, 5092, 'Sand skiing'),
(107, 5093, 'Snacks'),
(108, 5093, 'Bike Riding'),
(109, 5093, 'Sand bashing'),
(110, 5093, 'Climbing'),
(111, 5097, 'Snacks'),
(112, 5097, 'Sand bashing'),
(113, 5097, 'Climbing'),
(114, 5100, 'Transportation from gathering area'),
(115, 5100, 'Drinks'),
(116, 5100, 'Snacks'),
(117, 5100, 'Climbing'),
(118, 5102, 'one'),
(119, 5102, 'two'),
(120, 5102, 'three'),
(121, 5104, 'Bike Riding'),
(122, 5107, 'Drinks'),
(123, 5107, 'Bike Riding'),
(124, 5107, 'Sand bashing'),
(125, 5109, 'Sand skiing'),
(126, 5110, 'Bike Riding'),
(127, 5110, 'Sand bashing'),
(128, 5110, 'Swimming'),
(129, 5111, 'Transportation from gathering area'),
(130, 5111, 'Drinks'),
(131, 5111, 'Snacks'),
(132, 5111, 'Bike Riding'),
(133, 5111, 'Sand bashing'),
(134, 5111, 'Climbing'),
(135, 5111, 'Swimming'),
(136, 5113, 'Bike Riding'),
(137, 5113, 'Sand bashing'),
(138, 5113, 'Sand skiing'),
(139, 5113, 'Climbing'),
(140, 5114, '1'),
(141, 5114, '2'),
(142, 5114, '10'),
(143, 5114, '13'),
(144, 5114, '14'),
(152, 1, '1'),
(153, 1, '2'),
(154, 1, '3'),
(155, 1, '5'),
(156, 1, '7'),
(157, 1, '8'),
(158, 1, '9'),
(159, 1, '10'),
(160, 2, '1'),
(161, 2, '2'),
(162, 2, '5'),
(163, 2, '10'),
(164, 2, '12');

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` int(11) NOT NULL,
  `category` varchar(200) CHARACTER SET latin1 NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active,0=Deactive',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `category`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Land', 'yoga.jpg', 1, '2021-06-30 09:57:47', '2021-10-19 13:28:11', NULL),
(2, 'Sea', 'trekking.jpg', 1, '2021-06-30 09:57:47', '2021-10-19 13:28:16', '2021-10-19 13:28:16'),
(3, 'Sky', 'cycling.jpg', 1, '2021-06-30 09:57:47', '2021-10-19 13:28:20', '2021-10-19 13:28:20'),
(4, 'Mountain', 'canoeing.jpg', 1, '2021-06-30 09:57:47', '2021-10-19 12:56:50', '2021-10-19 12:56:50'),
(5, 'Sand', 'kayaking.jpeg', 1, '2021-06-30 09:57:47', '2021-08-05 11:06:17', '2021-08-05 11:06:17'),
(6, 'Lake', 'rock-climbing.jpg', 1, '2021-06-30 09:57:47', '2021-07-31 12:41:10', '2021-07-31 12:41:10'),
(7, 'test2', '', 1, '2021-08-29 00:48:03', '2021-09-01 23:31:57', '2021-09-01 23:31:57'),
(8, 'test2', '', 1, '2021-09-01 23:32:07', '2021-09-01 23:32:19', '2021-09-01 23:32:19'),
(9, 'test2', '', 1, '2021-09-05 06:52:50', '2021-10-19 12:56:42', '2021-10-19 12:56:42'),
(10, 'test2', '', 1, '2021-09-21 22:58:52', '2021-09-21 22:58:59', '2021-09-21 22:58:59'),
(11, 'Tour', '', 1, '2021-10-19 13:28:37', '2021-10-19 13:28:37', NULL),
(12, 'Training', '', 1, '2021-10-19 13:28:50', '2021-10-19 13:28:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_dependencies`
--

CREATE TABLE `service_dependencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `dependency_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `service_dependencies`
--

INSERT INTO `service_dependencies` (`id`, `service_id`, `dependency_id`) VALUES
(7, 3, '2'),
(8, 3, '3'),
(9, 5002, '1'),
(10, 5003, '2'),
(11, 5004, '2'),
(12, 5005, '2'),
(13, 5006, '1'),
(14, 5007, '1'),
(15, 5007, '2'),
(16, 5008, '2'),
(17, 5009, '1'),
(18, 5009, '2'),
(19, 5010, '1'),
(20, 5011, '2'),
(21, 5012, '1'),
(22, 5013, '1'),
(23, 5014, '1'),
(24, 5015, '2'),
(25, 5016, '2'),
(26, 5017, '2'),
(27, 5018, '2'),
(28, 5019, '1'),
(29, 5020, '1'),
(30, 5022, '1'),
(31, 5035, 'Weather'),
(32, 5035, 'Health Conditions'),
(33, 5035, 'License'),
(34, 5036, 'Weather'),
(35, 5036, 'Health Conditions'),
(36, 5036, 'License'),
(37, 5037, 'Weather'),
(38, 5037, 'Health Conditions'),
(39, 5037, 'License'),
(40, 5038, 'Weather'),
(41, 5038, 'Health Conditions'),
(42, 5038, 'License'),
(43, 5039, 'Weather'),
(44, 5039, 'Health Conditions'),
(45, 5039, 'License'),
(46, 5040, 'Weather'),
(47, 5040, 'Health Conditions'),
(48, 5040, ''),
(49, 5041, 'Weather'),
(50, 5041, 'Health Conditions'),
(51, 5041, ''),
(52, 5042, 'Weather'),
(53, 5042, 'Health Conditions'),
(54, 5042, 'License'),
(55, 5043, 'Weather'),
(56, 5043, 'Health Conditions'),
(57, 5043, 'License'),
(58, 5044, 'Weather'),
(59, 5044, 'Health Conditions'),
(60, 5044, 'License'),
(61, 5045, 'one'),
(62, 5045, 'two'),
(63, 5045, 'three'),
(64, 5047, 'one'),
(65, 5047, 'two'),
(66, 5047, 'three'),
(67, 5048, 'one'),
(68, 5048, 'two'),
(69, 5048, 'three'),
(70, 5049, 'one'),
(71, 5049, 'two'),
(72, 5049, 'three'),
(73, 5050, 'one'),
(74, 5050, 'two'),
(75, 5050, 'three'),
(76, 5051, 'one'),
(77, 5051, 'two'),
(78, 5051, 'three'),
(79, 5052, 'one'),
(80, 5052, 'two'),
(81, 5052, 'three'),
(82, 5054, 'one'),
(83, 5054, 'two'),
(84, 5054, 'three'),
(85, 5057, 'one'),
(86, 5057, 'two'),
(87, 5057, 'three'),
(88, 5058, 'one'),
(89, 5058, 'two'),
(90, 5058, 'three'),
(91, 5060, 'one'),
(92, 5060, 'two'),
(93, 5060, 'three'),
(94, 5061, 'one'),
(95, 5061, 'two'),
(96, 5061, 'three'),
(97, 5062, 'one'),
(98, 5062, 'two'),
(99, 5062, 'three'),
(100, 5069, 'one'),
(101, 5069, 'two'),
(102, 5069, 'three'),
(103, 5071, 'one'),
(104, 5071, 'two'),
(105, 5071, 'three'),
(106, 5072, 'one'),
(107, 5072, 'two'),
(108, 5072, 'three'),
(109, 5073, 'one'),
(110, 5073, 'two'),
(111, 5073, 'three'),
(112, 5074, 'one'),
(113, 5074, 'two'),
(114, 5074, 'three'),
(115, 5076, 'Weather'),
(116, 5076, 'Health Conditions'),
(117, 5076, ''),
(118, 5077, 'Weather'),
(119, 5077, 'Health Conditions'),
(120, 5077, ''),
(121, 5078, 'Weather'),
(122, 5078, 'Health Conditions'),
(123, 5078, ''),
(124, 5079, 'Weather'),
(125, 5079, ''),
(126, 5079, ''),
(127, 5080, 'Weather'),
(128, 5080, 'Health Conditions'),
(129, 5080, ''),
(130, 5081, 'Weather'),
(131, 5081, ''),
(132, 5081, ''),
(133, 5082, ''),
(134, 5082, 'Health Conditions'),
(135, 5082, ''),
(136, 5083, 'Weather'),
(137, 5083, ''),
(138, 5083, 'License'),
(139, 5084, ''),
(140, 5084, 'Health Conditions'),
(141, 5084, ''),
(142, 5085, 'one'),
(143, 5085, 'two'),
(144, 5085, 'three'),
(145, 5086, 'one'),
(146, 5086, 'two'),
(147, 5086, 'three'),
(148, 5087, 'one'),
(149, 5087, 'two'),
(150, 5087, 'three'),
(151, 5088, 'one'),
(152, 5088, 'two'),
(153, 5088, 'three'),
(154, 5089, ''),
(155, 5089, 'Health Conditions'),
(156, 5089, ''),
(157, 5090, 'Weather'),
(158, 5090, ''),
(159, 5090, ''),
(160, 5091, 'Weather'),
(161, 5091, ''),
(162, 5091, ''),
(163, 5092, 'Weather'),
(164, 5092, ''),
(165, 5092, ''),
(166, 5093, 'Weather'),
(167, 5093, ''),
(168, 5093, ''),
(169, 5094, 'Weather'),
(170, 5094, ''),
(171, 5094, ''),
(172, 5095, 'Weather'),
(173, 5095, ''),
(174, 5095, ''),
(175, 5096, 'Weather'),
(176, 5096, ''),
(177, 5096, ''),
(178, 5097, ''),
(179, 5097, 'Health Conditions'),
(180, 5097, ''),
(181, 5098, 'Weather'),
(182, 5098, ''),
(183, 5098, ''),
(184, 5099, 'Weather'),
(185, 5099, ''),
(186, 5099, ''),
(187, 5100, 'Weather'),
(188, 5100, 'Health Conditions'),
(189, 5100, ''),
(190, 5101, 'Weather'),
(191, 5101, ''),
(192, 5101, ''),
(193, 5102, 'one'),
(194, 5102, 'two'),
(195, 5102, 'three'),
(196, 5103, 'Weather'),
(197, 5103, 'Health Conditions'),
(198, 5103, ''),
(199, 5104, 'Weather'),
(200, 5104, ''),
(201, 5104, ''),
(202, 5105, 'Weather'),
(203, 5105, 'License'),
(204, 5106, 'Weather'),
(205, 5106, 'Health Conditions'),
(206, 5107, 'Weather'),
(207, 5107, 'Health Conditions'),
(208, 5108, 'Weather'),
(209, 5108, 'Health Conditions'),
(210, 5109, 'Health Conditions'),
(211, 5110, 'Health Conditions'),
(212, 5111, 'Weather'),
(213, 5112, 'Weather'),
(214, 5112, 'License'),
(215, 5113, 'Weather'),
(216, 5113, 'Health Conditions'),
(217, 5113, 'License'),
(218, 5114, '1'),
(220, 1, '1'),
(221, 2, '1');

-- --------------------------------------------------------

--
-- Table structure for table `service_for`
--

CREATE TABLE `service_for` (
  `id` int(10) UNSIGNED NOT NULL,
  `sfor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `service_for`
--

INSERT INTO `service_for` (`id`, `sfor`, `status`) VALUES
(1, 'Kids', 1),
(2, 'Ladies', 1),
(4, 'Families', 1),
(5, 'Everyone', 1),
(6, 'test2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_images`
--

CREATE TABLE `service_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `service_images`
--

INSERT INTO `service_images` (`id`, `service_id`, `is_default`, `image_url`, `thumbnail`) VALUES
(1, 1, 1, 'services/1646994451-0.jpg', '/services/thumbs/1646994451-0.jpg'),
(2, 1, 0, 'services/1646994451-1.jpg', '/services/thumbs/1646994451-1.jpg'),
(3, 1, 0, 'services/1646994451-2.jpg', '/services/thumbs/1646994451-2.jpg'),
(4, 1, 0, 'services/1646994451-3.jpg', '/services/thumbs/1646994451-3.jpg'),
(5, 2, 1, 'services/1648635519-0.jpg', '/services/thumbs/1648635519-0.jpg'),
(6, 2, 0, 'services/1648635519-1.jpg', '/services/thumbs/1648635519-1.jpg'),
(7, 2, 0, 'services/1648635519-2.jpg', '/services/thumbs/1648635519-2.jpg'),
(8, 2, 0, 'services/1648635519-3.jpg', '/services/thumbs/1648635519-3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `service_levels`
--

CREATE TABLE `service_levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active,0=Deactive',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `service_levels`
--

INSERT INTO `service_levels` (`id`, `level`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Beginner', 1, '2021-06-30 10:12:57', '2021-10-19 13:00:35', '2021-10-19 13:00:35'),
(2, 'Moderate', 1, '2021-06-30 10:12:57', '2021-08-05 11:06:41', '2021-08-05 11:06:41'),
(3, 'Advanced', 1, '2021-06-30 10:12:57', '2021-07-31 12:41:35', '2021-07-31 12:41:35'),
(4, 'test2', 1, '2021-09-01 23:33:30', '2021-10-19 12:58:58', '2021-10-19 12:58:58'),
(5, 'test2', 1, '2021-09-02 00:10:16', '2021-10-19 12:58:54', '2021-10-19 12:58:54'),
(6, 'Intermediate', 1, '2021-10-19 12:58:48', '2021-10-19 13:00:13', '2021-10-19 13:00:13'),
(7, 'Difficult (Hard)', 1, '2021-10-19 12:59:53', '2021-10-19 13:00:05', '2021-10-19 13:00:05'),
(8, 'Beginner (Easy)', 1, '2021-10-19 13:01:13', '2021-10-19 13:01:13', NULL),
(9, 'intermediate (medium)', 1, '2021-10-19 13:01:52', '2021-10-19 13:02:01', '2021-10-19 13:02:01'),
(10, 'Intermediate (medium)', 1, '2021-10-19 13:02:19', '2021-10-19 13:02:27', '2021-10-19 13:02:27'),
(11, 'Intermediate (Medium)', 1, '2021-10-19 13:02:45', '2021-10-19 13:02:45', NULL),
(12, 'Advanced (Hard)', 1, '2021-10-19 13:03:45', '2021-10-19 13:03:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_likes`
--

CREATE TABLE `service_likes` (
  `id` int(11) NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `is_like` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `service_likes`
--

INSERT INTO `service_likes` (`id`, `service_id`, `user_id`, `is_like`, `created_at`, `updated_at`) VALUES
(1, 6, 101010, 3, '2021-07-05 09:13:42', '2021-07-05 09:13:42'),
(2, 5001, 1160, 1, '2021-07-18 12:54:44', '2021-07-18 12:54:44'),
(3, 5001, 1225, 1, '2021-07-20 22:55:12', '2021-07-20 22:55:12'),
(4, 5001, 1239, 1, '2021-07-22 12:44:41', '2021-07-22 12:44:41'),
(5, 5000, 1243, 1, '2021-07-24 02:55:25', '2021-07-24 02:55:25'),
(6, 5000, 1254, 1, '2021-07-24 13:25:34', '2021-07-24 13:25:34'),
(7, 5000, 1255, 1, '2021-07-24 13:58:32', '2021-07-24 13:58:32'),
(8, 5001, 1255, 0, '2021-07-26 13:27:34', '2021-07-26 13:27:34'),
(9, 5010, 1255, 1, '2021-07-28 05:56:32', '2021-07-28 05:56:32'),
(10, 5014, 1255, 1, '2021-08-02 16:54:14', '2021-08-02 16:54:14'),
(14, 5020, 1291, 6, '2021-09-29 20:09:00', '2021-09-29 20:09:00'),
(15, 5001, 1260, 5, '2021-10-11 23:25:26', '2021-10-11 23:25:26'),
(16, 5022, 1291, 1, '2021-11-13 18:35:09', '2021-11-13 18:35:09'),
(17, 5020, 1299, 2, '2021-12-09 00:00:48', '2021-12-09 00:00:48'),
(18, 5021, 1291, 3, '2021-12-12 19:52:41', '2021-12-12 19:52:41'),
(22, 5020, 1306, 1, '2021-12-17 23:14:56', '2021-12-17 23:14:56'),
(23, 5034, 1304, 1, '2022-01-02 15:19:08', '2022-01-02 15:19:08'),
(31, 5020, 1304, 1, '2022-01-30 12:34:35', '2022-01-30 12:34:35'),
(33, 5021, 1304, 1, '2022-01-31 07:46:33', '2022-01-31 07:46:33'),
(37, 5097, 1304, 1, '2022-02-15 17:42:21', '2022-02-15 17:42:21'),
(38, 5015, 1388, 1, '2022-03-04 01:38:02', '2022-03-04 01:38:02'),
(40, 5101, 1388, 1, '2022-03-04 01:38:54', '2022-03-04 01:38:54'),
(42, 5096, 1391, 1, '2022-03-05 20:56:58', '2022-03-05 20:56:58'),
(45, 5110, 1393, 1, '2022-03-07 00:35:23', '2022-03-07 00:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `service_offers`
--

CREATE TABLE `service_offers` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount_type` enum('A','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '''A''=>''Amount'', ''P''=>''Percentage''',
  `discount_amount` int(11) NOT NULL,
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '''0''=>''Inactive'',''1''=>''Active''',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `service_offers`
--

INSERT INTO `service_offers` (`id`, `service_id`, `name`, `start_date`, `end_date`, `discount_type`, `discount_amount`, `banner`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5006, 'text1', '2021-09-15', '2021-09-16', 'A', 32, 'offer_image/1631712623.jpg', 'testdfdf', '1', '2022-03-11 18:25:29', '2021-09-16 20:38:35', NULL),
(2, 5006, 'Shradha', '2021-09-17', '2021-09-18', 'A', 34, 'offer_image/1631712623.jpg', 'desc', '0', '2021-09-15 17:36:24', '2021-09-17 23:19:42', NULL),
(3, 5006, 'Shradha1', '2021-09-16', '2021-09-24', 'A', 23, 'offer_image/1631712623.jpg', 'desrss', '0', '2021-09-15 18:50:49', '2021-09-16 20:38:35', NULL),
(4, 5006, 'Shradha12', '2021-09-16', '2021-09-24', 'A', 23, 'offer_image/1631712623.jpg', 'desrss', '1', '2021-09-15 19:00:23', '2021-09-16 20:38:35', NULL),
(5, 5019, 'ravi', '2021-09-29', '2021-09-30', 'A', 100, 'offer_image/1632844748.jpeg', 'kjhfkasdfkjafd', '0', '2021-09-28 21:29:08', '2021-10-09 01:18:03', NULL),
(6, 5020, 'raviy', '2021-09-30', '2021-11-06', 'P', 5, 'offer_image/1632846226.jpeg', 'kjhkjh kjhkjhkjh khkjhkj', '0', '2021-09-28 21:53:46', '2021-10-09 01:17:46', NULL),
(7, 1, 'mani', '2022-03-31', '2022-05-28', 'A', 10, 'offer_image/1648631083.jpeg', 'ytrterter', '1', '2022-03-30 14:34:43', '2022-03-30 14:34:43', NULL),
(8, 1, 'mani345', '2022-03-31', '2022-04-27', 'A', 34534, 'offer_image/1648635385.png', '34543', '0', '2022-03-30 15:46:25', '2022-03-30 15:46:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_plan`
--

CREATE TABLE `service_plan` (
  `id` int(11) NOT NULL,
  `plan` varchar(200) CHARACTER SET latin1 NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_plan`
--

INSERT INTO `service_plan` (`id`, `plan`, `title`) VALUES
(1, 'Month', 'Every particular weekdays'),
(2, 'Calender', 'Every particular calender date');

-- --------------------------------------------------------

--
-- Table structure for table `service_plan_day_date`
--

CREATE TABLE `service_plan_day_date` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `day` int(10) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `service_plan_day_date`
--

INSERT INTO `service_plan_day_date` (`id`, `service_id`, `day`, `date`) VALUES
(1, 5005, 2, NULL),
(2, 5006, 2, NULL),
(3, 5007, 2, NULL),
(4, 5008, 2, NULL),
(5, 5009, 3, NULL),
(6, 5010, 3, NULL),
(7, 5011, 2, NULL),
(8, 5012, 2, NULL),
(9, 5013, 1, NULL),
(10, 5014, 2, NULL),
(11, 5015, 2, NULL),
(12, 5016, 2, NULL),
(13, 5017, 2, NULL),
(14, 5018, 2, NULL),
(15, 5019, 2, NULL),
(16, 5020, 2, NULL),
(17, 5022, NULL, '2021-10-30'),
(18, 5022, NULL, '2021-10-31'),
(19, 5050, 0, NULL),
(20, 5050, 0, NULL),
(21, 5050, 0, NULL),
(22, 5051, NULL, '2021-12-29'),
(23, 5051, NULL, '2021-12-30'),
(24, 5051, NULL, '2021-12-31'),
(25, 5052, NULL, '2021-12-29'),
(26, 5052, NULL, '2021-12-30'),
(27, 5052, NULL, '2021-12-31'),
(28, 5054, NULL, '2021-12-29'),
(29, 5054, NULL, '2021-12-30'),
(30, 5054, NULL, '2021-12-31'),
(31, 5057, NULL, '2021-12-29'),
(32, 5057, NULL, '2021-12-30'),
(33, 5057, NULL, '2021-12-31'),
(34, 5058, NULL, '2021-12-29'),
(35, 5058, NULL, '2021-12-30'),
(36, 5058, NULL, '2021-12-31'),
(37, 5062, NULL, '2021-12-29'),
(38, 5062, NULL, '2021-12-30'),
(39, 5062, NULL, '2021-12-31'),
(40, 5069, NULL, '2021-12-29'),
(41, 5069, NULL, '2021-12-30'),
(42, 5069, NULL, '2021-12-31'),
(43, 5071, NULL, '2021-12-29'),
(44, 5071, NULL, '2021-12-30'),
(45, 5071, NULL, '2021-12-31'),
(46, 5072, NULL, '2021-12-29'),
(47, 5072, NULL, '2021-12-30'),
(48, 5072, NULL, '2021-12-31'),
(49, 5073, NULL, '2021-12-29'),
(50, 5073, NULL, '2021-12-30'),
(51, 5073, NULL, '2021-12-31'),
(52, 5074, NULL, '2021-12-29'),
(53, 5074, NULL, '2021-12-30'),
(54, 5074, NULL, '2021-12-31'),
(55, 5076, 0, NULL),
(56, 5077, 0, NULL),
(57, 5077, 0, NULL),
(58, 5078, NULL, '1970-01-01'),
(59, 5079, NULL, '1970-01-01'),
(60, 5080, NULL, '1970-01-01'),
(61, 5081, 0, NULL),
(62, 5082, 0, NULL),
(63, 5083, NULL, '1970-01-01'),
(64, 5084, 0, NULL),
(65, 5085, NULL, '2021-12-29'),
(66, 5085, NULL, '2021-12-30'),
(67, 5085, NULL, '2021-12-31'),
(68, 5086, NULL, '2021-12-29'),
(69, 5086, NULL, '2021-12-30'),
(70, 5086, NULL, '2021-12-31'),
(71, 5087, NULL, '2021-12-29'),
(72, 5087, NULL, '2021-12-30'),
(73, 5087, NULL, '2021-12-31'),
(74, 5088, NULL, '2021-12-29'),
(75, 5088, NULL, '2021-12-30'),
(76, 5088, NULL, '2021-12-31'),
(77, 5089, 0, NULL),
(78, 5090, 0, NULL),
(79, 5091, 0, NULL),
(80, 5092, 0, NULL),
(81, 5093, 0, NULL),
(82, 5094, 0, NULL),
(83, 5095, 0, NULL),
(84, 5096, 0, NULL),
(85, 5097, NULL, '1970-01-01'),
(86, 5098, 0, NULL),
(87, 5099, 0, NULL),
(88, 5100, NULL, '1970-01-01'),
(89, 5101, 0, NULL),
(90, 5102, NULL, '2021-12-29'),
(91, 5102, NULL, '2021-12-30'),
(92, 5102, NULL, '2021-12-31'),
(93, 5103, NULL, '1970-01-01'),
(94, 5104, 0, NULL),
(95, 5105, 0, NULL),
(96, 5106, 0, NULL),
(97, 5107, NULL, '1970-01-01'),
(98, 5108, NULL, '1970-01-01'),
(99, 5109, 0, NULL),
(100, 5110, 0, NULL),
(101, 5111, 0, NULL),
(102, 5112, 0, NULL),
(103, 5113, 0, NULL),
(104, 5114, 1, NULL),
(105, 5114, 2, NULL),
(106, 5114, 3, NULL),
(107, 5114, 4, NULL),
(108, 5114, 5, NULL),
(109, 5114, 6, NULL),
(110, 5114, 7, NULL),
(117, 1, 1, NULL),
(118, 1, 2, NULL),
(119, 1, 3, NULL),
(120, 1, 4, NULL),
(121, 1, 5, NULL),
(122, 1, 6, NULL),
(123, 1, 7, NULL),
(124, 2, 1, NULL),
(125, 2, 2, NULL),
(126, 2, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_programs`
--

CREATE TABLE `service_programs` (
  `id` int(11) NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `start_datetime` varchar(255) CHARACTER SET latin1 NOT NULL,
  `end_datetime` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `status` enum('1','0') CHARACTER SET latin1 NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_programs`
--

INSERT INTO `service_programs` (`id`, `service_id`, `title`, `description`, `start_datetime`, `end_datetime`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 10, 'Lorem Ipsum is simply dummy - 1', 'Working women are four times less confident than their male counterparts about getting a job, says LinkedIn survey. Working women are four times less confident than their male counterparts about getting a job, says LinkedIn survey. Working women are four times less confident than their male counterparts about getting a job, says LinkedIn survey.', '2021-07-07 23:45:00', '', '1', '2022-03-08 08:50:05', '2021-07-06 18:26:16', NULL),
(2, 10, 'Lorem Ipsum is simply dummy - 2', 'Working women are four times less confident than their male counterparts about getting a job, says LinkedIn survey.  Working women are four times less confident than their male counterparts about getting a job, says LinkedIn survey. Working women are four times less confident than their male counterparts about getting a job, says LinkedIn survey. Working women are four times less confident than their male counterparts about getting a job, says LinkedIn survey.', '2021-07-08 23:45:00', '', '1', '2022-03-08 08:50:05', '2021-07-06 18:26:16', NULL),
(3, 11, 'Lorem Ipsum is simply dummy', 'The increase was driven by the rapid growth of Singapore\'s digital economy and finance, as well as trends in the global demand and supply for tech talent, and not because Indian national', '2021-07-14 0:15:00', NULL, '1', '2022-03-08 08:50:05', '2021-07-06 18:36:28', NULL),
(4, 12, 'Lorem Ipsum is simply dummy', 'The increase was driven by the rapid growth of Singapore\'s digital economy and finance, as well as trends in the global demand and supply for tech talent, and not because Indian national', '2021-07-14 0:15:00', NULL, '1', '2022-03-08 08:50:05', '2021-07-06 18:38:39', NULL),
(5, 13, 'Lorem Ipsum is simply dummy', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', '2021-07-08 13:00:00', NULL, '1', '2022-03-08 08:50:05', '2021-07-07 07:35:17', NULL),
(6, 14, 'Lorem Ipsum is simply dummy - 1', 'Dassault Systèmes introduces ERP & MES solution DELMIAworks in India, an Advanced Manufacturing', ' 14:30:00', ' 14:45:00', '1', '2022-03-08 08:50:05', '2021-07-07 08:55:51', NULL),
(7, 15, 'Lorem Ipsum is simply dummy - 1', 'The chip supplier spent about $100 million on its Cambridge-1 system, which uses artificial intelligence to solve health research problems and was announced in October. In the case of AstraZeneca, for example, the system will learn about 1 billion chemical compounds represented by groups of characters that can be assembled into sentence-like structures.', '2021-07-15 14:45:00', '2021-07-15 15:00:00', '1', '2022-03-08 08:50:05', '2021-07-07 09:13:20', NULL),
(8, 5005, 'ikkkkkkkkkkk8', 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', '2021-07-29 10:30:00', '2021-07-29 11:30:00', '1', '2022-03-08 08:50:05', '2021-07-20 04:48:19', NULL),
(9, 5006, 'aaaa', 'aaaa', '2021-07-28 11:00:00', '2021-07-28 11:15:00', '1', '2022-03-08 08:50:05', '2021-07-20 05:30:48', NULL),
(10, 5007, 'adventures Club', 'test', '2021-07-29 10:30:00', '2021-07-29 13:30:00', '1', '2022-03-08 08:50:05', '2021-07-28 07:57:01', NULL),
(11, 5008, 'adventures Club', 'test', '2021-07-30 8:45:00', '2021-07-30 9:45:00', '1', '2022-03-08 08:50:05', '2021-07-28 08:06:27', NULL),
(12, 5009, 'adventures Club', 'test', '2021-08-05 6:45:00', '2021-08-05 9:45:00', '1', '2022-03-08 08:50:05', '2021-07-28 08:09:54', NULL),
(13, 5010, 'adventures Club', 'test', '2021-07-30 14:00:00', '2021-07-30 15:00:00', '1', '2022-03-08 08:50:05', '2021-07-28 08:32:24', NULL),
(14, 5011, 'adventures Club', 'test', '2021-07-31 10:45:00', '2021-07-31 11:45:00', '1', '2022-03-08 08:50:05', '2021-07-29 05:08:00', NULL),
(15, 5012, 'adventures Club', 'test', '2021-07-31 12:00:00', '2021-07-31 13:15:00', '1', '2022-03-08 08:50:05', '2021-07-30 06:47:11', NULL),
(16, 5013, 'adventures Club', 'test', '2021-07-31 10:30:00', '2021-07-31 12:30:00', '1', '2022-03-08 08:50:05', '2021-07-30 06:53:39', NULL),
(17, 5014, 'adventures Club', 'test', '2021-08-04 12:30:00', '2021-08-04 15:30:00', '1', '2022-03-08 08:50:05', '2021-07-30 07:01:36', NULL),
(18, 5015, 'Traveling', 'test', '2021-07-31 16:00:00', '2021-07-31 21:00:00', '1', '2022-03-08 08:50:05', '2021-07-30 11:33:37', NULL),
(19, 5016, 'sky adventures', 'Best time to experience: All throughout a year but the flight depends highly on right air pressure.\r\n\r\nHang-gliding is often compared to the flight of a bird. The complexity of hang-gliding is much more than in parasailing or paragliding, but you needn’t worry! You just need to stick to your pilot and enjoy the height! Some parts of Himachal Pradesh including Kasauli have spectacular views of green valleys and basins and hang-gliding is often the best option to see these. The technique of hang-gliding is improving over time with provisions of a small seat and engine over the physical power of air pressure that was earlier used as the main drifting force. There is no classification of difficulty levels and the adventure is open to all.', '2021-07-31 17:15:00', '2021-07-31 21:15:00', '1', '2022-03-08 08:50:05', '2021-07-30 11:42:45', NULL),
(20, 5017, 'mountain adventures', 'test', '2021-07-31 16:30:00', '2021-07-31 19:30:00', '1', '2022-03-08 08:50:05', '2021-07-30 11:48:44', NULL),
(21, 5018, 'sand adventure', 'test', '2021-07-31 17:30:00', '2021-07-31 19:30:00', '1', '2022-03-08 08:50:05', '2021-07-30 11:54:31', NULL),
(22, 5019, 'lake adventure', 'test', '2021-07-31 17:30:00', '2021-07-31 18:30:00', '1', '2022-03-08 08:50:05', '2021-07-30 11:56:49', NULL),
(23, 5020, 'adventures Club', 'test', '2021-08-31 14:15:00', '2021-08-31 21:15:00', '1', '2022-03-08 08:50:05', '2021-08-04 08:40:55', NULL),
(24, 5022, 'testing', 'hkjahsdf asdfkjhsakdjf asfd hakjshdf  asdhfkjhsfd', '2021-10-29 21:15:00', '2021-10-29 22:15:00', '1', '2022-03-08 08:50:05', '2021-10-21 15:39:49', NULL),
(25, 5054, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2021-12-30 18:55:21', NULL),
(26, 5054, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2021-12-30 18:55:21', NULL),
(27, 5057, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2021-12-30 19:23:10', NULL),
(28, 5057, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2021-12-30 19:23:10', NULL),
(29, 5058, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2021-12-30 19:25:00', NULL),
(30, 5058, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2021-12-30 19:25:00', NULL),
(31, 5062, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2021-12-30 19:42:32', NULL),
(32, 5062, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2021-12-30 19:42:32', NULL),
(33, 5069, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2021-12-31 18:01:27', NULL),
(34, 5069, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2021-12-31 18:01:27', NULL),
(35, 5071, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2021-12-31 18:11:50', NULL),
(36, 5071, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2021-12-31 18:11:50', NULL),
(37, 5072, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2021-12-31 18:13:46', NULL),
(38, 5072, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2021-12-31 18:13:46', NULL),
(39, 5073, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2021-12-31 18:15:53', NULL),
(40, 5073, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2021-12-31 18:15:53', NULL),
(41, 5074, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2021-12-31 19:06:59', NULL),
(42, 5074, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2021-12-31 19:06:59', NULL),
(43, 5076, 'hty', 'ybyb', '14/01/2020 00:00:00 01:48:00:00', '14/01/2020 00:00:00 01/01/2022 00:00:00:00', '1', '2022-03-08 08:50:05', '2022-01-01 06:55:05', NULL),
(44, 5077, 'title', 'no schedule', '09/01/2020 00:00:00 10:50:00:00', '09/01/2020 00:00:00 01/01/2022 00:00:00:00', '1', '2022-03-08 08:50:05', '2022-01-01 15:39:46', NULL),
(45, 5078, 'hiku', 'yvugu6b', '03/01/2020 00:00:00 01:50:00:00', '03/01/2020 00:00:00 02/01/2022 00:00:00:00', '1', '2022-03-08 08:50:05', '2022-01-01 15:56:02', NULL),
(46, 5079, 'ggy', 'yyyuy', '2020-01-10 10:50:00:00', '2020-01-10 2022-01-20:00', '1', '2022-03-08 08:50:05', '2022-01-02 18:24:00', NULL),
(47, 5080, 'gy', 'yy', '2020-01-25 02:15:00:00', '2020-01-25 2022-01-21:00', '1', '2022-03-08 08:50:05', '2022-01-02 18:43:27', NULL),
(48, 5081, 'hh', 'gc y', '2020-01-09 10:10:00:00', '2020-01-09 2022-01-06:00', '1', '2022-03-08 08:50:05', '2022-01-06 07:10:15', NULL),
(49, 5082, 'morning', 'jdf', '2020-01-10 02:12:00:00', '2020-01-10 2022-01-09:00', '1', '2022-03-08 08:50:05', '2022-01-09 16:05:06', NULL),
(50, 5083, 'ggy', 'ghhj', '2020-01-31 02:10:00:00', '2020-01-31 2022-02-26:00', '1', '2022-03-08 08:50:05', '2022-01-28 18:37:55', NULL),
(51, 5084, 'morning', 'yyuttr5ij', '2020-02-21 03:10:00:00', '2020-02-21 2022-01-30:00', '1', '2022-03-08 08:50:05', '2022-01-30 06:22:11', NULL),
(52, 5085, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2022-01-30 09:09:01', NULL),
(53, 5085, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2022-01-30 09:09:01', NULL),
(54, 5086, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2022-01-30 09:58:54', NULL),
(55, 5086, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2022-01-30 09:58:54', NULL),
(56, 5087, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2022-01-30 09:59:40', NULL),
(57, 5087, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2022-01-30 09:59:40', NULL),
(58, 5088, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2022-01-30 10:48:47', NULL),
(59, 5088, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2022-01-30 10:48:47', NULL),
(60, 5089, 'morning', 'morning', '2020-01-31 09:49:00:00', '2020-01-31 2022-01-30:00', '1', '2022-03-08 08:50:05', '2022-01-30 11:27:22', NULL),
(61, 5090, 'morning', 'ggy', '2020-01-31 03:15:00:00', '2020-01-31 2022-01-30:00', '1', '2022-03-08 08:50:05', '2022-01-30 11:36:08', NULL),
(62, 5091, 'morning', 'hgyg', '2020-01-31 05:19:00:00', '2020-01-31 2022-01-30:00', '1', '2022-03-08 08:50:05', '2022-01-30 11:44:59', NULL),
(63, 5092, 'Morning', 'stbbt', '2020-01-31 10:51:00:00', '2020-01-31 2022-01-30:00', '1', '2022-03-08 08:50:05', '2022-01-30 12:10:55', NULL),
(64, 5093, 'morning', 'ggy t tt', '2020-02-14 10:50:00:00', '2020-02-14 2022-01-30:00', '1', '2022-03-08 08:50:05', '2022-01-30 12:25:07', NULL),
(65, 5094, 'mor5', 'jjue', '2020-01-31 03:45:00:00', '2020-01-31 2022-01-30:00', '1', '2022-03-08 08:50:05', '2022-01-30 17:47:01', NULL),
(66, 5095, 'gg', 'gt5g', '2020-01-31 06:29:00:00', '2020-01-31 2022-01-30:00', '1', '2022-03-08 08:50:05', '2022-01-30 17:57:38', NULL),
(67, 5096, 'trt', 'ttted5', '2020-02-13 10:50:00:00', '2020-02-13 2022-01-31:00', '1', '2022-03-08 08:50:05', '2022-01-31 16:49:03', NULL),
(68, 5097, 'day1', 'do one', '2020-02-13 05:30:00:00', '2020-02-13 2022-02-11:00', '1', '2022-03-08 08:50:05', '2022-02-08 16:38:21', NULL),
(69, 5098, 'morning', 'iosir', '2020-02-15 10:50:00:00', '2020-02-15 2022-02-09:00', '1', '2022-03-08 08:50:05', '2022-02-09 16:23:31', NULL),
(70, 5099, 'morning', 'his djdjde sidnd', '2020-02-28 10:00:00:00', '2020-02-28 2022-02-19:00', '1', '2022-03-08 08:50:05', '2022-02-18 19:32:01', NULL),
(71, 5100, 'meet up', 'driving to fly site', '2020-03-10 16:00:00:00', '2020-03-10 2022-03-11:00', '1', '2022-03-08 08:50:05', '2022-03-03 04:28:27', NULL),
(72, 5101, 'evening', 'hh', '2020-03-20 08:40:00:00', '2020-03-20 2022-03-03:00', '1', '2022-03-08 08:50:05', '2022-03-03 17:23:49', NULL),
(73, 5102, 'test', 'descfirst', '2021-12-28 2021-12-28:00', '2021-12-28 2021-12-30:00', '1', '2022-03-08 08:50:05', '2022-03-05 07:42:49', NULL),
(74, 5102, 'inarray', 'descfirst', '2021-12-29 2021-12-29:00', '2021-12-29 2021-12-31:00', '1', '2022-03-08 08:50:05', '2022-03-05 07:42:49', NULL),
(75, 5103, 'morning', 'morning to everyone', '2020-03-06 02:11:00:00', '2020-03-06 2022-03-12:00', '1', '2022-03-08 08:50:05', '2022-03-05 09:33:22', NULL),
(76, 5104, 'morning', 'morning evening', '2020-03-06 04:25:00:00', '2020-03-06 2022-03-05:00', '1', '2022-03-08 08:50:05', '2022-03-05 09:38:50', NULL),
(77, 5105, 'morning', 'evening', '2020-03-13 05:25:00:00', '2020-03-13 2022-03-05:00', '1', '2022-03-08 08:50:05', '2022-03-05 11:08:46', NULL),
(78, 5106, 'morning', 'evening', '2020-03-13 10:50:00:00', '2020-03-13 2022-03-05:00', '1', '2022-03-08 08:50:05', '2022-03-05 14:25:12', NULL),
(79, 5107, 'ecccvvv', 'cbbbbbbbbb', '2020-03-06 02:00:00:00', '2020-03-06 2022-03-11:00', '1', '2022-03-08 08:50:05', '2022-03-05 15:05:10', NULL),
(80, 5108, 'morning', 'morning to evening', '2022-03-06 04:20:00:00', '2022-03-06 2022-03-07:00', '1', '2022-03-08 08:50:05', '2022-03-06 10:24:39', NULL),
(81, 5109, 'morning', 'bhxj', '2022-03-12 05:25:00:00', '2022-03-12 2022-03-05:00', '1', '2022-03-08 08:50:05', '2022-03-06 11:20:19', NULL),
(82, 5110, 'morning', 'morning to evening', '2022-03-06 05:25:00:00', '2022-03-06 2022-03-05:00', '1', '2022-03-08 08:50:05', '2022-03-06 13:36:59', NULL),
(83, 5111, 'morning', 'ni moree', '2022-03-10 02:10:00:00', '2022-03-10 2022-03-06:00', '1', '2022-03-08 08:50:05', '2022-03-06 19:12:51', NULL),
(84, 5112, 'morning', 'ggh b', '2022-03-11 02:13:00:00', '2022-03-11 2022-03-06:00', '1', '2022-03-08 08:50:05', '2022-03-06 19:15:12', NULL),
(85, 5113, 'morning', 'morning everyone', '2022-03-11 10:50:00:00', '2022-03-11 2022-03-06:00', '1', '2022-03-08 08:50:05', '2022-03-07 18:02:39', NULL),
(86, 5114, '456', 'This is the test', '2022-03-13 15:30:00', '2022-03-13 17:30:00', '1', '2022-03-11 10:18:09', '2022-03-11 10:18:09', NULL),
(88, 1, '456', 'This is the drop', '2022-03-13 16:00:00', '2022-03-13 18:00:00', '1', '2022-03-11 10:27:31', '2022-03-11 10:27:31', NULL),
(89, 2, '456', '546456456', '2022-03-31 16:00:00', '2022-03-31 17:00:00', '1', '2022-03-30 10:18:39', '2022-03-30 10:18:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_reviews`
--

CREATE TABLE `service_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `star` tinyint(3) UNSIGNED NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `service_reviews`
--

INSERT INTO `service_reviews` (`id`, `service_id`, `user_id`, `star`, `remark`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 54, 234, 3, 'Good service', 1, '2021-07-07 14:17:25', '2021-07-07 14:17:25', NULL),
(2, 54, 234, 3, 'Good service', 1, '2021-07-08 05:39:28', '2021-07-08 05:39:28', NULL),
(3, 54, 234, 3, 'Good service', 1, '2021-07-08 09:23:22', '2021-07-08 09:23:22', NULL),
(4, 54, 234, 3, 'Good service', 1, '2021-07-08 11:52:39', '2021-07-08 11:52:39', NULL),
(5, 54, 234, 3, 'Good service', 1, '2021-07-08 11:58:34', '2021-07-08 11:58:34', NULL),
(6, 54, 234, 3, 'Good service', 1, '2021-07-08 12:14:46', '2021-07-08 12:14:46', NULL),
(7, 54, 234, 3, 'Good service', 1, '2021-07-08 12:23:02', '2021-07-08 12:23:02', NULL),
(8, 54, 234, 3, 'Good service', 1, '2021-07-08 12:42:50', '2021-07-08 12:42:50', NULL),
(9, 54, 234, 3, 'Good service', 1, '2021-07-08 12:44:57', '2021-07-08 12:44:57', NULL),
(10, 54, 234, 3, 'Good service', 1, '2021-07-08 12:45:44', '2021-07-08 12:45:44', NULL),
(11, 54, 234, 3, 'Good service', 1, '2021-07-08 12:54:25', '2021-07-08 12:54:25', NULL),
(12, 54, 234, 3, 'Good service', 1, '2021-07-08 14:09:45', '2021-07-08 14:09:45', NULL),
(13, 54, 234, 3, 'fhhhydvy for giguv', 1, '2021-07-08 14:35:49', '2021-07-08 14:35:49', NULL),
(14, 54, 234, 3, 'juhkjyjyu hhj', 1, '2021-07-08 16:10:20', '2021-07-08 16:10:20', NULL),
(15, 54, 234, 3, 'it was good experience me n my friends hav done lots of fun there', 1, '2021-07-09 01:28:24', '2021-07-09 01:28:24', NULL),
(16, 54, 234, 3, 'hwhwhwj hwjwjwjjwj wjwjjwkwk jwjwwjwj', 1, '2021-07-09 01:30:32', '2021-07-09 01:30:32', NULL),
(17, 54, 234, 3, 'yhwhejsjejekekkw jejejejjekwkw jekekwkwwk', 1, '2021-07-09 01:30:49', '2021-07-09 01:30:49', NULL),
(18, 54, 234, 3, 'Good service', 1, '2021-07-09 14:15:50', '2021-07-09 14:15:50', NULL),
(19, 54, 234, 3, 'gggcvghkokkkkklllkbnn', 1, '2021-07-10 05:51:20', '2021-07-10 05:51:20', NULL),
(20, 5000, 1146, 3, 'Good service', 1, '2021-07-10 15:08:53', '2021-07-10 15:08:53', NULL),
(21, 5000, 1146, 3, 'Good service', 1, '2021-07-11 01:09:43', '2021-07-11 01:09:43', NULL),
(22, 54, 234, 3, 'Gsgsgvzvsgz', 1, '2021-07-15 06:27:58', '2021-07-15 06:27:58', NULL),
(23, 5001, 1160, 3, 'testing for ratings', 1, '2021-07-18 01:40:43', '2021-07-18 01:40:43', NULL),
(24, 5001, 1160, 2, 'gghghghghgh', 1, '2021-07-18 07:17:32', '2021-07-18 07:17:32', NULL),
(25, 5001, 1160, 2, 'gghghiuiuiuiu', 1, '2021-07-18 07:24:29', '2021-07-18 07:24:29', NULL),
(26, 5000, 1146, 3, 'Good service', 1, '2021-07-22 16:01:52', '2021-07-22 16:01:52', NULL),
(27, 5000, 1255, 5, 'Good service', 1, '2021-07-24 14:10:29', '2021-07-24 14:10:29', NULL),
(28, 5000, 1146, 3, 'Good service', 1, '2021-07-25 06:52:08', '2021-07-25 06:52:08', NULL),
(29, 5000, 1146, 3, 'Good service', 1, '2021-07-26 00:59:05', '2021-07-26 00:59:05', NULL),
(30, 5001, 1255, 2, 'vubibbibi bug big', 1, '2021-07-26 13:29:09', '2021-07-26 13:29:09', NULL),
(31, 5000, 1255, 5, 'Good service', 1, '2021-07-27 06:22:45', '2021-07-27 06:22:45', NULL),
(32, 5000, 1146, 3, 'Good service', 1, '2021-07-28 14:29:07', '2021-07-28 14:29:07', NULL),
(33, 5020, 1255, 2, 'Good service', 1, '2021-08-05 03:05:54', '2021-08-05 03:05:54', NULL),
(34, 5000, 1146, 3, 'Good service', 1, '2021-09-22 23:08:08', '2021-09-22 23:08:08', NULL),
(35, 5020, 1295, 2, 'ggguguvivfhcjvj', 1, '2021-10-10 03:15:30', '2021-10-10 03:15:30', NULL),
(36, 5020, 1295, 3, 'ghjsididne', 1, '2021-10-10 03:16:16', '2021-10-10 03:16:16', NULL),
(37, 5020, 1295, 2, 'hhnu hi from', 1, '2021-10-10 04:11:36', '2021-10-10 04:11:36', NULL),
(38, 5020, 1290, 2, 'xt you rug', 1, '2021-10-23 03:24:48', '2021-10-23 03:24:48', NULL),
(39, 5020, 1291, 4, 'badar test badar test', 1, '2021-12-12 19:49:58', '2021-12-12 19:49:58', NULL),
(40, 5020, 1304, 4, 'gctchcuvjg jug itigugih', 1, '2021-12-20 01:46:09', '2021-12-20 01:46:09', NULL),
(41, 5020, 1304, 4, 'testing  ratings', 1, '2022-01-02 14:59:59', '2022-01-02 14:59:59', NULL),
(42, 5080, 1304, 3, 'test pkg vvhvhbububi', 1, '2022-01-03 23:51:09', '2022-01-03 23:51:09', NULL),
(43, 5020, 1304, 4, 'just a try (Badar)', 1, '2022-01-22 09:26:51', '2022-01-22 09:26:51', NULL),
(44, 5020, 1304, 4, 'Good service', 1, '2022-01-22 09:29:36', '2022-01-22 09:29:36', NULL),
(45, 5020, 1304, 4, 'gghhhbbbbbbbbbb', 1, '2022-01-26 01:39:52', '2022-01-26 01:39:52', NULL),
(46, 5096, 1304, 5, 'ding dong dang', 1, '2022-02-01 12:02:53', '2022-02-01 12:02:53', NULL),
(47, 5096, 1304, 3, 'ping pong pang', 1, '2022-02-01 12:03:14', '2022-02-01 12:03:14', NULL),
(48, 5096, 1304, 2, 'ling long lang', 1, '2022-02-01 12:03:26', '2022-02-01 12:03:26', NULL),
(49, 5096, 1304, 1, 'bira bora bara', 1, '2022-02-01 12:03:48', '2022-02-01 12:03:48', NULL),
(50, 5096, 1304, 5, 'tika toka taka', 1, '2022-02-01 12:04:15', '2022-02-01 12:04:15', NULL),
(51, 5096, 1304, 5, 'appearing?', 1, '2022-02-02 01:07:49', '2022-02-02 01:07:49', NULL),
(52, 5096, 1304, 4, 'tester of yedter', 1, '2022-02-06 03:34:24', '2022-02-06 03:34:24', NULL),
(53, 5096, 1304, 4, 'ffddďffffffffffffffffffffffffff', 1, '2022-02-24 08:58:18', '2022-02-24 08:58:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_sectors`
--

CREATE TABLE `service_sectors` (
  `id` int(10) UNSIGNED NOT NULL,
  `sector` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active,0=Deactive',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `service_sectors`
--

INSERT INTO `service_sectors` (`id`, `sector`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Training', 1, '2021-06-30 09:58:49', '2021-07-26 18:26:39', '2021-07-26 18:26:39'),
(2, 'Learning', 1, '2021-06-30 09:58:49', '2021-07-26 18:26:50', '2021-07-26 18:26:50'),
(3, 'Tutor', 1, '2021-06-30 09:58:49', '2021-10-19 13:26:04', '2021-10-19 13:26:04'),
(4, 'Manager', 1, '2021-06-30 09:58:49', '2021-10-19 13:26:09', '2021-10-19 13:26:09'),
(5, 'Director', 1, '2021-06-30 09:58:49', '2021-10-19 13:26:12', '2021-10-19 13:26:12'),
(6, 'Senior Manager', 1, '2021-06-30 09:58:49', '2021-10-19 13:26:15', '2021-10-19 13:26:15'),
(7, 'Senior Manager', 1, '2021-07-16 12:59:36', '2021-07-16 12:59:56', '2021-07-16 12:59:56'),
(8, 'aaa', 1, '2021-07-16 14:37:18', '2021-07-28 15:06:52', '2021-07-28 15:06:52'),
(9, 'test', 1, '2021-07-28 15:12:37', '2021-10-19 13:26:18', '2021-10-19 13:26:18'),
(10, 'test', 1, '2021-08-03 23:10:06', '2021-08-05 11:06:07', '2021-08-05 11:06:07'),
(11, 'test', 1, '2021-08-05 11:26:13', '2021-08-29 00:46:43', '2021-08-29 00:46:43'),
(12, 'test1', 1, '2021-08-29 00:47:12', '2021-10-19 13:26:22', '2021-10-19 13:26:22'),
(13, 'test2', 1, '2021-09-01 23:31:27', '2021-09-01 23:31:47', '2021-09-01 23:31:47'),
(14, 'test2', 1, '2021-09-02 00:06:07', '2021-09-02 00:07:03', '2021-09-02 00:07:03'),
(15, 'test2', 1, '2021-09-02 00:07:17', '2021-10-19 13:26:25', '2021-10-19 13:26:25'),
(16, 'test2', 1, '2021-09-02 00:18:54', '2021-09-02 00:19:00', '2021-09-02 00:19:00'),
(17, 'indian13213', 1, '2021-09-05 06:59:48', '2021-10-19 13:26:28', '2021-10-19 13:26:28'),
(18, 'test2222', 1, '2021-09-11 19:13:33', '2021-10-19 13:26:32', '2021-10-19 13:26:32'),
(19, 'Water', 1, '2021-10-19 13:26:43', '2021-10-19 13:27:06', '2021-10-19 13:27:06'),
(20, 'qqq', 1, '2021-10-19 13:26:58', '2021-10-19 13:27:03', '2021-10-19 13:27:03'),
(21, 'Water Activity', 1, '2021-10-19 13:27:21', '2021-10-19 13:27:21', NULL),
(22, 'Land Activity', 1, '2021-10-19 13:27:38', '2021-10-19 13:27:38', NULL),
(23, 'Sky Activity', 1, '2021-10-19 13:27:55', '2021-10-19 13:27:55', NULL),
(24, 'Packages', 1, '2021-10-19 14:40:43', '2021-10-19 14:40:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_service_for`
--

CREATE TABLE `service_service_for` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `sfor_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `service_service_for`
--

INSERT INTO `service_service_for` (`id`, `service_id`, `sfor_id`) VALUES
(8, 3, '1'),
(9, 3, '3'),
(10, 5002, '3'),
(11, 5003, '2'),
(12, 5004, '2'),
(13, 5005, '2'),
(14, 5006, '1'),
(15, 5007, '2'),
(16, 5008, '1'),
(17, 5009, '1'),
(18, 5010, '1'),
(19, 5011, '1'),
(20, 5012, '1'),
(21, 5013, '1'),
(22, 5014, '1'),
(23, 5015, '3'),
(24, 5016, '3'),
(25, 5017, '3'),
(26, 5018, '3'),
(27, 5019, '3'),
(28, 5020, '2'),
(29, 5022, '5'),
(30, 5033, ''),
(31, 5033, 'Ladies'),
(32, 5033, 'Gents'),
(33, 5033, 'Families'),
(34, 5034, ''),
(35, 5034, 'Ladies'),
(36, 5034, 'Gents'),
(37, 5034, 'Families'),
(38, 5035, ''),
(39, 5035, 'Ladies'),
(40, 5035, 'Gents'),
(41, 5035, 'Families'),
(42, 5036, ''),
(43, 5036, 'Ladies'),
(44, 5036, 'Gents'),
(45, 5036, 'Families'),
(46, 5037, ''),
(47, 5037, 'Ladies'),
(48, 5037, 'Gents'),
(49, 5037, 'Families'),
(50, 5038, 'Kids'),
(51, 5038, 'Ladies'),
(52, 5038, 'Gents'),
(53, 5038, 'Families'),
(54, 5039, 'Kids'),
(55, 5039, 'Ladies'),
(56, 5039, 'Gents'),
(57, 5039, 'Families'),
(58, 5040, 'Kids'),
(59, 5040, 'Ladies'),
(60, 5040, ''),
(61, 5040, ''),
(62, 5041, 'Kids'),
(63, 5041, 'Ladies'),
(64, 5041, ''),
(65, 5041, ''),
(66, 5042, 'Kids'),
(67, 5042, 'Ladies'),
(68, 5042, 'Gents'),
(69, 5042, 'Families'),
(70, 5043, 'Kids'),
(71, 5043, 'Ladies'),
(72, 5043, 'Gents'),
(73, 5043, 'Families'),
(74, 5044, 'Kids'),
(75, 5044, 'Ladies'),
(76, 5044, 'Gents'),
(77, 5044, 'Families'),
(78, 5045, 'one'),
(79, 5045, 'two'),
(80, 5045, 'three'),
(81, 5047, 'one'),
(82, 5047, 'two'),
(83, 5047, 'three'),
(84, 5048, 'one'),
(85, 5048, 'two'),
(86, 5048, 'three'),
(87, 5049, 'one'),
(88, 5049, 'two'),
(89, 5049, 'three'),
(90, 5050, 'one'),
(91, 5050, 'two'),
(92, 5050, 'three'),
(93, 5051, 'one'),
(94, 5051, 'two'),
(95, 5051, 'three'),
(96, 5052, 'one'),
(97, 5052, 'two'),
(98, 5052, 'three'),
(99, 5054, 'one'),
(100, 5054, 'two'),
(101, 5054, 'three'),
(102, 5057, 'one'),
(103, 5057, 'two'),
(104, 5057, 'three'),
(105, 5058, 'one'),
(106, 5058, 'two'),
(107, 5058, 'three'),
(108, 5060, 'one'),
(109, 5060, 'two'),
(110, 5060, 'three'),
(111, 5061, 'one'),
(112, 5061, 'two'),
(113, 5061, 'three'),
(114, 5062, 'one'),
(115, 5062, 'two'),
(116, 5062, 'three'),
(117, 5069, 'one'),
(118, 5069, 'two'),
(119, 5069, 'three'),
(120, 5071, 'one'),
(121, 5071, 'two'),
(122, 5071, 'three'),
(123, 5072, 'one'),
(124, 5072, 'two'),
(125, 5072, 'three'),
(126, 5073, 'one'),
(127, 5073, 'two'),
(128, 5073, 'three'),
(129, 5074, 'one'),
(130, 5074, 'two'),
(131, 5074, 'three'),
(132, 5076, 'Kids'),
(133, 5076, 'Ladies'),
(134, 5076, ''),
(135, 5076, ''),
(136, 5077, 'Kids'),
(137, 5077, 'Ladies'),
(138, 5077, 'Gents'),
(139, 5077, ''),
(140, 5078, 'Kids'),
(141, 5078, 'Ladies'),
(142, 5078, 'Gents'),
(143, 5078, ''),
(144, 5079, 'Kids'),
(145, 5079, 'Ladies'),
(146, 5079, ''),
(147, 5079, ''),
(148, 5080, 'Kids'),
(149, 5080, 'Ladies'),
(150, 5080, ''),
(151, 5080, ''),
(152, 5081, 'Kids'),
(153, 5081, 'Ladies'),
(154, 5081, 'Gents'),
(155, 5081, 'Families'),
(156, 5082, ''),
(157, 5082, ''),
(158, 5082, 'Gents'),
(159, 5082, 'Families'),
(160, 5083, ''),
(161, 5083, 'Ladies'),
(162, 5083, 'Gents'),
(163, 5083, ''),
(164, 5084, 'Kids'),
(165, 5084, ''),
(166, 5084, ''),
(167, 5084, ''),
(168, 5085, 'one'),
(169, 5085, 'two'),
(170, 5085, 'three'),
(171, 5086, 'one'),
(172, 5086, 'two'),
(173, 5086, 'three'),
(174, 5087, 'one'),
(175, 5087, 'two'),
(176, 5087, 'three'),
(177, 5088, 'one'),
(178, 5088, 'two'),
(179, 5088, 'three'),
(180, 5089, 'Kids'),
(181, 5089, 'Ladies'),
(182, 5089, ''),
(183, 5089, ''),
(184, 5090, 'Kids'),
(185, 5090, ''),
(186, 5090, ''),
(187, 5090, ''),
(188, 5091, 'Kids'),
(189, 5091, ''),
(190, 5091, ''),
(191, 5091, ''),
(192, 5092, 'Kids'),
(193, 5092, 'Ladies'),
(194, 5092, ''),
(195, 5092, ''),
(196, 5093, 'Kids'),
(197, 5093, ''),
(198, 5093, 'Gents'),
(199, 5093, ''),
(200, 5094, 'Kids'),
(201, 5094, 'Ladies'),
(202, 5094, ''),
(203, 5094, ''),
(204, 5095, 'Kids'),
(205, 5095, ''),
(206, 5095, ''),
(207, 5095, ''),
(208, 5096, ''),
(209, 5096, ''),
(210, 5096, 'Gents'),
(211, 5096, 'Families'),
(212, 5097, 'Kids'),
(213, 5097, 'Ladies'),
(214, 5097, 'Gents'),
(215, 5097, 'Families'),
(216, 5098, ''),
(217, 5098, ''),
(218, 5098, 'Gents'),
(219, 5098, ''),
(220, 5099, 'Kids'),
(221, 5099, ''),
(222, 5099, ''),
(223, 5099, ''),
(224, 5100, ''),
(225, 5100, 'Ladies'),
(226, 5100, 'Gents'),
(227, 5100, ''),
(228, 5101, 'Kids'),
(229, 5101, ''),
(230, 5101, ''),
(231, 5101, ''),
(232, 5102, 'one'),
(233, 5102, 'two'),
(234, 5102, 'three'),
(235, 5103, 'Kids'),
(236, 5103, 'Ladies'),
(237, 5103, ''),
(238, 5103, ''),
(239, 5104, 'Kids'),
(240, 5104, ''),
(241, 5104, ''),
(242, 5104, ''),
(243, 5105, 'Kids'),
(244, 5105, ''),
(245, 5105, ''),
(246, 5105, ''),
(247, 5106, 'Kids'),
(248, 5106, 'Ladies'),
(249, 5106, 'Gents'),
(250, 5106, ''),
(251, 5107, 'Kids'),
(252, 5107, 'Ladies'),
(253, 5107, ''),
(254, 5107, ''),
(255, 5108, 'Kids'),
(256, 5108, 'Ladies'),
(257, 5108, ''),
(258, 5108, ''),
(259, 5109, 'Kids'),
(260, 5109, ''),
(261, 5109, ''),
(262, 5109, ''),
(263, 5110, ''),
(264, 5110, ''),
(265, 5110, 'Gents'),
(266, 5110, 'Families'),
(267, 5111, 'Kids'),
(268, 5111, 'Ladies'),
(269, 5111, ''),
(270, 5111, 'Families'),
(271, 5112, 'Kids'),
(272, 5112, ''),
(273, 5112, 'Gents'),
(274, 5112, ''),
(275, 5113, 'Kids'),
(276, 5113, 'Ladies'),
(277, 5113, 'Gents'),
(278, 5113, 'Families'),
(279, 5114, '1'),
(281, 1, '1'),
(282, 1, '4'),
(283, 1, '5'),
(284, 2, '1');

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active,0=Deactive',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`id`, `type`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hiking', 1, '2021-06-30 10:08:25', '2021-06-30 10:18:35', NULL),
(2, 'Skiing', 1, '2021-06-30 10:08:25', '2021-10-19 13:07:53', '2021-10-19 13:07:53'),
(3, 'Parachuting', 1, '2021-06-30 10:08:25', '2021-10-19 13:08:01', '2021-10-19 13:08:01'),
(4, 'Scuba diving', 1, '2021-06-30 10:08:25', '2021-08-05 11:06:29', '2021-08-05 11:06:29'),
(5, 'Zorbing', 1, '2021-06-30 10:08:25', '2021-07-31 12:41:21', '2021-07-31 12:41:21'),
(6, 'test2', 1, '2021-08-29 00:48:34', '2021-09-01 23:33:02', '2021-09-01 23:33:02'),
(7, 'test2', 1, '2021-09-01 22:28:39', '2021-09-01 23:32:28', '2021-09-01 23:32:28'),
(8, 'test2', 1, '2021-09-01 23:32:39', '2021-09-01 23:32:50', '2021-09-01 23:32:50'),
(9, 'Paragliding', 1, '2021-10-19 13:08:22', '2021-10-19 13:08:22', NULL),
(10, 'Paramotor', 1, '2021-10-19 13:08:35', '2021-10-19 13:08:35', NULL),
(11, 'Scuba Diving', 1, '2021-10-19 13:08:53', '2021-10-19 13:08:53', NULL),
(12, 'Canyoning', 1, '2021-10-19 13:09:02', '2021-10-19 13:09:02', NULL),
(13, 'Kitesurfing', 1, '2021-10-19 13:09:39', '2021-10-19 13:09:39', NULL),
(14, 'Drifting', 1, '2021-10-19 13:10:00', '2021-10-19 13:10:00', NULL),
(15, 'Caving', 1, '2021-10-19 13:12:12', '2021-10-19 13:12:12', NULL),
(16, 'Climbing', 1, '2021-10-19 13:12:37', '2021-10-19 13:12:37', NULL),
(17, 'Cycling', 1, '2021-10-19 13:13:14', '2021-10-19 13:13:14', NULL),
(18, 'Freediving', 1, '2021-10-19 13:14:26', '2021-10-19 13:14:26', NULL),
(19, 'Camping', 1, '2021-10-19 13:14:42', '2021-10-19 13:17:53', '2021-10-19 13:17:53'),
(20, 'Hang Gliding', 1, '2021-10-19 13:15:01', '2021-10-19 13:15:01', NULL),
(21, 'Highlining / Slacklining', 1, '2021-10-19 13:15:35', '2021-10-19 13:15:35', NULL),
(22, 'Horse Riding', 1, '2021-10-19 13:16:03', '2021-10-19 13:16:03', NULL),
(23, 'Overlanding (Camping)', 1, '2021-10-19 13:17:40', '2021-10-19 13:17:40', NULL),
(24, 'Sand boarding', 1, '2021-10-19 13:18:59', '2021-10-19 13:18:59', NULL),
(25, 'Sailing', 1, '2021-10-19 13:19:32', '2021-10-19 13:19:32', NULL),
(26, 'Skydiving', 1, '2021-10-19 13:19:50', '2021-10-19 13:19:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`id`, `type`, `amount`) VALUES
(1, '1 Week', 'Free'),
(2, 'Monthly', '$5.00'),
(3, 'Quaterly', '$25.00'),
(4, 'Yearly', '$45.00');

-- --------------------------------------------------------

--
-- Table structure for table `terms_conditions`
--

CREATE TABLE `terms_conditions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `terms_conditions`
--

INSERT INTO `terms_conditions` (`id`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ownership of responsibilities is more valued than talent and skills: Hitesh Singla, Square Yards', 'Hitesh Singla, Co-founder, and CIO, Square Yards, dishes on his digital transformation journey with the company and shares his early career path with technology.', '2021-07-28 05:07:20', '2021-07-28 05:07:20', NULL),
(2, 'Achieve your goals, never quit and be humble: Ravinder Arora', 'Ravinder Arora, Global CISO Infogain, has had an extraordinary career. Coming from the small town of Haryana, and ended up becoming the most prestigious CISO of the country, his journey has been only of dreams.', '2021-07-28 05:07:20', '2021-07-28 05:07:20', NULL),
(3, 'Change is a step towards opportunity: Gautam Garg, PepsiCo', 'Gautam Garg, Sr Director & CIO at PepsiCo, speaks on his 21 years journey at the company and shares his future goals for the upcoming years.', '2021-07-28 05:07:20', '2021-07-28 05:07:20', NULL),
(4, 'I am very happily unsatisfied: upGrad’s Rohit Dhar', 'Change is not welcoming unless you share the vision & rationale with a positive impact, feels Rohit Dhar, President - Product, Data, Design, Technology & Content (PDTC) of upGrad.', '2021-07-28 05:07:20', '2021-07-28 05:07:20', NULL),
(5, 'Recommended summer camp programs:', '“That one time at band camp” became a cliche for a reason: because summer camp is the ultimate source of absurd and wonderful adventures – the kind you can embarrass your grandchildren with for decades to come. Count on plenty of crafting with natural materials, group hiking, and schmoozing with co-eds on your summer camp adventure travel program. The campfire songs and s’mores at the end of each night are just the icing on the cake.', '2021-07-28 05:07:20', '2021-07-28 05:07:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `username`, `type`, `transaction_type`, `method`, `status`, `price`, `create_at`) VALUES
(4, 'testravi', 'partner', 'river rafting', 'wire transfer', '3', 101, '2022-03-08 08:50:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `users_role` enum('1','2','3') CHARACTER SET latin1 DEFAULT '3' COMMENT '''1''=>''Admin'',''2''=>''Vendor'',''3''=>''Customer''',
  `profile_image` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `height` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `weight` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `now_in` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `mobile_verified_at` datetime DEFAULT NULL,
  `dob` varchar(50) CHARACTER SET latin1 NOT NULL,
  `gender` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT 'male',
  `language_id` int(11) NOT NULL DEFAULT 1,
  `currency_id` int(11) NOT NULL DEFAULT 1,
  `app_notification` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `points` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `health_conditions` varchar(500) CHARACTER SET latin1 NOT NULL,
  `health_conditions_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `mobile_code` tinyint(4) DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `status` enum('0','1','2') CHARACTER SET latin1 DEFAULT '1' COMMENT '''0'' Inactive , ''1'' Active, ''2'' Decline',
  `added_from` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1=APP,0=WEB',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `username` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `users_role`, `profile_image`, `name`, `height`, `weight`, `password`, `email`, `country_id`, `city_id`, `now_in`, `mobile`, `mobile_verified_at`, `dob`, `gender`, `language_id`, `currency_id`, `app_notification`, `points`, `health_conditions`, `health_conditions_id`, `email_verified_at`, `mobile_code`, `remember_token`, `status`, `added_from`, `created_at`, `updated_at`, `deleted_at`, `username`, `first_name`, `last_name`) VALUES
(1, '1', '20220330155047-1.jpg', 'NickJhon', NULL, NULL, '$2y$10$O4rQf3Rt5HzbnI/Dau4SwuLRGNHWrX7HzQBbPYlNCuRkGFrq4XWrG', 'admin@gmail.com', 1, 1, NULL, '9020202020', NULL, '1993-05-04', 'male', 1, 1, '1', '0', '', NULL, '2021-06-17 12:34:39', NULL, 'hzTFRpFydvFZEUCDBSXmH5mVDAWCrXKKWtc9YQ3SI2hUStVzZANVICgMDW1J', '1', 0, '2020-05-13 00:29:20', '2022-03-30 09:16:52', '2021-06-15 01:56:57', NULL, NULL, NULL),
(1255, '3', '', 'pankaj1', '0cm', '4kg', '7c222fb2927d828af22f592134e8932480637c0d', 'Pankaj1@gmail.com', 1, 1, 'India', '9627204184', '2021-07-24 21:35:15', '1982-07-15', 'male', 1, 1, '0', '0', '11', NULL, NULL, 91, NULL, '0', 1, '2021-07-25 01:34:57', '2021-12-23 16:55:20', '2021-12-23 22:25:20', NULL, NULL, NULL),
(1256, '2', '', 'pankaj', '7cm', '5kg', '$2y$10$4AwAp2ftS7tX7.hlwpEyFeRkHEeOYBTwAvYE8.xlnyMevs86FDe7G', 'pankaj613@gmail.com', 1, 1, 'India', '8630920347', '2021-07-24 22:32:00', '1974-07-24', 'male', 1, 1, '0', '0', '', NULL, NULL, 91, NULL, '1', 1, '2021-07-25 02:28:08', '2021-12-23 16:53:05', '2021-12-23 22:23:05', NULL, NULL, NULL),
(1257, '2', '', 'sachWinPaul', '165CM', '61Kg', '$2y$10$hY6ZHXsNhEUvpE1XFtg0JevE3RFiBBDrraHDIiIWJhJmQAVyrJqr.', 'sachin@yopmail.com', 1, 1, 'Meerut', '9639445522', '2021-07-25 10:09:52', '1993-10-30', 'male', 1, 1, '0', '0', '1,2,3', NULL, NULL, 91, NULL, '1', 1, '2021-07-25 14:08:34', '2022-01-31 08:37:52', '2022-01-31 14:07:52', NULL, NULL, NULL),
(1258, '3', '20210725132834-avatar-5.jpg', 'testUser', '155', '76', '$2y$10$UDa2YcMA5PYbo21XaSl3ROsTv2hVTau4oIItxGQXoeuuGERSgfH/u', 'test@gmail.com', 1, 1, NULL, '+91-343434333', NULL, '13-07-2021', 'male', 1, 1, '0', '0', '1,5', NULL, NULL, NULL, 'KxO0aPABbYlaYB8gvqZwueo2YpxgoX7RjlYRvjiT', '1', 0, '2021-07-25 17:28:35', '2021-12-25 07:05:17', '2021-12-25 12:35:17', NULL, NULL, NULL),
(1259, '3', '20210726151056-fabd647d-d1ed-46d6-91c8-647ca41217bb.jpg', 'akash sharma', '100', '9', '$2y$10$2CDCmdiRcHq8PDu.2az9zuG1aAcmnMKFLtSm.XzyTF3puOA22fHfG', 'akashsharma@arknewtech.com', 1, 1, NULL, '+91-9532152054', NULL, '24-07-1990', 'male', 1, 1, '0', '0', '1', NULL, NULL, NULL, 'DDzPk01rVigRDjUZhUVKrDOOWy1kJkcQ06Hr6X37', '1', 0, '2021-07-26 19:10:56', '2021-12-23 05:49:19', '2021-12-23 11:19:19', NULL, NULL, NULL),
(1260, '3', '20210726151627-fabd647d-d1ed-46d6-91c8-647ca41217bb.jpg', 'bobby sharma', '100', '9', '$2y$10$wUTiAoyW8LooxVWVhiC8DuMH7JxuCwCluJIdHZiUVRXEZsgWOdH1W', 'as601765@gmail.com', 1, 1, NULL, '+91-8882341937', NULL, '27-07-2021', 'male', 1, 1, '0', '0', '1,2', NULL, NULL, NULL, 'DDzPk01rVigRDjUZhUVKrDOOWy1kJkcQ06Hr6X37', '1', 0, '2021-07-26 19:16:27', '2021-12-23 06:01:34', '2021-12-23 11:31:34', NULL, NULL, NULL),
(1263, '2', '', 'Shubham', '100cm', '63kg', '$2y$10$gRYu9DiDyRXPJ553o76hGOloTGOQrlgQj4UpEZhW1vRZd/W3ky/1u', 'subhamsingh24798@gmail.com', 1, 0, 'India', '7488463079', '2021-07-27 15:34:48', '1999-03-08', 'male', 1, 1, '0', '0', '', NULL, NULL, 91, NULL, '1', 1, '2021-07-27 19:34:34', '2021-07-27 19:35:35', NULL, NULL, NULL, NULL),
(1271, '3', '', 'pankaj1@gmail.com', '11cm', '2kg', '$2y$10$Aq.akYRKmj38C2SnFOq2cuLUi/smdzmPuUjyevtFWPPNut4CH2yfa', 'pankaj11@gmail.com', 1, 0, 'India', '9627204181', '2021-08-03 19:59:26', '1997-07-12', 'male', 1, 1, '0', '0', '1,2', NULL, NULL, 91, NULL, '1', 1, '2021-08-03 23:59:04', '2021-12-23 16:55:19', '2021-12-23 22:25:19', NULL, NULL, NULL),
(1274, '3', 'profile_image/1628597086.png', 'sachwin', '165', '61', NULL, 'sachinn@yopmail.com', 1, 2, NULL, '9639445521', NULL, '2021-08-30', 'male', 1, 1, '0', '0', '1,6,10,11', NULL, NULL, 1, NULL, '0', 0, '2021-08-10 12:04:46', '2021-08-10 12:04:46', NULL, NULL, NULL, NULL),
(1276, '3', '', 'nitin', '17cm', '12kg', '$2y$10$95hYxAhvRrVOF/1nOXBD1uko9NnubCBkBgadQcx1mPBSJIFRrD0RO', 'nitingangwar04@gmail.com', 1, 0, 'India', '6396345287', '2021-08-11 21:15:01', '1976-11-08', 'male', 1, 1, '0', '0', '10', NULL, NULL, 91, NULL, '1', 1, '2021-08-12 01:14:32', '2021-12-23 16:52:53', '2021-12-23 22:22:53', NULL, NULL, NULL),
(1277, '3', 'profile_image/1628769857.png', 'text1', '100', '55', NULL, 'text1@gmail.com', 1, 2, NULL, '3234556672', NULL, '2010-04-09', 'male', 1, 1, '0', '0', '1,5', NULL, NULL, 1, NULL, '0', 0, '2021-08-12 12:04:17', '2022-01-12 10:40:04', '2022-01-12 16:10:04', NULL, NULL, NULL),
(1283, '3', 'profile_image/1628841966.png', 'test2', '155', '53', NULL, 'test2@gmail.com', 1, 2, NULL, '3234556674', NULL, '2021-08-17', 'male', 1, 1, '0', '0', '1,5', NULL, NULL, 1, NULL, '1', 0, '2021-08-13 08:06:06', '2021-08-13 08:06:06', NULL, NULL, NULL, NULL),
(1284, '2', '', 'Pankaj', '4cm', '1kg', '$2y$10$K/lW9lBsqb4gWwnzG5vYnuZkHZj0o8i2e5sfNt5YgY2OyATh9WKPe', 'raj@gmail.com', 1, 0, 'India', '8006764332', '2021-08-13 22:33:48', '1995-08-02', 'male', 1, 1, '0', '0', '1', NULL, NULL, 91, NULL, '1', 1, '2021-08-14 02:32:28', '2022-01-31 08:36:03', '2022-01-31 14:06:03', NULL, NULL, NULL),
(1285, '3', '', 'testing', '5cm', '52kg', '$2y$10$sJV/W0eGzYqyluWWMkXoRup8r.NrGV/i19GZn562vAh.2L6HZOZVe', 'testing@gmail.com', 1, 0, 'India', '8377934141', '2021-08-14 08:15:17', '2008-10-05', 'male', 1, 1, '0', '0', '1,3', NULL, NULL, 91, NULL, '1', 1, '2021-08-14 12:15:03', '2022-02-01 16:07:57', '2022-02-01 21:37:57', NULL, NULL, NULL),
(1286, '3', 'profile_image/1629913987.jpeg', 'testrv', '1.78', '65', NULL, 'testrv@gmail.com', 1, 2, NULL, '9988445584', NULL, '1989-11-30', 'male', 1, 1, '0', '0', '1,5', NULL, NULL, 1, NULL, '1', 0, '2021-08-25 17:53:07', '2022-02-01 16:07:45', '2022-02-01 21:37:45', NULL, NULL, NULL),
(1287, '3', 'profile_image/1631376943.jpeg', 'ravi', '676', '76678', NULL, 'raviyadavspn1991@gmail.com', 1, 12, NULL, '9898989898', NULL, '2021-09-01', 'male', 1, 1, '0', '0', '1', NULL, NULL, 1, NULL, '1', 0, '2021-09-11 16:15:43', '2021-09-11 16:15:43', NULL, NULL, NULL, NULL),
(1288, '3', 'profile_image/1631380330.jpeg', 'raviadmin', '32', '11', NULL, 'adminravi@gmail.com', 1, 12, NULL, '9898989000', NULL, '2021-10-11', 'male', 1, 1, '0', '0', '1', NULL, NULL, 1, NULL, '1', 0, '2021-09-11 17:12:10', '2021-09-11 17:12:10', NULL, NULL, NULL, NULL),
(1290, '3', 'http://adventuresclub.net/admin/public/profile_image/1629913987.jpeg', 'ravi', '4cm', '5kg', '$2y$10$Tie3nz6Z1moVBLXe4agFWOgOBZOG5.glzhzw3MOZDfu94d//NCEZC', 'nitin@gmail.com', 1, 0, 'Meerut', '8630920333', '2021-10-12 00:41:30', '1993-10-30', 'male', 1, 1, '0', '0', '1,6,8,9,11,13', NULL, NULL, 91, NULL, '0', 1, '2021-10-11 19:08:49', '2021-10-16 17:00:46', NULL, NULL, NULL, NULL),
(1291, '3', 'DSC01225.JPG', 'ravi', '107cm', '35kg', '$2y$10$28l0geoR0jI8ucyPgRLN/.7ZdIqPo/KgS4qu6yDX5BA3suuk2udfm', 'nitin1@gmail.com', 1, 0, 'Meerut', '8630920334', '2021-10-12 22:36:36', '1993-10-30', 'male', 1, 1, '0', '0', '1,4,6,12,13', NULL, NULL, 91, NULL, '1', 1, '2021-10-12 17:06:11', '2022-01-09 13:50:56', '2022-01-09 19:20:56', NULL, NULL, NULL),
(1293, '2', '20211021205636-DSC01191.JPG', 'ravi yadd', '898', '77', NULL, 'raviyadavspn199111@gmail.com', 1, 12, NULL, '9898911111', NULL, '2021-08-02', 'male', 1, 1, '0', '0', '1,4,8', NULL, NULL, 1, NULL, '1', 0, '2021-10-21 15:26:36', '2021-10-21 15:26:36', NULL, NULL, NULL, NULL),
(1296, '3', '', 'panka', '3cm', '2kg', '$2y$10$D170qVKL7jJVcOKp.h2k8ev7jW3dqwb.WXCuEDo/1Qdr6SaKS2wV2', 'kapil@gmail.com', 1, 0, 'India', '8279805359', '2021-10-23 22:34:40', '2021-10-08', 'male', 1, 1, '0', '0', '1,4', NULL, NULL, 91, NULL, '1', 1, '2021-10-23 17:04:25', '2021-10-23 17:18:09', NULL, NULL, NULL, NULL),
(1297, '3', 'profile_image/1636093975.png', 'badaralsahi', '177', '77', NULL, 'badaralsahi@gmail.com', 1, 3, NULL, '9894057884', NULL, '2021-11-08', 'male', 1, 1, '0', '0', '6,10,13', NULL, NULL, 1, NULL, '1', 0, '2021-11-05 06:32:55', '2021-11-05 06:32:55', NULL, NULL, NULL, NULL),
(1298, '3', '', 'kashish', '100cm', '85kg', '$2y$10$lLa0CUnJeAqcLrJAhgXUju3vIxYgheJVSYrXLve92FVU9wkCA9S5m', 'kashishtheleader@gmail.com', 1, 0, 'India', '9650936880', '2021-11-12 00:56:27', '2021-01-01', 'male', 1, 1, '0', '0', '1', NULL, NULL, 91, NULL, '1', 1, '2021-11-11 19:24:59', '2021-11-11 19:26:32', NULL, NULL, NULL, NULL),
(1299, '3', '/profile_image/ic_launcher_app_rounded.png', 'nkaj', '102cm', '12kg', '$2y$10$QM2IH0d4ZC7fW1MjWehWrOP2Qr2bWZgx9nuOXx/fZvWJP/L4ZIHGq', 'pankajxamdevh@gmail.com', 1, 0, 'India', '9719575721', '2021-12-08 23:19:01', '2021-12-25', 'male', 1, 1, '0', '0', '1,4', NULL, NULL, 91, NULL, '1', 1, '2021-11-11 20:38:39', '2021-12-23 16:58:49', '2021-12-23 22:28:49', NULL, NULL, NULL),
(1300, '3', '/profile_image/610c7f89-d7e6-428c-9bed-528ce780ef68vid_1620413768-video-effect-video-video_07_05_2021_23_13_41.jpg', 'pankakgkgg', '103cm', '15kg', '$2y$10$mn6DcvExuLltEpSvbJO/TOCtvjP9Lh5HIz5cjsQdIyePmxNexj3L2', 'pankajxamdev@gmail.com', 4, 0, 'Australia', '9627204289', '2021-11-13 01:13:33', '1992-11-21', 'male', 1, 1, '0', '0', '1,4,6,8,13', NULL, NULL, 91, NULL, '1', 1, '2021-11-12 19:42:18', '2021-12-13 17:03:56', NULL, NULL, NULL, NULL),
(1301, '3', '', 'nitin1@gmail.com', '102cm', '10kg', '$2y$10$ABwGRx2Xp7D4MBe0YCHDBe5FksK5GU4QYfb58w2Sk19jy67TEeYwa', 'nitin1hvyv@gmail.com', 4, 0, 'Australia', '8279649549', '2021-11-13 12:59:15', '2021-11-11', 'male', 1, 1, '0', '0', '1,4', NULL, NULL, 91, NULL, '1', 1, '2021-11-13 07:21:24', '2021-11-13 07:29:55', NULL, NULL, NULL, NULL),
(1302, '3', '', 'pankaj', '102cm', '13kg', '$2y$10$Zn3YPeAPfqixbJ5r3bI1l.Ss/tTLwki8eEwIJUKEPDnqkumdmbK0i', 'pankajgangwar613@gmail.com', 1, 0, 'India', '7830335039', '2021-12-04 14:13:09', '2021-12-01', 'male', 1, 1, '0', '0', '4,7,9,12,13,14', NULL, NULL, 91, NULL, '1', 1, '2021-12-04 08:42:39', '2021-12-23 16:58:24', '2021-12-23 22:28:24', NULL, NULL, NULL),
(1303, '3', '/profile_image/38c1f547-179e-40fd-80b5-7e3307c6512424851b0aebf34a91beddef41ef5aba3ec00.jpg', 'hhu', '104cm', '14kg', '$2y$10$.Yn3FzJbfdOUm/nxnAPdLOOaYjlNoh5sDzrPxZLSW3ZUSyDPsYdrO', 'pankaj@gmail.com', 1, 0, 'India', '7830335038', '2021-12-13 22:46:13', '2021-12-01', 'male', 1, 1, '0', '0', '1,4', NULL, NULL, 91, NULL, '1', 1, '2021-12-13 17:15:32', '2021-12-23 16:57:54', '2021-12-23 22:27:54', NULL, NULL, NULL),
(1304, '3', '/profile_image/2e14f2bb-5c0a-49ef-be21-dd52894d0c92IMG_20220116_200346.jpg', 'pankajm', '130 CM', '80 KG', '$2y$10$25F9CtqS0g2CPvowtfq7leC9OAIrfHaz6nrZt7fK/QCLpu5A2uMUu', 'pankajj@gmail.com', 4, 0, 'India', '7830335037', '2021-12-14 00:07:59', '2021-12-08', 'male', 1, 1, '0', '0', '1,11,4,6,7,8,9,10,12,13', NULL, NULL, 91, NULL, '1', 1, '2021-12-13 18:37:37', '2022-03-01 17:03:44', NULL, NULL, NULL, NULL),
(1306, '3', '/profile_image/8b42e1a8-eaef-430e-bcdd-b8badbf9fd05Screenshot_2021-12-16-22-18-25-16.jpg', 'ayushi', '104 CM', '30 KG', '$2y$10$GHIKBBpGoPKzZt8Gm4W48O/AW8lGwLDL90YIi/ui/ezbXX92Wty8S', 'ayushiasu@gmail.com', 1, 0, 'India', '7011787790', '2021-12-16 11:47:44', '1998-09-02', 'male', 1, 1, '0', '0', '1', NULL, NULL, 91, NULL, '1', 1, '2021-12-16 06:17:36', '2021-12-17 17:45:52', NULL, NULL, NULL, NULL),
(1310, '3', '', 'hjjhg', '104 CM', '12 KG', '$2y$10$pd7Qw1bX/G4Afmh.agyrwer7yhbPxlAUifjuOu8oQcElIGda/84.e', 'pankajgangwar613g@gmail.com', 4, 0, 'Australia', '7830335036', '2021-12-20 02:13:21', '1970-01-16', 'male', 1, 1, '0', '0', '1,4', NULL, NULL, 91, NULL, '1', 1, '2021-12-19 20:42:55', '2021-12-23 16:57:41', '2021-12-23 22:27:41', NULL, NULL, NULL),
(1316, '3', '', 'Akash Sharma', '101 CM', '11 KG', '$2y$10$zD3pQjILmVtzUTP8WhVP2O/daxC9VA2I3vfHhETWU6sjnNbqZ2h0a', 'as601711651@gmail.com', 1, 0, 'India', '9627204181', '2021-12-23 22:26:56', '1992-01-01', 'male', 1, 1, '0', '0', '1,4,6,8,9', NULL, NULL, 91, NULL, '1', 1, '2021-12-23 16:56:41', '2021-12-23 16:59:28', '2021-12-23 22:29:28', NULL, NULL, NULL),
(1317, '3', '', 'Akash', '103 CM', '17 KG', '$2y$10$uzykhBTenm.XXPhL0WoroucUMb3yZRwbAWkrlh8.U5jbnWFYkTKtm', 'as6017111651@gmail.com', 1, 0, 'India', '9627204181', '2021-12-23 22:37:41', '1999-01-01', 'male', 1, 1, '0', '0', '1,4,8,11', NULL, NULL, 91, NULL, '1', 1, '2021-12-23 17:02:17', '2021-12-23 17:13:42', '2021-12-23 22:43:42', NULL, NULL, NULL),
(1319, '3', '', 'Akash', '117 CM', '53 KG', '$2y$10$tQxcKhwPxBRss44dWCk2QeJMe9Vbe8x1871fzQXr4mQQDyU5u/r.i', 'as6017651@gmail.com', 1, 0, 'India', '8882341937', '2021-12-31 15:07:06', '1973-01-09', 'male', 1, 1, '0', '0', '1', NULL, NULL, 91, NULL, '1', 1, '2021-12-25 07:19:07', '2022-01-04 15:28:25', '2022-01-04 20:58:25', NULL, NULL, NULL),
(1323, '3', '/profile_image/6330d0e5-5b3c-49a5-8046-a123f306acddScreenshot_20211015-134740_YouTube.jpg', 'pankaj', '100 CM', '10 KG', '$2y$10$JRB1XhZmc8LeCjylmPIIqeWU38pwXBZJf86fbgJiD4W/2raxhSEkS', 'rajkumar@gmail.com', 1, 0, 'India', '8630920347', '2022-01-06 00:44:52', '1996-03-12', 'male', 1, 1, '0', '0', '1,4', NULL, NULL, 91, NULL, '1', 1, '2022-01-05 19:14:29', '2022-01-05 20:04:44', NULL, NULL, NULL, NULL),
(1324, '3', '', 'Akash Sharma', '142 CM', '83 KG', '$2y$10$DA0aCImCOLGXpOFYmj35i.3Yq9AvVpDf36d9BgvDothpD6jrfZLsu', 'as6017652@gmail.com', 1, 0, 'India', '8054251404', '2022-01-06 11:56:19', '1952-01-12', 'male', 1, 1, '0', '0', '1,4', NULL, NULL, 91, NULL, '1', 1, '2022-01-06 06:26:01', '2022-01-06 06:26:54', NULL, NULL, NULL, NULL),
(1325, '3', '', 'pankaj', '103 CM', '10 KG', '$2y$10$113JrLi55AdTvYWJMFWctOpdFr7z8ZgHJmSodMz18zv.il8m3qqZK', 'pkj@gmail.com', 1, 0, 'India', '9259256310', '2022-01-09 21:21:22', '1952-04-18', 'male', 1, 1, '0', '0', '1,4', NULL, NULL, 91, NULL, '1', 1, '2022-01-09 15:50:53', '2022-01-09 15:51:48', NULL, NULL, NULL, NULL),
(1326, '3', '', 'pankaj', '100 CM', '10 KG', '$2y$10$.oCF4WUtl/o9CyQdF9yylObBQ1/GQPh4yVB/9N533h3xBdVtgCwa.', 'pankajkumar@gmail.com', 1, 0, 'India', '9627204181', '2022-01-09 22:04:33', '1952-02-16', 'male', 1, 1, '0', '0', '1,4', NULL, NULL, 91, NULL, '1', 1, '2022-01-09 16:33:02', '2022-01-09 16:34:51', NULL, NULL, NULL, NULL),
(1330, '3', '/profile_image/59a5863a-40ae-427f-9c91-93648de3fea3Screenshot_20220305-205324_Instagram_2.png', 'badarsahi', '123 CM', '53 KG', '$2y$10$ZhQmuAwKQPcCCa5I7WxKq.c9g/srebyGluJJVVA9JulCvsecIg5/m', 'mscbadar@gmail.com', 7, 0, 'Oman', '0096123588', '2022-03-07 16:29:24', '1981-03-07', 'male', 1, 1, '0', '0', '1,8,12', NULL, NULL, 127, NULL, '1', 1, '2022-01-09 17:14:43', '2022-03-07 17:38:18', NULL, NULL, NULL, NULL),
(1336, '3', 'profile_image/1643617999.png', 'test123', '670', '79', NULL, 'test@123.com', 1, 18, NULL, '7979948924', NULL, '1990-02-01', 'male', 1, 1, '0', '0', '1,8', NULL, NULL, 1, NULL, '0', 0, '2022-01-31 08:33:19', '2022-01-31 08:33:19', NULL, NULL, NULL, NULL),
(1368, '3', '', 'hhhhficu', '100 CM', '11 KG', '$2y$10$TWIr/jSKM2ESscnT/VPdgePXhYRZlk34WFm.oJqyAm0CxnLhk0bA6', 'pankhhjhgjfufgggggj@gmail.com', 7, 0, 'Oman', '96123458', '2022-03-02 00:17:25', '1952-03-15', 'male', 1, 1, NULL, '0', '1', NULL, NULL, 127, NULL, '1', 1, '2022-03-01 18:46:42', '2022-03-01 19:03:08', NULL, NULL, NULL, NULL),
(1372, '3', '', 'upendra', '164cm', '61kg', '$2y$10$pf.Rdsvp6Imh5ccDYP7xmeGQ.g9R9k4pSNoOFoqvCI0pu78Gfql9K', 'upendra@yopimail.comp', 968, 0, '968', '96123456', '2022-03-02 00:37:37', '1993-10-30', 'male', 1, 1, NULL, '0', '1,2,3', NULL, NULL, 127, NULL, '1', 1, '2022-03-01 18:52:34', '2022-03-02 18:03:28', NULL, NULL, NULL, NULL),
(1375, '3', '', 'bhs', '104 CM', '13 KG', '$2y$10$Bz9iSp3p/E3cPNW/faG2YeLJN/5pByPPm1IruL0ko.smfn1MyWwNG', 'pankajj@ggmail.comk', 7, 0, 'Oman', '96123451', '2022-03-03 21:54:25', '1952-03-22', 'male', 1, 1, NULL, '0', '1,4', NULL, NULL, 127, NULL, '1', 1, '2022-03-03 16:24:00', '2022-03-03 16:33:02', NULL, NULL, NULL, NULL),
(1377, '3', '/profile_image/ba2e3cf6-a2af-4e82-a771-a370c5a4d48dScreenshot_2022-02-17-16-36-39-76.jpg', 'raj kumar', '103 CM', '11 KG', '$2y$10$Mx2NsPB1Wp3NmCRBtjuWxuOgLgM.SXC6yxMnAWQrisY7rNwqyd1PK', 'raj@gmail.ckk', 1, 0, 'India', '9761558529', '2022-03-05 19:50:39', '1952-03-13', 'male', 1, 1, NULL, '0', '1,4', NULL, NULL, 91, NULL, '1', 1, '2022-03-03 16:30:21', '2022-03-06 11:18:44', NULL, NULL, NULL, NULL),
(1379, '3', '/profile_image/da00015d-f39f-41f1-9bc3-5a28d7d8ec4aIMG-20220221-WA0004.jpg', 'fff', '100 CM', '10 KG', '$2y$10$w.dhng9keodZW5VwF1V1O.HDo3Je4bfjwW90/13bJ00L0KDxcxW.W', 'pankdrf@ddf.ggg', 7, 0, 'Oman', '9879878989', '2022-03-03 22:18:04', '1952-03-11', 'male', 1, 1, NULL, '0', '1,11', NULL, NULL, 91, NULL, '1', 1, '2022-03-03 16:47:37', '2022-03-03 17:09:07', NULL, NULL, NULL, NULL),
(1381, '3', '', 'nbhy', '100 CM', '10 KG', '$2y$10$c4ECR7x3Qkys1MR3fhdbgOiXnk5GDm6IUdlwetb7Fx6PLGbG3Pon.', 'jhg@ghh.hhj', 7, 0, 'Oman', '96123489', '2022-03-03 23:11:26', '1952-03-05', 'male', 1, 1, NULL, '0', '', NULL, NULL, 127, NULL, '1', 1, '2022-03-03 17:40:55', '2022-03-03 17:41:48', NULL, NULL, NULL, NULL),
(1383, '3', '', 'Upendra kumar', '164cm', '61kg', '$2y$10$tx64u2SedzVTJIYyxAvJQOOkecbquvudiP2iv1SLDnZtonVtZlzKS', 'upendra@email.com', 91, 0, 'Meerut', '9627204182', '2022-03-03 23:25:43', '1993-10-30', 'male', 1, 1, NULL, '0', '1,2,3', NULL, NULL, 91, NULL, '1', 1, '2022-03-03 17:55:05', '2022-03-04 16:50:14', NULL, NULL, NULL, NULL),
(1384, '3', '', 'ybxbx', '103 CM', '14 KG', '$2y$10$OZ4vdVtKA9gFQo4YO.mTnetnoVNv4jGNkz.FA5B0zNd/rjja4EcdC', 'pankaddsjj@gmail.com', 7, 0, 'Oman', '96123465', '2022-03-03 23:44:04', '1952-03-12', 'male', 1, 1, NULL, '0', '1,4,14', NULL, NULL, 127, NULL, '1', 1, '2022-03-03 18:13:31', '2022-03-03 18:15:42', NULL, NULL, NULL, NULL),
(1386, '3', '', 'jddh', '104 CM', '13 KG', '$2y$10$lanBcQ5ruX5SxJ59EaXYuuGDIQhJ0Cdg1fCz/.l8WiLl2odMNfrbK', 'pankajj@gmail.cjnnj', 1, 0, 'India', '8006764333', '2022-03-04 00:03:35', '1952-03-28', 'male', 1, 1, NULL, '0', '14', NULL, NULL, 91, NULL, '1', 1, '2022-03-03 18:33:09', '2022-03-03 18:35:21', NULL, NULL, NULL, NULL),
(1387, '3', '', 'kfdd', '100 CM', '10 KG', '$2y$10$jw.QQ/9xRVREg323OE890OSXjPwYVZuMVo1mzuTPWUVEGK//jJcGa', 'pankajj@gmail.coms', 1, 0, 'India', '7830335039', '2022-03-04 00:09:30', '1952-03-29', 'male', 1, 1, NULL, '0', '14', NULL, NULL, 91, NULL, '1', 1, '2022-03-03 18:39:12', '2022-03-03 18:40:00', NULL, NULL, NULL, NULL),
(1388, '3', '', 'pankasj', '103 CM', '11 KG', '$2y$10$fA182nJybq/ceS6KpKpa/OLnBSq/acNR8fevxhjd/B1iCTHehKftm', 'pankajj@gmail.comh', 1, 0, 'India', '9627204189', '2022-03-04 00:24:43', '1952-03-15', 'male', 1, 1, NULL, '0', '7,13,14', NULL, NULL, 91, NULL, '1', 1, '2022-03-03 18:54:15', '2022-03-03 18:55:34', NULL, NULL, NULL, NULL),
(1391, '3', '/profile_image/a5b60ac0-2970-4a34-ac07-2ae584b2eb4fpexels-pixabay-60597.jpg', 'dfggg', '101 CM', '10 KG', '$2y$10$nkNM/ogjHsFvHPZ.YskoQ.ywf/j2mSx/Z0XqAZrGki7dUrzX/0xJS', 'a@a.com', 1, 0, 'India', '8427990565', '2022-03-05 20:20:23', '1952-03-12', 'male', 1, 1, NULL, '0', '1,6', NULL, NULL, 91, NULL, '1', 1, '2022-03-05 14:49:56', '2022-03-05 14:51:48', NULL, NULL, NULL, NULL),
(1392, '3', '/profile_image/51ca0783-c1a0-436a-9fd7-032409ef3943IMG_20220302_150719.jpg', 'Raj', '183 CM', '78 KG', '$2y$10$0M.4qar9yEky3teppyaEp./Lv9Qi9UiVx67qBVCtMDJRAU1xSGAUm', 'ravishkumar0812@gmail.com', 1, 0, 'India', '7004571343', '2022-03-06 00:13:00', '1998-03-10', 'male', 1, 1, NULL, '0', '1', NULL, NULL, 91, NULL, '1', 1, '2022-03-05 18:42:40', '2022-03-05 18:56:33', NULL, NULL, NULL, NULL),
(1393, '3', '/profile_image/83ceea97-da51-4448-9d0e-7a3a99d322daScreenshot_2022-02-17-16-36-39-76_3.jpg', 'raj kumar', '100 CM', '10 KG', '$2y$10$6x/1.vj3TNyTQbcXw8kTC.eMtbmcbgHAMMZkfzxyeUGQCDMOaoVjq', 'pankahdjdd@hhh.jj', 1, 0, 'India', '9876548533', '2022-03-06 17:34:09', '1952-03-14', 'male', 1, 1, NULL, '0', '4,6,14', NULL, NULL, 91, NULL, '1', 1, '2022-03-06 12:03:46', '2022-03-06 19:15:46', NULL, NULL, NULL, NULL),
(1394, '2', '/profile_image/15879a78-b9d9-4738-b400-e7a172a7c0f3Screenshot_20220305-205324_Instagram.png', 'ajab', '118 CM', '32 KG', '$2y$10$224yiGimAjCrybO/UzTPuOqGYtas4IrUPQ/PprgzSZW33/e.VMv4G', 'ajab@omanadventuresclub.com', 1, 0, 'Oman', '93578661', '2022-03-07 19:43:51', '1952-03-22', 'male', 1, 1, NULL, '0', '1', NULL, NULL, 127, NULL, '1', 1, '2022-03-07 14:13:28', '2022-03-07 14:22:37', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors_details`
--

CREATE TABLE `vendors_details` (
  `vendor_details_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(45) CHARACTER SET latin1 NOT NULL,
  `company_address` varchar(255) CHARACTER SET latin1 NOT NULL,
  `geo_location` varchar(255) CHARACTER SET latin1 NOT NULL,
  `license_status` enum('0','1') CHARACTER SET latin1 NOT NULL COMMENT '''0''=>''No'',''1''=>''Yes''',
  `cr_name` varchar(45) CHARACTER SET latin1 NOT NULL,
  `cr_number` int(11) NOT NULL,
  `cr_copy` varchar(255) CHARACTER SET latin1 NOT NULL,
  `payment_mode` varchar(255) CHARACTER SET latin1 NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendors_details`
--

INSERT INTO `vendors_details` (`vendor_details_id`, `user_id`, `company_name`, `company_address`, `geo_location`, `license_status`, `cr_name`, `cr_number`, `cr_copy`, `payment_mode`, `subscription_id`, `created_date`) VALUES
(1, 1269, 'testCompany', 'address', 'Latitude: 18.5512193, Longitude: 73.7801597', '1', 'CR name', 3, '20210730154232-attach.png', '1', 1, '2021-07-30 15:42:32'),
(2, 1273, 'ARK NEWTECH', 'D-9, Hosiery Complex, Block D, Noida Phase-2, Phase-2, Noida, Uttar Pradesh 201305', 'Noida Phase-2', '1', 'test', -3, '20210805103606-download.jpg', '1', 1, '2021-08-05 10:36:06'),
(3, 1294, 'partner100Company', 'address', 'Latitude: 18.5510244, Longitude: 73.7801277', '1', 'CR name', 444, '20210928120319-cr_card.png', '1', 2, '2021-09-28 12:03:19'),
(4, 1302, 'itx', '322 mattaur', 'dehradun', '1', 'ravi', 123123, '20211009012514-adharfront.jpg', '2', 1, '2021-10-09 01:25:14'),
(5, 1293, 'itx web solutions', '322 mattaur', 'dehradun', '1', 'ravi', 23, '20211021205636-DSC01202.JPG', '4', 1, '2021-10-21 20:56:36'),
(6, 1256, 'ARK NEW TECH', 'ggfdgdfg', 'dg5435', '1', '53453', 2147483647, '20220314154354-8.jpg', '1,2,3,4', 1, '2022-03-14 15:43:54'),
(7, 1263, 'ARK NEW TECH7', 'ggfdgdfg', 'dg5435', '1', '53453', 76857, '20220314154444-2.jpg', '1,2,3,4', 1, '2022-03-14 15:44:44'),
(8, 1394, 'ARK NEW TECH', 'ggfdgdfg', 'dg5435', '1', '678768', 678678, '20220314155842-8.jpg', '1,2,3,4', 1, '2022-03-14 15:58:42');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_package`
--

CREATE TABLE `vendor_package` (
  `id` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `booking_id` int(10) UNSIGNED DEFAULT NULL,
  `amount_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '1=Cash,2=Points,3=Bonus',
  `credit_amt` decimal(8,2) DEFAULT 0.00 COMMENT 'added amount',
  `debit_amt` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT 'deducted amount',
  `current_amt` decimal(8,2) NOT NULL DEFAULT 0.00,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `payment_id`, `booking_id`, `amount_type`, `credit_amt`, `debit_amt`, `current_amt`, `note`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1290, 234, 23, 20, '1.00', '5.00', '16.00', 'tested', 'http://adventuresclub.net/admin/public/images/about.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, 1294, 234, 23, 20, '2.00', '5.00', '17.00', 'tested', 'http://adventuresclub.net/admin/public/images/about.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `weekdays`
--

CREATE TABLE `weekdays` (
  `id` int(10) UNSIGNED NOT NULL,
  `day` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `weekdays`
--

INSERT INTO `weekdays` (`id`, `day`) VALUES
(1, 'Sun'),
(2, 'Mon'),
(3, 'Tue'),
(4, 'Wed'),
(5, 'Thu'),
(6, 'Fri'),
(7, 'Sat');

-- --------------------------------------------------------

--
-- Table structure for table `weights`
--

CREATE TABLE `weights` (
  `Id` int(11) NOT NULL,
  `weightName` varchar(200) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `weights`
--

INSERT INTO `weights` (`Id`, `weightName`, `created_at`, `updated_at`) VALUES
(9, 'Between 10kg (22lb) and 20kg (44lb)', '2021-10-19 14:18:58', '2021-10-19 14:18:58'),
(10, 'Between 20kg (44lb) and 30kg (66lb)', '2021-10-19 14:19:14', '2021-10-19 14:19:14'),
(11, 'Between 30kg (66lb) and 40kg (88lb)', '2021-10-19 14:19:28', '2021-10-19 14:19:28'),
(12, 'Between 40kg (88lb) and 50kg (110lb)', '2021-10-19 14:19:42', '2021-10-19 14:19:42'),
(13, 'Between 50kg (110lb) and 60kg (132lb)', '2021-10-19 14:19:53', '2021-10-19 14:19:53'),
(14, 'Between 60kg (132lb) and 70kg (154lb)', '2021-10-19 14:20:07', '2021-10-19 14:20:07'),
(15, 'Between 70kg (154lb) and 80kg (176lb)', '2021-10-19 14:20:19', '2021-10-19 14:20:19'),
(16, 'Between 80kg (176lb) and 90kg (198lb)', '2021-10-19 14:20:34', '2021-10-19 14:20:34'),
(17, 'Between 90kg (198lb) and 100kg (220lb)', '2021-10-19 14:20:46', '2021-10-19 14:20:46'),
(18, 'Between 100kg (220lb) and 110kg (242lb)', '2021-10-19 14:20:58', '2021-10-19 14:20:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aimed`
--
ALTER TABLE `aimed`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `become_partner`
--
ALTER TABLE `become_partner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactuspurposes`
--
ALTER TABLE `contactuspurposes`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us_purpose`
--
ALTER TABLE `contact_us_purpose`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dependency`
--
ALTER TABLE `dependency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `durations`
--
ALTER TABLE `durations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `get_all_paymentmode`
--
ALTER TABLE `get_all_paymentmode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_conditions`
--
ALTER TABLE `health_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `heights`
--
ALTER TABLE `heights`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_detail`
--
ALTER TABLE `package_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privacy_policy`
--
ALTER TABLE `privacy_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode`
--
ALTER TABLE `promocode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode_users`
--
ALTER TABLE `promocode_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_reports`
--
ALTER TABLE `question_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_assignments`
--
ALTER TABLE `role_assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_activities`
--
ALTER TABLE `service_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_dependencies`
--
ALTER TABLE `service_dependencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_for`
--
ALTER TABLE `service_for`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_images`
--
ALTER TABLE `service_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_levels`
--
ALTER TABLE `service_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_likes`
--
ALTER TABLE `service_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_offers`
--
ALTER TABLE `service_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_plan`
--
ALTER TABLE `service_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_plan_day_date`
--
ALTER TABLE `service_plan_day_date`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_programs`
--
ALTER TABLE `service_programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_reviews`
--
ALTER TABLE `service_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_sectors`
--
ALTER TABLE `service_sectors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_service_for`
--
ALTER TABLE `service_service_for`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_conditions`
--
ALTER TABLE `terms_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors_details`
--
ALTER TABLE `vendors_details`
  ADD PRIMARY KEY (`vendor_details_id`);

--
-- Indexes for table `vendor_package`
--
ALTER TABLE `vendor_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weekdays`
--
ALTER TABLE `weekdays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weights`
--
ALTER TABLE `weights`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `aimed`
--
ALTER TABLE `aimed`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `become_partner`
--
ALTER TABLE `become_partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `contactuspurposes`
--
ALTER TABLE `contactuspurposes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_us_purpose`
--
ALTER TABLE `contact_us_purpose`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `dependency`
--
ALTER TABLE `dependency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `durations`
--
ALTER TABLE `durations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `get_all_paymentmode`
--
ALTER TABLE `get_all_paymentmode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `health_conditions`
--
ALTER TABLE `health_conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `heights`
--
ALTER TABLE `heights`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `package_detail`
--
ALTER TABLE `package_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `privacy_policy`
--
ALTER TABLE `privacy_policy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `promocode`
--
ALTER TABLE `promocode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `promocode_users`
--
ALTER TABLE `promocode_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `question_reports`
--
ALTER TABLE `question_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `role_assignments`
--
ALTER TABLE `role_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_activities`
--
ALTER TABLE `service_activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `service_dependencies`
--
ALTER TABLE `service_dependencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `service_for`
--
ALTER TABLE `service_for`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_images`
--
ALTER TABLE `service_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `service_levels`
--
ALTER TABLE `service_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `service_likes`
--
ALTER TABLE `service_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `service_offers`
--
ALTER TABLE `service_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `service_plan`
--
ALTER TABLE `service_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_plan_day_date`
--
ALTER TABLE `service_plan_day_date`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `service_programs`
--
ALTER TABLE `service_programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `service_reviews`
--
ALTER TABLE `service_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `service_sectors`
--
ALTER TABLE `service_sectors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `service_service_for`
--
ALTER TABLE `service_service_for`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `terms_conditions`
--
ALTER TABLE `terms_conditions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1395;

--
-- AUTO_INCREMENT for table `vendors_details`
--
ALTER TABLE `vendors_details`
  MODIFY `vendor_details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vendor_package`
--
ALTER TABLE `vendor_package`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `weekdays`
--
ALTER TABLE `weekdays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `weights`
--
ALTER TABLE `weights`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

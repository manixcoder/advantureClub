-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 21, 2022 at 01:20 AM
-- Server version: 8.0.29
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `advent12_adventureclubs`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` int UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `image`, `content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'profile_image/1653286527.png', 'We are adventure tourism company based in Oman', '2022-05-23 11:45:27', '2022-05-23 11:45:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int UNSIGNED NOT NULL,
  `activity` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `activity`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Transportation from gathering area', 1, '2021-07-01 23:45:13', '2021-07-01 23:45:13', NULL),
(2, 'Drinks', 1, '2021-07-01 23:45:13', '2021-07-01 23:45:13', NULL),
(3, 'Snacks', 1, '2021-07-01 23:45:13', '2021-07-01 23:45:13', NULL),
(4, 'Sand bashing', 1, '2021-07-01 23:45:13', '2021-07-01 23:45:13', NULL),
(5, 'Climbing', 1, '2021-07-01 23:45:13', '2021-07-01 23:45:13', NULL),
(6, 'Swimming', 1, '2021-07-01 23:45:13', '2021-07-01 23:45:13', NULL),
(7, 'Learning', 1, '2021-10-19 13:31:33', '2021-10-19 13:31:33', NULL),
(8, 'Cooking', 1, '2021-10-19 13:32:01', '2021-10-19 13:32:01', NULL),
(9, 'Camping', 1, '2021-10-19 13:32:15', '2021-10-19 13:32:15', NULL),
(10, 'Abseiling', 1, '2021-10-19 13:33:08', '2021-10-19 13:33:08', NULL),
(11, 'Hiking', 1, '2021-10-19 13:33:32', '2021-10-19 13:33:32', NULL),
(12, 'Timekeeping', 1, '2021-10-19 13:34:32', '2021-10-19 13:34:32', NULL),
(13, 'Gears', 1, '2021-10-19 13:34:45', '2021-10-19 13:34:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `aimed`
--

CREATE TABLE `aimed` (
  `id` int NOT NULL,
  `AimedName` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `aimed`
--

INSERT INTO `aimed` (`id`, `AimedName`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 'Youngsters', '2022-06-05 17:22:02', '2022-06-05 17:22:02', NULL),
(12, 'Adults', '2022-06-05 17:22:27', '2022-06-05 17:22:27', NULL),
(13, 'Ladies', '2022-06-05 17:22:45', '2022-06-05 17:22:45', NULL),
(14, 'Gents', '2022-06-05 17:23:11', '2022-06-05 17:23:11', NULL),
(15, 'Mixed Gender', '2022-06-05 17:23:58', '2022-06-05 17:23:58', NULL),
(16, 'Everyone', '2022-06-05 17:24:42', '2022-06-05 17:24:42', NULL),
(17, 'test', '2022-06-11 22:53:04', '2022-06-11 22:53:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `sender_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `reach_for` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `user_id`, `sender_id`, `title`, `content`, `reach_for`, `deleted_at`) VALUES
(1, 12, 1, 'tester', 'tester', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int UNSIGNED NOT NULL,
  `banner` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint UNSIGNED DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `become_partner`
--

CREATE TABLE `become_partner` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `address` text,
  `location` text,
  `description` longtext,
  `license` varchar(255) DEFAULT NULL,
  `cr_name` varchar(255) DEFAULT NULL,
  `cr_number` varchar(255) DEFAULT NULL,
  `cr_copy` varchar(255) DEFAULT NULL,
  `debit_card` varchar(255) DEFAULT NULL,
  `visa_card` varchar(255) DEFAULT NULL,
  `payon_arrival` enum('1','0') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0' COMMENT '''1'' Active , ''0'' Inactive',
  `paypal` varchar(255) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `account_holdername` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `is_online` enum('1','0') NOT NULL DEFAULT '1' COMMENT '''1'' Active , ''0'' Inactive',
  `is_approved` enum('1','0') NOT NULL DEFAULT '0' COMMENT '''1'' Approve, ''0'' Unapprove',
  `packages_id` int NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `is_wiretransfer` enum('1','0') NOT NULL DEFAULT '0',
  `is_free_used` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `become_partner`
--

INSERT INTO `become_partner` (`id`, `user_id`, `company_name`, `address`, `location`, `description`, `license`, `cr_name`, `cr_number`, `cr_copy`, `debit_card`, `visa_card`, `payon_arrival`, `paypal`, `bankname`, `account_holdername`, `account_number`, `is_online`, `is_approved`, `packages_id`, `start_date`, `end_date`, `is_wiretransfer`, `is_free_used`, `created_at`, `updated_at`) VALUES
(5, 27, 'universal-skills', 'Muscat, Alkhudh6', 'Unnamed Road ,  , Oman', 'We offer verity of adventure tours,', 'Yes', 'AdventuresClub', '62y3gsggsvshw627', 'file62ad6f7dd0d1e-01a7bb4b-6b2f-47c8-a0a9-128f59d0a787images.jpeg-3.jpg', NULL, NULL, '1', '9875423', 'bankmuscat', 'universal-skills', '04123654871236458', '1', '1', 2, '2022-06-07 21:48:03', '2022-09-04 10:48:03', '1', '1', '2022-05-25 12:09:22', '2022-05-25 01:09:22'),
(6, 22, 'badaralsahi', 'tester', 'Unnamed Road ,  , Oman', 'tester', 'No', NULL, NULL, '', NULL, NULL, NULL, NULL, 'bank.uscat', 'badaralsahi', '04875565312464887', '1', '1', 1, '2022-06-07 00:42:11', '2022-06-12 13:42:11', '1', '1', '2022-05-27 23:12:11', '2022-05-27 12:12:11'),
(7, 35, 'ark', 'noida', '1511 , Gurugram , India', 'test', 'No', NULL, NULL, '', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 1, '2022-06-19 17:49:21', '2022-06-25 12:19:21', '0', '1', '2022-06-19 17:47:57', '2022-06-19 12:17:57');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `service_id` int NOT NULL,
  `provider_id` int NOT NULL,
  `adult` tinyint NOT NULL,
  `kids` tinyint NOT NULL,
  `message` longtext NOT NULL,
  `unit_amount` decimal(8,2) UNSIGNED NOT NULL,
  `total_amount` decimal(8,2) UNSIGNED NOT NULL,
  `discounted_amount` decimal(8,2) UNSIGNED NOT NULL,
  `future_plan` tinyint NOT NULL,
  `booking_date` date NOT NULL,
  `currency` int NOT NULL,
  `coupon_applied` tinyint NOT NULL,
  `status` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Pending/Requested,1=Accepted,2=Payment Done,3=Cancelled,4= Completed, 5 dropped ,6 =Conform',
  `updated_by` int NOT NULL,
  `cancelled_reason` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `service_id`, `provider_id`, `adult`, `kids`, `message`, `unit_amount`, `total_amount`, `discounted_amount`, `future_plan`, `booking_date`, `currency`, `coupon_applied`, `status`, `updated_by`, `cancelled_reason`, `payment_status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(5, 27, 1, 0, 1, 0, 'ubu', '222.00', '222.00', '0.00', 1, '2022-06-25', 1, 0, '2', 27, NULL, NULL, NULL, '2022-06-19 09:21:01', NULL),
(6, 27, 1, 0, 1, 1, 'vg', '222.00', '444.00', '0.00', 1, '2022-06-20', 1, 0, '3', 27, NULL, NULL, NULL, '2022-06-19 09:22:47', NULL),
(7, 27, 1, 0, 1, 0, 'bgv', '222.00', '222.00', '0.00', 1, '2022-06-24', 1, 0, '3', 27, NULL, NULL, NULL, '2022-06-19 09:26:22', NULL),
(8, 27, 4, 0, 2, 0, 'tow ppl plz  ...', '3000.00', '5980.00', '20.00', 1, '2022-06-20', 1, 0, '3', 27, NULL, NULL, NULL, '2022-06-19 11:49:49', NULL),
(9, 27, 4, 0, 2, 0, 'tow ppl plz  ...', '3000.00', '5980.00', '20.00', 1, '2022-06-20', 1, 0, '2', 27, NULL, NULL, NULL, '2022-06-19 11:50:02', NULL),
(11, 35, 5, 0, 2, 0, 'vgv', '500.00', '1000.00', '0.00', 1, '2022-06-25', 1, 0, '3', 35, NULL, NULL, NULL, '2022-06-19 13:02:43', NULL),
(12, 35, 5, 0, 1, 0, 'vg', '500.00', '500.00', '0.00', 1, '2022-06-22', 1, 0, '2', 35, NULL, NULL, NULL, '2022-06-19 13:21:19', NULL),
(13, 35, 5, 0, 1, 0, 'fvg', '500.00', '480.00', '20.00', 1, '2022-06-25', 1, 0, '2', 35, NULL, NULL, NULL, '2022-06-19 13:40:27', NULL),
(15, 35, 5, 0, 1, 1, 'ctc', '500.00', '1000.00', '0.00', 1, '2022-06-25', 1, 0, '2', 35, NULL, NULL, NULL, '2022-06-19 14:03:32', NULL),
(16, 22, 4, 0, 2, 0, 'requested by badar, provided by AdventuresClub', '3000.00', '5980.00', '20.00', 1, '2022-06-20', 1, 0, '0', 0, NULL, NULL, NULL, '2022-06-19 17:08:14', NULL),
(17, 35, 1, 0, 1, 1, 'b', '222.00', '444.00', '0.00', 1, '2022-06-24', 1, 0, '0', 0, NULL, NULL, NULL, '2022-06-19 19:35:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int UNSIGNED NOT NULL,
  `country_id` int NOT NULL,
  `region_id` int UNSIGNED NOT NULL,
  `city` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `region_id`, `city`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Delhi', '2022-04-26 14:18:59', '2022-04-26 14:18:59', NULL),
(2, 1, 23, 'Alhamra', '2022-04-26 20:58:59', '2022-04-26 20:58:59', NULL),
(3, 2, 23, 'Nizwa', '2022-04-26 20:59:13', '2022-04-26 20:59:13', NULL),
(4, 2, 23, 'Jabal Akhdar', '2022-04-26 20:59:32', '2022-04-26 20:59:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contactuspurposes`
--

CREATE TABLE `contactuspurposes` (
  `Id` int NOT NULL,
  `contactuspurposeName` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `contactuspurposes`
--

INSERT INTO `contactuspurposes` (`Id`, `contactuspurposeName`, `created_at`, `updated_at`) VALUES
(6, 'Add Activity type', '2022-05-16 22:59:55', '2022-05-16 22:59:55'),
(7, 'Add a country', '2022-05-16 23:00:09', '2022-05-16 23:00:09'),
(8, 'Partnership program', '2022-05-16 23:00:47', '2022-05-16 23:00:47'),
(9, 'Corporate deals', '2022-05-16 23:01:01', '2022-05-16 23:01:01'),
(10, 'Report a bug', '2022-05-16 23:01:29', '2022-05-16 23:01:29'),
(11, 'Claimes', '2022-05-16 23:01:55', '2022-05-16 23:01:55');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile_code` varchar(4) NOT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `mobile_code`, `mobile_number`, `email`, `subject`, `purpose`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 'AdventuresClub', '+968', '96000891', 'badaralsahiii@gmail.com', 'bubub', 'Add a country', 'vhhbun g h', '2022-06-19 17:15:05', '2022-06-19 17:15:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us_purpose`
--

CREATE TABLE `contact_us_purpose` (
  `id` int UNSIGNED NOT NULL,
  `purpose` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `id` int NOT NULL,
  `country` varchar(250) NOT NULL,
  `short_name` varchar(100) NOT NULL,
  `code` varchar(200) NOT NULL,
  `currency` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `flag` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country`, `short_name`, `code`, `currency`, `description`, `flag`, `status`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'India', 'Indian', '+91', 'INR', 'INDIA', 'uploads/flag/20220504190958-WhatsApp Image 2022-05-04 at 5.39.19 PM.jpeg', '1', 1, '2020-07-18 07:44:16', '2020-07-18 07:44:16', NULL),
(2, 'Oman', 'Omani', '+968', 'OMR', 'Oman', 'uploads/flag/20220504185416-WhatsApp Image 2022-05-04 at 5.22.35 PM.jpeg', '1', 1, '2021-07-19 05:09:31', '2021-07-19 05:09:31', NULL),
(18, 'Pakistan', 'Pakistani', '+92', 'PKR', NULL, 'uploads/flag/20220504190642-WhatsApp Image 2022-05-04 at 5.32.19 PM.jpeg', '1', 1, '2022-04-26 02:40:33', '2022-04-26 02:40:33', NULL),
(19, 'Iran', 'Iranian', '+98', 'IRR', NULL, 'uploads/flag/20220504190431-WhatsApp Image 2022-05-04 at 5.31.50 PM.jpeg', '1', 1, '2022-04-26 09:56:13', '2022-04-26 09:56:13', NULL),
(20, 'UAE', 'EMRT', '+971', 'AED', NULL, 'uploads/flag/20220525160527-UAE.png', '1', 1, '2022-05-25 05:05:27', '2022-05-25 05:05:27', NULL),
(21, 'JAPAN', 'JAPANISES', '+81', 'JAP', NULL, 'uploads/flag/20220527221816-japan.png', '1', 1, '2022-05-27 11:18:16', '2022-05-27 11:18:16', NULL),
(22, 'KSA', 'SAUDI', '+966', 'SAR', NULL, 'uploads/flag/20220618010047-saudi.png', '1', 1, '2022-06-17 14:00:47', '2022-06-17 14:00:47', NULL),
(23, 'PHILIPPINES', 'FILIPINO', '+63', 'PHP', NULL, 'uploads/flag/20220619215704-istockphoto-845329226-612x612.jpg', '1', 1, '2022-06-19 16:27:04', '2022-06-19 16:27:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dependency`
--

CREATE TABLE `dependency` (
  `id` int NOT NULL,
  `dependency_name` varchar(200) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `dependency`
--

INSERT INTO `dependency` (`id`, `dependency_name`, `created_at`, `deleted_at`) VALUES
(5, 'Weather Condistions', '2022-04-12 12:39:17', NULL),
(6, 'Health Conditions', '2022-04-12 12:39:57', NULL),
(7, 'Adventure Licence', '2022-04-12 12:41:14', NULL),
(8, 'Lockdowns', '2022-04-12 12:41:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `durations`
--

CREATE TABLE `durations` (
  `id` int UNSIGNED NOT NULL,
  `duration` varchar(50) NOT NULL,
  `minutes` int UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
(21, '6 Hours', 0, 1, '2021-10-19 13:25:26', '2021-10-19 13:25:26', NULL),
(23, '7 Hours', 0, 1, '2022-04-12 23:23:46', '2022-04-12 23:23:46', NULL),
(24, '8 Hours', 0, 1, '2022-04-12 23:24:03', '2022-04-12 23:24:03', NULL),
(25, '9 Hours', 0, 1, '2022-04-12 23:24:18', '2022-04-12 23:24:18', NULL),
(26, '10 Hours', 0, 1, '2022-04-12 23:24:30', '2022-04-12 23:24:30', NULL),
(27, '11 Hours', 0, 1, '2022-04-12 23:24:43', '2022-04-12 23:24:43', NULL),
(28, '12 Hours', 0, 1, '2022-04-12 23:25:19', '2022-04-12 23:25:19', NULL),
(29, '13 Hours', 0, 1, '2022-04-12 23:25:32', '2022-04-12 23:25:32', NULL),
(30, '14 Hours', 0, 1, '2022-04-12 23:25:46', '2022-04-12 23:25:46', NULL),
(31, '15 Hours', 0, 1, '2022-04-12 23:26:11', '2022-04-12 23:26:11', NULL),
(32, '16 Hours', 0, 1, '2022-04-12 23:26:22', '2022-04-12 23:26:22', NULL),
(33, '17 Hours', 0, 1, '2022-04-12 23:26:34', '2022-04-12 23:26:34', NULL),
(34, '18 Hours', 0, 1, '2022-04-12 23:26:45', '2022-04-12 23:26:45', NULL),
(35, '19 Hours', 0, 1, '2022-04-12 23:26:56', '2022-04-12 23:26:56', NULL),
(36, '20 Hours', 0, 1, '2022-04-12 23:27:10', '2022-04-12 23:27:10', NULL),
(37, '21 Hours', 0, 1, '2022-04-12 23:27:21', '2022-04-12 23:27:21', NULL),
(38, '22 Hours', 0, 1, '2022-04-12 23:27:39', '2022-04-12 23:27:39', NULL),
(39, '23 Hours', 0, 1, '2022-04-12 23:28:01', '2022-04-12 23:28:01', NULL),
(41, '1 Day', 0, 1, '2022-04-12 23:28:30', '2022-04-12 23:28:30', NULL),
(42, '2 Days', 0, 1, '2022-04-12 23:28:41', '2022-04-12 23:28:41', NULL),
(43, '3 days', 0, 1, '2022-04-12 23:28:55', '2022-04-12 23:28:55', NULL),
(44, '4 Days', 0, 1, '2022-04-12 23:29:15', '2022-04-12 23:29:15', NULL),
(45, '5 Days', 0, 1, '2022-04-12 23:29:37', '2022-04-12 23:29:37', NULL),
(46, '6 Days', 0, 1, '2022-04-12 23:29:50', '2022-04-12 23:29:50', NULL),
(48, '7 Days', 0, 1, '2022-04-12 23:31:35', '2022-04-12 23:31:35', NULL),
(49, '8 Days', 0, 1, '2022-04-12 23:31:46', '2022-04-12 23:31:46', NULL),
(50, '9 days', 0, 1, '2022-04-12 23:31:56', '2022-04-12 23:31:56', NULL),
(51, '10 Days', 0, 1, '2022-04-12 23:32:05', '2022-04-12 23:32:05', NULL),
(52, '11 days', 0, 1, '2022-04-12 23:32:16', '2022-04-12 23:32:16', NULL),
(53, '12 days', 0, 1, '2022-04-12 23:32:27', '2022-04-12 23:32:27', NULL),
(54, '13 Days', 0, 1, '2022-04-12 23:32:37', '2022-04-12 23:32:37', NULL),
(55, '14 days', 0, 1, '2022-04-12 23:32:53', '2022-04-12 23:32:53', NULL),
(56, '15 Days', 0, 1, '2022-04-12 23:33:39', '2022-04-12 23:33:39', NULL),
(57, '16 days', 0, 1, '2022-04-12 23:33:51', '2022-04-12 23:33:51', NULL),
(58, '17 days', 0, 1, '2022-04-12 23:34:02', '2022-04-12 23:34:02', NULL),
(59, '18 Days', 0, 1, '2022-04-12 23:34:18', '2022-04-12 23:34:18', NULL),
(60, '19 Days', 0, 1, '2022-04-12 23:34:32', '2022-04-12 23:34:32', NULL),
(61, '20 days', 0, 1, '2022-04-12 23:34:46', '2022-04-12 23:34:46', NULL),
(62, '21 Days', 0, 1, '2022-04-12 23:34:56', '2022-04-12 23:34:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES
(1, 22, 1, '2022-06-19 22:25:41', '2022-06-19 22:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `get_all_paymentmode`
--

CREATE TABLE `get_all_paymentmode` (
  `id` int NOT NULL,
  `payment_name` varchar(200) NOT NULL,
  `payment_image` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `get_all_paymentmode`
--

INSERT INTO `get_all_paymentmode` (`id`, `payment_name`, `payment_image`, `created_at`) VALUES
(1, 'Visa card', 'oman_debitCards.png', '2022-03-31 15:39:02'),
(2, 'Pay on arrival', 'oman_debitCards.png', '2022-03-31 15:39:02'),
(4, 'PayPal', 'oman_debitCards.png', '2022-03-31 15:39:02'),
(5, 'Wire Transfer', 'oman_debitCards.png', '2022-04-24 21:57:03');

-- --------------------------------------------------------

--
-- Table structure for table `health_conditions`
--

CREATE TABLE `health_conditions` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
(14, 'High diabetes', '2021-09-22 21:50:42', '2021-09-22 21:50:42'),
(16, 'Low diabetes', '2022-04-12 23:46:55', '2022-04-12 23:46:55'),
(17, 'Asthma', '2022-04-12 23:47:21', '2022-04-12 23:47:21'),
(18, 'Dizziness', '2022-04-12 23:48:12', '2022-04-12 23:48:12');

-- --------------------------------------------------------

--
-- Table structure for table `heights`
--

CREATE TABLE `heights` (
  `Id` int NOT NULL,
  `heightName` varchar(200) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `heights`
--

INSERT INTO `heights` (`Id`, `heightName`, `deleted_at`, `created_at`, `updated_at`) VALUES
(29, '100 - 105 CM', NULL, '2022-05-04 17:23:24', '2022-05-04 17:23:24'),
(31, '105 - 110 CM', NULL, '2022-05-04 17:24:21', '2022-05-04 17:24:21'),
(32, '110 - 115 CM', NULL, '2022-05-04 17:24:42', '2022-05-04 17:24:42'),
(33, '115 - 120 CM', NULL, '2022-05-04 17:24:59', '2022-05-04 17:24:59'),
(34, '120 - 125 CM', NULL, '2022-05-04 17:25:19', '2022-05-04 17:25:19'),
(35, '125 - 130 CM', NULL, '2022-05-04 17:25:35', '2022-05-04 17:25:35'),
(36, '130 - 135 CM', NULL, '2022-05-04 17:25:51', '2022-05-04 17:25:51'),
(37, '135 - 140 CM', NULL, '2022-05-04 17:26:11', '2022-05-04 17:26:11'),
(38, '140 - 145 CM', NULL, '2022-05-04 17:26:28', '2022-05-04 17:26:28'),
(39, '145 - 150 CM', NULL, '2022-05-04 17:26:43', '2022-05-04 17:26:43'),
(40, '150 - 155 CM', NULL, '2022-05-04 17:27:17', '2022-05-04 17:27:17'),
(41, '155 - 160 CM', NULL, '2022-05-04 17:27:36', '2022-05-04 17:27:36'),
(42, '160 - 165 CM', NULL, '2022-05-04 17:27:51', '2022-05-04 17:27:51'),
(43, '165 - 170 CM', NULL, '2022-05-04 17:28:12', '2022-05-04 17:28:12'),
(44, '170 - 175 CM', NULL, '2022-05-04 17:29:12', '2022-05-04 17:29:12'),
(45, '175 - 180 CM', NULL, '2022-05-04 17:29:30', '2022-05-04 17:29:30'),
(46, '180 - 185 CM', NULL, '2022-05-04 17:30:06', '2022-05-04 17:30:06'),
(47, '185 - 190 CM', NULL, '2022-05-04 17:30:24', '2022-05-04 17:30:24'),
(48, '190 - 195 CM', NULL, '2022-05-04 17:30:51', '2022-05-04 17:30:51'),
(50, '195 - 200 CM', NULL, '2022-05-04 18:11:11', '2022-05-04 18:11:11'),
(51, 'Badar test', NULL, '2022-05-14 12:40:29', '2022-05-14 12:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`, `description`, `status`, `updated_at`, `created_at`) VALUES
(1, 'hn', 'Hindi', 'Hindi', '1', '2020-07-18 07:44:16', '2020-07-18 07:44:16'),
(2, 'en', 'English', 'English', '1', '2020-07-18 07:44:16', '2020-07-18 07:44:16'),
(3, 'fr', 'French', 'French', '1', '2020-07-18 07:44:16', '2020-07-18 07:44:16'),
(4, 'zh-hans', 'Chinese', 'Chinese', '1', '2020-07-18 07:44:16', '2020-07-18 07:44:16'),
(5, 'ar', 'Arabic', 'Arabic', '1', '2020-07-18 07:44:16', '2020-07-18 07:44:16');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int UNSIGNED NOT NULL,
  `sender_id` int UNSIGNED DEFAULT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` varchar(500) NOT NULL,
  `is_approved` enum('1','0') NOT NULL DEFAULT '0',
  `is_read` enum('0','1') NOT NULL DEFAULT '0',
  `notification_type` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0 Account 1 Service , 2  Request',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `raed_at` date DEFAULT NULL,
  `send_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `sender_id`, `user_id`, `title`, `message`, `is_approved`, `is_read`, `notification_type`, `created_at`, `raed_at`, `send_at`) VALUES
(1, 27, 27, 'Adventure', 'Adventure create successfully.', '0', '1', '0', '2022-06-19 14:43:39', '2022-06-21', NULL),
(2, 27, 27, 'Adventure', 'your Request has been submitted successfully.', '0', '1', '0', '2022-06-19 14:56:28', '2022-06-21', NULL),
(3, 27, 27, 'Booking has been confirmed', 'Your booking water has been confirmed.', '0', '1', '0', '2022-06-19 15:14:42', '2022-06-21', NULL),
(4, 27, 27, 'Adventure', 'Adventure create successfully.', '0', '1', '0', '2022-06-19 15:30:34', '2022-06-21', NULL),
(5, 27, 27, 'Adventure', 'Adventure create successfully.', '0', '1', '0', '2022-06-19 15:37:41', '2022-06-21', NULL),
(6, 27, 27, 'Adventure', 'Adventure create successfully.', '0', '1', '0', '2022-06-19 15:42:05', '2022-06-21', NULL),
(7, 35, 35, 'Register', 'You have register successfully with adventure club', '0', '0', '0', '2022-06-19 17:46:41', NULL, NULL),
(8, 35, 35, 'Your Request submitted', 'After approval you\'ll be notified and have to buy your subscription package.', '0', '0', '0', '2022-06-19 17:47:58', NULL, NULL),
(9, 1, 35, 'Your request has been approved', 'Now you may proceed to buy subscription package & will be able to provide your service.', '1', '0', '0', '2022-06-19 17:49:15', NULL, NULL),
(10, 27, 27, 'Booking has been cancelled', 'Your booking water has been cancelled.', '0', '1', '0', '2022-06-19 17:50:46', '2022-06-21', NULL),
(11, 27, 27, 'Booking has been confirmed', 'Your booking Tandem paragliding has been confirmed.', '0', '1', '0', '2022-06-19 17:53:25', '2022-06-21', NULL),
(12, 35, 35, 'Adventure', 'Adventure create successfully.', '0', '0', '0', '2022-06-19 17:55:20', NULL, NULL),
(13, 35, 35, 'Adventure', 'your Request has been submitted successfully.', '0', '0', '0', '2022-06-19 18:20:29', NULL, NULL),
(14, 35, 35, 'Booking has been confirmed', 'Your booking rafting has been confirmed.', '0', '0', '0', '2022-06-19 18:21:20', NULL, NULL),
(15, 35, 35, 'Adventure', 'your Request has been submitted successfully.', '0', '0', '0', '2022-06-19 18:32:54', NULL, NULL),
(16, 35, 35, 'Booking has been confirmed', 'Your booking rafting has been confirmed.', '0', '0', '0', '2022-06-19 18:33:23', NULL, NULL),
(17, 35, 35, 'Adventure', 'your Request has been submitted successfully.', '0', '0', '0', '2022-06-19 18:51:21', NULL, NULL),
(18, 35, 35, 'Adventure', 'your Request has been submitted successfully.', '0', '0', '0', '2022-06-19 19:10:29', NULL, NULL),
(19, 35, 35, 'Booking has been confirmed', 'Your booking rafting has been confirmed.', '0', '0', '0', '2022-06-19 19:15:26', NULL, NULL),
(20, 22, 22, 'Login', 'You have login successfully with adventure club', '0', '0', '0', '2022-06-19 19:26:34', NULL, NULL),
(21, 22, 22, 'Adventure', 'your Request has been submitted successfully.', '0', '0', '0', '2022-06-19 19:27:51', '2022-06-21', NULL),
(22, 27, 27, 'Login', 'You have login successfully with adventure club', '0', '1', '0', '2022-06-19 19:30:13', '2022-06-21', NULL),
(23, 22, 22, 'Login', 'You have login successfully with adventure club', '0', '0', '0', '2022-06-19 19:32:31', NULL, NULL),
(24, 35, 35, 'Adventure', 'your Request has been submitted successfully.', '0', '0', '0', '2022-06-19 19:33:33', NULL, NULL),
(25, 37, 37, 'Register', 'You have register successfully with adventure club', '0', '0', '0', '2022-06-19 22:04:51', NULL, NULL),
(26, 22, 22, 'Adventure', 'your Request has been submitted successfully.', '0', '0', '2', '2022-06-19 22:38:16', NULL, NULL),
(27, 27, 27, 'Login', 'You have login successfully with adventure club', '0', '1', '0', '2022-06-19 22:38:58', '2022-06-21', NULL),
(28, 22, 22, 'Login', 'You have login successfully with adventure club', '0', '0', '0', '2022-06-19 22:55:33', NULL, NULL),
(29, 27, 27, 'Login', 'You have login successfully with adventure club', '0', '1', '0', '2022-06-19 22:56:37', '2022-06-21', NULL),
(30, 27, 27, 'Booking has been cancelled', 'Your booking water has been cancelled.', '0', '1', '0', '2022-06-19 23:47:19', '2022-06-21', NULL),
(31, 27, 27, 'Booking has been confirmed', 'Your booking water has been confirmed.', '0', '1', '0', '2022-06-19 23:47:32', '2022-06-21', NULL),
(32, 27, 27, 'Booking has been cancelled', 'Your booking water has been cancelled.', '0', '1', '0', '2022-06-20 00:06:57', '2022-06-21', NULL),
(33, 35, 35, 'Adventure', 'your Request has been submitted successfully.', '0', '0', '0', '2022-06-20 01:05:13', NULL, NULL),
(34, 27, 27, 'Login', 'You have login successfully with adventure club', '0', '1', '0', '2022-06-20 02:24:48', '2022-06-21', NULL),
(35, 27, 27, 'Login', 'You have login successfully with adventure club', '0', '1', '0', '2022-06-20 09:27:55', '2022-06-21', NULL),
(36, 22, 22, 'Login', 'You have login successfully with adventure club', '0', '0', '0', '2022-06-20 09:46:32', '2022-06-20', NULL),
(37, 27, 27, 'Login', 'You have login successfully with adventure club', '0', '1', '0', '2022-06-21 00:02:31', '2022-06-21', NULL),
(38, 27, 27, 'Booking has been cancelled', 'Your booking water has been cancelled.', '0', '1', '0', '2022-06-21 00:05:07', '2022-06-21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `otp_on` tinyint UNSIGNED DEFAULT '1' COMMENT '1=Mobile,2=Email',
  `type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=SignUp,2=Forgot Password,3=Login,4=ChnageMobileNumber',
  `email` varchar(255) DEFAULT NULL,
  `mobile_code` varchar(255) NOT NULL,
  `mobile` bigint DEFAULT NULL,
  `otp` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=Verified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `user_id`, `otp_on`, `type`, `email`, `mobile_code`, `mobile`, `otp`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(2, 36, 1, 1, NULL, '+968', 92216252, 1172, '2022-06-19 21:54:36', '2022-06-19 21:57:10', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `symbol` varchar(5) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `offer_cost` decimal(10,2) DEFAULT NULL,
  `days` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `title`, `symbol`, `duration`, `cost`, `offer_cost`, `days`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Startup', '$', '1 Week', '0.00', '0.00', 7, 1, '2021-07-30 16:05:39', '2021-10-09 01:02:12', NULL),
(2, 'Advanced', '$', '3 Months', '100.00', '50.00', 90, 1, '2021-07-30 16:07:16', '2022-04-02 16:39:53', NULL),
(3, 'Platinum', '$', '6 Months', '150.00', '100.00', 180, 1, '2021-07-30 16:07:37', '2022-04-02 16:39:50', NULL),
(4, 'Diamond', '$', '12 Months', '200.00', '150.00', 360, 1, '2021-07-30 16:08:01', '2022-04-02 16:39:46', NULL),
(25, 'Golden ( 3 Months )', '$', '90', '150.00', '100.00', NULL, 1, '2022-05-06 16:58:43', '2022-05-16 22:57:09', '2022-05-16 22:57:09');

-- --------------------------------------------------------

--
-- Table structure for table `package_detail`
--

CREATE TABLE `package_detail` (
  `id` int UNSIGNED NOT NULL,
  `package_id` int UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `detail_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Exclude,1=Include'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `package_detail`
--

INSERT INTO `package_detail` (`id`, `package_id`, `title`, `detail_type`) VALUES
(1, 1, 'This is first includes', 1),
(2, 1, 'This is first excludes', 0),
(3, 2, 'This is first includes', 1),
(4, 2, 'This is first excludes', 0),
(5, 3, 'This is first includes', 1),
(6, 3, 'This is first excludes', 0),
(7, 4, 'This is first includes', 1),
(8, 4, 'This is first excludes', 0),
(88, 25, 'AAA', 1),
(89, 25, 'BBB', 1),
(90, 25, 'CCC', 1),
(91, 25, 'DDD', 1),
(92, 25, '123', 0),
(93, 25, '456', 0),
(94, 25, '789', 0),
(95, 25, '210', 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `token` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(0, 'admin@gmail.com', 'O6ELi7vBra9wZa2aQQDAGPYek2GZRf7kWGbUoFa5RVkHHSKAD0NtTtnVPUZRw6jY', '2022-04-21 20:07:36'),
(0, 'admin@gmail.com', 'gfXHOP8KBrd771nZ9utgjVuEYOlJUoNjZDdwbbJXTqb2ZedW7BTJWhHXmDICdeY9', '2022-04-21 20:09:31'),
(0, 'admin@gmail.com', '01cLJPXeug7Qu0LSdK7RTNdAJBdHW2tp88b0lP0UNlj59nD9pTxy4mUCqOAoDRKp', '2022-04-21 20:12:43'),
(0, 'admin@gmail.com', 'UgJ6TyuJF70NPHYySTEy2HUi0wJlxdKvMikxf3m2gJASY8DmSmNs3zCL8Qg0y4QQ', '2022-04-21 20:15:35'),
(0, 'admin@gmail.com', '7lYgUgiNLOKprkJT9kh4ItHGXo76yUQnAtBat5F3aWOSHfXz0B7ykbzcfe0HQpaR', '2022-04-21 20:22:22'),
(0, 'admin@gmail.com', 'x0bZfLXUAYIutVMohCG2A31eIrligMSHR37O236iN5do2ins5cgOEToT6orz4kH1', '2022-04-21 21:35:28'),
(0, 'admin@gmail.com', 'qssUar3v1ChvxbA285kIL5Yd3KqWEnHM32WNRlQOWfa96kzzH54QIuveCXMSRP7y', '2022-04-22 21:28:56'),
(0, 'admin@gmail.com', 'gPxk1Vgc7AlH8Rcyok5pJqfzMzQt0iM61towXBwGmgNoJix6JKOkLmEW9CpfUwuS', '2022-04-30 15:53:42');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `booking_id` int UNSIGNED NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '1=Success,2=Failed',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `PersonID` int DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT 'Dubai'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `privacy_policy`
--

INSERT INTO `privacy_policy` (`id`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1 Cybersecurity should underpin digital payment infrastructures...', 'As we come close to a year of being separated from our colleagues, friends, family, and conductingboth our professional and personal lives through our laptop and phone screens - its a good time totake a step back and re-evaluate the p', '2022-05-17 12:06:42', '2022-05-17 12:06:42', NULL),
(2, 'Tapping into the data boom with DBaaS', 'MultiCloud is here to stay and is slowly becoming inevitable for many organizations. At the same time, it is important to go beyond the hype of the buzzword and understand where it can help,andwhere it cannot. One of the common benef', '2022-05-17 12:06:42', '2022-05-17 12:06:42', NULL),
(3, 'IoT Security: Is Blockchain the way to go?', 'The first-generation blockchain has demonstrated immense value being a secure and cost effective way for recording and maintaining history of transactions for asset tracking purposes. What makes Blockchain secure is the fact that it is a', '2022-05-17 12:06:42', '2022-05-17 12:06:42', NULL),
(4, 'As we increase our tech-dependence, be vigilant about protecting data', 'Like much of the world, Indias enterprises saw a significant advancement in technology use over the past year, and the digital transformation of enterprises is expected to maintain its momentum.The business opportunities presented by', '2022-05-17 12:06:42', '2022-05-17 12:06:42', NULL),
(5, 'Recommended yoga adventure travel programs:', 'Is there anything like being within arms reach of a lion to prickle your senses and make you feel alive? Take a walk on the wild side. Channel your inner Indiana Jones with an adventure travel program unlike anything you’ve ever done before. Safari travelers can expect plenty of hair-raising, tail-spinning sights in unlikely destinations.', '2022-05-17 12:06:42', '2022-05-17 12:06:42', NULL),
(6, 'Recommended summer camp programs:', 'That one time at band camp” became a cliche for a reason: because summer camp is the ultimate source of absurd and wonderful adventures – the kind you can embarrass your grandchildren with for decades to come. Count on plenty of crafting with natural materials, group hiking, and schmoozing with co-eds on your summer camp adventure travel program. The campfire songs and s’mores at the end of each night are just the icing on the cake.', '2022-05-17 12:06:42', '2022-05-17 12:06:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int NOT NULL,
  `title` text NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `title`, `status`, `updated_at`) VALUES
(40, 'prg-1', '1', '2020-09-23 03:10:48'),
(41, 'prg-3', '1', '2020-09-23 03:10:48'),
(42, 'prg-4', '1', '2020-09-23 03:10:48'),
(43, 'prg-2', '1', '2020-09-23 05:17:37'),
(44, 'prg-1', '1', '2020-09-23 05:17:37'),
(45, 'prg-3', '1', '2020-09-23 05:17:37'),
(46, 'prg-4', '1', '2020-09-23 05:17:37'),
(47, 'prg-2', '1', '2020-09-23 05:22:00'),
(48, 'prg-1', '1', '2020-09-23 05:22:00'),
(49, 'prg-3', '1', '2020-09-23 05:22:00'),
(50, 'prg-4', '1', '2020-09-23 05:22:00'),
(51, 'prg-2', '1', '2020-09-23 05:22:54'),
(52, 'prg-1', '1', '2020-09-23 05:22:54'),
(53, 'prg-3', '1', '2020-09-23 05:22:54'),
(54, 'prg-4', '1', '2020-09-23 05:22:54'),
(55, 'prg-2', '1', '2020-09-23 05:28:41'),
(56, 'prg-1', '1', '2020-09-23 05:28:41'),
(57, 'prg-3', '1', '2020-09-23 05:28:41'),
(58, 'prg-4', '1', '2020-09-23 05:28:41'),
(59, 'prg-2', '1', '2020-09-23 06:09:30'),
(60, 'prg-1', '1', '2020-09-23 06:09:30'),
(61, 'prg-3', '1', '2020-09-23 06:09:30'),
(62, 'prg-4', '1', '2020-09-23 06:09:30'),
(63, 'prg-2', '1', '2020-09-23 23:25:59'),
(64, 'prg-1', '1', '2020-09-23 23:25:59'),
(65, 'prg-3', '1', '2020-09-23 23:25:59'),
(66, 'prg-4', '1', '2020-09-23 23:25:59'),
(67, 'prg-2', '1', '2020-09-24 05:35:56'),
(68, 'prg-1', '1', '2020-09-24 05:35:56'),
(69, 'prg-3', '1', '2020-09-24 05:35:56'),
(70, 'prg-4', '1', '2020-09-24 05:35:56'),
(71, 'prg-2', '1', '2020-09-24 05:37:31'),
(72, 'prg-2', '1', '2020-09-24 05:37:51'),
(73, 'prg-2', '1', '2020-09-24 05:38:05'),
(74, 'prg-2', '1', '2020-09-24 05:38:18'),
(75, 'prg-2', '1', '2020-09-24 05:39:05'),
(76, 'prg-2', '1', '2020-09-24 05:39:25'),
(77, 'prg-2', '1', '2020-09-24 05:40:59'),
(78, 'prg-2', '1', '2020-09-24 05:50:00'),
(79, 'prg-2', '1', '2020-09-24 05:50:08'),
(80, 'prg-1', '1', '2020-09-24 05:50:08'),
(81, 'prg-2', '1', '2020-09-24 05:50:17'),
(82, 'prg-1', '1', '2020-09-24 05:50:17'),
(83, 'prg-3', '1', '2020-09-24 05:50:17'),
(84, 'prg-4', '1', '2020-09-24 05:50:17'),
(85, 'prg-2', '1', '2020-09-24 05:50:37'),
(86, 'prg-1', '1', '2020-09-24 05:50:37'),
(87, 'prg-3', '1', '2020-09-24 05:50:37'),
(88, 'prg-4', '1', '2020-09-24 05:50:37'),
(89, 'prg-2', '1', '2020-09-24 05:50:46'),
(90, 'prg-1', '1', '2020-09-24 05:50:46'),
(91, 'prg-3', '1', '2020-09-24 05:50:46'),
(92, 'prg-4', '1', '2020-09-24 05:50:46'),
(93, 'prg-2', '1', '2020-09-24 05:51:01'),
(94, 'prg-1', '1', '2020-09-24 05:51:01'),
(95, 'prg-3', '1', '2020-09-24 05:51:01'),
(96, 'prg-4', '1', '2020-09-24 05:51:01'),
(97, 'hello', '1', '2020-09-24 05:53:01'),
(98, 'hello', '1', '2020-09-24 05:53:31'),
(99, 'prg-2', '1', '2020-09-24 05:53:56'),
(100, 'prg-1', '1', '2020-09-24 05:53:56'),
(101, 'prg-3', '1', '2020-09-24 05:53:56'),
(102, 'prg-4', '1', '2020-09-24 05:53:56'),
(103, 'prg-2', '1', '2020-09-24 05:55:01'),
(104, 'prg-1', '1', '2020-09-24 05:55:01'),
(105, 'prg-3', '1', '2020-09-24 05:55:01'),
(106, 'prg-4', '1', '2020-09-24 05:55:01'),
(107, 'prg-2', '1', '2020-09-24 05:56:01'),
(108, 'prg-1', '1', '2020-09-24 05:56:01'),
(109, 'prg-3', '1', '2020-09-24 05:56:01'),
(110, 'prg-4', '1', '2020-09-24 05:56:01'),
(111, 'prg-2', '1', '2020-09-24 05:56:07'),
(112, 'prg-1', '1', '2020-09-24 05:56:07'),
(113, 'prg-3', '1', '2020-09-24 05:56:07'),
(114, 'prg-4', '1', '2020-09-24 05:56:07'),
(115, 'hello', '1', '2020-09-24 05:56:29'),
(116, 'hello', '1', '2020-09-24 05:56:52'),
(117, 'hello', '1', '2020-09-24 05:57:02'),
(118, 'hello', '1', '2020-09-24 05:57:17'),
(119, 'hello', '1', '2020-09-24 05:57:48'),
(120, 'hello', '1', '2020-09-24 06:05:17'),
(121, 'test1', '1', '2020-09-24 06:09:28'),
(122, 'hhb', '1', '2020-09-24 06:13:19'),
(123, 'ff', '1', '2020-09-24 06:20:21'),
(124, 'prg-2', '1', '2020-09-24 23:35:50'),
(125, 'prg-1', '1', '2020-09-24 23:35:50'),
(126, 'prg-3', '1', '2020-09-24 23:35:50'),
(127, 'prg-4', '1', '2020-09-24 23:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `promocode`
--

CREATE TABLE `promocode` (
  `id` int NOT NULL,
  `promocode_name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '''0''=>InActive,''1''=>Active',
  `discount_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '''1''=>''Amount'', ''2''=>''Percentage''',
  `discount_amount` int NOT NULL,
  `redeemed_count` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `promocode`
--

INSERT INTO `promocode` (`id`, `promocode_name`, `code`, `status`, `discount_type`, `discount_amount`, `redeemed_count`, `start_date`, `end_date`, `description`, `created_at`, `deleted_at`) VALUES
(1, 'tester', 'OmanAdventuresClub', '1', '', 20, 2, '2022-05-17', '2022-05-24', 'OmanAdventuresClub', '2022-05-17 14:24:25', NULL),
(2, '20% for Oman', 'OmanAdventuresClub1', '1', '', 20, 1, '2022-05-16', '2022-05-23', '20%', '2022-05-17 14:26:02', NULL),
(3, 'OAC123', 'AdventuresClub123', '1', '', 10, 2, '2022-06-18', '2022-06-30', 'something', '2022-06-18 00:50:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promocode_users`
--

CREATE TABLE `promocode_users` (
  `id` int UNSIGNED NOT NULL,
  `booking_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `promocode_id` int UNSIGNED NOT NULL,
  `promocode` varchar(50) NOT NULL,
  `disc_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=>Amount, 2=>Percentage',
  `disc_amt` decimal(16,2) NOT NULL,
  `service_amt_befor_disc` decimal(16,2) NOT NULL,
  `service_amt_after_disc` decimal(16,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `question_reports`
--

CREATE TABLE `question_reports` (
  `id` int NOT NULL,
  `username` varchar(200) NOT NULL,
  `emailid` varchar(150) NOT NULL,
  `mobile` bigint NOT NULL,
  `country` varchar(100) NOT NULL,
  `purpose` varchar(250) NOT NULL,
  `question` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `id` int UNSIGNED NOT NULL,
  `country_id` int UNSIGNED NOT NULL,
  `region` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `country_id`, `region`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Central India', 1, '2021-07-06 00:40:00', '2021-07-06 00:40:00', NULL),
(2, 1, 'Nagpur', 1, '2022-04-01 21:38:18', '2022-04-01 21:38:18', NULL),
(3, 1, 'East India', 1, '2021-07-06 00:40:00', '2021-07-06 00:40:00', NULL),
(4, 1, 'North India', 1, '2021-07-06 00:40:00', '2021-07-06 00:40:00', NULL),
(12, 1, 'Bareilly', 1, '2021-08-29 00:43:21', '2021-08-29 00:43:21', NULL),
(13, 1, 'Dehradun', 1, '2021-09-21 22:58:22', '2021-09-21 22:58:22', NULL),
(16, 1, 'Noida', 1, '2021-09-25 15:53:01', '2021-09-25 15:53:01', NULL),
(17, 1, 'U.P', 1, '2021-09-25 16:13:03', '2021-09-25 16:13:03', NULL),
(18, 1, 'MP', 1, '2021-09-25 16:14:03', '2021-09-25 16:14:03', NULL),
(20, 2, 'Muscat', 1, '2022-04-24 02:43:05', '2022-04-24 02:43:05', '2022-04-27 02:50:22'),
(21, 2, 'Dhofar', 1, '2022-04-24 02:43:24', '2022-04-24 02:43:24', NULL),
(22, 2, 'Sharqiyah', 1, '2022-04-24 02:43:37', '2022-04-24 02:43:37', NULL),
(23, 2, 'Dakhliyah', 1, '2022-04-24 02:43:49', '2022-04-24 02:43:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `role` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
(9, 'Manage Locations Add, Edit and Delete'),
(10, 'Manage Admin Add, Edit and Delete'),
(11, 'Manage Chat Allow and Decline Client Chat Access'),
(12, 'Manage Administration Add, Edit and Delete');

-- --------------------------------------------------------

--
-- Table structure for table `role_assignments`
--

CREATE TABLE `role_assignments` (
  `id` int NOT NULL,
  `country_id` int NOT NULL DEFAULT '0',
  `role_id` int NOT NULL DEFAULT '0',
  `sort` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
(192, 1, 5, 0),
(193, 1, 6, 0),
(194, 1, 7, 0),
(195, 1, 8, 0),
(196, 1, 9, 0),
(197, 1, 10, 0),
(198, 1, 11, 0),
(199, 1, 12, 0),
(200, 2, 4, 0),
(201, 2, 5, 0),
(202, 2, 6, 0),
(203, 2, 7, 0),
(204, 2, 8, 0),
(205, 2, 9, 0),
(206, 2, 10, 0),
(207, 2, 11, 0),
(208, 2, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int UNSIGNED NOT NULL,
  `owner` int UNSIGNED NOT NULL,
  `adventure_name` varchar(200) NOT NULL,
  `country` int UNSIGNED NOT NULL,
  `region` int UNSIGNED NOT NULL,
  `city_id` int DEFAULT NULL,
  `service_sector` int UNSIGNED NOT NULL,
  `service_category` int UNSIGNED NOT NULL,
  `service_type` int UNSIGNED NOT NULL,
  `service_level` int UNSIGNED NOT NULL,
  `duration` int UNSIGNED NOT NULL,
  `available_seats` tinyint UNSIGNED NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `write_information` text,
  `service_plan` tinyint(1) DEFAULT NULL,
  `sfor_id` int DEFAULT NULL,
  `availability` varchar(100) DEFAULT NULL,
  `geo_location` text,
  `specific_address` text,
  `cost_inc` decimal(10,2) NOT NULL,
  `cost_exc` decimal(10,2) NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `points` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `pre_requisites` text,
  `minimum_requirements` text,
  `terms_conditions` text,
  `recommended` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Pending,1=Accept,2=Decline',
  `image` varchar(200) NOT NULL,
  `descreption` text,
  `favourite_image` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `owner`, `adventure_name`, `country`, `region`, `city_id`, `service_sector`, `service_category`, `service_type`, `service_level`, `duration`, `available_seats`, `start_date`, `end_date`, `write_information`, `service_plan`, `sfor_id`, `availability`, `geo_location`, `specific_address`, `cost_inc`, `cost_exc`, `currency`, `points`, `pre_requisites`, `minimum_requirements`, `terms_conditions`, `recommended`, `status`, `image`, `descreption`, `favourite_image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 27, 'water', 1, 1, NULL, 36, 11, 1, 16, 17, 50, NULL, NULL, 'test bj', 1, NULL, NULL, 'noida', 'noids', '222.00', '222.00', '1', 0, 'hub', 'ygv', 'gyvy', 1, 1, '', 'test bj', '', '2022-06-19 14:43:38', '2022-06-19 14:44:24', NULL),
(2, 27, 'Archery', 1, 12, NULL, 36, 11, 1, 15, 18, 10, '2022-06-24 00:00:00', '2022-06-25 00:00:00', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', 2, NULL, NULL, ', Oman', 'Roundabout', '20.00', '25.00', '1', 0, 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', 1, 0, '', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '', '2022-06-19 15:30:32', '2022-06-19 15:30:32', NULL),
(3, 27, 'Cycling', 1, 1, NULL, 36, 11, 17, 16, 16, 10, '2022-06-25 00:00:00', '2022-06-26 00:00:00', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', 2, NULL, NULL, ', Oman', 'MG,Road', '20.00', '25.00', '1', 0, 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', 1, 0, '', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '', '2022-06-19 15:37:39', '2022-06-19 15:37:39', NULL),
(4, 27, 'Tandem paragliding', 1, 18, NULL, 35, 11, 9, 16, 19, 8, NULL, NULL, 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', 1, NULL, NULL, ', Oman', 'Ooty', '3000.00', '2500.00', '1', 0, 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', 1, 1, '', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '', '2022-06-19 15:42:03', '2022-06-19 17:17:07', NULL),
(5, 35, 'rafting', 1, 12, NULL, 36, 11, 1, 15, 16, 0, NULL, NULL, 'rgfg', 1, NULL, NULL, 'Gurgaon , India', 'noida', '500.00', '500.00', '1', 0, 'c', 'a', 'b', 1, 1, '', 'rgfg', '', '2022-06-19 17:55:19', '2022-06-19 17:56:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_activities`
--

CREATE TABLE `service_activities` (
  `id` int UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `activity_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `service_activities`
--

INSERT INTO `service_activities` (`id`, `service_id`, `activity_id`) VALUES
(1, 1, '4'),
(2, 1, '7'),
(3, 2, '1'),
(4, 2, '2'),
(5, 2, '3'),
(6, 3, '2'),
(7, 3, '3'),
(8, 3, '13'),
(9, 4, '1'),
(10, 4, '2'),
(11, 4, '13'),
(12, 5, '1'),
(13, 5, '2'),
(14, 5, '3'),
(15, 5, '4'),
(16, 5, '5'),
(17, 5, '6'),
(18, 5, '7'),
(19, 5, '8'),
(20, 5, '9'),
(21, 5, '10'),
(22, 5, '11'),
(23, 5, '12'),
(24, 5, '13');

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` int NOT NULL,
  `category` varchar(200) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=Active,0=Deactive',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `category`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Land', 'yoga.jpg', 1, '2021-06-30 09:57:47', '2022-03-30 20:02:01', '2022-03-30 20:02:01'),
(2, 'Sea', 'trekking.jpg', 1, '2021-06-30 09:57:47', '2021-10-19 13:28:16', '2021-10-19 13:28:16'),
(3, 'Sky', 'cycling.jpg', 1, '2021-06-30 09:57:47', '2021-10-19 13:28:20', '2021-10-19 13:28:20'),
(4, 'Mountain', 'canoeing.jpg', 1, '2021-06-30 09:57:47', '2021-10-19 12:56:50', '2021-10-19 12:56:50'),
(5, 'Sand', 'kayaking.jpeg', 1, '2021-06-30 09:57:47', '2021-08-05 11:06:17', '2021-08-05 11:06:17'),
(6, 'Lake', 'rock-climbing.jpg', 1, '2021-06-30 09:57:47', '2021-07-31 12:41:10', '2021-07-31 12:41:10'),
(11, 'Tour', 'rock-climbing.jpg', 1, '2021-10-19 13:28:37', '2021-10-19 13:28:37', NULL),
(12, 'Training', 'rock-climbing.jpg', 1, '2021-10-19 13:28:50', '2021-10-19 13:28:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_dependencies`
--

CREATE TABLE `service_dependencies` (
  `id` int UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `dependency_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `service_dependencies`
--

INSERT INTO `service_dependencies` (`id`, `service_id`, `dependency_id`) VALUES
(1, 1, '5'),
(2, 1, '7'),
(3, 2, '5'),
(4, 2, '6'),
(5, 3, '5'),
(6, 3, '6'),
(7, 4, '5'),
(8, 4, '6'),
(9, 5, '5'),
(10, 5, '6'),
(11, 5, '7'),
(12, 5, '8');

-- --------------------------------------------------------

--
-- Table structure for table `service_for`
--

CREATE TABLE `service_for` (
  `id` int UNSIGNED NOT NULL,
  `sfor` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `service_for`
--

INSERT INTO `service_for` (`id`, `sfor`, `status`) VALUES
(1, 'Kids', 1),
(2, 'Ladies', 1),
(3, 'Families', 1),
(4, 'Everyone', 1),
(5, 'test2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_images`
--

CREATE TABLE `service_images` (
  `id` int UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `image_url` varchar(255) NOT NULL,
  `thumbnail` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `service_images`
--

INSERT INTO `service_images` (`id`, `service_id`, `is_default`, `image_url`, `thumbnail`) VALUES
(1, 1, 1, 'services/services-0-1655630018.jpg', 'services/services-0-1655630018.jpg'),
(2, 1, 0, 'services/services-1-1655630018.jpg', 'services/services-1-1655630018.jpg'),
(3, 2, 1, 'services/services-0-1655632832.jpg', 'services/services-0-1655632832.jpg'),
(4, 2, 0, 'services/services-1-1655632832.jpg', 'services/services-1-1655632832.jpg'),
(5, 2, 0, 'services/services-2-1655632832.jpg', 'services/services-2-1655632832.jpg'),
(6, 2, 0, 'services/services-3-1655632832.jpg', 'services/services-3-1655632832.jpg'),
(7, 3, 1, 'services/services-0-1655633259.jpg', 'services/services-0-1655633259.jpg'),
(8, 3, 0, 'services/services-1-1655633259.jpg', 'services/services-1-1655633259.jpg'),
(9, 3, 0, 'services/services-2-1655633259.jpg', 'services/services-2-1655633259.jpg'),
(10, 3, 0, 'services/services-3-1655633259.jpg', 'services/services-3-1655633259.jpg'),
(11, 4, 1, 'services/services-0-1655633523.jpg', 'services/services-0-1655633523.jpg'),
(12, 4, 0, 'services/services-1-1655633523.jpg', 'services/services-1-1655633523.jpg'),
(13, 4, 0, 'services/services-2-1655633523.jpg', 'services/services-2-1655633523.jpg'),
(14, 4, 0, 'services/services-3-1655633523.jpg', 'services/services-3-1655633523.jpg'),
(15, 5, 1, 'services/services-0-1655641519.jpg', 'services/services-0-1655641519.jpg'),
(16, 5, 0, 'services/services-1-1655641519.jpg', 'services/services-1-1655641519.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `service_levels`
--

CREATE TABLE `service_levels` (
  `id` int UNSIGNED NOT NULL,
  `level` varchar(255) NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=Active,0=Deactive',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `service_levels`
--

INSERT INTO `service_levels` (`id`, `level`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(15, 'Beginner', 1, '2022-05-06 21:34:31', '2022-05-06 21:34:31', NULL),
(16, 'Intermediate', 1, '2022-05-06 21:35:24', '2022-05-06 21:35:24', NULL),
(17, 'Advanced', 1, '2022-05-06 21:35:49', '2022-05-06 21:35:49', NULL),
(18, 'tester', 1, '2022-05-24 22:03:49', '2022-05-24 22:04:08', '2022-05-24 22:04:08');

-- --------------------------------------------------------

--
-- Table structure for table `service_likes`
--

CREATE TABLE `service_likes` (
  `id` int NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `is_like` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `service_offers`
--

CREATE TABLE `service_offers` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount_type` enum('A','P') DEFAULT NULL COMMENT '''A''=>''Amount'', ''P''=>''Percentage''',
  `discount_amount` int NOT NULL,
  `banner` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `status` enum('0','1') NOT NULL COMMENT '''0''=>''Inactive'',''1''=>''Active''',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `service_offers`
--

INSERT INTO `service_offers` (`id`, `service_id`, `name`, `start_date`, `end_date`, `discount_type`, `discount_amount`, `banner`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 5, 'AdventuresClub', '2022-06-20', '2022-06-30', 'P', 20, 'offer_image/1655657441.jpeg', 'Something', '0', '2022-06-19 22:20:41', '2022-06-19 22:20:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_plan`
--

CREATE TABLE `service_plan` (
  `id` int NOT NULL,
  `plan` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `id` int UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `day` int UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `service_plan_day_date`
--

INSERT INTO `service_plan_day_date` (`id`, `service_id`, `day`, `date`) VALUES
(1, 1, 3, NULL),
(2, 1, 5, NULL),
(3, 2, NULL, '1970-01-01'),
(4, 3, NULL, '1970-01-01'),
(5, 4, 2, NULL),
(6, 4, 4, NULL),
(7, 4, 6, NULL),
(8, 5, 1, NULL),
(9, 5, 2, NULL),
(10, 5, 3, NULL),
(11, 5, 4, NULL),
(12, 5, 5, NULL),
(13, 5, 6, NULL),
(14, 5, 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_programs`
--

CREATE TABLE `service_programs` (
  `id` int NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `start_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `service_programs`
--

INSERT INTO `service_programs` (`id`, `service_id`, `title`, `description`, `start_datetime`, `end_datetime`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'morning', 'hji', '2022-06-24 10:45:00', '2022-06-24 11:55:00', '1', '2022-06-19 09:13:38', '2022-06-19 09:13:38', NULL),
(2, 2, 'morning', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '2022-06-25 06:00:00', '2022-06-25 09:00:00', '1', '2022-06-19 10:00:32', '2022-06-19 10:00:32', NULL),
(3, 2, 'afternoon', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '2022-06-25 09:00:00', '2022-06-25 12:00:00', '1', '2022-06-19 10:00:32', '2022-06-19 10:00:32', NULL),
(4, 2, 'evening', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '2022-06-25 12:00:00', '2022-06-25 18:00:00', '1', '2022-06-19 10:00:32', '2022-06-19 10:00:32', NULL),
(5, 3, 'morning', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '2022-06-25 06:00:00', '2022-06-25 09:00:00', '1', '2022-06-19 10:07:39', '2022-06-19 10:07:39', NULL),
(6, 3, 'afternoon', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '2022-06-25 09:00:00', '2022-06-25 12:00:00', '1', '2022-06-19 10:07:39', '2022-06-19 10:07:39', NULL),
(7, 3, 'night', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '2022-06-25 15:00:00', '2022-06-25 20:45:00', '1', '2022-06-19 10:07:39', '2022-06-19 10:07:39', NULL),
(8, 3, 'Nezt morning', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '2022-06-26 07:00:00', '2022-06-26 10:00:00', '1', '2022-06-19 10:07:39', '2022-06-19 10:07:39', NULL),
(9, 3, 'evening', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '2022-06-26 19:00:00', '2022-06-26 23:28:00', '1', '2022-06-19 10:07:39', '2022-06-19 10:07:39', NULL),
(10, 4, 'Morning', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '2022-06-21 07:00:00', '2022-06-21 10:00:00', '1', '2022-06-19 10:12:03', '2022-06-19 10:12:03', NULL),
(11, 4, 'afternoon', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '2022-06-22 08:00:00', '2022-06-22 10:00:00', '1', '2022-06-19 10:12:03', '2022-06-19 10:12:03', NULL),
(12, 4, 'Night', 'something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery, something about archery,', '2022-06-24 08:00:00', '2022-06-24 11:00:00', '1', '2022-06-19 10:12:03', '2022-06-19 10:12:03', NULL),
(13, 5, 'morning', 'bh', '2022-06-22 03:20:00', '2022-06-22 10:50:00', '1', '2022-06-19 12:25:19', '2022-06-19 12:25:19', NULL),
(14, 5, 'gh', 'jhb', '2022-07-05 02:10:00', '2022-07-05 10:49:00', '1', '2022-06-19 12:25:19', '2022-06-19 12:25:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_reviews`
--

CREATE TABLE `service_reviews` (
  `id` int UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `star` tinyint UNSIGNED NOT NULL,
  `remark` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `service_sectors`
--

CREATE TABLE `service_sectors` (
  `id` int UNSIGNED NOT NULL,
  `sector` varchar(255) NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=Active,0=Deactive',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `service_sectors`
--

INSERT INTO `service_sectors` (`id`, `sector`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(35, 'Air Activity', 1, '2022-05-24 23:04:48', '2022-05-24 23:04:48', NULL),
(36, 'Land Activity', 1, '2022-05-24 23:05:05', '2022-05-24 23:05:05', NULL),
(37, 'Water Activity', 1, '2022-05-24 23:05:15', '2022-05-24 23:05:15', NULL),
(38, 'Package', 1, '2022-05-24 23:05:32', '2022-05-24 23:05:32', NULL),
(39, 'Transportation', 1, '2022-05-24 23:05:44', '2022-05-24 23:05:44', NULL),
(40, 'Accomodation', 1, '2022-05-24 23:05:54', '2022-05-24 23:05:54', NULL),
(41, 'Build check', 1, '2022-06-18 00:53:47', '2022-06-18 00:54:31', '2022-06-18 00:54:31');

-- --------------------------------------------------------

--
-- Table structure for table `service_service_for`
--

CREATE TABLE `service_service_for` (
  `id` int UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `sfor_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `service_service_for`
--

INSERT INTO `service_service_for` (`id`, `service_id`, `sfor_id`) VALUES
(1, 1, '12'),
(2, 1, '15'),
(3, 2, '13'),
(4, 2, '14'),
(5, 3, '12'),
(6, 3, '15'),
(7, 4, '16'),
(8, 5, '11'),
(9, 5, '12'),
(10, 5, '13'),
(11, 5, '14'),
(12, 5, '15'),
(13, 5, '16'),
(14, 5, '17');

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=Active,0=Deactive',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`id`, `type`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hiking', 1, '2021-06-30 10:08:25', '2021-06-30 10:18:35', NULL),
(2, 'Skiing', 1, '2021-06-30 10:08:25', '2021-10-19 13:07:53', '2021-10-19 13:07:53'),
(3, 'Parachuting', 1, '2021-06-30 10:08:25', '2021-10-19 13:08:01', '2021-10-19 13:08:01'),
(4, 'Scuba diving', 1, '2021-06-30 10:08:25', '2021-08-05 11:06:29', '2021-08-05 11:06:29'),
(5, 'Zorbing', 1, '2021-06-30 10:08:25', '2021-07-31 12:41:21', '2021-07-31 12:41:21'),
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
(21, 'Highlining / Slacklining', 1, '2021-10-19 13:15:35', '2022-05-24 21:51:26', '2022-05-24 21:51:26'),
(22, 'Horse Riding', 1, '2021-10-19 13:16:03', '2021-10-19 13:16:03', NULL),
(23, 'Overlanding (Camping)', 1, '2021-10-19 13:17:40', '2022-05-24 21:51:54', '2022-05-24 21:51:54'),
(24, 'Sand boarding', 1, '2021-10-19 13:18:59', '2021-10-19 13:18:59', NULL),
(25, 'Sailing', 1, '2021-10-19 13:19:32', '2021-10-19 13:19:32', NULL),
(26, 'Skydiving', 1, '2021-10-19 13:19:50', '2021-10-19 13:19:50', NULL),
(27, 'test', 1, '2022-03-31 20:58:07', '2022-04-04 14:50:19', '2022-04-04 14:50:19'),
(28, 'Hiking', 1, '2022-04-04 14:50:53', '2022-04-04 14:50:53', NULL),
(29, 'Helicopter tours', 1, '2022-04-12 23:13:31', '2022-04-12 23:13:31', NULL),
(30, 'Bungee Jumping', 1, '2022-04-12 23:13:57', '2022-04-12 23:13:57', NULL),
(31, 'Hot Air Ballooning', 1, '2022-04-12 23:14:19', '2022-04-12 23:14:19', NULL),
(32, 'Microlight flying', 1, '2022-04-12 23:14:48', '2022-04-12 23:14:48', NULL),
(33, 'Parasailing', 1, '2022-04-12 23:15:17', '2022-04-12 23:15:17', NULL),
(34, 'Scenic Flights', 1, '2022-04-12 23:15:51', '2022-04-12 23:15:51', NULL),
(35, 'tester', 1, '2022-04-27 02:45:16', '2022-04-27 02:45:23', '2022-04-27 02:45:23'),
(36, 'Camping', 1, '2022-05-24 21:51:06', '2022-05-24 21:51:06', NULL),
(37, 'Highlining', 1, '2022-05-24 21:51:37', '2022-05-24 21:51:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
-- Table structure for table `subscription_plan_history`
--

CREATE TABLE `subscription_plan_history` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `package_id` int NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `payment_status` enum('0','1') NOT NULL DEFAULT '0',
  `payment_amount` varchar(225) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `subscription_plan_history`
--

INSERT INTO `subscription_plan_history` (`id`, `user_id`, `package_id`, `order_id`, `payment_type`, `payment_status`, `payment_amount`, `created_at`, `deleted_at`) VALUES
(1, 12, 1, '374112', 'Free', '0', '0', '2022-05-15 14:36:10', NULL),
(2, 17, 1, '856817', 'Free', '0', '0', '2022-05-17 00:49:38', NULL),
(3, 22, 1, '709622', 'Free', '0', '0', '2022-05-17 10:32:51', NULL),
(4, 21, 1, '525821', 'Free', '0', '0', '2022-05-17 13:50:07', NULL),
(5, 22, 2, '729222', 'BankMuscat', '1', '100.00', '2022-05-24 12:23:36', NULL),
(6, 12, 2, '873112', 'Offline', '0', '100.00', '2022-05-24 21:54:48', NULL),
(7, 27, 1, '10527', 'Free', '0', '0', '2022-05-27 09:29:40', NULL),
(8, 22, 1, '956622', 'Free', '0', '0', '2022-06-07 00:42:11', NULL),
(9, 12, 4, '614812', 'Offline', '0', '200.00', '2022-06-07 20:51:12', NULL),
(10, 27, 2, '770027', 'BankMuscat', '1', '100.00', '2022-06-07 21:19:26', NULL),
(11, 27, 2, '227', 'BankMuscat', '1', '20.00', '2022-06-07 21:48:03', NULL),
(12, 12, 1, '812', 'Offline', '0', '1000.00', '2022-06-13 23:31:46', NULL),
(13, 12, 1, '812', 'Offline', '0', '1000.00', '2022-06-13 23:44:37', NULL),
(14, 27, 2, '1827', 'Offline', '0', '200.00', '2022-06-14 22:20:58', NULL),
(15, 27, 2, '1827', 'Offline', '0', '200.00', '2022-06-15 09:38:52', NULL),
(16, 27, 2, '1827', 'Offline', '0', '200.00', '2022-06-15 09:42:01', NULL),
(17, 27, 2, '1827', 'Offline', '0', '200.00', '2022-06-15 09:42:30', NULL),
(18, 27, 2, '1827', 'Offline', '0', '200.00', '2022-06-15 09:47:26', NULL),
(19, 27, 2, '4927', 'Offline', '0', '30.00', '2022-06-16 10:12:56', NULL),
(20, 27, 2, '727', 'Offline', '0', '20000.00', '2022-06-18 18:19:47', NULL),
(21, 27, 2, '827', 'Offline', '0', '20000.00', '2022-06-18 22:37:54', NULL),
(22, 27, 2, '1127', 'Offline', '0', '20000.00', '2022-06-18 23:28:43', NULL),
(23, 27, 2, '1127', 'Offline', '0', '20000.00', '2022-06-18 23:29:56', NULL),
(24, 35, 1, '718935', 'Free', '0', '0', '2022-06-19 17:49:21', NULL),
(25, 27, 2, '927', 'Offline', '0', '3000.00', '2022-06-19 17:53:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `terms_conditions`
--

CREATE TABLE `terms_conditions` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `terms_conditions`
--

INSERT INTO `terms_conditions` (`id`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1. Ownership of responsibilities is more valued than talent and skills: Hitesh Singla, Square Yards...', 'Hitesh Singla, Co-founder, and CIO, Square Yards, dishes on his digital transformation journey with the company and shares his early career path with technology.1', '2022-05-17 12:07:03', '2022-05-17 12:07:03', NULL),
(2, 'Achieve your goals, never quit and be humble: Ravinder Arora', 'Ravinder Arora, Global CISO Infogain, has had an extraordinary career. Coming from the small town of Haryana, and ended up becoming the most prestigious CISO of the country, his journey has been only of dreams.', '2022-05-17 12:07:03', '2022-05-17 12:07:03', NULL),
(3, 'Change is a step towards opportunity: Gautam Garg, PepsiCo', 'Gautam Garg, Sr Director & CIO at PepsiCo, speaks on his 21 years journey at the company and shares his future goals for the upcoming years.', '2022-05-17 12:07:03', '2022-05-17 12:07:03', NULL),
(4, 'I am very happily unsatisfied: upGrad’s Rohit Dhar', 'Change is not welcoming unless you share the vision & rationale with a positive impact, feels Rohit Dhar, President - Product, Data, Design, Technology & Content (PDTC) of upGrad.', '2022-05-17 12:07:03', '2022-05-17 12:07:03', NULL),
(5, 'Recommended summer camp programs:', '“That one time at band camp” became a cliche for a reason: because summer camp is the ultimate source of absurd and wonderful adventures – the kind you can embarrass your grandchildren with for decades to come. Count on plenty of crafting with natural materials, group hiking, and schmoozing with co-eds on your summer camp adventure travel program. The campfire songs and s’mores at the end of each night are just the icing on the cake.', '2022-05-17 12:07:03', '2022-05-17 12:07:03', NULL),
(6, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', '2022-05-17 12:07:03', '2022-05-17 12:07:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int NOT NULL,
  `username` varchar(200) NOT NULL,
  `type` varchar(100) NOT NULL,
  `transaction_type` varchar(200) NOT NULL,
  `method` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `users_role` enum('1','2','3') DEFAULT '3' COMMENT '''1''=>''Admin'',''2''=>''Vendor'',''3''=>''Customer''',
  `profile_image` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `height` varchar(250) DEFAULT NULL,
  `weight` varchar(250) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `region_id` int DEFAULT NULL,
  `city_id` int NOT NULL,
  `now_in` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `mobile_verified_at` datetime DEFAULT NULL,
  `dob` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `language_id` int NOT NULL DEFAULT '1',
  `nationality_id` varchar(255) DEFAULT NULL,
  `currency_id` int NOT NULL DEFAULT '1',
  `app_notification` varchar(255) DEFAULT NULL,
  `points` varchar(50) NOT NULL DEFAULT '0',
  `health_conditions` varchar(500) NOT NULL,
  `health_conditions_id` varchar(255) DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `mobile_code` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '1' COMMENT '''0'' Inactive , ''1'' Active, ''2'' Decline',
  `added_from` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=APP,0=WEB',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `users_role`, `profile_image`, `name`, `height`, `weight`, `password`, `email`, `country_id`, `region_id`, `city_id`, `now_in`, `mobile`, `mobile_verified_at`, `dob`, `gender`, `language_id`, `nationality_id`, `currency_id`, `app_notification`, `points`, `health_conditions`, `health_conditions_id`, `email_verified_at`, `mobile_code`, `remember_token`, `status`, `added_from`, `created_at`, `updated_at`, `deleted_at`, `username`, `first_name`, `last_name`, `device_id`) VALUES
(1, '1', '20220405000947-Screenshot_20220226-162200_Samsung Internet.png', 'Admin', NULL, NULL, '$2y$10$rB2GIm4PGt6CNEePoWE40ev/xFZOa1uCJ3dcdGu7PffZnhj4lbuU2', 'admin@gmail.com', 1, 1, 1, NULL, '9020202020', NULL, '1993-05-04', 'male', 1, '1', 1, '1', '0', '1,4,6,7,8,9,10,11,12,13,14', NULL, '2021-06-17 12:34:39', '+968', '7K06a6jn604Z4fVv22i7xGDPZSM3nJG7sCopao9Hir0B62u76TfAhKyCxrVb', '1', 0, NULL, '2022-04-03 15:01:18', NULL, NULL, NULL, NULL, ''),
(12, '2', 'profile_image/1c35f638-5023-47a4-8332-ee7a5eac0701img.jpg', 'rajesh', '100 - 105 CM', '26 - 28 KG', '$2y$10$rB2GIm4PGt6CNEePoWE40ev/xFZOa1uCJ3dcdGu7PffZnhj4lbuU2', 'rajesh@gmail.com', 1, NULL, 0, NULL, '9627204181', '2022-05-15 14:32:20', '1979-05-15', 'male', 1, '1', 1, NULL, '0', '17,1', NULL, NULL, '+91', NULL, '1', 1, '2022-05-15 03:31:59', '2022-06-11 02:16:29', NULL, NULL, NULL, NULL, 'dcfc8de66a765f2d'),
(16, '3', 'profile_image/1652713942.jpeg', 'alsahibadar', '145 - 150 CM', '74 - 76 KG', '$2y$10$2nkjJgHlhKJd1vKJmPi9SuVlOaESeMrL7DEflqH155cbYJTdibGpu', 'mscbadar@gmail.com', 2, 23, 2, NULL, '96123r5895', NULL, '2000-06-14', 'male', 1, '1', 1, NULL, '0', '1,17,18', NULL, NULL, '+968', NULL, '1', 0, '2022-05-16 09:42:22', '2022-05-16 11:44:37', '2022-05-16 22:44:37', NULL, NULL, NULL, NULL),
(20, '3', 'profile_image/no-image.png', 'badaralsahi', '180 - 185 CM', '72 - 74 KG', '$2y$10$GLUAI4hfCBcvvrsWsuV2/eDrigZ8QAga7uxf0mwFmalmDeuyxFiqi', 'badaralsahi@gmail.com', 2, NULL, 0, NULL, '961235881', '2022-05-17 10:11:29', '1981-05-22', 'male', 1, '1', 1, NULL, '0', '17,8,4,6', NULL, NULL, '+968', NULL, '1', 1, '2022-05-16 23:08:01', '2022-05-16 23:13:51', '2022-05-17 10:13:51', NULL, NULL, NULL, '44a1a776ed95cc73'),
(22, '2', 'profile_image/1652763041.png', 'badaralsahii', '175 - 180 CM', '72 - 74 KG', '$2y$10$AsWBQb35cbkSqhO/6ss3MuKJW1KFALanzdlI.D1kEbR656TzdRjsu', 'badaralsahii@gmail.com', 1, 1, 1, NULL, '98765432', NULL, '1990-05-22', 'male', 1, '18', 1, NULL, '0', '17,4', NULL, NULL, '+968', NULL, '1', 0, '2022-05-16 23:20:41', '2022-06-20 04:16:30', NULL, NULL, NULL, NULL, 'dcfc8de66a765f2d'),
(27, '2', 'profile_image/7923234f-b241-49ca-a754-55fa2faf33eedtm9edd8_cycling_625x300_05_August_20.jpg', 'AdventuresClub', '130 - 135 CM', '38 - 40 KG', '$2y$10$qfdJ0QeZH9BxKlcjbqLGO.K1HLi6D6nBbeKcdkp2hMXOo7rxxSAG6', 'info@adventuresclub.net', 2, NULL, 0, NULL, '96000891', '2022-05-25 00:46:57', '1952-05-29', 'male', 1, '1', 1, NULL, '0', '8,11', NULL, NULL, '+968', NULL, '1', 1, '2022-05-24 13:10:39', '2022-06-19 20:54:45', NULL, NULL, NULL, NULL, 'dcfc8de66a765f2d'),
(30, '3', 'profile_image/d180669e-5758-43ee-80e4-ca61826f0717Screenshot_20220525_151323_companyname.adventureclub.jpg', 'Mahmood3', '170 - 175 CM', '58 - 60 KG', '$2y$10$3aLiibFQcR6DQN836aqFa.ggm0LgJ8GZ9blnyybAwrHIprbiGUQDC', 'bofa968@gmail.com', 2, NULL, 0, NULL, '92698070', '2022-05-25 16:14:58', '1992-07-15', 'male', 1, '2', 1, NULL, '0', '1', NULL, NULL, '+968', NULL, '1', 1, '2022-05-25 05:14:43', '2022-05-25 05:45:45', NULL, NULL, NULL, NULL, '8d4cb28d04874a63'),
(35, '2', 'profile_image/no-image.png', 'pankaj', '105 - 110 CM', '28 - 30 KG', '$2y$10$IqGPSsgXZYQBaEYvx7LQied.SZX39DQBBpt/0gks716WktMN71w2S', 'pankaj@gmail.com', 1, NULL, 0, NULL, '8081303373', '2022-06-19 17:45:52', '1952-06-27', 'male', 1, '1', 1, NULL, '0', '18,1,12,14', NULL, NULL, '+91', NULL, '1', 1, '2022-06-19 12:12:27', '2022-06-19 12:16:35', NULL, NULL, NULL, NULL, '50dcd20daa55d153'),
(37, '3', 'profile_image/no-image.png', 'Rose', '150 - 155 CM', '48 - 50 KG', '$2y$10$LJpDYNcEiqecxIVgUMgpU.v.vRSq/QiaVMFE8q5r4bSRZrJYq36ZS', 'Precylinwandas_1981@gmail.com', 22, NULL, 0, NULL, '72216252', '2022-06-19 22:04:41', '1981-04-23', 'male', 1, '2', 1, NULL, '0', '18', NULL, NULL, '+968', NULL, '1', 1, '2022-06-19 16:34:17', '2022-06-19 16:34:47', NULL, NULL, NULL, NULL, 'c8f9b3f45ce0cd67');

-- --------------------------------------------------------

--
-- Table structure for table `vendors_details`
--

CREATE TABLE `vendors_details` (
  `vendor_details_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `company_name` varchar(45) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `geo_location` varchar(255) NOT NULL,
  `license_status` enum('0','1') NOT NULL COMMENT '''0''=>''No'',''1''=>''Yes''',
  `cr_name` varchar(45) NOT NULL,
  `cr_number` int NOT NULL,
  `cr_copy` varchar(255) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `subscription_id` int NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_package`
--

CREATE TABLE `vendor_package` (
  `id` int UNSIGNED NOT NULL,
  `vendor_id` int UNSIGNED NOT NULL,
  `package_id` int UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visited_location`
--

CREATE TABLE `visited_location` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `destination_image` varchar(255) DEFAULT NULL,
  `destination_name` varchar(255) NOT NULL,
  `destination_type` varchar(255) NOT NULL,
  `geo_location` varchar(255) NOT NULL,
  `destination_address` text NOT NULL,
  `dest_mobile` varchar(255) NOT NULL,
  `dest_website` varchar(255) NOT NULL,
  `dest_description` text NOT NULL,
  `is_approved` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0 requested ,1 approved 2 decline',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `visited_location`
--

INSERT INTO `visited_location` (`id`, `user_id`, `destination_image`, `destination_name`, `destination_type`, `geo_location`, `destination_address`, `dest_mobile`, `dest_website`, `dest_description`, `is_approved`, `created_at`, `deleted_at`) VALUES
(1, 35, 'destination_image/destination_image1655645438.jpg', 'felhi', 'Hiking', 'Haryana Gurugram Gurgaon India', 'noida', '85828282885', 'www.adventure.com', '', '0', '2022-06-19 19:00:38', NULL),
(2, 35, 'destination_image/destination_image1655646173.jpg', 'delhi', 'Scuba Diving', 'Haryana Gurugram Gurgaon India', 'delhi', '8585858588', 'cc', '', '0', '2022-06-19 19:12:53', NULL),
(3, 27, 'destination_image/destination_image1655660552.jpg', 'philippines', 'Paragliding', 'Muscat  Oman', 'oman', '96123588', 'universal-skills.com', '', '0', '2022-06-19 23:12:32', NULL),
(4, 35, 'destination_image/destination_image1655669065.jpg', 'bareilly', 'Cycling', 'Haryana Gurugram Gurgaon India', 'Gudgaon', '84252525282', 'www.google.com', '', '0', '2022-06-20 01:34:25', NULL),
(5, 22, 'destination_image/destination_image1655700205.jpg', 'Mutrah Route', 'Cycling', 'Muscat Governorate Muscat  Oman', 'Muscat, mutrah', '96123588', 'www.universal-skills.com', '', '0', '2022-06-20 10:13:25', NULL),
(6, 22, 'destination_image/destination_image1655737802.jpg', 'Shams mountain Summit', 'Caving', 'Al Batinah South Governorate   Oman', 'Alhamra', '96123588', 'universal-skills.com', '', '0', '2022-06-20 20:40:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `payment_id` int UNSIGNED DEFAULT NULL,
  `booking_id` int UNSIGNED DEFAULT NULL,
  `amount_type` tinyint UNSIGNED NOT NULL DEFAULT '2' COMMENT '1=Cash,2=Points,3=Bonus',
  `credit_amt` decimal(8,2) DEFAULT '0.00' COMMENT 'added amount',
  `debit_amt` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'deducted amount',
  `current_amt` decimal(8,2) NOT NULL DEFAULT '0.00',
  `note` varchar(255) DEFAULT NULL,
  `image` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `weekdays`
--

CREATE TABLE `weekdays` (
  `id` int UNSIGNED NOT NULL,
  `day` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `weekdays`
--

INSERT INTO `weekdays` (`id`, `day`) VALUES
(1, 'Sunday'),
(2, 'Monday'),
(3, 'Tuesday'),
(4, 'Wednesday'),
(5, 'Thursday'),
(6, 'Friday'),
(7, 'Saturday');

-- --------------------------------------------------------

--
-- Table structure for table `weights`
--

CREATE TABLE `weights` (
  `Id` int NOT NULL,
  `weightName` varchar(200) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `weights`
--

INSERT INTO `weights` (`Id`, `weightName`, `deleted_at`, `created_at`, `updated_at`) VALUES
(30, '26 - 28 KG', NULL, '2022-05-04 18:13:21', '2022-05-04 18:13:21'),
(31, '28 - 30 KG', NULL, '2022-05-04 18:13:42', '2022-05-04 18:13:42'),
(32, '30 - 32 KG', NULL, '2022-05-04 18:13:59', '2022-05-04 18:13:59'),
(33, '32 - 34 KG', NULL, '2022-05-04 18:14:28', '2022-05-04 18:14:28'),
(34, '34 - 36 KG', NULL, '2022-05-04 18:14:50', '2022-05-04 18:14:50'),
(35, '36 - 38 KG', NULL, '2022-05-04 18:15:07', '2022-05-04 18:15:07'),
(36, '38 - 40 KG', NULL, '2022-05-04 18:15:27', '2022-05-04 18:15:27'),
(37, '40 - 42 KG', NULL, '2022-05-04 18:15:45', '2022-05-04 18:15:45'),
(38, '42 - 44 KG', NULL, '2022-05-04 18:16:04', '2022-05-04 18:16:04'),
(39, '44 - 46 KG', NULL, '2022-05-04 18:16:21', '2022-05-04 18:16:21'),
(40, '46 - 48 KG', NULL, '2022-05-04 18:16:42', '2022-05-04 18:16:42'),
(41, '48 - 50 KG', NULL, '2022-05-04 18:16:57', '2022-05-04 18:16:57'),
(42, '50 - 52 KG', NULL, '2022-05-04 18:17:52', '2022-05-04 18:17:52'),
(43, '52 - 54 KG', NULL, '2022-05-04 18:18:09', '2022-05-04 18:18:09'),
(45, '54 - 56 KG', NULL, '2022-05-04 18:19:04', '2022-05-04 18:19:04'),
(46, '56 - 58 KG', NULL, '2022-05-04 18:19:22', '2022-05-04 18:19:22'),
(47, '58 - 60 KG', NULL, '2022-05-04 18:19:56', '2022-05-04 18:19:56'),
(48, '60 - 62 KG', NULL, '2022-05-04 18:20:20', '2022-05-04 18:20:20'),
(49, '62 - 64 KG', NULL, '2022-05-04 18:20:38', '2022-05-04 18:20:38'),
(50, '64 - 66 KG', NULL, '2022-05-04 18:21:22', '2022-05-04 18:21:22'),
(51, '66 - 68 KG', NULL, '2022-05-04 18:21:45', '2022-05-04 18:21:45'),
(52, '68 - 70 KG', NULL, '2022-05-04 18:22:03', '2022-05-04 18:22:03'),
(53, '70 - 72 KG', NULL, '2022-05-04 18:22:55', '2022-05-04 18:22:55'),
(54, '72 - 74 KG', NULL, '2022-05-04 18:23:11', '2022-05-04 18:23:11'),
(55, '74 - 76 KG', NULL, '2022-05-04 18:23:33', '2022-05-04 18:23:33'),
(56, '76 - 78 KG', NULL, '2022-05-04 18:24:10', '2022-05-04 18:24:10'),
(57, '78 - 80 KG', NULL, '2022-05-04 18:24:27', '2022-05-04 18:24:27'),
(58, '80 - 82 KG', NULL, '2022-05-04 18:24:41', '2022-05-04 18:24:41'),
(59, '82 - 84 KG', NULL, '2022-05-04 18:24:57', '2022-05-04 18:24:57'),
(60, '84 - 86 KG', NULL, '2022-05-04 18:25:54', '2022-05-04 18:25:54'),
(61, '86 - 88 KG', NULL, '2022-05-04 18:26:08', '2022-05-04 18:26:08'),
(62, '88 - 90 KG', NULL, '2022-05-04 18:26:29', '2022-05-04 18:26:29'),
(63, '90 - 92 KG', NULL, '2022-05-04 18:26:43', '2022-05-04 18:26:43'),
(64, '92 - 94 KG', NULL, '2022-05-04 18:27:00', '2022-05-04 18:27:00'),
(65, '94 - 96 KG', NULL, '2022-05-04 18:27:24', '2022-05-04 18:27:24'),
(66, '96 - 98 KG', NULL, '2022-05-04 18:27:39', '2022-05-04 18:27:39'),
(67, '98 - 100 KG', NULL, '2022-05-04 18:27:58', '2022-05-04 18:27:58'),
(68, '100 - 102 KG', NULL, '2022-05-04 18:28:41', '2022-05-04 18:28:41'),
(69, '102 - 104 KG', NULL, '2022-05-04 18:28:56', '2022-05-04 18:28:56'),
(70, '104 - 106 KG', NULL, '2022-05-04 18:29:12', '2022-05-04 18:29:12'),
(71, '106 - 108 KG', NULL, '2022-05-04 18:29:27', '2022-05-04 18:29:27'),
(72, '108 - 110 KG', NULL, '2022-05-04 18:29:45', '2022-05-04 18:29:45'),
(73, '110 - 112 KG', NULL, '2022-05-04 18:30:02', '2022-05-04 18:30:02'),
(74, '112 - 114 KG', NULL, '2022-05-04 18:30:38', '2022-05-04 18:30:38'),
(75, '114 - 116 KG', NULL, '2022-05-04 18:30:54', '2022-05-04 18:30:54'),
(76, '116 - 118 KG', NULL, '2022-05-04 18:33:35', '2022-05-04 18:33:35'),
(77, '118 - 120 KG', NULL, '2022-05-04 18:34:04', '2022-05-04 18:34:04'),
(78, 'Above 120 KG', NULL, '2022-05-04 18:34:23', '2022-05-04 18:34:23');

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
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `subscription_plan_history`
--
ALTER TABLE `subscription_plan_history`
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
-- Indexes for table `visited_location`
--
ALTER TABLE `visited_location`
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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `aimed`
--
ALTER TABLE `aimed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `become_partner`
--
ALTER TABLE `become_partner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contactuspurposes`
--
ALTER TABLE `contactuspurposes`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact_us_purpose`
--
ALTER TABLE `contact_us_purpose`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `dependency`
--
ALTER TABLE `dependency`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `durations`
--
ALTER TABLE `durations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `get_all_paymentmode`
--
ALTER TABLE `get_all_paymentmode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `health_conditions`
--
ALTER TABLE `health_conditions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `heights`
--
ALTER TABLE `heights`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `package_detail`
--
ALTER TABLE `package_detail`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `privacy_policy`
--
ALTER TABLE `privacy_policy`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `promocode`
--
ALTER TABLE `promocode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `promocode_users`
--
ALTER TABLE `promocode_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_reports`
--
ALTER TABLE `question_reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `role_assignments`
--
ALTER TABLE `role_assignments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `service_activities`
--
ALTER TABLE `service_activities`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `service_dependencies`
--
ALTER TABLE `service_dependencies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `service_for`
--
ALTER TABLE `service_for`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_images`
--
ALTER TABLE `service_images`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `service_levels`
--
ALTER TABLE `service_levels`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `service_likes`
--
ALTER TABLE `service_likes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_offers`
--
ALTER TABLE `service_offers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_plan`
--
ALTER TABLE `service_plan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_plan_day_date`
--
ALTER TABLE `service_plan_day_date`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `service_programs`
--
ALTER TABLE `service_programs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `service_reviews`
--
ALTER TABLE `service_reviews`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service_sectors`
--
ALTER TABLE `service_sectors`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `service_service_for`
--
ALTER TABLE `service_service_for`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscription_plan_history`
--
ALTER TABLE `subscription_plan_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `terms_conditions`
--
ALTER TABLE `terms_conditions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `vendors_details`
--
ALTER TABLE `vendors_details`
  MODIFY `vendor_details_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_package`
--
ALTER TABLE `vendor_package`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visited_location`
--
ALTER TABLE `visited_location`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weekdays`
--
ALTER TABLE `weekdays`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `weights`
--
ALTER TABLE `weights`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2021 at 07:38 PM
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
-- Database: `wavexpay`
--

-- --------------------------------------------------------

--
-- Table structure for table `wxp_failed_jobs`
--

DROP TABLE IF EXISTS `wxp_failed_jobs`;
CREATE TABLE `wxp_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wxp_logs`
--

DROP TABLE IF EXISTS `wxp_logs`;
CREATE TABLE `wxp_logs` (
  `id` int(11) NOT NULL,
  `model_name` varchar(100) DEFAULT NULL,
  `row_id` int(11) DEFAULT NULL,
  `api_name` varchar(200) DEFAULT NULL,
  `api_url` text DEFAULT NULL,
  `request_params` text DEFAULT NULL,
  `response_params` text DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL COMMENT 'back_office.users.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wxp_merchant`
--

DROP TABLE IF EXISTS `wxp_merchant`;
CREATE TABLE `wxp_merchant` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation_date` timestamp NULL DEFAULT NULL,
  `account_access` tinyint(1) DEFAULT 0,
  `additional_website_app` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit_per_transaction` double(8,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wxp_merchant`
--

INSERT INTO `wxp_merchant` (`id`, `merchant_id`, `display_name`, `contact_number`, `business_name`, `business_type`, `activation_date`, `account_access`, `additional_website_app`, `limit_per_transaction`, `created_at`, `updated_at`) VALUES
(1, 'xxxxxxxxxxxxxsssssssssssssyyyyyyyy', 'Merchant test', '15367137157', NULL, NULL, NULL, 0, NULL, 0.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wxp_merchant_api_keys`
--

DROP TABLE IF EXISTS `wxp_merchant_api_keys`;
CREATE TABLE `wxp_merchant_api_keys` (
  `id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL COMMENT 'merchants.id',
  `pg` varchar(20) NOT NULL,
  `key_id` varchar(50) NOT NULL,
  `key_secret` varchar(50) NOT NULL,
  `expiry` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1 is active else not active',
  `deleted` int(11) NOT NULL DEFAULT 0 COMMENT '1 is deleted else not deleted',
  `created_at` datetime NOT NULL,
  `craeted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wxp_merchant_api_keys`
--

INSERT INTO `wxp_merchant_api_keys` (`id`, `merchant_id`, `pg`, `key_id`, `key_secret`, `expiry`, `status`, `deleted`, `created_at`, `craeted_by`) VALUES
(1, 1, 'cashfree', 'ABCDEFGH', '1234567890ABCD', '2022-12-09 13:29:34', 1, 0, '2021-12-18 13:29:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wxp_migrations`
--

DROP TABLE IF EXISTS `wxp_migrations`;
CREATE TABLE `wxp_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wxp_migrations`
--

INSERT INTO `wxp_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2021_12_04_154323_create_permission_tables', 2),
(10, '2021_12_10_174524_create_user_types', 3),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 4),
(13, '2021_12_09_170526_create_merchant_table', 4),
(14, '2021_12_14_040100_add_column_type_deleted_status_created_by_updated_by_to_users_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `wxp_model_has_permissions`
--

DROP TABLE IF EXISTS `wxp_model_has_permissions`;
CREATE TABLE `wxp_model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wxp_model_has_roles`
--

DROP TABLE IF EXISTS `wxp_model_has_roles`;
CREATE TABLE `wxp_model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wxp_model_has_roles`
--

INSERT INTO `wxp_model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 5),
(1, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 6),
(5, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `wxp_oauth_access_tokens`
--

DROP TABLE IF EXISTS `wxp_oauth_access_tokens`;
CREATE TABLE `wxp_oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wxp_oauth_auth_codes`
--

DROP TABLE IF EXISTS `wxp_oauth_auth_codes`;
CREATE TABLE `wxp_oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wxp_oauth_clients`
--

DROP TABLE IF EXISTS `wxp_oauth_clients`;
CREATE TABLE `wxp_oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wxp_oauth_clients`
--

INSERT INTO `wxp_oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'WaveXPay Personal Access Client', 'lh0NfuYsVzFSq18TupNLRhxH7njrfPky58PjwIiC', NULL, 'http://localhost', 1, 0, 0, '2021-12-15 07:10:53', '2021-12-15 07:10:53'),
(2, NULL, 'WaveXPay Password Grant Client', 'GsrDL2t3ggsmKaVYM8K9VQ6AKkpmh78bogDrLqFH', 'users', 'http://localhost', 0, 1, 0, '2021-12-15 07:10:54', '2021-12-15 07:10:54');

-- --------------------------------------------------------

--
-- Table structure for table `wxp_oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `wxp_oauth_personal_access_clients`;
CREATE TABLE `wxp_oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wxp_oauth_personal_access_clients`
--

INSERT INTO `wxp_oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-12-15 07:10:54', '2021-12-15 07:10:54');

-- --------------------------------------------------------

--
-- Table structure for table `wxp_oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `wxp_oauth_refresh_tokens`;
CREATE TABLE `wxp_oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wxp_orders`
--

DROP TABLE IF EXISTS `wxp_orders`;
CREATE TABLE `wxp_orders` (
  `id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `pg` enum('cashfree','razorpay') NOT NULL,
  `domain` varchar(250) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(5) DEFAULT 'INR',
  `product_name` varchar(150) DEFAULT NULL,
  `product_details` varchar(250) DEFAULT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  `customer_email` varchar(50) DEFAULT NULL,
  `return_url` varchar(250) NOT NULL,
  `notify_url` varchar(250) NOT NULL,
  `order_expiry_time` timestamp NULL DEFAULT NULL,
  `order_token` varchar(100) DEFAULT NULL,
  `cf_order_id` varchar(30) DEFAULT NULL,
  `entity` varchar(30) DEFAULT NULL,
  `settlements_url` varchar(250) DEFAULT NULL,
  `payments_url` varchar(250) DEFAULT NULL,
  `refunds_url` varchar(250) DEFAULT NULL,
  `order_status` varchar(250) DEFAULT NULL,
  `order_note` varchar(250) DEFAULT NULL,
  `payment_link` varchar(250) DEFAULT NULL,
  `order_tags` varchar(250) DEFAULT NULL,
  `order_splits` varchar(250) DEFAULT NULL,
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`response`)),
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wxp_orders`
--

INSERT INTO `wxp_orders` (`id`, `merchant_id`, `pg`, `domain`, `order_id`, `amount`, `currency`, `product_name`, `product_details`, `customer_name`, `customer_mobile`, `customer_email`, `return_url`, `notify_url`, `order_expiry_time`, `order_token`, `cf_order_id`, `entity`, `settlements_url`, `payments_url`, `refunds_url`, `order_status`, `order_note`, `payment_link`, `order_tags`, `order_splits`, `response`, `created_at`, `updated_at`) VALUES
(1, 1, 'cashfree', 'NA', '101_ocY3LEuC1icgDr3M1hM3', '52.30', 'INR', NULL, NULL, 'c name', '9908734801', 'aaa@cashfree.com', 'https://b8af79f41056.eu.ngrok.io/webhook.php', 'https://b8af79f41056.eu.ngrok.io/webhook.php', '2021-12-26 15:41:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"cf_order_id\":1946214,\"order_id\":\"101_2SuSksMIjv223j3iIFdc\",\"entity\":\"order\",\"order_currency\":\"INR\",\"order_amount\":52.30,\"order_expiry_time\":\"2021-12-25T16:39:51+05:30\",\"customer_details\":{\"customer_id\":\"A00002\",\"customer_name\":\"c name\",\"customer_email\":\"aaa@cashfree.com\",\"customer_phone\":\"9908734801\"},\"order_meta\":{\"return_url\":\"https://b8af79f41056.eu.ngrok.io?order_id={order_id}\\u0026order_token={order_token}\",\"notify_url\":\"https://b8af79f41056.eu.ngrok.io/webhook.php\",\"payment_methods\":null},\"settlements\":{\"url\":\"https://sandbox.cashfree.com/pg/orders/101_2SuSksMIjv223j3iIFdc/settlements\"},\"payments\":{\"url\":\"https://sandbox.cashfree.com/pg/orders/101_2SuSksMIjv223j3iIFdc/payments\"},\"refunds\":{\"url\":\"https://sandbox.cashfree.com/pg/orders/101_2SuSksMIjv223j3iIFdc/refunds\"},\"order_status\":\"ACTIVE\",\"order_token\":\"uavpQo2ZlC3nsC6aPpe0\",\"order_note\":null,\"payment_link\":\"https://payments-test.cashfree.com/order/#uavpQo2ZlC3nsC6aPpe0\",\"order_tags\":null,\"order_splits\":[]}\n', '2021-12-19 16:25:38', '2021-12-19 16:25:38'),
(5, 1, 'cashfree', 'NA', '101_SB3zPnz46nzxRBiSDtd5', '52.30', 'INR', NULL, NULL, 'c name', '9908734801', 'aaa@cashfree.com', 'https://b8af79f41056.eu.ngrok.io/webhook.php', 'https://b8af79f41056.eu.ngrok.io/webhook.php', '2021-12-19 23:38:19', 'GD2B2olAJnArpNJ8Wwff', '1946255', 'order', 'https://sandbox.cashfree.com/pg/orders/101_rr2d1kb0fSPHBX4A2cnA/settlements', 'https://sandbox.cashfree.com/pg/orders/101_rr2d1kb0fSPHBX4A2cnA/payments', 'https://sandbox.cashfree.com/pg/orders/101_rr2d1kb0fSPHBX4A2cnA/refunds', 'ACTIVE', NULL, 'https://payments-test.cashfree.com/order/#GD2B2olAJnArpNJ8Wwff', NULL, '[]', '{\"cf_order_id\":1946255,\"order_id\":\"101_rr2d1kb0fSPHBX4A2cnA\",\"entity\":\"order\",\"order_currency\":\"INR\",\"order_amount\":52.30,\"order_expiry_time\":\"2021-12-25T16:39:51+05:30\",\"customer_details\":{\"customer_id\":\"A00002\",\"customer_name\":\"c name\",\"customer_email\":\"aaa@cashfree.com\",\"customer_phone\":\"9908734801\"},\"order_meta\":{\"return_url\":\"https://b8af79f41056.eu.ngrok.io?order_id={order_id}\\u0026order_token={order_token}\",\"notify_url\":\"https://b8af79f41056.eu.ngrok.io/webhook.php\",\"payment_methods\":null},\"settlements\":{\"url\":\"https://sandbox.cashfree.com/pg/orders/101_rr2d1kb0fSPHBX4A2cnA/settlements\"},\"payments\":{\"url\":\"https://sandbox.cashfree.com/pg/orders/101_rr2d1kb0fSPHBX4A2cnA/payments\"},\"refunds\":{\"url\":\"https://sandbox.cashfree.com/pg/orders/101_rr2d1kb0fSPHBX4A2cnA/refunds\"},\"order_status\":\"ACTIVE\",\"order_token\":\"GD2B2olAJnArpNJ8Wwff\",\"order_note\":null,\"payment_link\":\"https://payments-test.cashfree.com/order/#GD2B2olAJnArpNJ8Wwff\",\"order_tags\":null,\"order_splits\":[]}\n', '2021-12-19 17:08:19', '2021-12-19 17:08:19'),
(6, 1, 'cashfree', 'NA', '101_lwJoMjJjir0rBOqVKSpB', '52.30', 'INR', NULL, NULL, 'c name', '9908734801', 'aaa@cashfree.com', 'https://b8af79f41056.eu.ngrok.io/webhook.php', 'https://b8af79f41056.eu.ngrok.io/webhook.php', '2021-12-19 23:39:44', 'yvu6wSRa7QaTv54HTZei', '1946256', 'order', 'https://sandbox.cashfree.com/pg/orders/101_CEPHn97ao3xPzWwtUGDU/settlements', 'https://sandbox.cashfree.com/pg/orders/101_CEPHn97ao3xPzWwtUGDU/payments', 'https://sandbox.cashfree.com/pg/orders/101_CEPHn97ao3xPzWwtUGDU/refunds', 'ACTIVE', NULL, 'https://payments-test.cashfree.com/order/#yvu6wSRa7QaTv54HTZei', NULL, '[]', '{\"cf_order_id\":1946256,\"order_id\":\"101_CEPHn97ao3xPzWwtUGDU\",\"entity\":\"order\",\"order_currency\":\"INR\",\"order_amount\":52.30,\"order_expiry_time\":\"2021-12-25T16:39:51+05:30\",\"customer_details\":{\"customer_id\":\"A00002\",\"customer_name\":\"c name\",\"customer_email\":\"aaa@cashfree.com\",\"customer_phone\":\"9908734801\"},\"order_meta\":{\"return_url\":\"https://b8af79f41056.eu.ngrok.io?order_id={order_id}\\u0026order_token={order_token}\",\"notify_url\":\"https://b8af79f41056.eu.ngrok.io/webhook.php\",\"payment_methods\":null},\"settlements\":{\"url\":\"https://sandbox.cashfree.com/pg/orders/101_CEPHn97ao3xPzWwtUGDU/settlements\"},\"payments\":{\"url\":\"https://sandbox.cashfree.com/pg/orders/101_CEPHn97ao3xPzWwtUGDU/payments\"},\"refunds\":{\"url\":\"https://sandbox.cashfree.com/pg/orders/101_CEPHn97ao3xPzWwtUGDU/refunds\"},\"order_status\":\"ACTIVE\",\"order_token\":\"yvu6wSRa7QaTv54HTZei\",\"order_note\":null,\"payment_link\":\"https://payments-test.cashfree.com/order/#yvu6wSRa7QaTv54HTZei\",\"order_tags\":null,\"order_splits\":[]}\n', '2021-12-19 17:09:44', '2021-12-19 17:09:45');

-- --------------------------------------------------------

--
-- Table structure for table `wxp_password_resets`
--

DROP TABLE IF EXISTS `wxp_password_resets`;
CREATE TABLE `wxp_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wxp_payments`
--

DROP TABLE IF EXISTS `wxp_payments`;
CREATE TABLE `wxp_payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `merchant_id` varchar(100) NOT NULL,
  `order_token` varchar(100) NOT NULL,
  `payment_method` enum('card','app','netbanking') NOT NULL COMMENT 'card | app | netbanking',
  `payment_method_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payment_method_params`)),
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`response`)),
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wxp_permissions`
--

DROP TABLE IF EXISTS `wxp_permissions`;
CREATE TABLE `wxp_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wxp_permissions`
--

INSERT INTO `wxp_permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `group_name`, `event_name`) VALUES
(1, 'role-list', 'web', '2021-12-04 11:22:23', '2021-12-04 11:22:23', 'role', 'Role List'),
(2, 'role-create', 'web', '2021-12-04 11:22:24', '2021-12-04 11:22:24', 'role', 'Role Create'),
(3, 'role-edit', 'web', '2021-12-04 11:22:24', '2021-12-04 11:22:24', 'role', 'Role Edit'),
(4, 'role-delete', 'web', '2021-12-04 11:22:24', '2021-12-04 11:22:24', 'role', 'Role Delete'),
(5, 'user-list', 'web', '2021-12-04 11:22:24', '2021-12-04 11:22:24', 'user', 'User List'),
(6, 'user-create', 'web', '2021-12-04 11:22:24', '2021-12-04 11:22:24', 'user', 'User Create'),
(7, 'user-edit', 'web', '2021-12-04 11:22:24', '2021-12-04 11:22:24', 'user', 'User Edit'),
(8, 'user-delete', 'web', '2021-12-04 11:22:24', '2021-12-04 11:22:24', 'user', 'User Delete');

-- --------------------------------------------------------

--
-- Table structure for table `wxp_personal_access_tokens`
--

DROP TABLE IF EXISTS `wxp_personal_access_tokens`;
CREATE TABLE `wxp_personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wxp_roles`
--

DROP TABLE IF EXISTS `wxp_roles`;
CREATE TABLE `wxp_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wxp_roles`
--

INSERT INTO `wxp_roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2021-12-06 13:12:18', '2021-12-06 13:12:18'),
(4, 'Admin', 'web', '2021-12-07 04:59:04', '2021-12-07 04:59:04'),
(5, 'Accountant', 'web', '2021-12-07 04:59:25', '2021-12-07 04:59:25');

-- --------------------------------------------------------

--
-- Table structure for table `wxp_role_has_permissions`
--

DROP TABLE IF EXISTS `wxp_role_has_permissions`;
CREATE TABLE `wxp_role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wxp_role_has_permissions`
--

INSERT INTO `wxp_role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 5),
(2, 1),
(2, 4),
(2, 5),
(3, 1),
(3, 4),
(4, 1),
(4, 4),
(4, 5),
(5, 1),
(5, 4),
(5, 5),
(6, 1),
(6, 5),
(7, 1),
(7, 5),
(8, 1),
(8, 5);

-- --------------------------------------------------------

--
-- Table structure for table `wxp_settings`
--

DROP TABLE IF EXISTS `wxp_settings`;
CREATE TABLE `wxp_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` varchar(250) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1 is active else inactive',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `craeted_by` int(11) NOT NULL COMMENT 'users.id',
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL COMMENT 'users.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wxp_settings`
--

INSERT INTO `wxp_settings` (`id`, `type`, `key`, `value`, `status`, `created_at`, `craeted_by`, `updated_at`, `updated_by`) VALUES
(1, 'cashfree', 'test_base_url', 'https://sandbox.cashfree.com/pg', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0),
(2, 'cashfree', 'live_base_url', 'https://api.cashfree.com/pg', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0),
(3, 'cashfree', 'x-client-id', '4856268e8b6e5dd3d85ecf45b26584', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0),
(4, 'cashfree', 'x-client-secret', '5dbcee366d16bc67b99264748f11d5c95bdb8362', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0),
(5, 'cashfree', 'x-api-version', '2021-05-21', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0),
(6, 'cashfree', 'return_url', 'https://wavexpay.com/admin/public/return_url?order_id={order_id}&order_token={order_token}', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0),
(7, 'cashfree', 'notify_url', 'https://wavexpay.com/admin/public/notify_url_webhook', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0),
(8, 'razorpay', 'test_base_url', 'https://api.razorpay.com/v1', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0),
(9, 'razorpay', 'live_base_url', 'https://api.razorpay.com/v1', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0),
(10, 'razorpay', 'x-client-id', '4856268e8b6e5dd3d85ecf45b26584', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0),
(11, 'razorpay', 'x-client-secret', '5dbcee366d16bc67b99264748f11d5c95bdb8362', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0),
(12, 'razorpay', 'x-api-version', '2021-05-21', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0),
(13, 'razorpay', 'return_url', 'https://wavexpay.com/admin/public/return_url?order_id={order_id}&order_token={order_token}', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0),
(14, 'razorpay', 'notify_url', 'https://wavexpay.com/admin/public/notify_url_webhook', 1, '2021-12-15 11:46:25', 1, '2021-12-15 07:13:58', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wxp_users`
--

DROP TABLE IF EXISTS `wxp_users`;
CREATE TABLE `wxp_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT 'user_type',
  `deleted` int(11) NOT NULL DEFAULT 0 COMMENT '1 is deleted this record else not deleted',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 is active 0 is inactive',
  `created_by` int(11) NOT NULL DEFAULT 0 COMMENT 'users.id',
  `updated_by` int(11) NOT NULL DEFAULT 0 COMMENT 'users.id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wxp_users`
--

INSERT INTO `wxp_users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `type`, `deleted`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'WaveXpay Info', 'info@wavexpay.com', NULL, '$2y$10$0ro7shUx6LXRgx3eY0qTe.pyFxjBM4wYsxdBDl3QfovxNIc3/2lhm', 'eRGid2fBPSBcKScITdQwRy5MOhGqHVWoonS8us4zAAWLBVTtgYKpVBae0hG5', 0, 0, 0, 0, 0, NULL, NULL),
(2, 'Super Admin', 'admin@wavexpay.com', NULL, '$2y$10$3ownKYZWq7dwWJzYdWpA9OsVHo2GhhSl98CXabdQAm1EzjfF1KUlS', 'nnmgtY5r67Rv0seZqSoeYMPYWSCpmahGjrnBLrPGxed7uIYU7U9aXuJegJVi', 0, 0, 0, 0, 0, NULL, NULL),
(3, 'Test', 'test@gmai.com', NULL, '$2y$10$cNJG0mzPvWLDTL.c1aXmxOOldNp6x96pxlMCxxRjzvPrcUmJc5jEm', NULL, 0, 0, 0, 0, 0, '2021-12-04 05:51:43', '2021-12-04 05:51:43'),
(4, 'test111', 'test@gmail.com', NULL, '$2y$10$p56acnVi2mK/bS9wn9CEY.1/5pzSQnrrwhF416tfhxmFYXV.yKnXS', NULL, 1, 0, 0, 0, 0, '2021-12-04 06:00:32', '2021-12-10 13:56:10'),
(5, 'Thakur Prasad', 'thakurprasadlhs@gmail.com', NULL, '$2y$10$qpj8xhvzE5QwkwInCTSzfeV8OW8PKOslVqRqeS/gUaJ6Y8R6/2sJK', NULL, 0, 0, 0, 0, 0, '2021-12-06 15:07:06', '2021-12-06 15:07:06'),
(6, 'Thakur Prasad', 'test2@gmail.com', NULL, '$2y$10$cmPMSSq7.4qm.HrZqACbU.9L6rKjdD2eRLhHAV8YywPLWX/ik.gyy', NULL, 2, 0, 0, 0, 0, '2021-12-10 13:18:43', '2021-12-10 13:18:43'),
(7, 'Ram', 'ram@gmail.com', NULL, '$2y$10$u078Cw1QylJ9Sq0hqn/qXONMADdMHYPYj6DDsuppM2AJCnprIzpm.', NULL, 2, 0, 0, 0, 0, '2021-12-11 10:07:27', '2021-12-11 10:07:27'),
(9, 'Thakur Prasad', 'thakurprasadlhs1@gmail.com', '2021-12-15 07:47:37', '$2y$10$ejLktx/pdc4M.qxeCl5Ku.w0QC0kftXNmaiatWq8xQBcJrLGfXiIC', NULL, 0, 0, 0, 0, 0, '2021-12-15 07:45:29', '2021-12-15 07:47:37');

-- --------------------------------------------------------

--
-- Table structure for table `wxp_user_types`
--

DROP TABLE IF EXISTS `wxp_user_types`;
CREATE TABLE `wxp_user_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wxp_user_types`
--

INSERT INTO `wxp_user_types` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 1, '2021-12-10 18:06:22', '2021-12-10 18:06:22'),
(2, 'Admin', 1, '2021-12-10 18:06:22', '2021-12-10 18:06:22'),
(3, 'Accountant', 1, '2021-12-10 18:06:22', '2021-12-10 18:06:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wxp_failed_jobs`
--
ALTER TABLE `wxp_failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wxp_failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `wxp_logs`
--
ALTER TABLE `wxp_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wxp_merchant`
--
ALTER TABLE `wxp_merchant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wxp_merchant_api_keys`
--
ALTER TABLE `wxp_merchant_api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wxp_migrations`
--
ALTER TABLE `wxp_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wxp_model_has_permissions`
--
ALTER TABLE `wxp_model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `wxp_model_has_roles`
--
ALTER TABLE `wxp_model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `wxp_oauth_access_tokens`
--
ALTER TABLE `wxp_oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wxp_oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `wxp_oauth_auth_codes`
--
ALTER TABLE `wxp_oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wxp_oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `wxp_oauth_clients`
--
ALTER TABLE `wxp_oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wxp_oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `wxp_oauth_personal_access_clients`
--
ALTER TABLE `wxp_oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wxp_oauth_refresh_tokens`
--
ALTER TABLE `wxp_oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wxp_oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `wxp_orders`
--
ALTER TABLE `wxp_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wxp_password_resets`
--
ALTER TABLE `wxp_password_resets`
  ADD KEY `wxp_password_resets_email_index` (`email`);

--
-- Indexes for table `wxp_payments`
--
ALTER TABLE `wxp_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wxp_permissions`
--
ALTER TABLE `wxp_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wxp_permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `wxp_personal_access_tokens`
--
ALTER TABLE `wxp_personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wxp_personal_access_tokens_token_unique` (`token`),
  ADD KEY `wxp_personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `wxp_roles`
--
ALTER TABLE `wxp_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wxp_roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `wxp_role_has_permissions`
--
ALTER TABLE `wxp_role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `wxp_role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `wxp_settings`
--
ALTER TABLE `wxp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wxp_users`
--
ALTER TABLE `wxp_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wxp_users_email_unique` (`email`);

--
-- Indexes for table `wxp_user_types`
--
ALTER TABLE `wxp_user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wxp_failed_jobs`
--
ALTER TABLE `wxp_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wxp_logs`
--
ALTER TABLE `wxp_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wxp_merchant`
--
ALTER TABLE `wxp_merchant`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wxp_merchant_api_keys`
--
ALTER TABLE `wxp_merchant_api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wxp_migrations`
--
ALTER TABLE `wxp_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wxp_oauth_clients`
--
ALTER TABLE `wxp_oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wxp_oauth_personal_access_clients`
--
ALTER TABLE `wxp_oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wxp_orders`
--
ALTER TABLE `wxp_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wxp_payments`
--
ALTER TABLE `wxp_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wxp_permissions`
--
ALTER TABLE `wxp_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wxp_personal_access_tokens`
--
ALTER TABLE `wxp_personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wxp_roles`
--
ALTER TABLE `wxp_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wxp_settings`
--
ALTER TABLE `wxp_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wxp_users`
--
ALTER TABLE `wxp_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wxp_user_types`
--
ALTER TABLE `wxp_user_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `wxp_model_has_permissions`
--
ALTER TABLE `wxp_model_has_permissions`
  ADD CONSTRAINT `wxp_model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `wxp_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wxp_model_has_roles`
--
ALTER TABLE `wxp_model_has_roles`
  ADD CONSTRAINT `wxp_model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `wxp_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wxp_role_has_permissions`
--
ALTER TABLE `wxp_role_has_permissions`
  ADD CONSTRAINT `wxp_role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `wxp_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wxp_role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `wxp_roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

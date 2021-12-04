-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2021 at 05:53 PM
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
(9, '2021_12_04_154323_create_permission_tables', 2);

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

-- --------------------------------------------------------

--
-- Table structure for table `wxp_role_has_permissions`
--

DROP TABLE IF EXISTS `wxp_role_has_permissions`;
CREATE TABLE `wxp_role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wxp_users`
--

INSERT INTO `wxp_users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'WaveXpay Info', 'info@wavexpay.com', NULL, '$2y$10$0ro7shUx6LXRgx3eY0qTe.pyFxjBM4wYsxdBDl3QfovxNIc3/2lhm', 'eRGid2fBPSBcKScITdQwRy5MOhGqHVWoonS8us4zAAWLBVTtgYKpVBae0hG5', NULL, NULL),
(2, 'Super Admin', 'admin@wavexpay.com', NULL, '$2y$10$3ownKYZWq7dwWJzYdWpA9OsVHo2GhhSl98CXabdQAm1EzjfF1KUlS', NULL, NULL, NULL),
(3, 'Test', 'test@gmai.com', NULL, '$2y$10$cNJG0mzPvWLDTL.c1aXmxOOldNp6x96pxlMCxxRjzvPrcUmJc5jEm', NULL, '2021-12-04 05:51:43', '2021-12-04 05:51:43'),
(4, 'test', 'test@gmail.com', NULL, '$2y$10$p56acnVi2mK/bS9wn9CEY.1/5pzSQnrrwhF416tfhxmFYXV.yKnXS', NULL, '2021-12-04 06:00:32', '2021-12-04 06:00:32');

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
-- Indexes for table `wxp_password_resets`
--
ALTER TABLE `wxp_password_resets`
  ADD KEY `wxp_password_resets_email_index` (`email`);

--
-- Indexes for table `wxp_permissions`
--
ALTER TABLE `wxp_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wxp_permissions_name_guard_name_unique` (`name`,`guard_name`);

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
-- Indexes for table `wxp_users`
--
ALTER TABLE `wxp_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wxp_users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wxp_failed_jobs`
--
ALTER TABLE `wxp_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wxp_migrations`
--
ALTER TABLE `wxp_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wxp_oauth_clients`
--
ALTER TABLE `wxp_oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wxp_oauth_personal_access_clients`
--
ALTER TABLE `wxp_oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wxp_permissions`
--
ALTER TABLE `wxp_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wxp_roles`
--
ALTER TABLE `wxp_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wxp_users`
--
ALTER TABLE `wxp_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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

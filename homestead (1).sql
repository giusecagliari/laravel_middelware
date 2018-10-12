-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 12, 2018 at 03:55 PM
-- Server version: 10.2.11-MariaDB-10.2.11+maria~xenial-log
-- PHP Version: 7.1.12-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homestead`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'russia', NULL, NULL),
(2, 'canada', NULL, NULL),
(3, 'UK', NULL, NULL),
(4, 'USA', NULL, NULL),
(5, 'Italy', NULL, NULL),
(6, 'France', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `phone`, `email`, `address`, `city`, `state`) VALUES
(2, 'Sam', 'Smith', '333-333-3333', 'ssmith@yahoo.com', '33 Birch Rd', 'Miami', 'FL'),
(3, 'Brad', 'Traversy', '333-333-3333', 'brad@test.com', '333 South st', 'Portland', 'ME');

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
(11, '2014_10_12_000000_create_users_table', 1),
(12, '2014_10_12_100000_create_password_resets_table', 1),
(13, '2018_09_15_163706_create_post_table', 1),
(14, '2018_09_16_085504_add_iss_admin_column_to_post_tables', 1),
(15, '2018_09_17_152158_add_deleted_column_to_posts_tables', 1),
(18, '2018_09_18_150331_create_roles_table', 2),
(19, '2018_09_18_150539_create_users_roles_table', 2),
(20, '2018_09_18_164715_create_countries_table', 3),
(21, '2018_09_18_164823_add_country_id_column_to_users', 3),
(22, '2018_09_19_075151_create_photos_table', 4),
(26, '2018_09_19_102536_create_taggables_table', 5),
(27, '2018_09_19_102553_create_videos_table', 5),
(28, '2018_09_19_102604_create_tags_table', 5),
(29, '2018_10_09_210222_add_path_column_to_post', 6),
(30, '2018_10_10_211003_add__table_add_role', 7);

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
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` int(11) NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `path`, `imageable_id`, `imageable_type`, `created_at`, `updated_at`) VALUES
(1, 'photo.jpg', 1, 'App\\User', NULL, NULL),
(2, 'photodux.jpj', 1, 'App\\Post', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `created_at`, `updated_at`, `is_admin`, `deleted_at`, `path`) VALUES
(1, 'new post', 'post of the ywar', '2018-09-16 00:00:00', '2018-09-17 00:00:00', 0, NULL, ''),
(2, 'new post', 'post of the ywar', '2018-09-16 00:00:00', '2018-09-17 00:00:00', 0, NULL, ''),
(3, 'Updated record with id 3 with tinker', 'Updated record with id 3 with tinker', '2018-09-18 00:00:00', '2018-09-20 20:20:34', 0, '2018-09-20 20:20:34', ''),
(4, 'PHP posto from tinker new', 'PHP content', '2018-09-20 14:53:43', '2018-09-24 19:38:17', 0, NULL, ''),
(5, 'sabino', 'sada', '2018-09-24 14:32:58', '2018-09-24 20:03:36', 0, NULL, ''),
(6, 'sad22', 'sada', '2018-09-24 16:03:48', '2018-09-25 16:41:11', 0, NULL, ''),
(7, 'sondag2', 'sada', '2018-09-24 16:04:59', '2018-09-24 16:04:59', 0, NULL, ''),
(8, 'sondag2', 'sada', '2018-09-24 16:13:41', '2018-09-24 16:13:41', 0, NULL, ''),
(9, 'sondag2sfsa', 'asdadada', '2018-09-24 16:14:01', '2018-09-24 16:14:01', 0, NULL, ''),
(10, 'sondag2sfsa', 'asdadada', '2018-09-24 16:14:46', '2018-09-24 16:14:46', 0, NULL, ''),
(11, 'sondag2sfsa', 'asdadada', '2018-09-24 16:14:49', '2018-09-24 16:14:49', 0, NULL, ''),
(12, 'sondag2sfsa', 'asdadada', '2018-09-24 16:29:33', '2018-09-27 09:28:56', 0, '2018-09-27 09:28:56', ''),
(13, 'dsa', 'ss', '2018-09-24 16:29:46', '2018-09-24 16:29:46', 0, NULL, ''),
(14, 'dsa', 'ss', '2018-09-24 16:30:29', '2018-09-24 16:30:29', 0, NULL, ''),
(15, 'dsa', 'ss', '2018-09-24 16:30:30', '2018-09-27 16:33:25', 0, '2018-09-27 16:33:25', ''),
(16, 'new post', 'cont', '2018-09-24 20:18:09', '2018-09-24 20:18:09', 0, NULL, ''),
(17, 'saz', 'dasasasss', '2018-09-24 20:58:49', '2018-09-24 20:58:49', 0, NULL, ''),
(18, 'PHP posto from tinker a', 'PHP content from', '2018-09-25 16:05:37', '2018-09-27 16:36:06', 0, NULL, ''),
(19, 'da', 'dass', '2018-09-25 16:46:18', '2018-09-27 16:27:25', 0, '2018-09-27 16:27:25', ''),
(20, 'da', 'dass', '2018-09-25 16:46:23', '2018-09-27 16:35:56', 0, '2018-09-27 16:35:56', ''),
(21, 'nullddd', 'dddddd', '2018-09-25 16:50:28', '2018-09-27 16:33:48', 0, '2018-09-27 16:33:48', ''),
(22, 'spull', 'spull', '2018-09-25 17:11:11', '2018-09-25 17:24:50', 0, '2018-09-25 17:24:50', ''),
(23, 'spull', 'spull', '2018-09-25 17:11:19', '2018-09-25 17:24:42', 0, '2018-09-25 17:24:42', ''),
(24, 'assa', 'ss', '2018-10-09 14:52:36', '2018-10-09 14:52:36', 0, NULL, ''),
(25, 'tews', 'da', '2018-10-09 14:57:51', '2018-10-09 14:57:51', 0, NULL, ''),
(26, 'tews', 'da', '2018-10-09 14:59:38', '2018-10-09 14:59:45', 0, '2018-10-09 14:59:45', ''),
(27, 'newp', 'newpost', '2018-10-09 16:27:40', '2018-10-09 16:27:40', 0, NULL, ''),
(28, 'fs', 'da', '2018-10-09 16:34:51', '2018-10-09 16:34:51', 0, NULL, ''),
(30, 'ssssa', 'sadad', '2018-10-09 21:52:06', '2018-10-09 21:52:06', 0, NULL, 'perfectcircle.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'administrator', '2018-09-17 00:00:00', NULL),
(2, 2, 'subscriber', '2018-09-17 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2018-09-17 00:00:00', NULL),
(2, 2, 2, '2018-09-10 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

CREATE TABLE `taggables` (
  `id` int(10) UNSIGNED NOT NULL,
  `taggable_id` int(11) NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `role_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `country_id`, `role_id`) VALUES
(1, 'administrator', 'admin@admin', '2018-09-09 00:00:00', 'admin123', NULL, '2018-09-10 00:00:00', NULL, 1, '1'),
(2, 'demo creato', 'demo@admin', '2018-09-09 00:00:00', 'admin123', NULL, '2018-09-10 00:00:00', '2018-10-09 16:12:42', 3, '2'),
(3, 'giuseppe sanna', 'erlamaz@gmail.com', NULL, '$2y$10$6nuhCPEDYNt29XRUWeAomOneNUTewVD6MOHhcyivJjf2T8AfcMe7i', 'Ohlv7joGhCA87fYlvEGZMg1jAC6sLSLoUCx363QkBKezbmqIxswYZ8rt3M4n', '2018-10-10 09:21:32', '2018-10-10 09:21:32', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taggables`
--
ALTER TABLE `taggables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `taggables`
--
ALTER TABLE `taggables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

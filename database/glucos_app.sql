-- Adminer 4.8.1 MySQL 5.7.33 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2016_06_01_000001_create_oauth_auth_codes_table',	1),
(4,	'2016_06_01_000002_create_oauth_access_tokens_table',	1),
(5,	'2016_06_01_000003_create_oauth_refresh_tokens_table',	1),
(6,	'2016_06_01_000004_create_oauth_clients_table',	1),
(7,	'2016_06_01_000005_create_oauth_personal_access_clients_table',	1),
(8,	'2019_08_19_000000_create_failed_jobs_table',	1),
(9,	'2019_12_14_000001_create_personal_access_tokens_table',	1);

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1,	NULL,	'Laravel Personal Access Client',	'8PQmr9J87Nl5xWFtil3ErO0PgM5JxcLRDqH77gKK',	NULL,	'http://localhost',	1,	0,	0,	'2022-05-27 07:39:56',	'2022-05-27 07:39:56'),
(2,	NULL,	'Laravel Password Grant Client',	'SexMj1MELebUJEBWVhsRfxNQsc9mmfIl3cg0gNgZ',	'users',	'http://localhost',	0,	1,	0,	'2022-05-27 07:39:56',	'2022-05-27 07:39:56');

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1,	1,	'2022-05-27 07:39:56',	'2022-05-27 07:39:56');

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1,	'App\\Models\\User',	1,	'GlucosApp',	'6fca445ad6fb20b981d08bc1b5dce5cce5f26ea6552db2f5fb4569b5aeb9901d',	'[\"*\"]',	NULL,	'2022-05-27 08:36:05',	'2022-05-27 08:36:05'),
(2,	'App\\Models\\User',	1,	'GlucosApp',	'84e52f1b78044e8bd943060680acd339bdf6866062310345c218f5033d053790',	'[\"*\"]',	NULL,	'2022-05-27 08:49:08',	'2022-05-27 08:49:08'),
(3,	'App\\Models\\User',	1,	'herdi',	'0e3c82515f3b82b11d6244c2ac90273725eb3c29dd148e6cd3307d7eb876579c',	'[\"*\"]',	NULL,	'2022-05-27 08:53:19',	'2022-05-27 08:53:19'),
(4,	'App\\Models\\User',	2,	'GlucosApp',	'df13fed9c836a577297955f223f7d9ecc393d6eb0570797c8bccfaa3d04c433c',	'[\"*\"]',	NULL,	'2022-05-27 08:59:55',	'2022-05-27 08:59:55'),
(5,	'App\\Models\\User',	5,	'GlucosApp',	'7535842276cfc7d28d04f02466d643dfe65cc4877185b5a89d6261e7e6ececd4',	'[\"*\"]',	NULL,	'2022-05-27 09:01:28',	'2022-05-27 09:01:28'),
(6,	'App\\Models\\User',	2,	'herdi99',	'64abf3e5ee625a0221abf36854a2b89a8576c38f5446c86940af012becd8f572',	'[\"*\"]',	NULL,	'2022-05-27 09:03:01',	'2022-05-27 09:03:01'),
(7,	'App\\Models\\User',	6,	'GlucosApp',	'633ffdcf355077082b76d084d541f6139e3f565c453d83462c41c8ae45098e32',	'[\"*\"]',	NULL,	'2022-05-28 05:33:51',	'2022-05-28 05:33:51'),
(8,	'App\\Models\\User',	6,	'herdi88',	'a68c054b5d47bf14dbadc5bb3d543e3c9d81b404bf6189a7726493afbb21c173',	'[\"*\"]',	NULL,	'2022-05-28 05:35:28',	'2022-05-28 05:35:28'),
(9,	'App\\Models\\User',	6,	'herdi88',	'9b01b82cdf19f8506c2b7c5214bd4047a59adc2c6c43134fccc129706da3de7e',	'[\"*\"]',	NULL,	'2022-05-28 05:37:40',	'2022-05-28 05:37:40'),
(10,	'App\\Models\\User',	6,	'herdi88',	'227e48db69a22729a65d8b5583ad2202e0c1c59eb36b7cf226de26d5e7de93ae',	'[\"*\"]',	NULL,	'2022-05-28 05:47:26',	'2022-05-28 05:47:26'),
(11,	'App\\Models\\User',	6,	'herdi88',	'fff5de7ae1155a9cf0ceba6f5df5472fd16fc35e5f43c2381c9a08b6b87d115d',	'[\"*\"]',	NULL,	'2022-05-28 05:48:59',	'2022-05-28 05:48:59'),
(12,	'App\\Models\\User',	6,	'herdi88',	'0f93a243d881018ab87b97adbefbf4d7be2ff628b74f5a0651b11a2ad9b7c69f',	'[\"*\"]',	NULL,	'2022-05-28 05:50:40',	'2022-05-28 05:50:40'),
(13,	'App\\Models\\User',	6,	'herdi88',	'e9e8dcba217f6431e52fddbde8bcbadd3d25dac762ead16e312f1ac83fd1ecf7',	'[\"*\"]',	NULL,	'2022-05-28 05:58:15',	'2022-05-28 05:58:15'),
(14,	'App\\Models\\User',	6,	'herdi88',	'ef193a91d534582f40fad77c959724ccb98222fdced0252ba7b9b254c47a2753',	'[\"*\"]',	NULL,	'2022-05-28 05:58:27',	'2022-05-28 05:58:27'),
(15,	'App\\Models\\User',	6,	'herdi88',	'133252d6a50c2ba39633171b253027da53da82ec2054949476970388a2011d78',	'[\"*\"]',	NULL,	'2022-05-28 05:59:42',	'2022-05-28 05:59:42'),
(16,	'App\\Models\\User',	7,	'GlucosApp',	'3f254caa96b0748acb5fefe2a7044a24c3a5bee6b70cf6be4192fd3a5eeb199f',	'[\"*\"]',	NULL,	'2022-05-28 06:02:56',	'2022-05-28 06:02:56'),
(17,	'App\\Models\\User',	9,	'GlucosApp',	'd85825a22004b230e92a794f862e13aa0d997e7da0fd615a5ae55803daa136a8',	'[\"*\"]',	NULL,	'2022-05-28 07:09:43',	'2022-05-28 07:09:43'),
(18,	'App\\Models\\User',	12,	'GlucosApp',	'34d4a71e58dbd63cb7f95733337f62bd92b4aa703d262924883d1066ea2b4e28',	'[\"*\"]',	NULL,	'2022-05-28 07:14:26',	'2022-05-28 07:14:26'),
(19,	'App\\Models\\User',	13,	'GlucosApp',	'c3b60e732a9e4438d4838c08e6409894220e2e1124d8e44bb16171c99bd8d9e2',	'[\"*\"]',	NULL,	'2022-05-28 07:19:08',	'2022-05-28 07:19:08'),
(20,	'App\\Models\\User',	14,	'GlucosApp',	'b5b3c6b448d32f50f3bf5373b1916f3a1dd9c020d6e7cbfc2b949868ddbc0c69',	'[\"*\"]',	NULL,	'2022-05-28 07:19:17',	'2022-05-28 07:19:17'),
(21,	'App\\Models\\User',	15,	'GlucosApp',	'97237e79d11a201187941fe6aaca0de697da589e4a79853cc85339425d0bb491',	'[\"*\"]',	NULL,	'2022-05-28 07:20:25',	'2022-05-28 07:20:25');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'herdi',	'herdi2@gmail.com',	NULL,	'$2y$10$dAtlDTfL/r/E6FW03TAsQOgAXdU3nStWUP5Anp5eeH8mWq5pwv3fe',	NULL,	'2022-05-27 08:36:04',	'2022-05-27 08:36:04'),
(2,	'herdi99',	'herdi3@gmail.com',	NULL,	'$2y$10$Ri33rppqL9rs0.I5TWxB1.i.hB3NtTBthaemGhosonKjsSuRbjOLW',	NULL,	'2022-05-27 08:59:55',	'2022-05-27 08:59:55'),
(5,	'herdi88',	'herdi4@gmail.com',	NULL,	'$2y$10$xUqR8qt3udRy3T8adS3WEuWnQmYIdrAJnxcKUWZIn8hzWN0cQRpJ6',	NULL,	'2022-05-27 09:01:28',	'2022-05-27 09:01:28'),
(6,	'herdi88',	'herdi5@gmail.com',	NULL,	'$2y$10$UEgxqoH2Q7DrC2mafVUSc.KzhgPGsjC35br9QNmojFN1AS6ZxByka',	'5YQQgiI5rzkIVm7umIk9BwrmBG4N30dbeRJwFNgMMKubpqv4vQwq4up191bU',	'2022-05-28 05:33:50',	'2022-05-28 05:33:50'),
(7,	'dicoding',	'herdi55@gmail.com',	NULL,	'$2y$10$a92UG3J52XFYM1kf5dKTc.gnd4YXBAkDIPaWK6TSQh/DVPF61/efK',	'sCGxT8E9dcBarZnLBgpTLhOdD6sfRPdHBdLeqURUkCmVijLlRPTEujF9Gh5T',	'2022-05-28 06:02:56',	'2022-05-28 06:02:56'),
(9,	'dicoding',	'herdi58@gmail.com',	NULL,	'$2y$10$Xmj.tHgx1YNm.VuIAhxTjOImdKB0/xrW6mNdMA4SYfuL1KYeLEuF6',	NULL,	'2022-05-28 07:09:43',	'2022-05-28 07:09:43'),
(13,	'dicoding',	'herdi99@gmail.com',	NULL,	'$2y$10$yXN784hyCacyDEye10RE9OBGVrK0YuJBhzh8aEjI4KyaLSO0YqInm',	NULL,	'2022-05-28 07:19:08',	'2022-05-28 07:19:08'),
(15,	'dicoding',	'herdi9r@gmail.com',	NULL,	'$2y$10$VtWGOPflefdAjZ2nhyMCxeJBncN5DwoSjaOS1QZKtEPmv0AYYEGyi',	NULL,	'2022-05-28 07:20:25',	'2022-05-28 07:20:25');

-- 2022-05-28 15:34:47

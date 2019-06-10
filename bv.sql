-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2019 at 01:06 PM
-- Server version: 5.7.26-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dabv`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '4',
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_encrypt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `name`, `email`, `password`, `role_id`, `salt`, `key_encrypt`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'admin@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 4, NULL, NULL, NULL, NULL),
(3, 'admin2', 'admin2@gmail.com', '', 4, NULL, NULL, NULL, NULL),
(4, 'adminN', 'adminN@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 4, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pkcs12` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `certificate` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `valid_from_time` date NOT NULL,
  `valid_to_time` date NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `pkcs12`, `user_id`, `certificate`, `serial_number`, `type`, `valid_from_time`, `valid_to_time`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"cert\":\"-----BEGIN CERTIFICATE-----\\nMIIC1DCCAj2gAwIBAgIICWD4ConDWK0wDQYJKoZIhvcNAQELBQAwbjELMAkGA1UE\\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\\naWwuY29tMB4XDTE5MDYwODA4MzAwMloXDTIxMDYwNzA4MzAwMlowbjELMAkGA1UE\\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\\naWwuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDAcPZp+BWUYRynL9JZ\\nAviYf3KXsSi82RNV9S+zwIDXQMvrdzZv5cC6nzwdAiEtZhR3W7s9FzDbHAHd9i04\\no4L2yBofpRWeChy7++G7B7swuSD2fLOzQg6hE++nBrwkp+9Er+36ck+17Rm2acKl\\ncM3WXSGnlVpQg\\/XXf7ulNkI\\/xQIDAQABo3sweTAJBgNVHRMEAjAAMCwGCWCGSAGG\\n+EIBDQQfFh1PcGVuU1NMIEdlbmVyYXRlZCBDZXJ0aWZpY2F0ZTAdBgNVHQ4EFgQU\\nhDzZ9FT7PVxmWif4l0dRcNKSRtMwHwYDVR0jBBgwFoAUhDzZ9FT7PVxmWif4l0dR\\ncNKSRtMwDQYJKoZIhvcNAQELBQADgYEAIx10lIF8bHHHdUOz9qAsCxSqXiUQ+cw8\\nhnD9BDilC0OkE44asmnXVO\\/YQpJNYpwTFKUPUWpxhP7uCN2pAQpRmfbVQSaV3NeE\\nvDgcovUBZ6JFlpKh8iKf7xKeycBaWcgvl+9z6mbn+ju9JzXTIKE0gvchP9xm1q8b\\nZoavZxvM+PA=\\n-----END CERTIFICATE-----\\n\",\"pkey\":\"-----BEGIN PRIVATE KEY-----\\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMBw9mn4FZRhHKcv\\n0lkC+Jh\\/cpexKLzZE1X1L7PAgNdAy+t3Nm\\/lwLqfPB0CIS1mFHdbuz0XMNscAd32\\nLTijgvbIGh+lFZ4KHLv74bsHuzC5IPZ8s7NCDqET76cGvCSn70Sv7fpyT7XtGbZp\\nwqVwzdZdIaeVWlCD9dd\\/u6U2Qj\\/FAgMBAAECgYBKz18roNKaxQnDgJawHbSQa\\/Mb\\nPzaL+4NFxjQOF8a+ZyUe21AhPdqnceGHkV1ebbGFGPb3770BYKjlJZ88xmvRYLvj\\nWHbQRy41ScgNj63SRkbQSzANyLaQN6ifkRWwtQXlzSjyYtLU+32QRc1G13\\/jJ\\/G+\\n\\/TsF6IDa+CJknqe13QJBAO76mmwl8PvXzeID4TXpykEktb5Kykx7qJbdTcm5TrzI\\nH1AssX7unktS8fRYmOAiaofXajRLJ\\/xWyX6kISAE8YMCQQDOJdHjIePMf5ZUVYhP\\nhzRJXtnW37YJdMa6LUaU5AeZopxnxqznOoyPfj3HJDUC\\/dnIervBru9CZBtUESCy\\n6K8XAkEAuJlcL64fOGq63pugm8S8NxXkTdn36pya3e6U5\\/38lFcB2Sys7x\\/jpsur\\nmtPVQ01SfRwpLbvgZ0ui2fBupg0rgQJAONVMbCYnu3VhaJa8IdDQpXm07Px4H1tG\\nfoWE8\\/956O1f2Wx4trb5kYXoWkKtKsn5hL\\/xi5BC\\/jbDIgYm0aw8uQJASpPi7C1O\\noDFADb\\/OQe3ATXZY+0kW0BaBjda5u+bWaPNEohtTRTmgAe0qsOyBpKAgLypHVcaW\\ngrz\\/j38TSbwBqQ==\\n-----END PRIVATE KEY-----\\n\"}', 1, '-----BEGIN CERTIFICATE-----\nMIIC1DCCAj2gAwIBAgIICWD4ConDWK0wDQYJKoZIhvcNAQELBQAwbjELMAkGA1UE\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\naWwuY29tMB4XDTE5MDYwODA4MzAwMloXDTIxMDYwNzA4MzAwMlowbjELMAkGA1UE\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\naWwuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDAcPZp+BWUYRynL9JZ\nAviYf3KXsSi82RNV9S+zwIDXQMvrdzZv5cC6nzwdAiEtZhR3W7s9FzDbHAHd9i04\no4L2yBofpRWeChy7++G7B7swuSD2fLOzQg6hE++nBrwkp+9Er+36ck+17Rm2acKl\ncM3WXSGnlVpQg/XXf7ulNkI/xQIDAQABo3sweTAJBgNVHRMEAjAAMCwGCWCGSAGG\n+EIBDQQfFh1PcGVuU1NMIEdlbmVyYXRlZCBDZXJ0aWZpY2F0ZTAdBgNVHQ4EFgQU\nhDzZ9FT7PVxmWif4l0dRcNKSRtMwHwYDVR0jBBgwFoAUhDzZ9FT7PVxmWif4l0dR\ncNKSRtMwDQYJKoZIhvcNAQELBQADgYEAIx10lIF8bHHHdUOz9qAsCxSqXiUQ+cw8\nhnD9BDilC0OkE44asmnXVO/YQpJNYpwTFKUPUWpxhP7uCN2pAQpRmfbVQSaV3NeE\nvDgcovUBZ6JFlpKh8iKf7xKeycBaWcgvl+9z6mbn+ju9JzXTIKE0gvchP9xm1q8b\nZoavZxvM+PA=\n-----END CERTIFICATE-----\n', '0960F80A89C358AD', 0, '2019-06-08', '2021-06-07', 0, '2019-06-08 01:30:02', '2019-06-08 01:30:02', NULL),
(2, '{\"cert\":\"-----BEGIN CERTIFICATE-----\\nMIIC1DCCAj2gAwIBAgIICQDtODJgrj8wDQYJKoZIhvcNAQELBQAwbjELMAkGA1UE\\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\\naWwuY29tMB4XDTE5MDYwODA4MzAzOFoXDTIxMDYwNzA4MzAzOFowbjELMAkGA1UE\\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\\naWwuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCvkw\\/cdR+2IwZlbbAx\\nmDmYe2AyF2FkGcKW72ayJe9gnv+zWyj4LxCePmWiJHgCy7uuHT7CB\\/8IZo0UoBBj\\nPfrMhO7ej2VkaYUMCeQzC0z7oDwXjlXTpP3irytkjGwuz84i6BC8Qw1i\\/JjoN7sX\\nAm0\\/enp59zYDfyh4ye9Z7gUvqQIDAQABo3sweTAJBgNVHRMEAjAAMCwGCWCGSAGG\\n+EIBDQQfFh1PcGVuU1NMIEdlbmVyYXRlZCBDZXJ0aWZpY2F0ZTAdBgNVHQ4EFgQU\\nj8NOrtnmcBurz+yH6kld6HQ\\/D3YwHwYDVR0jBBgwFoAUj8NOrtnmcBurz+yH6kld\\n6HQ\\/D3YwDQYJKoZIhvcNAQELBQADgYEAAOYSce06kUT4rMezORdnw9x+EvIQ1e1L\\nT5Iq2Adu8uIHz7zq3\\/mG72lPZL6ZJQBXipd9JvoiUJD2Q1WXBsap04SBOrGcd9t3\\n4fMOar2Kch2KLKqf6gH9mFHdOteXP7YHj9miDLsr3FnEJ\\/o5q6lkeFXxiQVWJ2vk\\n4VX\\/pSvzp2E=\\n-----END CERTIFICATE-----\\n\",\"pkey\":\"-----BEGIN PRIVATE KEY-----\\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAK+TD9x1H7YjBmVt\\nsDGYOZh7YDIXYWQZwpbvZrIl72Ce\\/7NbKPgvEJ4+ZaIkeALLu64dPsIH\\/whmjRSg\\nEGM9+syE7t6PZWRphQwJ5DMLTPugPBeOVdOk\\/eKvK2SMbC7PziLoELxDDWL8mOg3\\nuxcCbT96enn3NgN\\/KHjJ71nuBS+pAgMBAAECgYEAg+a0rMek+j1X6c086BVXd7GA\\ndEFSXlRn9uKFwWJ0cp8gtErQ\\/ZrGHkv8KJLDQj5ykfzQkA5Xz6TTamJRzWzbw5k6\\n5SzCFyyKk3BdnvDQoi9P1vNStnyWg3+j37p5A+e1f92kh5hZEVwevhqmzI4WA0af\\n3DehwQlQGQd6GJcKCPECQQDfzM71Duhcp59SRALySJ2xoWeYdLBh3Mj+3poJx7RG\\nuMhHfJTUCccUeZgTfaCQqdZR+6UuNcm3oDl4VhVKa4uVAkEAyNX39QWYcRUaAh\\/n\\nJU5J+fhobesHPYIyRCMNZUQvqHySkt7iz4JYLSarVEt8G3f1SxEJysOAeOIRXge6\\nIfYuxQJAEAvkTufZu0L9hm1\\/9JVGUUUsY18CgpHNC5E0ZD0gbO201oNVPHrS\\/mHV\\niJg6WgUDa+9qIY0TwInJdRpe\\/m4FnQJAGJYRJ97KfbV+nJn5Oxjtd3uQlTw7g60n\\nqC2+WxJQ30h4zSAaFhs33jcorEYdaGN0FP99+mOam7HZPHCnubagnQJBAM4APyIN\\n5bmvcF5fj8zZ5Z4Ad4WAqmQWtEpAABednv+oxFtDvSUwmOJbzod2zZ7tLPgJGy9H\\nI+M1KQOldySYCbQ=\\n-----END PRIVATE KEY-----\\n\"}', 1, '-----BEGIN CERTIFICATE-----\nMIIC1DCCAj2gAwIBAgIICQDtODJgrj8wDQYJKoZIhvcNAQELBQAwbjELMAkGA1UE\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\naWwuY29tMB4XDTE5MDYwODA4MzAzOFoXDTIxMDYwNzA4MzAzOFowbjELMAkGA1UE\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\naWwuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCvkw/cdR+2IwZlbbAx\nmDmYe2AyF2FkGcKW72ayJe9gnv+zWyj4LxCePmWiJHgCy7uuHT7CB/8IZo0UoBBj\nPfrMhO7ej2VkaYUMCeQzC0z7oDwXjlXTpP3irytkjGwuz84i6BC8Qw1i/JjoN7sX\nAm0/enp59zYDfyh4ye9Z7gUvqQIDAQABo3sweTAJBgNVHRMEAjAAMCwGCWCGSAGG\n+EIBDQQfFh1PcGVuU1NMIEdlbmVyYXRlZCBDZXJ0aWZpY2F0ZTAdBgNVHQ4EFgQU\nj8NOrtnmcBurz+yH6kld6HQ/D3YwHwYDVR0jBBgwFoAUj8NOrtnmcBurz+yH6kld\n6HQ/D3YwDQYJKoZIhvcNAQELBQADgYEAAOYSce06kUT4rMezORdnw9x+EvIQ1e1L\nT5Iq2Adu8uIHz7zq3/mG72lPZL6ZJQBXipd9JvoiUJD2Q1WXBsap04SBOrGcd9t3\n4fMOar2Kch2KLKqf6gH9mFHdOteXP7YHj9miDLsr3FnEJ/o5q6lkeFXxiQVWJ2vk\n4VX/pSvzp2E=\n-----END CERTIFICATE-----\n', '0900ED383260AE3F', 0, '2019-06-08', '2021-06-07', 0, '2019-06-08 01:30:38', '2019-06-08 01:30:38', NULL),
(4, '{\"cert\":\"-----BEGIN CERTIFICATE-----\\nMIIDhzCCAvCgAwIBAgIIBxjwKRpzrvcwDQYJKoZIhvcNAQELBQAwbjELMAkGA1UE\\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\\naWwuY29tMB4XDTE5MDYxMDAyNDk0NFoXDTIxMDYwOTAyNDk0NFowgYQxCzAJBgNV\\nBAYTAlZOMRIwEAYDVQQIDAlIw6AgTuG7mWkxFzAVBgNVBAcMDkhhaSBCw6AgVHLG\\nsG5nMRgwFgYDVQQKDA9C4buHbmggdmnhu4duIDExEDAOBgNVBAMMB2J2MS5jb20x\\nHDAaBgkqhkiG9w0BCQEWDWJzMkBnbWFpbC5jb20wggEiMA0GCSqGSIb3DQEBAQUA\\nA4IBDwAwggEKAoIBAQDOGpHCNqVZ8dHqrzdauGZuAlUrKs3zeA4V0garlXuMTwNK\\nUqx\\/6p4QAVv08DwtOrNRTi0WErnIPUq8DPEMcG6Ra1D1Oh46nkU\\/fJRw\\/gzQw5ea\\nzdzclcc4lSId6d6pOcnq+t730B+ulmveGIs9RPbOQaa+C0H3Mq\\/YrtW0ucbhmg2H\\nUQ5D1BmBxoBX7KISL9ydtRAuLqQWrFn9VhXuA8sdMKa7u1e19B5w7Xs5LHyHtuOc\\nQ7hqvOUSE8\\/uU2a3wvNixF1lvd5SUW\\/7c3pcofovqc5nyw0Qp+NOfa\\/UIaDu+VFX\\ncpkT5ZRJ9fdpnRymAQuWytBn1LGUfF04gH9upE7TAgMBAAGjgZIwgY8wCQYDVR0T\\nBAIwADAsBglghkgBhvhCAQ0EHxYdT3BlblNTTCBHZW5lcmF0ZWQgQ2VydGlmaWNh\\ndGUwHQYDVR0OBBYEFNc3nTeklI10Y6\\/5YRhIe8Aa5Bo8MB8GA1UdIwQYMBaAFI\\/D\\nTq7Z5nAbq8\\/sh+pJXeh0Pw92MBQGA1UdJQEB\\/wQKMAgGBioDBAUGAjANBgkqhkiG\\n9w0BAQsFAAOBgQCgHH6sWu0WvbOFRehgjXgRulNH8kvM6CoJvsaIy2HPvJ2Cld10\\ng1EtnV05bVeDgUzm7tcCGvwbyYYiMxtJYg7+IQFBrSTVV6uH3PZLjQWdK6k7usJZ\\nCUtfwxqvT83mGpN\\/HM+\\/idX47Oh\\/J2NJNZpVEogFxuYydojDIida0w73wA==\\n-----END CERTIFICATE-----\\n\",\"pkey\":\"-----BEGIN PRIVATE KEY-----\\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDOGpHCNqVZ8dHq\\nrzdauGZuAlUrKs3zeA4V0garlXuMTwNKUqx\\/6p4QAVv08DwtOrNRTi0WErnIPUq8\\nDPEMcG6Ra1D1Oh46nkU\\/fJRw\\/gzQw5eazdzclcc4lSId6d6pOcnq+t730B+ulmve\\nGIs9RPbOQaa+C0H3Mq\\/YrtW0ucbhmg2HUQ5D1BmBxoBX7KISL9ydtRAuLqQWrFn9\\nVhXuA8sdMKa7u1e19B5w7Xs5LHyHtuOcQ7hqvOUSE8\\/uU2a3wvNixF1lvd5SUW\\/7\\nc3pcofovqc5nyw0Qp+NOfa\\/UIaDu+VFXcpkT5ZRJ9fdpnRymAQuWytBn1LGUfF04\\ngH9upE7TAgMBAAECggEAIUXAyi2wO\\/kB\\/nUS5p5mStQtk65xWSDEhVlGomSbcWdA\\nDLuUBYKGyeauRbiSvmp\\/kFyigrG7NExQyFL+hxePggJlK3Gad7QdUcZ24FbjEsDA\\ntMkPIr07UDMjMtkSjRc7NagSXsdGlhTKjSxBLj736QxIMt32ZEXWhZCUB30GUl0W\\nIxltlPkhWYdEjzYbr0WBK5qjnrUjytvfl+gzydakHS8ZkJ6OOszCCWa46VvmI0uB\\nLwswvo2K5fkpVwr6ZlPBn4z3DuMCzjCxUa7INGf+EnEuKQmYdQMcJnnB03Le4kWA\\njVcJwtypLkgNYteWkTrJ21khEpu84VNav0baHXEAIQKBgQDuQc3gkUwRUmdrnyxD\\n32qNeZ9oTZisNp9VL9cyU5f1rkDZTXuuUr0N1P927StCkYH8OvNMj91dyOuf69b4\\ndtpaJSiRodTfwdzu+3tTpul\\/HCBCVpvBc7sE4IRHAqxaNu2nAJpfYGQik42iwAME\\nPeoAfO5HsFLbweTfGXo6epHaHwKBgQDdc8ltzwSKM511KGDd04EQZYRNJ+YkyLvB\\ncdgJZbXsw1p9yEHRni64k\\/mTP5i1k9T6GFQB7bDwaFIc10\\/G+Z8jkK96LY0BoeOH\\nnuPgjzHjQaAuOjpjvxnxdUirklYmwHTmkYHRIDwk48VA8eC3HdJxpJS1V3m3skJq\\naO47jtrczQKBgDiW7J1gJV8f4WyQe+ULFbXQo2oUtCSDPMjw+f38GOXDo6d5Xd0D\\nzd+RLbRDlLjU8rjED7Gpofx6kmyDiaWuJSKwHLiqZXNYCm\\/Az4QI6wDD322iQJBs\\nOoloAkMTgXhT\\/5Jg9EmfDWmg\\/k0fqhfB1OiUw8vHN4b2wLO0y3FEV4wlAoGAC7+5\\n3xaNohts7itPQFWZUlpgc4t7XVY9B91XXeBEj6Qpp+S5ATsINYi8RACqxG9sbDxg\\nMJ4AtjCCsr8Fn4Pc2pExjiTeh0ikfqyCYIaYWftAWVODh4k7AiF70oZ4BaROT3FG\\n1uaD6l0fOPvcNTri0F6v+RMEBSfy+BxLD2Pb3r0CgYA8A9GL2A45HLRdFAKvTK5C\\nqnlY+BryUxEu2ABhZ2TENxvVkxJ9XADxjui8v9capijEu3UpLlq+Z2ReNFu0c4gy\\n9DknerMWqd94j2qVvnO2eZMyW1rkzdZQdQRneLZ0Pfg1EkDBoz9N984zwVjOW29f\\neUzvFZa3Un+etNRRbI7wpg==\\n-----END PRIVATE KEY-----\\n\"}', 4, '-----BEGIN CERTIFICATE-----\nMIIDhzCCAvCgAwIBAgIIBxjwKRpzrvcwDQYJKoZIhvcNAQELBQAwbjELMAkGA1UE\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\naWwuY29tMB4XDTE5MDYxMDAyNDk0NFoXDTIxMDYwOTAyNDk0NFowgYQxCzAJBgNV\nBAYTAlZOMRIwEAYDVQQIDAlIw6AgTuG7mWkxFzAVBgNVBAcMDkhhaSBCw6AgVHLG\nsG5nMRgwFgYDVQQKDA9C4buHbmggdmnhu4duIDExEDAOBgNVBAMMB2J2MS5jb20x\nHDAaBgkqhkiG9w0BCQEWDWJzMkBnbWFpbC5jb20wggEiMA0GCSqGSIb3DQEBAQUA\nA4IBDwAwggEKAoIBAQDOGpHCNqVZ8dHqrzdauGZuAlUrKs3zeA4V0garlXuMTwNK\nUqx/6p4QAVv08DwtOrNRTi0WErnIPUq8DPEMcG6Ra1D1Oh46nkU/fJRw/gzQw5ea\nzdzclcc4lSId6d6pOcnq+t730B+ulmveGIs9RPbOQaa+C0H3Mq/YrtW0ucbhmg2H\nUQ5D1BmBxoBX7KISL9ydtRAuLqQWrFn9VhXuA8sdMKa7u1e19B5w7Xs5LHyHtuOc\nQ7hqvOUSE8/uU2a3wvNixF1lvd5SUW/7c3pcofovqc5nyw0Qp+NOfa/UIaDu+VFX\ncpkT5ZRJ9fdpnRymAQuWytBn1LGUfF04gH9upE7TAgMBAAGjgZIwgY8wCQYDVR0T\nBAIwADAsBglghkgBhvhCAQ0EHxYdT3BlblNTTCBHZW5lcmF0ZWQgQ2VydGlmaWNh\ndGUwHQYDVR0OBBYEFNc3nTeklI10Y6/5YRhIe8Aa5Bo8MB8GA1UdIwQYMBaAFI/D\nTq7Z5nAbq8/sh+pJXeh0Pw92MBQGA1UdJQEB/wQKMAgGBioDBAUGAjANBgkqhkiG\n9w0BAQsFAAOBgQCgHH6sWu0WvbOFRehgjXgRulNH8kvM6CoJvsaIy2HPvJ2Cld10\ng1EtnV05bVeDgUzm7tcCGvwbyYYiMxtJYg7+IQFBrSTVV6uH3PZLjQWdK6k7usJZ\nCUtfwxqvT83mGpN/HM+/idX47Oh/J2NJNZpVEogFxuYydojDIida0w73wA==\n-----END CERTIFICATE-----\n', '0718F0291A73AEF7', 0, '2019-06-10', '2021-06-09', 0, '2019-06-09 19:49:44', '2019-06-09 19:49:44', NULL),
(6, '{\"cert\":\"-----BEGIN CERTIFICATE-----\\nMIIDhzCCAvCgAwIBAgIIAgpZ5AdYf3QwDQYJKoZIhvcNAQELBQAwbjELMAkGA1UE\\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\\naWwuY29tMB4XDTE5MDYxMDA1MzgwMVoXDTIxMDYwOTA1MzgwMVowgYQxCzAJBgNV\\nBAYTAlZOMRIwEAYDVQQIDAlIw6AgTuG7mWkxFzAVBgNVBAcMDkhhaSBCw6AgVHLG\\nsG5nMRgwFgYDVQQKDA9C4buHbmggdmnhu4duIDExEDAOBgNVBAMMB2J2MS5jb20x\\nHDAaBgkqhkiG9w0BCQEWDW52NUBnbWFpbC5jb20wggEiMA0GCSqGSIb3DQEBAQUA\\nA4IBDwAwggEKAoIBAQC9GzGBWVZOxRtqCuCGqoiFZ+70\\/Y9GXkSX1lpoEDGaB2xM\\nsxdS58hYqROKcQXyF5O2DkrVkSnei4eAiw9Fa8vzAx7aOJW6RfjtNVaTKrVhbEmw\\nJ6+c6lsypC25szl26S17fJBYTxwRMiQFRyPlEz8fIRfE53oufMSS7hmX9lQJs1hV\\nQujzxQxw\\/mzW0\\/3IiulTg\\/eUK34Xc4xnZMz8O58CtY2XpB2uJb7Gy\\/RA\\/XOXlMuL\\nbacff601lMCXoGjXQBc2it0xsKzM3XVgl\\/98A\\/VqdLxyzEWG+B8CcgFzfBKX3CeG\\nP1TU2Vxa6Q\\/pkvpx\\/PZ1USLNF8EcLlcVQjeCFIGtAgMBAAGjgZIwgY8wCQYDVR0T\\nBAIwADAsBglghkgBhvhCAQ0EHxYdT3BlblNTTCBHZW5lcmF0ZWQgQ2VydGlmaWNh\\ndGUwHQYDVR0OBBYEFNdHPm9gCPpumYuN637V1wbkufZ0MB8GA1UdIwQYMBaAFI\\/D\\nTq7Z5nAbq8\\/sh+pJXeh0Pw92MBQGA1UdJQEB\\/wQKMAgGBioDBAUGAjANBgkqhkiG\\n9w0BAQsFAAOBgQCstYOMivDejsOjXOX7VPvN4iSktGDaCNfntkIBjCAPcd6CW957\\nj7k8k2carFDlIFvVMLTIaXZgUVswh3vzvodZ6kPBpmvqE5upjD3oVVNKsZWHDH5Y\\nJxU7OaxJ+DNRQZgqHQLChFpaX+8BrfCRFson3YBu2mh0ZX+GB5U4Ni47Bg==\\n-----END CERTIFICATE-----\\n\",\"pkey\":\"-----BEGIN PRIVATE KEY-----\\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC9GzGBWVZOxRtq\\nCuCGqoiFZ+70\\/Y9GXkSX1lpoEDGaB2xMsxdS58hYqROKcQXyF5O2DkrVkSnei4eA\\niw9Fa8vzAx7aOJW6RfjtNVaTKrVhbEmwJ6+c6lsypC25szl26S17fJBYTxwRMiQF\\nRyPlEz8fIRfE53oufMSS7hmX9lQJs1hVQujzxQxw\\/mzW0\\/3IiulTg\\/eUK34Xc4xn\\nZMz8O58CtY2XpB2uJb7Gy\\/RA\\/XOXlMuLbacff601lMCXoGjXQBc2it0xsKzM3XVg\\nl\\/98A\\/VqdLxyzEWG+B8CcgFzfBKX3CeGP1TU2Vxa6Q\\/pkvpx\\/PZ1USLNF8EcLlcV\\nQjeCFIGtAgMBAAECggEANiBAbStq3qTgEdwHI8RPyw9Sf+DLT3LP4z3BJqPr7pBN\\nWS6xcFNTLr1GEIwFDaPd7W\\/tz277Mu1w3UPwHQibmXS9MeycPnKkqxBnNTw2Kipa\\ndQcG5rzVWYtQYyR\\/QB\\/BmuSuU\\/hgqjNVyATyqzB1Eq3gJcWzXPbtNLjdrncc2qFy\\ngVop2BVcwFnAb48yOev+Fbx1kVbcl02YaeKLIWVAdIaFHQdKyWpGnJUJkwl6jJl3\\nVA\\/1OrUX9dXloF3RwssQu2x27\\/f0olpanrfm1z81HpDm3rncopdnDbUW7VUR7y9p\\nVCPqM3TnhWDr0xJHpkN8bEybMUnr3JIve9z8obAnqQKBgQDmnU63FNZ3uOunf\\/EY\\npB0ZGXbS2aETED8\\/3uVidXvmYZ8KmTFeWOsGNP4CPxtwM3TUxKDGPs0ypa1Xq3pI\\nezVFOdaqwm7JfKpRxoTqNRgI8AfBnlzmqtWzkkbIb8txtjjPrKIzZ31QFC2VQ14m\\ncGoPb\\/vmGsfTp1UPejJByMGmTwKBgQDR7C\\/7W\\/s1BtAGF7QPTD\\/ZNeUjctSwU\\/SR\\nprpAFVw0ojGX4XuQ8vPq1dQVp1S2awfBF\\/xFskqOuHBiNEwXj+s4F1PXNW8wf9fn\\n5JwxKCjQXhDd5vVX3b6NUswlPz9rMEiwe6y2HJsWC0caoB4+zdyP8+CcxsSuEhg\\/\\noojluEaVQwKBgQCYQcHHpI1YrBGCHDmMwEWp3aMS4La1BGQOAlbGI7TyzP8ZGz16\\nAhDhnzkZOJsgAAkhtNRFLw+BYdtJZ6CrnBT2qJIvWYGVq6YzqXL1wqoktH0aezjw\\n3leLYIc1LIJQiDOIAX1xnOEibsANrVXK4StVF+Vi7cmC1xaUymPGBQq9hwKBgFZM\\nYJVXBPiRqmc2y2EWmZD0JRTjmig6+2n9Psglf9hrbTPhEGlQV5INAbk9JwgvC+sH\\nrz\\/\\/wcLWc+0LTtTI54wRmvf4EZPAmsPMKaHTvqOaaBixX98VW8bBaQdO7wVjvh4\\/\\nWYssS11OmZaKiKSNAMV1HruUwzpEWg+fA+RcUzf9AoGBAKk1RKVtiNWqzMRuECxY\\nhYz7NXwIEHemyhasXCuUFXUEQxqSS5SYSSOl+1XUuDUkt7dt6reGt1Yx8KL5bROK\\ncMEEll5ts3hAfEeTcmyEZx79sQExjkZPab\\/KlpUkfoCCNjjsJMbb9XS2jZ5j30Ko\\nYbTEUPv3GwftPPQ0AVJLwq8u\\n-----END PRIVATE KEY-----\\n\"}', 15, '-----BEGIN CERTIFICATE-----\nMIIDhzCCAvCgAwIBAgIIAgpZ5AdYf3QwDQYJKoZIhvcNAQELBQAwbjELMAkGA1UE\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\naWwuY29tMB4XDTE5MDYxMDA1MzgwMVoXDTIxMDYwOTA1MzgwMVowgYQxCzAJBgNV\nBAYTAlZOMRIwEAYDVQQIDAlIw6AgTuG7mWkxFzAVBgNVBAcMDkhhaSBCw6AgVHLG\nsG5nMRgwFgYDVQQKDA9C4buHbmggdmnhu4duIDExEDAOBgNVBAMMB2J2MS5jb20x\nHDAaBgkqhkiG9w0BCQEWDW52NUBnbWFpbC5jb20wggEiMA0GCSqGSIb3DQEBAQUA\nA4IBDwAwggEKAoIBAQC9GzGBWVZOxRtqCuCGqoiFZ+70/Y9GXkSX1lpoEDGaB2xM\nsxdS58hYqROKcQXyF5O2DkrVkSnei4eAiw9Fa8vzAx7aOJW6RfjtNVaTKrVhbEmw\nJ6+c6lsypC25szl26S17fJBYTxwRMiQFRyPlEz8fIRfE53oufMSS7hmX9lQJs1hV\nQujzxQxw/mzW0/3IiulTg/eUK34Xc4xnZMz8O58CtY2XpB2uJb7Gy/RA/XOXlMuL\nbacff601lMCXoGjXQBc2it0xsKzM3XVgl/98A/VqdLxyzEWG+B8CcgFzfBKX3CeG\nP1TU2Vxa6Q/pkvpx/PZ1USLNF8EcLlcVQjeCFIGtAgMBAAGjgZIwgY8wCQYDVR0T\nBAIwADAsBglghkgBhvhCAQ0EHxYdT3BlblNTTCBHZW5lcmF0ZWQgQ2VydGlmaWNh\ndGUwHQYDVR0OBBYEFNdHPm9gCPpumYuN637V1wbkufZ0MB8GA1UdIwQYMBaAFI/D\nTq7Z5nAbq8/sh+pJXeh0Pw92MBQGA1UdJQEB/wQKMAgGBioDBAUGAjANBgkqhkiG\n9w0BAQsFAAOBgQCstYOMivDejsOjXOX7VPvN4iSktGDaCNfntkIBjCAPcd6CW957\nj7k8k2carFDlIFvVMLTIaXZgUVswh3vzvodZ6kPBpmvqE5upjD3oVVNKsZWHDH5Y\nJxU7OaxJ+DNRQZgqHQLChFpaX+8BrfCRFson3YBu2mh0ZX+GB5U4Ni47Bg==\n-----END CERTIFICATE-----\n', '020A59E407587F74', 0, '2019-06-10', '2021-06-09', 0, '2019-06-09 22:38:01', '2019-06-09 22:38:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_role`
--

CREATE TABLE `client_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crequests`
--

CREATE TABLE `crequests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `request_of_user` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crequests`
--

INSERT INTO `crequests` (`id`, `user_id`, `request_of_user`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 4, '{\"_token\":\"tzD4n3cJ73LfGHzabR3mKl2JphwnoRLhJdAdUAwD\",\"message\":\"Y\\u00eau c\\u1ea7u c\\u1ea5p ch\\u1ee9ng th\\u01b0\",\"type\":\"0\",\"username\":\"b\\u00e1c s\\u0129 2\",\"password\":\"eyJpdiI6InYrUWFpckVtbmJHVUhBajhpdnlJOXc9PSIsInZhbHVlIjoiRFJ0a1ZHTVNxNzNQaUhxZUdcL1VnUFE9PSIsIm1hYyI6IjRiMWE4MzJkMDMzNjM1OTY3YzdjMzM4Y2EzOTJjMGI0NTVlNzFlZGZmYTIyZDM3OWQ3MmU1ZjQ3ZGQ0NmIwZWYifQ==\",\"email\":\"bs2@gmail.com\",\"common_name\":\"bv1.com\",\"organization\":\"B\\u1ec7nh vi\\u1ec7n 1\",\"country\":\"Vi\\u1ec7t Nam\",\"locality\":\"Hai B\\u00e0 Tr\\u01b0ng\",\"province\":\"H\\u00e0 N\\u1ed9i\",\"roles\":[\"1.2.3.4.5.6.2\"]}', 1, '2019-06-09 19:49:19', '2019-06-09 19:49:44', NULL),
(4, 15, '{\"_token\":\"gerr19xjD2dndNZdwax31Z561Ue4P0u61O5d4YDa\",\"message\":\"Y\\u00eau c\\u1ea7u c\\u1ea5p ch\\u1ee9ng th\\u01b0\",\"type\":\"0\",\"username\":\"nv5@gmail.com\",\"password\":\"eyJpdiI6IktoRVZrNHQ4cTlpaExBMlVBbkhKQnc9PSIsInZhbHVlIjoiWVlhZjgweDFjdXkwZjFBYXJsbHJxdz09IiwibWFjIjoiYzBjNTM2OTY2YzBjMWM3MGE3NjAwNjlkNzgwMzgwMDNiY2VmOGQwNGZmYjFjYzkzNDg3YjRjMTg3OTg3ZjAzMiJ9\",\"email\":\"nv5@gmail.com\",\"common_name\":\"bv1.com\",\"organization\":\"B\\u1ec7nh vi\\u1ec7n 1\",\"country\":\"Vi\\u1ec7t Nam\",\"locality\":\"Hai B\\u00e0 Tr\\u01b0ng\",\"province\":\"H\\u00e0 N\\u1ed9i\",\"roles\":[\"1.2.3.4.5.6.2\"]}', 1, '2019-06-09 22:37:40', '2019-06-09 22:38:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Nội Khoa', 'Có chức năng đặc biệt', NULL, NULL),
(2, 'Ngoại khoa', 'Cũng có chức năng đặc biệt', NULL, NULL),
(3, 'Khoa Xét ngiệm huyết học', 'xét ngiệm máu,lấy thông tin liên quan', NULL, NULL),
(4, 'Phòng siêu âm', 'Lấy kết quả siêu âm', NULL, NULL),
(5, 'Không', 'khoa dành cho nhân viên hành chính\n', '2017-08-16 02:36:56', '2017-08-16 02:36:56'),
(6, 'Phổi', 'khám các bệnh liên quan đến phổi\n', '2017-08-17 20:26:35', '2017-08-17 20:26:35'),
(7, 'Tai-Mũi-Họng', 'khám các bệnh đường về tai,mũi,hong', '2017-08-17 20:27:07', '2017-08-17 20:27:07');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(10) UNSIGNED NOT NULL,
  `doctor_id` int(10) UNSIGNED NOT NULL,
  `type` int(2) DEFAULT NULL,
  `khoa` int(3) DEFAULT NULL,
  `chucvu` int(3) NOT NULL DEFAULT '4',
  `bangcap` int(3) NOT NULL DEFAULT '4',
  `phongban` int(11) DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `doctor_id`, `type`, `khoa`, `chucvu`, `bangcap`, `phongban`, `fullname`, `avatar`) VALUES
(1, 1, 2, 6, 1, 1, NULL, '', 'default.jpg'),
(2, 4, 1, 6, 3, 2, 7, 'Bác Sĩ 2', 'default.jpg'),
(3, 7, 3, 3, 3, 3, NULL, '', 'default.jpg'),
(4, 10, NULL, 1, 1, 1, 1, '', 'default.jpg'),
(5, 13, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(6, 16, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(7, 19, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(8, 22, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(10, 28, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(11, 31, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(12, 34, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(13, 37, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(14, 40, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(15, 43, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(16, 46, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(17, 49, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(18, 52, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(19, 55, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(20, 58, NULL, NULL, 0, 0, NULL, '', 'default.jpg'),
(27, 102, NULL, 1, 1, 1, NULL, 'Bs24', 'default.jpg'),
(28, 115, NULL, 6, 3, 2, NULL, 'Trần Quang Đức', 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `key` longblob NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `key`, `path`) VALUES
(1, 0x5779a40e77bad0659abd706ccfcccc40ca2d1ef6eae137c363a8d7a8175fad609139ef11a298f530591b61a361cf2746484c1219b658aab9f9515f090000a926ef54eff3e49899471d8eb78ca8659538a0347f2c2d69651bf029416e91fe92edd0097934115e497dec4bc0eaa768c961626b7672cc40b473f8bc75e71d77dc4c1d55c266bd5a067555ff0b3c8fa6094ce8abe5719bbe3bc9b3ff115a2864e09bfdea6d2b983ec0c1732aa89d76b5f599fdc920c2bbb813afade0e4755cfa8018367808e6e421dcfbd00925243d79ba0e9e390f6a7f5d59a4f4f43b1433b96eb58d11e7750b14886e89bca7663f09d3e8566795b5b86f7d3f8c1517593e9af7f638746710696acd224bfdf4e574f1cf4d, '/upload/encrypt_1'),
(2, 0x31a3798627ae10ad775f408675db9219615a850cfab79c67336276c66954f2e1404b719e512b7441ef4dc4d7f2ca9d919c6e69035a8ae35816c8abe58ea6922e180eceede3c530c27523337e7288176952c65feb54234c3de80a86916835b0f6d33abcc91d8ecc98fe2a2b40464b6e8459d2c8356685b23213b7c33714696d6623e5652dad17d39b3d8b84838ece80c3d1a1633e3241e71ae55e7f8ebfc4d01635cc6a3ccac881b05b720cf8d8645ccbd0197e8888015ae6faa3cf387af51bb2096e47309cf4ee95607bc48487bdcc94e531167169e46e8561998d2f1312f140c6a98331534c6590d5b2e136f0b67fb9b8d2517b58313214f33c02813008f923bbc9846dd72c8fde2cf5c993122554fe, '/upload/encrypt_2'),
(3, 0x39cb92ef861f90c423a6c157567acb22d1e10ac793604cc3303aad6955513082b0380f7b26c8676aa4a00cc406d4d83113a49378d1cb4bdeb2d792db285331f486ba8dec118893d80d3058899c75863a85198ce6f6e9cac418f336627480b656960830a67497806b1415fa4da99eaa0b7fd23dcb55b6edf2befc21bbdf7c25aba36bbba514af1944ceade9af789e88b38f50e1c52cb385fb61705a5cfb9f5ab5570f44b3f6f0a92bfea8933466c68d535b57c2991a0d779c17730ae37004dcd7fd37410112515a326a72b3a6aad0e20d88137c1c3b2c88c2e2a29fe7a8bd5103101bcc39a1fc79f44f69e0a49dbccbe57e8a69aa2c6770d48f7bd8d672962c44758dc35287540acb53143fa1baa57b6e, '/upload/encrypt_3'),
(4, 0xf17082e43c326cb334f9225ba563698740eacc2dd4704a59f7c7741591377ead9a780e3bd3318195fb1746843208efb73716ca6ab88f972dc8c41062a739fa1b247dc1307f1ec46ae84d78add43a36e5905ab04f538b5f6728ffa8b09449b29aee27eed98dcbf2053837fbe0e41f734aac29581aa1cf1f0106bf417d17f9a3635e817b9e2106e429b2f7deaab57b0a5031e146caa3538b178451310337c9e21c2eeb4fa15e6a0f728b833a600c595448a3660346544575f64f7a5219f20ceafb419adb369826ee6eae613bd0caaf52c380ef27c5609e957054f37d32fbc7d62dc031947030e78018b1c12456fbf659c29cca122e46422d30da9a90eeb056cf3044881d686f43ae749f3a2c08ae566d0a, '/upload/encrypt_4');

-- --------------------------------------------------------

--
-- Table structure for table `medical_api_data`
--

CREATE TABLE `medical_api_data` (
  `id` int(11) NOT NULL,
  `medical_test_id` int(11) NOT NULL,
  `param` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `medical_api_data`
--

INSERT INTO `medical_api_data` (`id`, `medical_test_id`, `param`, `created_at`, `updated_at`) VALUES
(1, 121, 'PEF=8.27&FEV1=4.11&FVC=4.28', '2018-10-12 00:49:45', '2018-10-12 00:49:45'),
(2, 120, 'PEF=8.27&FEV1=4.11&FVC=4.58', '2018-10-12 01:50:54', '2018-10-12 01:50:54');

-- --------------------------------------------------------

--
-- Table structure for table `medical_applications`
--

CREATE TABLE `medical_applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `xml_key` blob NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `medical_date` date DEFAULT NULL,
  `Shift` smallint(6) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `medical_applications`
--

INSERT INTO `medical_applications` (`id`, `patient_id`, `date`, `status`, `url`, `xml_key`, `created_at`, `updated_at`, `medical_date`, `Shift`) VALUES
(1, 2, '2019-05-27 02:09:11', 1, '2019-05-27-2-d55ebf699bb5bd4.xml', 0x15e99337575d72343450a61731a74bc9741f6308443df5f837fad9a303de4ff7be37f6556d2e12e5363032a8179a78468f0a813c7fcb83e7d0e854df95ed95da58ae6cd624cb6fb7935b4588c1082bb30b053d609eebda7dccb7fd05e9c58a7d705693fdc28c7b4970b6ec03adc47fb187dce6bcf1ecb5dc2b9a4e9ada29674b8c1e730c4724cfc8fb37871595598aa9aad7bb35994edd8bde6333a0706feac2fc8fd6ef16d4223f1af1583c2e85180e74dfc21532e62120752b8da79a7acbff0647e663a0fd79a0750ad1873b26bee59be7a5ba202e8941c447f14d315d38fb21055b80c82ce3f785bb0dae84eda7c945fdcf75a58d8879d8da78fa71655417ef8cb61227fa7a32d108edb8024746fd, '2019-05-26 19:09:11', '2019-05-26 19:09:11', '2019-05-27', 1),
(2, 20, '2019-05-27 09:25:19', 1, '2019-05-27-9-0fc46898fd6224c.xml', 0xa8d7ed51c035d4314395b9aedc58facbaa9ce81f77a2934a79b7c6e9570b5aeca28df1af003b72c58912b837df07e61c6eecae8cf705a1635533011057e2f5d7924e64cb12f3dff666f75afe6a10dd245e1bf56877adf2026373191394e75ac56e9b37a21f28b07bf6433594e4e1a197cd932d02a037efa3a3e85523b1bda9dc4dbe102dcf0911740476ec6b72c0515a97e3aa9300ef0c9606b8f35f731dedf010c6cd12a3ce0002422db5c7e7e7c6dbe7da9ef1c1766eb9339a125e90a5f8cbd590a3c7614c581f14f6e7a3cedcf3b341f3012222af251d125d6c36b61737e9a02003472d450944cec68d87abf1128b0c8a1299aba129c4e2c5049c00385860f4a81c7b02c7ddf32f512a2eeb091ce5, '2019-05-27 02:25:19', '2019-05-27 02:25:19', '2019-05-27', 1),
(3, 8, '2019-05-27 09:25:50', 1, '2019-05-27-9-43335e50d3a4afb.xml', 0xc6fb46cffa1a62ce5b60ce787c2c39a58a073ea856cdebd0686f822df65af0cd84127713758bc2768bc403c03c55d2dbcd5ba77ce0a86b8565a6c07af8d6b23bc668db250cfcc45386035aad2a89f3ca866d654dda26f23a9c2d91ea74151b2d0bfc487c384b5c42e64b37fc2e6349e214b250ac2deeda5cf142c15de584dbf9d825f5bf0ae427ff01f79a2b660ab2aa18c0c0567d8ce8e905eed652314cce1d88165f02006efd27204d12321cc9da8e094e1d1ad923544c1de178a1f6a44861ffaf9be79454374fcb7715a217522359b60fca19ac5b19cdf06b9a01ac52242ada0b717ec46df636b7e073d5599fde3b650225c1e4eb3989e00cbbebd9ff668a9f5eb3350bde7ada62c4c2cb02881bfe, '2019-05-27 02:25:50', '2019-05-27 02:25:50', '2019-05-27', 1),
(4, 5, '2019-06-10 02:37:07', 0, '2019-06-10-5-f8d2494f9cb4953.xml', 0x69327b3ba56b66aef6be7174d1428ae3b8923a9641bafc6e2e235844357220823402a77aec6e6540e20fdab9cb9a9d69fe4ac391f0917bced832a3eddcbf4dfe590c33bad80f46dfde73c8512a339082488f7544a3bfbe2f29594f677db39fc555a37715f7b6b95bee51e33234c9d6d42d3419b070ba381e0dffc6734198617b5560ca8ade1ba72c8c9750dd32284b5f2ae8e2276d3c7d16cf11199a64334eb896451beb576ccd32768bca58fab7ace12e942131eec6abf2af1cdae0e677615d5aba0bff4b69e7beb69afb9f10d592112adea1debdedc85647f2193213fa5048813eb277663aafc3f38c3518b74419642db5ea0c127c437b9a833759afcd8cbef423848de6b6f5a391cb8a0f1e341c5b, '2019-06-09 19:37:07', '2019-06-09 21:21:57', '2019-06-10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `medical_specialist_applications`
--

CREATE TABLE `medical_specialist_applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `medical_type` int(3) DEFAULT NULL,
  `khoa` int(3) DEFAULT NULL,
  `phongban` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `xml_key` blob NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `medical_date` date DEFAULT NULL,
  `Shift` smallint(6) DEFAULT '1',
  `so_bo` mediumtext COLLATE utf8_unicode_ci,
  `chan_doan` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_specialist_type`
--

CREATE TABLE `medical_specialist_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `medical_specialist_type`
--

INSERT INTO `medical_specialist_type` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'khám chuyên khoa', NULL, NULL),
(2, 'khám bảo hiểm', NULL, NULL),
(3, 'khám trưởng khoa,phó khoa', '2017-08-16 01:31:43', '2017-08-16 01:31:43'),
(4, 'khám Giáo sư,Tiến sĩ', '2017-08-16 01:31:43', '2017-08-16 01:31:43');

-- --------------------------------------------------------

--
-- Table structure for table `medical_test_applications`
--

CREATE TABLE `medical_test_applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `xetnghiem` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `xml_key` blob NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `medical_date` date DEFAULT NULL,
  `Shift` smallint(6) DEFAULT '1',
  `register_by` smallint(6) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `medical_test_applications`
--

INSERT INTO `medical_test_applications` (`id`, `date`, `patient_id`, `status`, `xetnghiem`, `url`, `xml_key`, `created_at`, `updated_at`, `medical_date`, `Shift`, `register_by`) VALUES
(130, '2019-05-27 08:35:45', 33, 1, 4, '2019-05-27-9-1c2a710183233cc.xml', 0x41e0e4e78176a92c76215ec01f29e535cb053e4a8520f65b6d314af8a58dbd94050048f1ccb7acd5728d9b668e5c172675100d6439a8c8ad2933cf60c8f71c52c6ca8bc9940842ea362c7c5d59726bc131c2c67891729735b1ea2122f5db9163ec3403aa117c2fafc3fc8232a4ac8f01f224c56c7dd0764af5ac07e1f3c6a5ce37f0367aa0c28772bb6c728b01f7312d9aa71784a3978083e8c6d0d83c10eadcd59aebd83e6062cd43e185720b990aa525beb89121d1e74f3672d0076a2f9ae11de804420df33fd64c9034bb9f0106981e2a883c163c7e8e867b900f8358527f1e7cc182f97f349ee26c786586213d6db3d2cb1f692d260c775d1c03d3c8afe63ab1884078ff932a859b774958cf05d2, '2019-05-27 01:35:45', '2019-05-27 01:35:45', '2019-05-27', 1, 1),
(131, '2019-05-27 08:37:26', 14, 1, 4, '2019-05-27-9-3c82071ee4c8a48.xml', 0xde35bc875b2d5a11a5a36abf2711657f9603c16ec033041902309754232039532a5d252b534d695ff45472fe868becc80f0562cf09dbe3387a87e2313b731bceb6a7d146596f2eeb549d6e7b27d86bc30106a37a774d3bbbab5ea0e641a68030773612d7b07a367adca824b2e3d2c76cf20f6aa5e7fc20e4e2e7070004532c25ce10a00abd0297eb6e0bd2c584937ecf2863a5a5aff0c87af81af1aee4683cb8c36cd81a31da5e9f7c05675e2af30bcb5486d037ae6a9c0aa73933d48dcd4ffafcfb302f0318f28e1a5a6115b1724f1eff7791ab1f94d69c77a136ea0bebcd4f9a9cd1c313dcf73e1857e3256b9f10d9416539011bc2762bc4d03d54b999b786767c1c88a4c5587ea35860c30834f6d4, '2019-05-27 01:37:26', '2019-05-27 01:37:26', '2019-05-27', 1, 1),
(132, '2019-05-27 08:53:32', 20, 2, 4, '2019-05-27-9-1a3f59fe8c59f0c.xml', 0x2d3a6ab76abbc9b3be9aa6ba7cde7fce1ed3943a0758a168cfb98ca1d2605ab68d14596d40860e21204b24e12622402579945d0a04379b33e3b7ab3b82c49d42a44a3e34ac10c960c71e58a76575bae59d58824ae0229503a13aae4e38994f19b37fa93ac785b66a2b5a7f785213c3e3171eec1053b2de23722fc39e92c7f40a19c5c6cb933d1159651c232dc227f9077c866ae21fe8a5ce25f13b5efd9773a2c37ce573e90c873d229e8015a39f972912847032a0fdfa2e14ef45ff93bb5b4211dd8c06c1244e3397efbce0abddc473210dfef37a1e6f5df7025b3d10621999980027e1ed734fa05c0a54d2820cfca824f342f0b84ad083576017e2819badef4dd0854176c3d365b3e218df2999cafa, '2019-05-27 01:53:32', '2019-06-08 00:30:39', '2019-05-27', 1, 1),
(136, '2019-06-10 05:21:04', 5, 0, 4, '2019-06-10-5-d0babdb3debe808.xml', 0x9e4cb0ac2f693b15beb8dc33d024db715efb6f483ea26fe9f2c60a138109f23ae03457cff8f348f7132b7637ef670048fb56cc79f538630ac5b40a15bab59bb63cd108d4ef8420719b5f0d9d448c861629d3fb4dee3309f397d925ea38229a24c4b499b19e6cdb769401bd974ac8ab21815f954f3dfeb90e4eb49fc331b86e1968467f63792d6b5ea9d1eec8316086830cae89c7d4e1cef4b4396070467dd83be2b7425728653482bbdd2f2ae2b94ebc438ec61146aa60cea74a31da67afffd20ab3a729f27f6c8491155c41e8b2b0f0755dfd85c6b60a620fa7eadf1314af17910d85df298e123db4e5e61a08782966d2c8e1a5e5feda9a36b5d7980117065fb7d641a12b65103632130e5bc47f0922, '2019-06-09 22:21:04', '2019-06-09 22:55:59', '2019-06-10', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `medical_test_type`
--

CREATE TABLE `medical_test_type` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `khoa` int(3) NOT NULL,
  `phongban` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medical_test_type`
--

INSERT INTO `medical_test_type` (`id`, `name`, `khoa`, `phongban`, `created_at`, `updated_at`) VALUES
(1, 'Xét nghiệm máu', 3, 3, '2017-08-10 02:26:18', '2017-08-10 02:26:18'),
(2, 'Siêu âm', 4, 4, '2017-08-10 02:26:18', '2017-08-09 19:42:29'),
(3, 'Chụp X-Quang', 2, 5, '2017-08-16 00:48:52', '2017-08-16 00:48:52'),
(4, 'Đo phổi', 6, 9, '2017-08-29 08:38:35', '2017-08-29 08:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_10_17_075246_add_user_role_column', 1),
(4, '2016_10_17_080452_add_role_table', 1),
(5, '2016_10_26_164830_create_departments_table', 1),
(6, '2016_11_08_075145_create_medical_applications_table', 1),
(7, '2016_11_14_084947_add_patient_info', 1),
(8, '2016_11_16_075201_add_user_avatar', 1),
(9, '2016_11_30_032659_add_khoa_column_user', 1),
(10, '2017_03_02_060756_permission', 1),
(11, '2017_03_03_042455_add_cate_column_permission', 1),
(12, '2017_03_03_042935_create_role_permission_table', 1),
(13, '2017_03_06_050415_create_foreign_key_role_permission', 1),
(14, '2017_03_08_012904_create_user_role_table', 1),
(15, '2017_03_09_031756_add_column_users_table', 1),
(16, '2017_03_09_071651_create_share_table', 1),
(17, '2017_03_15_014734_add_scope_column_role_permission_table', 1),
(18, '2017_03_22_011624_rename_role_id_column_users_table', 1),
(19, '2017_03_22_025358_add_description_column_roles_table', 1),
(20, '2017_03_22_031657_rename_role_name_column_roles_table', 1),
(21, '2017_03_22_032026_rename_id_column_roles_table', 1),
(22, '2017_03_22_044918_add_time_stamp_column_roles_table', 1),
(23, '2017_03_23_011931_position', 1),
(24, '2017_03_29_032521_create_user_department_table', 1),
(25, '2017_03_29_034050_drop_khoa_column_users_table', 1),
(26, '2017_03_30_011732_create_foreign_key_position_users_table', 1),
(27, '2017_04_17_072453_create_hospital_table', 1),
(28, '2017_04_20_095117_create_oidcrequests_table', 1),
(29, '2017_04_20_095225_create_oidcproviders_table', 1),
(30, '2017_04_20_095332_create_oidcclients_table', 1),
(31, '2017_04_20_095605_create_doctors_table', 1),
(32, '2017_04_20_095650_create_staffs_table', 1),
(33, '2017_04_20_095750_create_patients_table', 1),
(34, '2017_04_20_095825_create_admins_table', 1),
(35, '2017_04_23_094330_add_khoa_column_user_table', 1),
(36, '2017_04_26_173242_create_client_role_table', 1),
(37, '2017_05_12_033338_add_column_to_openid_table', 1),
(38, '2017_05_12_070715_add_role_id_to_provider_table', 1),
(39, '2017_05_15_063111_add_role_id_to_request_table', 1),
(40, '2017_08_11_033314_create_medical_specialist_applications_table', 2),
(41, '2017_08_11_033331_create_medical_test_applications_table', 2),
(42, '2017_08_14_113358_add_column_tostaffs_table', 3),
(43, '2017_08_14_120111_add_column_to_doctors_table', 4),
(44, '2017_08_15_025511_add_column_to_applications_table', 5),
(45, '2017_08_16_012731_create_medical_specialist_type_table', 6),
(46, '2017_08_16_024438_add_column_name_and_avatar', 7),
(47, '2017_08_18_083645_add_column-medical', 8);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('8fa632c5-86e6-4669-bdfd-28c39c386d43', 'App\\Notifications\\SendRegisterCert', 'App\\User', 6, '{\"sender_id\":6,\"sender_name\":\"Hero\",\"sender_avatar\":\"spider-man.jpg\",\"request_id\":104,\"message\":\"Y\\u00eau c\\u1ea7u c\\u1ea5p ch\\u1ee9ng th\\u01b0\"}', '2019-05-31 08:35:07', '2019-05-31 08:34:45', '2019-05-31 08:35:07'),
('9d024a96-c0d9-40bb-b210-7c1ed00af78f', 'App\\Notifications\\SendRegisterCert', 'App\\User', 7, '{\"sender_id\":6,\"sender_name\":\"Hero\",\"sender_avatar\":\"spider-man.jpg\",\"request_id\":104,\"message\":\"Y\\u00eau c\\u1ea7u c\\u1ea5p ch\\u1ee9ng th\\u01b0\"}', NULL, '2019-05-31 08:34:45', '2019-05-31 08:34:45'),
('e80ce6db-a730-421a-b787-e8abf8599230', 'App\\Notifications\\SendRegisterCert', 'App\\User', 6, '{\"sender_id\":6,\"sender_name\":\"Hero\",\"sender_avatar\":\"spider-man.jpg\",\"request_id\":\"104\",\"message\":\"Y\\u00eau c\\u1ea7u \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c x\\u1eed l\\u00fd\"}', NULL, '2019-05-31 08:35:17', '2019-05-31 08:35:17');

-- --------------------------------------------------------

--
-- Table structure for table `oidcclients`
--

CREATE TABLE `oidcclients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `redirect_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `algorithm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `del_endpoint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oidcproviders`
--

CREATE TABLE `oidcproviders` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_endpoint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `authen_endpoint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `del_endpoint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `info_endpoint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_endpoint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_token_endpoint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `algorithm` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `max_age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oidcproviders`
--

INSERT INTO `oidcproviders` (`id`, `id_provider`, `name_provider`, `domain`, `registration_endpoint`, `authen_endpoint`, `del_endpoint`, `info_endpoint`, `session_endpoint`, `id_token_endpoint`, `client_id`, `key_secret`, `algorithm`, `max_age`, `role_id`) VALUES
(2, '2TsCzVb0vSLnbPW9Lepe3DQy8qAAARLJ', 'Bệnh viện 2', 'bv2.test', 'http://bv2.test/registration', 'http://bv2.test/authen', 'http://bv2.test/admin/remove-oidc', 'http://bv2.test/info-user', 'http://bv2.test/check-session-iframe', 'http://bv2.test/token', 'Fl31nFYaIQxg7lOOmNWTM20nWCnvmMfX', 'OomBnM9DZMm8UfEJPxgBMVIqNDE179Pr', 'HS256', '2', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oidcrequests`
--

CREATE TABLE `oidcrequests` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_callback` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_rp_get_result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_rp_delete` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `algorithm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contacts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isAccept` tinyint(4) NOT NULL DEFAULT '-1',
  `request_type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oidcrequests`
--

INSERT INTO `oidcrequests` (`id`, `domain`, `company`, `url_callback`, `url_rp_get_result`, `url_rp_delete`, `algorithm`, `max_age`, `contacts`, `isAccept`, `request_type`, `status`, `role_id`) VALUES
(10, 'bv2.test/registration', NULL, NULL, NULL, NULL, NULL, NULL, NULL, -1, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('Nam','Nữ','','') COLLATE utf8_unicode_ci DEFAULT 'Nam',
  `birthday` date DEFAULT NULL,
  `id_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_date` datetime DEFAULT NULL,
  `id_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permanent_residence` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staying_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family_history` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `personal_history` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `patient_id`, `url`, `gender`, `birthday`, `id_number`, `id_date`, `id_address`, `permanent_residence`, `staying_address`, `job`, `company`, `family_history`, `personal_history`, `fullname`, `avatar`) VALUES
(2, 5, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân2', 'default.jpg'),
(3, 8, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân3', 'default.jpg'),
(4, 11, NULL, 'Nam', '1999-08-13', NULL, NULL, NULL, 'Hà Nội', 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân4', 'default.jpg'),
(5, 14, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân5', 'default.jpg'),
(6, 20, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân7', 'default.jpg'),
(8, 23, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân8', 'default.jpg'),
(9, 26, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân9', 'default.jpg'),
(10, 29, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân10', 'default.jpg'),
(11, 2, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, 'Hà nội', 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân1', 'default.jpg'),
(12, 32, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân11', 'default.jpg'),
(13, 35, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân12', 'default.jpg'),
(14, 38, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân13', 'default.jpg'),
(15, 41, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân14', 'default.jpg'),
(16, 47, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân16', 'default.jpg'),
(17, 50, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân17', 'default.jpg'),
(18, 53, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân18', 'default.jpg'),
(19, 56, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân19', 'default.jpg'),
(20, 59, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'Bệnh nhân20', 'default.jpg'),
(21, 103, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, 'ha noi', NULL, NULL, '1', '1', 'bệnh nhân mới', 'default.jpg'),
(22, 117, NULL, 'Nam', '1991-08-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'Trương Tiến Dũng', 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`, `created_at`, `updated_at`, `cate`) VALUES
(1, 'khám thể lực', NULL, NULL, NULL),
(2, 'khám nội khoa', NULL, NULL, NULL),
(3, 'khám mắt', NULL, NULL, NULL),
(4, 'khám tai mũi họng', NULL, NULL, NULL),
(5, 'khám răng hàm mặt', NULL, NULL, NULL),
(6, 'khám da liễu', NULL, NULL, NULL),
(7, 'khám cận lâm sàng', NULL, NULL, NULL),
(8, 'khám tổng quan', NULL, NULL, NULL),
(9, 'xem', NULL, NULL, NULL),
(10, 'Sửa', NULL, NULL, NULL),
(11, 'Xóa', NULL, NULL, NULL),
(12, 'Chia sẻ', NULL, NULL, NULL),
(13, 'Tạo mới hồ sơ bệnh nhân', NULL, NULL, NULL),
(14, 'Khám chuyên khoa phổi', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Bệnh nhân', 'Người đến khám bệnh trong bệnh viện', NULL, NULL),
(2, 'Bác sĩ', 'Người khám bệnh cho bệnh nhân', NULL, NULL),
(3, 'Nhân viên', 'Người thực hiện các công vụ trong bệnh viện', NULL, NULL),
(4, 'Admin', 'Người quản lý trang của bệnh viện', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'role bệnh nhân', 'role này là role của các bệnh nhân', '2017-08-08 17:52:51', '2017-08-08 17:52:51'),
(2, 'role nhân viên', 'role này quản lý các nhân viên', '2017-08-08 17:52:51', '2017-08-08 17:52:51'),
(3, 'role bác sĩ', 'role này là role của bác sĩ', '2017-08-08 20:12:32', '2017-08-08 20:12:32'),
(4, 'Bác sĩ bệnh viện khác', 'Vai cho bác sĩ bệnh viên khác', '2018-07-12 20:49:34', '2018-07-12 20:49:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `permission_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `scope` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`, `scope`) VALUES
(1, 1, 9, '2017-08-08 17:52:51', '2017-08-08 17:52:51', NULL),
(2, 2, 13, '2017-08-08 17:52:51', '2017-08-08 17:52:51', NULL),
(6, 3, 12, '2017-09-27 05:56:34', '2017-09-27 05:56:34', NULL),
(7, 3, 10, '2017-09-27 05:56:34', '2017-09-27 05:56:34', NULL),
(8, 3, 9, '2017-09-27 05:56:34', '2017-09-27 05:56:34', NULL),
(9, 3, 8, '2017-09-27 05:56:34', '2017-09-27 05:56:34', NULL),
(10, 3, 7, '2017-09-27 05:56:34', '2017-09-27 05:56:34', NULL),
(11, 3, 6, '2017-09-27 05:56:34', '2017-09-27 05:56:34', NULL),
(12, 3, 5, '2017-09-27 05:56:34', '2017-09-27 05:56:34', NULL),
(13, 3, 4, '2017-09-27 05:56:34', '2017-09-27 05:56:34', NULL),
(14, 3, 3, '2017-09-27 05:56:34', '2017-09-27 05:56:34', NULL),
(15, 3, 2, '2017-09-27 05:56:34', '2017-09-27 05:56:34', NULL),
(16, 3, 1, '2017-09-27 05:56:35', '2017-09-27 05:56:35', NULL),
(17, 4, 9, '2018-07-12 20:49:34', '2018-07-12 20:49:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `share`
--

CREATE TABLE `share` (
  `id` int(10) UNSIGNED NOT NULL,
  `resource_owner` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `resource_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `phongban` int(11) DEFAULT NULL,
  `khoa` int(11) DEFAULT NULL,
  `chucvu` int(11) DEFAULT NULL,
  `bangcap` int(11) DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `staff_id`, `phongban`, `khoa`, `chucvu`, `bangcap`, `fullname`, `avatar`) VALUES
(1, 3, 5, 4, 7, 4, 'Nhân viên1', 'default.jpg'),
(2, 6, 4, 4, 7, 3, 'Nhân viên2', 'default.jpg'),
(3, 9, 6, 5, 11, 5, 'Nhân viên3', 'default.jpg'),
(4, 12, 3, 3, 7, 3, '', 'default.jpg'),
(5, 15, 9, 6, 7, 3, 'Nhân viên5', 'default.jpg'),
(6, 18, NULL, 0, 0, 0, '', 'default.jpg'),
(7, 21, NULL, 0, 0, 0, '', 'default.jpg'),
(9, 27, NULL, 0, 0, 0, '', 'default.jpg'),
(10, 30, NULL, 0, 0, 0, '', 'default.jpg'),
(11, 33, NULL, 0, 0, 0, '', 'default.jpg'),
(12, 36, NULL, 0, 0, 0, '', 'default.jpg'),
(13, 39, NULL, 0, 0, 0, '', 'default.jpg'),
(14, 42, NULL, 0, 0, 0, '', 'default.jpg'),
(15, 45, NULL, 0, 0, 0, '', 'default.jpg'),
(16, 48, NULL, 0, 0, 0, '', 'default.jpg'),
(17, 51, NULL, 0, 0, 0, '', 'default.jpg'),
(18, 54, NULL, 0, 0, 0, '', 'default.jpg'),
(19, 57, NULL, 0, 0, 0, '', 'default.jpg'),
(20, 60, NULL, 0, 0, 0, '', 'default.jpg'),
(23, 94, 1, 1, 7, 1, '', 'default.jpg'),
(24, 95, 3, 1, 7, 3, '', 'default.jpg'),
(25, 116, 6, 1, 11, 3, 'Bùi Trọng Tùng', 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `position` int(10) UNSIGNED DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_local` tinyint(1) NOT NULL DEFAULT '1',
  `last_auth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expired` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `position`, `domain`, `is_local`, `last_auth`, `expired`) VALUES
(1, 'Bác Sĩ 1', 'bs1@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'mnpBqwgvIr1tRevKNi0e4RieQDawlcPc1PZpITZ3A2QvqaTMK2hAWlAdQOLp', '2017-08-08 17:52:51', '2019-06-08 00:38:32', 2, NULL, 1, NULL, NULL),
(2, 'Bệnh nhân1', 'bn1@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'rUZvJ4kBAEXylPJ1akkSafrSkeqcwoRt6TyeXN18qecHEXEKn91iafBe2uw2', '2017-08-08 17:52:52', '2019-05-26 19:09:28', 1, NULL, 1, NULL, NULL),
(3, 'Nhân viên1', 'nv1@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'mbTaEIAUEpu0OgEDTlIdRldpUtSSTOClsoAHGSuE9T25XdC8TVhT2h0eVREM', '2017-08-08 17:52:52', '2017-10-26 20:53:06', 3, NULL, 1, NULL, NULL),
(4, 'Bác Sĩ 2', 'bs2@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'GKHmSEvHcyIj1q0aKVZjTXz5NWFz4g3GSXqUxss1ItwWd5Wq9xFzgxeOoJUv', '2017-08-08 17:52:52', '2019-06-04 22:48:34', 2, NULL, 1, NULL, NULL),
(5, 'Bệnh nhân2', 'bn2@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'bIHnbfXi6LiS3t0HuHEXHmVrRw3dWxfPGqNzZGRKEFYzQXamn755yJaEgdA9', '2017-08-08 17:52:52', '2018-07-16 19:32:12', 1, NULL, 1, NULL, NULL),
(6, 'Nhân viên2', 'nv2@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'XoanrwV5IKCbpzL204YiPSKdcXhGc8eDjzSFvYtmWx894RPjAfEVbkdGwmin', '2017-08-08 17:52:52', '2018-10-11 17:52:28', 3, NULL, 1, NULL, NULL),
(7, 'Bác Sĩ 3', 'bs3@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'i0j3verGDzrwlCIc0G7UjJGHcsrBhzcxQGeVBoNhm5rVQF7G3lzxzfKJC0kM', '2017-08-08 17:52:52', '2017-08-10 02:31:03', 2, NULL, 1, NULL, NULL),
(8, 'Bệnh nhân3', 'bn3@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'lHUShG1VCXIMx8akFv2molLqQmG3JLA1gyCPJgpbWXM4Cew2FLq2fUJSkJrb', '2017-08-08 17:52:52', '2017-08-29 02:24:21', 1, NULL, 1, NULL, NULL),
(9, 'Nhân viên3', 'nv3@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'KIKyHXWQVgw4HlrnJ8SrBVaRInWR3n3yIRe2b4KIhwPsUYSI4JxZbiUItcjA', '2017-08-08 17:52:52', '2017-10-26 20:52:46', 3, NULL, 1, NULL, NULL),
(10, 'Bác Sĩ 4', 'bs4@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, '2017-08-08 17:52:52', '2017-08-14 18:08:47', 2, NULL, 1, NULL, NULL),
(11, 'Bệnh nhân4', 'bn4@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0p6v2KwhHxKY5OJRjB3l8VlpmkFn9Xz6ZI2Ym9u6L3SGanTaFI9cfRH0wgI7', '2017-08-08 17:52:52', '2017-08-31 20:17:22', 1, NULL, 1, NULL, NULL),
(12, 'Nhân viên4', 'nv4@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'KQ8Yghzt3GJHpQ1BB1QXIA5fCWaT1aVBgSaDS0qEIK23CS54yiJoMA7hrVRZ', '2017-08-08 17:52:53', '2017-10-26 20:53:24', 3, NULL, 1, NULL, NULL),
(13, 'Bác Sĩ 5', 'bs5@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'PTKLG33EVQHFVC9kwgZDx7w6BgQZnkOrmk7yloMvQEoVCPKCAK0TTxr4Hxcl', '2017-08-08 17:52:53', '2017-10-25 01:56:38', 2, NULL, 1, NULL, NULL),
(14, 'Bệnh nhân5', 'bn5@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'v3TnURD1U6s9OBKKDHNxPCz8Z1gbEdft4XurF6VXIhhE6n9ePGRix6lmWC3K', '2017-08-08 17:52:53', '2017-08-15 23:37:03', 1, NULL, 1, NULL, NULL),
(15, 'Nhân viên5', 'nv5@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '4cEiYgaOEG1gih4qDL76TCmx1u4g9i87NFJ5yOOaJG1pBLtKIRgyFKTOQivV', '2017-08-08 17:52:53', '2019-06-08 00:34:56', 3, NULL, 1, NULL, NULL),
(16, 'Bác Sĩ 6', 'bs6@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:53', '2017-08-08 17:52:53', 2, NULL, 1, NULL, NULL),
(17, 'Bệnh nhân6', 'bn6@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'SpUnCxvngpdJ6WcX4mSkfuFmVFo4ym0HN6aJv5LSoEnEX5b1zv4tQyGW4g69', '2017-08-08 17:52:53', '2017-08-29 01:59:14', 1, NULL, 1, NULL, NULL),
(18, 'Nhân viên6', 'nv6@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Too65Hm2bSrXcCjzlMk6nMaLmhU7TPjVzXxWwrgZHjHtD1EFD8cZTeU2WyAj', '2017-08-08 17:52:53', '2019-03-20 19:41:55', 3, NULL, 1, NULL, NULL),
(19, 'Bác Sĩ 7', 'bs7@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'fOPQ5vRsZZtu8n6xbveXiv92yRMb3QUt7Ga1Vr8933syBRsyvMdRz7zFdz66', '2017-08-08 17:52:53', '2019-06-06 18:34:04', 2, NULL, 1, NULL, NULL),
(20, 'Bệnh nhân7', 'bn7@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'gzhC9TFLGmBtMNcjXyS55Suh89IB3OfYoq1NP72tOSFsXacvvYb022EUDuyi', '2017-08-08 17:52:53', '2017-08-29 00:29:10', 1, NULL, 1, NULL, NULL),
(21, 'Nhân viên7', 'nv7@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:53', '2017-08-08 17:52:53', 3, NULL, 1, NULL, NULL),
(22, 'Bác Sĩ 8', 'bs8@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:53', '2017-08-08 17:52:53', 2, NULL, 1, NULL, NULL),
(23, 'Bệnh nhân8', 'bn8@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'nz8JQNDqTuonzsMrTvnSvTskgLtrAGug2mO5hHqKRFIfdirwJ9rfsjyZzntn', '2017-08-08 17:52:53', '2017-10-25 01:58:55', 1, NULL, 1, NULL, NULL),
(26, 'Bệnh nhân9', 'bn9@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'POxhXXoDbZ8TJJ9TaTFusWdIeNDl1jvyQaaqDlPORtVH48AYxubmmVmxD0Ph', '2017-08-08 17:52:54', '2018-09-30 20:52:08', 1, NULL, 1, NULL, NULL),
(27, 'Nhân viên9', 'nv9@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:54', '2017-08-08 17:52:54', 3, NULL, 1, NULL, NULL),
(28, 'Bác Sĩ 10', 'bs10@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:54', '2017-08-08 17:52:54', 2, NULL, 1, NULL, NULL),
(29, 'Bệnh nhân10', 'bn10@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:54', '2017-08-16 21:02:01', 1, NULL, 1, NULL, NULL),
(30, 'Nhân viên10', 'nv10@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:54', '2017-08-08 17:52:54', 3, NULL, 1, NULL, NULL),
(31, 'Bác Sĩ 11', 'bs11@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:54', '2017-08-08 17:52:54', 2, NULL, 1, NULL, NULL),
(32, 'Bệnh nhân11', 'bn11@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, '2017-08-08 17:52:54', '2017-08-15 20:34:20', 1, NULL, 1, NULL, NULL),
(33, 'Nhân viên11', 'nv11@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:54', '2017-08-08 17:52:54', 3, NULL, 1, NULL, NULL),
(34, 'Bác Sĩ 12', 'bs12@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:54', '2017-08-08 17:52:54', 2, NULL, 1, NULL, NULL),
(35, 'Bệnh nhân12', 'bn12@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, '2017-08-08 17:52:54', '2017-08-15 20:34:22', 1, NULL, 1, NULL, NULL),
(36, 'Nhân viên12', 'nv12@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:54', '2017-08-08 17:52:54', 3, NULL, 1, NULL, NULL),
(37, 'Bác Sĩ 13', 'bs13@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:55', '2017-08-08 17:52:55', 2, NULL, 1, NULL, NULL),
(38, 'Bệnh nhân13', 'bn13@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, '2017-08-08 17:52:55', '2017-08-15 20:34:24', 1, NULL, 1, NULL, NULL),
(39, 'Nhân viên13', 'nv13@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:55', '2017-08-08 17:52:55', 3, NULL, 1, NULL, NULL),
(40, 'Bác Sĩ 14', 'bs14@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:55', '2017-08-08 17:52:55', 2, NULL, 1, NULL, NULL),
(41, 'Bệnh nhân14', 'bn14@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, '2017-08-08 17:52:55', '2017-08-15 20:34:26', 1, NULL, 1, NULL, NULL),
(42, 'Nhân viên14', 'nv14@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:55', '2017-08-08 17:52:55', 3, NULL, 1, NULL, NULL),
(43, 'Bác Sĩ 15', 'bs15@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:55', '2017-08-08 17:52:55', 2, NULL, 1, NULL, NULL),
(44, 'Bệnh nhân15', 'bn15@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:55', '2017-08-08 17:52:55', 1, NULL, 1, NULL, NULL),
(45, 'Nhân viên15', 'nv15@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:55', '2017-08-08 17:52:55', 3, NULL, 1, NULL, NULL),
(46, 'Bác Sĩ 16', 'bs16@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:55', '2017-08-08 17:52:55', 2, NULL, 1, NULL, NULL),
(47, 'Bệnh nhân16', 'bn16@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, '2017-08-08 17:52:55', '2017-08-15 20:34:28', 1, NULL, 1, NULL, NULL),
(48, 'Nhân viên16', 'nv16@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:55', '2017-08-08 17:52:55', 3, NULL, 1, NULL, NULL),
(49, 'Bác Sĩ 17', 'bs17@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:56', '2017-08-08 17:52:56', 2, NULL, 1, NULL, NULL),
(50, 'Bệnh nhân17', 'bn17@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, '2017-08-08 17:52:56', '2017-08-15 20:34:30', 1, NULL, 1, NULL, NULL),
(51, 'Nhân viên17', 'nv17@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:56', '2017-08-08 17:52:56', 3, NULL, 1, NULL, NULL),
(52, 'Bác Sĩ 18', 'bs18@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:56', '2017-08-08 17:52:56', 2, NULL, 1, NULL, NULL),
(53, 'Bệnh nhân18', 'bn18@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, '2017-08-08 17:52:56', '2017-08-15 20:34:32', 1, NULL, 1, NULL, NULL),
(54, 'Nhân viên18', 'nv18@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:56', '2017-08-08 17:52:56', 3, NULL, 1, NULL, NULL),
(55, 'Bác Sĩ 19', 'bs19@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:56', '2017-08-08 17:52:56', 2, NULL, 1, NULL, NULL),
(56, 'Bệnh nhân19', 'bn19@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, '2017-08-08 17:52:56', '2017-08-15 20:34:34', 1, NULL, 1, NULL, NULL),
(57, 'Nhân viên19', 'nv19@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:56', '2017-08-08 17:52:56', 3, NULL, 1, NULL, NULL),
(58, 'Bác Sĩ 20', 'bs20@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', 'Rcr2KGUqLGVlHBg8sj5Cx6Dor508SMDpVNtWrlRag4fgcw3gVBxJifkjyaaq', '2017-08-08 17:52:56', '2017-08-09 23:05:00', 2, NULL, 1, NULL, NULL),
(59, 'Bệnh nhân20', 'bn20@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, '2017-08-08 17:52:56', '2017-08-15 20:27:41', 1, NULL, 1, NULL, NULL),
(60, 'Nhân viên20', 'nv20@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-08 17:52:56', '2017-08-08 17:52:56', 3, NULL, 1, NULL, NULL),
(62, 'admin1', 'ad1@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'XSL8jRtkVJgrbqxtrED75ijYoRxCQQdkb3KmhryLFtM16deWiikACvQoMy3L', '2017-08-08 19:32:29', '2017-08-16 01:02:08', 4, NULL, 1, NULL, NULL),
(94, 'nv21', 'nv21@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, '2017-08-10 20:27:34', '2017-08-10 20:28:31', 3, NULL, 1, NULL, NULL),
(95, 'nv22', 'nv22@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, '2017-08-14 18:15:18', '2017-08-14 18:17:32', 3, NULL, 1, NULL, NULL),
(102, 'Bs24', 'bs24@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2017-08-16 00:29:57', '2017-08-16 00:29:57', 2, NULL, 1, NULL, NULL),
(103, 'bệnh nhân mới', 'bnm@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'qXzJm4ziMilDx1DDCPbQOohpXpiZtdcHDTYTKXj0JgQvRfXJtT8do1jbwxQl', '2017-08-23 19:58:44', '2017-08-23 20:02:19', 1, NULL, 1, NULL, NULL),
(115, 'Trần Quang Đức', 'ductq@soict.hust.edu.vn', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '2018-07-16 17:24:05', '2018-07-16 17:24:05', 2, NULL, 1, NULL, NULL),
(116, 'Bùi Trọng Tùng', 'tungbt@soict.hust.edu.vn', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'xx8CsVC5cmB2DpbyvzJ6lA3Q18oZW9mUQUk5Pmkpy1GMrzo5qkny9leVPkmG', '2018-07-16 17:26:02', '2018-07-16 17:45:20', 3, NULL, 1, NULL, NULL),
(117, 'Trương Tiến Dũng', 'dungtt@soict.hust.edu.vn', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'VN6JTJHcUHhBsYgE9iujMNpkGKlAI6jHJUBt55gXbne0E6xr15FdXCnM4sxK', '2018-07-16 17:44:58', '2018-07-16 17:45:49', 1, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_degree`
--

CREATE TABLE `user_degree` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_degree`
--

INSERT INTO `user_degree` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Giáo sư', '2017-08-09 04:11:45', '0000-00-00 00:00:00'),
(2, 'Tiến sĩ', '2017-08-09 04:11:45', '0000-00-00 00:00:00'),
(3, 'Thạc sĩ', '2017-08-09 04:12:08', '0000-00-00 00:00:00'),
(4, 'Cao học', '2017-08-09 04:12:08', '0000-00-00 00:00:00'),
(5, 'Khác', '2017-08-16 02:36:00', '2017-08-16 02:36:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_infomation`
--

CREATE TABLE `user_infomation` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `khoa_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `chucvu_id` int(3) DEFAULT NULL,
  `bangcap_id` int(3) DEFAULT NULL,
  `phongban_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_infomation`
--

INSERT INTO `user_infomation` (`id`, `user_id`, `khoa_id`, `created_at`, `updated_at`, `chucvu_id`, `bangcap_id`, `phongban_id`) VALUES
(3, 94, 1, NULL, NULL, 7, 1, 1),
(4, 9, 1, NULL, NULL, 7, 3, 3),
(11, 95, 1, NULL, NULL, 7, 1, 1),
(13, 102, 1, NULL, NULL, 1, 1, 1),
(14, 115, 6, NULL, NULL, 3, 2, 7),
(15, 116, 2, NULL, NULL, 7, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_office`
--

CREATE TABLE `user_office` (
  `id` int(11) NOT NULL,
  `position_id` int(3) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_office`
--

INSERT INTO `user_office` (`id`, `position_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 2, 'Trưởng khoa', '2017-08-09 04:10:41', '2017-08-09 04:10:41'),
(2, 2, 'Phó khoa', '2017-08-09 04:10:41', '2017-08-09 04:10:41'),
(3, 2, 'Bác sĩ', '2017-08-09 04:11:04', '2017-08-09 04:11:04'),
(4, 2, 'Bác sĩ nội chú', '2017-08-09 04:11:04', '2017-08-09 04:11:04'),
(5, 2, 'Bác sĩ thực tập', '2017-08-09 19:16:32', '2017-08-09 19:16:32'),
(6, 2, 'Bác sĩ xét nghiệm', '2017-08-09 20:40:13', '2017-08-09 20:40:13'),
(7, 3, 'Kỹ sư y học', '2017-08-11 01:19:39', '2017-08-11 01:19:39'),
(11, 3, 'Lễ tân', '2017-08-16 02:23:27', '2017-08-16 02:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2017-08-08 17:52:52', '2017-08-08 17:52:52'),
(2, 3, 2, '2017-08-08 17:52:52', '2017-08-08 17:52:52'),
(3, 5, 1, '2017-08-08 17:52:52', '2017-08-08 17:52:52'),
(4, 6, 2, '2017-08-08 17:52:52', '2017-08-08 17:52:52'),
(5, 8, 1, '2017-08-08 17:52:52', '2017-08-08 17:52:52'),
(6, 9, 2, '2017-08-08 17:52:52', '2017-08-08 17:52:52'),
(7, 11, 1, '2017-08-08 17:52:52', '2017-08-08 17:52:52'),
(8, 12, 2, '2017-08-08 17:52:53', '2017-08-08 17:52:53'),
(9, 14, 1, '2017-08-08 17:52:53', '2017-08-08 17:52:53'),
(10, 15, 2, '2017-08-08 17:52:53', '2017-08-08 17:52:53'),
(11, 17, 1, '2017-08-08 17:52:53', '2017-08-08 17:52:53'),
(12, 18, 2, '2017-08-08 17:52:53', '2017-08-08 17:52:53'),
(13, 20, 1, '2017-08-08 17:52:53', '2017-08-08 17:52:53'),
(14, 21, 2, '2017-08-08 17:52:53', '2017-08-08 17:52:53'),
(15, 23, 1, '2017-08-08 17:52:53', '2017-08-08 17:52:53'),
(17, 26, 1, '2017-08-08 17:52:54', '2017-08-08 17:52:54'),
(18, 27, 2, '2017-08-08 17:52:54', '2017-08-08 17:52:54'),
(19, 29, 1, '2017-08-08 17:52:54', '2017-08-08 17:52:54'),
(20, 30, 2, '2017-08-08 17:52:54', '2017-08-08 17:52:54'),
(21, 32, 1, '2017-08-08 17:52:54', '2017-08-08 17:52:54'),
(22, 33, 2, '2017-08-08 17:52:54', '2017-08-08 17:52:54'),
(23, 35, 1, '2017-08-08 17:52:54', '2017-08-08 17:52:54'),
(24, 36, 2, '2017-08-08 17:52:55', '2017-08-08 17:52:55'),
(25, 38, 1, '2017-08-08 17:52:55', '2017-08-08 17:52:55'),
(26, 39, 2, '2017-08-08 17:52:55', '2017-08-08 17:52:55'),
(27, 41, 1, '2017-08-08 17:52:55', '2017-08-08 17:52:55'),
(28, 42, 2, '2017-08-08 17:52:55', '2017-08-08 17:52:55'),
(29, 44, 1, '2017-08-08 17:52:55', '2017-08-08 17:52:55'),
(30, 45, 2, '2017-08-08 17:52:55', '2017-08-08 17:52:55'),
(31, 47, 1, '2017-08-08 17:52:55', '2017-08-08 17:52:55'),
(32, 48, 2, '2017-08-08 17:52:56', '2017-08-08 17:52:56'),
(33, 50, 1, '2017-08-08 17:52:56', '2017-08-08 17:52:56'),
(34, 51, 2, '2017-08-08 17:52:56', '2017-08-08 17:52:56'),
(35, 53, 1, '2017-08-08 17:52:56', '2017-08-08 17:52:56'),
(36, 54, 2, '2017-08-08 17:52:56', '2017-08-08 17:52:56'),
(37, 56, 1, '2017-08-08 17:52:56', '2017-08-08 17:52:56'),
(38, 57, 2, '2017-08-08 17:52:56', '2017-08-08 17:52:56'),
(39, 59, 1, '2017-08-08 17:52:56', '2017-08-08 17:52:56'),
(40, 60, 2, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(41, 59, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(42, 56, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(43, 53, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(44, 50, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(45, 47, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(46, 44, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(47, 41, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(48, 38, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(49, 35, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(50, 32, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(51, 29, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(52, 26, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(53, 23, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(54, 20, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(55, 17, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(56, 14, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(57, 11, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(58, 8, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(59, 5, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(60, 2, 1, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(61, 60, 2, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(62, 57, 2, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(63, 54, 2, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(64, 51, 2, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(65, 48, 2, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(66, 45, 2, '2017-08-08 17:52:57', '2017-08-08 17:52:57'),
(67, 42, 2, '2017-08-08 17:52:58', '2017-08-08 17:52:58'),
(68, 39, 2, '2017-08-08 17:52:58', '2017-08-08 17:52:58'),
(69, 36, 2, '2017-08-08 17:52:58', '2017-08-08 17:52:58'),
(70, 33, 2, '2017-08-08 17:52:58', '2017-08-08 17:52:58'),
(71, 30, 2, '2017-08-08 17:52:58', '2017-08-08 17:52:58'),
(72, 27, 2, '2017-08-08 17:52:58', '2017-08-08 17:52:58'),
(74, 21, 2, '2017-08-08 17:52:58', '2017-08-08 17:52:58'),
(75, 18, 2, '2017-08-08 17:52:58', '2017-08-08 17:52:58'),
(76, 15, 2, '2017-08-08 17:52:58', '2017-08-08 17:52:58'),
(77, 12, 2, '2017-08-08 17:52:58', '2017-08-08 17:52:58'),
(78, 9, 2, '2017-08-08 17:52:58', '2017-08-08 17:52:58'),
(79, 6, 2, '2017-08-08 17:52:58', '2017-08-08 17:52:58'),
(80, 3, 2, '2017-08-08 17:52:58', '2017-08-08 17:52:58'),
(81, 58, 1, '2017-08-08 20:13:16', '2017-08-08 20:13:16'),
(82, 58, 3, '2017-08-08 20:15:57', '2017-08-08 20:15:57'),
(85, 94, 2, '2017-08-10 20:27:34', '2017-08-10 20:27:34'),
(86, 95, 2, '2017-08-14 18:15:18', '2017-08-14 18:15:18'),
(87, 103, 1, '2017-08-23 19:58:44', '2017-08-23 19:58:44'),
(88, 7, 3, '2017-09-27 05:56:43', '2017-09-27 05:56:43'),
(89, 4, 3, '2017-09-27 05:56:43', '2017-09-27 05:56:43'),
(90, 1, 3, '2017-09-27 05:56:43', '2017-09-27 05:56:43'),
(94, 116, 2, '2018-07-16 17:26:02', '2018-07-16 17:26:02'),
(95, 117, 1, '2018-07-16 17:44:58', '2018-07-16 17:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `user_room`
--

CREATE TABLE `user_room` (
  `id` int(11) NOT NULL,
  `room_number` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` int(3) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_room`
--

INSERT INTO `user_room` (`id`, `room_number`, `name`, `department`, `created_at`, `updated_at`) VALUES
(1, '101', 'Phòng khám sức khỏe 1', NULL, '2017-08-11 01:46:56', '2017-08-11 01:46:56'),
(2, '102', 'Phòng khám sức khỏe 2', NULL, '2017-08-11 01:46:56', '2017-08-11 01:46:56'),
(3, '201', 'phòng xét nghiệm máu', 3, '2017-08-11 01:48:22', '2017-08-11 01:48:22'),
(4, '205', 'Phòng siêu âm', 4, '2017-08-11 01:48:22', '2017-08-11 01:48:22'),
(5, '301', 'Phòng chụp X_quang', 2, '2017-08-11 01:49:56', '2017-08-11 01:49:56'),
(6, 'DK1', 'phòng tiếp tân', NULL, '2017-08-16 02:35:17', '2017-08-16 02:35:17'),
(7, '202', 'Phổi 1', 6, '2017-08-17 20:29:48', '2017-08-17 20:29:48'),
(8, '203', 'Phổi 2', 6, '2017-08-17 20:30:12', '2017-08-17 20:30:12'),
(9, '204', 'Phòng đo phổi', 6, '2017-08-29 08:37:56', '2017-08-29 08:37:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificates_user_id_foreign` (`user_id`);

--
-- Indexes for table `client_role`
--
ALTER TABLE `client_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_role_client_id_foreign` (`client_id`),
  ADD KEY `client_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `crequests`
--
ALTER TABLE `crequests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `number_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_name_unique` (`name`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctors_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_role_id_foreign` (`role_id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_api_data`
--
ALTER TABLE `medical_api_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_applications`
--
ALTER TABLE `medical_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `medical_applications_url_unique` (`url`),
  ADD KEY `medical_applications_user_id_foreign` (`patient_id`);

--
-- Indexes for table `medical_specialist_applications`
--
ALTER TABLE `medical_specialist_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `medical_specialist_applications_url_unique` (`url`),
  ADD KEY `medical_specialist_applications_user_id_foreign` (`patient_id`);

--
-- Indexes for table `medical_specialist_type`
--
ALTER TABLE `medical_specialist_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_test_applications`
--
ALTER TABLE `medical_test_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `medical_test_applications_url_unique` (`url`),
  ADD KEY `medical_test_applications_user_id_foreign` (`patient_id`);

--
-- Indexes for table `medical_test_type`
--
ALTER TABLE `medical_test_type`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oidcclients`
--
ALTER TABLE `oidcclients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oidcclients_domain_unique` (`domain`);

--
-- Indexes for table `oidcproviders`
--
ALTER TABLE `oidcproviders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oidcproviders_id_provider_unique` (`id_provider`);

--
-- Indexes for table `oidcrequests`
--
ALTER TABLE `oidcrequests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oidcrequests_domain_unique` (`domain`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patients_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_role_id_unique` (`id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permission_role_id_foreign` (`role_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `share`
--
ALTER TABLE `share`
  ADD PRIMARY KEY (`id`),
  ADD KEY `share_resource_owner_foreign` (`resource_owner`),
  ADD KEY `share_role_id_foreign` (`role_id`),
  ADD KEY `share_resource_id_foreign` (`resource_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staffs_staff_id_foreign` (`staff_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_position_foreign` (`position`);

--
-- Indexes for table `user_degree`
--
ALTER TABLE `user_degree`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_infomation`
--
ALTER TABLE `user_infomation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_department_user_id_foreign` (`user_id`),
  ADD KEY `user_department_department_id_foreign` (`khoa_id`);

--
-- Indexes for table `user_office`
--
ALTER TABLE `user_office`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_user_id_foreign` (`user_id`),
  ADD KEY `user_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_room`
--
ALTER TABLE `user_room`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `client_role`
--
ALTER TABLE `client_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `crequests`
--
ALTER TABLE `crequests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `medical_api_data`
--
ALTER TABLE `medical_api_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `medical_applications`
--
ALTER TABLE `medical_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `medical_specialist_applications`
--
ALTER TABLE `medical_specialist_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `medical_specialist_type`
--
ALTER TABLE `medical_specialist_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `medical_test_applications`
--
ALTER TABLE `medical_test_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT for table `medical_test_type`
--
ALTER TABLE `medical_test_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `oidcclients`
--
ALTER TABLE `oidcclients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oidcproviders`
--
ALTER TABLE `oidcproviders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oidcrequests`
--
ALTER TABLE `oidcrequests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `share`
--
ALTER TABLE `share`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT for table `user_degree`
--
ALTER TABLE `user_degree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_infomation`
--
ALTER TABLE `user_infomation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `user_office`
--
ALTER TABLE `user_office`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `user_room`
--
ALTER TABLE `user_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_role`
--
ALTER TABLE `client_role`
  ADD CONSTRAINT `client_role_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oidcclients` (`id`),
  ADD CONSTRAINT `client_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `hospital_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `share`
--
ALTER TABLE `share`
  ADD CONSTRAINT `share_resource_id_foreign` FOREIGN KEY (`resource_id`) REFERENCES `medical_applications` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `share_resource_owner_foreign` FOREIGN KEY (`resource_owner`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `share_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_position_foreign` FOREIGN KEY (`position`) REFERENCES `position` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_infomation`
--
ALTER TABLE `user_infomation`
  ADD CONSTRAINT `user_department_department_id_foreign` FOREIGN KEY (`khoa_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_department_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

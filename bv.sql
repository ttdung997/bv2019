-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 07, 2019 at 10:17 AM
-- Server version: 5.7.23
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bv`
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
(37, '{"cert":"-----BEGIN CERTIFICATE-----\\nMIIF2TCCA8GgAwIBAgIIDWh2dCGE4AAwDQYJKoZIhvcNAQELBQAwbjELMAkGA1UE\\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\\naWwuY29tMB4XDTE5MDYwNzAxMzAwOFoXDTIxMDYwNjAxMzAwOFowbjELMAkGA1UE\\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\\naWwuY29tMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA0iZh\\/LBc16W2\\n3xz7ktdAXV3\\/MUdmQbuoaW9s3WS+1\\/MjuVGYSO1nPCTWgP7aBau5MlV4T1bVtaEK\\ngQGhABPLPnh8DpRjvZ65VpcTngNa2utrqoZXh0AGqMi+S+gpD+FRHxUn5euDdVGD\\nsu7ywxY9sesPcT7dwBXrvJnRQeYFxB33z9CSewksO\\/HJtxdS0AJXtTB0CgL\\/vUhf\\nrc9dtwS1fJxLAkvKUgX3c\\/ISm76VmQe81tpMveiO3EGcvNwR20AMPL2WCTBgOkwi\\npQAXgTqAcmguxTMUrZ03FKb+beDzQOmpv7gQNFwJ1BmSLf2ViD6HtfA68435knEP\\nu5MoKBlQR41QdSvPyNXCMLRlRhIy6j7BW51J7F0KlmcH50f35fPMa6DpOcWI8C2n\\niwO0z24rchbpF4DNZ3mwUeUh8qNX9b25d9ncAZ9A5Ps\\/1x2v+yHycpMZ4eIPkO1a\\n2KbJTrG1n4TcMJ\\/X+WMu+xBAPFHAIoh1wJToEbx2Drj5jqXV\\/KNoBU6NhHBLfz7A\\naHB0EUeXVsAmxG1KoApErmHMj8sRaMzw43865fsBLarZBoP5RNTUS99qDzFOPnkW\\nG4U68ZX3FEHz3gioorzG56Qf+M2N4p1NevLhVVnQ5pp6ovoTCaMuSNeJvPFJM4y+\\ndMgn2RzhIGaNgCsTAFlSRaM9FnFVMJcCAwEAAaN7MHkwCQYDVR0TBAIwADAsBglg\\nhkgBhvhCAQ0EHxYdT3BlblNTTCBHZW5lcmF0ZWQgQ2VydGlmaWNhdGUwHQYDVR0O\\nBBYEFB9G\\/z2VaBD57YjHfJ2XWhPdzEc+MB8GA1UdIwQYMBaAFB9G\\/z2VaBD57YjH\\nfJ2XWhPdzEc+MA0GCSqGSIb3DQEBCwUAA4ICAQAa\\/kgtuLG0+WFaJQ64rT94GzXp\\nrJ5YT6VdyitxRMR19C62fHo6NKawrOfn3N4gSTW7CNzSq833aYw1Ua+TCQVduG0A\\n9sMnL3EBivKhhSjmCI2BmoHY6jG3X4++bOR7InL1zEvnMXy5mS7iKu6E3RItMrzY\\ncOXlUqL\\/C899B\\/SAFV4tlDV+NftzyyiLcUhrTwOKSY4th\\/fiJ3pIdsYH6+2+o+AH\\nPrqc3teDVnBNwjPrssLXLM\\/Qzhs90PMvrAof\\/kPqxU3vudlQ895LQRxIidM9z7pM\\nHbnvof9hhkjswaZYz\\/Vj6s4u5Jl7jLACWxTWyHL5NFs2WCC0\\/YsW4IfQQjfCVh+D\\nbB0pi\\/Q8thCO3ZHQkrwJaQ1G5rBKO6JofqAu8ei1jzyTD0vYAYJysQXyg+a0GM0x\\n+31fQV4u2HL76q3zAV9nwWvOE+6Yz0zERGeEUgWquzCEyGztqHCLg62QBcfN2CvB\\nSwWxYPBEQWW93T94eUS54bnqJZU16W7tJKkWM01vUXnWCYWML6SxKpFBQuaNr+qG\\nUr3z01Ogr7fc3L8hNQUS7GLx7n1O04K5eU8Y3azIAOxBxucjPdupDMBv3vFmlRmX\\nclFBJKAXkIQHgcHFq4UpIJ21NoECPODpYqa9N+Ty+rMeVDFNkWyhk1xJrdCKkuJ\\/\\nBuzOoBoPLzjOMo91Gg==\\n-----END CERTIFICATE-----\\n","pkey":"-----BEGIN PRIVATE KEY-----\\nMIIJQwIBADANBgkqhkiG9w0BAQEFAASCCS0wggkpAgEAAoICAQDSJmH8sFzXpbbf\\nHPuS10BdXf8xR2ZBu6hpb2zdZL7X8yO5UZhI7Wc8JNaA\\/toFq7kyVXhPVtW1oQqB\\nAaEAE8s+eHwOlGO9nrlWlxOeA1ra62uqhleHQAaoyL5L6CkP4VEfFSfl64N1UYOy\\n7vLDFj2x6w9xPt3AFeu8mdFB5gXEHffP0JJ7CSw78cm3F1LQAle1MHQKAv+9SF+t\\nz123BLV8nEsCS8pSBfdz8hKbvpWZB7zW2ky96I7cQZy83BHbQAw8vZYJMGA6TCKl\\nABeBOoByaC7FMxStnTcUpv5t4PNA6am\\/uBA0XAnUGZIt\\/ZWIPoe18DrzjfmScQ+7\\nkygoGVBHjVB1K8\\/I1cIwtGVGEjLqPsFbnUnsXQqWZwfnR\\/fl88xroOk5xYjwLaeL\\nA7TPbityFukXgM1nebBR5SHyo1f1vbl32dwBn0Dk+z\\/XHa\\/7IfJykxnh4g+Q7VrY\\npslOsbWfhNwwn9f5Yy77EEA8UcAiiHXAlOgRvHYOuPmOpdX8o2gFTo2EcEt\\/PsBo\\ncHQRR5dWwCbEbUqgCkSuYcyPyxFozPDjfzrl+wEtqtkGg\\/lE1NRL32oPMU4+eRYb\\nhTrxlfcUQfPeCKiivMbnpB\\/4zY3inU168uFVWdDmmnqi+hMJoy5I14m88UkzjL50\\nyCfZHOEgZo2AKxMAWVJFoz0WcVUwlwIDAQABAoICAECc2IfO2dzb8KwMxzTQxdNv\\nMSU\\/pKsVPaSdQ8WWUi8nbJZwBfh2NcWCNgmXUgVoVRqquMD8G90qVIZxr8TMUTM1\\n7D63VStZ\\/\\/YloTx2H5srwwC9KXBGOUXv4sKH8QgW6NA7uvawQMzzcSC04yMkVXe8\\npBTXlWqX0tE8IeC3DpLL\\/AODR2ZY3abYooKOw0F9VuY4rZTecy8Jb5GLLm81HW\\/g\\nxhdAokYx23Fkvl\\/wayKQBHmyyOGi\\/TmvWreemkblHF4YlGbi3tNN0WEV9CQhjpie\\ne7LaD8OJkQPijFvQTDprHWv69dCDc+ooqo9FZpJrV2KTKCz2PAPQi1vK1Q\\/vKIUo\\nxWPbvgcg6hRzgJ3swWzsB\\/gjc45oCaD1ivQyMNAOTELm8x4VJ8HJyZgpGj5WInKE\\nf7kqQZ\\/H38NErOHErQnhpG8aR+7bjug7l8Qq7R9tt9j+Az4GUaPoHJ8p\\/w\\/buC5n\\nr2q8D1+ryQqm\\/oeZp7PVlu1BS2vxW2K8ZMV0BB21zRJLneRH2FWz+zJbAkQTTsJf\\nZBhFCSgclW0eiX2fLxPgMFIvGw9ayY8meUe0ZYkLKKCgUaS69WLE\\/0LmlKXeg3Sp\\nTovtwNtY9FTzQ2QdcIiC+CdtSOFjrvBOToQz4eCjA+NItECexT5xLzGOdyBEZd1F\\nfNF\\/P1Rxu8hYorG9+tQhAoIBAQDp3tOLDmlJ6TmIjD4p02cn7QhrBjIlUHf+Un\\/G\\n2oP\\/\\/rwPg8mQ2JPaEnTNY+N\\/BJv5I9gS3vEE5wjCIMKka1BJBBEuDPwU87grLMuI\\ngqvUS5zUwWijRuHQNG0eJJwXuOVovFlKek8GfDZ7irQTkgzcmzmTTBf\\/RtZpfyfY\\nmdj+HOZdkMXyM31aS7N4VEKgES+EiBq617aEFvuzviEfXKG9I6N2cN87tG2am3Qq\\n8TR8AsMFE9uSmSD2PnepryGD6ggp5XugQ7qSqDepkWP+6uc1PCSCSzOqS2T4lJoX\\naP5syxLfAPfpJn6UHnDkUYZge17h7Lv2E9gyhFFbWDayGRZpAoIBAQDmCPZAm4cL\\nxMXoX0azzypKRayelr3oPvJVjQ61korY8RDe5Q6HTAhAooDsRJRrV9FGxzvl1BzX\\n8I3dGfS\\/IvBuMySSdlqKjvz14jYb+6e+LIFCSzWcZYIXbR5H\\/7dRV1XfEVo5XQIc\\njky\\/498XCG8ynZW3LSy50EOE0ZvSOHvXxaTXHjwrwmik5T2x2\\/nHlIN+HD2XSyHC\\nLREGjLcUO06a3XTkqqPODRMz4m0AAar0WpIDfx92bpuJeUvQ4UJL6rRE8HY5LGhi\\nBlIsGdu23t9pYWxTDonOaksDAMJK\\/oyI\\/KeRocf3XfjCE11V5DZ8l72P\\/CBQu7lg\\n3LdRfE81qS7\\/AoIBAQCXcOk\\/VJetes78swPWBcT4v68BzsNOEmuBTl7bn8h2Trfs\\nvAQcPYKQZf8ouRQpvgxaKnHS1nbwG8M6Igioe61DetS9Iz9hOej6XEl4HlWyZTwr\\nMQrXICE9t5UpPb+uRNaZGc4gQk9F\\/c0x9sFhIuQdPo7r6QxpC6\\/wJJziz80J0CEE\\nWak0i08S145hzv5NtJM2mQPmFaVkp5VZ8TZ1noBFf\\/xrx+9mNBH9WcjBveukmg07\\nDn7S0UHc8tp+EJ\\/9UeDzcFy7jOAV88QHk9RS0D3j5QwnKxdLoQLDTUby\\/dQzEtUn\\nfvMKERlKROQJlRkVBQ6N8cRNNtB69d\\/Q7LCOZ1xxAoIBABpdFpPq\\/zw7Dg+Gs9yx\\ntoASoij+z78JT868Pt5ScDVS04MoL1UUQrHdrfbmGTiANQzuko\\/RkoixGiEn82Pg\\nhjurAtsCU3gj0RwBFAB7BAuIoDvP0NIe1B0JNXo89W6OGtpY68U9QpuxN1yaqhvC\\nrLPZWapHtCOLmeFkAH7EWHUvQqgg3\\/aH7mRPnZV\\/x423GKbgZ7KqOrE9ZwEgKW9Z\\nKLYZAWefouxflT7SCXoBtu0QYEGkVR\\/Gp27HBwhmeKmouYZZJMOCsmfhn5NMV2EL\\nBAHY14hhVyvgBL7QXHQp3kNo6W+IYhmYnITpoT3RzOjUnzYcSDvYd\\/OA+EWPgKh+\\nvlMCggEBALVVJIOwRwMc\\/TbBV3h8aMRiQeOIuD8zSlUMZWVz\\/qGDeYLB38v\\/tJTp\\nC1FLAdPs+kh29m5TjA56DDVvBHrZ86Q8xOZUg97xIw4cmyl5vBxWm4rHy\\/Ow\\/9G9\\nXoxupXGVJrRqgBUibDKF36tSe81TKv47P1652BjIQOXjOAX71z8PlUHTuXiDM\\/1O\\nfxV9JuvcuXN4RQRaOTHTlwTgCV\\/hW\\/PSP9SL4mF9iN40VIfkH4dnqHfVtRr0p6AF\\nnM2KkvzCVzVjbPXiM+ZxI7RBBNpavJeDgQAMfyTBNAChJtIYj8KboLH9UlhU5UiS\\ni8xBmsebIwOYUjV8DuwqgxKEdcfWYbc=\\n-----END PRIVATE KEY-----\\n"}', 1, '-----BEGIN CERTIFICATE-----\nMIIF2TCCA8GgAwIBAgIIDWh2dCGE4AAwDQYJKoZIhvcNAQELBQAwbjELMAkGA1UE\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\naWwuY29tMB4XDTE5MDYwNzAxMzAwOFoXDTIxMDYwNjAxMzAwOFowbjELMAkGA1UE\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\naWwuY29tMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA0iZh/LBc16W2\n3xz7ktdAXV3/MUdmQbuoaW9s3WS+1/MjuVGYSO1nPCTWgP7aBau5MlV4T1bVtaEK\ngQGhABPLPnh8DpRjvZ65VpcTngNa2utrqoZXh0AGqMi+S+gpD+FRHxUn5euDdVGD\nsu7ywxY9sesPcT7dwBXrvJnRQeYFxB33z9CSewksO/HJtxdS0AJXtTB0CgL/vUhf\nrc9dtwS1fJxLAkvKUgX3c/ISm76VmQe81tpMveiO3EGcvNwR20AMPL2WCTBgOkwi\npQAXgTqAcmguxTMUrZ03FKb+beDzQOmpv7gQNFwJ1BmSLf2ViD6HtfA68435knEP\nu5MoKBlQR41QdSvPyNXCMLRlRhIy6j7BW51J7F0KlmcH50f35fPMa6DpOcWI8C2n\niwO0z24rchbpF4DNZ3mwUeUh8qNX9b25d9ncAZ9A5Ps/1x2v+yHycpMZ4eIPkO1a\n2KbJTrG1n4TcMJ/X+WMu+xBAPFHAIoh1wJToEbx2Drj5jqXV/KNoBU6NhHBLfz7A\naHB0EUeXVsAmxG1KoApErmHMj8sRaMzw43865fsBLarZBoP5RNTUS99qDzFOPnkW\nG4U68ZX3FEHz3gioorzG56Qf+M2N4p1NevLhVVnQ5pp6ovoTCaMuSNeJvPFJM4y+\ndMgn2RzhIGaNgCsTAFlSRaM9FnFVMJcCAwEAAaN7MHkwCQYDVR0TBAIwADAsBglg\nhkgBhvhCAQ0EHxYdT3BlblNTTCBHZW5lcmF0ZWQgQ2VydGlmaWNhdGUwHQYDVR0O\nBBYEFB9G/z2VaBD57YjHfJ2XWhPdzEc+MB8GA1UdIwQYMBaAFB9G/z2VaBD57YjH\nfJ2XWhPdzEc+MA0GCSqGSIb3DQEBCwUAA4ICAQAa/kgtuLG0+WFaJQ64rT94GzXp\nrJ5YT6VdyitxRMR19C62fHo6NKawrOfn3N4gSTW7CNzSq833aYw1Ua+TCQVduG0A\n9sMnL3EBivKhhSjmCI2BmoHY6jG3X4++bOR7InL1zEvnMXy5mS7iKu6E3RItMrzY\ncOXlUqL/C899B/SAFV4tlDV+NftzyyiLcUhrTwOKSY4th/fiJ3pIdsYH6+2+o+AH\nPrqc3teDVnBNwjPrssLXLM/Qzhs90PMvrAof/kPqxU3vudlQ895LQRxIidM9z7pM\nHbnvof9hhkjswaZYz/Vj6s4u5Jl7jLACWxTWyHL5NFs2WCC0/YsW4IfQQjfCVh+D\nbB0pi/Q8thCO3ZHQkrwJaQ1G5rBKO6JofqAu8ei1jzyTD0vYAYJysQXyg+a0GM0x\n+31fQV4u2HL76q3zAV9nwWvOE+6Yz0zERGeEUgWquzCEyGztqHCLg62QBcfN2CvB\nSwWxYPBEQWW93T94eUS54bnqJZU16W7tJKkWM01vUXnWCYWML6SxKpFBQuaNr+qG\nUr3z01Ogr7fc3L8hNQUS7GLx7n1O04K5eU8Y3azIAOxBxucjPdupDMBv3vFmlRmX\nclFBJKAXkIQHgcHFq4UpIJ21NoECPODpYqa9N+Ty+rMeVDFNkWyhk1xJrdCKkuJ/\nBuzOoBoPLzjOMo91Gg==\n-----END CERTIFICATE-----\n', '0D6876742184E000', 0, '2019-06-07', '2021-06-06', 0, '2019-06-06 18:30:08', '2019-06-06 18:30:08', NULL),
(38, '{"cert":"-----BEGIN CERTIFICATE-----\\nMIIF4zCCA8ugAwIBAgIIC6yH4n8C7wAwDQYJKoZIhvcNAQELBQAwbjELMAkGA1UE\\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\\naWwuY29tMB4XDTE5MDYwNzAxMzEwOFoXDTIxMDYwNjAxMzEwOFoweDELMAkGA1UE\\nBhMCVk4xEjAQBgNVBAgMCUjDoCBO4buZaTEXMBUGA1UEBwwOSGFpIELDoCBUcsaw\\nbmcxDDAKBgNVBAoMA2J2MTEQMA4GA1UEAwwHYnYxLmNvbTEcMBoGCSqGSIb3DQEJ\\nARYNYnMxQGdtYWlsLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIB\\nAMXkKS\\/o5wVAImDqb6qYflRbf6eMsRml2jtoS5u8At5qbKYYso\\/MQJ7BFfrjcrzT\\nySkWQzh1YFUtJ+lHdgNTTHFM4b0AK41Mr5e0pJhYf7G6hCk\\/6Q5DmmZBohEOMwCx\\nSXmWGRIs4S7wO1PdauDO0tQZVUeqsRJoUnwnGqmCZ6RYHcBW96NIXpAl\\/s5LdDaL\\nWMVhoY5jzq2VZgFxau9XZ5LK+2R6r7aegxF6RUwQ7mhj68NvGKBXJFcMfru51noJ\\n4FbPLbB9XV4ojTW1Zu+WGrn6mlnbK7nmrYDr\\/PgzHMNNuPFrNCfrucWR67CJhN9Y\\nX0dlImgBV5f3CRhdyxT2OQY9p82IlBMNUj0cv\\/Dn1JbbxVwLeVbOqfPPc4RVoD6K\\niwC6GZyRNWFC1oFOGE2e16zdhinHwmWwQb\\/7xqVufqefx6gZOPSVBCXPlvWt\\/xWo\\n0m04LzcgIZ2CWinG3CSJZ4GxqffR1SLbm0oadmfKCR6IRibkXq3gmuMg5LWjK9R6\\nxJTOd0S+jXb\\/\\/ypSybq5oSRjCuX2oAvs2Ma0ASXSFtFXlQowiRdOQek3kK2TkeVW\\nZzTMSMmJKKQw8KKlKiVO64eBcIAnmVzQypHi\\/5ByDqWOCI\\/LBfP2Tk7thWJJAUif\\nueGyFGLLYlHSprKTXDXqmrarvH+qcthwEXdT+qGemNULAgMBAAGjezB5MAkGA1Ud\\nEwQCMAAwLAYJYIZIAYb4QgENBB8WHU9wZW5TU0wgR2VuZXJhdGVkIENlcnRpZmlj\\nYXRlMB0GA1UdDgQWBBSnOP3wJkLHZ1mZecPVFR+GQBak2DAfBgNVHSMEGDAWgBQf\\nRv89lWgQ+e2Ix3ydl1oT3cxHPjANBgkqhkiG9w0BAQsFAAOCAgEAOwzgUa4GHgRc\\n7itIFA3hY6bmS2fo2H4NIT38NA2NPJUDJLOTSip2CdZkLn2NO2mHTLchkGBNQSBG\\noluup\\/DwmTF4NUmyhd3VMj7W5MdJ8l6ubjhY6vttj7DNGJwnE95rQus+RIB2Wqxx\\nLHdIxTwpSU\\/8Ei55LgFl6p0FS2u8J9XynhooSDbEIWZR43Y29UwvZY47a1KWkCkb\\nLZX5UUYgKLuYNgP\\/+VLNawxfg3R\\/KHt1VxiTAKq5+o8hK5itlO9dcurHHK6\\/F78k\\n9MWH6nWTNv+vZHxSmqEIR6F1OAob+2gOjs+FNWjhP92NjgVXyLbWsGZ9FYJuA\\/9G\\nILeoHKiHV+4w4GRgo9bbF1TIxK3UOFEkYpN0HqPD4kYoqjX33+jpdXa1PplhOmC7\\nYWvYHLlLLZgE0jsxN7LAwZHkMXGy4AZDvrnMMb23tDnDR4d5uGUhH8wbaWof2hLm\\nrgJk6W0cztCAhGpcxOb2MQXyAQnN2lAIzDX6jUCpNDovF8UIRF4TNmYfVKCHriUn\\nqXLZUn+xrpkKMuegsnpmE5LtXn087wmTbg8G3tpd\\/3IO8YRHDTuyaJcLYrMptilV\\nKCIEzWKkAJKQ37ja31sNXRcHFiGFlPMlW3jsOwhGthGx8RzbB94w6QEGXHfzw\\/IU\\nWBM6quxu38ZIlskWzECc7pD\\/Ihx3h7Y=\\n-----END CERTIFICATE-----\\n","pkey":"-----BEGIN PRIVATE KEY-----\\nMIIJQgIBADANBgkqhkiG9w0BAQEFAASCCSwwggkoAgEAAoICAQDF5Ckv6OcFQCJg\\n6m+qmH5UW3+njLEZpdo7aEubvALeamymGLKPzECewRX643K808kpFkM4dWBVLSfp\\nR3YDU0xxTOG9ACuNTK+XtKSYWH+xuoQpP+kOQ5pmQaIRDjMAsUl5lhkSLOEu8DtT\\n3WrgztLUGVVHqrESaFJ8JxqpgmekWB3AVvejSF6QJf7OS3Q2i1jFYaGOY86tlWYB\\ncWrvV2eSyvtkeq+2noMRekVMEO5oY+vDbxigVyRXDH67udZ6CeBWzy2wfV1eKI01\\ntWbvlhq5+ppZ2yu55q2A6\\/z4MxzDTbjxazQn67nFkeuwiYTfWF9HZSJoAVeX9wkY\\nXcsU9jkGPafNiJQTDVI9HL\\/w59SW28VcC3lWzqnzz3OEVaA+iosAuhmckTVhQtaB\\nThhNntes3YYpx8JlsEG\\/+8albn6nn8eoGTj0lQQlz5b1rf8VqNJtOC83ICGdglop\\nxtwkiWeBsan30dUi25tKGnZnygkeiEYm5F6t4JrjIOS1oyvUesSUzndEvo12\\/\\/8q\\nUsm6uaEkYwrl9qAL7NjGtAEl0hbRV5UKMIkXTkHpN5Ctk5HlVmc0zEjJiSikMPCi\\npSolTuuHgXCAJ5lc0MqR4v+Qcg6ljgiPywXz9k5O7YViSQFIn7nhshRiy2JR0qay\\nk1w16pq2q7x\\/qnLYcBF3U\\/qhnpjVCwIDAQABAoICABYN\\/6kfQ+AJ7crvVdKlfC7a\\no7eArpw1J8VHMmYA5jDzm3hHeF8eXHVU\\/6Yeg0MYN2sk2AkKy9myVqhhFn34YqSd\\n9OqjgjcVPNyjfVSdSF3+c4xFWywDzMloty8\\/bd+94npyiAjGh7I7g+Es5CR56HVK\\n\\/X4nP+TVS5wan5YUuohOacJt7tt7zU4zbdp\\/\\/ku17AbTgrXj2bzu0ZeHlGtoSlrJ\\n1Iq2Qa8Qq3rfLan0mR15RWValFwKWjp5YgZ6B7VCNIZ4QJdS4X0E9\\/fsZ7R7\\/i6M\\nB3fMPWtSkjO0GVVwHNyHZP1C\\/WUVmHa0dJgQO4bIypWiZ9s\\/iwuctJ7KlT+Y0XH2\\nU\\/kWh4dRCx8BTfs75yv1fdmPpQbvGYz8+HE5JUNUzWOc4Wefxj5sWl4zJv+KoqZw\\nNL2nvjEXb6Env3aBeqfhVRCZe7QMX\\/4tqVdvau96I1x2bZq3pfF8bhrQ6WPhTuDm\\nagR20Dje2RpC9ax8XQan47T5KnHVhXPQ5fl\\/I+hSqtvBiq4GVF278goyop55bmSj\\nSkaERbxRqBltNRLwjoA4K1jfr2p1Ou+LcYVcmHO+OaICNrpHhXgAgRPSXSghqyjK\\nLgKZCHQk1p3m5RI2CaHAoGwxkJ9Dz+aaSXEbm8BBmg30shUoTIH4RELzC24Rxy+y\\nRWAe+gQYE8vrqX8zEnPBAoIBAQDw5q+p2334pEJO+vTikE7ppJMBFN96TMN+Jigr\\nLkXLUPOOossqyy4xx1SIRJfBi0WbX5hces67FFUArHlWSGBRbZTTH8vbuAFpBEdL\\nO94fvL3Vtz3iW9iJi1B431GQHAEsWYXmlhGXhZ+PH\\/Z2B27n8c2QlO0+XaRT7SSQ\\nzEimerPTSKgS\\/Kj7Fi6YVp7oxo2POr6hzYpnxnJmZyTp1TYCgUWMKNa5MylSSNLJ\\npqOs7x74+9SA\\/NFWrV7MsfKzL5ITguUMtV5ytB\\/wq5B\\/vNmQoE\\/vQyOBfRTUMNpS\\nKOcu\\/xCRqJOTCW3PiDmYHGnQd7EAd8697D72xC9ePbOAxM4vAoIBAQDSS18dOjMz\\n\\/5KfVGMjvtF0unl\\/FgFrVuB1AJhlGcVcyHop4uRs8EqHW6IQgpUARVsZ8V466r\\/6\\nesk3Fb9EwQas86nlfeg6+nU8h9j6pzdbj7SmQGpWJMiIqiTD4twh2vyMyFpWMVbW\\nGdVNX29LQul+4TeCWpx2zZn8kkKpmMP1Q3wqV9hb2ZCaFnjmlUcijvNMa7WKyhLJ\\nDXRcy6DQpxUR8B8aaW4fqeuxppmF3Bp0AXhjrYkkOC19sd6Aq\\/uxNZBM4jkAJWyo\\nS5+88vHRYPILWcfHryhYPw6Pp7BxxJ4ZKm3pLp5ZGFIKMN2q1TVZCpN\\/WVtASe09\\nBVwq0rNanavlAoIBAQC2Ph5IRqdO8ZzEOTAHMhqwwHMBj3PdBrOh\\/GXI\\/PGJ9Uy7\\n7EX8ssbYm65EhHe10JGxECmoVLOObbw8jT4h2xEaqOa8rUJAjzxp4PW6YakRo2yN\\ngFmNo+P1cfJH7tG6TqVIktUscv0N\\/uWNliWSdt8dEx1rMm8kDh1h7HYMIK8ZWpwt\\ny7py2rdPdCF915HSEVtILq3GpEL\\/bO5gr8kKKOT6Eie197MxWhX5jOQB71HFYwSw\\nYXsKtbf8dZ3RBxHPIr7EifKToaW46rF7FZ90Mz74HX87RzRWInUebXLMUutJ72Xu\\ne3Rg+PIc3TaM73nRXqsF6pz5qv6bGiGnjs\\/8K2a7AoIBADOARfDwee24H35pukXc\\ny4scx\\/h5uStCgYHl\\/Wx1HUKVzmVHrc2II5h2tn\\/4mukQEzmNRRiEuTNssq6M4uTB\\nqRLeMbOEXEVlZSTH2Dm6jfIchY9ZozEpnPrrQEnA20xnRwZrYsRNHQkeFoD2aFk0\\nL97k5SVFb6Agxh926mCCiysbteLg1JnZ9HHoIv\\/Fe0BZZfhHQJSW3HbklqTLMb0n\\nzh8wgU2EmHWktZYySNLhjpDucz9mFnoKUAnCb81vURqbFZXeqTsB71RgAOTTUqmG\\nZoClIiojGWxTNQu1c57JGjbrjzNWOW10aVMZmI\\/n20LNNkYv6gsaj8Er+OB77XS5\\nvIkCggEAc\\/8bunNh\\/gV2Tks4o+lOguT5VVdaYWr1mzi6CZSOnaxG19ec5uJuoGFT\\nhsnrs3mES7mgwiyFKS\\/XNsxP\\/cBiVJIZ3aMZG5IjuzkxK71pWRaJmJVfAwXydXpo\\nCzHH\\/Brtp6Ae0KF6bvZij2retmebnsULiMv82IfhxURLnJIERyx7LPzMO\\/PjCEzO\\nY\\/8xWFC\\/BDMgVFg\\/V2nxAtdn4u0MGCW5B5hP\\/cS8qiEw+YlmGBcaYYnWXeCrWTdl\\nb2WhhlozoLQUpuZH8vmuVpd6YfXfUbtCMmdFYzr2iUri1txzhOO5e\\/NUOQL0ZYzB\\nWVSg8w+9v9Nz4R2MHWORl+avgFPJGw==\\n-----END PRIVATE KEY-----\\n"}', 19, '-----BEGIN CERTIFICATE-----\nMIIF4zCCA8ugAwIBAgIIC6yH4n8C7wAwDQYJKoZIhvcNAQELBQAwbjELMAkGA1UE\nBhMCVk4xCzAJBgNVBAgMAkhOMQwwCgYDVQQHDANIQlQxEjAQBgNVBAoMCWJlbmh2\naWVuMTEQMA4GA1UEAwwHYnYxLmNvbTEeMBwGCSqGSIb3DQEJARYPYWRtaW5AZ21h\naWwuY29tMB4XDTE5MDYwNzAxMzEwOFoXDTIxMDYwNjAxMzEwOFoweDELMAkGA1UE\nBhMCVk4xEjAQBgNVBAgMCUjDoCBO4buZaTEXMBUGA1UEBwwOSGFpIELDoCBUcsaw\nbmcxDDAKBgNVBAoMA2J2MTEQMA4GA1UEAwwHYnYxLmNvbTEcMBoGCSqGSIb3DQEJ\nARYNYnMxQGdtYWlsLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIB\nAMXkKS/o5wVAImDqb6qYflRbf6eMsRml2jtoS5u8At5qbKYYso/MQJ7BFfrjcrzT\nySkWQzh1YFUtJ+lHdgNTTHFM4b0AK41Mr5e0pJhYf7G6hCk/6Q5DmmZBohEOMwCx\nSXmWGRIs4S7wO1PdauDO0tQZVUeqsRJoUnwnGqmCZ6RYHcBW96NIXpAl/s5LdDaL\nWMVhoY5jzq2VZgFxau9XZ5LK+2R6r7aegxF6RUwQ7mhj68NvGKBXJFcMfru51noJ\n4FbPLbB9XV4ojTW1Zu+WGrn6mlnbK7nmrYDr/PgzHMNNuPFrNCfrucWR67CJhN9Y\nX0dlImgBV5f3CRhdyxT2OQY9p82IlBMNUj0cv/Dn1JbbxVwLeVbOqfPPc4RVoD6K\niwC6GZyRNWFC1oFOGE2e16zdhinHwmWwQb/7xqVufqefx6gZOPSVBCXPlvWt/xWo\n0m04LzcgIZ2CWinG3CSJZ4GxqffR1SLbm0oadmfKCR6IRibkXq3gmuMg5LWjK9R6\nxJTOd0S+jXb//ypSybq5oSRjCuX2oAvs2Ma0ASXSFtFXlQowiRdOQek3kK2TkeVW\nZzTMSMmJKKQw8KKlKiVO64eBcIAnmVzQypHi/5ByDqWOCI/LBfP2Tk7thWJJAUif\nueGyFGLLYlHSprKTXDXqmrarvH+qcthwEXdT+qGemNULAgMBAAGjezB5MAkGA1Ud\nEwQCMAAwLAYJYIZIAYb4QgENBB8WHU9wZW5TU0wgR2VuZXJhdGVkIENlcnRpZmlj\nYXRlMB0GA1UdDgQWBBSnOP3wJkLHZ1mZecPVFR+GQBak2DAfBgNVHSMEGDAWgBQf\nRv89lWgQ+e2Ix3ydl1oT3cxHPjANBgkqhkiG9w0BAQsFAAOCAgEAOwzgUa4GHgRc\n7itIFA3hY6bmS2fo2H4NIT38NA2NPJUDJLOTSip2CdZkLn2NO2mHTLchkGBNQSBG\noluup/DwmTF4NUmyhd3VMj7W5MdJ8l6ubjhY6vttj7DNGJwnE95rQus+RIB2Wqxx\nLHdIxTwpSU/8Ei55LgFl6p0FS2u8J9XynhooSDbEIWZR43Y29UwvZY47a1KWkCkb\nLZX5UUYgKLuYNgP/+VLNawxfg3R/KHt1VxiTAKq5+o8hK5itlO9dcurHHK6/F78k\n9MWH6nWTNv+vZHxSmqEIR6F1OAob+2gOjs+FNWjhP92NjgVXyLbWsGZ9FYJuA/9G\nILeoHKiHV+4w4GRgo9bbF1TIxK3UOFEkYpN0HqPD4kYoqjX33+jpdXa1PplhOmC7\nYWvYHLlLLZgE0jsxN7LAwZHkMXGy4AZDvrnMMb23tDnDR4d5uGUhH8wbaWof2hLm\nrgJk6W0cztCAhGpcxOb2MQXyAQnN2lAIzDX6jUCpNDovF8UIRF4TNmYfVKCHriUn\nqXLZUn+xrpkKMuegsnpmE5LtXn087wmTbg8G3tpd/3IO8YRHDTuyaJcLYrMptilV\nKCIEzWKkAJKQ37ja31sNXRcHFiGFlPMlW3jsOwhGthGx8RzbB94w6QEGXHfzw/IU\nWBM6quxu38ZIlskWzECc7pD/Ihx3h7Y=\n-----END CERTIFICATE-----\n', '0BAC87E27F02EF00', 0, '2019-06-07', '2021-06-06', 0, '2019-06-06 18:31:08', '2019-06-06 18:31:08', NULL);

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
(112, 19, '{"_token":"vTygp3ofNkmemNZivEdwDgASDBzVAe0TQ7iH1ZKj","message":"Y\\u00eau c\\u1ea7u c\\u1ea5p ch\\u1ee9ng th\\u01b0","type":"0","username":"b\\u00e1c s\\u0129 7","password":"eyJpdiI6InkwNUlnUjRaMDlFUUVFUEtZdGN3QkE9PSIsInZhbHVlIjoiQVVna0E0c1ZnSFp0RlI0emZZaDI4dz09IiwibWFjIjoiMzlkN2VhMmI4ZjdjYmIwYmMwNDdkNjc2ZmRhNGJhN2JhNTA4MDk2NzZiYjVkMDEwODE0OThhZjhlZDE2Zjc5NiJ9","email":"bs1@gmail.com","common_name":"bv1.com","organization":"bv1","country":"Vi\\u1ec7t Nam","locality":"Hai B\\u00e0 Tr\\u01b0ng","province":"H\\u00e0 N\\u1ed9i","roles":["1.2.3.4.5.6.2"]}', 1, '2019-06-06 18:30:35', '2019-06-06 18:31:07', NULL);

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
(3, 8, '2019-05-27 09:25:50', 1, '2019-05-27-9-43335e50d3a4afb.xml', 0xc6fb46cffa1a62ce5b60ce787c2c39a58a073ea856cdebd0686f822df65af0cd84127713758bc2768bc403c03c55d2dbcd5ba77ce0a86b8565a6c07af8d6b23bc668db250cfcc45386035aad2a89f3ca866d654dda26f23a9c2d91ea74151b2d0bfc487c384b5c42e64b37fc2e6349e214b250ac2deeda5cf142c15de584dbf9d825f5bf0ae427ff01f79a2b660ab2aa18c0c0567d8ce8e905eed652314cce1d88165f02006efd27204d12321cc9da8e094e1d1ad923544c1de178a1f6a44861ffaf9be79454374fcb7715a217522359b60fca19ac5b19cdf06b9a01ac52242ada0b717ec46df636b7e073d5599fde3b650225c1e4eb3989e00cbbebd9ff668a9f5eb3350bde7ada62c4c2cb02881bfe, '2019-05-27 02:25:50', '2019-05-27 02:25:50', '2019-05-27', 1);

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
(132, '2019-05-27 08:53:32', 20, 2, 4, '2019-05-27-9-1a3f59fe8c59f0c.xml', 0x2d3a6ab76abbc9b3be9aa6ba7cde7fce1ed3943a0758a168cfb98ca1d2605ab68d14596d40860e21204b24e12622402579945d0a04379b33e3b7ab3b82c49d42a44a3e34ac10c960c71e58a76575bae59d58824ae0229503a13aae4e38994f19b37fa93ac785b66a2b5a7f785213c3e3171eec1053b2de23722fc39e92c7f40a19c5c6cb933d1159651c232dc227f9077c866ae21fe8a5ce25f13b5efd9773a2c37ce573e90c873d229e8015a39f972912847032a0fdfa2e14ef45ff93bb5b4211dd8c06c1244e3397efbce0abddc473210dfef37a1e6f5df7025b3d10621999980027e1ed734fa05c0a54d2820cfca824f342f0b84ad083576017e2819badef4dd0854176c3d365b3e218df2999cafa, '2019-05-27 01:53:32', '2019-05-26 18:53:49', '2019-05-27', 1, 1),
(133, '2019-05-27 09:19:53', 5, 1, 4, '2019-05-27-9-c20563a7b794298.xml', 0x96217b25f18d4872fe74c115fe22f649f23cd3068ead05e2f58b94398e42bcf45a32404719c1f3348bd373ee5dff14a46fc93de4826fbdf3f7b5650b4578d22c481d1185454f06c069867c9a8cb1cc6337a2b47a515dae250e318d650997ea8f082492982a9e89eda03c4a4efaf39e56978d6d0d6d3c5a15e6f8fa930f5ea283e89edee2edd36335b05699f2a84b739a338398ff8e71f6c6b52fb8403c9ddc0c8a69520e82c7560d031d5d814953f9ab741e80c4ab85d7a1f0bbbb0393013bee0794a54c280179cadd6cc0b2fde67b0bacbc04b65f141419fa90d8da246e0da624199113e7c3c60175543f306ac696b709e60b46a73ab7b92fc5cf44eecc9bec4e683e6e7f864a8834cef77a89cec0fb, '2019-05-27 02:19:53', '2019-05-27 02:19:53', '2019-05-27', 1, 1);

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
('8fa632c5-86e6-4669-bdfd-28c39c386d43', 'App\\Notifications\\SendRegisterCert', 'App\\User', 6, '{"sender_id":6,"sender_name":"Hero","sender_avatar":"spider-man.jpg","request_id":104,"message":"Y\\u00eau c\\u1ea7u c\\u1ea5p ch\\u1ee9ng th\\u01b0"}', '2019-05-31 08:35:07', '2019-05-31 08:34:45', '2019-05-31 08:35:07'),
('9d024a96-c0d9-40bb-b210-7c1ed00af78f', 'App\\Notifications\\SendRegisterCert', 'App\\User', 7, '{"sender_id":6,"sender_name":"Hero","sender_avatar":"spider-man.jpg","request_id":104,"message":"Y\\u00eau c\\u1ea7u c\\u1ea5p ch\\u1ee9ng th\\u01b0"}', NULL, '2019-05-31 08:34:45', '2019-05-31 08:34:45'),
('e80ce6db-a730-421a-b787-e8abf8599230', 'App\\Notifications\\SendRegisterCert', 'App\\User', 6, '{"sender_id":6,"sender_name":"Hero","sender_avatar":"spider-man.jpg","request_id":"104","message":"Y\\u00eau c\\u1ea7u \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c x\\u1eed l\\u00fd"}', NULL, '2019-05-31 08:35:17', '2019-05-31 08:35:17');

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
(1, 'Bác Sĩ 1', 'bs1@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'KJIseHIblh9suYzKk8bugLI4POhV0cyl9UJkBI57IoNxhMAEIkrUIv2b1z0g', '2017-08-08 17:52:51', '2019-06-06 18:18:12', 2, NULL, 1, NULL, NULL),
(2, 'Bệnh nhân1', 'bn1@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'rUZvJ4kBAEXylPJ1akkSafrSkeqcwoRt6TyeXN18qecHEXEKn91iafBe2uw2', '2017-08-08 17:52:52', '2019-05-26 19:09:28', 1, NULL, 1, NULL, NULL),
(3, 'Nhân viên1', 'nv1@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'mbTaEIAUEpu0OgEDTlIdRldpUtSSTOClsoAHGSuE9T25XdC8TVhT2h0eVREM', '2017-08-08 17:52:52', '2017-10-26 20:53:06', 3, NULL, 1, NULL, NULL),
(4, 'Bác Sĩ 2', 'bs2@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'FCU1gB3RAykMssdj4YqAouN7QRZw1hJsmGp2lo2cyDaOx4wmNiwnbAvfhm2L', '2017-08-08 17:52:52', '2019-06-04 22:48:34', 2, NULL, 1, NULL, NULL),
(5, 'Bệnh nhân2', 'bn2@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'sWsm0bU8Nk23q6SWvs2eoY9TyxchatLS1MfLA6cccftmh2spMtXbYzd7GNBx', '2017-08-08 17:52:52', '2018-07-16 19:32:12', 1, NULL, 1, NULL, NULL),
(6, 'Nhân viên2', 'nv2@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'XoanrwV5IKCbpzL204YiPSKdcXhGc8eDjzSFvYtmWx894RPjAfEVbkdGwmin', '2017-08-08 17:52:52', '2018-10-11 17:52:28', 3, NULL, 1, NULL, NULL),
(7, 'Bác Sĩ 3', 'bs3@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'i0j3verGDzrwlCIc0G7UjJGHcsrBhzcxQGeVBoNhm5rVQF7G3lzxzfKJC0kM', '2017-08-08 17:52:52', '2017-08-10 02:31:03', 2, NULL, 1, NULL, NULL),
(8, 'Bệnh nhân3', 'bn3@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'lHUShG1VCXIMx8akFv2molLqQmG3JLA1gyCPJgpbWXM4Cew2FLq2fUJSkJrb', '2017-08-08 17:52:52', '2017-08-29 02:24:21', 1, NULL, 1, NULL, NULL),
(9, 'Nhân viên3', 'nv3@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'KIKyHXWQVgw4HlrnJ8SrBVaRInWR3n3yIRe2b4KIhwPsUYSI4JxZbiUItcjA', '2017-08-08 17:52:52', '2017-10-26 20:52:46', 3, NULL, 1, NULL, NULL),
(10, 'Bác Sĩ 4', 'bs4@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, '2017-08-08 17:52:52', '2017-08-14 18:08:47', 2, NULL, 1, NULL, NULL),
(11, 'Bệnh nhân4', 'bn4@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0p6v2KwhHxKY5OJRjB3l8VlpmkFn9Xz6ZI2Ym9u6L3SGanTaFI9cfRH0wgI7', '2017-08-08 17:52:52', '2017-08-31 20:17:22', 1, NULL, 1, NULL, NULL),
(12, 'Nhân viên4', 'nv4@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'KQ8Yghzt3GJHpQ1BB1QXIA5fCWaT1aVBgSaDS0qEIK23CS54yiJoMA7hrVRZ', '2017-08-08 17:52:53', '2017-10-26 20:53:24', 3, NULL, 1, NULL, NULL),
(13, 'Bác Sĩ 5', 'bs5@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'PTKLG33EVQHFVC9kwgZDx7w6BgQZnkOrmk7yloMvQEoVCPKCAK0TTxr4Hxcl', '2017-08-08 17:52:53', '2017-10-25 01:56:38', 2, NULL, 1, NULL, NULL),
(14, 'Bệnh nhân5', 'bn5@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'v3TnURD1U6s9OBKKDHNxPCz8Z1gbEdft4XurF6VXIhhE6n9ePGRix6lmWC3K', '2017-08-08 17:52:53', '2017-08-15 23:37:03', 1, NULL, 1, NULL, NULL),
(15, 'Nhân viên5', 'nv5@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'hdHrUeKY0krOsob8QFocUZOTZy3YOMY8JOS4cy8oFtlH4kknaeRR9pW1h1it', '2017-08-08 17:52:53', '2019-05-26 19:02:27', 3, NULL, 1, NULL, NULL),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `client_role`
--
ALTER TABLE `client_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `crequests`
--
ALTER TABLE `crequests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;
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

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2026 at 08:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anniversary_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bucket_list`
--

CREATE TABLE `bucket_list` (
  `id` varchar(36) NOT NULL,
  `dream` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_done` tinyint(1) DEFAULT 0,
  `done_date` date DEFAULT NULL,
  `priority` enum('someday','soon','urgent') DEFAULT 'someday',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bucket_list`
--

INSERT INTO `bucket_list` (`id`, `dream`, `description`, `is_done`, `done_date`, `priority`, `created_at`, `updated_at`) VALUES
('63c57382-3ae0-11f1-8a0c-00e04c9326a7', 'Watch a sunrise together', 'Find the most beautiful spot and watch the sun rise.', 0, NULL, 'soon', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c58962-3ae0-11f1-8a0c-00e04c9326a7', 'Buy anniversary gift', 'Look for a nice gift before our anniversary.', 0, NULL, 'urgent', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c58a26-3ae0-11f1-8a0c-00e04c9326a7', 'Travel abroad together on Thailand or Korea', 'Our first international trip as a couple.', 0, NULL, 'someday', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c58a78-3ae0-11f1-8a0c-00e04c9326a7', 'Visit you ASAP', 'I want to visit your house as soon as I can because I miss you so much and I just want to be close to you.', 0, NULL, 'urgent', '2026-04-18 04:38:04', '2026-04-18 04:58:45'),
('63c58af7-3ae0-11f1-8a0c-00e04c9326a7', 'Have a movie marathon together', 'Curl up on the couch and watch your favorite movies.', 0, NULL, 'soon', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c58b3c-3ae0-11f1-8a0c-00e04c9326a7', 'Go on a picnic', 'Bring food and hang out in a nice spot together.', 0, NULL, 'soon', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c58b7b-3ae0-11f1-8a0c-00e04c9326a7', 'Fix misunderstanding', 'Talk things out and make sure we are okay.', 0, NULL, 'urgent', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c58bb9-3ae0-11f1-8a0c-00e04c9326a7', 'live in the same house', 'Find a cozy place to call home together.', 0, NULL, 'someday', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c58bf9-3ae0-11f1-8a0c-00e04c9326a7', 'Write letters to future selves', 'Seal them and open on a future anniversary.', 0, NULL, 'someday', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c58c35-3ae0-11f1-8a0c-00e04c9326a7', 'Go on concerts together', 'Experience live music and dance the night away.', 0, NULL, 'soon', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c58c70-3ae0-11f1-8a0c-00e04c9326a7', 'Plan our next date', 'When I save up enough money, I want us to go on a date again like we used to.', 0, NULL, 'urgent', '2026-04-18 04:38:04', '2026-04-18 04:58:44'),
('63c58cad-3ae0-11f1-8a0c-00e04c9326a7', 'I\'m waiting for you to come home while I\'m at home.', 'I\'ll cook for you and then be extra clingy because I just want to be near you.', 0, NULL, 'someday', '2026-04-18 04:38:04', '2026-04-18 04:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `love_letters`
--

CREATE TABLE `love_letters` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `mood` enum('romantic','funny','grateful','apologetic','sweet') DEFAULT 'romantic',
  `is_pinned` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `love_letters`
--

INSERT INTO `love_letters` (`id`, `title`, `content`, `mood`, `is_pinned`, `created_at`, `updated_at`) VALUES
('0874ae19-01f6-4806-8b63-d6516a2797da', 'Special Day (Monthsary)', 'Happy 4 years and 4 months mami sennie, I hope you know na kahit ano man ang mangyari ayoko na maghiwalay tayo. Napaka grateful ko dahil hindi man maganda nung nangyari sa\'tin nakaraan is naayos agad natin ng wala pang 1day. pinili nating ayusin kaysa tapusin. I\'m so happy dahil palagi ka nandyan para sa\'kin, you always support me sa Acads ko... Thank you po kasi you always do your best as my partner hindi ka po nagsawa na intindihin ugali ko lalo na sa pagiging maldita at pasaway mo na jowa! I love you mamii sennie gusto ko ikaw na hanggang dulo, ayoko po sa iba hmpp!', 'grateful', 1, '2026-04-18 05:45:53', '2026-04-18 05:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `memories`
--

CREATE TABLE `memories` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `date` date NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `category` enum('first','travel','milestone','everyday','special') DEFAULT 'everyday',
  `is_favorite` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `memories`
--

INSERT INTO `memories` (`id`, `title`, `description`, `date`, `image_url`, `category`, `is_favorite`, `created_at`, `updated_at`) VALUES
('3c54c1c2-95e8-426c-973f-12db62e49c2b', 'When we sleep next to each other', 'Iykyk AHAHAHHAHA gusto ko na ulit maranasan un mami, when kaya? :(', '2023-06-08', '', 'special', 0, '2026-04-18 05:21:32', '2026-04-18 05:21:32'),
('b0c41ab9-9765-4e50-acc7-aef58643354e', 'Hang out discord', 'Ito yung pinaka matagal natin na bonding using Discord, for me Happy ako dahil nagawa natin mag bonding thru DC kahit na busy ako, nags-soundtrip us using FredBot... I hope someday magawa ulit natin \'yan.', '2023-06-08', 'https://ibb.co/xtt8dFm7', 'first', 0, '2026-04-18 05:36:20', '2026-04-18 05:36:20'),
('dcf434e9-d76f-4439-a40a-e2662419c7e2', 'Movie Marathon', 'Idk kung ano ung exact date but uhhh for me isa to sa pinaka masayang memories natin mami kasi napaka clingy natin sa isa\'t isa tapos nung inaantok na me hindi mo em pinapabayaan, natulog ako sa hita mo, tapos nung magkatabi na us sa bed rawr HUHUHUHUHU', '2023-06-08', '', 'special', 1, '2026-04-18 05:05:29', '2026-04-18 05:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `milestone_date` date NOT NULL,
  `icon` varchar(10) DEFAULT '?',
  `color` varchar(7) DEFAULT '#c9a96e',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`id`, `title`, `description`, `milestone_date`, `icon`, `color`, `created_at`, `updated_at`) VALUES
('63c2d7a6-3ae0-11f1-8a0c-00e04c9326a7', 'The Day We Started', 'December 18, 2021 — the most important date for me. At first, I had so many questions and \"what ifs\" like what if we don\'t work out, what if our families don\'t accept us. But along the way, I learned to love you even if we are both girls. You are also my first real-life girlfriend, and that makes this even more special.', '2021-12-18', '💘', '#c9a96e', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c2f7d6-3ae0-11f1-8a0c-00e04c9326a7', 'First Month Together', 'One month of falling deeper, to the point where I already wanted to tell my family that we were together. It was also the time I kept thinking about how we would work as a GxG relationship, since you were my first girlfriend and I had no experience yet.', '2022-01-18', '🌸', '#b8956a', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c2f9c2-3ae0-11f1-8a0c-00e04c9326a7', 'Our First Anniversary', 'One year of love, laughter, and everything in between. I didn\'t expect our relationship to work, so I\'m thankful you never got tired of understanding me. I also realized a lot during this time, especially how strong you are in standing for what we have despite the challenges. There were moments I wanted to give up, but I chose to stay because I truly love you and I only want you.', '2022-12-18', '🥂', '#c9a96e', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c2fa53-3ae0-11f1-8a0c-00e04c9326a7', 'Second Anniversary', 'Two years and still choosing each other every single day. We went through a lot of challenges in our relationship, but we still chose each other. We always try to fix misunderstandings right away and make things work.', '2023-12-18', '✨', '#d4a96e', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c2fab1-3ae0-11f1-8a0c-00e04c9326a7', 'Third Anniversary', 'Three years of building our world together. I made mistakes that hurt you during that time, and I\'m truly sorry for it. I wasn\'t thinking clearly and I lost sight of what mattered. But I learned from it, and I promise to be more careful with your heart and never repeat the same mistake again.', '2024-12-18', '🌹', '#c9a96e', '2026-04-18 04:38:04', '2026-04-18 04:38:04'),
('63c2fb15-3ae0-11f1-8a0c-00e04c9326a7', '4 Years & 4 Months', 'I thought our relationship would end before, but we chose to fix things instead of giving up on each other. We had misunderstandings and hard moments, but I still want you and I still choose you. I love you, and I want it to be you until the end.', '2026-04-18', '♾️', '#a0856e', '2026-04-18 04:38:04', '2026-04-18 04:38:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bucket_list`
--
ALTER TABLE `bucket_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `love_letters`
--
ALTER TABLE `love_letters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `memories`
--
ALTER TABLE `memories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

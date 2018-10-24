-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Paź 2018, 18:07
-- Wersja serwera: 10.1.33-MariaDB
-- Wersja PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `social-network-learn`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `posted_at` datetime NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `followers`
--

CREATE TABLE `followers` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `follower_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `followers`
--

INSERT INTO `followers` (`id`, `user_id`, `follower_id`) VALUES
(8, 14, 15),
(12, 17, 16);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `login_tokens`
--

CREATE TABLE `login_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `token` char(64) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `login_tokens`
--

INSERT INTO `login_tokens` (`id`, `token`, `user_id`) VALUES
(10, 'b828d3b5a926294bc10761cc1112da9e331662bd', 15);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `password_tokens`
--

CREATE TABLE `password_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `token` varchar(64) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `password_tokens`
--

INSERT INTO `password_tokens` (`id`, `token`, `user_id`) VALUES
(2, 'ba9a15e2f32e7bb16040c196609cb01ab432c81c', 11);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `body` varchar(160) NOT NULL,
  `posted_at` datetime NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `likes` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `posts`
--

INSERT INTO `posts` (`id`, `body`, `posted_at`, `user_id`, `likes`) VALUES
(1, 'hello world', '2018-10-10 15:22:17', 16, 0),
(2, 'test!', '2018-10-10 15:22:22', 16, 0),
(3, 'test!', '2018-10-10 15:25:55', 16, 0),
(4, 'test!', '2018-10-10 15:27:26', 16, 0),
(5, 'test!', '2018-10-10 15:30:24', 16, 0),
(6, 'hey', '2018-10-10 15:40:08', 17, 0),
(7, 'hey', '2018-10-10 15:45:30', 17, 0),
(8, 'hey', '2018-10-10 16:07:59', 17, 0),
(9, 'hey', '2018-10-10 16:08:47', 17, 0),
(10, 'what', '2018-10-10 16:08:59', 17, 1),
(11, 'hey', '2018-10-17 14:18:28', 17, 0),
(12, 'hey <b>hey </b>', '2018-10-17 14:21:03', 17, 2),
(13, 'hey <b>hey </b>', '2018-10-17 14:27:35', 17, 0),
(14, 'hello from Post.php', '2018-10-17 17:50:52', 17, 1),
(15, 'hello from Post.php', '2018-10-17 18:01:28', 17, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post_likes`
--

CREATE TABLE `post_likes` (
  `id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `post_likes`
--

INSERT INTO `post_likes` (`id`, `post_id`, `user_id`) VALUES
(11, 10, 17),
(13, 12, 18),
(19, 15, 17),
(21, 14, 17),
(22, 12, 17);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` text NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `verified`) VALUES
(15, 'tron', '$2y$10$LFbJ5UByePHvUt85zOJnR.wuDBVjrXze2BcBT6J5fgmLXMwE73SBW', 'tron@tron.com', 1),
(16, 'Verified', '$2y$10$YQ5eTXld/UWs2/qa0qHQ8utTBvUvQTtNbHJIDXEM5fKMiyWxrc6Uq', 'Verified@Verified.com', 0),
(17, 'matrix', '$2y$10$Hk78drTmd8hK6k06QxCSpus7u0twDRFBvC19hywcYvmawAV29VemO', 'matrix@matrix.com', 1),
(18, 'czlowiek', '$2y$10$TKv91laO1T6crdZCkNvfCOeKA834wJaDspIpJMfKZ8XmFCe6U8d6O', 'czlowiek@czlowiek.com', 0);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indeksy dla tabeli `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `login_tokens`
--
ALTER TABLE `login_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `password_tokens`
--
ALTER TABLE `password_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indeksy dla tabeli `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `login_tokens`
--
ALTER TABLE `login_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `password_tokens`
--
ALTER TABLE `password_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Ograniczenia dla tabeli `login_tokens`
--
ALTER TABLE `login_tokens`
  ADD CONSTRAINT `login_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

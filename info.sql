-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 12 2024 г., 09:00
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `info`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'видеокарты'),
(2, 'материнские платы'),
(3, 'процессоры'),
(4, 'все товары'),
(5, 'аааааааа');

-- --------------------------------------------------------

--
-- Структура таблицы `dns`
--

CREATE TABLE `dns` (
  `id` int NOT NULL,
  `img` varchar(100) NOT NULL,
  `price` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `about` varchar(100) NOT NULL,
  `about1` varchar(100) NOT NULL,
  `about2` varchar(100) NOT NULL,
  `about3` varchar(100) NOT NULL,
  `about4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `dns`
--

INSERT INTO `dns` (`id`, `img`, `price`, `about`, `about1`, `about2`, `about3`, `about4`, `name`, `category`) VALUES
(1, '1.png', '15 000 руб', 'фывфвцыф', 'фывфычфф', '21313вфаыф', 'ииииыаиы', 'папапапапара', 'видеокарта прок', 'видеокарты'),
(2, '2.png', '30 000 руб', 'фывфяч', 'яяяяячф', 'фыфафафафффффф', 'павпапапап', 'гогогоглг', 'видеокарта абоб', 'материнские платы'),
(3, '3.png', '888', 'фвфывф', 'вфвфы', 'ввввв', 'смсмсмсис', 'ророро', 'ждун', 'процессоры'),
(4, '', '34343', '', 'ddd', 'ffff', 'gggg', 'hhhh', 'adsada', 'видеокарты'),
(5, '11.png', '777777777', '', 'ggg', 'hhhh', 'jjj', 'kkk', 'urra', 'видеокарты');

-- --------------------------------------------------------

--
-- Структура таблицы `korzina`
--

CREATE TABLE `korzina` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `about1` varchar(100) NOT NULL,
  `kolvo` int NOT NULL,
  `price` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `id_dns` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `korzina`
--

INSERT INTO `korzina` (`id`, `name`, `img`, `about1`, `kolvo`, `price`, `login`, `id_dns`) VALUES
(1, 'видеокарта прок', '1.png', 'фывфычфф', 23, '15 000 руб', 'zdun2', 1),
(2, 'видеокарта абоб', '2.png', 'яяяяячф', 20, '30 000 руб', 'zdun2', 2),
(3, 'ждун', '3.png', 'вфвфы', 1, '888', '', 3),
(4, 'ждун', '3.png', 'вфвфы', 1, '888', 'noobik', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`) VALUES
(1, 'Новость тест', 'тест текста проверка тест проверка тест проверка', 'img1.jpeg');

-- --------------------------------------------------------

--
-- Структура таблицы `raspisanie`
--

CREATE TABLE `raspisanie` (
  `id` int NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `day` varchar(20) NOT NULL,
  `pair1` varchar(100) DEFAULT NULL,
  `pair2` varchar(100) DEFAULT NULL,
  `pair3` varchar(100) DEFAULT NULL,
  `pair4` varchar(100) DEFAULT NULL,
  `pair5` varchar(100) DEFAULT NULL,
  `pair6` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `raspisanie`
--

INSERT INTO `raspisanie` (`id`, `group_name`, `day`, `pair1`, `pair2`, `pair3`, `pair4`, `pair5`, `pair6`) VALUES
(1, 'КИТ', 'Понедельник', 'ФИЗМАТ', 'математика', '', '', '', ''),
(2, 'КИТ', 'Вторник', 'Информатика', 'География', 'Физкультура', 'Русский язык', 'Литература', 'Биология'),
(3, 'КИТ', 'Среда', 'Физика', 'Английский язык', 'История', 'Физкультура', 'Математика', 'География'),
(4, 'ФЛФ', 'Понедельник', 'История России', 'и', 'а', 'р', 'н', 'н'),
(5, 'ФЛФ', 'Вторник', 'Биология', 'Информатика', 'Литература', 'География', 'Английский язык', 'Математика'),
(6, 'ФЛФ', 'Среда', 'Математика', 'Физика', 'География', 'Физкультура', 'Химия', 'Информатика'),
(7, 'ИЕН', 'Понедельник', 'Математика', 'Физика', 'Химия', 'История', 'Литература', 'Биология'),
(8, 'ИЕН', 'Вторник', 'Информатика', 'География', 'Физкультура', 'Русский язык', 'Литература', 'Биология'),
(9, 'ИЕН', 'Среда', 'Физика', 'Английский язык', 'История', 'Физкультура', 'Математика', 'География'),
(10, 'ИП', 'Понедельник', 'Физика', 'История', 'Химия', 'Математика', 'Физкультура', 'Русский язык'),
(11, 'ИП', 'Вторник', 'Биология', 'Информатика', 'Литература', 'География', 'Английский язык', 'Математика'),
(12, 'ИП', 'Среда', 'Математика', 'Физика', 'География', 'Физкультура', 'Химия', 'Информатика'),
(13, 'ПИ', 'Понедельник', 'Физика', 'История', 'Химия', 'Математика', 'Физкультура', 'Русский язык'),
(14, 'ПИ', 'Вторник', 'Биология', 'Информатика', 'Литература', 'География', 'Английский язык', 'Математика'),
(15, 'ПИ', 'Среда', 'Математика', 'Физика', 'География', 'Физкультура', 'Химия', 'Информатика'),
(16, 'ИФ', 'Понедельник', 'Физика', 'История', 'Химия', 'Математика', 'Физкультура', 'Русский язык'),
(17, 'ИФ', 'Вторник', 'Биология', 'Информатика', 'Литература', 'География', 'Английский язык', 'Математика'),
(18, 'ИФ', 'Среда', 'Математика', 'Физика', 'География', 'Физкультура', 'Химия', 'Информатика'),
(19, 'КИТ', 'Четверг', 'Математика', 'Физика', 'Химия', 'История', 'Литература', 'Биология'),
(20, 'КИТ', 'Пятница', 'Информатика', 'География', 'Физкультура', 'Русский язык', 'Литература', 'Биология'),
(21, 'КИТ', 'Суббота', 'Физика', 'Английский язык', 'История', 'Физкультура', 'Математика', 'География'),
(22, 'ФЛФ', 'Четверг', 'Физика', 'История', 'Химия', 'Математика', 'Физкультура', 'Русский язык'),
(23, 'ФЛФ', 'Пятница', 'Биология', 'Информатика', 'Литература', 'География', 'Английский язык', 'Математика'),
(24, 'ФЛФ', 'Суббота', 'Математика', 'Физика', 'География', 'Физкультура', 'Химия', 'Информатика'),
(25, 'ИЕН', 'Четверг', 'Математика', 'Физика', 'Химия', 'История', 'Литература', 'Биология'),
(26, 'ИЕН', 'Пятница', 'Информатика', 'География', 'Физкультура', 'Русский язык', 'Литература', 'Биология'),
(27, 'ИЕН', 'Суббота', 'Физика', 'Английский язык', 'История', 'Физкультура', 'Математика', 'География'),
(28, 'ИП', 'Четверг', 'Физика', 'История', 'Химия', 'Математика', 'Физкультура', 'Русский язык'),
(29, 'ИП', 'Пятница', 'Биология', 'Информатика', 'Литература', 'География', 'Английский язык', 'Математика'),
(30, 'ИП', 'Суббота', 'Математика', 'Физика', 'География', 'Физкультура', 'Химия', 'Информатика'),
(31, 'ПИ', 'Четверг', 'Физика', 'История', 'Химия', 'Математика', 'Физкультура', 'Русский язык'),
(32, 'ПИ', 'Пятница', 'Биология', 'Информатика', 'Литература', 'География', 'Английский язык', 'Математика'),
(33, 'ПИ', 'Суббота', 'Математика', 'Физика', 'География', 'Физкультура', 'Химия', 'Информатика'),
(34, 'ИФ', 'Четверг', 'Физика', 'История', 'Химия', 'Математика', 'Физкультура', 'Русский язык'),
(35, 'ИФ', 'Пятница', 'Биология', 'Информатика', 'Литература', 'География', 'Английский язык', 'Математика'),
(36, 'ИФ', 'Суббота', 'Математика', 'Физика', 'География', 'Физкультура', 'Химия', 'Информатика'),
(37, 'ЮФ', 'Понедельник', 'Математика', 'Физика', 'Химия', 'История', 'Литература', 'Биология'),
(38, 'ЮФ', 'Вторник', 'Информатика', 'География', 'Физкультура', 'Русский язык', 'Литература', 'Биология'),
(39, 'ЮФ', 'Среда', 'Физика', 'Английский язык', 'История', 'Физкультура', 'Математика', 'География'),
(40, 'ЮФ', 'Четверг', 'Математика', 'Физика', 'Химия', 'История', 'Литература', 'Биология'),
(41, 'ЮФ', 'Пятница', 'Информатика', 'География', 'Физкультура', 'Русский язык', 'Литература', 'Биология'),
(42, 'ЮФ', 'Суббота', 'Физика', 'Английский язык', 'История', 'Физкультура', 'Математика', 'География');

-- --------------------------------------------------------

--
-- Структура таблицы `raspisanie2`
--

CREATE TABLE `raspisanie2` (
  `id` int NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `day` varchar(20) NOT NULL,
  `pair1` varchar(100) DEFAULT NULL,
  `pair2` varchar(100) DEFAULT NULL,
  `pair3` varchar(100) DEFAULT NULL,
  `pair4` varchar(100) DEFAULT NULL,
  `pair5` varchar(100) DEFAULT NULL,
  `pair6` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `raspisanie2`
--

INSERT INTO `raspisanie2` (`id`, `group_name`, `day`, `pair1`, `pair2`, `pair3`, `pair4`, `pair5`, `pair6`) VALUES
(1, 'КИТ', 'Понедельник', 'Математика', 'Физика', 'Химия', 'История', 'Литература', 'Биология'),
(2, 'КИТ', 'Вторник', 'Информатика', 'География', 'Физкультура', 'Русский язык', 'Литература', 'Биология'),
(3, 'КИТ', 'Среда', 'Физика', 'Английский язык', 'История', 'Физкультура', 'Математика', 'География'),
(4, 'ФЛФ', 'Понедельник', 'Физика', 'История', 'Химия', 'Математика', 'Физкультура', 'Русский язык'),
(5, 'ФЛФ', 'Вторник', 'Биология', 'Информатика', 'Литература', 'География', 'Английский язык', 'Математика'),
(6, 'ФЛФ', 'Среда', 'Математика', 'Физика', 'География', 'Физкультура', 'Химия', 'Информатика');

-- --------------------------------------------------------

--
-- Структура таблицы `reg`
--

CREATE TABLE `reg` (
  `login` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mail` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pass` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adres` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(11) NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `reg`
--

INSERT INTO `reg` (`login`, `mail`, `pass`, `img`, `adres`, `tel`, `status`, `id`) VALUES
('2', '', '', '1.png', '', '0', '0', 3),
('2', '2', '', '1.png', '', '0', '0', 4),
('svinenok', 'svin@mail.ru', 'abu', '1.png', '', '0', '1', 5),
('svinenok', 'svin@mail.ru', '11', '1.png', '', '0', '0', 6),
('zdun2', 'abuuu@mail.ru', '1234', '1.png', '', '12312313123131', '0', 7),
('1234', '123', '123', '1.png', '', '0', '0', 12),
('noobik', 'noobikpvppro@mail.ru', 'poop', '1.png', '', '0', '0', 13),
('test', 'test@mail.ru', '11', '0000.jpg', 'yak', '555555', '0', 14),
('ooooo', 'o@mail.ru', '11', '9.png', 'ddd', '66767', '0', 15),
('', '', '', '1.png', '', '0', '0', 16),
('', '2@mail.ru', '33', '1.png', '', '0', '0', 17),
('ishak', '2@mail.ru', '2', '1.png', '', '0', '0', 18),
('zduzeba', 'pepa@mail.ru', '1', '1.png', '', '0', '0', 19),
('admin', 'admin@mail.ru', 'admin', '1.png', '', '0', '1', 20);

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

CREATE TABLE `schedule` (
  `group_name` int NOT NULL,
  `day` varchar(100) NOT NULL,
  `pair1` varchar(100) NOT NULL,
  `pair2` varchar(100) NOT NULL,
  `pair3` varchar(100) NOT NULL,
  `pair4` varchar(100) NOT NULL,
  `pair5` varchar(100) NOT NULL,
  `pair6` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `dns`
--
ALTER TABLE `dns`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `korzina`
--
ALTER TABLE `korzina`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `raspisanie`
--
ALTER TABLE `raspisanie`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `raspisanie2`
--
ALTER TABLE `raspisanie2`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reg`
--
ALTER TABLE `reg`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`group_name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `dns`
--
ALTER TABLE `dns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `korzina`
--
ALTER TABLE `korzina`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `raspisanie`
--
ALTER TABLE `raspisanie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT для таблицы `raspisanie2`
--
ALTER TABLE `raspisanie2`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `reg`
--
ALTER TABLE `reg`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

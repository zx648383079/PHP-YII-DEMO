-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-05-24 04:11:02
-- 服务器版本： 5.5.47
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `first`
--

-- --------------------------------------------------------

--
-- 表的结构 `zd_auth_assignment`
--

CREATE TABLE `zd_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created_at` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zd_auth_assignment`
--

INSERT INTO `zd_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('超级管理员', 10000, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zd_auth_item`
--

CREATE TABLE `zd_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zd_auth_item`
--

INSERT INTO `zd_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('超级管理员', 1, '拥有最高权限', NULL, NULL, NULL, NULL),
('/*', 2, NULL, NULL, NULL, 1464059833, 1464059833);

-- --------------------------------------------------------

--
-- 表的结构 `zd_auth_item_child`
--

CREATE TABLE `zd_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zd_auth_item_child`
--

INSERT INTO `zd_auth_item_child` (`parent`, `child`) VALUES
('超级管理员', '/*');

-- --------------------------------------------------------

--
-- 表的结构 `zd_auth_rule`
--

CREATE TABLE `zd_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_chat`
--

CREATE TABLE `zd_chat` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `send_id` int(10) DEFAULT NULL,
  `content` text,
  `created_at` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_feedback`
--

CREATE TABLE `zd_feedback` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `content` text NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_group`
--

CREATE TABLE `zd_group` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `preferential` varchar(255) DEFAULT NULL COMMENT '会员优惠信息',
  `start_at` int(10) DEFAULT NULL COMMENT '开始时间',
  `end_at` int(10) DEFAULT NULL COMMENT '行程结束时间',
  `content` text,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL COMMENT '所属区域',
  `count` int(10) DEFAULT NULL COMMENT '报名人数',
  `deadline` int(10) DEFAULT NULL COMMENT '报名截止时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_group_agent`
--

CREATE TABLE `zd_group_agent` (
  `group_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_group_enroll`
--

CREATE TABLE `zd_group_enroll` (
  `id` int(10) NOT NULL,
  `group_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_group_focus`
--

CREATE TABLE `zd_group_focus` (
  `id` int(10) NOT NULL,
  `goup_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_group_house`
--

CREATE TABLE `zd_group_house` (
  `group_id` int(10) NOT NULL,
  `house_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_group_map`
--

CREATE TABLE `zd_group_map` (
  `group_id` int(10) NOT NULL,
  `point` varchar(100) DEFAULT NULL,
  `position` int(10) DEFAULT NULL COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_house`
--

CREATE TABLE `zd_house` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(200) NOT NULL,
  `area` int(4) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `kind` int(2) DEFAULT NULL,
  `floor` varchar(45) DEFAULT NULL,
  `recommend` tinyint(1) DEFAULT '0' COMMENT '推荐',
  `fixtures` varchar(45) DEFAULT NULL,
  `content` text,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_house_agent`
--

CREATE TABLE `zd_house_agent` (
  `house_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_house_comment`
--

CREATE TABLE `zd_house_comment` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `star` int(2) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `content` text,
  `image` text,
  `created_at` int(10) DEFAULT NULL,
  `house_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_house_enroll`
--

CREATE TABLE `zd_house_enroll` (
  `id` int(10) NOT NULL,
  `house_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_house_focus`
--

CREATE TABLE `zd_house_focus` (
  `id` int(10) NOT NULL,
  `house_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_house_image`
--

CREATE TABLE `zd_house_image` (
  `house_id` int(10) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_menu`
--

CREATE TABLE `zd_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_news`
--

CREATE TABLE `zd_news` (
  `id` int(10) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `thumb` varchar(100) DEFAULT NULL,
  `content` text,
  `user_id` int(10) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_news_push`
--

CREATE TABLE `zd_news_push` (
  `id` int(10) NOT NULL,
  `news_id` int(10) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_option`
--

CREATE TABLE `zd_option` (
  `id` int(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_purpose`
--

CREATE TABLE `zd_purpose` (
  `id` int(10) NOT NULL COMMENT '购房意向',
  `user_id` int(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `content` text,
  `kind` int(2) DEFAULT NULL COMMENT '类型',
  `price` int(2) DEFAULT NULL COMMENT '价位',
  `area` int(2) DEFAULT NULL COMMENT '面积',
  `created_at` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_question`
--

CREATE TABLE `zd_question` (
  `id` int(10) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  `user_id` int(10) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_question_answer`
--

CREATE TABLE `zd_question_answer` (
  `id` int(10) NOT NULL,
  `content` text,
  `user_id` int(10) DEFAULT NULL,
  `question_id` int(10) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_user`
--

CREATE TABLE `zd_user` (
  `id` int(10) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password_hash` varchar(64) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `sex` enum('男','女') DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password_reset_token` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `auth_key` varchar(45) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL,
  `created_ip` varchar(20) DEFAULT NULL,
  `last_at` int(10) DEFAULT NULL,
  `last_ip` varchar(20) DEFAULT NULL,
  `updated_ip` varchar(20) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `status` int(2) DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zd_user`
--

INSERT INTO `zd_user` (`id`, `phone`, `password_hash`, `avatar`, `sex`, `username`, `password_reset_token`, `email`, `auth_key`, `created_at`, `created_ip`, `last_at`, `last_ip`, `updated_ip`, `updated_at`, `status`) VALUES
(10000, '18612451245', '$2y$13$Tv/nItT717uSPl5ym7fHbuq.NrvNvywfDN3paJKoEEf5VInm/UhMy', NULL, '男', 'admin', NULL, 'admin@admin.com', 'pb8u2tsi3vXF7mZm57Ft5uVSLwImbctA', NULL, NULL, NULL, NULL, NULL, NULL, 10);

-- --------------------------------------------------------

--
-- 表的结构 `zd_user_agent`
--

CREATE TABLE `zd_user_agent` (
  `user_id` int(10) NOT NULL,
  `age` int(10) DEFAULT NULL COMMENT '从业年龄',
  `phone` varchar(20) DEFAULT NULL,
  `grade` int(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `bank` varchar(100) DEFAULT NULL,
  `card` varchar(100) DEFAULT NULL,
  `card_image` text,
  `photo` text,
  `company` varchar(255) DEFAULT NULL,
  `company_phone` varchar(20) DEFAULT NULL,
  `charge` varchar(45) DEFAULT NULL COMMENT '负责人',
  `status` tinyint(1) DEFAULT NULL COMMENT '审核是否通过'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_user_oauth`
--

CREATE TABLE `zd_user_oauth` (
  `user_id` int(10) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `identity` varchar(100) DEFAULT NULL COMMENT '第三方标识符',
  `content` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zd_user_service`
--

CREATE TABLE `zd_user_service` (
  `user_id` int(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `zd_auth_assignment`
--
ALTER TABLE `zd_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `fk_user_idx` (`user_id`);

--
-- Indexes for table `zd_auth_item`
--
ALTER TABLE `zd_auth_item`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `zd_auth_item_child`
--
ALTER TABLE `zd_auth_item_child`
  ADD PRIMARY KEY (`parent`);

--
-- Indexes for table `zd_auth_rule`
--
ALTER TABLE `zd_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `zd_chat`
--
ALTER TABLE `zd_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_chat_idx` (`user_id`),
  ADD KEY `send_user_idx` (`send_id`);

--
-- Indexes for table `zd_feedback`
--
ALTER TABLE `zd_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_idx` (`user_id`);

--
-- Indexes for table `zd_group`
--
ALTER TABLE `zd_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zd_group_agent`
--
ALTER TABLE `zd_group_agent`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `fk_user_idx` (`user_id`);

--
-- Indexes for table `zd_group_enroll`
--
ALTER TABLE `zd_group_enroll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_group_idx` (`group_id`),
  ADD KEY `fk_user_idx` (`user_id`);

--
-- Indexes for table `zd_group_focus`
--
ALTER TABLE `zd_group_focus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_group_idx` (`goup_id`),
  ADD KEY `fk_user_idx` (`user_id`);

--
-- Indexes for table `zd_group_house`
--
ALTER TABLE `zd_group_house`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `fk_house_idx` (`house_id`);

--
-- Indexes for table `zd_group_map`
--
ALTER TABLE `zd_group_map`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `zd_house`
--
ALTER TABLE `zd_house`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zd_house_agent`
--
ALTER TABLE `zd_house_agent`
  ADD PRIMARY KEY (`house_id`),
  ADD KEY `fk_user_idx` (`user_id`);

--
-- Indexes for table `zd_house_comment`
--
ALTER TABLE `zd_house_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_idx` (`user_id`),
  ADD KEY `fk_house_idx` (`house_id`);

--
-- Indexes for table `zd_house_enroll`
--
ALTER TABLE `zd_house_enroll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_idx` (`user_id`),
  ADD KEY `fk_house_idx` (`house_id`);

--
-- Indexes for table `zd_house_focus`
--
ALTER TABLE `zd_house_focus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_house_idx` (`house_id`),
  ADD KEY `fk_user_idx` (`user_id`);

--
-- Indexes for table `zd_house_image`
--
ALTER TABLE `zd_house_image`
  ADD PRIMARY KEY (`house_id`);

--
-- Indexes for table `zd_menu`
--
ALTER TABLE `zd_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `zd_news`
--
ALTER TABLE `zd_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_idx` (`user_id`);

--
-- Indexes for table `zd_news_push`
--
ALTER TABLE `zd_news_push`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_idx` (`user_id`),
  ADD KEY `fk_news_idx` (`news_id`);

--
-- Indexes for table `zd_option`
--
ALTER TABLE `zd_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zd_purpose`
--
ALTER TABLE `zd_purpose`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_idx` (`user_id`);

--
-- Indexes for table `zd_question`
--
ALTER TABLE `zd_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_idx` (`user_id`);

--
-- Indexes for table `zd_question_answer`
--
ALTER TABLE `zd_question_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_idx` (`user_id`),
  ADD KEY `fk_question_idx` (`question_id`);

--
-- Indexes for table `zd_user`
--
ALTER TABLE `zd_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zd_user_agent`
--
ALTER TABLE `zd_user_agent`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `zd_user_oauth`
--
ALTER TABLE `zd_user_oauth`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `zd_user_service`
--
ALTER TABLE `zd_user_service`
  ADD PRIMARY KEY (`user_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `zd_chat`
--
ALTER TABLE `zd_chat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_feedback`
--
ALTER TABLE `zd_feedback`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_group`
--
ALTER TABLE `zd_group`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_group_enroll`
--
ALTER TABLE `zd_group_enroll`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_house`
--
ALTER TABLE `zd_house`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_house_comment`
--
ALTER TABLE `zd_house_comment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_house_enroll`
--
ALTER TABLE `zd_house_enroll`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_house_focus`
--
ALTER TABLE `zd_house_focus`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_menu`
--
ALTER TABLE `zd_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_news`
--
ALTER TABLE `zd_news`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_news_push`
--
ALTER TABLE `zd_news_push`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_option`
--
ALTER TABLE `zd_option`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_purpose`
--
ALTER TABLE `zd_purpose`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '购房意向';
--
-- 使用表AUTO_INCREMENT `zd_question`
--
ALTER TABLE `zd_question`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_question_answer`
--
ALTER TABLE `zd_question_answer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `zd_user`
--
ALTER TABLE `zd_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10001;
--
-- 限制导出的表
--

--
-- 限制表 `zd_menu`
--
ALTER TABLE `zd_menu`
  ADD CONSTRAINT `zd_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `zd_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

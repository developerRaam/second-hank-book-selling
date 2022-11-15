-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2022 at 03:12 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `apps_address`
--

CREATE TABLE `apps_address` (
  `id` bigint(20) NOT NULL,
  `house_no` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `user_id_id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `apps_cart`
--

CREATE TABLE `apps_cart` (
  `id` bigint(20) NOT NULL,
  `user_id_id` bigint(20) DEFAULT NULL,
  `product_id_id` bigint(20) DEFAULT NULL,
  `quantity` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apps_cart`
--

INSERT INTO `apps_cart` (`id`, `user_id_id`, `product_id_id`, `quantity`) VALUES
(125, 1, 8, '4'),
(126, 1, 9, '1');

-- --------------------------------------------------------

--
-- Table structure for table `apps_category`
--

CREATE TABLE `apps_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `slug` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apps_category`
--

INSERT INTO `apps_category` (`id`, `name`, `image`, `slug`) VALUES
(6, 'Full Shirt', 'category/p1.png', 'full-shirt'),
(7, 'Half Shirt', 'category/p11_RDh7UYv.png', 'half-shirt'),
(8, 'Girl Item', 'category/p3.png', 'girl-item');

-- --------------------------------------------------------

--
-- Table structure for table `apps_orderitem`
--

CREATE TABLE `apps_orderitem` (
  `id` bigint(20) NOT NULL,
  `order_id_id` bigint(20) NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `apps_ordermaster`
--

CREATE TABLE `apps_ordermaster` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `house_no` varchar(20) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `total_price` double NOT NULL,
  `payment_mode` varchar(150) NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `payment_request_id` varchar(255) DEFAULT NULL,
  `payment_status` varchar(50) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `tracking_no` varchar(150) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id_id` bigint(20) NOT NULL,
  `mobile` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `apps_product`
--

CREATE TABLE `apps_product` (
  `id` bigint(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_mrp` int(11) NOT NULL,
  `product_desc` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `categoryId_id` bigint(20) NOT NULL,
  `slug` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apps_product`
--

INSERT INTO `apps_product` (`id`, `product_name`, `product_image`, `product_price`, `product_mrp`, `product_desc`, `created_at`, `categoryId_id`, `slug`) VALUES
(8, 'Men\'s Shirt', 'products/p2_S2bXmbu.png', 1500, 2000, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li><span class=\"a-list-item\">Care Instructions: Machine Wash</span></li>\r\n<li><span class=\"a-list-item\">Fit Type: Regular Fit</span></li>\r\n</ul>', '2022-10-02 15:12:23.326623', 6, 'mens-shirt'),
(9, 'Men\'s half Shirt', 'products/p11_Kt9GDkS.png', 1000, 1500, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li><span class=\"a-list-item\">Care Instructions: Machine Wash</span></li>\r\n<li><span class=\"a-list-item\">Fit Type: Regular Fit</span></li>\r\n</ul>', '2022-10-02 15:12:46.958598', 7, 'mens-half-shirt'),
(10, 'Girls Item', 'products/p4_w1J84P2.png', 2200, 3000, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li><span class=\"a-list-item\">Care Instructions: Machine Wash</span></li>\r\n<li><span class=\"a-list-item\">Fit Type: Regular</span></li>\r\n<li><span class=\"a-list-item\">Fit Type: Regular Fit,Comfortable</span></li>\r\n<li><span class=\"a-list-item\">Girls Beautiful one piece frock</span></li>\r\n<li><span class=\"a-list-item\">Regular fit Dress</span></li>\r\n<li><span class=\"a-list-item\">100% Rayon</span></li>\r\n<li><span class=\"a-list-item\">Comfortable and stylish</span></li>\r\n</ul>', '2022-10-02 15:13:11.484749', 8, 'girls-item'),
(11, 'Cotton Half Sleeve Solid', 'products/p1_p2iH4fA.png', 1000, 1500, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li><span class=\"a-list-item\">Care Instructions: Machine Wash</span></li>\r\n<li><span class=\"a-list-item\">Fit Type: Regular Fit</span></li>\r\n</ul>', '2022-10-10 12:23:18.726764', 6, 'cotton-half-sleeve-solid');

-- --------------------------------------------------------

--
-- Table structure for table `apps_productimage`
--

CREATE TABLE `apps_productimage` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `product_name_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apps_productimage`
--

INSERT INTO `apps_productimage` (`id`, `image`, `product_name_id`) VALUES
(13, 'products/p1_ZRmsgHx.png', 8),
(14, 'products/p3_sWVvOHV.png', 10);

-- --------------------------------------------------------

--
-- Table structure for table `apps_user_profile`
--

CREATE TABLE `apps_user_profile` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(20) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apps_user_profile`
--

INSERT INTO `apps_user_profile` (`id`, `full_name`, `mobile`, `email`, `password`) VALUES
(1, 'ram', '2147483647', 'abc@gmail.com', '12345'),
(2, 'ram', '9809654646', 'abc1@gmail.com', '123'),
(3, 'ram', '9807821070', 'abc2@gmail.com', '12345'),
(5, 'Amit', '1234567890', 'xyz@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `apps_whishlist`
--

CREATE TABLE `apps_whishlist` (
  `id` bigint(20) NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  `user_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add product image', 7, 'add_productimage'),
(26, 'Can change product image', 7, 'change_productimage'),
(27, 'Can delete product image', 7, 'delete_productimage'),
(28, 'Can view product image', 7, 'view_productimage'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add cart', 10, 'add_cart'),
(38, 'Can change cart', 10, 'change_cart'),
(39, 'Can delete cart', 10, 'delete_cart'),
(40, 'Can view cart', 10, 'view_cart'),
(41, 'Can add address', 11, 'add_address'),
(42, 'Can change address', 11, 'change_address'),
(43, 'Can delete address', 11, 'delete_address'),
(44, 'Can view address', 11, 'view_address'),
(45, 'Can add user', 12, 'add_user'),
(46, 'Can change user', 12, 'change_user'),
(47, 'Can delete user', 12, 'delete_user'),
(48, 'Can view user', 12, 'view_user'),
(49, 'Can add whishlist', 13, 'add_whishlist'),
(50, 'Can change whishlist', 13, 'change_whishlist'),
(51, 'Can delete whishlist', 13, 'delete_whishlist'),
(52, 'Can view whishlist', 13, 'view_whishlist'),
(53, 'Can add user_profile', 12, 'add_user_profile'),
(54, 'Can change user_profile', 12, 'change_user_profile'),
(55, 'Can delete user_profile', 12, 'delete_user_profile'),
(56, 'Can view user_profile', 12, 'view_user_profile'),
(57, 'Can add order master', 14, 'add_ordermaster'),
(58, 'Can change order master', 14, 'change_ordermaster'),
(59, 'Can delete order master', 14, 'delete_ordermaster'),
(60, 'Can view order master', 14, 'view_ordermaster'),
(61, 'Can add order item', 15, 'add_orderitem'),
(62, 'Can change order item', 15, 'change_orderitem'),
(63, 'Can delete order item', 15, 'delete_orderitem'),
(64, 'Can view order item', 15, 'view_orderitem');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$2qGrdqHVmGuC0IwzW6Ng65$C2xQSlBPZUK7gSGBYXn8fO8j5Ti41eUI2aIqQQPl120=', '2022-10-10 12:17:31.968661', 1, 'admin', '', '', 'abc@gmail.com', 1, 1, '2022-09-30 10:47:14.207743');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-09-30 10:48:50.104056', '1', 'Full Shirt', 1, '[{\"added\": {}}]', 8, 1),
(2, '2022-09-30 10:50:03.736831', '2', 'Half Shirt', 1, '[{\"added\": {}}]', 8, 1),
(3, '2022-09-30 10:50:18.494317', '3', 'Girl Item', 1, '[{\"added\": {}}]', 8, 1),
(4, '2022-09-30 10:51:31.585149', '1', 'Men\'s Shirt', 1, '[{\"added\": {}}]', 9, 1),
(5, '2022-09-30 10:52:03.713622', '2', 'Men\'s half Shirt', 1, '[{\"added\": {}}]', 9, 1),
(6, '2022-09-30 10:53:34.678444', '3', 'Girls Item', 1, '[{\"added\": {}}]', 9, 1),
(7, '2022-09-30 10:54:25.218162', '4', 'Girls Item 2', 1, '[{\"added\": {}}]', 9, 1),
(8, '2022-09-30 13:16:04.634047', '4', 'Girls Item 2', 2, '[{\"changed\": {\"fields\": [\"Product desc\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (1)\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (2)\"}}]', 9, 1),
(9, '2022-09-30 13:16:41.563172', '1', 'Men\'s Shirt', 2, '[{\"changed\": {\"fields\": [\"Product desc\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (3)\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (4)\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (5)\"}}]', 9, 1),
(10, '2022-09-30 13:36:08.297561', '2', 'Men\'s half Shirt', 2, '[{\"changed\": {\"fields\": [\"Product desc\"]}}]', 9, 1),
(11, '2022-09-30 15:12:01.627523', '1', 'Men\'s Shirt', 2, '[{\"changed\": {\"fields\": [\"Product desc\"]}}]', 9, 1),
(12, '2022-09-30 15:14:59.106539', '3', 'Girls Item', 2, '[{\"changed\": {\"fields\": [\"Product desc\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"Girls Item\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Girls Item\"}}]', 9, 1),
(13, '2022-10-01 05:41:33.612780', '2', 'Men\'s half Shirt', 2, '[{\"added\": {\"name\": \"product image\", \"object\": \"Men\'s half Shirt\"}}]', 9, 1),
(14, '2022-10-01 08:26:26.015080', '5', 'Girls Item', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Girls Item\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Girls Item\"}}]', 9, 1),
(15, '2022-10-01 19:38:46.321022', '3', 'Girl Item', 2, '[]', 8, 1),
(16, '2022-10-01 19:38:50.184517', '2', 'Half Shirt', 2, '[]', 8, 1),
(17, '2022-10-01 19:38:52.940344', '1', 'Full Shirt', 2, '[]', 8, 1),
(18, '2022-10-02 11:14:06.284614', '3', 'Girl Item', 3, '', 8, 1),
(19, '2022-10-02 11:14:06.362403', '2', 'Half Shirt', 3, '', 8, 1),
(20, '2022-10-02 11:14:06.418256', '1', 'Full Shirt', 3, '', 8, 1),
(21, '2022-10-02 11:14:42.472903', '4', 'Java', 1, '[{\"added\": {}}]', 8, 1),
(22, '2022-10-02 11:14:55.896711', '5', 'Python', 1, '[{\"added\": {}}]', 8, 1),
(23, '2022-10-02 11:15:42.101022', '6', 'Java Programming', 1, '[{\"added\": {}}]', 9, 1),
(24, '2022-10-02 11:16:07.318137', '7', 'Python Programming', 1, '[{\"added\": {}}]', 9, 1),
(25, '2022-10-02 12:51:45.339458', '7', 'Python Programming', 2, '[{\"added\": {\"name\": \"product image\", \"object\": \"Python Programming\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Python Programming\"}}]', 9, 1),
(26, '2022-10-02 15:09:41.450763', '5', 'Python', 3, '', 8, 1),
(27, '2022-10-02 15:09:41.562432', '4', 'Java', 3, '', 8, 1),
(28, '2022-10-02 15:09:51.940270', '4', 'aditi', 3, '', 12, 1),
(29, '2022-10-02 15:11:30.719329', '6', 'Full Shirt', 1, '[{\"added\": {}}]', 8, 1),
(30, '2022-10-02 15:11:43.285388', '7', 'Half Shirt', 1, '[{\"added\": {}}]', 8, 1),
(31, '2022-10-02 15:11:56.811444', '8', 'Girl Item', 1, '[{\"added\": {}}]', 8, 1),
(32, '2022-10-02 15:12:23.352555', '8', 'Men\'s Shirt', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Men\'s Shirt\"}}]', 9, 1),
(33, '2022-10-02 15:12:46.975539', '9', 'Men\'s half Shirt', 1, '[{\"added\": {}}]', 9, 1),
(34, '2022-10-02 15:13:11.488735', '10', 'Girls Item', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Girls Item\"}}]', 9, 1),
(35, '2022-10-04 13:25:53.805233', '10', 'amit', 2, '[{\"changed\": {\"fields\": [\"Address\"]}}]', 14, 1),
(36, '2022-10-04 13:27:04.542954', '10', 'amit', 2, '[{\"changed\": {\"fields\": [\"Payment status\"]}}]', 14, 1),
(37, '2022-10-04 13:28:00.219977', '10', 'amit', 2, '[{\"changed\": {\"fields\": [\"Payment status\"]}}]', 14, 1),
(38, '2022-10-06 07:04:35.865292', '50', 'rohit', 2, '[{\"changed\": {\"fields\": [\"Payment status\"]}}]', 14, 1),
(39, '2022-10-06 07:04:52.196859', '50', 'rohit', 2, '[{\"changed\": {\"fields\": [\"Order status\"]}}]', 14, 1),
(40, '2022-10-10 12:20:54.202041', '10', 'Girls Item', 2, '[{\"changed\": {\"fields\": [\"Product desc\"]}}]', 9, 1),
(41, '2022-10-10 12:21:36.354832', '9', 'Men\'s half Shirt', 2, '[{\"changed\": {\"fields\": [\"Product desc\"]}}]', 9, 1),
(42, '2022-10-10 12:21:48.308182', '8', 'Men\'s Shirt', 2, '[{\"changed\": {\"fields\": [\"Product desc\"]}}]', 9, 1),
(43, '2022-10-10 12:23:18.733745', '11', 'Cotton Half Sleeve Solid', 1, '[{\"added\": {}}]', 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(11, 'apps', 'address'),
(10, 'apps', 'cart'),
(8, 'apps', 'category'),
(15, 'apps', 'orderitem'),
(14, 'apps', 'ordermaster'),
(9, 'apps', 'product'),
(7, 'apps', 'productimage'),
(12, 'apps', 'user_profile'),
(13, 'apps', 'whishlist'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-09-30 10:42:58.118400'),
(2, 'auth', '0001_initial', '2022-09-30 10:43:08.232165'),
(3, 'admin', '0001_initial', '2022-09-30 10:43:10.879528'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-09-30 10:43:10.973262'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-09-30 10:43:11.035754'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-09-30 10:43:12.441748'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-09-30 10:43:13.879999'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-09-30 10:43:14.161245'),
(9, 'auth', '0004_alter_user_username_opts', '2022-09-30 10:43:14.239267'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-09-30 10:43:15.589164'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-09-30 10:43:15.636066'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-09-30 10:43:15.839099'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-09-30 10:43:16.135855'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-09-30 10:43:16.448364'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-09-30 10:43:16.698231'),
(16, 'auth', '0011_update_proxy_permissions', '2022-09-30 10:43:16.776329'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-09-30 10:43:17.120045'),
(18, 'sessions', '0001_initial', '2022-09-30 10:43:17.869832'),
(19, 'apps', '0001_initial', '2022-09-30 10:43:43.643729'),
(20, 'apps', '0002_product_slug_alter_product_product_desc', '2022-09-30 12:29:06.058918'),
(21, 'apps', '0003_remove_productimage_productid_and_more', '2022-09-30 12:49:02.182581'),
(22, 'apps', '0004_user_whishlist_cart_address', '2022-09-30 17:19:35.358137'),
(23, 'apps', '0005_rename_user_user_profile_alter_address_user_id_and_more', '2022-09-30 18:01:04.969501'),
(24, 'apps', '0006_alter_address_user_id_alter_cart_user_id_and_more', '2022-09-30 18:07:30.627555'),
(25, 'apps', '0007_alter_user_profile_mobile', '2022-09-30 18:17:08.554719'),
(26, 'apps', '0008_address_address_address_name_and_more', '2022-10-01 18:11:27.712948'),
(27, 'apps', '0009_category_slug', '2022-10-01 19:38:36.138233'),
(28, 'apps', '0010_alter_cart_product_id_alter_cart_user_id_and_more', '2022-10-04 11:11:29.560536'),
(29, 'apps', '0011_ordermaster_mobile_alter_ordermaster_address_and_more', '2022-10-04 14:47:22.484982'),
(30, 'apps', '0012_orderitem_user_id_alter_ordermaster_order_status', '2022-10-05 16:15:44.016901'),
(31, 'apps', '0013_remove_orderitem_user_id_and_more', '2022-10-05 17:37:28.850702'),
(32, 'apps', '0014_orderitem_created_at_alter_ordermaster_order_status', '2022-10-06 06:54:31.204774'),
(33, 'apps', '0015_alter_ordermaster_order_status', '2022-10-06 07:03:32.639777'),
(34, 'apps', '0016_alter_ordermaster_order_status_and_more', '2022-10-06 07:04:20.496375'),
(35, 'apps', '0017_alter_ordermaster_order_status_and_more', '2022-10-09 06:03:39.948244'),
(36, 'apps', '0018_ordermaster_payment_request_id_and_more', '2022-10-09 08:59:47.243153'),
(37, 'apps', '0019_ordermaster_order_id_alter_ordermaster_order_status_and_more', '2022-10-09 14:17:25.999495'),
(38, 'apps', '0020_remove_ordermaster_order_id_and_more', '2022-10-09 15:08:20.944151');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4po74gndwjqetrwod3xsq5luohx4xyz3', 'eyJ1c2VyX2lkIjoiYWJjQGdtYWlsLmNvbSJ9:1oeMkP:Pg4MxhH3WK_NuDig_FbGOIFKeqyn01ZWV8ThvPryu1A', '2022-10-14 20:36:37.390513'),
('dolmcjsnomry73xu5rtnb0lpznzfcnxt', '.eJxVjksOgzAMRO-SdRURJUDcVdU9Z0CO7QItEImP1I9694aKRbuzZt48-aVqXJe2XmeZ6o7VURl1-M0C0k3GreArjk3UFMdl6oLeEL23s64iS3_e2T9Bi3Ob1j4LJQFQLgiFwVKs4xIsOxY2zpsCfM5BKGBO5C5GPHkLaZFQyCwl6VcnA3Z98t0fz1Oz3emhQb0_8QtCvQ:1ogK8d:9kB8fv4_Mx5SjhWMmy6hpWLy9p_BztPu_1IOoRCzGRQ', '2022-10-20 06:13:43.517313'),
('emmjzuh50xabdwha4u3vfq9b2z8bx40d', '.eJxVjEEOwiAQRe_C2pASoDAu3XsGMsyMUjU0Ke3KeHdp0oVu_3vvv1XCbS1pa7KkidVZGXX63TLSU-oO-IH1Pmua67pMWe-KPmjT15nldTncv4OCrfQ6DjkQAHlBGA0GsY4DWHYsbFw0I0TPWSijJ3I3I5GihV50FQZL6vMF9NM4hw:1ohriu:d1BsGFYZuLAcCcWwwNntSH3ZLSUyNJZb_LLr6drX_xo', '2022-10-24 12:17:32.228963'),
('eq5pyeiv8c390qktfuh49u5pax0cwtgr', '.eJxVjksOwjAMRO-SNYoaJWljVog9Z6gc27SBNpX6WSHuToq6gKVn3jz5pVrc1r7dFpnbxOqsjDr9ZhHpKXkv-IG5mzRNeZ1T1Duij3bRt4lluB7sn6DHpS_rUMWGAMgLQm2wEeu4AcuOhY0LpobgOQpF9ETubiRQsFAWBYXKUpF-dTJiGooPI5lLtx_lo1G9Py3zQqk:1of4Oy:4D-jQdEcOPNNrqm1-RlOL9nIKPpp3r_FyGDQxJNzRBg', '2022-10-16 19:13:24.720961'),
('lx17a3quldoau8yp4prsv2b9alco4rpb', '.eJxlj8sKwjAQRf8lawkNSZuMK3HvN5TJzNhW-4A-VuK_m0hBitu55x7uvNS2yFx3rM4KI12aAbte0zSok6pxW9v6l5vjLSI9ZcwBP3BsptQa17mLOiN6Txd9m1j6684eBC0ubWqHInoCoFIQKoNerGMPlh0LGxdMBaHkKBSxJHJ3I4GChdRIKBSWkvSrkzz97433Bzf8Sy4:1oeNrG:hSKSpB1qy1iiMGCLtUwUDBQL5l1a5z7KxKn0H12j-y8', '2022-10-14 21:47:46.022704'),
('n58lyk0ac7i7pyr4kg5l6b5s8kovdf5a', 'eyJ1c2VyX2VtYWlsIjoiYWJjMkBnbWFpbC5jb20ifQ:1og31z:ntX3s4jh2pULDO0-PAst0Tq3_8grttbYxNoUYwDb44o', '2022-10-19 11:57:43.547104'),
('vwwz5njsdz3qjdvhkq94oqo09munrjoy', 'e30:1oeLOT:q6P08nRQlv4TiMR1QDkrrQ8DjA8VLNLkFiOOUGQnbWo', '2022-10-14 19:09:53.778840');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apps_address`
--
ALTER TABLE `apps_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apps_address_user_id_id_932bdf45_fk_apps_user_profile_id` (`user_id_id`);

--
-- Indexes for table `apps_cart`
--
ALTER TABLE `apps_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apps_cart_product_id_id_15baf363_fk_apps_product_id` (`product_id_id`),
  ADD KEY `apps_cart_user_id_id_de7f69e7_fk_apps_user_profile_id` (`user_id_id`);

--
-- Indexes for table `apps_category`
--
ALTER TABLE `apps_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `apps_orderitem`
--
ALTER TABLE `apps_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `created_at` (`created_at`),
  ADD KEY `apps_orderitem_order_id_id_60e7ea27_fk_apps_ordermaster_id` (`order_id_id`),
  ADD KEY `apps_orderitem_product_id_id_2cf68065_fk_apps_product_id` (`product_id_id`);

--
-- Indexes for table `apps_ordermaster`
--
ALTER TABLE `apps_ordermaster`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tracking_no` (`tracking_no`),
  ADD KEY `apps_ordermaster_user_id_id_6ca1354c_fk_apps_user_profile_id` (`user_id_id`);

--
-- Indexes for table `apps_product`
--
ALTER TABLE `apps_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `apps_product_categoryId_id_b69100ea_fk_apps_category_id` (`categoryId_id`);

--
-- Indexes for table `apps_productimage`
--
ALTER TABLE `apps_productimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apps_productimage_product_name_id_e0d7b3e5_fk_apps_product_id` (`product_name_id`);

--
-- Indexes for table `apps_user_profile`
--
ALTER TABLE `apps_user_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apps_user_profile_email_838aee8b_uniq` (`email`);

--
-- Indexes for table `apps_whishlist`
--
ALTER TABLE `apps_whishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apps_whishlist_product_id_id_02f95986_fk_apps_product_id` (`product_id_id`),
  ADD KEY `apps_whishlist_user_id_id_2de4bca1_fk_apps_user_profile_id` (`user_id_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apps_address`
--
ALTER TABLE `apps_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apps_cart`
--
ALTER TABLE `apps_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `apps_category`
--
ALTER TABLE `apps_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `apps_orderitem`
--
ALTER TABLE `apps_orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `apps_ordermaster`
--
ALTER TABLE `apps_ordermaster`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `apps_product`
--
ALTER TABLE `apps_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `apps_productimage`
--
ALTER TABLE `apps_productimage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `apps_user_profile`
--
ALTER TABLE `apps_user_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `apps_whishlist`
--
ALTER TABLE `apps_whishlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apps_address`
--
ALTER TABLE `apps_address`
  ADD CONSTRAINT `apps_address_user_id_id_932bdf45_fk_apps_user_profile_id` FOREIGN KEY (`user_id_id`) REFERENCES `apps_user_profile` (`id`);

--
-- Constraints for table `apps_cart`
--
ALTER TABLE `apps_cart`
  ADD CONSTRAINT `apps_cart_product_id_id_15baf363_fk_apps_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `apps_product` (`id`),
  ADD CONSTRAINT `apps_cart_user_id_id_de7f69e7_fk_apps_user_profile_id` FOREIGN KEY (`user_id_id`) REFERENCES `apps_user_profile` (`id`);

--
-- Constraints for table `apps_orderitem`
--
ALTER TABLE `apps_orderitem`
  ADD CONSTRAINT `apps_orderitem_order_id_id_60e7ea27_fk_apps_ordermaster_id` FOREIGN KEY (`order_id_id`) REFERENCES `apps_ordermaster` (`id`),
  ADD CONSTRAINT `apps_orderitem_product_id_id_2cf68065_fk_apps_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `apps_product` (`id`);

--
-- Constraints for table `apps_ordermaster`
--
ALTER TABLE `apps_ordermaster`
  ADD CONSTRAINT `apps_ordermaster_user_id_id_6ca1354c_fk_apps_user_profile_id` FOREIGN KEY (`user_id_id`) REFERENCES `apps_user_profile` (`id`);

--
-- Constraints for table `apps_product`
--
ALTER TABLE `apps_product`
  ADD CONSTRAINT `apps_product_categoryId_id_b69100ea_fk_apps_category_id` FOREIGN KEY (`categoryId_id`) REFERENCES `apps_category` (`id`);

--
-- Constraints for table `apps_productimage`
--
ALTER TABLE `apps_productimage`
  ADD CONSTRAINT `apps_productimage_product_name_id_e0d7b3e5_fk_apps_product_id` FOREIGN KEY (`product_name_id`) REFERENCES `apps_product` (`id`);

--
-- Constraints for table `apps_whishlist`
--
ALTER TABLE `apps_whishlist`
  ADD CONSTRAINT `apps_whishlist_product_id_id_02f95986_fk_apps_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `apps_product` (`id`),
  ADD CONSTRAINT `apps_whishlist_user_id_id_2de4bca1_fk_apps_user_profile_id` FOREIGN KEY (`user_id_id`) REFERENCES `apps_user_profile` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

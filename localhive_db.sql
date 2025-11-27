-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2025 at 07:28 AM
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
-- Database: `localhive_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'thangoo', 'thangoo@gmail.com', '$2y$10$xGrBrK4/oy7W1rrZlgu1GeCp95wVRhVa1i0SzH5DNjR0KtfuEZre6', '2025-11-22 06:55:15');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `booking_type` enum('normal','emergency') DEFAULT 'normal',
  `preferred_date` date DEFAULT NULL,
  `preferred_time` time DEFAULT NULL,
  `expected_arrival` datetime DEFAULT NULL,
  `actual_arrival` datetime DEFAULT NULL,
  `status` enum('pending','accepted','rejected','completed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `provider_id`, `service_id`, `booking_type`, `preferred_date`, `preferred_time`, `expected_arrival`, `actual_arrival`, `status`, `created_at`) VALUES
(6, 1, 2, 5, 'normal', '2025-11-06', '18:05:00', NULL, NULL, 'pending', '2025-11-25 10:33:43'),
(7, 1, 2, 5, 'emergency', '2025-11-20', '19:07:00', NULL, NULL, 'pending', '2025-11-25 10:34:45'),
(8, 1, 2, 5, 'emergency', '2025-11-20', '19:07:00', NULL, NULL, 'pending', '2025-11-25 10:39:39'),
(9, 1, 2, 5, 'normal', '2025-11-27', '12:45:00', NULL, '2025-11-27 05:12:42', 'completed', '2025-11-27 04:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_bookings`
--

CREATE TABLE `emergency_bookings` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `booked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `late_reports`
--

CREATE TABLE `late_reports` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `reporter_user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `reported_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `delay_minutes` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `resolved` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `late_reports`
--

INSERT INTO `late_reports` (`id`, `booking_id`, `reporter_user_id`, `provider_id`, `reported_at`, `delay_minutes`, `reason`, `resolved`) VALUES
(1, 6, 1, 2, '2025-11-27 06:22:51', 0, 'Arrived late', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('success','failed') DEFAULT 'success',
  `provider_earning` decimal(10,2) DEFAULT 0.00,
  `admin_fee` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `booking_id`, `amount`, `status`, `provider_earning`, `admin_fee`, `created_at`) VALUES
(8, 9, 300.00, '', 270.00, 30.00, '2025-11-27 04:13:10'),
(9, 9, 300.00, 'success', 270.00, 30.00, '2025-11-27 04:13:22');

-- --------------------------------------------------------

--
-- Table structure for table `pincode_neighbors`
--

CREATE TABLE `pincode_neighbors` (
  `id` int(11) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `neighbor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `approved` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_verified` tinyint(1) DEFAULT 0,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `name`, `email`, `password`, `phone`, `address`, `pincode`, `lat`, `lng`, `approved`, `created_at`, `is_verified`, `latitude`, `longitude`) VALUES
(1, 'Devi', 'devi@gmail.com', '$2y$10$oSNaYV1m9ky0v8cQ67ZaTu7/wH/DJZi8ZgQr2Gf8pdeg07YILo0Sq', '8870350479', '38/2 nallayi kattu street , Pothanur', '638182', 0, 0, 1, '2025-11-25 10:09:05', 1, NULL, NULL),
(2, 'Durga', 'durga@gmail.com', '$2y$10$4nn4Umfczh1zHbEx6g9HW.j2l6nYH6oxDJn6tvuCO2KgncUymSpvG', '1122334455', '38/2 nallayi kattu street , Pothanur', '638181', 0, 0, 1, '2025-11-25 10:27:28', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `duration_minutes` int(11) DEFAULT 60,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `provider_id`, `title`, `description`, `price`, `duration_minutes`, `created_at`) VALUES
(5, 2, 'Painting', 'I am good at painting', 300.00, 60, '2025-11-25 10:28:57'),
(6, 1, 'Painting', 'Good painter', 500.00, 120, '2025-11-27 04:11:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `pincode`, `created_at`) VALUES
(1, 'Priyanka Panneerselvam', 'priya@gmail.com', '$2y$10$ZF94B4Xy5Y6NXOBcGyiTTOyl45xUY0gGhxEjKNTKlRAWkszMBXr4S', '09444416939', '38/2 nallayi kattu street , Pothanur', '638181', '2025-11-25 10:08:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `provider_id` (`provider_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `emergency_bookings`
--
ALTER TABLE `emergency_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `late_reports`
--
ALTER TABLE `late_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `reporter_user_id` (`reporter_user_id`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `pincode_neighbors`
--
ALTER TABLE `pincode_neighbors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_pair` (`pincode`,`neighbor`),
  ADD KEY `idx_pincode` (`pincode`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_providers_pincode` (`pincode`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_users_pincode` (`pincode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `emergency_bookings`
--
ALTER TABLE `emergency_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `late_reports`
--
ALTER TABLE `late_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pincode_neighbors`
--
ALTER TABLE `pincode_neighbors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `late_reports`
--
ALTER TABLE `late_reports`
  ADD CONSTRAINT `late_reports_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `late_reports_ibfk_2` FOREIGN KEY (`reporter_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `late_reports_ibfk_3` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

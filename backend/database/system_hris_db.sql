-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2026 at 07:58 AM
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
-- Database: `system_hris_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`log_id`, `user_id`, `action`, `target`, `created_at`) VALUES
(1, 5, 'restore_user', 'employee:8', '2026-03-16 02:06:43'),
(2, 5, 'archive_user', 'employee:8', '2026-03-16 02:07:04'),
(3, 5, 'restore_user', 'employee:8', '2026-03-16 02:07:12'),
(4, 4, 'cluster_member_remove', 'cluster:1 | member=2', '2026-03-20 02:09:29'),
(5, 4, 'cluster_member_add', 'cluster:1 | members=2', '2026-03-20 02:09:33'),
(6, 4, 'schedule_save', 'cluster:1 | employee=2,days=Mon,Tue,Wed,Thu,Fri', '2026-03-20 02:09:54'),
(7, 1, 'request_finalize', 'leave:1 | status=Approved', '2026-03-20 03:29:24'),
(8, 4, 'request_create', 'leave:2 | status=Endorsed', '2026-03-20 05:37:29'),
(9, 1, 'request_create', 'leave:3 | status=Endorsed', '2026-03-20 05:40:57'),
(10, 1, 'request_finalize', 'leave:2 | status=Approved', '2026-03-20 05:45:06'),
(11, 5, 'request_finalize', 'leave:3 | status=Approved', '2026-03-20 05:51:46'),
(12, 1, 'schedule_save', 'cluster:1 | employee=4,days=Mon,Tue,Wed,Thu,Fri', '2026-03-20 07:38:15'),
(13, 1, 'schedule_save', 'cluster:1 | employee=4,days=Mon,Tue,Wed,Thu,Fri', '2026-03-20 07:42:39'),
(14, 1, 'schedule_save', 'cluster:1 | employee=4,days=Mon,Tue,Wed,Thu,Fri', '2026-03-20 07:55:17'),
(15, 1, 'schedule_save', 'cluster:1 | employee=4,days=Mon,Tue,Wed,Thu,Fri', '2026-03-20 07:56:52'),
(16, 1, 'schedule_save', 'cluster:1 | employee=4,days=Mon,Tue,Wed,Thu,Fri,Sat', '2026-03-21 07:00:34'),
(17, 1, 'schedule_save', 'cluster:1 | employee=4,days=Mon,Tue,Wed,Thu,Fri', '2026-03-21 07:01:04'),
(18, 4, 'schedule_save', 'cluster:1 | employee=2,days=Mon,Tue,Wed,Thu,Fri,Sat', '2026-03-21 07:07:44'),
(19, 1, 'schedule_save', 'cluster:1 | employee=4,days=Mon,Tue,Wed,Thu,Fri,Sat', '2026-03-21 10:31:23'),
(20, 1, 'schedule_save', 'cluster:1 | employee=4,days=Mon,Tue,Wed,Thu,Fri,Sat', '2026-03-21 10:31:54'),
(21, 2, 'request_create', 'dispute:1 | status=Pending', '2026-03-21 11:33:52'),
(22, 1, 'request_create', 'dispute:2 | status=Endorsed', '2026-03-21 12:01:46'),
(23, 1, 'schedule_save', 'cluster:1 | employee=4,days=Mon,Tue,Wed,Thu,Fri', '2026-03-21 13:54:17'),
(24, 2, 'request_create', 'leave:4 | status=Pending', '2026-03-22 13:33:24'),
(25, 4, 'request_endorse', 'leave:4 | status=Endorsed', '2026-03-22 13:51:43'),
(26, 1, 'request_create', 'leave:5 | status=Endorsed', '2026-03-22 13:53:14'),
(27, 2, 'request_create', 'leave:6 | status=Pending', '2026-03-22 14:18:48'),
(28, 2, 'request_create', 'leave:7 | status=Pending', '2026-03-22 14:19:06'),
(29, 1, 'archive_user', 'employee:8', '2026-03-23 02:41:21'),
(30, 7, 'cluster_create', 'cluster:2 | Team 2', '2026-03-23 02:44:03'),
(31, 1, 'cluster_approve', 'cluster:2', '2026-03-23 02:44:25'),
(32, 2, 'request_create', 'leave:8 | status=Pending', '2026-03-23 03:12:19'),
(33, 2, 'request_create', 'leave:9 | status=Pending', '2026-03-23 06:48:43'),
(34, 4, 'request_endorse', 'leave:9 | status=Endorsed', '2026-03-23 06:49:32'),
(35, 5, 'request_finalize', 'leave:9 | status=Approved', '2026-03-23 06:49:49'),
(36, 4, 'request_create', 'leave:10 | status=Endorsed', '2026-03-23 06:52:18'),
(37, 1, 'request_finalize', 'leave:10 | status=Approved', '2026-03-23 06:52:55'),
(38, 2, 'request_create', 'leave:11 | status=Pending', '2026-03-23 06:54:43'),
(39, 4, 'request_endorse', 'leave:11 | status=Endorsed', '2026-03-23 06:54:58'),
(40, 1, 'request_finalize', 'leave:11 | status=Approved', '2026-03-23 06:55:14'),
(41, 1, 'request_create', 'leave:12 | status=Endorsed', '2026-03-23 06:55:40'),
(42, 5, 'request_finalize', 'leave:12 | status=Approved', '2026-03-23 06:55:54');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`announcement_id`, `title`, `content`, `posted_by`, `date_posted`) VALUES
(1, 'Test', 'Test 1', 1, '2026-03-20 15:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_disputes`
--

CREATE TABLE `attendance_disputes` (
  `dispute_id` int(11) NOT NULL,
  `cluster_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `dispute_date` date DEFAULT NULL,
  `dispute_type` varchar(100) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('Pending','Endorsed','Approved','Denied') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_logs`
--

CREATE TABLE `attendance_logs` (
  `attendance_id` int(11) NOT NULL,
  `cluster_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `timelog_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `attendance_date` date DEFAULT NULL,
  `attendance_status` enum('Present','Absent','Late','Overtime','On Leave') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance_logs`
--

INSERT INTO `attendance_logs` (`attendance_id`, `cluster_id`, `employee_id`, `timelog_id`, `note`, `updated_at`, `attendance_date`, `attendance_status`) VALUES
(3, 1, 4, NULL, '', '2026-03-21 07:00:42', '2026-03-20', 'Present'),
(4, 1, 2, NULL, '', '2026-03-21 07:05:31', '2026-03-20', 'Present'),
(5, NULL, 1, NULL, '', '2026-03-20 08:26:14', '2026-03-20', 'Present'),
(6, NULL, 5, NULL, '', '2026-03-20 03:47:22', '2026-03-20', 'Present'),
(7, NULL, 5, NULL, '', '2026-03-21 13:47:35', '2026-03-21', 'Late'),
(8, NULL, 1, NULL, '', '2026-03-21 07:04:22', '2026-03-21', 'Late'),
(9, 1, 2, NULL, '', '2026-03-21 13:37:05', '2026-03-21', 'Present'),
(10, 1, 4, NULL, '', '2026-03-21 13:35:35', '2026-03-21', 'Present'),
(11, NULL, 5, NULL, '', '2026-03-22 12:29:44', '2026-03-22', 'Late'),
(12, NULL, 1, NULL, '', '2026-03-22 12:29:35', '2026-03-22', 'Late'),
(13, NULL, 1, NULL, '', '2026-03-23 02:40:40', '2026-03-23', 'Late'),
(14, 1, 2, NULL, '', '2026-03-23 02:46:03', '2026-03-23', 'Late');

-- --------------------------------------------------------

--
-- Table structure for table `break_logs`
--

CREATE TABLE `break_logs` (
  `break_log_id` int(11) NOT NULL,
  `time_log_id` int(11) DEFAULT NULL,
  `cluster_id` int(11) DEFAULT NULL,
  `break_start` datetime DEFAULT NULL,
  `break_end` datetime DEFAULT NULL,
  `total_break_hour` double(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clusters`
--

CREATE TABLE `clusters` (
  `cluster_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` enum('pending','active','rejected') DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clusters`
--

INSERT INTO `clusters` (`cluster_id`, `name`, `description`, `user_id`, `status`, `rejection_reason`, `created_at`) VALUES
(1, 'Team 1', 'team 1', 4, 'active', NULL, '2026-03-12 04:31:49'),
(2, 'Team 2', 'Team 2', 7, 'active', NULL, '2026-03-23 02:44:25');

-- --------------------------------------------------------

--
-- Table structure for table `cluster_members`
--

CREATE TABLE `cluster_members` (
  `cluster_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cluster_members`
--

INSERT INTO `cluster_members` (`cluster_id`, `employee_id`, `assigned_at`) VALUES
(1, 2, '2026-03-20 02:09:33');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `civil_status` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `personal_email` varchar(100) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `account` varchar(100) DEFAULT NULL,
  `cluster_id` varchar(100) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `employment_status` varchar(20) DEFAULT NULL,
  `employee_type` varchar(30) DEFAULT NULL,
  `date_hired` date DEFAULT NULL,
  `archived` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `user_id`, `permission_id`, `first_name`, `middle_name`, `last_name`, `address`, `birthdate`, `civil_status`, `email`, `personal_email`, `position`, `account`, `cluster_id`, `contact_number`, `employment_status`, `employee_type`, `date_hired`, `archived`) VALUES
(1, 1, 11, 'admin', NULL, NULL, NULL, NULL, NULL, 'admin@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, NULL, 'employee1', NULL, NULL, NULL, NULL, NULL, 'employee1@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, NULL, 'employee2', NULL, NULL, NULL, NULL, NULL, 'employee2@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, NULL, 'teamcoach', NULL, NULL, NULL, NULL, NULL, 'teamcoach@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 11, 'superadmin', NULL, NULL, NULL, NULL, NULL, 'superadmin@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, NULL, 'Jaden', 'Culajara', 'Rivera', 'Bacolod City', '2001-11-11', 'Single', 'jaden@ireply.com', 'jadenr211@gmail.com', '', '', NULL, '09919074824', 'Active', '', '2026-03-12', NULL),
(7, 7, NULL, 'Gil', 'Culajara', 'Rivera', 'Bacolod City', '2001-11-11', 'Single', 'gil@ireply.com', 'gil@gmail.com', 'President', 'iReply Back Office Services', NULL, '1234567899', 'Active', 'Regular', '2026-03-13', NULL),
(8, 8, NULL, 'asd', 'asd', 'asd', 'asd', '2001-11-11', 'Single', 'asd@ireply.com', 'asd@mail.com', '', '', NULL, '1234567899', 'Archived', '', '2026-03-15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `holiday_id` int(11) NOT NULL,
  `holiday_name` varchar(50) DEFAULT NULL,
  `holiday_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `leave_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `leave_type` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `reviewed_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `agreement_1` tinyint(1) DEFAULT NULL,
  `agreement_2` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `remarks` text DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`leave_id`, `employee_id`, `leave_type`, `start_date`, `end_date`, `reason`, `status`, `reviewed_by`, `approved_by`, `agreement_1`, `agreement_2`, `created_at`, `remarks`, `photo_path`) VALUES
(10, 4, 'Sick Leave', '2026-03-23', '2026-03-24', 'testing', 'Approved', NULL, 1, NULL, NULL, '2026-03-23 06:52:55', NULL, 'uploads/leave-photos/leave_20260323075218_b0372bcbfba7cc3e.jpg'),
(11, 2, 'Sick Leave', '2026-03-24', '2026-03-25', 'testing 2', 'Approved', 4, 1, NULL, NULL, '2026-03-23 06:55:14', NULL, 'uploads/leave-photos/leave_20260323075443_02dfb2dc9b083e07.jpg'),
(12, 1, 'Sick Leave', '2026-03-25', '2026-03-26', 'testing 3', 'Approved', NULL, 5, NULL, NULL, '2026-03-23 06:55:54', NULL, 'uploads/leave-photos/leave_20260323075540_7a5f255ebc8c424e.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `overtime_requests`
--

CREATE TABLE `overtime_requests` (
  `ot_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `ot_type` enum('Regular Overtime','Duty on Rest Day','Duty on Rest Day OT') DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `purpose` text DEFAULT NULL,
  `agreement_1` tinyint(1) DEFAULT NULL,
  `agreement_2` tinyint(1) DEFAULT NULL,
  `status` enum('Pending','Endorsed','Approved','Denied') DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permission_id` int(11) NOT NULL,
  `permission_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permission_id`, `permission_name`) VALUES
(1, 'Add Employee'),
(2, 'Edit Employee'),
(3, 'Delete Employee'),
(4, 'Set Attendance'),
(5, 'Edit Attendance'),
(6, 'View Dashboard'),
(7, 'View Team'),
(8, 'View Attendance'),
(9, 'View Employee List'),
(10, 'Edit Profile'),
(11, 'Access Control Panel');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  `role_description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `role_description`) VALUES
(1, 'Super Admin', 'System-wide super administrator'),
(2, 'Admin', 'Administrator role'),
(3, 'Team Coach', 'Team coach role'),
(4, 'Employee', 'Standard employee role');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 6),
(4, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` int(11) NOT NULL,
  `cluster_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `shift_type` enum('Morning','Mid','Night') DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `work_setup` enum('Onsite','WFH','Hybrid') DEFAULT NULL,
  `breaksched_start` datetime DEFAULT NULL,
  `breaksched_end` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`schedule_id`, `cluster_id`, `employee_id`, `day_of_week`, `shift_type`, `start_time`, `end_time`, `work_setup`, `breaksched_start`, `breaksched_end`) VALUES
(47, 1, 2, 'Monday', 'Morning', '09:00:00', '18:00:00', 'Onsite', '2000-01-01 15:00:00', '2000-01-01 15:30:00'),
(48, 1, 2, 'Tuesday', 'Morning', '09:00:00', '18:00:00', 'Onsite', '2000-01-01 15:00:00', '2000-01-01 15:30:00'),
(49, 1, 2, 'Wednesday', 'Morning', '09:00:00', '18:00:00', 'Onsite', '2000-01-01 15:00:00', '2000-01-01 15:30:00'),
(50, 1, 2, 'Thursday', 'Morning', '09:00:00', '18:00:00', 'Onsite', '2000-01-01 15:00:00', '2000-01-01 15:30:00'),
(51, 1, 2, 'Friday', 'Morning', '10:00:00', '19:00:00', 'Onsite', '2000-01-01 13:00:00', '2000-01-01 14:00:00'),
(52, 1, 2, 'Saturday', 'Morning', '09:00:00', '18:00:00', 'Onsite', '2000-01-01 15:00:00', '2000-01-01 15:30:00'),
(65, 1, 4, 'Monday', 'Morning', '10:00:00', '19:00:00', 'WFH', '2000-01-01 13:00:00', '2000-01-01 14:00:00'),
(66, 1, 4, 'Tuesday', 'Morning', '09:00:00', '18:00:00', 'Onsite', '2000-01-01 12:00:00', '2000-01-01 13:00:00'),
(67, 1, 4, 'Wednesday', 'Morning', '09:00:00', '18:00:00', 'Onsite', '2000-01-01 12:00:00', '2000-01-01 13:00:00'),
(68, 1, 4, 'Thursday', 'Morning', '09:00:00', '18:00:00', 'Onsite', '2000-01-01 12:00:00', '2000-01-01 13:00:00'),
(69, 1, 4, 'Friday', 'Morning', '09:00:00', '18:00:00', 'Onsite', '2000-01-01 12:00:00', '2000-01-01 13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `time_logs`
--

CREATE TABLE `time_logs` (
  `time_log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `attendance_id` int(11) DEFAULT NULL,
  `time_in` datetime DEFAULT NULL,
  `time_out` datetime DEFAULT NULL,
  `break_start` datetime DEFAULT NULL,
  `break_end` datetime DEFAULT NULL,
  `total_hours` double(5,2) DEFAULT NULL,
  `log_date` date DEFAULT NULL,
  `tag` enum('On Time','Late','Absent','Break Time','Lunch Time') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_logs`
--

INSERT INTO `time_logs` (`time_log_id`, `user_id`, `employee_id`, `attendance_id`, `time_in`, `time_out`, `break_start`, `break_end`, `total_hours`, `log_date`, `tag`) VALUES
(4, NULL, 2, 4, '2026-03-20 10:00:00', '2026-03-20 19:00:00', NULL, NULL, NULL, '2026-03-20', 'On Time'),
(5, 1, 1, 5, '2026-03-20 09:00:00', '2026-03-20 16:26:13', NULL, NULL, NULL, '2026-03-20', 'On Time'),
(6, 5, 5, 6, '2026-03-20 09:00:00', NULL, NULL, NULL, NULL, '2026-03-20', 'On Time'),
(7, 5, 5, 7, '2026-03-21 10:00:00', '2026-03-21 18:00:00', NULL, NULL, NULL, '2026-03-21', 'Late'),
(8, 1, 1, 8, '2026-03-21 15:04:18', '2026-03-21 15:04:22', NULL, NULL, NULL, '2026-03-21', 'Late'),
(9, NULL, 2, 9, '2026-03-21 09:00:00', '2026-03-21 18:00:00', NULL, NULL, NULL, '2026-03-21', 'On Time'),
(10, NULL, 4, 10, '2026-03-21 21:00:00', '2026-03-22 06:00:00', NULL, NULL, NULL, '2026-03-21', 'On Time'),
(11, 5, 5, 11, '2026-03-22 20:24:15', '2026-03-22 20:29:44', NULL, NULL, NULL, '2026-03-22', 'Late'),
(12, 1, 1, 12, '2026-03-22 20:29:12', '2026-03-22 20:29:35', NULL, NULL, NULL, '2026-03-22', 'Late'),
(13, 1, 1, 13, '2026-03-23 10:40:40', NULL, NULL, NULL, NULL, '2026-03-23', 'Late'),
(14, NULL, 2, 14, '2026-03-23 10:46:02', NULL, NULL, NULL, NULL, '2026-03-23', 'Late');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `role_id`, `created_at`) VALUES
(1, 'admin@mail.com', '$2y$10$G0qtvS.0rYfxSsoJ2xe5V.2p908qzKeyR0qGrpBsdT5WKteyiFYyu', 2, '2026-03-12 12:30:37'),
(2, 'employee1@mail.com', '$2y$10$HihsMObCq5kTRn82H9zMy.VPYkmusyui8FUXb1eLcyyiaVYJEDEbG', 4, '2026-03-12 12:30:53'),
(3, 'employee2@mail.com', '$2y$10$ZjZ1ITpHrnWwTyaqhUUGq.2LPv4nuweE8PtHo9/TW8qUHtb9EEkfO', 4, '2026-03-12 12:31:02'),
(4, 'teamcoach@mail.com', '$2y$10$ue0g1ssRSbj.5owx93p1ZugfJRQvP/D30IOZgerLKkwrjKLFYNFNi', 3, '2026-03-12 12:31:11'),
(5, 'superadmin@mail.com', '$2y$10$OBqptfoQCjK5.Mo9g7JoyuE0TCwQi227inQ79Ef/SbXwJm2dBENxi', 1, '2026-03-12 12:55:42'),
(6, 'jaden@ireply.com', '$2y$10$a6VE700gVy9TIZbQVmwAheXx.MnHkkA7uGF/VlEJnBevpVSvg.Z32', 4, '2026-03-12 16:25:42'),
(7, 'gil@ireply.com', '$2y$10$CRbJZwEufyD1lGwlDOh..OQPOx/B4j.wBkpchR5MAvJu4rpEfUm4m', 3, NULL),
(8, 'asd@ireply.com', '$2y$10$z6OuuCwOLvOjvv14WreOyuhkav4fMkdYn7a27vPe8/bakEsjsvAW2', 4, '2026-03-15 12:56:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `Id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `is_allowed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`Id`, `user_id`, `permission_id`, `is_allowed`) VALUES
(34, 2, 11, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `posted_by` (`posted_by`);

--
-- Indexes for table `attendance_disputes`
--
ALTER TABLE `attendance_disputes`
  ADD PRIMARY KEY (`dispute_id`),
  ADD KEY `cluster_id` (`cluster_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD PRIMARY KEY (`attendance_id`),
  ADD UNIQUE KEY `unique_employee_date` (`employee_id`,`attendance_date`),
  ADD KEY `cluster_id` (`cluster_id`);

--
-- Indexes for table `break_logs`
--
ALTER TABLE `break_logs`
  ADD PRIMARY KEY (`break_log_id`),
  ADD KEY `time_log_id` (`time_log_id`),
  ADD KEY `cluster_id` (`cluster_id`);

--
-- Indexes for table `clusters`
--
ALTER TABLE `clusters`
  ADD PRIMARY KEY (`cluster_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cluster_members`
--
ALTER TABLE `cluster_members`
  ADD PRIMARY KEY (`cluster_id`,`employee_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`holiday_id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`leave_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `reviewed_by` (`reviewed_by`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `overtime_requests`
--
ALTER TABLE `overtime_requests`
  ADD PRIMARY KEY (`ot_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `cluster_id` (`cluster_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `time_logs`
--
ALTER TABLE `time_logs`
  ADD PRIMARY KEY (`time_log_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `permission_id` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance_disputes`
--
ALTER TABLE `attendance_disputes`
  MODIFY `dispute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `break_logs`
--
ALTER TABLE `break_logs`
  MODIFY `break_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clusters`
--
ALTER TABLE `clusters`
  MODIFY `cluster_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `holiday_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `leave_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `overtime_requests`
--
ALTER TABLE `overtime_requests`
  MODIFY `ot_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `time_logs`
--
ALTER TABLE `time_logs`
  MODIFY `time_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`posted_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `attendance_disputes`
--
ALTER TABLE `attendance_disputes`
  ADD CONSTRAINT `attendance_disputes_ibfk_1` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`),
  ADD CONSTRAINT `attendance_disputes_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD CONSTRAINT `attendance_logs_ibfk_1` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`),
  ADD CONSTRAINT `attendance_logs_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `break_logs`
--
ALTER TABLE `break_logs`
  ADD CONSTRAINT `break_logs_ibfk_1` FOREIGN KEY (`time_log_id`) REFERENCES `time_logs` (`time_log_id`),
  ADD CONSTRAINT `break_logs_ibfk_2` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`);

--
-- Constraints for table `clusters`
--
ALTER TABLE `clusters`
  ADD CONSTRAINT `clusters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cluster_members`
--
ALTER TABLE `cluster_members`
  ADD CONSTRAINT `cluster_members_ibfk_1` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`),
  ADD CONSTRAINT `cluster_members_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`);

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `leave_requests_ibfk_2` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `leave_requests_ibfk_3` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `overtime_requests`
--
ALTER TABLE `overtime_requests`
  ADD CONSTRAINT `overtime_requests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `overtime_requests_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`);

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`),
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `time_logs`
--
ALTER TABLE `time_logs`
  ADD CONSTRAINT `time_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `time_logs_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

--
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `user_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

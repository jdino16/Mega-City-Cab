-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 24, 2025 at 10:25 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `megacitycab`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `pickup` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Pending','Confirmed','Completed','Cancelled') DEFAULT 'Pending',
  `customer_name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `pickup`, `destination`, `date`, `status`, `customer_name`, `phone`, `address`) VALUES
(1, 1, 'Bandaranaike International Airport', 'Colombo Mall', '2025-02-18 10:30:00', 'Pending', 'Nimal Perera', '0712345678', 'Colombo 01, Sri Lanka'),
(2, 2, 'Colombo Town', 'Colombo Airport', '2025-02-19 14:00:00', 'Confirmed', 'Kumari Wijesinghe', '0771234567', 'Colombo 04, Sri Lanka'),
(3, 3, 'Ratmalana Airport', 'Negombo Beach', '2025-02-20 09:00:00', 'Completed', 'Janaka Silva', '0723456789', 'Colombo 05, Sri Lanka'),
(4, 4, 'Colombo International Airport', 'Galle Fort', '2025-02-21 16:30:00', 'Cancelled', 'Saman Perera', '0789876543', 'Colombo 06, Sri Lanka'),
(5, 5, 'Colombo Airport Hub', 'Colombo Mall', '2025-02-22 11:00:00', 'Pending', 'Anjali Fernando', '0765432109', 'Colombo 07, Sri Lanka'),
(6, 6, 'Mattala Rajapaksa International Airport', 'Colombo Town', '2025-02-23 18:00:00', 'Confirmed', 'Priya Rajapaksha', '0719876543', 'Colombo 08, Sri Lanka'),
(7, 7, 'Colombo Suburban Airport', 'Kandy', '2025-02-24 12:00:00', 'Pending', 'Chaminda Jayasinghe', '0721987654', 'Colombo 09, Sri Lanka'),
(8, 8, 'Colombo Cargo Terminal', 'Colombo 04', '2025-02-25 14:30:00', 'Confirmed', 'Rathna Gamage', '0731234567', 'Colombo 10, Sri Lanka'),
(9, 9, 'Colombo Logistics Airport', 'Galle', '2025-02-26 08:45:00', 'Completed', 'Gayantha Bandara', '0715647382', 'Colombo 11, Sri Lanka'),
(10, 10, 'Negombo Airport', 'Colombo Town', '2025-02-27 17:00:00', 'Pending', 'Shanika Dissanayake', '0765432167', 'Colombo 12, Sri Lanka'),
(11, 16, 'Pettah', 'Dehiwala', '2025-02-18 20:35:32', 'Completed', 'dinoja', '0778452145', 'nalllur'),
(12, 16, 'Colombo Town', 'Galle Face', '2025-02-18 20:38:03', 'Completed', 'dinoo', '0778542651', 'nallur'),
(13, 16, 'Galle Face', 'Wellawatte', '2025-02-19 12:10:43', 'Completed', 'dinoojahh', '078545215', 'nallur'),
(14, 17, 'Dehiwala', 'Kotte', '2025-02-19 12:22:00', 'Completed', 'KAMAL', '0778542651', 'nallur'),
(15, 19, 'Galle Face', 'Borella', '2025-02-21 15:22:39', 'Completed', 'lishan', '0779965842', 'mallavai');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
CREATE TABLE IF NOT EXISTS `cars` (
  `car_id` int NOT NULL AUTO_INCREMENT,
  `car_name` varchar(255) NOT NULL,
  `car_model` varchar(255) NOT NULL,
  `car_type` varchar(255) NOT NULL,
  `year` int NOT NULL,
  `registration_number` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `car_name`, `car_model`, `car_type`, `year`, `registration_number`, `status`) VALUES
(1, 'Car 1', 'Toyota Corolla', '', 2015, 'ABC1234', 'active'),
(2, 'Car 2', 'Honda Civic', '', 2016, 'XYZ5678', 'inactive'),
(3, 'Car 3', 'Nissan Altima', '', 2018, 'LMN9876', 'active'),
(4, 'Car 4', 'Suzuki Swift', '', 2019, 'OPQ1234', 'active'),
(5, 'Car 5', 'Mazda 3', 'ss', 2017, 'RST4567', 'Available'),
(6, 'Car 6', 'Hyundai Elantra', '', 2020, 'JKL1122', 'active'),
(7, 'Car 7', 'Toyota Camry', '', 2016, 'VWX6789', 'inactive'),
(8, 'Car 8', 'Ford Focus', 'taxi', 2015, 'CDE3456', 'Available'),
(9, 'Car 9', 'Chevrolet Malibu', 'taxi', 2021, 'PQR1122', 'Available'),
(10, 'Car 10', 'Honda Accord', '', 2019, 'JKL9876', 'active'),
(11, 'Car 11', 'Hyundai Sonata', '', 2018, 'TUV1234', 'active'),
(12, 'Car 12', 'Toyota Prius', '', 2020, 'LMN3456', 'active'),
(13, 'Car 13', 'BMW X5', '', 2015, 'XYZ1122', 'inactive'),
(14, 'Car 14', 'Kia Sorento', '', 2017, 'ABC6789', 'active'),
(15, 'Car 15', 'Mercedes Benz C-Class', '', 2019, 'JKL4567', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
CREATE TABLE IF NOT EXISTS `drivers` (
  `driver_id` int NOT NULL AUTO_INCREMENT,
  `driver_name` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `car_model` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`driver_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `driver_name`, `phone`, `car_model`, `status`) VALUES
(1, 'Arun Kumar', '0712345678', 'Toyota Corolla', 'available'),
(2, 'Vidhya Raj', '0712345679', 'Honda Civic', 'unavailable'),
(3, 'Siva Kannan', '0712345680', 'Nissan Altima', 'available'),
(4, 'Manju Rani', '0712345681', 'Suzuki Swift', 'available'),
(5, 'Tharini Devi', '0712345682', 'Mazda 3', 'unavailable'),
(6, 'Sarvesh Perera', '0712345683', 'Hyundai Elantra', 'available'),
(7, 'Kavitha Rajan', '0712345684', 'Toyota Camry', 'unavailable'),
(8, 'Muthu Kumar', '0712345685', 'Ford Focus', 'available'),
(9, 'Priya Thanuskodi', '0712345686', 'Chevrolet Malibu', 'unavailable'),
(10, 'Rajendran Sivakumar', '0712345687', 'Honda Accord', 'available'),
(11, 'Nivetha Arumugam', '0712345688', 'Hyundai Sonata', 'available'),
(12, 'Gokul Sathya', '0712345689', 'Toyota Prius', 'available'),
(13, 'Anjali Kannan', '0712345690', 'BMW X5', 'unavailable'),
(14, 'Selva Kumar', '0712345691', 'Kia Sorento', 'available'),
(15, 'Jeyanthi Rajendran', '0712345692', 'Mercedes Benz C-Class', 'unavailable'),
(16, 'fgfsg', '0778542651', 'fgrg', 'Unavailable'),
(17, 'sadsa', '0778452145', 'safa', 'Available'),
(18, 'sadsa', '0778452145', 'safa', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `booking_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` enum('Unpaid','Paid') DEFAULT 'Unpaid',
  PRIMARY KEY (`transaction_id`),
  KEY `user_id` (`user_id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`transaction_id`, `user_id`, `booking_id`, `amount`, `payment_method`, `status`) VALUES
(1, 13, 1, 4.25, 'Cash', 'Unpaid'),
(2, 13, 2, 700.00, 'Cash', 'Unpaid'),
(3, 13, 3, 300.00, 'Cash', 'Unpaid'),
(4, 13, 4, 500.00, 'Cash', 'Unpaid'),
(5, 13, 5, 1250.00, 'Cash', 'Unpaid'),
(6, 13, 6, 250.00, 'Cash', 'Unpaid'),
(7, 13, 7, 250.00, 'Cash', 'Unpaid'),
(8, 13, 8, 1800.00, 'Cash', 'Unpaid'),
(9, 13, 9, 1250.00, 'Cash', 'Unpaid'),
(10, 13, 10, 400.00, 'Cash', 'Unpaid'),
(11, 16, 11, 2250.00, 'Cash', 'Unpaid'),
(12, 16, 11, 1100.00, 'Cash', 'Unpaid'),
(13, 16, 12, 220.00, 'Cash', 'Unpaid'),
(14, 16, 13, 600.00, 'Cash', 'Unpaid'),
(15, 17, 14, 1250.00, 'Cash', 'Unpaid'),
(16, 19, 15, 600.00, 'Cash', 'Unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
CREATE TABLE IF NOT EXISTS `support` (
  `inquiry_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `status` varchar(50) DEFAULT 'Pending',
  `response` text,
  PRIMARY KEY (`inquiry_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `support`
--

INSERT INTO `support` (`inquiry_id`, `user_id`, `subject`, `message`, `status`, `response`) VALUES
(1, 1, 'Booking Issue', 'I am unable to book a cab.', 'Resolved', 'Issue fixed.'),
(2, 2, 'Payment Problem', 'My payment did not go through.', 'Pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `role` enum('admin','customer','driver') NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `nic`, `phone`, `address`, `role`, `reset_token`) VALUES
(1, 'Arun Kumarr', 'arun.kumar1@gmail.com', 'password123', '123456789V', '0771234567', 'No 10, Galle Road, Colombo', 'admin', NULL),
(2, 'Priya Raj', 'priya.raj2@gmail.com', 'password456', '987654321V', '0777654321', 'No 12, Main Street, Kandy', 'customer', NULL),
(3, 'Ravi Kumar', 'ravi.kumar3@gmail.com', 'password789', '234567890V', '0772233445', 'No 5, Hill Street, Jaffna', 'driver', NULL),
(4, 'Siti Mariyam', 'siti.mariyam4@gmail.com', 'password012', '345678901V', '0773344556', 'No 8, Beach Road, Galle', 'customer', NULL),
(5, 'Ganesh Pillai', 'ganesh.pillai5@gmail.com', 'password345', '456789012V', '0774455667', 'No 15, Forest Lane, Negombo', 'admin', NULL),
(6, 'Chandana Silva', 'chandana.silva6@gmail.com', 'password678', '567890123V', '0775566778', 'No 3, Church Road, Colombo', 'driver', NULL),
(7, 'Nalini Padmini', 'nalini.padmini7@gmail.com', 'password901', '678901234V', '0776677889', 'No 7, Temple Street, Galle', 'customer', NULL),
(8, 'Vasanthi Rajendran', 'vasanthi.rajendran8@gmail.com', 'password234', '789012345V', '0777788990', 'No 10, City Center, Kandy', 'admin', NULL),
(9, 'Kumaravel Ananthan', 'kumaravel.ananthan9@gmail.com', 'password567', '890123456V', '0778899001', 'No 6, Mountain Road, Colombo', 'driver', NULL),
(10, 'Manjula Devika', 'manjula.devika10@gmail.com', 'password890', '901234567V', '0779900112', 'No 2, Lake Road, Jaffna', 'customer', NULL),
(11, 'Shiva Murugan', 'shiva.murugan11@gmail.com', 'password1234', '123456789V', '0780011223', 'No 11, Railway Road, Kandy', 'admin', NULL),
(12, 'Meera Perera', 'meera.perera12@gmail.com', 'password3456', '234567890V', '0781122334', 'No 14, School Street, Galle', 'customer', NULL),
(13, 'Ravindra Nair', 'ravindra.nair13@gmail.com', 'password5678', '345678901V', '0782233445', 'No 9, Airport Road, Colombo', 'driver', NULL),
(14, 'Janani Kumar', 'janani.kumar14@gmail.com', 'password7890', '456789012V', '0783344556', 'No 4, Market Lane, Jaffna', 'customer', NULL),
(15, 'Tharushi Silva', 'tharushi.silva15@gmail.com', 'password0123', '567890123V', '0784455667', 'No 13, High Street, Colombo', 'admin', NULL),
(16, 'dino', 'dino@gmail.com', '$2a$10$AZqNoC1BP1YXSxuQy4/R5OQsHsRPHUEPYzhvz4KbNu./VcdTApN6S', '235235', '0778452145', 'gfgrs', 'customer', NULL),
(18, 'admin@gmail.com', 'admin@gmail.com', '$2a$10$/0YRF.MpjOk5CoWhOfqtAu9SDMwFaiFspSgIQA1O1qutp.WgMZtOe', '325324545', '0775584215', 'fsfse', 'admin', NULL),
(19, 'lishanii', 'lishan@gmail.com', '$2a$10$IdyugMjInwOErmMPzWZH9.M4ElXTy1xBXm1OWNy.ElJq0FJOc3jFK', '1234567v', '0779965842', 'nallur', 'customer', NULL),
(20, 'driver', 'driver@gmail.com', '$2a$10$JOU3Z6HokWSwdky3Vpo0leVpNSRCVi2rnS4YeRFc3qLGIgM7lU3IW', '123454643v', '0778541581', 'colombo', 'driver', NULL),
(21, 'shan', 'shan@gmail.com', '$2a$10$Tpclgh00U00QhW6ou62XCugTNdik/dXXIIUaCmw/qVHrFMarvVcVK', '24324325V', '0778541581', 'nallur', 'customer', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

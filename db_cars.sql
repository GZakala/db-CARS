-- MySQL dump 11.13  Distrib 8.0.27, for Ubuntu 20.04.1
--
-- Host: localhost    Database: cars
-- ------------------------------------------------------
-- Server version	8.0.27


DROP DATABASE IF EXISTS cars;
CREATE DATABASE cars;
USE cars;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    mark VARCHAR(20) NOT NULL,
    model VARCHAR(40) NOT NULL,
    generation VARCHAR(20) COMMENT 'Style type',
    `year-from` YEAR COMMENT 'Release date',
    `year-to` YEAR COMMENT 'Date of appearance in our salon',
    `body-type` VARCHAR(30) NOT NULL COMMENT 'Type of car body',
    notice VARCHAR(20) COMMENT 'Type car',
    volume INT NOT NULL COMMENT 'Audio system volume',
    transmission ENUM('manual', 'auto', 'robo', 'variator') NOT NULL DEFAULT 'Manual',
    complectation VARCHAR(30),
    `horse-power` INT NOT NULL,
    `engine-type` ENUM('petrol', 'diesel', 'hybrid', 'LPG') NOT NULL DEFAULT 'petrol',
    photo VARCHAR(255),
    logo VARCHAR(30) NOT NULL COMMENT 'Insprition on the logo',
    `doors-count` TINYINT NOT NULL DEFAULT 2 COMMENT 'Numbers of the doors',
    seats TINYINT NOT NULL DEFAULT 2 COMMENT 'Numbers of the seets',
    `length` BIGINT NOT NULL COMMENT 'Length in sm.',
    width BIGINT NOT NULL COMMENT 'Width in sm.',
    height BIGINT NOT NULL COMMENT 'Height in sm.',
    `wheel-base` BIGINT NOT NULL COMMENT 'Length wheel-base in sm.',
    clearance INT COMMENT 'Clearance',
    `front-wheel-base` INT COMMENT 'Front-wheel-base',
    `back-wheel-base` INT COMMENT 'Back-wheel-base',
    `wheel-size` VARCHAR(50) COMMENT 'Wheel-size',
    weight BIGINT COMMENT 'Weight',
    `gear-value` TINYINT DEFAULT 6 COMMENT 'Numbers of the gears',
    drive ENUM('front-wheel', 'rear-wheel', 'all-wheel') NOT NULL DEFAULT 'front-wheel',
    `max-speed` INT COMMENT 'Max-speed',
    `time-to-100` NUMERIC(10, 2) COMMENT 'Time to acceleration to 100 km/h',
    `petrol-type` VARCHAR(10) COMMENT 'Type of the petrol',
    `cylinders-value` TINYINT NOT NULL DEFAULT 6 COMMENT 'Numbers of the cylinders',
    valves TINYINT DEFAULT 4 COMMENT 'Numbers of the valves',
    compressions NUMERIC(10, 2),
    diametr NUMERIC(10, 2) COMMENT 'Engine diametr',
    PRIMARY KEY (id),
    KEY (`year-from`),
    KEY (`petrol-type`),
    KEY (`max-speed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- 
-- Table structure for table `clients`
-- 

DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    `number` VARCHAR(11) NOT NULL,
    mail VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    passport VARCHAR(10) NOT NULL,
    PRIMARY KEY (id),
    KEY (lastname)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- 
-- Table structure for table price_list
-- 

DROP TABLE IF EXISTS price_list;
CREATE TABLE price_list (
    car_id BIGINT UNSIGNED NOT NULL,
    type_salary ENUM('rental', 'installments', 'cash', 'all sum') NOT NULL DEFAULT 'installments',
    price NUMERIC(11, 2) UNSIGNED NOT NULL,
    PRIMARY KEY (car_id, type_salary),
    CONSTRAINT fk_car_id FOREIGN KEY (car_id) REFERENCES cars (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- 
-- Table structure for table orders
--

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    client_id BIGINT UNSIGNED NOT NULL,
    car_id BIGINT UNSIGNED NOT NULL,
    price BIGINT UNSIGNED NOT NULL,
    type_salary ENUM('rental', 'installments', 'cash', 'all sum') NOT NULL DEFAULT 'installments',
    PRIMARY KEY (client_id, car_id),
    KEY (car_id),
    CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES clients (id),
    CONSTRAINT fk_ord_car_id FOREIGN KEY (car_id) REFERENCES cars (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- 
-- Table structure for table club_members
-- 

DROP TABLE IF EXISTS club_members;
CREATE TABLE club_members (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    phone VARCHAR(11) NOT NULL,
    birthday DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY (lastname)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- 
-- Table structure for table applications
-- 

DROP TABLE IF EXISTS applications;
CREATE TABLE applications (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    phone VARCHAR(11) NOT NULL,
    birthday DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    application_status ENUM('under consideration', 'rejected') NOT NULL DEFAULT 'rejected',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




-- 
-- Table structure for table auctions
-- 

DROP TABLE IF EXISTS auctions;
CREATE TABLE auctions (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    theme VARCHAR(255) NOT NULL DEFAULT 'Без тематики',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- 
-- Table structure for table auction_visitors
-- 

DROP TABLE IF EXISTS auction_visitors;
CREATE TABLE auction_visitors (
    id_auction BIGINT UNSIGNED NOT NULL,
    id_person BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_auction, id_person),
    CONSTRAINT fk_id_auction_auction FOREIGN KEY (id_auction) REFERENCES auctions (id),
    CONSTRAINT fk_id_person_auction FOREIGN KEY (id_person) REFERENCES club_members (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- 
-- Table structure for table events
-- 

DROP TABLE IF EXISTS events;
CREATE TABLE events (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    theme VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- 
-- Table structure for table event_visitors
-- 

DROP TABLE IF EXISTS event_visitors;
CREATE TABLE event_visitors (
    id_event BIGINT UNSIGNED NOT NULL,
    id_person BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_event, id_person),
    CONSTRAINT fk_id_events FOREIGN KEY (id_event) REFERENCES events (id),
    CONSTRAINT fk_id_person_event FOREIGN KEY (id_person) REFERENCES club_members (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- ***************************************************************************
-- 
-- Table structure for table logs_club_auction_event
-- 

DROP TABLE IF EXISTS logs_club_auction_event;
CREATE TABLE logs_club_auction_event (
    created_at DATETIME NOT NULL,
    table_name VARCHAR(20) NOT NULL,
    id BIGINT UNSIGNED NOT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- TRIGGER ON club_members --

DROP TRIGGER IF EXISTS watchlog_club_members;

DELIMITER //
CREATE TRIGGER watchlog_club_members AFTER INSERT ON club_members
FOR EACH ROW
BEGIN
    INSERT INTO logs_club_auction_event
    VALUES (NOW(), 'club_members', NEW.id);
END //
DELIMITER ;

-- TRIGGER ON applications --

DROP TRIGGER IF EXISTS watchlog_applications;

DELIMITER //
CREATE TRIGGER watchlog_applications AFTER INSERT ON applications
FOR EACH ROW
BEGIN
    INSERT INTO logs_club_auction_event
    VALUES (NOW(), 'applications', NEW.id);
END //
DELIMITER ;


-- TRIGGER ON auctions --

DROP TRIGGER IF EXISTS watchlog_auctions;

DELIMITER //
CREATE TRIGGER watchlog_auctions AFTER INSERT ON auctions
FOR EACH ROW
BEGIN
    INSERT INTO logs_club_auction_event
    VALUES (NOW(), 'auctions', NEW.id);
END //
DELIMITER ;


-- TRIGGER ON events --

DROP TRIGGER IF EXISTS watchlog_events;

DELIMITER //
CREATE TRIGGER watchlog_events AFTER INSERT ON events
FOR EACH ROW
BEGIN
    INSERT INTO logs_club_auction_event
    VALUES (NOW(), 'events', NEW.id);
END //
DELIMITER ;


-- TRIGGER ON cars --

DROP TRIGGER IF EXISTS watchlog_cars;

DELIMITER //
CREATE TRIGGER watchlog_cars AFTER INSERT ON cars
FOR EACH ROW
BEGIN
    INSERT INTO logs_club_auction_event
    VALUES (NOW(), 'cars', NEW.id);
END //
DELIMITER ;


-- TRIGGER ON clients --

DROP TRIGGER IF EXISTS watchlog_clients;

DELIMITER //
CREATE TRIGGER watchlog_clients AFTER INSERT ON clients
FOR EACH ROW
BEGIN
    INSERT INTO logs_club_auction_event
    VALUES (NOW(), 'clients', NEW.id);
END //
DELIMITER ;

-- ***************************************************************************



-- ***************************************************************************
-- 
-- Table structure for table logs_price_order
-- 

DROP TABLE IF EXISTS logs_price_order;
CREATE TABLE logs_price_order (
    created_at DATETIME NOT NULL,
    table_name VARCHAR(20) NOT NULL,
    car_id BIGINT UNSIGNED NOT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- TRIGGER ON price_list --

DROP TRIGGER IF EXISTS watchlog_price_list;

DELIMITER //
CREATE TRIGGER watchlog_price_list AFTER INSERT ON price_list
FOR EACH ROW
BEGIN
    INSERT INTO logs_price_order
    VALUES (NOW(), 'price_list', NEW.car_id);
END //
DELIMITER ;

-- TRIGGER ON orders --

DROP TRIGGER IF EXISTS watchlog_orders;

DELIMITER //
CREATE TRIGGER watchlog_orders AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO logs_price_order
    VALUES (NOW(), 'orders', NEW.car_id);
END //
DELIMITER ;

-- ***************************************************************************



-- ***************************************************************************
-- 
-- Table structure for table logs_price_order
-- 

DROP TABLE IF EXISTS logs_visitors;
CREATE TABLE logs_visitors (
    created_at DATETIME NOT NULL,
    table_name VARCHAR(20) NOT NULL,
    id_auction BIGINT UNSIGNED NOT NULL,
    id_person BIGINT UNSIGNED NOT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- TRIGGER ON auction_visitors --

DROP TRIGGER IF EXISTS watchlog_auction_visitors;

DELIMITER //
CREATE TRIGGER watchlog_auction_visitors AFTER INSERT ON auction_visitors
FOR EACH ROW
BEGIN
    INSERT INTO logs_visitors
    VALUES (NOW(), 'auction_visitors', NEW.id_auction, NEW.id_person);
END //
DELIMITER ;


-- TRIGGER ON event_visitors --

DROP TRIGGER IF EXISTS watchlog_event_visitors;

DELIMITER //
CREATE TRIGGER watchlog_event_visitors AFTER INSERT ON event_visitors
FOR EACH ROW
BEGIN
    INSERT INTO logs_visitors
    VALUES (NOW(), 'event_visitors', NEW.id_event, NEW.id_person);
END //
DELIMITER ;

-- ***************************************************************************



-- 
-- View structure for view upcoming_events
-- 

CREATE OR REPLACE VIEW upcoming_events AS
SELECT 
    'auctions' AS table_name, id, start_date, end_date, theme FROM auctions
WHERE 
    start_date <= DATE_ADD(NOW(), INTERVAL 14 DAY) AND end_date > NOW()
UNION
SELECT 
    'events' AS table_name, id, start_date, end_date, theme FROM events
WHERE 
    start_date <= DATE_ADD(NOW(), INTERVAL 14 DAY) AND end_date > NOW();



-- 
-- View structure for view auto_for_events
-- 

CREATE OR REPLACE VIEW auto_for_events AS
SELECT 
    id, mark, model FROM cars
WHERE
    id NOT IN ( SELECT car_id FROM orders );


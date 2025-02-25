
use 090924_Heorhii;
CREATE TABLE drivers (
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    license_number VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    rating DECIMAL(3,2) CHECK (rating BETWEEN 0 AND 5)
);

CREATE TABLE cars (
    car_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_id INT UNIQUE, 
    model VARCHAR(100) NOT NULL,
    plate_number VARCHAR(20) UNIQUE NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id) ON DELETE SET NULL
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE rides (
    ride_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_id INT NOT NULL,
    customer_id INT NOT NULL,
    car_id INT NOT NULL,
    pickup_location VARCHAR(255) NOT NULL,
    dropoff_location VARCHAR(255) NOT NULL,
    ride_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    fare DECIMAL(10,2) NOT NULL CHECK (fare >= 0),
    status ENUM('completed', 'cancelled', 'pending') NOT NULL DEFAULT 'pending',
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (car_id) REFERENCES cars(car_id) ON DELETE CASCADE
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    ride_id INT UNIQUE NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK (amount >= 0),
    payment_method ENUM('cash', 'credit_card', 'paypal') NOT NULL,
    payment_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ride_id) REFERENCES rides(ride_id) ON DELETE CASCADE
);


-- RELATIONS:
-- Водитель (drivers) → 1:1 → Автомобиль (cars) (Один водитель управляет одной машиной).
-- Клиент (customers) → 1:M → Поездки (rides) (Один клиент может совершать несколько поездок).
-- Водитель (drivers) → 1:M → Поездки (rides) (Один водитель может выполнять несколько поездок).
-- Автомобиль (cars) → 1:M → Поездки (rides) (Один автомобиль может использоваться в разных поездках).
-- Поездка (rides) → 1:1 → Платеж (payments) (Одна поездка — один платеж).

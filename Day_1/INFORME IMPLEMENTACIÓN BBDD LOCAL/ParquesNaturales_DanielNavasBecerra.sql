CREATE DATABASE ParquesNaturales;
USE ParquesNaturales;

CREATE TABLE responsible_entity(
    entity_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE departments( 
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    entity_id INT,
    FOREIGN KEY (entity_id) REFERENCES responsible_entity(entity_id)
);

CREATE TABLE department_entity( 
    department_entity_id INT PRIMARY KEY AUTO_INCREMENT,
    entity_id INT,
    department_id INT,
    FOREIGN KEY (entity_id) REFERENCES responsible_entity(entity_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE natural_park(
    park_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    declaration_date DATETIME NOT NULL,
    surface INT NOT NULL,
    entity_id INT,
    FOREIGN KEY (entity_id) REFERENCES responsible_entity(entity_id)
);

CREATE TABLE area(
    area_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    surface INT NOT NULL,
    park_id INT,
    FOREIGN KEY (park_id) REFERENCES natural_park(park_id)
);

CREATE TABLE species(
    species_id INT PRIMARY KEY AUTO_INCREMENT,
    scientific_name VARCHAR(50) NOT NULL,
    common_name VARCHAR(50) NOT NULL,
    individual_inventory INT NOT NULL,
    area_id INT,
    FOREIGN KEY (area_id) REFERENCES area(area_id)
);

CREATE TABLE person_type(
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    person_role VARCHAR(20) NOT NULL
);

CREATE TABLE staff(
    person_id INT PRIMARY KEY AUTO_INCREMENT,
    identification_card VARCHAR(15) NOT NULL,
    name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    contact_num VARCHAR(20) NOT NULL,
    salary INT NOT NULL,
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES person_type(type_id)
);

CREATE TABLE investigation_project(
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    budget INT NOT NULL,
    period INT NOT NULL
);

CREATE TABLE species_project(
    species_project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    species_id INT,
    FOREIGN KEY (project_id) REFERENCES investigation_project(project_id),
    FOREIGN KEY (species_id) REFERENCES species(species_id)
);

CREATE TABLE research_project(
    research_project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES investigation_project(project_id)
);

CREATE TABLE accommodation(
    accommodation_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    category VARCHAR(20) NOT NULL,
    park_id INT,
    FOREIGN KEY (park_id) REFERENCES natural_park(park_id)
);

CREATE TABLE visitor(
    visitor_id INT PRIMARY KEY AUTO_INCREMENT,
    identification_card VARCHAR(15) NOT NULL,
    name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    contact_num VARCHAR(20) NOT NULL,
    profession VARCHAR(20) NOT NULL,
    accommodation_id INT,
    FOREIGN KEY (accommodation_id) REFERENCES accommodation(accommodation_id)
);

INSERT INTO responsible_entity (name) VALUES
('Entity A'),
('Entity B'),
('Entity C'),
('Entity D'),
('Entity E');

INSERT INTO departments (name, entity_id) VALUES
('Department 1', 1),
('Department 2', 2),
('Department 3', 3),
('Department 4', 4),
('Department 5', 5);

INSERT INTO department_entity (entity_id, department_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO natural_park (name, declaration_date, surface, entity_id) VALUES
('Park 1', '2022-01-01 09:00:00', 1000, 1),
('Park 2', '2022-02-01 09:00:00', 2000, 2),
('Park 3', '2022-03-01 09:00:00', 3000, 3),
('Park 4', '2022-04-01 09:00:00', 4000, 4),
('Park 5', '2022-05-01 09:00:00', 5000, 5);

INSERT INTO area (name, surface, park_id) VALUES
('Area 1', 500, 1),
('Area 2', 600, 2),
('Area 3', 700, 3),
('Area 4', 800, 4),
('Area 5', 900, 5);

INSERT INTO species (scientific_name, common_name, individual_inventory, area_id) VALUES
('Species A', 'Common A', 100, 1),
('Species B', 'Common B', 200, 2),
('Species C', 'Common C', 300, 3),
('Species D', 'Common D', 400, 4),
('Species E', 'Common E', 500, 5);

INSERT INTO person_type (name, person_role) VALUES
('Type 1', 'Role 1'),
('Type 2', 'Role 2'),
('Type 3', 'Role 3'),
('Type 4', 'Role 4'),
('Type 5', 'Role 5');

INSERT INTO staff (identification_card, name, last_name, address, contact_num, salary, type_id) VALUES
('123456', 'John', 'Doe', 'Address 1', '123-456-7890', 50000, 1),
('234567', 'Jane', 'Smith', 'Address 2', '234-567-8901', 55000, 2),
('345678', 'Mike', 'Johnson', 'Address 3', '345-678-9012', 60000, 3),
('456789', 'Susan', 'Brown', 'Address 4', '456-789-0123', 65000, 4),
('567890', 'Chris', 'Davis', 'Address 5', '567-890-1234', 70000, 5);

INSERT INTO investigation_project (name, budget, period) VALUES
('Project A', 100000, 12),
('Project B', 150000, 18),
('Project C', 200000, 24),
('Project D', 250000, 36),
('Project E', 300000, 48);

INSERT INTO species_project (project_id, species_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO research_project (project_id) VALUES
(1),
(2),
(3),
(4),
(5);

INSERT INTO accommodation (name, capacity, category, park_id) VALUES
('Accommodation A', 10, 'Standard', 1),
('Accommodation B', 20, 'Standard', 2),
('Accommodation C', 30, 'Deluxe', 3),
('Accommodation D', 40, 'Deluxe', 4),
('Accommodation E', 50, 'Suite', 5);

INSERT INTO visitor (identification_card, name, last_name, address, contact_num, profession, accommodation_id) VALUES
('678901', 'Charlie', 'Evans', 'Address 6', '678-901-2345', 'Engineer', 1),
('789012', 'Laura', 'White', 'Address 7', '789-012-3456', 'Doctor', 2),
('890123', 'Oliver', 'Black', 'Address 8', '890-123-4567', 'Teacher', 3),
('901234', 'Sophia', 'Green', 'Address 9', '901-234-5678', 'Artist', 4),
('012345', 'Liam', 'Blue', 'Address 10', '012-345-6789', 'Lawyer', 5);


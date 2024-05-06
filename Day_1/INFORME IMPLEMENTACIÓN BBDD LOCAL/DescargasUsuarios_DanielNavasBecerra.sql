CREATE DATABASE DescargasUsuarios
USE DescargasUsuarios

CREATE TABLE Products (
  ProductID INT PRIMARY KEY AUTO_INCREMENT,
  ProductName VARCHAR(255) NOT NULL
);

CREATE TABLE Users (
  UsersID INT PRIMARY KEY AUTO_INCREMENT,
  EmailAddress VARCHAR(255) NOT NULL UNIQUE,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL
);

CREATE TABLE Downloads (
  DownloadID INT PRIMARY KEY AUTO_INCREMENT,
  FileName VARCHAR(255) NOT NULL,
  DateTimeDownload DATETIME NOT NULL,
  UsersID INT,
  ProductID INT,
  FOREIGN KEY (UsersID) REFERENCES Users(UsersID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductName) VALUES
('Product A'),
('Product B'),
('Product C'),
('Product D'),
('Product E');

INSERT INTO Users (EmailAddress, FirstName, LastName) VALUES
('john.doe@example.com', 'John', 'Doe'),
('jane.smith@example.com', 'Jane', 'Smith'),
('mike.jones@example.com', 'Mike', 'Jones'),
('susan.taylor@example.com', 'Susan', 'Taylor'),
('lisa.johnson@example.com', 'Lisa', 'Johnson');

INSERT INTO Downloads (FileName, DateTimeDownload, UsersID, ProductID) VALUES
('file1.pdf', '2024-05-01 10:00:00', 1, 1),
('file2.docx', '2024-05-01 11:00:00', 2, 2),
('file3.xlsx', '2024-05-01 12:00:00', 3, 3),
('file4.pptx', '2024-05-01 13:00:00', 4, 4),
('file5.zip', '2024-05-01 14:00:00', 5, 5);

-- Create the FinancialDB database
CREATE DATABASE IF NOT EXISTS FinancialDB;
USE FinancialDB;

-- Create the Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    NationalID VARCHAR(20),
    PANNumber VARCHAR(10)
);

-- Create the Account table
CREATE TABLE Account (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(50),
    Balance DECIMAL(15, 2),
    AccountOpenDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create the Transaction table
CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(50),
    TransactionAmount DECIMAL(10, 2),
    TransactionDate DATE,
    Description VARCHAR(255),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

-- Create the Loan table
CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType VARCHAR(50),
    LoanAmount DECIMAL(15, 2),
    InterestRate DECIMAL(5, 2),
    LoanStartDate DATE,
    LoanEndDate DATE,
    LoanStatus VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create the Investment table
CREATE TABLE Investment (
    InvestmentID INT PRIMARY KEY,
    CustomerID INT,
    InvestmentType VARCHAR(50),
    InvestmentAmount DECIMAL(15, 2),
    InvestmentDate DATE,
    MaturityDate DATE,
    InterestRate DECIMAL(5, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create the CreditScore table
CREATE TABLE CreditScore (
    CreditScoreID INT PRIMARY KEY,
    CustomerID INT,
    CreditScore INT,
    ScoreDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Insert sample data into the Customer table
INSERT INTO Customer (CustomerID, CustomerName, DateOfBirth, Gender, Address, PhoneNumber, Email, NationalID, PANNumber) VALUES
(1, 'John Doe', '1985-06-15', 'Male', '123 Elm Street, Springfield', '9876543210', 'john.doe@example.com', 'A123456789', 'ABCDE1234F'),
(2, 'Jane Smith', '1990-08-20', 'Female', '456 Oak Avenue, Springfield', '9876543211', 'jane.smith@example.com', 'B234567890', 'BCDEF2345G'),
(3, 'Robert Johnson', '1975-12-10', 'Male', '789 Pine Road, Springfield', '9876543212', 'robert.johnson@example.com', 'C345678901', 'CDEFG3456H'),
(4, 'Emily Davis', '1982-03-22', 'Female', '321 Maple Street, Springfield', '9876543213', 'emily.davis@example.com', 'D456789012', 'DEFGH4567I'),
(5, 'Michael Brown', '1978-07-05', 'Male', '654 Cedar Avenue, Springfield', '9876543214', 'michael.brown@example.com', 'E567890123', 'EFGHI5678J'),
(6, 'Sarah Wilson', '1995-09-18', 'Female', '987 Oakwood Drive, Springfield', '9876543215', 'sarah.wilson@example.com', 'F678901234', 'FGHIJ6789K'),
(7, 'David Miller', '1988-11-25', 'Male', '159 Spruce Road, Springfield', '9876543216', 'david.miller@example.com', 'G789012345', 'GHIJK7890L'),
(8, 'Sophia Moore', '1992-04-10', 'Female', '753 Birch Lane, Springfield', '9876543217', 'sophia.moore@example.com', 'H890123456', 'HIJKL8901M'),
(9, 'James Anderson', '1981-01-30', 'Male', '258 Pineapple Street, Springfield', '9876543218', 'james.anderson@example.com', 'I901234567', 'IJKLM9012N'),
(10, 'Olivia Taylor', '1993-12-15', 'Female', '369 Oakwood Avenue, Springfield', '9876543219', 'olivia.taylor@example.com', 'J012345678', 'JKLMN0123O'),
(11, 'Christopher Harris', '1986-05-20', 'Male', '147 Walnut Street, Springfield', '9876543220', 'christopher.harris@example.com', 'K123456789', 'KLMNO1234P'),
(12, 'Ava Martinez', '1997-02-25', 'Female', '753 Cherry Drive, Springfield', '9876543221', 'ava.martinez@example.com', 'L234567890', 'LMNOP2345Q'),
(13, 'Matthew Thompson', '1976-08-05', 'Male', '951 Pine Cone Lane, Springfield', '9876543222', 'matthew.thompson@example.com', 'M345678901', 'MNOPQ3456R'),
(14, 'Isabella White', '1989-10-22', 'Female', '369 Oakwood Avenue, Springfield', '9876543223', 'isabella.white@example.com', 'N456789012', 'NOPQR4567S'),
(15, 'Daniel Lewis', '1983-07-30', 'Male', '852 Maplewood Avenue, Springfield', '9876543224', 'daniel.lewis@example.com', 'O567890123', 'OPQRS5678T');

-- Insert sample data into the Account table
INSERT INTO Account (AccountID, CustomerID, AccountType, Balance, AccountOpenDate) VALUES
(1, 1, 'Savings', 15000.00, '2022-01-01'),
(2, 2, 'Current', 30000.00, '2021-06-15'),
(3, 3, 'Savings', 5000.00, '2020-12-10'),
(4, 4, 'Savings', 25000.00, '2022-01-15'),
(5, 5, 'Current', 40000.00, '2021-07-01'),
(6, 6, 'Savings', 18000.00, '2020-11-20'),
(7, 7, 'Savings', 23000.00, '2022-02-05'),
(8, 8, 'Current', 35000.00, '2021-06-25'),
(9, 9, 'Savings', 28000.00, '2020-10-10'),
(10, 10, 'Savings', 17000.00, '2022-03-01'),
(11, 11, 'Current', 45000.00, '2021-09-01'),
(12, 12, 'Savings', 12000.00, '2020-08-05'),
(13, 13, 'Savings', 26000.00, '2022-04-01'),
(14, 14, 'Current', 39000.00, '2021-11-01'),
(15, 15, 'Savings', 31000.00, '2020-07-15');

-- Insert sample data into the Transaction table
INSERT INTO Transaction (TransactionID, AccountID, TransactionType, TransactionAmount, TransactionDate, Description) VALUES
(1, 1, 'Deposit', 5000.00, '2022-02-01', 'Monthly Salary'),
(2, 2, 'Withdrawal', 1000.00, '2022-02-05', 'ATM Withdrawal'),
(3, 3, 'Deposit', 2000.00, '2022-02-10', 'Freelance Income'),
(4, 4, 'Deposit', 3000.00, '2022-03-01', 'Dividend Payment'),
(5, 5, 'Withdrawal', 1500.00, '2022-03-05', 'Grocery Shopping'),
(6, 6, 'Deposit', 4000.00, '2022-03-10', 'Rent Payment'),
(7, 7, 'Withdrawal', 1200.00, '2022-03-15', 'Electricity Bill'),
(8, 8, 'Deposit', 2500.00, '2022-04-01', 'Bonus Payment'),
(9, 9, 'Withdrawal', 1800.00, '2022-04-05', 'Car Maintenance'),
(10, 10, 'Deposit', 6000.00, '2022-04-10', 'Consultancy Fee'),
(11, 11, 'Withdrawal', 1100.00, '2022-04-15', 'Online Shopping'),
(12, 12, 'Deposit', 7000.00, '2022-05-01', 'Part-time Job Income'),
(13, 13, 'Withdrawal', 900.00, '2022-05-05', 'Dining Out'),
(14, 14, 'Deposit', 8000.00, '2022-05-10', 'Contract Payment'),
(15, 15, 'Withdrawal', 1600.00, '2022-05-15', 'Travel Expenses');

-- Insert sample data into the Loan table
INSERT INTO Loan (LoanID, CustomerID, LoanType, LoanAmount, InterestRate, LoanStartDate, LoanEndDate, LoanStatus) VALUES
(1, 1, 'Personal', 50000.00, 7.5, '2022-01-01', '2025-01-01', 'Active'),
(2, 2, 'Mortgage', 150000.00, 6.5, '2021-06-15', '2031-06-15', 'Active'),
(3, 3, 'Auto', 25000.00, 8.0, '2020-12-10', '2024-12-10', 'Paid'),
(4, 4, 'Education', 30000.00, 5.5, '2022-02-01', '2026-02-01', 'Active'),
(5, 5, 'Business', 100000.00, 9.0, '2021-07-15', '2028-07-15', 'Active'),
(6, 6, 'Personal', 40000.00, 7.0, '2020-11-01', '2024-11-01', 'Paid'),
(7, 7, 'Mortgage', 180000.00, 6.2, '2022-03-01', '2032-03-01', 'Active'),
(8, 8, 'Auto', 22000.00, 7.8, '2021-06-10', '2025-06-10', 'Active'),
(9, 9, 'Education', 35000.00, 5.2, '2020-09-01', '2025-09-01', 'Paid'),
(10, 10, 'Personal', 45000.00, 7.4, '2022-04-01', '2026-04-01', 'Active'),
(11, 11, 'Business', 90000.00, 8.5, '2021-09-10', '2029-09-10', 'Active'),
(12, 12, 'Auto', 28000.00, 7.9, '2020-07-01', '2024-07-01', 'Paid'),
(13, 13, 'Mortgage', 160000.00, 6.7, '2022-05-01', '2032-05-01', 'Active'),
(14, 14, 'Education', 32000.00, 5.4, '2021-10-01', '2026-10-01', 'Active'),
(15, 15, 'Personal', 55000.00, 7.3, '2020-08-01', '2024-08-01', 'Paid');

-- Insert sample data into the Investment table
INSERT INTO Investment (InvestmentID, CustomerID, InvestmentType, InvestmentAmount, InvestmentDate, MaturityDate, InterestRate) VALUES
(1, 1, 'Fixed Deposit', 20000.00, '2022-01-01', '2025-01-01', 6.5),
(2, 2, 'Mutual Fund', 30000.00, '2021-06-15', '2024-06-15', 8.0),
(3, 3, 'Bonds', 10000.00, '2020-12-10', '2025-12-10', 7.0),
(4, 4, 'Fixed Deposit', 25000.00, '2022-02-01', '2026-02-01', 6.7),
(5, 5, 'Mutual Fund', 40000.00, '2021-07-01', '2025-07-01', 8.2),
(6, 6, 'Bonds', 15000.00, '2020-11-10', '2025-11-10', 7.1),
(7, 7, 'Fixed Deposit', 30000.00, '2022-03-01', '2026-03-01', 6.6),
(8, 8, 'Mutual Fund', 35000.00, '2021-06-25', '2024-06-25', 7.9),
(9, 9, 'Bonds', 12000.00, '2020-10-01', '2025-10-01', 7.3),
(10, 10, 'Fixed Deposit', 28000.00, '2022-04-01', '2025-04-01', 6.8),
(11, 11, 'Mutual Fund', 45000.00, '2021-09-01', '2024-09-01', 8.1),
(12, 12, 'Bonds', 18000.00, '2020-08-05', '2025-08-05', 7.2),
(13, 13, 'Fixed Deposit', 26000.00, '2022-05-01', '2026-05-01', 6.9),
(14, 14, 'Mutual Fund', 39000.00, '2021-11-01', '2025-11-01', 8.3),
(15, 15, 'Bonds', 31000.00, '2020-07-15', '2025-07-15', 7.4);

-- Insert sample data into the CreditScore table
INSERT INTO CreditScore (CreditScoreID, CustomerID, CreditScore, ScoreDate) VALUES
(1, 1, 750, '2022-02-01'),
(2, 2, 680, '2022-02-01'),
(3, 3, 720, '2022-02-01'),
(4, 4, 770, '2022-03-01'),
(5, 5, 690, '2022-03-01'),
(6, 6, 740, '2022-03-01'),
(7, 7, 760, '2022-04-01'),
(8, 8, 675, '2022-04-01'),
(9, 9, 710, '2022-04-01'),
(10, 10, 780, '2022-05-01'),
(11, 11, 695, '2022-05-01'),
(12, 12, 730, '2022-05-01'),
(13, 13, 755, '2022-06-01'),
(14, 14, 685, '2022-06-01'),
(15, 15, 725, '2022-06-01');

select*from customer;

select*from creditscore;

select*from account;

select*from investment;

select*from loan;

select*from transaction;

SELECT * FROM account WHERE accounttype = "savings";

select * from customer where gender = "male";

UPDATE Customer
SET Email = 'newemail@example.com', 
    PhoneNumber = '123-456-7890'
WHERE CustomerID = 1;

UPDATE account
SET AccountType = 'current', 
    Balance = 5000
WHERE AccountID = 1;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Account
WHERE CustomerID = 5;




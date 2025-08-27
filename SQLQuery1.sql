-- ======================
-- 1) Readers Table
-- ======================
CREATE TABLE Readers (
    User_ID INT PRIMARY KEY IDENTITY(1,1),
    Firstname NVARCHAR(50) NOT NULL,
    Lastname NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    PhoneNo NVARCHAR(20),
    Address NVARCHAR(200)
);
-- ======================
-- 2) Staff Table
-- ======================
CREATE TABLE Staff (
    Staff_id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL
);
-- ======================
-- 3) Authentication System
-- ======================
CREATE TABLE AuthenticationSystem (
    LoginId INT PRIMARY KEY IDENTITY(1,1),
    Staff_id INT UNIQUE, -- One-to-One with Staff
    Password NVARCHAR(100) NOT NULL,
    FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);

-- ======================
-- 4) Publisher Table
-- ======================
CREATE TABLE Publisher (
    Publisher_id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    YearOfPublication INT
);

-- ======================
-- 5) Books Table
-- ======================
CREATE TABLE Books (
    ISBN INT PRIMARY KEY, 
    Title NVARCHAR(200) NOT NULL,
    AuthNo NVARCHAR(50),
    Edition NVARCHAR(20),
    Category NVARCHAR(50),
    Price DECIMAL(10,2),
    Publisher_id INT,
    FOREIGN KEY (Publisher_id) REFERENCES Publisher(Publisher_id)
);

-- ======================
-- 6) Reports Table
-- ======================
CREATE TABLE Reports (
    Reg_no INT PRIMARY KEY IDENTITY(1,1),
    Book_No INT,
    IssueReturn NVARCHAR(20), -- "Issue" OR "Return"
    User_id INT,
    Staff_id INT,
    FOREIGN KEY (User_id) REFERENCES Readers(User_ID),
    FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);


-- ======================
-- 7) Readers ↔ Books (Reserve/Return relationship)
-- Many-to-Many with attributes
-- ======================
CREATE TABLE ReaderBooks (
    User_ID INT,
    ISBN INT,
    ReserveDate DATE,
    ReturnDate DATE,
    DueDate DATE,
    PRIMARY KEY(User_ID, ISBN),
    FOREIGN KEY (User_ID) REFERENCES Readers(User_ID),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
);

-- ======================
-- 8) Staff ↔ Readers (Keeps Track of)
-- Many-to-Many
-- ======================
CREATE TABLE StaffReaders (
    Staff_id INT,
    User_ID INT,
    PRIMARY KEY(Staff_id, User_ID),
    FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id),
    FOREIGN KEY (User_ID) REFERENCES Readers(User_ID)
);

-- ======================
-- 9) Staff ↔ Books (Maintain)
-- Many-to-Many
-- ======================
CREATE TABLE StaffBooks (
    Staff_id INT,
    ISBN INT,
    PRIMARY KEY(Staff_id, ISBN),
    FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
);




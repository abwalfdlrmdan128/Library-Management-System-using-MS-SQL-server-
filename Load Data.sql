use [Library Management System]
INSERT INTO Readers (Firstname,Lastname, Email, PhoneNo)
VALUES
( 'Ahmed', 'Ali', 'ahmed@example.com', '01012345678'),
('Sara','Mohamed', 'sara@example.com', '01098765432'),
('Omar' ,'Tarek', 'omar@example.com', '01122334455'),
('Nour' ,'Adel', 'nour@example.com', '01255667788');


INSERT INTO Staff (Name)
VALUES
('Mostafa Hassan'),
('Aya Ibrahim'),
('Khaled Mahmoud');


INSERT INTO AuthenticationSystem (Staff_id, Password)
VALUES
(1, 'pass123'),
(2, 'ayaPass'),
(3, 'khaled2025');

INSERT INTO Publisher (Name, YearOfPublication)
VALUES
('Reilly Media', 2021),
('Pearson', 2020),
('Springer', 2019);

INSERT INTO Books (ISBN, Title, AuthNo, Edition, Category, Price, Publisher_id)
VALUES
(1001, 'Learning SQL', 'A001', '2nd', 'Database', 250.00, 1),
(1002, 'Operating Systems Concepts', 'A002', '10th', 'Computer Science', 350.00, 2),
(1003, 'Clean Code', 'A003', '1st', 'Programming', 200.00, 3),
(1004, 'Computer Networks', 'A004', '5th', 'Networking', 280.00, 2);


INSERT INTO Reports (Book_No, IssueReturn, User_id, Staff_id)
VALUES
(1001, 'Issue', 1, 1),
(1002, 'Return', 2, 2),
(1003, 'Issue', 3, 3);


INSERT INTO ReaderBooks (User_ID, ISBN, ReserveDate, ReturnDate, DueDate)
VALUES
(1, 1001, '2025-08-01', NULL, '2025-08-15'),
(2, 1002, '2025-08-03', '2025-08-10', '2025-08-12'),
(3, 1003, '2025-08-05', NULL, '2025-08-20');


INSERT INTO StaffReaders (Staff_id, User_ID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4);


INSERT INTO StaffBooks (Staff_id, ISBN)
VALUES
(1, 1001),
(1, 1002),
(2, 1003),
(3, 1004);

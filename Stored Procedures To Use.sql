
-- ======================
--stored procedures
-- ======================


-- nummber of Borrow Book by each Readers
CREATE PROCEDURE NO_OF_BorroBook_per_Reader
AS
BEGIN
    SELECT r.User_ID,r.Firstname+' '+r.Lastname, COUNT(rb.ISBN) AS NoBorrow
    FROM Readers r
    left JOIN ReaderBooks rb 
        ON r.User_ID = rb.User_ID
    GROUP BY r.User_ID,r.Firstname+' '+r.Lastname;
END;


-- Get Borrowed Books By each Reader
CREATE PROCEDURE GetBorrowedBooksByReader
    @UserID INT
AS
BEGIN
    SELECT rb.ISBN, b.Title, rb.ReserveDate, rb.ReturnDate
    FROM ReaderBooks rb
    JOIN Books b ON rb.ISBN = rb.ISBN
    WHERE rb.User_ID = @UserID;
END;

--Readers who don't Borrow any Books 
CREATE PROCEDURE GetReadersWithoutBorrow
AS
BEGIN
    SELECT r.User_ID, r.Firstname
    FROM Readers r
    LEFT JOIN ReaderBooks rb ON r.User_ID = rb.User_ID
    WHERE rb.User_ID IS NULL;
END;

-- get Available Books
CREATE PROCEDURE GetAvailableBooks
AS
BEGIN
    SELECT b.ISBN, b.Title, b.AuthNo
    FROM Books b
    WHERE b.ISBN NOT IN (SELECT ISBN FROM ReaderBooks WHERE ReturnDate IS NULL);
END;

-- number of borrowed Books 
CREATE PROCEDURE GetBorrowedBooksCount
AS
BEGIN
    SELECT COUNT(*) AS TotalBorrowed
    FROM ReaderBooks
    WHERE ReturnDate IS NULL;
END;

-- insert new _borrowed Book
CREATE PROCEDURE BorrowBook
    @UserID INT,
    @BookID INT,
    @BorrowDate DATE
AS
BEGIN
    INSERT INTO ReaderBooks(User_ID, ISBN, ReserveDate, ReturnDate)
    VALUES(@UserID, @BookID, @BorrowDate, NULL);
END;


-- insert Return book
CREATE PROCEDURE ReturnBook
    @UserID INT,
    @BookID INT,
    @ReturnDate DATE
AS
BEGIN
    UPDATE ReaderBooks
    SET ReturnDate = @ReturnDate
    WHERE User_ID = @UserID AND ISBN = @BookID AND ReturnDate IS NULL;
END;

-- functions
create function dbo.GetBorrowDuration(@BorrowID int)
returns int
as
begin
    declare @Days int
    select @Days = DATEDIFF(day, ReserveDate, ReturnDate)
    from ReaderBooks
    where ISBN = @BorrowID
    return @Days
end;

-- name of reader according to id
CREATE FUNCTION dbo.GetReaderName (@UserID INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @Name NVARCHAR(100);

    SELECT @Name = Firstname
    FROM Readers
    WHERE User_ID = @UserID;

    RETURN @Name;
END;

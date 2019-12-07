
USE LIBRARY_MS
GO

CREATE PROC getBorrower @branch varchar(30) = 'Sharpstown', @date varchar(30) = '2019-12-06'
AS
SELECT a2.Title, a4.Name, a4.Address FROM BOOK_LOANS a1
INNER JOIN BOOKS a2 ON a2.BookID = a1.BookID
INNER JOIN LIBRARY_BRANCH a3 ON a3.BranchID = a1.BranchID
INNER JOIN BORROWER a4 ON a4.CardNo = a1.CardNo
WHERE a3.BranchName = @branch AND a1.DateDue = @date
GO
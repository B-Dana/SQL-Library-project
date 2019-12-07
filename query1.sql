
USE LIBRARY_MS
GO

CREATE PROC getBookCopies @BookTitle VARCHAR(50) = 'The Lost Tribe', @BRANCH VARCHAR(30) = 'Sharpstown'
AS
SELECT a2.Title, a3.BranchName, a1.Number_Of_Copies FROM BOOK_COPIES AS a1
INNER JOIN BOOKS AS a2 ON a2.BookID = a1.BookID 
INNER JOIN LIBRARY_BRANCH AS a3 ON a3.BranchID = a1.BranchID
WHERE a2.Title = @BookTitle AND 
a3.BranchName = @BRANCH

GO
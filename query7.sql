USE LIBRARY_MS
GO

CREATE PROC getBooksByStephenKing 
AS
SELECT a1.Title, a4.AuthorName, SUM(a2.Number_Of_Copies) AS Total_books, a3.BranchName
FROM BOOKS a1 
INNER JOIN BOOK_COPIES a2 ON a2.BookID = a1.BookID
INNER JOIN LIBRARY_BRANCH a3 ON a3.BranchID = a2.BranchID
INNER JOIN BOOK_AUTHORS a4 ON a4.BookID = a1.BookID
WHERE a4.AuthorName = 'Stephen King' AND a3.BranchName = 'Central'
GROUP BY a1.Title, a4.AuthorName, a3.BranchName
GO





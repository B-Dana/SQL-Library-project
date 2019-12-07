USE LIBRARY_MS
GO

CREATE PROC getLibraryBooksOut
AS
SELECT 
a1.BranchID,
a2.BranchName,
COUNT(*) as Total_books_out
FROM BOOK_LOANS a1
INNER JOIN LIBRARY_BRANCH a2 ON a2.BranchID = a1.BranchID 
GROUP BY a1.BranchID, a2.BranchName
GO

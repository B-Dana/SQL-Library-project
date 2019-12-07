USE LIBRARY_MS
GO

CREATE PROC getBorrower2
AS
SELECT a1.Name, a1.Address, COUNT(*) AS Total_books_out
FROM BORROWER a1
INNER JOIN BOOK_LOANS a2 ON a2.CardNo = a1.CardNo
GROUP BY a1.Name, a1.Address
HAVING COUNT(*) > 5
GO



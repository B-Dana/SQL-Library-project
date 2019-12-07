
CREATE DATABASE LIBRARY_MS

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR(30) NOT NULL,
	Address VARCHAR(30) NOT NULL
);

INSERT INTO LIBRARY_BRANCH 
	(BranchName, Address)
	VALUES
	('Sharpstown', '4040 NE Tillamook St' ),
	('Central', '801 SW 10th Ave'),
	('Beaverton', '12375 SW 5th St'),
	('Hillsboro', '2850 NE Brookwood Pkwy')
;

SELECT * FROM LIBRARY_BRANCH


CREATE TABLE PUBLISHER(
	PublisherName VARCHAR(30) PRIMARY KEY NOT NULL, 
	Address VARCHAR(60) NOT NULL,
	Phone VARCHAR(30) NOT NULL
);

INSERT INTO PUBLISHER
	(PublisherName, Address, Phone)
	VALUES
	('Simon & Schuster', '166 King Street East, Suite 300, Toronto, Canada', '(800) 387-0446'),
	('Penguin Classics', '87 Main st, Suite 205, London, UK', '800-764-8787'),
	('Arthur A. Levine Books', '4345 NE Morrison st, London, UK', '800-764-2324'),
	('Bantam', '876 Sunny ave, New York, US', '766-633-7878'),
	('Thomas & Mercer', '876 NW 205 ave, Seattle, Washington, US', '800-787-8787')
;

SELECT * FROM PUBLISHER


CREATE TABLE BOOKS(
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(30) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Penguin Classics'),
	('The Shining', 'Simon & Schuster'),
	('It', 'Simon & Schuster'),
	('Misery', 'Simon & Schuster'),
	('The Stand', 'Simon & Schuster'),
	('The Green Mile', 'Simon & Schuster'),
	('Steve Jobs', 'Simon & Schuster'),
	('Harry Potter', 'Arthur A. Levine Books'),
	('A Brief History of Time', 'Bantam'),
	('The Universe in a Nutshell', 'Bantam'),
	('1984', 'Penguin Classics'),
	('Pride and Prejudice', 'Penguin Classics'),
	('Foundation', 'Bantam'),
	('Einstein: his life and Universe', 'Simon & Schuster'),
	('Benjamin Franklin: An American Life', 'Simon & Schuster'),
	('Leonardo da Vinci', 'Simon & Schuster'),
	('Unspeakable Things', 'Thomas & Mercer'),
	('The Handmaid''s Tale','Thomas & Mercer'),
	('The Great Gatsby', 'Penguin Classics'),
	('Lord of the Rings','Penguin Classics')
;

SELECT * FROM BOOKS

DROP TABLE BOOK_AUTHORS
CREATE TABLE BOOK_AUTHORS(
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

INSERT INTO BOOK_AUTHORS
		(BookID, AuthorName)
		VALUES
		(1, 'Matthew Caldwell'),
		(2, 'Stephen KIng'),
		(3, 'Stephen KIng'),
		(4, 'Stephen KIng'),
		(5, 'Stephen KIng'),
		(6, 'Stephen KIng'),
		(7, 'Walter Isaacson'),
		(8,'J.K.Rowling'),
		(9, 'Stephen Hawking'),
		(10, 'Stephen Hawking'),
		(11, 'George Orwell'),
		(12, 'Jane Austin'),
		(13, 'Isaac Asimov'),
		(14, 'Walter Isaacson'),
		(15, 'Walter Isaacson'),
		(16, 'Walter Isaacson'),
		(17, 'Jess Lourey'),
		(18, 'Margaret Atwood'),
		(19, 'F.Scott Fitzgerald'),
		(20, 'J.R.R.Tolkien')
;

SELECT * FROM BOOK_AUTHORS

CREATE TABLE BOOK_COPIES(
	BookID INT NOT NULL CONSTRAINT fk_Book_ID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

INSERT INTO BOOK_COPIES
	(BranchID, BookID, Number_Of_Copies)
	VALUES
	(1, 1, 10),
	(1, 2, 10),
	(1, 3, 10),
	(1, 4, 10),
	(1, 5, 10),
	(1, 6, 10),
	(1, 7, 10),
	(1, 8, 20),
	(1, 9, 20),
	(1, 10, 20),
	(2, 1, 6),
	(2, 2, 6),
	(2, 3, 6),
	(2, 4, 6),
	(2, 5, 10),
	(2, 6, 20),
	(2, 7, 20),
	(2, 8, 20),
	(2, 9, 20),
	(2, 10, 6),
	(3, 11, 8),
	(3, 12, 8),
	(3, 13, 8),
	(3, 14, 8),
	(3, 15, 8),
	(3, 16, 8),
	(3, 17, 8),
	(3, 18, 8),
	(3, 19, 8),
	(3, 20, 8),
	(4, 11, 10),
	(4, 12, 10),
	(4, 13, 10),
	(4, 14, 10),
	(4, 15, 10),
	(4, 16, 10),
	(4, 17, 10),
	(4, 18, 8),
	(4, 19, 8),
	(4, 20, 8)
;
	
SELECT * FROM BOOK_COPIES

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(200,1),
	Name VARCHAR(30) NOT NULL,
	Address VARCHAR(30) NOT NULL,
	Phone VARCHAR(30) NOT NULL
);

INSERT INTO BORROWER
	(Name, Address, Phone)
	VALUES
	('John Smith', '6348 Sunny st', '545-665-7676'),
	('Mary Ann', '343 Morrison st', '542-650-8787'),
	('Paul Jones', '836 3rd ave', '454-878-8787'),
	('Sam Stevens', '4453 Main st', '344-980-5454'),
	('Julie Vu', '234 SW Brugger rd', '723-766-2332'),
	('Rita Ora', '767 Powell blvd', '878-767-6567'),
	('Samantha Jones', '878 Hollywood st', '343-767-2345'),
	('Dan Brown', '78 4th ave', '545-635-8823')
;

SELECT * FROM BORROWER

CREATE TABLE BOOK_LOANS(
	BookID INT NOT NULL CONSTRAINT fk_Book_I_D FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_Branch_ID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(1, 2, 200, '2019-12-05', '2019-12-26'),	
	(2, 2, 200, '2019-12-05', '2019-12-26'),	
	(3, 2, 200, '2019-12-05', '2019-12-26'),	
	(4, 2, 200, '2019-12-05', '2019-12-26'),	
	(5, 2, 200, '2019-12-05', '2019-12-26'),	
	(6, 2, 200, '2019-12-05', '2019-12-26'),	
	(7, 2, 200, '2019-12-05', '2019-12-26'),	
	(8, 2, 200, '2019-12-05', '2019-12-26'),	
	(9, 2, 200, '2019-12-05', '2019-12-26'),
	(10, 2, 200, '2019-12-05', '2019-12-26'),	
	(5, 2, 201, '2019-11-23', '2019-12-14'),	
	(6, 2, 201, '2019-11-23', '2019-12-14'),	
	(7, 2, 201, '2019-11-23', '2019-12-14'),	
	(8, 2, 201, '2019-11-23', '2019-12-14'),	
	(9, 2, 201, '2019-11-23', '2019-12-14'),
	(10, 2, 201, '2019-11-23', '2019-12-14'),	
	(1, 1, 202, '2019-11-25', '2019-12-16'),	
	(2, 1, 202, '2019-11-25', '2019-12-16'),	
	(3, 1, 202, '2019-11-25', '2019-12-16'),	
	(4, 1, 202, '2019-11-25', '2019-12-16'),	
	(5, 1, 202, '2019-11-25', '2019-12-16'),	
	(6, 1, 202, '2019-11-25', '2019-12-16'),	
	(7, 1, 202, '2019-11-25', '2019-12-16'),	
	(8, 1, 202, '2019-11-25', '2019-12-16'),	
	(9, 1, 202, '2019-11-25', '2019-12-16'),	
	(10, 1, 202, '2019-12-25', '2019-12-16'),	
	(11, 3, 204, '2019-12-03', '2019-12-24'),	
	(12, 3, 204, '2019-12-03', '2019-12-24'),	
	(13, 3, 204, '2019-12-03', '2019-12-24'),	
	(14, 3, 204, '2019-12-03', '2019-12-24'),	
	(15, 3, 204, '2019-12-03', '2019-12-24'),	
	(16, 3, 204, '2019-12-03', '2019-12-24'),	
	(17, 3, 204, '2019-12-03', '2019-12-24'),	
	(18, 3, 204, '2019-12-03', '2019-12-24'),	
	(19, 3, 204, '2019-12-03', '2019-12-24'),	
	(20, 3, 204, '2019-12-03', '2019-12-24'),	
	(11, 4, 205, '2019-12-05', '2019-12-26'),	
	(12, 4, 205, '2019-12-05', '2019-12-26'),	
	(13, 4, 205, '2019-12-05', '2019-12-26'),	
	(14, 4, 205, '2019-12-05', '2019-12-26'),	
	(15, 4, 205, '2019-12-05', '2019-12-26'),	
	(16, 4, 205, '2019-12-05', '2019-12-26'),	
	(17, 4, 205, '2019-12-05', '2019-12-26'),	
	(18, 4, 205, '2019-12-05', '2019-12-26'),	
	(19, 4, 205, '2019-12-05', '2019-12-26'),	
	(20, 4, 205, '2019-12-05', '2019-12-26'),
	(1, 1, 206, '2019-11-25', '2019-12-16'),	
	(3, 1, 206, '2019-11-25', '2019-12-16'),	
	(7, 1, 206, '2019-11-25', '2019-12-16'),	
	(8, 1, 206, '2019-11-25', '2019-12-16'),	
	(9, 1, 206, '2019-11-25', '2019-12-16'),	
	(12, 4, 207, '2019-11-20', '2019-12-11'),	
	(14, 4, 207, '2019-11-20', '2019-12-11'),	
	(16, 4, 207, '2019-11-20', '2019-12-11'),	
	(18, 4, 207, '2019-11-20', '2019-12-11')
;

SELECT * FROM BOOK_LOANS










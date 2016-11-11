/* Finding the number of copies based on a BookId in a named Library Branch */

SELECT No_Of_Copies FROM BOOK_COPIES
WHERE BookId = 1 
    AND BranchId IN (SELECT BranchId 
                     FROM library_branch
                     WHERE BranchName = 'Sharpstown');


/* Finding a total number of copies in every branch for a given book title */

 SELECT sum(No_Of_Copies) as 'Total Copies' FROM BOOK_COPIES 
            WHERE BookId in 
            (
            select BookId 
            from book where title like 
            '%The Great Gatsby%'
            )



/* Finding the total number of book copies in every unique branch */

select BranchName, Title, sum(No_Of_Copies) as NumberOfCopies
    from Library_Branch lb
    join Book_Copies bc
    on lb.BranchId = bc.BranchId
    join BOOK b
    on bc.BookId = b.BookId WHERE Title like '%The Great Gatsby%'
    group by lb.BranchName, b.Title


/* Retrieving total amount of copies from each branch */

select BranchName, sum(No_Of_Copies) as NumberOfCopies
    from Library_Branch lb
    join Book_Copies bc
    on lb.BranchId = bc.BranchId 
    group by lb.BranchName


/* Finding out how many book titles and copies of Author Name 'George Orwell' were in the Library Branch "Central" */

SELECT Title, sum(No_Of_Copies) as 'Total Copies'
FROM BOOK_COPIES bc
join BOOK_AUTHORS ba
on bc.BookId=ba.BookId
join BOOK b
on b.BookId=bc.BookId
join LIBRARY_BRANCH lb
on bc.BranchId=lb.BranchId where AuthorName='George Orwell' and BranchName='Central'
group by b.Title


/* Retrieving the book title, and Name and Address of Borrowers who have a book due today */

SELECT bk.Title, b.[Name], b.[Address], DueDate as 'Due Today'
FROM BORROWER b
join BOOK_LOANS bl
on b.CardNo=bl.CardNo
join LIBRARY_BRANCH lb
on lb.BranchId=bl.BranchId
join BOOK bk
on bk.BookId=bl.BookId where BranchName='Booksville' and DueDate='10-25-2016'


/* Retrieve the names of all borrowers who have not had any books checked out */

Select BORROWER.Name
FROM BORROWER
WHERE BORROWER.CardNo NOT IN 
               (SELECT CardNo  
			   FROM BOOK_LOANS)


/* Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. */

SELECT COUNT(BOOK_LOANS.CardNo) AS TotalBooks, BORROWER.Name, BORROWER.Address
FROM BOOK_LOANS
JOIN BORROWER
ON BORROWER.CardNo = BOOK_LOANS.CardNo
 
GROUP BY BORROWER.Name,BORROWER.Address
HAVING COUNT(BOOK_LOANS.CardNo) > 5

/* Procedure that allows the user to search for the amount of books and copies of a authur in a librarh branch. */

CREATE PROC GetTotalCopies @AuthorName varchar(100), @BranchName varchar(100)
AS
	SELECT Title, sum(No_Of_Copies) as 'Total Copies'
	FROM BOOK_COPIES bc
	join BOOK_AUTHORS ba
	on bc.BookId=ba.BookId
	join BOOK b
	on b.BookId=bc.BookId
	join LIBRARY_BRANCH lb
	on bc.BranchId=lb.BranchId where AuthorName=@AuthorName and BranchName=@BranchName
	group by b.Title, 

EXECUTE GetTotalCopies 'George Orwell', 'Central'

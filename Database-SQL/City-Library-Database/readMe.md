### City Library Drill
***

In this creation, I wanted to create a database that would allow multiple Library branches to keep track of books, titles, authors, 
book copies in each branch, borrowers, and book loans. I used SQL SERVER 2008 in order to do this.

In this database I created seven tables (BOOK, BOOK_AUTHORS, PUBLISHER, LIBRARY BRANCH, BOOK_COPIES, BOOK_LOANS, AND BORROWERS).
With this database you can keep track of books, loan history, and so on.

I also attached some queries I created for this database as well as a couple procedures which you can find in the seperate file upload 
named Queries/Procedures. 

One of the biggest challenges I faced with this database was creating a query that would retrieve how many book copies, listed by title, from Author George Orwell was in the 
Library Branch "Central".

I first came up with the following query: 

 SELECT sum(No_Of_Copies) as 'Total Copies' FROM BOOK_COPIES 
            WHERE BookId in 
            (
            select BookId
            from BOOK_AUTHORS where AuthorName like 
            '%George Orwell%'
            )

But this was only giving me the total number of copies for every branch combined from every book George Orwell had in the database.
This wasen't specific enough. I eventually figured out that if I link the tables by a common key (BookId) I could get a little more specifc:

SELECT sum(No_Of_Copies) as 'Total Copies' 
FROM BOOK_COPIES bc join BOOK_AUTHORS ba on bc.BookId=ba.BookId where AuthorName='George Orwell' and BranchId=2

Now I got the total number of copies of George Orwell books, but I still had two problems.
1.) I couldn't use the Library Branch Name "central", and instead had to use its BranchId.
2.)All book copies were still combined and not seperated by Titles.

Taking a minute to think about it I realized all I had to do was join more tables (Book and Library Branch) in order to get specifc.
I then came up with the following query:

SELECT sum(No_Of_Copies) as 'Total Copies'
FROM BOOK_COPIES bc
join BOOK_AUTHORS ba
on bc.BookId=ba.BookId
join BOOK b
on b.BookId=bc.BookId
join LIBRARY_BRANCH lb
on bc.BranchId=lb.BranchId where AuthorName='George Orwell' and BranchName='Central'
group by b.Title

Finally, I was abe to use the branch name "central" and see a distinciont in book titles and how many copies were present in the branch.
But copies were still not seperated by a Title field, so lastly, I realized I just had to put the Title in the SELECT statement as shown:


SELECT Title, sum(No_Of_Copies) as 'Total Copies'
FROM BOOK_COPIES bc
join BOOK_AUTHORS ba
on bc.BookId=ba.BookId
join BOOK b
on b.BookId=bc.BookId
join LIBRARY_BRANCH lb
on bc.BranchId=lb.BranchId where AuthorName='George Orwell' and BranchName='Central'
group by b.Title


One thing I realized when it comes to creating queries is that if you don't know where to start, you should just generaly start with a SELECT all 
statement for a join of two tables. From there you can add a table if needed or narrow your SELECT search. Lastly, you can see what needs
to be narrowed down, and add WHERE, HAVING, or GROUP BY clauses. 

Return to [portfolio](../../../../) 

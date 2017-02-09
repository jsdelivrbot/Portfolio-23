SQL Server Report Service for the following query in LibraryBranch database:

SELECT        lb.BranchName, b.Title, SUM(bc.No_Of_Copies) AS NumberOfCopies
FROM            LIBRARY_BRANCH AS lb INNER JOIN
                         BOOK_COPIES AS bc ON lb.BranchId = bc.BranchId INNER JOIN
                         BOOK AS b ON bc.BookId = b.BookId
WHERE        (b.Title LIKE '%The Great Gatsby%') OR
                         (b.Title LIKE '%Invisible Man')
GROUP BY lb.BranchName, b.Title




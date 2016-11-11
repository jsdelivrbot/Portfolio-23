USE MASTER
GO

--Drop the Library dB if it exists
IF EXISTS(SELECT NAME FROM master.dbo.sysdatabases
WHERE name = 'LibraryRentals')
DROP DATABASE LibraryRentals
GO

CREATE DATABASE LibraryRentals
GO

CREATE TABLE PUBLISHER
(
PublisherName varchar(100) NOT NULL,
[Address] varchar(100),
Phone varchar(20),
PRIMARY KEY (PublisherName)
);

CREATE TABLE BORROWER
(
CardNo varchar(20) NOT NULL,
[Name] varchar(100),
[Address] varchar(100),
Phone varchar(20),
PRIMARY KEY (CardNo)
);

CREATE TABLE LIBRARY_BRANCH
(
BranchId int NOT NULL,
BranchName varchar(100),
[Address] varchar(100),
PRIMARY KEY (BranchId)
);

CREATE TABLE BOOK
(
BookId int NOT NULL,
Title varchar(100),
PublisherName varchar(100),
PRIMARY KEY (BookId),
CONSTRAINT book1 FOREIGN KEY (PublisherName)
REFERENCES PUBLISHER(PublisherName)
);

CREATE TABLE BOOK_COPIES
(
BookId int,
BranchId int,
No_Of_Copies int,
CONSTRAINT book_copies1 FOREIGN KEY (BookId)
REFERENCES BOOK(BookId),
CONSTRAINT book_copies2 FOREIGN KEY (BranchId)
REFERENCES LIBRARY_BRANCH(BranchId)
);

CREATE TABLE BOOK_LOANS
(
BookId int,
BranchId int,
CardNo varchar(20),
DateOut date,
DueDate date,
CONSTRAINT book_loans1 FOREIGN KEY (BookId)
REFERENCES BOOK(BookId),
CONSTRAINT book_loans2 FOREIGN KEY (BranchId)
REFERENCES LIBRARY_BRANCH(BranchId),
CONSTRAINT book_loans3 FOREIGN KEY (CardNo)
REFERENCES BORROWER(CardNo)
);

CREATE TABLE BOOK_AUTHORS
(
BookId int,
AuthorName varchar(100),
CONSTRAINT book_authors1 FOREIGN KEY (BookId)
REFERENCES BOOK(BookId)
);

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES 
('Audible', 'One Washington Park, Newark, NJ', '(888) 283-5051');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('ABC Publishing', '298 Brewery Ave. Stuart, FL', '(856) 680-3713');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Scholastic Inc.', '106 Rockville Street West Fargo, ND', '(542) 955-3411');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('American Library Association', '9915 Talbot St. Pottstown, PA', '(214) 466-1610');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Arcadia Publishing', '161 N. Miles St. Palm Harbor, FL', '(785) 488-6482');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Avery Publishing', '176 Penn Street Muskogee, OK', '(754) 619-8034');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('August House', '71 Amerige St. Menasha, WI', '(545) 122-7097');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Alice James Books', '9 Amerige Ave. Hendersonville, NC', '(180) 734-3447');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Fairwood Press', '79 Spring Lane Troy, NY', '(186) 330-0459');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Four Winds Press', '611 North St. Tiffin, OH', '(539) 992-6122');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Galaxy Press', '7 Miller Ave. Williamsburg, VA', '(914) 516-4868');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Gold Medal Books', '97 Hickory Lane Powder Springs, GA', '(664) 505-9444');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Oxmoor House', '9303 North Ryan Lane Stoughton, MA', '(238) 267-7520');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Pacific Press Publishing Association', '670 Shadow Brook Ave. Clemmons, NC', '(738) 289-1994');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('New American Press', '643 Blue Spring Street Muskegon, MI', '(736) 713-0425');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Nightboat Books', '782 Kent Ave. Staten Island, NY', '(942) 408-4496');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('NewSouth Books', '3 Maple St. North Canton, OH', '(118) 156-7197');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Oyster River Press', '9850 North Birchwood Lane Dalton, GA', '(688) 424-8657');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Point Blank', '8520 East Ridgewood Drive Amarillo, TX', '(706) 829-3984');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Poseidon Press', '54 Garden Lane Deerfield Beach, FL', '(211) 465-3478');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Bancroft Press', '2 Adams St. Salem, MA', '(486) 707-8162');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Ingram Content Group', '21 North 6th St. Cuyahoga Falls, OH', '(206) 293-9328');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Sator Press', '717 Arch St. Lewis Center, OH', '(686) 813-0851');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Ramble House', '9272 Silver Spear Ave. Farmingdale, NY', '(663) 900-7524');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Chax Press', '470 Sherman Drive Freeport, NY', '(681) 336-5783');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('The Limestone Press', '9854 Circle St. Lake Charles, LA', '(913) 452-7993');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Urban Books', '269 Bayport Drive New Hyde Park, NY', '(648) 390-4653');





INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(1, 'The Great Gatsby', 'ABC Publishing');

INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(2, 'The Grapes of Wrath', 'Alice James Books');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(3, 'Nineteen Eighty-Four', 'American Library Association');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(4, 'Ulysses', 'Arcadia Publishing');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(5, 'Lolita', 'Audible');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(6, 'Catch-22', 'August House');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(7, 'The Catcher in the Rye', 'Avery Publishing');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(8, 'Beloved', 'Bancroft Press');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(9, 'The Sound and the Fury', 'Chax Press');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(10, 'To Kill a Mockingbird', 'Fairwood Press');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(11, 'The Lord of the Rings', 'Four Winds Press');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(12, 'One Hundred Years of Solitude', 'Galaxy Press');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(13, 'Brave New World', 'Gold Medal Books');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(14, 'To the Lighthouse', 'Ingram Content Group');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(15, 'Invisible Man', 'New American Press');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(16, 'Gone with the Wind', 'NewSouth Books');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(17, 'Jane Eyre', 'Nightboat Books');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(18, 'On the Road', 'Oxmoor House');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(19, 'Pride and Prejudice', 'Oyster River Press');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(20, 'Lord of the Flies', 'Pacific Press Publishing Association');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(21, 'Middlemarch', 'Point Blank');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(22, 'Anna Karenina', 'Poseidon Press');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(23, 'Animal Farm', 'Ramble House');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(24, 'A Passage to India', 'Sator Press');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(25, 'In Search of Lost Time', 'Scholastic Inc.');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(26, 'Wuthering Heights', 'The Limestone Press');


INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(27, 'The Chronicles of Narnia', 'Urban Books');




INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(1, 'F. Scott Fitzgerald');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(2, 'John Steinbeck');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(3, 'George Orwell');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(4, 'James Joyce');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(5, 'Vladimir Nabokov');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(6, 'Joseph Heller');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(7, 'J.D. Salinger');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(8, 'Toni Morrison');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(9, 'William Faulkner');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(10, 'Harper Lee');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(11, 'J.R.R. Tolkien');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(12, 'Gabriel Garcia Marquez');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(13, 'Aldous Huxley');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(14, 'Virginia Woolf');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(15, 'Ralph Ellison');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(16, 'Margaret Mitchell');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(17, 'Charlotte Bronte');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(18, 'Jack Kerouac');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(19, 'Jane Austen');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(20, 'William Golding');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(21, 'George Eliot');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(22, 'Leo Tolstoy');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(23, 'George Orwell');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(24, 'E.M. Forster');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(25, 'Marcel Proust');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(26, 'Emily Bronte');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(27, 'C.S. Lewis');




INSERT INTO LIBRARY_BRANCH
(BranchId, BranchName, [Address])
VALUES
(1, 'Sharpstown', '2224 Shattuck Ave Berkeley, CA');

INSERT INTO LIBRARY_BRANCH
(BranchId, BranchName, [Address])
VALUES
(2, 'Central', '138 S Central Ave Las Angeles, CA');

INSERT INTO LIBRARY_BRANCH
(BranchId, BranchName, [Address])
VALUES
(3, 'Got Books?', '1011 Market St San Diego, CA');

INSERT INTO LIBRARY_BRANCH
(BranchId, BranchName, [Address])
VALUES
(4, 'Booksville', '201 Powell St San Francisco, CA');




INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4532728354597044', 'Rex Bridges', '118 West Campfire Dr. Tustin, CA', '(925) 319-0394');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4916465200103877', 'Karon Lever', '422 Greenrose Court Baldwin Park, CA', '(412) 799-7199');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4545534154281861', 'Elfreda Schlenker', '8088 6th Court Davis, CA', '(208) 151-6552');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4916465050036300', 'Kasey Retzlaff', '966 Albany Drive Indio, CA', '(104) 741-4114');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4485468524284903', 'Venita Bergan', '74 Meadowbrook Dr. Paramount, CA', '(778) 869-3980');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5347377561757462', 'Elton Canino', '424 Piper Street Lompoc, CA', '(698) 284-1127');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5321693438333984', 'Paulette Lipinski', '30 Jefferson Street Spring Valley, CA', '(380) 367-8967');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5323110668936418', 'Rosy Eccleston', '58 Wintergreen Lane Los Angeles, CA', '(118) 797-1017');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5125703662806775', 'Kerstin Ridder', '7873 Rockland Dr. Los Angeles, CA', '(191) 436-1948');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5104207390307341', 'Roni Brault', '91 East Adams Lane Anaheim, CA', '(164) 812-9848');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('6011119338283973', 'Denice Herandez', '9029 Oxford Ave. Merced, CA', '(220) 905-2948');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('6011947660833217', 'Ranee Haff', '93 Charles Circle Garden Grove, CA', '(496) 319-0205');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('6011696381906824', 'Rikki Hurless', '536 N. Third Ave. Los Angeles, CA', '(172) 931-5156');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('6011765004029650', 'Trenton Ritenour', '887 W. County Ave. Fountain Valley, CA', '(251) 864-1057');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('6011271937732403', 'Reggie Thon', '8672 Purple Finch Street Garden Grove, CA', '(548) 396-7021');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('378429465074479', 'Adolfo Carder', '9223 Lakeshore Street San Marcos, CA', '(267) 388-5462');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('342188342581667', 'Saran Salzano', '410 Birchpond Street San Francisco, CA', '(928) 620-4363');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('374881414005034', 'Olive Thornley', '7463 West Cypress Lane Fresno, CA', '(870) 329-9259');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('344006647132978', 'Kevin Cottrill', '531 East Sugar Drive Lompoc, CA', '(787) 197-6707');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('340621768590830', 'Allan Mclaughin', '28 Belmont Drive Fountain Valley, CA', '(685) 949-9322');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4547139014396467', 'Elijah Ector', '5 North Gonzales Lane El Cajon, CA', '(323) 689-7892');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4532983763455579', 'Huong Lane', '16 Depot St. Riverside, CA', '(199) 632-7481');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4326233662584750', 'Ward Via', '5 Gartner Rd. Fremont, CA', '(213) 948-8586');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4929049858875450', 'Melani Smullen', '2 La Sierra Road Bakersfield, CA', '(490) 661-2503');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4309590210854089', 'Tabetha Leiker', '954 Columbia St. Simi Valley, CA', '(447) 667-6699');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5309869653075080', 'Jody Whittle', '27 Vermont Ave. Fontana, CA', '(811) 681-2947');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5266202979132131', 'Wonda Hazelip', '9949 Prairie Dr. Hacienda Heights, CA', '(797) 754-7821');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5524376348593575', 'Eartha Hadlock', '216 North Bear Hill Rd. Reseda, CA', '(144) 611-1375');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5597373299347616', 'Wallace Broadwell', '9076 Marlborough Dr. Rosemead, CA', '(823) 917-1989');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5394413709431512', 'Dale Salerno', '8935 E. Henry Smith Street Alhambra, CA', '(851) 290-4305');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('6011467502270478', 'Johnny Hering', '477 North Court Road Fremont, CA', '(808) 638-4963');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('6011501272191314', 'Britta Shead', '246 N. 2nd Dr. Huntington Beach, CA', '(466) 880-9122');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('6011401470686985', 'Arianne Mcgirt', '651 Arch Ave. San Francisco, CA', '(932) 418-6360');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('6011463208691232', 'Lucie Mullinix', '655 Peninsula Rd. San Pablo, CA', '(205) 840-6470');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('6011656496685432', 'Ross Perugini', '56 Littleton Drive Fresno, CA', '(265) 923-9156');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('345240136179526', 'Alissa Exley', '8600 Wagon Street Huntington Beach, CA', '(146) 527-5874');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('376491538364768', 'Karisa Catlin', '687 East Longbranch Drive Van Nuys, CA', '(203) 557-1085');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('343435016619730', 'Angelica Dyal', '30 Morris St. Indio, CA', '(508) 873-2929');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('375180250632830', 'Todd Whitacre', '550 Carriage St. Pittsburg, CA', '(150) 364-2549');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('344506296847149', 'Alise Ewen', '830 Stillwater Drive El Cajon, CA', '(521) 666-2835');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4539948125003055', 'Clayton Dan', '6 Ann Ave. Livermore, CA', '(772) 750-9320');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4556049984832961', 'Korey Doria', '62 Windfall Ave. Rosemead, CA', '(288) 674-1196');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4716560476176078', 'Valentine Cutright', '11 Gainsway Dr. Bellflower, CA', '(437) 361-5862');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4649356080166668', 'Yuette Khan', '7077 Birchpond St. Vista, CA', '(302) 536-9219');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('4485684430230604', 'Margeret Depuy', '9637 Rockwell Dr. Fresno, CA', '(483) 471-5743');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5216040310612622', 'Shawnee Whitson', '274 Anderson Ave. Santee, CA', '(119) 164-3641');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5479227961367653', 'Claudette Trujillo', '7069 Oak Dr. Huntington Beach, CA', '(298) 439-0387');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5453459431575298', 'Tabatha Mchale', '9106 Warren Road San Bernardino, CA', '(186) 785-6345');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5397270262193419', 'Jame Yin', '417 San Carlos Street Rancho Cucamonga, CA', '(263) 767-0981');

INSERT INTO BORROWER
(CardNo, [Name], [Address], Phone)
VALUES
('5193427579140758', 'Alfonso Lady', '818 Maiden Dr. Los Angeles, CA', '(521) 607-2940');





INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(1, 1, '340621768590830', '01-08-2014', '01-16-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(2, 1, '340621768590830', '01-08-2014', '01-16-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(3, 1, '340621768590830', '01-08-2014', '01-16-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(4, 1, '340621768590830', '01-08-2014', '01-16-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(5, 1, '340621768590830', '01-08-2014', '01-16-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(6, 1, '340621768590830', '01-08-2014', '01-16-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(7, 1, '342188342581667', '01-03-2014', '01-10-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(8, 1, '342188342581667', '01-03-2014', '01-10-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(9, 1, '342188342581667', '01-03-2014', '01-10-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(10, 1, '342188342581667', '01-03-2014', '01-10-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(11, 1, '342188342581667', '01-03-2014', '01-10-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(12, 1, '342188342581667', '01-03-2014', '01-10-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(13, 1, '343435016619730', '01-01-2014', '01-09-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(13, 2, '344006647132978', '01-20-2014', '01-29-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(14, 2, '344506296847149', '01-16-2014', '01-23-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(15, 2, '345240136179526', '01-19-2014', '01-27-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(16, 2, '374881414005034', '01-09-2014', '01-17-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(17, 2, '375180250632830', '01-09-2014', '01-10-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(18, 2, '376491538364768', '01-26-2014', '01-30-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(19, 2, '378429465074479', '01-02-2014', '01-10-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(20, 2, '4309590210854089', '02-02-2014', '02-11-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(21, 2, '4326233662584750', '02-05-2014', '02-15-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(22, 2, '4485468524284903', '02-20-2014', '02-27-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(23, 2, '4485684430230604', '02-15-2014', '02-22-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(24, 2, '4532728354597044', '02-01-2014', '02-09-2014');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(25, 2, '4532983763455579', '02-9-2014', '02-16-2014');


INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(23, 3, '4539948125003055', '10-01-2016', '10-10-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(24, 3, '4545534154281861', '10-03-2016', '10-14-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(25, 3, '4547139014396467', '10-05-2016', '10-09-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(1, 3, '4556049984832961', '10-14-2016', '10-22-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(2, 3, '4649356080166668', '10-10-2016', '10-18-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(3, 3, '4716560476176078', '10-03-2016', '10-7-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(4, 3, '4916465050036300', '10-01-2016', '10-09-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(5, 3, '4916465200103877', '10-06-2016', '10-14-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(6, 3, '4929049858875450', '10-18-2016', '10-24-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(7, 3, '5104207390307341', '10-16-2016', '10-22-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(3, 4, '5125703662806775', '10-02-2016', '10-09-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(4, 4, '5193427579140758', '10-08-2016', '10-15-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(6, 4, '5216040310612622', '10-15-2016', '10-22-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(8, 4, '5266202979132131', '10-20-16', '10-25-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(9, 4, '5309869653075080', '10-16-2016', '10-20-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(11, 4, '5321693438333984', '10-11-2016', '10-22-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(14, 4, '5323110668936418', '10-03-2016', '10-11-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(17 ,4, '5347377561757462', '10-06-2016', '10-13-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(20, 4, '5394413709431512', '10-01-2016', '10-19-2016');

INSERT INTO BOOK_LOANS
(BookId, BranchId, CardNo, DateOut, DueDate)
VALUES
(22, 4, '5397270262193419', '10-19-2016', '10-25-2016');





INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(1, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(2, 1, 7);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(3, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(4, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(5, 1, 8);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(6, 1, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(7, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(8, 1, 7);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(9, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(10, 1, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(11, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(12, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(13, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(14, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(15, 1, 8);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(16, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(17, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(18, 1, 8);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(19, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(20, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(21, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(22, 1, 7);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(23, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(24, 1, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(25, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(26, 1, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(27, 1, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(1, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(2, 2, 7);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(3, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(4, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(5, 2, 8);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(6, 2, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(7, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(8, 2, 7);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(9, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(10, 2, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(11, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(12, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(13, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(14, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(15, 2, 8);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(16, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(17, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(18, 2, 8);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(19, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(20, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(21, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(22, 2, 7);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(23, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(24, 2, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(25, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(26, 2, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(27, 2, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(1, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(2, 3, 7);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(3, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(4, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(5, 3, 8);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(6, 3, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(7, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(8, 3, 7);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(9, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(10, 3, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(11, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(12, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(13, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(14, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(15, 3, 8);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(16, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(17, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(18, 3, 8);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(19, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(20, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(21, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(22, 3, 7);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(23, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(24, 3, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(25, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(26, 3, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(27, 3, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(1, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(2, 4, 7);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(3, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(4, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(5, 4, 8);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(6, 4, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(7, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(8, 4, 7);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(9, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(10, 4, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(11, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(12, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(13, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(14, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(15, 4, 8);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(16, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(17, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(18, 4, 8);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(19, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(20, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(21, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(22, 4, 7);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(23, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(24, 4, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(25, 4, 6);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(26, 4, 9);

INSERT INTO BOOK_COPIES
(BookId, BranchId, No_Of_Copies)
VALUES
(27, 4, 6);

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Rowling Books', '858 Glen Ridge Rd. North Miami Beach, FL', '(292) 332-5531');

INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(28, 'The Lost Tribe', 'Rowling Books');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(28, 'Mike Lee');

INSERT INTO PUBLISHER
(PublisherName, [Address], Phone)
VALUES
('Cypress House', '944 Elm Lane Groton, CT', '(451) 897-6742');

INSERT INTO BOOK
(BookId, Title, PublisherName)
VALUES
(29, 'The Mist', 'Cypress House');

INSERT INTO BOOK_AUTHORS
(BookId, AuthorName)
VALUES
(29, 'Stephen King');

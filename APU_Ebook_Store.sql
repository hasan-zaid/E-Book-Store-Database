create database APU_Ebook_Store

use APU_Ebook_Store;

create table Publishers (
Publisher_ID nvarchar(50) primary key,
Publisher_Name nvarchar(50) not null,
Contact_Number nvarchar(20) not null,
Email_Address nvarchar(50) not null);

insert into Publishers Values
('PU001', 'Tom Watson', '0192344738', 'tomwatson@yahoo.com'),
('PU002', 'Duncan James', '018654435', 'duncanjames@yahoo.com'),
('PU003', 'Jackson Kaden', '0193222324', 'jacksonkaden@yahoo.com'),
('PU004', 'Nour Sally', '019278785', 'noursally@yahoo.com'),
('PU005', 'Mohammad Ali', '0192387711', 'mohammadali@yahoo.com'),
('PU006', 'Yahya Saleh', '014567666', 'yahyasaleh@yahoo.com'),
('PU007', 'Maryam Amer', '0192322111', 'maryamamer@yahoo.com');

create table Books (
Book_ID nvarchar(50) primary key,
Book_Name nvarchar(50) not null,
Author nvarchar(50) not null,
Genre nvarchar(50) not null,
Price decimal(6,2) not null,
Date_Acquired date not null,
Stock int not null);

insert into Books values
('BO001', 'The Nine Tails', 'Naruto Sasuke', 'Action', 150, '15 July 2020', 250),
('BO002', 'The Sunset', 'Faroq Hadi', 'Romance', 70, '10 May 2021', 300),
('BO003', 'Let Me Do It', 'John Weak', 'Comedy', 300, '03 April 2022', 100),
('BO004', 'The Escape', 'Quandale Windle', 'Science Fiction', 89.99, '22 January 2020', 50),
('BO005', 'Where Is It', 'Osama Watkins', 'Puzzle', 800, '30 March 2022', 1000),
('BO006', 'Let Him Go', 'Speed Super', 'Action', 50, '01 April 2022', 800),
('BO007', 'The World We Live In', 'Dan Tom', 'Science', 120, '28 May 2022', 550);

create table Members (
Member_No nvarchar(50) primary key,
Member_Name nvarchar(50) not null,
Email_Address nvarchar(50) not null,
Mailing_Address nvarchar(200) not null,
Account_Password nvarchar(50) not null);

insert into Members values
('ME001', 'Hasan Akram', 'hasan@gmail.com', 'Kuala Lumpur, Malaysia', '1234qwer'),
('ME002', 'Bailey', 'bailey@gmail.com', 'New York City, USA', '4321rewq'),
('ME003', 'Rueben', 'rueben@gmail.com', 'Lodon, UK', 'rewq4321'),
('ME004', 'Ahmed Sami', 'ahmed@gmail.com', 'Sanaa, Yemen', '890poi'),
('ME005', 'Steven Joseph', 'steven@gmail.com', 'Abu Dhabi, UAE', 'dfaef4344'),
('ME006', 'Maison', 'maison@gmail.com', 'Jeddah, KSA', 'KLOW@(@&*&#'),
('ME007', 'Sarah', 'sarah@gmail.com', 'Cairo, Egypt', 'W(*KHSUHHH');

create  table Member_Orders(
Member_Order_No nvarchar(50) primary key,
Member_No nvarchar(50) foreign key references Members(Member_No),
Order_Date date not null,
Total_Price decimal(8, 2),
Payment_Confirmation bit not null);

insert into Member_Orders values
('MO001', 'ME003', '03 April 2022',300, 1 ),
('MO002', 'ME002', '13 May 2021',21450 , 0),
('MO003', 'ME002', '22 January 2021',600 , 0),
('MO004', 'ME001', '20 March 2022',1800 , 1),
('MO005', 'ME005', '01 June 2022',1500 , 0),
('MO006', 'ME007', '02 June 2022',7000 , 0),
('MO007', 'ME006', '07 June 2022',3500 , 1),
('MO008', 'ME002', '12 June 2022',500 , 1);

create table Deliveries(
Delivery_ID nvarchar(50) primary key,
Date_of_Delivery date,
Delivery_Status nvarchar(50) not null,
Member_Order_No nvarchar(50) foreign key references Member_Orders(Member_Order_No) not null);

insert into Deliveries values
('DE001', '25 January 2021', 'Delivered', 'MO003'),
('DE002', NULL, 'Not Delivered', 'MO005'),
('DE003', '01 April 2021', 'Delivered', 'MO002'),
('DE004', '13 April 2022', 'Delivered', 'MO001'),
('DE005', NULL, 'Not Delivered', 'MO004'),
('DE006', NULL, 'Not Delivered', 'MO007'),
('DE007', '10 June 2022', 'Delivered', 'MO006');

create table Reviews_and_Ratings(
ID nvarchar(50) primary key,
Book_ID nvarchar(50) foreign key references Books(Book_ID),
Review_Date date not null,
Review nvarchar(500),
Member_No nvarchar(50) foreign key references Members(Member_No),
Rating_Value int);

insert into Reviews_and_Ratings values
('RR001', 'BO001', '23 March 2022', NULL, 'ME001', 8),
('RR002', 'BO002', '20 April 2022', 'This book is among the most effective books I have ever read', 'ME001', 5),
('RR003', 'BO003', '10 January 2022', NULL, 'ME005', 10),
('RR004', 'BO001', '23 March 2022', 'Definitley going to recommdned for everyone', 'ME004', 8),
('RR005', 'BO005', '27 August 2021', 'I was disappointed by the quality of this book', 'ME002', 2),
('RR006', 'BO006', '22 May 2022', NULL, 'ME007', 4),
('RR007', 'BO007', '11 June 2022', 'This book literally changed my life', 'ME006', 10);

create table Books_Orders_From_Publishers(
Order_No nvarchar(50) primary key,
Book_ID nvarchar(50) foreign key references Books(Book_ID),
Quantity int not null,
Publisher_ID nvarchar(50) foreign key references Publishers(Publisher_ID));

insert into Books_Orders_From_Publishers values
('MO001', 'BO001', 300, 'PU004'),
('MO002', 'BO004', 80, 'PU001'),
('MO003', 'BO005', 1200, 'PU001'),
('MO004', 'BO002', 400, 'PU005'),
('MO005', 'BO003', 150, 'PU003'),
('MO006', 'BO001', 150, 'PU002'),
('MO007', 'BO006', 150, 'PU002'),
('MO008', 'BO006', 150, 'PU007');

create table The_Orders(
Book_ID nvarchar(50) foreign key references Books(Book_ID),
Member_Order_No nvarchar(50) foreign key references Member_Orders(Member_Order_No),
Quantity int not null,
Total decimal(8, 2)
constraint PK_The_Orders primary key (Book_ID, Member_Order_No));

insert into The_Orders values
('BO001', 'MO002', 1, 250),
('BO002', 'MO002', 4, 1200),
('BO005', 'MO002', 20, 20000),
('BO002', 'MO005', 5, 1500),
('BO001', 'MO004', 4, 1000),
('BO003', 'MO004', 8, 800),
('BO004', 'MO003', 12, 600),
('BO003', 'MO001', 3, 300),
('BO005', 'MO006', 7, 7000),
('BO001', 'MO008', 2, 500),
('BO001', 'MO007', 14, 3500);



--MS3 DBS
-- Creation Script

--Dropping Table Due To Same Table Names.

DROP TABLE Users CASCADE CONSTRAINTS;
DROP TABLE Products CASCADE CONSTRAINTS;
DROP TABLE Orders CASCADE CONSTRAINTS;
DROP TABLE OrderDetails CASCADE CONSTRAINTS;
DROP TABLE ShoppingCarts CASCADE CONSTRAINTS;
DROP TABLE CartItems CASCADE CONSTRAINTS;
DROP TABLE Ratings CASCADE CONSTRAINTS;
DROP TABLE Interactions CASCADE CONSTRAINTS;

-- Creating New Tables.

CREATE TABLE Users (
    UserID NUMBER(38) PRIMARY KEY,
    Name VARCHAR2(255) NOT NULL,
    Email VARCHAR2(255) NOT NULL UNIQUE,
    Password VARCHAR2(255) NOT NULL,
    ProfileType VARCHAR2(50),
    RegistrationDate DATE NOT NULL
);

CREATE TABLE Products (
    ProductID NUMBER(38) PRIMARY KEY,
    Name VARCHAR2(255) NOT NULL,
    Description CLOB,
    Price NUMBER(10, 2) NOT NULL,
    StockLevel NUMBER(38) NOT NULL,
    Category VARCHAR2(255),
    Rating NUMBER(2, 1)
);

CREATE TABLE Orders (
    OrderID NUMBER(38) PRIMARY KEY,
    UserID NUMBER(38),
    OrderDate DATE NOT NULL,
    TotalAmount NUMBER(10, 2) NOT NULL,
    Status VARCHAR2(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE OrderDetails (
    OrderDetailID NUMBER(38) PRIMARY KEY,
    OrderID NUMBER(38),
    ProductID NUMBER(38),
    Quantity NUMBER(38) NOT NULL,
    Price NUMBER(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ShoppingCarts (
    CartID NUMBER(38) PRIMARY KEY,
    UserID NUMBER(38) UNIQUE,
    CreatedDate DATE NOT NULL,
    Status VARCHAR2(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE CartItems (
    CartItemID NUMBER(38) PRIMARY KEY,
    CartID NUMBER(38),
    ProductID NUMBER(38),
    Quantity NUMBER(38) NOT NULL,
    DateAdded DATE NOT NULL,
    FOREIGN KEY (CartID) REFERENCES ShoppingCarts(CartID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Ratings (
    RatingID NUMBER(38) PRIMARY KEY,
    ProductID NUMBER(38),
    UserID NUMBER(38),
    RatingValue NUMBER(2, 1) NOT NULL,
    Review CLOB, 
    RatingDate DATE NOT NULL, 
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Interactions (
    InteractionID NUMBER(38) PRIMARY KEY,
    UserID NUMBER(38),
    ProductID NUMBER(38),
    InteractionType VARCHAR2(50) NOT NULL,
    InteractionDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


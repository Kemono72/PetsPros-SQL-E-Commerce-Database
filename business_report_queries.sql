--Business Report--

-- View: User Purchase History
-- Purpose: This view provides a comprehensive report of each user's purchase history, including the total amount spent and the number of orders placed.
-- This report helps the business understand customer behavior, identify high-value customers, and tailor marketing strategies accordingly.

CREATE VIEW UserPurchaseHistory AS
SELECT 
    U.UserID, 
    U.Name, 
    COUNT(O.OrderID) AS NumberOfOrders, 
    SUM(O.TotalAmount) AS TotalSpent
FROM 
    Users U
JOIN 
    Orders O ON U.UserID = O.UserID
GROUP BY 
    U.UserID, U.Name;

SELECT * FROM UserPurchaseHistory;

-- View: Product Sales Summary
-- Purpose: This view summarizes the sales performance of each product, including the total quantity sold and the total revenue generated.
-- This report helps the business identify best-selling products and make informed decisions on inventory management and promotional strategies.

CREATE VIEW ProductSalesSummary AS
SELECT 
    P.ProductID, 
    P.Name, 
    SUM(OD.Quantity) AS TotalQuantitySold, 
    SUM(OD.Quantity * OD.Price) AS TotalRevenue
FROM 
    Products P
JOIN 
    OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY 
    P.ProductID, P.Name;

SELECT * FROM ProductSalesSummary;

-- View: Monthly Revenue Report
-- Purpose: This view provides a monthly breakdown of total revenue generated from orders.
-- This report assists the business in analyzing sales trends over time, identifying peak sales periods, and making data-driven decisions for future planning and budgeting.

CREATE VIEW MonthlyRevenueReport AS
SELECT 
    TO_CHAR(O.OrderDate, 'YYYY-MM') AS Month, 
    SUM(O.TotalAmount) AS TotalRevenue
FROM 
    Orders O
GROUP BY 
    TO_CHAR(O.OrderDate, 'YYYY-MM');
    
SELECT * FROM MonthlyRevenueReport;

-- View: Customer Feedback Summary
-- Purpose: This view compiles customer feedback on products, including the average rating and the number of ratings received for each product.
-- This report helps the business gauge customer satisfaction, identify areas for improvement, and enhance product offerings based on customer preferences.

CREATE VIEW CustomerFeedbackSummary AS
SELECT 
    P.ProductID, 
    P.Name, 
    AVG(R.RatingValue) AS AverageRating, 
    COUNT(R.RatingID) AS NumberOfRatings
FROM 
    Products P
JOIN 
    Ratings R ON P.ProductID = R.ProductID
GROUP BY 
    P.ProductID, P.Name;
    
SELECT * FROM CustomerFeedbackSummary;

select * from ratings where productid=9;
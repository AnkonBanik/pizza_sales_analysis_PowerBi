-- retrive the total number of order placed

use pizzahut;
SELECT 
    COUNT(order_id) AS Total_Orders
FROM
    orders;
use pizzahut;
SELECT 
    SUM(order_details.quantity) AS Total_Pizza_Sold
FROM
    order_details;
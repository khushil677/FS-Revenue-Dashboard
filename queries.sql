USE fs_toronto;

USE fs_toronto;

CREATE TABLE bookings (
    Booking_ID VARCHAR(10),
    Check_In_Date DATE,
    Check_Out_Date DATE,
    Length_of_Stay INT,
    Room_Type VARCHAR(30),
    Room_Rate DECIMAL(10,2),
    Total_Revenue DECIMAL(10,2),
    Segment VARCHAR(20),
    Booking_Channel VARCHAR(20),
    Lead_Time_Days INT,
    Nationality VARCHAR(20),
    Rooms_Available INT,
    Rooms_Occupied INT,
    Repeat_Guest VARCHAR(5)
);

SELECT * FROM BOOKINGS LIMIT 10;

-- Query 1: Total Revenue, ADR and RevPAR
SELECT 
    COUNT(*) AS Total_Bookings,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    ROUND(AVG(Room_Rate), 2) AS ADR,
    ROUND(AVG(Rooms_Occupied) / AVG(Rooms_Available), 4) AS Occupancy_Rate,
    ROUND(AVG(Room_Rate) * (AVG(Rooms_Occupied) / AVG(Rooms_Available)), 2) AS RevPAR
FROM bookings;

-- Query 2: Revenue by Guest Segment
SELECT 
    Segment,
    COUNT(*) AS Total_Bookings,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    ROUND(AVG(Room_Rate), 2) AS ADR,
    ROUND(AVG(Length_of_Stay), 1) AS Avg_Stay
FROM bookings
GROUP BY Segment
ORDER BY Total_Revenue DESC;

-- Query 3: Revenue by Booking Channel
SELECT 
    Booking_Channel,
    COUNT(*) AS Total_Bookings,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    ROUND(AVG(Room_Rate), 2) AS ADR,
    ROUND((COUNT(*) / 90) * 100, 1) AS Booking_Share_Pct
FROM bookings
GROUP BY Booking_Channel
ORDER BY Total_Revenue DESC;

-- Query 4: Monthly Revenue Trend
SELECT 
    MONTH(Check_In_Date) AS Month_Number,
    MONTHNAME(Check_In_Date) AS Month_Name,
    COUNT(*) AS Total_Bookings,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    ROUND(AVG(Room_Rate), 2) AS ADR,
    ROUND(AVG(Rooms_Occupied) / AVG(Rooms_Available) * 100, 1) AS Occupancy_Pct
FROM bookings
GROUP BY MONTH(Check_In_Date), MONTHNAME(Check_In_Date)
ORDER BY Month_Number;

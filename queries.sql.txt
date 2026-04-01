-- Phase 3: FS Toronto Revenue Database
-- Created by: Khushil Varsani

CREATE DATABASE fs_toronto;
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
```
```

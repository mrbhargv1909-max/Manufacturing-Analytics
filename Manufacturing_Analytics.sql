create database manufacturing;

USE manufacturing;

CREATE TABLE fact_Production (
    Doc_Num VARCHAR(50),
    Date_FK DATE,
    Buyer_ID INT,
    Customer_Code VARCHAR(50),
    Employee_Code VARCHAR(50),
    Machine_Code VARCHAR(50),
    Operation_Code VARCHAR(50),
    Dept_ID INT,
    Item_Code VARCHAR(50),
    Delivery_Status VARCHAR(50),
    Is_Repeat_Order VARCHAR(20),
    WO_Qty DECIMAL(18,2),
    Press_Qty DECIMAL(18,2),
    Processed_Qty DECIMAL(18,2),
    Produced_Qty DECIMAL(18,2),
    Rejected_Qty DECIMAL(18,2),
    Today_Manufactured_Qty DECIMAL(18,2),
    Total_Qty DECIMAL(18,2),
    Total_Value DECIMAL(18,2),
    Per_Day_Machine_Cost DECIMAL(18,2),
    Rejection_Rate_Pct DECIMAL(10,2),
    Efficiency_Rate_Pct DECIMAL(10,2),
    Machine_Utilization_Pct DECIMAL(10,2),
    Cost_per_Unit DECIMAL(18,2)
);
show tables;
DESCRIBE fact_Production;
select * from fact_Production;

CREATE TABLE dim_Buyer (
    Buyer_ID VARCHAR(50),
    Buyer_Name VARCHAR(255),
    Region VARCHAR(100),
    Founded_Year INT,
    Segment VARCHAR(100)
);
DESCRIBE dim_Buyer;
select * from dim_Buyer;



CREATE TABLE dim_Customer (
    Customer_Code VARCHAR(50),
    Customer_Name VARCHAR(255),
    Customer_Type VARCHAR(100),
    City VARCHAR(100),
    Active VARCHAR(20)
);
describe dim_Customer;



CREATE TABLE dim_Employee (
    Employee_Code VARCHAR(50),
    Employee_Name VARCHAR(255),
    Department VARCHAR(100),
    Level  VARCHAR(50)
);



CREATE TABLE dim_Operation (
    Operation_Code VARCHAR(50),
    Operation_Name VARCHAR(255),
    Standard_Cost_Per_Hour DECIMAL(18,2),
    Is_Automated  VARCHAR(20)
);



CREATE TABLE dim_Machine (
    Machine_Code VARCHAR(50),
    Operation_Code VARCHAR(50),
    Operation_Name VARCHAR(255),
    Avg_Daily_Cost DECIMAL(18,2),
    Machine_Type VARCHAR(100),
    Status VARCHAR(20)
);



CREATE TABLE dim_Department (
    Dept_ID VARCHAR(50),
    Dept_Name VARCHAR(255),
    Category VARCHAR(100),
    Head_Count_Range VARCHAR(50),
    Floor VARCHAR(50)
);



CREATE TABLE dim_Item (
    Item_Code VARCHAR(50),
    Item_Name VARCHAR(255),
    Department_Name VARCHAR(255),
    Item_Category VARCHAR(100)
);




CREATE TABLE dim_Date (
    `Date` DATE,
    `Day` INT,
    Day_Name VARCHAR(20),
    Week_Num INT,
    Month_Num INT,
    Month_Name VARCHAR(20),
    `Quarter` VARCHAR(10),
    `Year` INT,
    Is_Weekend VARCHAR(10),
    Season VARCHAR(30)
);
DESCRIBE dim_Date;
select count(*) as total_rows from dim_Customer;
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;



USE manufacturing;

SELECT COUNT(*) AS Row_Count
FROM dim_Customer;

SELECT COUNT(*) AS Row_Count
FROM dim_Buyer;

SELECT COUNT(*) AS Row_Count
FROM dim_Date;

SELECT COUNT(*) AS Row_Count
FROM dim_Department;

SELECT COUNT(*) AS Row_Count
FROM dim_Employee;

SELECT COUNT(*) AS Row_Count
FROM dim_Item;

SELECT COUNT(*) AS Row_Count
FROM dim_machine;

SELECT COUNT(*) AS Row_Count
FROM dim_operation;

SELECT COUNT(*) AS Row_Count
FROM fact_production;

select * from fact_production;

# checking duplicates for dim department
SELECT Dept_ID, COUNT(*) AS count
FROM dim_Department
GROUP BY Dept_ID
HAVING COUNT(*) > 1;

 # checking nulls dim_department
SELECT
    SUM(Dept_ID IS NULL) AS Dept_ID_Null,
    SUM(Dept_Name IS NULL) AS Dept_Name_Null,
    SUM(Category IS NULL) AS Category_Null,
    SUM(Head_Count_Range IS NULL) AS Head_Count_Range_Null,
    SUM(Floor IS NULL) AS Floor_Null
FROM dim_Department;

#Check for blank/empty text values dim department
SELECT
    SUM(TRIM(Dept_Name) = '') AS Blank_Dept_Name,
    SUM(TRIM(Category) = '') AS Blank_Category,
    SUM(TRIM(Head_Count_Range) = '') AS Blank_Head_Count_Range,
    SUM(TRIM(Floor) = '') AS Blank_Floor
FROM dim_Department;

#for dim_Buyer — Check duplicate Buyer IDs
SELECT Buyer_ID, COUNT(*) AS count
FROM dim_Buyer
GROUP BY Buyer_ID
HAVING COUNT(*) > 1;

# check nulls 
SELECT
    SUM(Buyer_ID IS NULL) AS Buyer_ID_Null,
    SUM(Buyer_Name IS NULL) AS Buyer_Name_Null,
    SUM(Region IS NULL) AS Region_Null,
    SUM(Founded_Year IS NULL) AS Founded_Year_Null,
    SUM(Segment IS NULL) AS Segment_Null
FROM dim_Buyer;
 # check blanks
 SELECT
    SUM(TRIM(Buyer_ID) = '') AS Blank_Buyer_ID,
    SUM(TRIM(Buyer_Name) = '') AS Blank_Buyer_Name,
    SUM(TRIM(Region) = '') AS Blank_Region,
    SUM(TRIM(Segment) = '') AS Blank_Segment
FROM dim_Buyer;
SELECT
    MIN(Founded_Year) AS Earliest_Year,
    MAX(Founded_Year) AS Latest_Year,
    SUM(Founded_Year < 1800) AS Years_Before_1800,
    SUM(Founded_Year > 2026) AS Years_After_2026
FROM dim_Buyer;

DESCRIBE dim_Customer;

# check duplicates

SELECT Customer_Code, COUNT(*) AS count
FROM dim_Customer
GROUP BY Customer_Code
HAVING COUNT(*) > 1;

# check nulls 
SELECT
    SUM(Customer_Code IS NULL) AS Customer_Code_Null,
    SUM(Customer_Name IS NULL) AS Customer_Name_Null,
    SUM(Customer_Type IS NULL) AS Customer_Type_Null,
    SUM(City IS NULL) AS City_Null,
    SUM(Active IS NULL) AS Active_Null
FROM dim_Customer;

# check blanks
SELECT
    SUM(TRIM(Customer_Code) = '') AS Blank_Customer_Code,
    SUM(TRIM(Customer_Name) = '') AS Blank_Customer_Name,
    SUM(TRIM(Customer_Type) = '') AS Blank_Customer_Type,
    SUM(TRIM(City) = '') AS Blank_City,
    SUM(TRIM(Active) = '') AS Blank_Active
FROM dim_Customer;

# check active values 
SELECT Active, COUNT(*) AS count
FROM dim_Customer
GROUP BY Active;

DESCRIBE dim_Employee;

SELECT Employee_Code, COUNT(*) AS count
FROM dim_Employee
GROUP BY Employee_Code
HAVING COUNT(*) > 1;


SELECT
    SUM(Employee_Code IS NULL) AS Employee_Code_Null,
    SUM(Employee_Name IS NULL) AS Employee_Name_Null,
    SUM(Department IS NULL) AS Department_Null,
    SUM(`Level` IS NULL) AS Level_Null
FROM dim_Employee;

SELECT
    SUM(TRIM(Employee_Code) = '') AS Blank_Employee_Code,
    SUM(TRIM(Employee_Name) = '') AS Blank_Employee_Name,
    SUM(TRIM(Department) = '') AS Blank_Department,
    SUM(TRIM(`Level`) = '') AS Blank_Level
FROM dim_Employee;
# check department values
SELECT Department, COUNT(*) AS count
FROM dim_Employee
GROUP BY Department
ORDER BY Department;
# check level values 
SELECT `Level`, COUNT(*) AS count
FROM dim_Employee
GROUP BY `Level`
ORDER BY `Level`;

DESCRIBE dim_Operation;

SELECT Operation_Code, COUNT(*) AS count
FROM dim_Operation
GROUP BY Operation_Code
HAVING COUNT(*) > 1;

SELECT
    SUM(Operation_Code IS NULL) AS Operation_Code_Null,
    SUM(Operation_Name IS NULL) AS Operation_Name_Null,
    SUM(Standard_Cost_Per_Hour IS NULL) AS Cost_Null,
    SUM(Is_Automated IS NULL) AS Is_Automated_Null
FROM dim_Operation;

SELECT
    SUM(TRIM(Operation_Code) = '') AS Blank_Operation_Code,
    SUM(TRIM(Operation_Name) = '') AS Blank_Operation_Name,
    SUM(TRIM(Is_Automated) = '') AS Blank_Is_Automated
FROM dim_Operation;

# check automatic values 
SELECT Is_Automated, COUNT(*) AS count
FROM dim_Operation
GROUP BY Is_Automated;
# check operation cost
SELECT
    MIN(Standard_Cost_Per_Hour) AS Min_Cost,
    MAX(Standard_Cost_Per_Hour) AS Max_Cost,
    SUM(Standard_Cost_Per_Hour < 0) AS Negative_Costs
FROM dim_Operation;

DESCRIBE dim_Machine;

SELECT Machine_Code, COUNT(*) AS Count
FROM dim_Machine
GROUP BY Machine_Code
HAVING COUNT(*) > 1;

SELECT
    SUM(Machine_Code IS NULL) AS Machine_Code_NULL,
    SUM(Operation_Code IS NULL) AS Operation_Code_NULL,
    SUM(Operation_Name IS NULL) AS Operation_Name_NULL,
    SUM(Avg_Daily_Cost IS NULL) AS Avg_Daily_Cost_NULL,
    SUM(Machine_Type IS NULL) AS Machine_Type_NULL,
    SUM(Status IS NULL) AS Status_NULL
FROM dim_Machine;

SELECT
    SUM(TRIM(Machine_Code) = '') AS Machine_Code_Blank,
    SUM(TRIM(Operation_Code) = '') AS Operation_Code_Blank,
    SUM(TRIM(Operation_Name) = '') AS Operation_Name_Blank,
    SUM(TRIM(Machine_Type) = '') AS Machine_Type_Blank,
    SUM(TRIM(Status) = '') AS Status_Blank
FROM dim_Machine;

# checck avg daily cost
SELECT
    MIN(Avg_Daily_Cost) AS Minimum_Cost,
    MAX(Avg_Daily_Cost) AS Maximum_Cost,
    SUM(Avg_Daily_Cost < 0) AS Negative_Costs
FROM dim_Machine;

# check status
SELECT Status, COUNT(*) AS Count
FROM dim_Machine
GROUP BY Status;

show tables;

DESCRIBE dim_date;

SELECT Date, COUNT(*) AS Count
FROM dim_date
GROUP BY Date
HAVING COUNT(*) > 1;

SELECT
    SUM(Date IS NULL) AS Date_NULL,
    SUM(Day IS NULL) AS Day_NULL,
    SUM(Day_Name IS NULL) AS Day_Name_NULL,
    SUM(Week_Num IS NULL) AS Week_Num_NULL,
    SUM(Month_Num IS NULL) AS Month_Num_NULL,
    SUM(Month_Name IS NULL) AS Month_Name_NULL,
    SUM(Quarter IS NULL) AS Quarter_NULL,
    SUM(Year IS NULL) AS Year_NULL,
    SUM(Is_Weekend IS NULL) AS Is_Weekend_NULL,
    SUM(Season IS NULL) AS Season_NULL
FROM dim_date;

SELECT
    SUM(TRIM(Day_Name) = '') AS Day_Name_Blank,
    SUM(TRIM(Month_Name) = '') AS Month_Name_Blank,
    SUM(TRIM(Quarter) = '') AS Quarter_Blank,
    SUM(TRIM(Is_Weekend) = '') AS Is_Weekend_Blank,
    SUM(TRIM(Season) = '') AS Season_Blank
FROM dim_date;

# check validate  date and all columns
SELECT
    MIN(Day) AS Min_Day,
    MAX(Day) AS Max_Day,
    MIN(Week_Num) AS Min_Week,
    MAX(Week_Num) AS Max_Week,
    MIN(Month_Num) AS Min_Month,
    MAX(Month_Num) AS Max_Month,
    MIN(Year) AS Min_Year,
    MAX(Year) AS Max_Year
FROM dim_date;

# check categorical values 
SELECT Is_Weekend, COUNT(*) AS Count
FROM dim_date
GROUP BY Is_Weekend;

# check season 
SELECT Season, COUNT(*) AS Count
FROM dim_date
GROUP BY Season;
# checking distinct values 
SELECT DISTINCT Day_Name
FROM dim_date
ORDER BY Day_Name;

SELECT Month_Num, Month_Name
FROM dim_date
GROUP BY Month_Num, Month_Name
ORDER BY Month_Num;

DESCRIBE dim_item;

SELECT Item_Code, COUNT(*) AS Count
FROM dim_item
GROUP BY Item_Code
HAVING COUNT(*) > 1;

SELECT
    SUM(Item_Code IS NULL) AS Item_Code_NULL,
    SUM(Item_Name IS NULL) AS Item_Name_NULL,
    SUM(Department_Name IS NULL) AS Department_Name_NULL,
    SUM(Item_Category IS NULL) AS Item_Category_NULL
FROM dim_item;

SELECT
    SUM(TRIM(Item_Code) = '') AS Item_Code_Blank,
    SUM(TRIM(Item_Name) = '') AS Item_Name_Blank,
    SUM(TRIM(Department_Name) = '') AS Department_Name_Blank,
    SUM(TRIM(Item_Category) = '') AS Item_Category_Blank
FROM dim_item;
# checking actual item category
SELECT Item_Category, COUNT(*) AS Count
FROM dim_item
GROUP BY Item_Category;

# check dept name 
SELECT Department_Name, COUNT(*) AS Count
FROM dim_item
GROUP BY Department_Name;
# check dept name unique values 
SELECT DISTINCT Department_Name
FROM dim_item
ORDER BY Department_Name;

DESCRIBE fact_production;

SELECT
    COUNT(*) AS Total_Rows,
    SUM(Doc_Num IS NULL) AS Null_Doc_Num,
    SUM(Date_FK IS NULL) AS Null_Date,
    SUM(Buyer_ID IS NULL) AS Null_Buyer_ID,
    SUM(Customer_Code IS NULL) AS Null_Customer_Code,
    SUM(Employee_Code IS NULL) AS Null_Employee_Code,
    SUM(Machine_Code IS NULL) AS Null_Machine_Code,
    SUM(Operation_Code IS NULL) AS Null_Operation_Code,
    SUM(Dept_ID IS NULL) AS Null_Dept_ID,
    SUM(Item_Code IS NULL) AS Null_Item_Code,
    SUM(WO_Qty IS NULL) AS Null_WO_Qty,
    SUM(Produced_Qty IS NULL) AS Null_Produced_Qty,
    SUM(Rejected_Qty IS NULL) AS Null_Rejected_Qty,
    SUM(Total_Value IS NULL) AS Null_Total_Value
FROM fact_production;

SELECT
    SUM(TRIM(Doc_Num) = '') AS Blank_Doc_Num,
    SUM(TRIM(Buyer_ID) = '') AS Blank_Buyer_ID,
    SUM(TRIM(Customer_Code) = '') AS Blank_Customer_Code,
    SUM(TRIM(Employee_Code) = '') AS Blank_Employee_Code,
    SUM(TRIM(Machine_Code) = '') AS Blank_Machine_Code,
    SUM(TRIM(Operation_Code) = '') AS Blank_Operation_Code,
    SUM(TRIM(Dept_ID) = '') AS Blank_Dept_ID,
    SUM(TRIM(Item_Code) = '') AS Blank_Item_Code,
    SUM(TRIM(Delivery_Status) = '') AS Blank_Delivery_Status,
    SUM(TRIM(Is_Repeat_Order) = '') AS Blank_Is_Repeat_Order
FROM fact_production;

SELECT
    SUM(WO_Qty < 0) AS Negative_WO_Qty,
    SUM(Press_Qty < 0) AS Negative_Press_Qty,
    SUM(Processed_Qty < 0) AS Negative_Processed_Qty,
    SUM(Produced_Qty < 0) AS Negative_Produced_Qty,
    SUM(Rejected_Qty < 0) AS Negative_Rejected_Qty,
    SUM(Today_Manufactured_Qty < 0) AS Negative_Manufactured_Qty,
    SUM(Total_Qty < 0) AS Negative_Total_Qty,
    SUM(Total_Value < 0) AS Negative_Total_Value,
    SUM(Per_Day_Machine_Cost < 0) AS Negative_Machine_Cost,
    SUM(Cost_per_Unit < 0) AS Negative_Cost_per_Unit
FROM fact_production;

# check percentage rate

SELECT
    SUM(Rejection_Rate_Pct < 0 OR Rejection_Rate_Pct > 100) AS Invalid_Rejection_Rate,
    SUM(Efficiency_Rate_Pct < 0 OR Efficiency_Rate_Pct > 100) AS Invalid_Efficiency_Rate,
    SUM(Machine_Utilization_Pct < 0 OR Machine_Utilization_Pct > 100) AS Invalid_Utilization_Rate
FROM fact_production;

# buyer id 
SELECT COUNT(*) AS Missing_Buyers
FROM fact_production f
LEFT JOIN dim_buyer b
    ON f.Buyer_ID = b.Buyer_ID
WHERE b.Buyer_ID IS NULL;
# customer code
SELECT COUNT(*) AS Missing_Customers
FROM fact_production f
LEFT JOIN dim_customer c
    ON f.Customer_Code = c.Customer_Code
WHERE c.Customer_Code IS NULL;
# employee code
SELECT COUNT(*) AS Missing_Employees
FROM fact_production f
LEFT JOIN dim_employee e
    ON f.Employee_Code = e.Employee_Code
WHERE e.Employee_Code IS NULL;

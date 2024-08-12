create database manufacturing;
use manufacturing;
select * from manufacturing;
desc manufacturing;
alter table manufacturing modify column Doc_Date datetime;


-- 1. Total Manufactured Quantity :-

	SELECT concat(round(sum(Manufactured_Qty)/1000000,2),'M') as Total_Manufactured_Qty
    FROM manufacturing;
    

-- 2. Total Rejected Quantity :-
    
    SELECT concat(round(SUM(Rejected_Qty)/1000,2),'K') as Total_Rejected_Qty
    FROM manufacturing;
    

-- 3. Total Processed Quantity :-
   
    SELECT concat(round(SUM(Processed_Qty)/1000000,2),'M') as Total_Processed_Qty
    FROM manufacturing;
    

-- 4. Total Wastage Quantity :-
    
    SELECT sum(Rejected_Qty)/(sum(Manufactured_Qty)-sum(Rejected_Qty)) as Total_Wastage_Qty
    FROM manufacturing;
    
    
-- 5. Employee-wise Rejected Quantity :-
   
    SELECT Emp_Name, SUM(Rejected_Qty) as Employee_Rejected_Qty
    FROM manufacturing
    GROUP BY Emp_Name
    ORDER BY SUM(Rejected_Qty) desc;
    

-- 6. Machine-wise Rejected Quantity :-
   
    SELECT Machine_Name, concat(round(SUM(Rejected_Qty)/1000,2),'K') as Machine_Rejected_Qty
    FROM manufacturing
    GROUP BY Machine_Name
    ORDER BY SUM(Rejected_Qty) desc;
    

-- 7. Production Comparison Trend (Manufactured V/S Rejected over time) :-
    
	SELECT 
		date_format(Doc_Date,"%d - %b - %Y") AS Dates, 
		concat(round(SUM(Manufactured_Qty)/1000000,2),'M') AS Daily_Manufactured_Qty, 
		concat(round(SUM(Rejected_Qty)/1000,2),'K') AS Daily_Rejected_Qty
	FROM 
		manufacturing
	GROUP BY 
		Dates
	ORDER BY 
		Dates;


-- 8. Manufactured V/S Rejected Quantity :-
    
    SELECT concat(round(SUM(Manufactured_Qty)/1000000,2),'M') as Total_Manufactured_Qty, 
    concat(round(SUM(Rejected_Qty)/1000,2),'K') as Total_Rejected_Qty
    FROM manufacturing;
    

-- 9. Department-wise Manufactured V/S Rejected Quantity :-
   
    SELECT Department_Name, concat(round(SUM(Manufactured_Qty)/1000000,2),'M')as Department_Manufactured_Qty, 
    concat(round(SUM(Rejected_Qty)/1000,2),'K') as Department_Rejected_Qty
    FROM manufacturing
    GROUP BY Department_Name;
    

-- 10. Employee-wise Rejected Quantity :-
   
    SELECT Emp_Name, SUM(Rejected_Qty) as Employee_Rejected_Qty
    FROM manufacturing
    GROUP BY Emp_Name
    ORDER BY SUM(Rejected_Qty) desc;
    
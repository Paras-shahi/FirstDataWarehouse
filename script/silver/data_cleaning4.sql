--This is the script  for the silver.erp_cust_az12 --

--Inserting data into the table --
insert into silver.erp_cust_az12 

select   

--Removing the unwanted data from the cid --
case when cid like 'NAS%' then substring (cid , 4 , len (cid))
else cid
end as cid,

--correcting the date which are showing the birthdate as future date--
case when bdate > GETDATE () THEN NULL 
ELSE bdate
end as bdate,

--Making the data standardize-- 
case when upper (trim (gen))in ('f', 'female' ) then 'Female'
when upper (trim (gen))in ('m', 'male' ) then 'Male'
else 'N/A'
end as gen 

--Data source is given --
from bronze.erp_cust_az12
  

/*This is the script for creating , cleaning and inserting data
for the table silver.crm_sales_details */

-- Removing the old table --
if object_id ('silver.crm_sales_details', 'u')is not null 
   drop table silver.crm_sales_details;

--creating new table with same name with the changes --
create table silver.crm_sales_details
(
		sls_ord_num nvarchar (50),
		sls_prd_key Nvarchar (50),
		sls_cust_id int,
		sls_order_dt date ,
		sls_ship_dt date,
		sls_due_dt date,
		sls_sales int,
		sls_quantity int,
		sls_price int,
		dwh_create_date datetime2 default getdate ()
) ;
--data which need to be inserted --
insert into silver.crm_sales_details
(sls_ord_num ,
		sls_prd_key,
		sls_cust_id ,
		sls_order_dt ,
		sls_ship_dt ,
		sls_due_dt ,
		sls_sales ,
		sls_quantity ,
		sls_price   
)
-- inserting new data into table --
select 
	sls_ord_num,
	sls_prd_key,
	sls_cust_id,

--cleaning the  order date --
case when sls_order_dt =0 or len (sls_order_dt) != 8 then null
 -- In sql we can't change number into date directly so first change into varcahr then date --
     else cast (cast (sls_order_dt as varchar ) as date )
end as sls_order_dt,

--cleaning shipment date--
 case when sls_ship_dt =0 or len (sls_ship_dt) != 8 then null
 -- In sql we can't change number into date directly so first change into varcahr then date --
     else cast (cast (sls_ship_dt as varchar ) as date )
end as sls_ship_dt, 

--cleaning due date--
case when sls_due_dt =0 or len (sls_due_dt) != 8 then null
 -- In sql we can't change number into date directly so first change into varcahr then date --
     else cast (cast (sls_due_dt as varchar ) as date )
end as sls_due_dt, 

--cleaning the sales data --
 case when sls_sales is null or sls_sales <=0 or sls_sales != sls_quantity * ABS (sls_price)
      then sls_quantity * ABS(sls_price)
    else sls_sales
 end as sls_sales,

 sls_quantity ,

 -- cleaning price data --
 case when sls_price is null or sls_price <=0 
       then sls_sales / nullif(sls_quantity ,0)
    else sls_price
 end as sls_price

from bronze.crm_sales_details 


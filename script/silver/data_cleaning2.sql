/* Updating the old data table silver.crm_prd_info because we have added new
data like cat_id , prd_key*/
if OBJECT_ID ('silver.crm_prd_info','u') is not null
    drop table silver.crm_prd_info;

/*old table is now deleted and table is creating */
create table silver.crm_prd_info
		(prd_id int,
		cat_id nvarchar (50),
		prd_key nvarchar (50),
		prd_nm nvarchar (50),
		prd_cost int,
		prd_line nvarchar (50),
		prd_start_dt date,
		prd_end_dt date,
		dwh_create_date datetime2 default getdate ()
		);

/*Inserting the  data into  silver.crm_prd_info*/
insert into silver.crm_prd_info
		(prd_id ,
		cat_id,
		prd_key ,
		prd_nm ,
		prd_cost ,
		prd_line,
		prd_start_dt ,
		prd_end_dt )

/*sorce from where the data will be selected */
select 
    prd_id,

/*extrecting the data from the from the prd_key 1 denote that the extrection start from 
first place , 5 denote number of character to be extacted*/
/*replacing the '-' with '_'*/
    Replace (SUBSTRING(prd_key,1,5),'-' , '_' )as cat_id,

 /*now extrecting another number from prd_key from 7th position */
   substring (prd_key,7,len (prd_key))as prd_key,
   prd_nm,
   isnull (prd_cost,0) as prd_cost,

/*now changing the the abbrivation to the full word*/
   case upper (trim (prd_line))
          when  'M' then 'mountain'
          when  'R' then 'Road'
          when 's' then 'other sales'
          when 't' then 'touring'
       else 'N/A'
   end prd_line,

/*The start date and the end date is not matching the rule 
*  The starting date should be older than the ending date 
*  For the same product the starting date of the next product 
   should be older  then the ending date of the previous product 
so end date is ignored and creating new date with the starting date 
subracting one from the starting date */
    cast( prd_start_dt as date) as prd_start_dt,
    cast (lead (prd_start_dt) over (partition by prd_key order by prd_start_dt)-1 as date) prd_end_dt
from bronze.crm_prd_info

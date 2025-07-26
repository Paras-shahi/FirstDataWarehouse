 
--Inserting clean data into [silver].[crm_crust_info] --
Insert 
  into [silver].[crm_crust_info]
	(
	cst_id
	,cst_key
	,cst_firstname
	,cst_lastname
	,cst_marital_status
	,cst_gndr
	,cst_create_date
	)

--This is the process for cleaning data --
select 
	cst_id
	,cst_key
--Cleaning the name data deleting unnecessary gap in the name --
	,trim(cst_firstname)as cst_firstname
	,trim (cst_lastname) as cst_lastname
/* ignoring the data case makeing all data case as upper case 
avoideing the unnecessary gap and changing the old name to new name */
	,case
		when Upper (trim (cst_marital_status ))= 'S' then 'Single'
		when Upper (trim (cst_marital_status ))= 'M' then 'Married'
		else 'N/A'
		End cst_marital_status 
		,
	case
		when Upper (trim (cst_gndr ))= 'f' then 'Female'
		when Upper (trim (cst_gndr ))= 'm' then 'Male'
		else 'N/A'
		End cst_gndr 
,cst_create_date

/* this is the source of data */

from (
	select
	*,
/*cst_id is being ranked and then removing cst_id wich came more than once
and removing null cst_id aswell*/
	ROW_NUMBER() over  (partition by cst_id order by cst_create_date  desc  ) as 'occurance'
	from [bronze].[crm_crust_info] 
	where cst_id is not null
	)t
	where occurance = 1



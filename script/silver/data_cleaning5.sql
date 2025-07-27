-- This is the script for uploading data int0 silver.erp_loc_a101--
insert into silver.erp_loc_a101 (cid,cntry)
select 
--Replacing the - with blank --
replace (cid, '-', '') cid,

--Makeing the contry name proper --
case 
when trim (cntry)= 'DE' then 'Germany'
 when trim (cntry) in ('US', 'USA') then 'United State'
 when trim (cntry)= '' or cntry Is null then 'N/A'
else trim (cntry)
end as cntry
-- sorce of data --
from bronze.erp_loc_a101

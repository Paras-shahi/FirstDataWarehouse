-- This is already the clean data so just uploading this into silver.erp_px_catg1v2--
insert into silver.erp_px_catg1v2(id,cat,subcat,maintenance)
select 
id,
cat,
subcat,
maintenance
from bronze.erp_px_catg1v2

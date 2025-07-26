/* This is the scipt for making bulk inserting */
/* The location will be different in your device */


 /* This is to bulk insert in  'bronze.crm_crust_info' table 
  In from section write the 'location of data' + '\File Name'*/
 bulk insert bronze.crm_crust_info
 from 'C:\Users\tripl\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv ' 
 with (
 /* The first row is 2 because the raw data first line is about the heading */
     firstrow =2,
/* fieldterminator tell how the raw data is seperated */ 
	 fieldterminator =',',
/* help to optimise the table */
	 tablock 
	 );


 /*Bulk inserting data for bronze.crm_sales_details */
 bulk insert bronze.crm_sales_details
 from 'C:\Users\tripl\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv' 
 with (
 /* The first row is 2 because the raw data first line is about the heading */
     firstrow =2,
/* fieldterminator tell how the raw data is seperated */ 
	 fieldterminator =',',
/* help to optimise the table */
	 tablock 
	 );

 /*Bulk inserting data for crm_prd_info */
 bulk insert bronze.crm_prd_info
 from 'C:\Users\tripl\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv ' 
 with (
 /* The first row is 2 because the raw data first line is about the heading */
     firstrow =2,
/* fieldterminator tell how the raw data is seperated */ 
	 fieldterminator =',',
/* help to optimise the table */
	 tablock 
	 );

 
 /*Bulk inserting data for bronze.erp_cust_az12 */
 bulk insert bronze.erp_cust_az12
 from 'C:\Users\tripl\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
 with (
 /* The first row is 2 because the raw data first line is about the heading */
     firstrow =2,
/* fieldterminator tell how the raw data is seperated */ 
	 fieldterminator =',',
/* help to optimise the table */
	 tablock 
	 );
  
  /*Bulk inserting data for bronze.erp_loc_a101 */
 bulk insert bronze.erp_loc_a101
 from 'C:\Users\tripl\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
 with (
 /* The first row is 2 because the raw data first line is about the heading */
     firstrow =2,
/* fieldterminator tell how the raw data is seperated */ 
	 fieldterminator =',',
/* help to optimise the table */
	 tablock 
	 );
 
  /*Bulk inserting data for bronze.erp_px_catg1v2 */
 bulk insert bronze.erp_px_catg1v2
 from 'C:\Users\tripl\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
 with (
 /* The first row is 2 because the raw data first line is about the heading */
     firstrow =2,
/* fieldterminator tell how the raw data is seperated */ 
	 fieldterminator =',',
/* help to optimise the table */
	 tablock 
	 );

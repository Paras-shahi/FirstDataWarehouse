--first go to master for coming back form all the database -- 

use master;

-- creating database --

create database firstDataWarehouse;
   go

-- database is created now use that database for creating schema--

use firstDataWarehouse ;
   go 
--Now creating Schema--

create schema bronze ;
   go 
create schema silver ;
   go
create schema gold ;
  go 

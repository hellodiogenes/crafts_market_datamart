# Adding a new source to DWH. Creating a data mart with incremental data loading.

In this project, I worked with a database for a handmade goods marketplace. Initially, the database consisted of two main layers: sources and DWH. The sources were represented by three schemas: `source1`, `source2`, and `source3`. Data from these sources is loaded into the DWH layer using the **DDL_craft_market_dwh** script.

The DWH layer contains dimension tables for craftsmen (`d_craftsman`), customers (`d_customer`), and products (`d_product`).

The marketplace decided to integrate the client and craftsman databases from another online store. After completing the integration, it became necessary to create a data mart with customer information in a new layer of the database.

## Key Tasks

I faced two primary tasks:

1. Refining the script to update DWH based on external source data

   Originally, the **DDL_craft_market_dwh** script extracted data from three source schemas. Now, it was required that DWH also receive data from an external schema called `external_source`.

   Similar to `source1`, `source2`, and `source3`, the `external_source` schema contains data about buyers, sellers, and orders. Here is [external_source diagramma](https://github.com/hellodiogenes/crafts_market_datamart/tree/main/image/external_source.png) for example.

2. Creating a script to generate an incremental data mart with customer data

   The **SQL_craft_market_customers_datamart** script was written to extract data from all warehouse tables. The data mart should be updated incrementally, meaning it only updates newly added or modified customer records since the last update.

   Before creating the data mart, a new marts schema was created to store data marts in the new database layer.

## Technologies Used

For the implementation of this data engineering project, I used **PostgreSQL** and Database Administration Tool **DBeaver**.

## Results

1. The **DDL_craft_market_dwh** script takes into account the `external_source` when updating the Data Warehouse (DWH), ensuring the data remains up-to-date and minimizing the risk of data loss.

2. The **DDL_customer_report_datamart** script was used to create `customer_report_datamart` mart within the `marts` schema. To track the last update date of the datamart, a supporting table named `load_dates_customer_report_datamart` was created to store information about the most recent data refresh.

3. The **SQL_craft_market_customers_datamart script** is responsible for aggregating customer data into the datamart. Updates are performed incrementally: the script checks the latest load date from the `load_dates_customer_report_datamart` table and only adds new records since the previous update. This approach reduces system load and speeds up data processing.
# Key Tasks

In this project, I worked with a database for a handmade goods marketplace. Initially, the database consisted of two main layers: sources and DWH (Data Warehouse). The sources were represented by three schemas: source1, source2, and source3. Data from these sources is loaded into the DWH layer using the DDL_craft_market_dwh script.

The DWH layer contains dimension tables for craftsmen (d_craftsman), customers (d_customer), and products (d_product).

The marketplace decided to integrate the client and craftsman databases from another online store. After completing the integration, it became necessary to create a data mart with customer information in a new layer of the database.

## Key Tasks

I faced two primary tasks:

1. Refining the script to update DWH based on external source data

   Originally, the DDL_craft_market_dwh script extracted data from three source schemas: source1, source2, and source3. Now, it was required that DWH also receive data from an external schema called external_source.

   Similar to source1, source2, and source3, the external_source schema contains data about buyers, sellers, and orders:

   !(https://github.com/hellodiogenes/crafts_market_datamart/tree/main/image/external_source.png)

2. Creating a script to generate an incremental data mart with customer data

   The SQL_craft_market_customers_datamart script was written to extract data from all warehouse tables. The data mart should be updated incrementally, meaning it only updates newly added or modified customer records since the last update.

   Before creating the data mart, a new marts schema was created to store data marts in the new database layer.
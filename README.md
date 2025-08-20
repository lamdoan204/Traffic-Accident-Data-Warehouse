#  Traffic Accident Data Warehouse

##  Giới thiệu
Dự án này xây dựng **Data Warehouse** cho dữ liệu tai nạn giao thông dựa trên phương pháp **Kimball Dimensional Modeling**.  
Mục tiêu:
- Thu thập, lưu trữ và tổ chức dữ liệu tai nạn giao thông từ Kaggle.
- Cung cấp cấu trúc **Fact & Dimension** tối ưu cho việc phân tích.
- Hỗ trợ các truy vấn OLAP và phân tích báo cáo (sử dụng T-SQL/MDX).
## Quy trình
### 1. Sử dụng file excel Detailed-Dimensional-Modeling-Workbook-KimballU.xlsm để thiết kế DataWarehouse, generate code SQL
####  Data Warehouse Schema

#####  Fact Tables
- `FactTime`: facts about crash time
- `FactCause`: facts related to crash causes

#####  Dimension Tables
- `DimDate`
- `DimCrashType`
- `DimLighting`
- `DimWeather`
- `DimTrafficControl`
- `DimAudit`
---  
### 2. Quá trình ETL
   Import data CSV into database được đặt tên Dataset
   Tạo database TrafficAccidents để sinh khóa cho các thuộc tính (T-SQL/1.CreateTables.sql)
   Import dữ liệu từ Dataset sang TrafficAccidents (T-SQL/2.LoadDatasetIntoTables.sql)
   Tạo DataWarehouse (T-SQL/3.CreateTrafficAccidentDW.sql)
   - ETL bằng T-SQL
     + Staging (T-SQL/4.Staging.sql)
     + Loading (T-SQL/5.Loading.sql)
    
   - ETL bằng SSIS
SSIS Packages Overview

The project includes 4 main SSIS packages, each representing a specific stage in the ETL process:

| Package                                 | Description                                            |
| --------------------------------------- | ------------------------------------------------------ |
| `01_load_csv_to_dataset.dtsx`           | Load raw CSV into staging table                        |
| `02_load_dataset_to_source_tables.dtsx` | Normalize into dimension & event tables                |
| `03_load_source_to_stage.dtsx`          | Prepare cleaned, joined data for DW                    |
| `04_load_stage_to_dwh.dtsx`             | Final load into DW with surrogate keys, SCD, and audit |

+ Open `traffic-warehouse-project.sln` in Visual Studio with SSIS extension
+ Configure the following Connection Managers:
  - `CSV_TrafficAccidents.conmgr`
  - `Traffic_Source.conmgr`
  - `Traffic_Stage.conmgr`
  - `Traffic_DW.conmgr`
+ Run the packages in order:  
  `01` → `02` → `03` → `04`
### 3. Thực hiện truy vấn với OLAP và trực quan hóa với PowerBI
- Use SSAS tool (SQL Server Analysis Service in Visual Studio) to create OLAP cube and execute query
- Use PowerBI to visualize charts for analysis


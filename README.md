# Traffic Accident Data Warehouse

## 📌 Introduction
This project builds a **Data Warehouse** for traffic accident data based on the **Kimball Dimensional Modeling** approach.  

**Objectives:**
- Collect, store, and organize traffic accident data from Kaggle.
- Provide an optimized **Fact & Dimension** structure for analysis.
- Support OLAP queries and reporting analysis (using T-SQL/MDX).

---

## 📑 Table of Contents
- [Introduction](#-introduction)
- [Process](#-process)
  - [1. Data Warehouse Design](#1-data-warehouse-design)
  - [2. ETL Process](#2-etl-process)
  - [3. OLAP & Visualization](#3-olap--visualization)
- [Project Structure](#-project-structure)
- [Installation & Usage](#-installation--usage)
- [Technologies Used](#-technologies-used)

---

## 🔧 Process

### 1. Data Warehouse Design
Using the file **Detailed-Dimensional-Modeling-Workbook-KimballU.xlsm** to design the Data Warehouse and generate SQL code.

#### Data Warehouse Schema
**Fact Tables**
- `FactTime`: facts about crash time
- `FactCause`: facts related to crash causes

**Dimension Tables**
- `DimDate`
- `DimCrashType`
- `DimLighting`
- `DimWeather`
- `DimTrafficControl`
- `DimAudit`

---

### 2. ETL Process
- Import CSV data into the database named **Dataset**  
- Create the **TrafficAccidents** database to generate keys for the attributes  
  - Script: `T-SQL/1.CreateTables.sql`  
- Import data from **Dataset** into **TrafficAccidents**  
  - Script: `T-SQL/2.LoadDatasetIntoTables.sql`  
- Create **Data Warehouse**  
  - Script: `T-SQL/3.CreateTrafficAccidentDW.sql`  

**ETL using T-SQL**
- Staging → `T-SQL/4.Staging.sql`  
- Loading → `T-SQL/5.Loading.sql`  

**ETL using SSIS**

📌 **Role of SSIS in ETL**  
- **Extract:** Connect to sources (CSV, Excel, SQL Server, …) to retrieve input data. In this project, the initial data source is the CSV file TrafficAcidents.csv.
- **Transform:** Data cleaning & processing (data type conversion, encoding normalization, date splitting, surrogate key creation, SCD management).  
- **Load:** Load processed data into DW (Stage → DW).  

**SSIS Packages Overview**

| Package                                 | Description                                            |
| --------------------------------------- | ------------------------------------------------------ |
| `01_load_csv_to_dataset.dtsx`           | Load raw CSV into staging table                        |
| `02_load_dataset_to_source_tables.dtsx` | Normalize into dimension & event tables                |
| `03_load_source_to_stage.dtsx`          | Prepare cleaned, joined data for DW                    |
| `04_load_stage_to_dwh.dtsx`             | Final load into DW with surrogate keys, SCD, and audit |

Run in order: `01` → `02` → `03` → `04`

---

### 3. OLAP & Visualization
- Use **SSAS** (SQL Server Analysis Services in Visual Studio) to create OLAP cubes and run queries.  
- Use **PowerBI** to visualize charts for analysis.  

---

## 📂 Project Structure

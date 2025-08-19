/****** Object:  Database TrafficAccidentsDW    Script Date: 5/13/2025 1:12:52 AM ******/
/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate a database from the datamodel worksheet, version: 4

You can use this Excel workbook as a data modeling tool during the logical design phase of your project.
As discussed in the book, it is in some ways preferable to a real data modeling tool during the inital design.
We expect you to move away from this spreadsheet and into a real modeling tool during the physical design phase.
The authors provide this macro so that the spreadsheet isn't a dead-end. You can 'import' into your
data modeling tool by generating a database using this script, then reverse-engineering that database into
your tool.

Uncomment the next lines if you want to drop and create the database
*/

--drop database TrafficAccidentsDW
--go
CREATE DATABASE TrafficAccidentsDW
GO


USE TrafficAccidentsDW
;
IF EXISTS (SELECT Name from sys.extended_properties where Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Default description - you should change this.'
;


go
CREATE SCHEMA warehouse;
go


/* Drop table warehouse.DimAudit */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'warehouse.DimAudit') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE warehouse.DimAudit 
;

/* Create table warehouse.DimAudit */
CREATE TABLE warehouse.DimAudit (
   [AuditKey]  int IDENTITY  NOT NULL
,  [ParentAuditKey]  int   NOT NULL
,  [TableName]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [PkgName]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [PkgGUID]  uniqueidentifier   NULL
,  [PkgVersionGUID]  uniqueidentifier   NULL
,  [PkgVersionMajor]  smallint   NULL
,  [PkgVersionMinor]  smallint   NULL
,  [ExecStartDT]  datetime  DEFAULT getdate() NOT NULL
,  [ExecStopDT]  datetime   NULL
,  [ExecutionInstanceGUID]  uniqueidentifier   NULL
,  [ExtractRowCnt]  bigint   NULL
,  [InsertRowCnt]  bigint   NULL
,  [UpdateRowCnt]  bigint   NULL
,  [ErrorRowCnt]  bigint   NULL
,  [TableInitialRowCnt]  bigint   NULL
,  [TableFinalRowCnt]  bigint   NULL
,  [TableMaxSurrogateKey]  bigint   NULL
,  [SuccessfulProcessingInd]  nchar(1)  DEFAULT 'N' NOT NULL
, CONSTRAINT [PK_warehouse.DimAudit] PRIMARY KEY CLUSTERED 
( [AuditKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Audit', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimAudit
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Audit', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimAudit
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimAudit
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Audit dimension tags each data row with the the process that added or updated it.', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimAudit
;

SET IDENTITY_INSERT warehouse.DimAudit ON
;
INSERT INTO warehouse.DimAudit (AuditKey, ParentAuditKey, TableName, PkgName, PkgGUID, PkgVersionGUID, PkgVersionMajor, PkgVersionMinor, ExecStartDT, ExecStopDT, ExecutionInstanceGUID, ExtractRowCnt, InsertRowCnt, UpdateRowCnt, ErrorRowCnt, TableInitialRowCnt, TableFinalRowCnt, TableMaxSurrogateKey, SuccessfulProcessingInd)
VALUES (-1, -1, 'Audit', 'None: Dummy row', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y')
;
SET IDENTITY_INSERT warehouse.DimAudit OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'AuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ParentAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ParentAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TableName', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgName', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgGUID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgGUID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgVersionGUID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionGUID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgVersionMajor', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionMajor'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgVersionMinor', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionMinor'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExecStartDT', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecStartDT'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExecStopDT', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecStopDT'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExecutionInstanceGUID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecutionInstanceGUID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExtractRowCnt', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExtractRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertRowCnt', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'InsertRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateRowCnt', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'UpdateRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ErrorRowCnt', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ErrorRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TableInitialRowCnt', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableInitialRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TableFinalRowCnt', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableFinalRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TableMaxSurrogateKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableMaxSurrogateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SuccessfulProcessingInd', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'SuccessfulProcessingInd'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'AuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Foreign key to self, to identify calling package execution', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ParentAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the main table loaded by this package', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the SSIS package', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Identifier for the package', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgGUID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Identifier for the package version', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionGUID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Major version number for the package', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionMajor'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Minor version number for the package', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionMinor'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date-time the package started executing', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecStartDT'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date-time the package finished executing', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecStopDT'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Identifier for the execution of the package', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecutionInstanceGUID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows extracted from the source(s)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExtractRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows inserted in the destination table', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'InsertRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows updated in the destination table', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'UpdateRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of error rows', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ErrorRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows in target table before we begin', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableInitialRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows in target table after package ends', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableFinalRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Maximum surrogate key value in table (if we''re maintaining ourselves)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableMaxSurrogateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Did the package finish executing successfully?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'SuccessfulProcessingInd'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'AuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ParentAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'SuccessfulProcessingInd'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'AuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ParentAuditKey'; 
;





/* Drop table warehouse.FactTime */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'warehouse.FactTime') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE warehouse.FactTime 
;

/* Create table warehouse.FactTime */
CREATE TABLE warehouse.FactTime (
   [InsertAuditKey]  int   NULL
,  [UpdateAuditKey]  int   NULL
,  [CrashID]  int   NOT NULL
,  [DateKey]  bigint   NULL
,  [CrashTypeKey]  int   NULL
,  [InjuriesTotal]  int   NOT NULL
,  [InjuriesFatal]  int   NOT NULL
,  [InjuriesIncapacitating]  int   NOT NULL
,  [InjuriesNonIncapacitating]  int   NOT NULL
,  [DameLevel]  varchar(50)   NOT NULL
,  [NumberUnits]  int   NOT NULL
,  [MostSevereInjury]  varchar(50)   NOT NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=FactTime
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactTime', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=FactTime
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=FactTime
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=FactTime
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Insert Audit Key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Update Audit Key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CrashID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CrashTypeKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InjuriesTotal', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesTotal'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InjuriesFatal', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesFatal'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InjuriesIncapacitating', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InjuriesNonIncapacitating', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesNonIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DameLevel', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DameLevel'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'NumberUnits', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'NumberUnits'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MostSevereInjury', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'MostSevereInjury'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row insertion', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row update', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always add a description!', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always add a description!', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always add a description!', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always add a description!', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesTotal'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always add a description!', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesFatal'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always add a description!', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always add a description!', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesNonIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always add a description!', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DameLevel'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always add a description!', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'NumberUnits'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always add a description!', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'MostSevereInjury'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesTotal'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesFatal'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesNonIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DameLevel'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'NumberUnits'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'MostSevereInjury'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesTotal'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesFatal'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesNonIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DameLevel'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'NumberUnits'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'MostSevereInjury'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesTotal'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesFatal'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesNonIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DameLevel'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'NumberUnits'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'MostSevereInjury'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimDate', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimCrashType', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesTotal'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesFatal'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesNonIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DameLevel'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'NumberUnits'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'MostSevereInjury'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'crash_id', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CrashTypeKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'injuries_total', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesTotal'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'injuries_fatal', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesFatal'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'injuries_incapacitating', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'injuries_non_incapacitating', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesNonIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'dame_level', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DameLevel'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'number_units', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'NumberUnits'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'most_severe_injury', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'MostSevereInjury'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesTotal'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesFatal'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'InjuriesNonIncapacitating'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'DameLevel'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'NumberUnits'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactTime', @level2type=N'COLUMN', @level2name=N'MostSevereInjury'; 
;





/* Drop table warehouse.FactCause */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'warehouse.FactCause') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE warehouse.FactCause 
;

/* Create table warehouse.FactCause */
CREATE TABLE warehouse.FactCause (
   [LightingKey]  int   NOT NULL
,  [WeatherKey]  int   NOT NULL
,  [TrafficControlDeviceKey]  int   NOT NULL
,  [AlignmentKey]  int   NOT NULL
,  [CrashTypeKey]  int   NOT NULL
,  [TrafficWayTypeKey]  int   NOT NULL
,  [RoadWayDefectKey]  int   NOT NULL
,  [RoadWaySurfaceKey]  int   NOT NULL
,  [ContributoryCauseKey]  int   NOT NULL
,  [InsertAuditKey]  int   NULL
,  [UpdateAuditKey]  int   NULL
,  [CrashID]  int   NOT NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=FactCause
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactCause', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=FactCause
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=FactCause
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=FactCause
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'LightingKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeatherKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrafficControlDeviceKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AlignmentKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CrashTypeKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrafficWayTypeKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadWayDefectKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadWaySurfaceKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ContributoryCauseKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Insert Audit Key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Update Audit Key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CrashID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Dim1', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Dim2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Dim2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Dim2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Dim2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Dim2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Dim2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Dim2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Dim2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row insertion', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row update', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always add a description!', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.FromCurrencyCode', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.CurrencyRateDate', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.CurrencyRateDate', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.CurrencyRateDate', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.CurrencyRateDate', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.CurrencyRateDate', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.CurrencyRateDate', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.CurrencyRateDate', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.CurrencyRateDate', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimLighting', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimWeather', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimTrafficControlDevice', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimAlignment', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimCrashType', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimTrafficWayType', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimRoadWayDefect', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimRoadWaySurface', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimContributoryCause', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'LightingKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'WeatherKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ControlDeviceKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'AlignmentKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CrashTypeKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TrafficWayTypeKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'RoadWayDefectKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'RoadWaySurfaceKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ContributoryCauseKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'crash_id', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'FactCause', @level2type=N'COLUMN', @level2name=N'CrashID'; 
;





/* Drop table warehouse.DimDate */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'warehouse.DimDate') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE warehouse.DimDate 
;

/* Create table warehouse.DimDate */
CREATE TABLE warehouse.DimDate (
   [DateKey]  bigint  NOT NULL
,  [Date]  datetime2   NOT NULL
,  [Hour]  int   NOT NULL
,  [DayOfWeek]  varchar(50)   NOT NULL
,  [DayOfWeekNumber]  int   NULL
,  [Day]  int   NOT NULL
,  [Month]  int   NOT NULL
,  [Year] int not null
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime   NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
,  [InsertAuditKey]  int   NULL
,  [UpdateAuditKey]  int   NULL
, CONSTRAINT [PK_warehouse.DimDate] PRIMARY KEY CLUSTERED 
( [DateKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimDate', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimDate
;


INSERT INTO warehouse.DimDate
(DateKey, [Date], [Hour], [DayOfWeek], DayOfWeekNumber, [Day], [Month], [Year], RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES
(-1, GETDATE(), 0, 'Unknown', 1, 1, 1, 1,'Y', '1899-12-31', '9999-12-31', 'N/A', -1, -1);

;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Hour', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Hour'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfWeek', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfWeekNumber', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeekNumber'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Day'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Month', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Hour'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Day'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Hour'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Day'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Hour'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeekNumber'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Day'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Hour'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeekNumber'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Day'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Hour'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeekNumber'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Day'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'crash_event', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'crash_date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DATEPART(HOUR, [crash_date])', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Hour'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DATENAME(WEEKDAY, [crash_date])', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DATEPART(WEEKDAY, [crash_date])', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeekNumber'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DAY([crash_date])', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Day'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DATEPART(MONTH,[crash_date])', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Hour'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Day'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
;





/* Drop table warehouse.DimLighting */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'warehouse.DimLighting') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE warehouse.DimLighting 
;

/* Create table warehouse.DimLighting */
CREATE TABLE warehouse.DimLighting (
   [LightingKey]  int IDENTITY  NOT NULL
,  [LightingID]  int   NOT NULL
,  [Lighting]  varchar(50)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime   NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
,  [InsertAuditKey]  int   NULL
,  [UpdateAuditKey]  int   NULL
, CONSTRAINT [PK_warehouse.DimLighting] PRIMARY KEY CLUSTERED 
( [LightingKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimLighting
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimLighting', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimLighting
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimLighting
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimLighting
;

SET IDENTITY_INSERT warehouse.DimLighting ON
;
INSERT INTO warehouse.DimLighting (LightingKey, LightingID, Lighting, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, -1, 'Unk Attribute1', 'Y', '12/31/1899', '12/31/9999', 'N/A', -1, -1)
;
SET IDENTITY_INSERT warehouse.DimLighting OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'LightingKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'LightingID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'LightingID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Lighting', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'Lighting'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'LightingID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'Lighting'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'LightingID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'Lighting'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'LightingKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'LightingID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'Lighting'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'LightingID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'Lighting'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'lighting', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'LightingID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'lighting', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'Lighting'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'lighting_id', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'LightingID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'lighting', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'Lighting'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'LightingID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimLighting', @level2type=N'COLUMN', @level2name=N'Lighting'; 
;





/* Drop table warehouse.DimWeather */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'warehouse.DimWeather') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE warehouse.DimWeather 
;

/* Create table warehouse.DimWeather */
CREATE TABLE warehouse.DimWeather (
   [WeatherKey]  int IDENTITY  NOT NULL
,  [WeatherID]  int   NOT NULL
,  [Weather]  varchar(50)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime   NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
,  [InsertAuditKey]  int   NULL
,  [UpdateAuditKey]  int   NULL
, CONSTRAINT [PK_warehouse.DimWeather] PRIMARY KEY CLUSTERED 
( [WeatherKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimWeather
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimWeather', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimWeather
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimWeather
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimWeather
;

SET IDENTITY_INSERT warehouse.DimWeather ON
;
INSERT INTO warehouse.DimWeather (WeatherKey, WeatherID, Weather, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, -1, 'Unk Attribute1', 'Y', '12/31/1899', '12/31/9999', 'N/A', -1, -1)
;
SET IDENTITY_INSERT warehouse.DimWeather OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeatherKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeatherID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Weather', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Weather'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Weather'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Weather'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Weather'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Weather'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'weather', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'weather', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Weather'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'weather_id', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'weather', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Weather'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Weather'; 
;





/* Drop table warehouse.DimTrafficControlDevice */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'warehouse.DimTrafficControlDevice') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE warehouse.DimTrafficControlDevice 
;

/* Create table warehouse.DimTrafficControlDevice */
CREATE TABLE warehouse.DimTrafficControlDevice (
   [ControlDeviceKey]  int IDENTITY  NOT NULL
,  [ControlDeviceID]  int   NOT NULL
,  [TrafficControlDivice]  varchar(60)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime   NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
,  [InsertAuditKey]  int   NULL
,  [UpdateAuditKey]  int   NULL
, CONSTRAINT [PK_warehouse.DimTrafficControlDevice] PRIMARY KEY CLUSTERED 
( [ControlDeviceKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimTrafficControlDevice
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimTrafficControlDevice', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimTrafficControlDevice
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimTrafficControlDevice
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimTrafficControlDevice
;

SET IDENTITY_INSERT warehouse.DimTrafficControlDevice ON
;
INSERT INTO warehouse.DimTrafficControlDevice (ControlDeviceKey, ControlDeviceID, TrafficControlDivice, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, -1, 'Unk Attribute1', 'Y', '12/31/1899', '12/31/9999', 'N/A', -1, -1)
;
SET IDENTITY_INSERT warehouse.DimTrafficControlDevice OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ControlDeviceKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'ControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ControlDeviceID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'ControlDeviceID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrafficControlDivice', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'TrafficControlDivice'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'ControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'ControlDeviceID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'TrafficControlDivice'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'ControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'ControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'ControlDeviceID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'TrafficControlDivice'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'ControlDeviceKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'ControlDeviceID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'TrafficControlDivice'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'ControlDeviceID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'TrafficControlDivice'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'traffic_control_device', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'ControlDeviceID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'traffic_control_device', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'TrafficControlDivice'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'control_device_id', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'ControlDeviceID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'control_device', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'TrafficControlDivice'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'ControlDeviceID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficControlDevice', @level2type=N'COLUMN', @level2name=N'TrafficControlDivice'; 
;





/* Drop table warehouse.DimAlignment */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'warehouse.DimAlignment') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE warehouse.DimAlignment 
;

/* Create table warehouse.DimAlignment */
CREATE TABLE warehouse.DimAlignment (
   [AlignmentKey]  int IDENTITY  NOT NULL
,  [AlignmentID]  int   NOT NULL
,  [Alignment]  varchar(60)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime   NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
,  [InsertAuditKey]  int   NULL
,  [UpdateAuditKey]  int   NULL
, CONSTRAINT [PK_warehouse.DimAlignment] PRIMARY KEY CLUSTERED 
( [AlignmentKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimAlignment
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimAlignment', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimAlignment
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimAlignment
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimAlignment
;

SET IDENTITY_INSERT warehouse.DimAlignment ON
;
INSERT INTO warehouse.DimAlignment (AlignmentKey, AlignmentID, Alignment, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, -1, 'Unk Attribute1', 'Y', '12/31/1899', '12/31/9999', 'N/A', -1, -1)
;
SET IDENTITY_INSERT warehouse.DimAlignment OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AlignmentKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AlignmentID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'AlignmentID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Alignment', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'Alignment'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'AlignmentID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'Alignment'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'AlignmentID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'Alignment'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'AlignmentKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'AlignmentID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'Alignment'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'AlignmentID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'Alignment'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'alignment', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'AlignmentID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'alignment', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'Alignment'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'alignment_id', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'AlignmentID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'alignment', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'Alignment'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'AlignmentID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimAlignment', @level2type=N'COLUMN', @level2name=N'Alignment'; 
;





/* Drop table warehouse.DimCrashType */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'warehouse.DimCrashType') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE warehouse.DimCrashType 
;

/* Create table warehouse.DimCrashType */
CREATE TABLE warehouse.DimCrashType (
   [CrashTypeKey]  int IDENTITY  NOT NULL
,  [CrashTypeID]  int   NOT NULL
,  [CrashType]  varchar(100)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime   NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
,  [InsertAuditKey]  int   NULL
,  [UpdateAuditKey]  int   NULL
, CONSTRAINT [PK_warehouse.DimCrashType] PRIMARY KEY CLUSTERED 
( [CrashTypeKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimCrashType
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimCrashType', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimCrashType
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimCrashType
;

SET IDENTITY_INSERT warehouse.DimCrashType ON
;
INSERT INTO warehouse.DimCrashType (CrashTypeKey, CrashTypeID, CrashType, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, -1, 'Unk Attribute1', 'Y', '12/31/1899', '12/31/9999', 'N/A', -1, -1)
;
SET IDENTITY_INSERT warehouse.DimCrashType OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CrashTypeKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CrashTypeID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashTypeID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CrashType', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashType'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashTypeID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashType'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashTypeID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashType'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashType'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashType'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'first_crash_type', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'first_crash_type', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashType'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'firt_crash_type_id', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'first_crash_type', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashType'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimCrashType', @level2type=N'COLUMN', @level2name=N'CrashType'; 
;





/* Drop table warehouse.DimTrafficWayType */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'warehouse.DimTrafficWayType') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE warehouse.DimTrafficWayType 
;

/* Create table warehouse.DimTrafficWayType */
CREATE TABLE warehouse.DimTrafficWayType (
   [TrafficWayTypeKey]  int IDENTITY  NOT NULL
,  [TrafficWayTypeID]  int   NOT NULL
,  [TrafficWayType]  varchar(100)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime   NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
,  [InsertAuditKey]  int   NULL
,  [UpdateAuditKey]  int   NULL
, CONSTRAINT [PK_warehouse.DimTrafficWayType] PRIMARY KEY CLUSTERED 
( [TrafficWayTypeKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimTrafficWayType
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimTrafficWayType', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimTrafficWayType
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimTrafficWayType
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimTrafficWayType
;

SET IDENTITY_INSERT warehouse.DimTrafficWayType ON
;
INSERT INTO warehouse.DimTrafficWayType (TrafficWayTypeKey, TrafficWayTypeID, TrafficWayType, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, -1, 'Unk Attribute1', 'Y', '12/31/1899', '12/31/9999', 'N/A', -1, -1)
;
SET IDENTITY_INSERT warehouse.DimTrafficWayType OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrafficWayTypeKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrafficWayTypeID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrafficWayType', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayType'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayType'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayType'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayType'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayType'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'traffic_way_type', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'traffic_way_type', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayType'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'way_type_id', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'traffic_way_type', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayType'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimTrafficWayType', @level2type=N'COLUMN', @level2name=N'TrafficWayType'; 
;





/* Drop table warehouse.DimRoadWayDefect */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'warehouse.DimRoadWayDefect') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE warehouse.DimRoadWayDefect 
;

/* Create table warehouse.DimRoadWayDefect */
CREATE TABLE warehouse.DimRoadWayDefect (
   [RoadWayDefectKey]  int IDENTITY  NOT NULL
,  [RoadWayDefectID]  int   NOT NULL
,  [RoadWayDefect]  varchar(20)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime   NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
,  [InsertAuditKey]  int   NULL
,  [UpdateAuditKey]  int   NULL
, CONSTRAINT [PK_warehouse.DimRoadWayDefect] PRIMARY KEY CLUSTERED 
( [RoadWayDefectKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimRoadWayDefect
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimRoadWayDefect', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimRoadWayDefect
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimRoadWayDefect
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimRoadWayDefect
;

SET IDENTITY_INSERT warehouse.DimRoadWayDefect ON
;
INSERT INTO warehouse.DimRoadWayDefect (RoadWayDefectKey, RoadWayDefectID, RoadWayDefect, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, -1, 'Unk Attribute1', 'Y', '12/31/1899', '12/31/9999', 'N/A', -1, -1)
;
SET IDENTITY_INSERT warehouse.DimRoadWayDefect OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadWayDefectKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadWayDefectID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefectID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadWayDefect', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefect'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefectID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefect'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefectID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefect'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefectKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefectID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefect'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefectID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefect'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'roadway_defect', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefectID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'roadway_defect', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefect'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'road_defect_id', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefectID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'road_defect', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefect'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefectID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWayDefect', @level2type=N'COLUMN', @level2name=N'RoadWayDefect'; 
;





/* Drop table warehouse.DimContributoryCause */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'warehouse.DimContributoryCause') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE warehouse.DimContributoryCause 
;

/* Create table warehouse.DimContributoryCause */
CREATE TABLE warehouse.DimContributoryCause (
   [ContributoryCauseKey]  int IDENTITY  NOT NULL
,  [ContributoryCauseID]  int   NOT NULL
,  [PrimContributoryCause]  varchar(100)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime   NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
,  [InsertAuditKey]  int   NULL
,  [UpdateAuditKey]  int   NULL
, CONSTRAINT [PK_warehouse.DimContributoryCause] PRIMARY KEY CLUSTERED 
( [ContributoryCauseKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimContributoryCause
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimContributoryCause', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimContributoryCause
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimContributoryCause
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimContributoryCause
;

SET IDENTITY_INSERT warehouse.DimContributoryCause ON
;
INSERT INTO warehouse.DimContributoryCause (ContributoryCauseKey, ContributoryCauseID, PrimContributoryCause, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, -1, 'Unk Attribute1', 'Y', '12/31/1899', '12/31/9999', 'N/A', -1, -1)
;
SET IDENTITY_INSERT warehouse.DimContributoryCause OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Blank Dim Key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Blank Dim ID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute1', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'PrimContributoryCause'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'PrimContributoryCause'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'PrimContributoryCause'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'PrimContributoryCause'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'PrimContributoryCause'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'contributory_cause', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'contributory_cause', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'PrimContributoryCause'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'cause_id', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'prim_contributory_cause', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'PrimContributoryCause'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'ContributoryCauseID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimContributoryCause', @level2type=N'COLUMN', @level2name=N'PrimContributoryCause'; 
;





/* Drop table warehouse.DimRoadWaySurface */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'warehouse.DimRoadWaySurface') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE warehouse.DimRoadWaySurface 
;

/* Create table warehouse.DimRoadWaySurface */
CREATE TABLE warehouse.DimRoadWaySurface (
   [RoadWaySurfaceKey]  int IDENTITY  NOT NULL
,  [RoadWaySurfaceID]  int   NOT NULL
,  [RoadWaySurface]  varchar(50)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime   NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
,  [InsertAuditKey]  int   NULL
,  [UpdateAuditKey]  int   NULL
, CONSTRAINT [PK_warehouse.DimRoadWaySurface] PRIMARY KEY CLUSTERED 
( [RoadWaySurfaceKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimRoadWaySurface
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimRoadWaySurface', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimRoadWaySurface
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimRoadWaySurface
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=warehouse, @level1type=N'TABLE', @level1name=DimRoadWaySurface
;

SET IDENTITY_INSERT warehouse.DimRoadWaySurface ON
;
INSERT INTO warehouse.DimRoadWaySurface (RoadWaySurfaceKey, RoadWaySurfaceID, RoadWaySurface, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, -1, 'Unk Attribute1', 'Y', '12/31/1899', '12/31/9999', 'N/A', -1, -1)
;
SET IDENTITY_INSERT warehouse.DimRoadWaySurface OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadWaySurfaceKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadWaySurfaceID', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadWaySurface', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurface'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurface'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurface'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'TrafficAccidents', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurface'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'warehouse', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurface'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'roadway_surface', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'roadway_surface', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurface'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'road_surface_id', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'road_surface', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurface'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurfaceID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'warehouse', @level1type=N'TABLE', @level1name=N'DimRoadWaySurface', @level2type=N'COLUMN', @level2name=N'RoadWaySurface'; 
;
ALTER TABLE warehouse.DimAudit ADD CONSTRAINT
   FK_warehouse_DimAudit_ParentAuditKey FOREIGN KEY
   (
   ParentAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.FactTime ADD CONSTRAINT
   FK_warehouse_FactTime_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.FactTime ADD CONSTRAINT
   FK_warehouse_FactTime_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.FactTime ADD CONSTRAINT
   FK_warehouse_FactTime_DateKey FOREIGN KEY
   (
   DateKey
   ) REFERENCES warehouse.DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
 ALTER TABLE warehouse.FactTime ADD CONSTRAINT
   FK_warehouse_FactTime_CrashTypeKey FOREIGN KEY
  (
   CrashTypeKey
   ) REFERENCES warehouse.DimCrashType
   ( CrashTypeKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
ALTER TABLE warehouse.FactCause ADD CONSTRAINT
   FK_warehouse_FactCause_LightingKey FOREIGN KEY
   (
   LightingKey
   ) REFERENCES warehouse.DimLighting
   ( LightingKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.FactCause ADD CONSTRAINT
   FK_warehouse_FactCause_WeatherKey FOREIGN KEY
   (
   WeatherKey
   ) REFERENCES warehouse.DimWeather
   ( WeatherKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.FactCause ADD CONSTRAINT
   FK_warehouse_FactCause_TrafficControlDeviceKey FOREIGN KEY
   (
   TrafficControlDeviceKey
   ) REFERENCES warehouse.DimTrafficControlDevice
   ( ControlDeviceKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.FactCause ADD CONSTRAINT
   FK_warehouse_FactCause_AlignmentKey FOREIGN KEY
   (
   AlignmentKey
   ) REFERENCES warehouse.DimAlignment
   ( AlignmentKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.FactCause ADD CONSTRAINT
   FK_warehouse_FactCause_CrashTypeKey FOREIGN KEY
   (
   CrashTypeKey
   ) REFERENCES warehouse.DimCrashType
   ( CrashTypeKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.FactCause ADD CONSTRAINT
   FK_warehouse_FactCause_TrafficWayTypeKey FOREIGN KEY
   (
   TrafficWayTypeKey
   ) REFERENCES warehouse.DimTrafficWayType
   ( TrafficWayTypeKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.FactCause ADD CONSTRAINT
   FK_warehouse_FactCause_RoadWayDefectKey FOREIGN KEY
   (
   RoadWayDefectKey
   ) REFERENCES warehouse.DimRoadWayDefect
   ( RoadWayDefectKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.FactCause ADD CONSTRAINT
   FK_warehouse_FactCause_RoadWaySurfaceKey FOREIGN KEY
   (
   RoadWaySurfaceKey
   ) REFERENCES warehouse.DimRoadWaySurface
   ( RoadWaySurfaceKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.FactCause ADD CONSTRAINT
   FK_warehouse_FactCause_ContributoryCauseKey FOREIGN KEY
   (
   ContributoryCauseKey
   ) REFERENCES warehouse.DimContributoryCause
   ( ContributoryCauseKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.FactCause ADD CONSTRAINT
   FK_warehouse_FactCause_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.FactCause ADD CONSTRAINT
   FK_warehouse_FactCause_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimDate ADD CONSTRAINT
   FK_warehouse_DimDate_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimDate ADD CONSTRAINT
   FK_warehouse_DimDate_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimLighting ADD CONSTRAINT
   FK_warehouse_DimLighting_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimLighting ADD CONSTRAINT
   FK_warehouse_DimLighting_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimWeather ADD CONSTRAINT
   FK_warehouse_DimWeather_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimWeather ADD CONSTRAINT
   FK_warehouse_DimWeather_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimTrafficControlDevice ADD CONSTRAINT
   FK_warehouse_DimTrafficControlDevice_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimTrafficControlDevice ADD CONSTRAINT
   FK_warehouse_DimTrafficControlDevice_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimAlignment ADD CONSTRAINT
   FK_warehouse_DimAlignment_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimAlignment ADD CONSTRAINT
   FK_warehouse_DimAlignment_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimCrashType ADD CONSTRAINT
   FK_warehouse_DimCrashType_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimCrashType ADD CONSTRAINT
   FK_warehouse_DimCrashType_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimTrafficWayType ADD CONSTRAINT
   FK_warehouse_DimTrafficWayType_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimTrafficWayType ADD CONSTRAINT
   FK_warehouse_DimTrafficWayType_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimRoadWayDefect ADD CONSTRAINT
   FK_warehouse_DimRoadWayDefect_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimRoadWayDefect ADD CONSTRAINT
   FK_warehouse_DimRoadWayDefect_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimContributoryCause ADD CONSTRAINT
   FK_warehouse_DimContributoryCause_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimContributoryCause ADD CONSTRAINT
   FK_warehouse_DimContributoryCause_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimRoadWaySurface ADD CONSTRAINT
   FK_warehouse_DimRoadWaySurface_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE warehouse.DimRoadWaySurface ADD CONSTRAINT
   FK_warehouse_DimRoadWaySurface_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES warehouse.DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 

Create database TrafficAccidentsStage
go
use TrafficAccidentsStage
go
create schema stage
go
--staging DimAlignment
select 
alignment_id as AlignmentID,
alignment as Alignment
into TrafficAccidentsStage.stage.AlignmentStage
from TrafficAccidents.dbo.alignment

-- staging Dim ContributoryCause
select 
cause_id as ContributoryCauseID,
prim_contributory_cause as PrimContributoryCause
into TrafficAccidentsStage.stage.ContributoryCauseStage
from TrafficAccidents.dbo.contributory_cause

-- staging CrashType
select
first_crash_type_id as CrashTypeID,
first_crash_type as CrashType
into TrafficAccidentsStage.stage.CrashTypeStage
from TrafficAccidents.dbo.first_crash_type

--staging Date
select DISTINCT 
crash_date as Date
into TrafficAccidentsStage.stage.[Date]
from TrafficAccidents.dbo.crash_event

--staging Lighting
select 
lighting_id as LightingID,
lighting as Lighting
into TrafficAccidentsStage.stage.Lighting
from TrafficAccidents.dbo.lighting

--staging RoadWayDefect
select
road_defect_id as RoadwayDefectID,
road_defect as RoadwayDefect
into TrafficAccidentsStage.stage.RoadwayDefect
from TrafficAccidents.dbo.roadway_defect

-- staging RoadwaySurface
select 
road_surface_id as RoadwaySurfaceID,
road_surface as RoadwaySurface
into TrafficAccidentsStage.stage.RoadwaySurface
from TrafficAccidents.dbo.roadway_surface

-- Staging TrafficControlDevice
select
control_device_id as ControlDeviceID,
control_device as ControlDevice
into TrafficAccidentsStage.stage.TrafficControlDivice
from TrafficAccidents.dbo.traffic_control_device

-- staging TrafficWayType
select
way_type_id as TrafficWayTypeID,
traffic_way_type as TrafficWaytype
into TrafficAccidentsStage.stage.TrafficWayType
from TrafficAccidents.dbo.traffic_way_type

-- staging Weather
select
weather_id as WeatherID,
weather as Weather
into TrafficAccidentsStage.stage.Weather
from TrafficAccidents.dbo.weather

-- staging FactTime
select 
crash_id as CrashID,
crash_date as Date,
first_crash_type_id as CrashTypeID,
injuries_total as InjuriesTotal,
injuries_fatal as InjuriesFatal,
injuries_incapacitating as InjuriesIncapacitating,
injuries_non_incapacitating as InjuriesNonIncapacitating,
damge_level as DameLevel,
number_units as NumberUnits,
most_severe_injury as MostSevereUnjury
into TrafficAccidentsStage.stage.FactTime
from TrafficAccidents.dbo.crash_event

--- stagin FactCause
select 
crash_id as CrashID,
lighting_id as LightingID,
weather_id as WeatherID,
control_device_id as ControlDeviceID,
alignment_id as AlignmentID,
first_crash_type_id as CrashTypeID,
traffic_way_id as TrafficWayTypeID,
road_defect_id as RoadwayDefectID,
road_surface_id as RoadwaySurfaceID,
cause_id as ContributoryCauseID
into TrafficAccidentsStage.stage.FactCause
from TrafficAccidents.dbo.crash_event
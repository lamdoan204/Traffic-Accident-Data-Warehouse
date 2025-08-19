use TrafficAccidentsDW
go

-- DimAlignment
insert into warehouse.DimAlignment(AlignmentID, Alignment)
select 
AlignmentID,
Alignment
from TrafficAccidentsStage.stage.AlignmentStage

-- Dim ContributoryCause
insert into warehouse.DimContributoryCause(ContributoryCauseID, PrimContributoryCause)
select
ContributoryCauseID,
PrimContributoryCause
from TrafficAccidentsStage.stage.ContributoryCauseStage

-- DimCrashType

insert into warehouse.DimCrashType(CrashTypeID, CrashType)
select
CrashTypeID,
CrashType
from TrafficAccidentsStage.stage.CrashTypeStage

-- DimLighting
insert into warehouse.DimLighting(LightingID, Lighting)
select
LightingID,
Lighting
from TrafficAccidentsStage.stage.Lighting

-- DimRoadWayDefect
insert into warehouse.DimRoadWayDefect(RoadWayDefectID, RoadWayDefect)
select
RoadwayDefectID,
RoadwayDefect
from TrafficAccidentsStage.stage.RoadwayDefect

--DimRoadWaySurface
insert into warehouse.DimRoadWaySurface(RoadWaySurfaceID, RoadWaySurface)
select
RoadwaySurfaceID,
RoadwaySurface
from TrafficAccidentsStage.stage.RoadwaySurface

-- DimTrafficControlDevice
insert into warehouse.DimTrafficControlDevice(ControlDeviceID, TrafficControlDivice)
select
ControlDeviceID,
ControlDevice
from TrafficAccidentsStage.stage.TrafficControlDivice

--DimTrafficwayType
insert into warehouse.DimTrafficWayType(TrafficWayTypeID, TrafficWayType)
select
TrafficWayTypeID,
TrafficWayType
from TrafficAccidentsStage.stage.TrafficWayType

--DimWeather
insert into warehouse.DimWeather(WeatherID, Weather)
select
WeatherID,
Weather
from TrafficAccidentsStage.stage.Weather

-- DimDate
insert into warehouse.DimDate(DateKey, [Date], [Hour], [DayOfWeek], [DayOfWeekNumber],[Day], [Month], [Year])
select
CAST(
        RIGHT('0' + CAST(DATEPART(YEAR, [Date]) % 100 AS VARCHAR), 2) +
        RIGHT('0' + CAST(DATEPART(MONTH, [Date]) AS VARCHAR), 2) +
        RIGHT('0' + CAST(DATEPART(DAY, [Date]) AS VARCHAR), 2) +
        RIGHT('0' + CAST(DATEPART(HOUR, [Date]) AS VARCHAR), 2)
    AS BIGINT) AS DateKey,
    [Date],
    DATEPART(HOUR, [Date]) AS [Hour],
    DATENAME(WEEKDAY, [Date]) AS [DayOfWeek],
    DATEPART(WEEKDAY, [Date]) AS [DayOfWeekNumber],
	DatePart(Day, [Date]) As Day ,
    DATEPART(MONTH, [Date]) AS [Month],
	DATEPART(YEAR, [DATE]) AS [Year]
from TrafficAccidentsStage.stage.[Date] 

-- FactTime
insert into warehouse.FactTime(CrashID, DateKey, CrashTypeKey, InjuriesTotal, InjuriesFatal, InjuriesIncapacitating, InjuriesNonIncapacitating, DameLevel, NumberUnits,	MostSevereInjury)
select
CrashID,
CAST(
        RIGHT('0' + CAST(DATEPART(YEAR, [Date]) % 100 AS VARCHAR), 2) +
        RIGHT('0' + CAST(DATEPART(MONTH, [Date]) AS VARCHAR), 2) +
        RIGHT('0' + CAST(DATEPART(DAY, [Date]) AS VARCHAR), 2) +
        RIGHT('0' + CAST(DATEPART(HOUR, [Date]) AS VARCHAR), 2)
    AS BIGINT) AS DateKey,
CT.CrashTypeKey,
InjuriesTotal,
InjuriesFatal,
InjuriesIncapacitating,
InjuriesNonIncapacitating,
DameLevel,
NumberUnits,
MostSevereUnjury
from TrafficAccidentsStage.stage.FactTime FT 
join warehouse.DimCrashType CT on FT.CrashTypeID = CT.CrashTypeID 
order by CrashID

--FactCause
INSERT INTO warehouse.FactCause(
    CrashID, 
    LightingKey, 
    WeatherKey, 
    TrafficControlDeviceKey, 
    AlignmentKey, 
    CrashTypeKey, 
    TrafficWayTypeKey, 
    RoadWayDefectKey, 
    RoadWaySurfaceKey, 
    ContributoryCauseKey
)
SELECT 
    FC.CrashID,
    L.LightingKey,
    W.WeatherKey,
    TCD.ControlDeviceKey,
    A.AlignmentKey,
    CT.CrashTypeKey,
    TWT.TrafficWayTypeKey,
    RWD.RoadWayDefectKey,
    RWS.RoadWaySurfaceKey,
    CC.ContributoryCauseKey
FROM TrafficAccidentsStage.stage.FactCause FC
JOIN warehouse.DimLighting L ON FC.LightingID = L.LightingID
JOIN warehouse.DimWeather W ON FC.WeatherID = W.WeatherID
JOIN warehouse.DimTrafficControlDevice TCD ON FC.ControlDeviceID = TCD.ControlDeviceID
JOIN warehouse.DimAlignment A ON FC.AlignmentID = A.AlignmentID
JOIN warehouse.DimCrashType CT ON FC.CrashTypeID = CT.CrashTypeID
JOIN warehouse.DimTrafficWayType TWT ON FC.TrafficWayTypeID = TWT.TrafficWayTypeID
JOIN warehouse.DimRoadWayDefect RWD ON FC.RoadWayDefectID = RWD.RoadWayDefectID
JOIN warehouse.DimRoadWaySurface RWS ON FC.RoadWaySurfaceID = RWS.RoadWaySurfaceID
JOIN warehouse.DimContributoryCause CC ON FC.ContributoryCauseID = CC.ContributoryCauseID
order by CrashID;



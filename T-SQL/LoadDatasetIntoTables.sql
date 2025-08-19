use TrafficAccidents
go

insert into traffic_way_type(traffic_way_type)
select trafficway_type
from Dataset
group by trafficway_type

insert into roadway_defect(road_defect)
select road_defect
from Dataset
group by road_defect

insert into contributory_cause(prim_contributory_cause)
select prim_contributory_cause
from Dataset 
group by prim_contributory_cause

insert into alignment(alignment)
select alignment
from Dataset
group by alignment

insert into roadway_surface(road_surface)
select Dataset.roadway_surface_cond
from Dataset group by roadway_surface_cond

insert into lighting
select Dataset.lighting_condition
from Dataset group by lighting_condition

insert into weather(weather)
select Dataset.weather_condition
from Dataset group by weather_condition

insert into traffic_control_device
select Dataset.traffic_control_device
from Dataset group by traffic_control_device

insert into crash_type(crash_type)
select Dataset.crash_type
from Dataset group by crash_type

insert into first_crash_type
select Dataset.first_crash_type
from Dataset group by first_crash_type
 
insert into crash_event(crash_date, cause_id, lighting_id, weather_id, road_surface_id, road_defect_id, alignment_id, traffic_way_id, first_crash_type_id,
crash_type_id, control_device_id, injuries_total, injuries_incapacitating, injuries_non_incapacitating, injuries_fatal, damge_level, most_severe_injury, number_units)
select 
data.crash_date, 
cc.cause_id, 
l.lighting_id,
w.weather_id,
rs.road_surface_id,
rd.road_defect_id,
a.alignment_id,
tw.way_type_id,
fct.first_crash_type_id,
ct.crash_type_id,
tcd.control_device_id,
data.injuries_total,
data.injuries_incapacitating,
data.injuries_non_incapacitating,
data.injuries_fatal,
data.damage,
data.most_severe_injury,
data.num_units
from Dataset data join contributory_cause cc on data.prim_contributory_cause = cc.prim_contributory_cause
join lighting l on data.lighting_condition = l.lighting
join weather w on data.weather_condition = w.weather
join roadway_surface rs on data.roadway_surface_cond = rs.road_surface
join roadway_defect rd on data.road_defect = rd.road_defect
join alignment a on data.alignment = a.alignment
join traffic_way_type tw on data.trafficway_type = tw.traffic_way_type
join first_crash_type fct on data.first_crash_type = fct.first_crash_type
join crash_type ct on data.crash_type = ct.crash_type 
join traffic_control_device tcd on data.traffic_control_device = tcd.control_device
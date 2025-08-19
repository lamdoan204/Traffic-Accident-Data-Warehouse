use TrafficAccidents
go
-- tình trạng mặt đường
create table roadway_surface(
	road_surface_id int Identity(1,1) primary key,
	road_surface varchar(20)
)
-- tình trạng khiếm khuyết đường
create table roadway_defect(
	road_defect_id int identity(1,1) primary key,
	road_defect varchar(20)
)
-- nguyên nhân xảy ra tai nạn
create table contributory_cause(
	cause_id int identity(1,1) primary key,
	prim_contributory_cause nvarchar(100)
)
-- ánh sáng: thiếu sáng, đầy đủ sáng
create table lighting(
	lighting_id int identity(1,1) primary key,
	lighting varchar(60)
)
-- thời tiết: clear, nhiều mây
create table weather(
	weather_id int identity(1,1) primary key,
	weather varchar(50)
)
-- cách 2 xe va chạm: đâm 1 bên, đâm phía sau
create table first_crash_type(
	first_crash_type_id int identity primary key,
	first_crash_type varchar(100)
)
-- sau khi va chạm thì có người bị thương / tow due to crash, không có người bị thương / drive away 
create table crash_type(
	crash_type_id int identity(1,1) primary key,
	crash_type varchar(100)
)
-- hướng hoặc cấu trúc của đường: đường thẳng , cua
create table alignment(
	alignment_id int identity(1,1) primary key,
	alignment varchar(100)
) 
-- thiết bị điều khiển giao thông: đền giao thông
create table traffic_control_device(
	control_device_id int identity(1,1) primary key,
	control_device varchar(100)
)
-- loại đường : ngã tư, cao tốc, ngã ba, 1 chiều,...
create table traffic_way_type(
	way_type_id int identity(1,1) primary key,
	traffic_way_type varchar(100)
)
-- bảng sự kiện tai nạn
create table crash_event(
	crash_id int identity(1,1) primary key,
	crash_date datetime2,

	cause_id int,
	lighting_id int,
	weather_id int, 
	road_surface_id int,
	road_defect_id int,
	alignment_id int,
	traffic_way_id int,
	first_crash_type_id int,
	crash_type_id int,
	control_device_id int,

	injuries_total int, -- tổng số người bị thương
	injuries_incapacitating varchar(50), -- tổng số người bị thương mất khả năng lao động trong vụ tai nạn
	injuries_non_incapacitating varchar(50), -- tổng số người bị thương không mất khả năng lao động trong vụ tai nạn
	injuries_fatal int, -- tổng số người chết trong vụ tai nạn
	damge_level varchar(20), -- mức độ thiệt hại
	most_severe_injury varchar(50), -- thương tích nghiệm trong nhất trong vụ tai nạn
	number_units int,

	-- khóa ngoại
	foreign key (cause_id) references contributory_cause(cause_id) ,
	foreign key (lighting_id) references lighting(lighting_id) ,
	foreign key (weather_id) references weather(weather_id) ,
	foreign key (road_surface_id) references roadway_surface(road_surface_id) ,
	foreign key (road_defect_id) references roadway_defect(road_defect_id) ,
	foreign key (cause_id) references contributory_cause(cause_id) ,
	foreign key (alignment_id) references alignment(alignment_id) ,
	foreign key (traffic_way_id) references traffic_way_type(way_type_id),
	foreign key (first_crash_type_id) references first_crash_type(first_crash_type_id) ,
	foreign key (crash_type_id) references crash_type(crash_type_id),
	foreign key (control_device_id) references traffic_control_device(control_device_id)
)
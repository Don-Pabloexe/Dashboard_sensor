-- Crear la base de datos
CREATE DATABASE dashboard_sensor;

-- Usar la base de datos recién creada
USE dashboard_sensor;

-- Crear la tabla sensors sin PRIMARY KEY ni UNIQUE constraint
CREATE TABLE sensors (
    sensor_id INT NOT NULL, -- Identificador del sensor (permite repetidos)
    type VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL,
    timestamp DATETIME NOT NULL,
    distance INT,
    object_type VARCHAR(50),
    event_duration INT,
    field_intensity DECIMAL(10,2),
    temperature INT,
    voltage INT
);







INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('proximity','active','2025-01-01 12:00:00',15.0,'metal',20.0,120.0,40.0,13.0),
	 ('proximity','inactive','2025-01-01 13:30:00',NULL,NULL,NULL,110.0,38.0,12.8),
	 ('induction','active','2025-01-15 11:00:00',15.0,'ferrous',10.0,120.5,32.0,11.8),
	 ('induction','inactive','2025-01-15 11:10:00',NULL,NULL,NULL,NULL,31.0,12.1),
	 ('proximity','active','2025-01-02 08:00:00',3.5,'wood',12.0,0.0,32.0,11.5),
	 ('proximity','inactive','2025-01-02 09:15:00',4.0,NULL,6.0,0.0,33.0,11.6),
	 ('induction','active','2025-01-02 10:00:00',12.0,'metal',15.0,130.0,39.0,13.5),
	 ('induction','inactive','2025-01-02 11:45:00',NULL,NULL,NULL,125.0,37.5,13.0),
	 ('proximity','active','2025-01-15 10:05:00',NULL,NULL,NULL,NULL,29.8,12.0),
	 ('proximity','active','2025-01-27 12:00:00',15.6,NULL,NULL,NULL,NULL,4.8);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('proximity','active','2025-01-27 12:01:00',16.2,NULL,NULL,NULL,NULL,4.9),
	 ('proximity','inactive','2025-01-27 12:02:00',NULL,NULL,NULL,NULL,NULL,0.0),
	 ('proximity','active','2025-01-27 12:03:00',14.8,NULL,NULL,NULL,NULL,4.7),
	 ('proximity','active','2025-01-27 12:04:00',15.0,NULL,NULL,NULL,NULL,4.8),
	 ('proximity','active','2025-01-27 12:05:00',14.5,NULL,NULL,NULL,NULL,4.8),
	 ('proximity','active','2025-01-27 12:06:00',18.3,NULL,NULL,NULL,NULL,4.9),
	 ('proximity','active','2025-01-27 12:07:00',17.8,NULL,NULL,NULL,NULL,4.8),
	 ('proximity','inactive','2025-01-27 12:08:00',NULL,NULL,NULL,NULL,NULL,0.0),
	 ('proximity','active','2025-01-27 12:09:00',20.4,NULL,NULL,NULL,NULL,5.0),
	 ('proximity','active','2025-01-27 12:10:00',19.6,NULL,NULL,NULL,NULL,4.9);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('proximity','active','2025-01-27 12:11:00',18.5,NULL,NULL,NULL,NULL,4.8),
	 ('proximity','active','2025-01-27 12:12:00',25.0,NULL,NULL,NULL,NULL,5.1),
	 ('proximity','active','2025-01-27 12:13:00',24.3,NULL,NULL,NULL,NULL,5.0),
	 ('proximity','inactive','2025-01-27 12:14:00',NULL,NULL,NULL,NULL,NULL,0.0),
	 ('proximity','active','2025-01-27 12:15:00',23.8,NULL,NULL,NULL,NULL,5.0),
	 ('proximity','active','2025-01-27 12:16:00',24.5,NULL,NULL,NULL,NULL,5.1),
	 ('proximity','active','2025-01-27 12:17:00',24.0,NULL,NULL,NULL,NULL,5.0),
	 ('proximity','active','2025-01-27 12:18:00',13.2,NULL,NULL,NULL,NULL,4.6),
	 ('proximity','active','2025-01-27 12:19:00',14.1,NULL,NULL,NULL,NULL,4.7),
	 ('proximity','inactive','2025-01-27 12:20:00',NULL,NULL,NULL,NULL,NULL,0.0);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('proximity','active','2025-01-27 12:21:00',14.9,NULL,NULL,NULL,NULL,4.8),
	 ('proximity','active','2025-01-27 12:22:00',15.3,NULL,NULL,NULL,NULL,4.9),
	 ('proximity','active','2025-01-27 12:23:00',18.7,NULL,NULL,NULL,NULL,4.8),
	 ('proximity','active','2025-01-27 12:24:00',19.2,NULL,NULL,NULL,NULL,4.9),
	 ('proximity','inactive','2025-01-27 12:25:00',NULL,NULL,NULL,NULL,NULL,0.0),
	 ('proximity','active','2025-01-27 12:26:00',20.1,NULL,NULL,NULL,NULL,5.0),
	 ('proximity','active','2025-01-27 12:27:00',24.9,NULL,NULL,NULL,NULL,5.1),
	 ('proximity','active','2025-01-27 12:28:00',25.4,NULL,NULL,NULL,NULL,5.1),
	 ('proximity','inactive','2025-01-27 12:29:00',NULL,NULL,NULL,NULL,NULL,0.0),
	 ('ultrasonic','active','2025-01-28 18:40:19.3028',8.672511577606201,NULL,1.06,NULL,21.31,5.0);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('ultrasonic','active','2025-01-28 18:40:20.343954',8.680689334869385,NULL,1.06,NULL,27.48,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:21.39515',8.680689334869385,NULL,1.06,NULL,22.29,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:22.43669',8.684778213500977,NULL,1.06,NULL,26.7,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:23.464936',8.680689334869385,NULL,1.06,NULL,28.19,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:24.495762',7.376337051391602,NULL,1.02,NULL,26.98,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:25.553001',17.762088775634766,NULL,1.62,NULL,22.31,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:26.580761',133.4323763847351,NULL,8.37,NULL,24.42,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:27.737542',2204.3390035629272,NULL,129.12,NULL,20.39,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:28.895212',2214.017379283905,NULL,129.65,NULL,26.32,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:30.07183',2213.3917808532715,NULL,129.61,NULL,26.61,5.0);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('ultrasonic','active','2025-01-28 18:40:31.142599',303.9508819580078,NULL,18.28,NULL,29.69,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:32.167891',302.7528405189514,NULL,18.21,NULL,28.73,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:33.2379',241.57094955444336,NULL,14.67,NULL,29.88,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:34.294899',6.562650203704834,NULL,0.97,NULL,20.49,5.0),
	 ('ultrasonic','active','2025-01-28 18:47:07.380455',7.384514808654785,NULL,1.02,NULL,21.98,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:08.419116',7.413136959075928,NULL,1.02,NULL,26.32,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:09.428525',7.4172258377075195,NULL,1.01,NULL,26.21,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:10.472776',7.3967814445495605,NULL,1.01,NULL,28.04,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:11.512708',7.241404056549072,NULL,1.0,NULL,24.37,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:12.553409',7.339537143707275,NULL,1.01,NULL,29.57,3.3);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('ultrasonic','active','2025-01-28 18:47:13.594857',4.657232761383057,NULL,0.85,NULL,20.12,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:14.624177',3.115725517272949,NULL,0.77,NULL,25.92,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:15.654246',3.4919023513793945,NULL,0.78,NULL,26.4,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:16.682352',3.0952811241149902,NULL,0.76,NULL,28.87,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:17.723331',3.1525254249572754,NULL,0.76,NULL,26.22,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:18.764306',3.406035900115967,NULL,0.78,NULL,25.49,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:19.818258',3.5491466522216797,NULL,0.79,NULL,24.37,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:20.873507',3.6309242248535156,NULL,0.79,NULL,22.22,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:21.888016',3.8394570350646973,NULL,0.81,NULL,29.98,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:22.896264',5.716252326965332,NULL,0.92,NULL,28.53,3.3);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('ultrasonic','active','2025-01-28 18:47:23.92624',6.00656270980835,NULL,0.93,NULL,29.53,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:24.954798',6.00656270980835,NULL,0.93,NULL,21.4,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:26.006599',5.781674385070801,NULL,0.92,NULL,27.49,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:27.047658',6.464517116546631,NULL,0.96,NULL,29.16,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:28.055121',5.450475215911865,NULL,0.91,NULL,26.07,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:29.080356',3.884434700012207,NULL,0.79,NULL,20.11,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:30.130906',6.754827499389648,NULL,0.98,NULL,26.79,3.3),
	 ('induction','inactive','2025-01-27 17:00:16.852235',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-27 17:00:19.883168',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-27 17:00:22.890171',NULL,'metal',3.0,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','active','2025-01-27 17:00:25.930874',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-27 17:00:28.963195',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-27 17:00:32.005038',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-27 17:00:35.03569',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-27 17:00:38.042957',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('ultrasonic','active','2025-01-28 18:40:35.345352',4.9025654792785645,NULL,0.87,NULL,22.69,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:36.394333',3.6963462829589844,NULL,0.8,NULL,24.62,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:37.442407',5.761229991912842,NULL,0.92,NULL,28.43,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:38.451599',5.274653434753418,NULL,0.89,NULL,29.44,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:39.514856',6.534028053283691,NULL,0.97,NULL,27.3,5.0);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('ultrasonic','active','2025-01-28 18:40:40.523682',4.734921455383301,NULL,0.86,NULL,24.83,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:41.538975',3.4714579582214355,NULL,0.79,NULL,23.63,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:42.584951',3.4101247787475586,NULL,0.79,NULL,26.87,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:43.593827',9.212243556976318,NULL,1.12,NULL,28.18,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:44.614941',4.996609687805176,NULL,0.88,NULL,28.28,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:45.623742',5.012965202331543,NULL,0.88,NULL,21.74,5.0),
	 ('ultrasonic','active','2025-01-28 18:40:46.669084',4.612255096435547,NULL,0.85,NULL,29.99,5.0),
	 ('ultrasonic','active','2025-01-28 18:47:31.181707',6.979715824127197,NULL,0.99,NULL,29.96,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:32.212249',7.809758186340332,NULL,1.04,NULL,23.6,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:33.221412',7.69118070602417,NULL,1.04,NULL,21.35,3.3);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('ultrasonic','active','2025-01-28 18:47:34.249573',7.335448265075684,NULL,1.01,NULL,24.56,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:35.283807',7.351803779602051,NULL,1.01,NULL,20.63,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:36.322768',7.335448265075684,NULL,1.01,NULL,28.6,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:37.339012',13.399255275726318,NULL,1.36,NULL,21.34,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:38.367927',11.861836910247803,NULL,1.27,NULL,23.0,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:39.396954',9.596598148345947,NULL,1.14,NULL,26.72,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:40.455448',9.94415283203125,NULL,1.16,NULL,29.15,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:41.465069',9.735620021820068,NULL,1.15,NULL,21.43,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:42.50316',7.081937789916992,NULL,0.99,NULL,23.98,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:43.565844',7.752513885498047,NULL,1.04,NULL,24.39,3.3);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('ultrasonic','active','2025-01-28 18:47:44.574192',10.937750339508057,NULL,1.22,NULL,25.27,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:45.582519',7.3967814445495605,NULL,1.01,NULL,27.53,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:46.634627',8.684778213500977,NULL,1.09,NULL,22.42,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:47.675366',9.882819652557373,NULL,1.16,NULL,29.21,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:48.728241',18.788397312164307,NULL,1.68,NULL,20.78,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:49.745877',137.64392137527466,NULL,8.61,NULL,29.76,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:50.798946',17.623066902160645,NULL,1.61,NULL,28.16,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:51.889385',678.9542078971863,NULL,40.17,NULL,29.74,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:52.9182',22.218966484069824,NULL,1.88,NULL,22.24,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:53.962818',22.88954257965088,NULL,1.92,NULL,27.53,3.3);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('ultrasonic','active','2025-01-28 18:47:54.972419',23.241186141967773,NULL,1.94,NULL,25.97,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:56.013104',22.145366668701172,NULL,1.87,NULL,21.42,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:57.054122',21.32350206375122,NULL,1.82,NULL,21.73,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:58.089791',21.84278964996338,NULL,1.85,NULL,25.81,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:59.166184',740.2178764343262,NULL,43.75,NULL,28.04,3.3),
	 ('ultrasonic','active','2025-01-28 18:48:00.227503',147.92745113372803,NULL,9.21,NULL,27.28,3.3),
	 ('ultrasonic','active','2025-01-28 18:48:01.289323',164.02536630630493,NULL,10.15,NULL,26.11,3.3),
	 ('ultrasonic','active','2025-01-28 18:48:02.470267',2206.244421005249,NULL,129.22,NULL,24.49,3.3),
	 ('ultrasonic','active','2025-01-28 18:48:03.527315',9.866464138031006,NULL,1.13,NULL,20.79,3.3),
	 ('ultrasonic','active','2025-01-28 18:48:04.591759',9.199976921081543,NULL,1.09,NULL,24.0,3.3);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('ultrasonic','active','2025-01-28 18:48:05.629945',7.090115547180176,NULL,0.96,NULL,29.03,3.3),
	 ('ultrasonic','active','2025-01-28 18:48:06.65775',7.4990034103393555,NULL,0.99,NULL,24.95,3.3),
	 ('ultrasonic','active','2025-01-28 18:48:07.683795',7.494914531707764,NULL,1.02,NULL,22.57,3.3),
	 ('induction','active','2025-01-15 10:00:00',20.0,'metal',5.0,NULL,30.5,12.0),
	 ('induction','active','2025-01-01 10:00:00',5.0,'metal',10.0,0.0,35.0,12.0),
	 ('induction','inactive','2025-01-01 11:00:00',6.5,NULL,5.0,0.0,36.0,12.5),
	 ('induction','active','2025-01-02 09:00:00',7.0,'plastic',8.0,0.0,34.5,11.8),
	 ('induction','no metal','2025-01-21 18:36:53.828282',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:36:54.409984',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:36:54.919428',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','no metal','2025-01-21 18:36:55.425557',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:36:55.972821',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:36:56.519587',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:36:57.04539',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:36:57.62003',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:36:58.175588',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:36:58.74282',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:36:59.297264',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:36:59.851715',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:37:00.402283',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','no metal','2025-01-21 18:37:00.909757',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:37:01.416585',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:37:01.971545',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:37:02.478352',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:37:02.985471',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:37:03.49223',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:37:04.000502',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:37:04.550397',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:37:05.104285',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:37:05.629856',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','no metal','2025-01-21 18:37:06.178104',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:37:06.728971',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','no metal','2025-01-21 18:37:07.278734',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:07.829459',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:08.382665',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:08.936047',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:09.48906',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:10.037861',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:10.586817',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:11.140084',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','metal','2025-01-21 18:37:11.659363',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:12.186331',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:12.692669',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:13.199605',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:13.706185',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:14.259698',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:14.766236',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:15.314548',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:15.821327',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:16.351877',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','metal','2025-01-21 18:37:16.878542',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:17.406282',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:17.936518',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:18.469679',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:18.998761',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:19.526934',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:20.052267',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:20.579567',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','metal','2025-01-21 18:37:21.110837',NULL,NULL,NULL,NULL,NULL,NULL),
	 ('induction','inactive','2025-01-21 19:36:07.873496',NULL,'metal',0.5,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','inactive','2025-01-21 19:36:08.384144',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:08.91254',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:09.439434',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:09.945592',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:10.452739',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:10.959234',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:11.516672',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:12.05978',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:12.604784',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:13.154688',NULL,'metal',0.5,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','inactive','2025-01-21 19:36:13.686656',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:14.21897',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:14.728719',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:15.236007',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:15.743779',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:16.250327',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:16.781585',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:17.313117',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:17.820398',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:18.362991',NULL,'metal',0.5,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','inactive','2025-01-21 19:36:18.910501',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:19.417161',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:19.944378',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:20.451565',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:20.975718',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:21.499822',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:22.026058',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:36:22.549854',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:23.079438',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:23.603443',NULL,'metal',0.5,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','active','2025-01-21 19:36:24.127472',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:24.651733',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:25.174937',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:25.698589',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:26.261174',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:26.816481',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:27.373527',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:27.934316',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:28.499474',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:29.067844',NULL,'metal',0.5,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','active','2025-01-21 19:36:29.597693',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:30.10626',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:30.613823',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:31.178905',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:31.744907',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:32.311109',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:32.818102',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:33.378493',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:33.886014',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:34.42551',NULL,'metal',0.5,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','active','2025-01-21 19:36:34.95302',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:35.48009',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:36.013145',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:36.547334',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:37.107826',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:37.634158',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:38.14111',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:38.668053',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:39.20283',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:39.710508',NULL,'metal',0.5,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','active','2025-01-21 19:36:40.234664',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:40.741914',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:41.303468',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:41.834556',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:42.341173',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:42.874842',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:43.411486',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:43.972986',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:44.531205',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:45.038744',NULL,'metal',0.5,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','active','2025-01-21 19:36:45.56567',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:46.072339',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:46.579787',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:47.086739',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:47.617032',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:48.147378',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:48.677565',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:49.18429',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:36:49.690417',NULL,'metal',0.5,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:39:29.978527',NULL,'metal',3.0,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','active','2025-01-21 19:39:33.009465',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:39:36.048169',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:39:39.055112',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:39:42.061723',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:39:45.103988',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:39:48.136546',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:39:51.143398',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:39:54.166021',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:39:57.186869',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:40:00.228856',NULL,'metal',3.0,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','active','2025-01-21 19:40:03.256701',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:40:06.284431',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:41:54.947737',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:41:57.983348',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:42:00.989666',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:42:04.01723',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:42:07.047036',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:42:10.054468',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:42:13.085328',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:42:16.138168',NULL,'metal',3.0,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','active','2025-01-21 19:42:19.148538',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:42:22.155769',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:42:25.198831',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-21 19:42:28.246827',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:42:31.276994',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-21 19:42:34.320087',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-27 17:02:01.681905',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-27 17:02:04.704006',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-27 17:02:07.745426',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-27 17:02:10.798589',NULL,'metal',3.0,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','inactive','2025-01-27 17:02:13.852363',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-27 17:02:16.859183',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-27 17:02:19.885741',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-27 17:02:22.893648',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-27 17:02:25.933806',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-27 17:02:28.961291',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-27 17:02:31.969051',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-27 17:02:35.008335',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','inactive','2025-01-27 17:02:38.034677',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('induction','active','2025-01-27 17:02:41.063255',NULL,'metal',3.0,NULL,25.0,4.5);
INSERT INTO public.sensors ("type",status,"timestamp",distance,object_type,event_duration,field_intensity,temperature,voltage) VALUES
	 ('induction','inactive','2025-01-27 17:02:44.099448',NULL,'metal',3.0,NULL,25.0,4.5),
	 ('ultrasonic','active','2025-01-28 18:47:00.233731',7.388603687286377,NULL,0.98,NULL,24.95,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:01.263538',7.351803779602051,NULL,0.98,NULL,29.49,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:02.270846',7.3967814445495605,NULL,0.98,NULL,20.78,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:03.279805',7.388603687286377,NULL,0.98,NULL,25.43,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:04.289298',7.404959201812744,NULL,0.98,NULL,24.24,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:05.326456',7.400870323181152,NULL,1.01,NULL,28.85,3.3),
	 ('ultrasonic','active','2025-01-28 18:47:06.334739',7.400870323181152,NULL,1.02,NULL,25.87,3.3);



-- para colocar las id de los sensores ya que cuando exporte los datos no los coloco
UPDATE public.sensors
SET sensor_id = 
    CASE 
        WHEN "type" = 'induction' THEN 1
        WHEN "type" IN ('ultrasonic', 'proximity') THEN 2
        ELSE NULL
    END;

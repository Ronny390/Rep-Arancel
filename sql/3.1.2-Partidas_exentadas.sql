CREATE TABLE IF NOT EXISTS partidas_exentadas (
    ID_exencion INT PRIMARY KEY,
    Capitulo INT,
    Partida INT,
    Codigo_subpartida VARCHAR(20),
    Codigo_subpartida_sin_puntos VARCHAR(20),
    Descripcion TEXT
);

INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (1, 1, 101, '0101.21.00.10', '0101210010', 'Para carreras');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (2, 11, 1104, '1104.22.00.10', '1104220010', 'Granos que hayan sido sometidos a estabilizado para la inactivacion de las enzimas despu');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (3, 27, 2710, '2710.12.49.00', '2710124900', 'Las demas');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (4, 27, 2710, '2710.12.49.10', '2710124910', 'Nafta residual derivada del fraccionamiento de los liquidos del gas natural');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (5, 30, 3004, '3004.90.99.43', '3004909943', 'Soluciones que contengan dextrosa, cloruro de sodio, cloruro de potasio, cloruro de calc');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (6, 32, 3214, '3214.10.10.10', '3214101010', 'Acondicionados para la venta al por menor en  envases de peso inferior o igual a 1 kg');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (7, 32, 3214, '3214.10.20.10', '3214102010', 'Acondicionados para la venta al por menor en  envases de peso inferior o igual a 1 kg');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (8, 38, 3824, '3824.99.79.91', '3824997991', 'Los demas abonos que contengan microelementos, excepto los que contengan nitrogeno, fosf');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (9, 39, 3920, '3920.10.99.10', '3920109910', 'Peliculas extensibles de polietileno lineal de baja densidad <Stretch Film>, en rollos d');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (10, 40, 4011, '4011.10.00.14', '4011100014', 'Con ancho superior o igual a 195mm pero inferior o igual 245mm y altura de la seccion tr');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (11, 40, 4016, '4016.92.00.10', '4016920010', 'Destinadas a ser incorporadas a lapices o boligrafos');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (12, 69, 6910, '6910.90.00.11', '6910900011', 'Con pedestal');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (13, 76, 7606, '7606.12.90.90', '7606129090', 'Los demas');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (14, 98, 9808, '9808.00.00.20', '9808000020', 'Vehiculos automoviles para transporte de diez o mas personas, incluido el conductor');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (15, 98, 9808, '9808.00.00.30', '9808000030', 'Automoviles de turismo y demas vehiculos automoviles concebidos principalmente para tran');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (16, 98, 9808, '9808.00.00.40', '9808000040', 'Vehiculos automoviles para transporte de mercancias');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (17, 98, 9808, '9808.00.00.50', '9808000050', 'Vehiculos automoviles para usos especiales, excepto los concebidos principalmente para t');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (18, 98, 9808, '9808.00.00.60', '9808000060', 'Chasis de vehiculos automoviles de las partidas 87.01 a 87.05, equipados con su motor');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (19, 98, 9808, '9808.00.00.70', '9808000070', 'Carrocerias de vehiculos automoviles de las partidas 87.01 a 87.05, incluidas las cabina');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (20, 98, 9808, '9808.00.00.80', '9808000080', 'Carretillas automovil sin dispositivo de elevacion de los tipos utilizados en fabricas,');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (21, 98, 9808, '9808.00.00.90', '9808000090', 'Los demas, incluidos los remolques y semirremolques para cualquier vehiculo (excepto las');
INSERT INTO partidas_exentadas (ID_exencion, Capitulo, Partida, Codigo_subpartida, Codigo_subpartida_sin_puntos, Descripcion) VALUES (22, 98, 9820, '9820.00.00.21', '9820000021', 'Trozos y despojos de aves de la especie Gallus domesticus, congelados');

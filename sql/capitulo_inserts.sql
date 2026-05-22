CREATE TABLE IF NOT EXISTS capitulo (
    ID_capitulo INT PRIMARY KEY,
    ID_seccion INT,
    Numero_de_capitulo VARCHAR(10),
    Descripcion_de_capitulo TEXT,
    Nota_legales TEXT,
    Created_at DATETIME,
    Updated_at DATETIME
);

INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (1, 1, '1', 'ANIMALES VIVOS', 'Nota.
1.
Este Capítulo comprende todos los animales vivos, excepto:
a) los peces, los crustáceos, moluscos y demás invertebrados acuáticos, de las partidas 03.01, 03.06, 03.07 o 03.08;
b) los cultivos de microorganismos y demás productos de la partida 30.02;
c)
los animales de la partida 95.08.
Notas Complementarias:
1.
En la subpartida 0102.2 la expresión “bovinos domésticos” comprende los animales de las especies “Bos primigenius Taurus (Bos Taurus)” y “Bos primigenius
Indicus (Bos Indicus)”.
2.
En las subpartidas 0105.94.00.10 y 0105.99.00.10, la expresión “especímenes de interés genético”, comprende los animales considerados como tales por la
autoridad nacional con competencia en materia de agricultura.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (2, 1, '2', 'CARNE Y DESPOJOS COMESTIBLES', 'Nota.
1.
Este Capítulo no comprende:
a) respecto de las partidas 02.01 a 02.08 y 02.10, los productos impropios para la alimentación humana;
b) los insectos comestibles, sin vida (partida 04.10);
c)
las tripas, vejigas y estómagos de animales (partida 05.04), ni la sangre animal (partidas 05.11 o 30.02);
d) las grasas animales, excepto los productos de la partida 02.09 (Capítulo 15).', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (3, 1, '3', 'PESCADOS Y CRUSTÁCEOS, MOLUSCOS Y DEMÁS INVERTEBRADOS ACUÁTICOS', 'Notas.
1.
Este Capítulo no comprende:
a)  los mamíferos de la partida 01.06;
b)  la carne de los mamíferos de la partida 01.06 (partidas 02.08 o 02.10);
c)
el pescado (incluidos los hígados, huevas y lechas) ni los crustáceos, moluscos o demás invertebrados acuáticos, muertos e impropios para la
alimentación humana por su naturaleza o por su estado de presentación (Capítulo 5); la harina, polvo y «pellets» de pescado o de crustáceos, moluscos o
demás invertebrados acuáticos, impropios para la alimentación humana (partida 23.01);
d) el caviar y los sucedáneos del caviar preparados con huevas de pescado (partida 16.04).
2.
En este Capítulo, el término «pellets» designa los productos en forma de cilindro, bolita, etc., aglomerados por simple presión o con adición de una pequeña
cantidad de aglutinante.
3.
Las partidas 03.05 a 03.08 no comprenden la harina, polvo y «pellets», aptos para la alimentación humana (partida 03.09).', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (4, 1, '4', 'LECHE Y PRODUCTOS LÁCTEOS; HUEVOS DE AVE; MIEL NATURAL; PRODUCTOS COMESTIBLES DE ORIGEN ANIMAL, NO EXPRESADOS NI COMPRENDIDOS EN OTRA PARTE', 'Notas.
1.
Se considera leche, la leche entera y la leche desnatada (descremada) total o parcialmente.
2.
En la partida 04.03, el yogur puede estar concentrado o aromatizado o con adición de azúcar u otro edulcorante, con frutas u otros frutos, cacao,
chocolate, especias, café o extractos de café, plantas, partes de plantas, cereales o productos de panadería, siempre que cualquier sustancia añadida
no se utilice para sustituir, en todo o en parte, cualquier componente de la leche, y el producto conserve el carácter esencial de yogur.
3.
En la partida 04.05:
a) Se entiende por manteca (mantequilla)*, la manteca (mantequilla)* natural, la manteca (mantequilla)* del lactosuero o la manteca (mantequilla)*
«recombinada» (fresca, salada o rancia, incluso en recipientes herméticamente cerrados) que provengan exclusivamente de la leche, con un contenido
de materias grasas de la leche que sea superior o igual al 80 % pero inferior o igual al 95 %, en peso, de materias sólidas de la leche, inferior o igual al
2 % en peso y, de agua, inferior o igual al 16 % en peso. La manteca (mantequilla)* no debe contener emulsionantes añadidos pero puede contener
cloruro sódico, colorantes alimentarios, sales de neutralización y cultivos de bacterias lácticas inocuas.
b) Se entiende por pastas lácteas para untar las emulsiones del tipo agua-en-aceite que se puedan untar y contengan materias grasas de la leche como
únicas materias grasas y en las que el contenido de éstas sea superior o igual al 39 % pero inferior al 80 %, en peso.
4.
Los productos obtenidos por concentración del lactosuero con adición de leche o de materias grasas de la leche se clasifican en la partida 04.06 como
quesos, siempre que presenten las tres características siguientes:
a) un contenido de materias grasas de la leche superior o igual al 5 %, calculado en peso sobre el extracto seco;
b) un contenido de extracto seco superior o igual al 70 % pero inferior o igual al 85 %, calculado en peso;
c)
moldeados o susceptibles de serlo.
5.
Este Capítulo no comprende:
a)   los insectos sin vida, impropios para la alimentación humana (partida 05.11);
b) los productos obtenidos del lactosuero, con un contenido de lactosa superior al 95 % en peso, expresado en lactosa anhidra, calculado sobre materia
seca (partida 17.02);
c)
los productos resultantes de la sustitución en la leche de uno o varios de sus componentes naturales (por ejemplo, materia grasa de tipo butírico) por
otra sustancia (por ejemplo, materia grasa de tipo oleico) (partidas 19.01 o 21.06);
d) las albúminas (incluidos los concentrados de varias proteínas del lactosuero, con un contenido de proteínas del lactosuero superior al 80 % en peso,
calculado sobre materia seca) (partida 35.02) ni las globulinas (partida 35.04).
6.
En la partida 04.10, el término insectos se refiere a insectos comestibles, sin vida, enteros o en trozos, frescos, refrigerados, congelados, secos,
ahumados, salados o en salmuera, así como la harina y polvo, de insectos, aptos para la alimentación humana. Sin embargo, este término no
comprende los insectos comestibles, sin vida, preparados o conservados de otro modo (Sección IV, generalmente).
Notas de subpartida.
1.
En la subpartida 0404.10, se entiende por lactosuero modificado el producto constituido por componentes del lactosuero, es decir, lactosuero del que se
haya extraído, total o parcialmente, lactosa, proteínas o sales minerales, o al que se haya añadido componentes naturales del lactosuero, así como los
productos obtenidos por mezcla de componentes naturales del lactosuero.
2.
En la subpartida 0405.10, el término manteca (mantequilla)* no comprende la manteca (mantequilla) deshidratada ni la «ghee» (subpartida 0405.90).', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (5, 1, '5', 'LOS DEMÁS PRODUCTOS DE ORIGEN ANIMAL NO EXPRESADOS NI COMPRENDIDOS EN OTRA PARTE', 'Notas.
1.
Este Capítulo no comprende:
a) los productos comestibles, excepto las tripas, vejigas y estómagos de animales, enteros o en trozos, y la sangre animal (líquida o desecada);
b) los cueros, pieles y peletería, excepto los productos de la partida 05.05 y los recortes y desperdicios similares de pieles en bruto de la partida 05.11
(Capítulos 41 o 43);
c)
las materias primas textiles de origen animal, excepto la crin y los desperdicios de crin (Sección XI);
d) las cabezas preparadas para artículos de cepillería (partida 96.03).
2.
En la partida 05.01 también se considera cabello en bruto el extendido longitudinalmente pero sin colocarlo en el mismo sentido.
3.
En la Nomenclatura, se considera marfil la materia de las defensas de elefante, hipopótamo, morsa, narval o jabalí y los cuernos de rinoceronte, así como los
dientes de todos los animales.
4.
En la Nomenclatura, se considera crin tanto el pelo de la crin como el de la cola de los équidos o de los bóvidos. La partida 05.11 comprende, entre otros, la
crin y sus desperdicios, incluso en napas con o sin soporte.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (6, 13, '6', 'PLANTAS VIVAS Y PRODUCTOS DE LA FLORICULTURA', 'Notas.
1.
Salvo lo dispuesto en la segunda parte de la partida 06.01, este Capítulo comprende únicamente los productos suministrados habitualmente por los
horticultores, viveristas o floristas para la plantación o la ornamentación. Sin embargo, se excluyen de este Capítulo las papas (patatas)*, cebollas hortenses,
chalotes, ajos y demás productos del Capítulo 7.
2.
Los ramos, cestas, coronas y artículos similares se asimilan a las flores o follajes de las partidas 06.03 o 06.04, sin tener en cuenta los accesorios de otras
materias. Sin embargo, estas partidas no comprenden los collages y cuadros similares de la partida 97.01.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (7, 13, '7', 'HORTALIZAS, PLANTAS, RAÍCES Y TUBÉRCULOS ALIMENTICIOS', 'Notas.
1.
Este Capítulo no comprende los productos forrajeros de la partida 12.14.
2.
En las partidas 07.09, 07.10, 07.11 y 07.12, la expresión hortalizas alcanza también a los hongos comestibles, trufas, aceitunas, alcaparras, calabacines
(zapallitos), calabazas (zapallos), berenjenas, maíz dulce (Zea mays var. saccharata), frutos de los géneros Capsicum o Pimenta, hinojo y plantas como el
perejil, perifollo, estragón, berro y mejorana cultivada (Majorana hortensis u Origanum majorana).
3.
La partida 07.12 comprende todas las hortalizas secas de las especies clasificadas en las partidas 07.01 a 07.11, excepto:
a) las hortalizas de vaina secas desvainadas (partida 07.13);
b) el maíz dulce en las formas especificadas en las partidas 11.02 a 11.04;
c)
la harina, sémola, polvo, copos, gránulos y «pellets», de papa (patata)* (partida 11.05);
d) la harina, sémola y polvo de hortalizas de vaina secas de la partida 07.13 (partida 11.06).
4.
Los frutos de los géneros Capsicum o Pimenta, secos, triturados o pulverizados, se excluyen, sin embargo, de este Capítulo (partida 09.04).
5.
La partida 07.11 comprende las hortalizas que se hayan sometido a un tratamiento con el único fin de que sean conservadas provisionalmente durante el
transporte y almacenamiento antes de su utilización (por ejemplo: con gas sulfuroso o con agua salada, sulfurosa o adicionada de otras sustancias para
asegurar provisionalmente dicha conservación), siempre que, en este estado, sean impropias para consumo inmediato.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (8, 13, '8', 'FRUTAS Y FRUTOS COMESTIBLES; CORTEZAS DE AGRIOS (CÍTRICOS), MELONES O SANDÍAS', 'Notas.
1.
Este Capítulo no comprende los frutos no comestibles.
2.
Las frutas y otros frutos refrigerados se clasifican en las mismas partidas que las frutas y frutos frescos correspondientes.
3.
Las frutas y otros frutos secos de este Capítulo pueden estar parcialmente rehidratados o tratados para los fines siguientes:
a) mejorar su conservación o estabilidad (por ejemplo: mediante tratamiento térmico moderado, sulfurado, adición de ácido sórbico o de sorbato de potasio);
b) mejorar o mantener su aspecto (por ejemplo: por adición de aceite vegetal o pequeñas cantidades de jarabe de glucosa), siempre que conserven el
carácter de frutas o frutos secos.
4.   La partida 08.12 comprende las frutas y otros frutos que se hayan sometido a un tratamiento con el único fin de que sean conservados provisionalmente
durante su transporte y almacenamiento antes de su utilización (por ejemplo: con gas sulfuroso o con agua salada, sulfurosa o adicionada de otras
sustancias para asegurar provisionalmente dicha conservación), siempre que, en este estado, sean impropios para consumo inmediato.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (9, 13, '9', 'CAFÉ, TÉ, YERBA MATE Y ESPECIAS', 'Notas.
1.
Las mezclas entre sí de los productos de las partidas 09.04 a 09.10 se clasifican como sigue:
a) las mezclas entre sí de productos de una misma partida se clasifican en dicha partida;
b) las mezclas entre sí de productos de distintas partidas se clasifican en la partida 09.10.
El hecho de que se añadan otras sustancias a los productos comprendidos en las partidas 09.04 a 09.10 (incluidas las mezclas citadas en los apartados a) o b)
anteriores) no influye en su clasificación, siempre que las mezclas así obtenidas conserven el carácter esencial de los productos citados en cada una de estas
partidas. Por el contrario, dichas mezclas se excluyen de este Capítulo y se clasifican en la partida 21.03 si constituyen condimentos o sazonadores
compuestos.
2.
Este Capítulo no comprende la pimienta de Cubeba (Piper cubeba) ni los demás productos de la partida 12.11.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (10, 13, '10', 'CEREALES', 'Notas.
1.
A) Los productos citados en los textos de las partidas de este Capítulo se clasifican en dichas partidas solo si están presentes los granos, incluso en espigas
o con los tallos.
B) Este Capítulo no comprende los granos mondados o trabajados de otra forma. Sin embargo, el arroz descascarillado, blanqueado, pulido, glaseado,
escaldado o partido se clasifica en la partida 10.06. Asimismo, la quinoa (quinua)* a la cual se le ha eliminado total o parcialmente el pericarpio a fin
de separar la saponina, pero que no haya sido sometida a ningún otro trabajo, permanece clasificada en la partida 10.08.
2.
La partida 10.05 no comprende el maíz dulce (Capítulo 7).
Nota de subpartida.
1.
Se considera trigo duro el de la especie Triticum durum y los híbridos derivados del cruce interespecífico del Triticum durum que tengan 28 cromosomas
como aquél.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (11, 13, '11', 'PRODUCTOS DE LA MOLINERÍA; MALTA; ALMIDÓN Y FÉCULA; INULINA; GLUTEN DE TRIGO', 'Notas.
1.
Este Capítulo no comprende:
a) la malta tostada acondicionada como sucedáneo del café (partidas 09.01 o 21.01, según los casos);
b) la harina, grañones, sémola, almidón y fécula preparados, de la partida 19.01;
c)
las hojuelas o copos de maíz y demás productos de la partida 19.04;
d) las hortalizas preparadas o conservadas de las partidas 20.01, 20.04 o 20.05;
e) los productos farmacéuticos (Capítulo 30);
f)
el almidón y la fécula que tengan el carácter de preparaciones de perfumería, de tocador o de cosmética (Capítulo 33).
2.
A)
Los productos de la molienda de los cereales designados en el cuadro siguiente se clasifican en este Capítulo, si tienen simultáneamente en peso sobre
producto seco:
a) un contenido de almidón (determinado según el método polarimétrico Ewers modificado) superior al indicado en la columna (2);
b) un contenido de cenizas (deduciendo las materias minerales que hayan podido añadirse) inferior o igual al indicado en la columna (3).
Los que no cumplan las condiciones anteriores se clasifican en la partida 23.02. Sin embargo, el germen de cereales entero, aplastado, en copos o molido,
siempre se clasificará en la partida 11.04.
B) Los productos incluidos en este Capítulo, en virtud de las disposiciones anteriores, se clasifican en las partidas 11.01 u 11.02 cuando el porcentaje en peso
que pase por un tamiz de tela metálica con abertura de malla correspondiente a la indicada en las columnas (4) o (5), según los casos, sea superior o
igual al indicado para cada cereal.
En caso contrario, se clasifican en las partidas 11.03 u 11.04.
Cereal
(1)
Contenido de
almidón
(2)
Contenido de
cenizas
(3)
Porcentaje que pasa por un tamiz con abertura de malla de
315 micrómetros (micras, micrones)*
(4)
500 micrómetros (micras, micrones)*
(5)
Trigo y centeno
45%
2,5%
80%
Cebada
45%
3%
80%
Avena
45%
5%
80%
Maíz y sorgo de grano (granífero)
45%
2%
90%
Arroz
45%
1,6%
80%
Alforfón
45%
4%
80%
3.
En la partida 11.03, se consideran grañones y sémola los productos obtenidos por fragmentación de los granos de cereales que respondan a las condiciones
siguientes:
a) los de maíz, deberán pasar por un tamiz de tela metálica con abertura de malla de 2 mm en proporción superior o igual al 95 % en peso;
b) los de los demás cereales, deberán pasar por un tamiz de tela metálica con abertura de malla de 1,25 mm en proporción superior o igual al 95 % en
peso.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (12, 13, '12', 'SEMILLAS Y FRUTOS OLEAGINOSOS; SEMILLAS Y FRUTOS DIVERSOS; PLANTAS INDUSTRIALES O MEDICINALES; PAJA Y FORRAJE', 'Notas.
1.
La nuez y la almendra de palma (palmiste)*, las semillas de algodón, ricino, sésamo (ajonjolí), mostaza, cártamo, amapola (adormidera) y «karité», entre
otras, se consideran semillas oleaginosas de la partida 12.07. Por el contrario, se excluyen de dicha partida los productos de las partidas 08.01 o 08.02, así
como las aceitunas (Capítulos 7 o 20).
2.
La partida 12.08 comprende no solo la harina sin desgrasar, sino también la desgrasada parcialmente o la que ha sido desgrasada y después total o
parcialmente reengrasada con su propio aceite. Por el contrario, se excluyen los residuos de las partidas 23.04 a 23.06.
3.
Las semillas de remolacha, las pratenses (de prados), las de flores ornamentales, de hortalizas, de árboles forestales o frutales, de vezas (excepto las de la
especie Vicia faba) o de altramuces, se consideran semillas para siembra de la partida 12.09.
Por el contrario, se excluyen de esta partida, aunque se destinen a la siembra:
a) las hortalizas de vaina y el maíz dulce (Capítulo 7);
b) las especias y demás productos del Capítulo 9;
c)
los cereales (Capítulo 10);
d) los productos de las partidas 12.01 a 12.07 o de la partida 12.11.
4.
La partida 12.11 comprende, entre otras, las plantas y partes de plantas de las especies siguientes: albahaca, borraja, ginseng, hisopo, regaliz, diversas
especies de menta, romero, ruda, salvia y ajenjo.
Por el contrario, se excluyen:
a) los productos farmacéuticos del Capítulo 30;
b) las preparaciones de perfumería, de tocador o de cosmética del Capítulo 33;
c)
los insecticidas, fungicidas, herbicidas, desinfectantes y productos similares de la partida 38.08.
5.
En la partida 12.12, el término algas no comprende:
a) los microorganismos monocelulares muertos de la partida 21.02;
b) los cultivos de microorganismos de la partida 30.02;
c)
los abonos de las partidas 31.01 o 31.05.
Nota de subpartida.
1.  En la subpartida 1205.10, se entiende por semillas de nabo (nabina) o de colza con bajo contenido de ácido erúcico las semillas de nabo (nabina) o de colza
de las que se obtiene un aceite fijo el cual tiene un contenido de ácido erúcico inferior al 2 % en peso y un componente sólido cuyo contenido de
glucosinolatos es inferior a 30 micromoles por gramo.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (13, 13, '13', 'GOMAS, RESINAS Y DEMÁS JUGOS Y EXTRACTOS VEGETALES', 'Nota.
1.
La partida 13.02 comprende, entre otros, los extractos de regaliz, piretro (pelitre)*, lúpulo o áloe, y el opio.
Por el contrario, se excluyen:
a)
el extracto de regaliz con un contenido de sacarosa superior al 10  %  en peso o presentado como artículo de confitería (partida 17.04);
b)
el extracto de malta (partida 19.01);
c)
los extractos de café, té o yerba mate (partida 21.01);
d)
los jugos y extractos vegetales que constituyan bebidas alcohólicas (Capítulo 22);
e)
el alcanfor natural, la glicirricina y demás productos de las partidas 29.14 o 29.38;
f)
los concentrados de paja de adormidera con un contenido de alcaloides superior o igual al 50  %  en peso (partida 29.39);
g)
los medicamentos de las partidas 30.03 o 30.04 y los reactivos para determinación de los grupos o de los factores sanguíneos (partida 38.22);
h)
los extractos curtientes o tintóreos (partidas 32.01 o 32.03);
ij)
los aceites esenciales (incluidos los «concretos» o «absolutos»), los resinoides y las oleorresinas de extracción, así como los destilados acuosos
aromáticos y disoluciones acuosas de aceites esenciales y las preparaciones a base de sustancias odoríferas de los tipos utilizados para la
elaboración de bebidas (Capítulo 33);
k)
el caucho natural, balata, gutapercha, guayule, chicle y gomas naturales análogas (partida 40.01).', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (14, 13, '14', 'MATERIAS TRENZABLES Y DEMÁS PRODUCTOS DE ORIGEN VEGETAL, NO EXPRESADOS NI COMPRENDIDOS EN OTRA PARTE', 'Notas.
1.
Se excluyen de este Capítulo y se clasifican en la Sección XI, las materias y fibras vegetales de las especies principalmente utilizadas para la fabricación de
textiles, cualquiera que sea su preparación, así como las materias vegetales trabajadas especialmente para su utilización exclusiva como materia textil.
2.
La partida 14.01 comprende, entre otras, el bambú (incluso hendido, aserrado longitudinalmente o cortado en longitudes determinadas, con los extremos
redondeados, blanqueado, ignifugado, pulido o teñido), los trozos de mimbre, de caña y similares, la médula de roten (ratán)* y el roten (ratán)* hilado.
No se clasifican en esta partida las tablillas, láminas o cintas de madera (partida 44.04).
3.
La partida 14.04 no comprende la lana de madera (partida 44.05) ni las cabezas preparadas para artículos de cepillería (partida 96.03).', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (15, 11, '15', 'GRASAS Y ACEITES, ANIMALES, VEGETALES O DE ORIGEN MICROBIANO, Y PRODUCTOS DE SU DESDOBLAMIENTO; GRASAS ALIMENTICIAS ELABORADAS; CERAS DE ORIGEN ANIMAL O VEGETAL', 'Notas.
1.
Este Capítulo no comprende:
a)
el tocino y grasa de cerdo o de ave, de la partida 02.09;
b)
la manteca, grasa y aceite de cacao (partida 18.04);
c)
las preparaciones alimenticias con un contenido de productos de la partida 04.05 superior al 15  %  en peso (generalmente Capítulo 21);
d)
los chicharrones (partida 23.01) y los residuos de las partidas 23.04 a 23.06;
e)
los ácidos grasos, las ceras preparadas, las grasas transformadas en productos farmacéuticos, pinturas, barnices, jabón, preparaciones de
perfumería, de tocador o de cosmética, los aceites sulfonados y demás productos de la Sección VI;
f)
el caucho facticio derivado de los aceites (partida 40.02).
2.
La partida 15.09 no incluye el aceite de aceituna extraído con disolventes (partida 15.10).
3.
La partida 15.18 no comprende las grasas y aceites, ni sus fracciones, simplemente desnaturalizados, que permanecen clasificados en la partida de las
correspondientes grasas y aceites, y sus fracciones, sin desnaturalizar.
4.
Las pastas de neutralización, las borras o heces de aceite, la brea esteárica, la brea de suarda y la pez de glicerol, se clasifican en la partida 15.22.
Notas de subpartida.
1.
Para la aplicación de la subpartida 1509.30, el aceite de oliva virgen tiene una acidez libre expresada como ácido oleico inferior o igual a 2,0 g/ 100 g
y puede distinguirse de las otras categorías de aceite de oliva virgen, según las características establecidas por la Norma 33-1981 del Codex
Alimentarius.
2.
En las subpartidas 1514.11 y 1514.19, se entiende por aceite de nabo (de nabina) o de colza con bajo contenido de ácido erúcico, el aceite fijo con
un contenido de ácido erúcico inferior al 2  %  en peso.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (16, 12, '16', 'PREPARACIONES DE CARNE, PESCADO, CRUSTÁCEOS, MOLUSCOS O DEMÁS INVERTEBRADOS ACUÁTICOS, O DE INSECTOS', 'Notas.
1.
Este Capítulo no comprende la carne, despojos, pescado, crustáceos, moluscos y demás invertebrados acuáticos, así como los insectos, preparados o
conservados por los procedimientos citados en los Capítulos 2 y 3, en la Nota 6 del Capítulo 4 o en la partida 05.04
2.
Las preparaciones alimenticias se clasifican en este Capítulo siempre que contengan una proporción superior al 20  %  en peso de embutidos, carne,
despojos, sangre, insectos, pescado o de crustáceos, moluscos o demás invertebrados acuáticos, o de una combinación de estos productos. Cuando estas
preparaciones contengan dos o más productos de los mencionados, se clasifican en la partida del Capítulo 16 que corresponda al componente que
predomine en peso. Estas disposiciones no se aplican a los productos rellenos de la partida 19.02 ni a las preparaciones de las partidas 21.03 o 21.04.
Notas de subpartida.
1.
En la subpartida 1602.10, se entiende por preparaciones homogeneizadas, las preparaciones de carne, despojos, sangre o de insectos, finamente
homogeneizadas, acondicionadas para la venta al por menor como alimento para lactantes o niños de corta edad o para uso dietético en recipientes con
un contenido de peso neto inferior o igual a 250 g. Para la aplicación de esta definición se hará abstracción, en su caso, de los diversos ingredientes
añadidos a la preparación en pequeña cantidad para sazonar, conservar u otros fines. Estas preparaciones pueden contener pequeñas cantidades de
fragmentos visibles de carne, despojos o de insectos. La subpartida 1602.10 tendrá prioridad sobre las demás subpartidas de la partida 16.02.
2.
Los pescados, crustáceos, moluscos y demás invertebrados acuáticos citados en las subpartidas de las partidas 16.04 y 16.05 solo con los nombres
vulgares corresponden a las mismas especies mencionadas en el Capítulo 3 con el mismo nombre.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (17, 12, '17', 'AZÚCARES Y ARTÍCULOS DE CONFITERÍA', 'Nota.
1.
Este Capítulo no comprende:
a)
los artículos de confitería que contengan cacao (partida 18.06);
b)
los azúcares químicamente puros (excepto la sacarosa, lactosa, maltosa, glucosa y fructosa (levulosa)) y demás productos de la partida 29.40;
c)
los medicamentos y demás productos del Capítulo 30.
Notas de subpartida.
1.
En las subpartidas 1701.12, 1701.13 y 1701.14, se entiende por azúcar en bruto, el que contenga en peso, calculado sobre producto seco, un porcentaje
de sacarosa correspondiente a una lectura en el polarímetro inferior a 99,5 °.
2.
La subpartida 1701.13 comprende solamente el azúcar de caña, obtenida sin centrifugación, con un  contenido de sacarosa en peso, en estado seco,
correspondiente a una lectura polarimétrica superior o igual a 69 º pero inferior a 93 º. El producto contiene solamente microcristales anhédricos
naturales, de forma irregular, invisibles a simple vista, rodeados por residuos de melaza y demás constituyentes del azúcar de caña.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (18, 12, '18', 'CACAO Y SUS PREPARACIONES', 'Notas.
1.
Este Capítulo no comprende:
a) las preparaciones alimenticias que contengan una proporción superior al 20 % en peso de embutidos, carne, despojos, sangre, insectos, pescado o de
crustáceos, moluscos o demás invertebrados acuáticos, o de una combinación de estos productos (Capítulo 16);
b) las preparaciones de las partidas 04.03, 19.01, 19.02, 19.04, 19.05, 21.05, 22.02, 22.08, 30.03 o 30.04.
2.
La partida 18.06 comprende los artículos de confitería que contengan cacao y, salvo lo dispuesto en la Nota 1 de este Capítulo, las demás preparaciones
alimenticias que contengan cacao.
Nota Complementaria.
1.
En la subpartida 1801.00.00.11, la expresión «para siembra» comprende solamente los productos considerados como tales por la autoridad nacional
competente.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (19, 12, '19', 'PREPARACIONES A BASE DE CEREALES, HARINA, ALMIDÓN, FÉCULA O LECHE; PRODUCTOS DE PASTELERÍA', 'Notas.
1.
Este Capítulo no comprende:
a)
las preparaciones alimenticias que contengan una proporción superior al 20  %  en peso de embutidos, carne, despojos, sangre, insectos, pescado o
de crustáceos, moluscos o demás invertebrados acuáticos, o de una combinación de estos productos (Capítulo 16), excepto los productos rellenos de
la partida 19.02;
b)
los productos a base de harina, almidón o fécula (galletas, etc.) especialmente preparados para la alimentación de los animales (partida 23.09);
c)
los medicamentos y demás productos del Capítulo 30.
2.
En la partida 19.01, se entiende por:
a)
grañones, los grañones de cereales del Capítulo 11;
b)
harina y sémola:
1)
la harina y sémola de cereales del Capítulo 11;
2)
la harina, sémola y polvo, de origen vegetal, de cualquier Capítulo, excepto la harina, sémola y polvo de hortalizas secas (partida 07.12),
de papa (patata)* (partida 11.05) o de hortalizas de vaina secas (partida 11.06).
3.
La partida 19.04 no comprende las preparaciones con un contenido de cacao superior al 6  %  en peso calculado sobre una base totalmente desgrasada, ni
las recubiertas totalmente de chocolate o demás preparaciones alimenticias que contengan cacao de la partida 18.06 (partida 18.06).
4.
En la partida 19.04, la expresión preparados de otro modo significa que los cereales se han sometido a un tratamiento o a una preparación más avanzados
que los previstos en las partidas o en las Notas de los Capítulos 10 u 11.
Nota complementaria:
1.
A los efectos de la importación de pastas alimenticias clasificadas en la Partida 19.02, sólo podrán ser nacionalizadas cuando cumplan con la Norma
Venezolana COVENIN de obligatorio cumplimiento N° 283:1994. A tales efectos, el Servicio Autónomo de Contraloría Sanitaria (SACS) deberá indicar en el
respectivo Registro Sanitario el cumplimiento de dicha Norma para su respectivo control documental en la Oficina Aduanera de ingreso.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (20, 12, '20', 'PREPARACIONES DE HORTALIZAS, FRUTAS U OTROS FRUTOS O DEMÁS PARTES DE PLANTAS', 'Notas.
1.
Este Capítulo no comprende:
a)
las hortalizas y frutas u otros frutos preparados o conservados por los procedimientos citados en los Capítulos 7, 8 u 11;
b)
las grasas y aceites, vegetales (Capítulo 15);
c)
las preparaciones alimenticias que contengan una proporción superior al 20  %  en peso de embutidos, carne, despojos, sangre, insectos, pescado o de
crustáceos, moluscos o demás invertebrados acuáticos, o de una combinación de estos productos (Capítulo 16);
d)
los productos de panadería, pastelería o galletería y los demás productos de la partida 19.05;
e)
las preparaciones alimenticias compuestas homogeneizadas de la partida 21.04.
2.
Las partidas 20.07 y 20.08 no comprenden las jaleas y pastas de frutas u otros frutos, las almendras confitadas y los productos similares presentados como
artículos de confitería (partida 17.04) ni los artículos de chocolate (partida 18.06).
3.
Las partidas 20.01, 20.04 y 20.05 comprenden, según los casos, solo los productos del Capítulo 7 o de las partidas 11.05 u 11.06 (excepto la harina, sémola y
polvo de los productos del Capítulo 8), preparados o conservados por procedimientos distintos de los mencionados en la Nota 1 a).
4.
El jugo de tomate con un contenido de extracto seco superior o igual al 7  %  en peso, se clasifica en la partida 20.02.
5.
En la partida 20.07, la expresión obtenidos por cocción significa obtenidos por tratamiento térmico a presión atmosférica o bajo presión reducida con el
fin de aumentar la viscosidad del producto por reducción de su contenido de agua u otros medios.
6.
En la partida 20.09, se entiende por jugos sin fermentar y sin adición de alcohol, los jugos cuyo grado alcohólico volumétrico sea inferior o igual al 0,5  %  vol.
(véase la Nota 2 del Capítulo 22).
Notas de subpartida.
1.
En la subpartida 2005.10, se entiende por hortalizas homogeneizadas, las preparaciones de hortalizas, finamente homogeneizadas, acondicionadas para la
venta al por menor como alimento para lactantes o niños de corta edad o para uso dietético en recipientes con un contenido de peso neto inferior o igual a
250 g. Para la aplicación de esta definición se hará abstracción, en su caso, de los diversos ingredientes añadidos a la preparación en pequeña cantidad para
sazonar, conservar u otros fines. Estas preparaciones pueden contener pequeñas cantidades de fragmentos visibles de hortalizas. La subpartida 2005.10
tendrá prioridad sobre las demás subpartidas de la partida 20.05.
2.
En la subpartida 2007.10, se entiende por preparaciones homogeneizadas, las preparaciones de frutas u otros frutos finamente homogeneizadas,
acondicionadas para la venta al por menor como alimento para lactantes o niños de corta edad o para uso dietético en recipientes con un contenido de peso
neto inferior o igual a 250 g. Para la aplicación de esta definición se hará abstracción, en su caso, de los diversos ingredientes añadidos a la preparación en
pequeña cantidad para sazonar, conservar u otros fines. Estas preparaciones pueden contener pequeñas cantidades de fragmentos visibles de frutas u otros
frutos. La subpartida 2007.10 tendrá prioridad sobre las demás subpartidas de la partida 20.07.
3.   En las subpartidas 2009.12, 2009.21, 2009.31, 2009.41, 2009.61 y 2009.71, se entiende por valor Brix los grados Brix leídos directamente en la escala de
un hidrómetro Brix o el índice de refracción expresado en porcentaje del contenido de sacarosa medido en refractómetro, a una temperatura de 20 º C  o
corregido para una temperatura de 20 º C  cuando la lectura se realice a una temperatura diferente.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (21, 12, '21', 'PREPARACIONES ALIMENTICIAS DIVERSAS', 'Notas.
1.
Este Capítulo no comprende:
a)
las mezclas de hortalizas de la partida 07.12;
b)
los sucedáneos del café tostados que contengan café en cualquier proporción (partida 09.01);
c)
el té aromatizado (partida 09.02);', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (22, 12, '22', 'BEBIDAS, LÍQUIDOS ALCOHÓLICOS Y VINAGRE', 'Notas.
1.
Este Capítulo no comprende:
a)
los productos de este Capítulo (excepto los de la partida 22.09) preparados para uso culinario de tal forma que resulten impropios para el
consumo como bebida (generalmente, partida 21.03);
b)
el agua de mar (partida 25.01);', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (23, 12, '23', 'RESIDUOS Y DESPERDICIOS DE LAS INDUSTRIAS ALIMENTARIAS; ALIMENTOS PREPARADOS PARA ANIMALES', 'Nota.
1.
Se incluyen en la partida 23.09 los productos de los tipos utilizados para la alimentación de los animales, no expresados ni comprendidos en otra parte,
obtenidos por tratamiento de materias vegetales o animales y que, por este hecho, hayan perdido las características esenciales de la materia originaria,
excepto los desperdicios vegetales, residuos y subproductos vegetales procedentes de estos tratamientos.
Nota de subpartida.
1.
En la subpartida 2306.41, se entiende por de semillas de nabo (nabina) o de colza con bajo contenido de ácido erúcico las semillas definidas en la
Nota 1 de subpartida del Capítulo 12.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (24, 12, '24', 'TABACO Y SUCEDÁNEOS DEL TABACO ELABORADOS; PRODUCTOS, INCLUSO CON NICOTINA, DESTINADOS PARA LA INHALACIÓN SIN COMBUSTIÓN; OTROS PRODUCTOS QUE CONTENGAN NICOTINA DESTINADOS PARA LA ABSORCIÓN DE NICOTINA EN EL CUERPO HUMANO', 'Notas.
1.
Este Capítulo no comprende los cigarrillos medicinales (Capítulo 30).
2.
Cualquier producto susceptible de clasificarse en la partida 24.04 y en otra partida de este Capítulo, se clasifica en la partida 24.04.
3.
En la partida 24.04, se entiende por inhalación sin combustión, la inhalación a través de calentamiento u otros medios, sin combustión.
Nota de subpartida.
1.
En la subpartida 2403.11, se considera tabaco para pipa de agua el tabaco destinado a ser fumado en una pipa de agua y que está constituido por una
mezcla de tabaco y glicerol, incluso con aceites y extractos aromáticos, melaza o azúcar, e incluso aromatizado o saborizado con frutas. Sin embargo, los
productos para pipa de agua, que no contengan tabaco, se excluyen de esta subpartida.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (25, 9, '25', 'SAL; AZUFRE; TIERRAS Y PIEDRAS; YESOS, CALES Y CEMENTOS', 'Notas.
1.
Salvo disposición en contrario y a reserva de lo previsto en la Nota 4 siguiente, solo se clasifican en las partidas de este Capítulo los productos en bruto o
los productos lavados (incluso con sustancias químicas que eliminen las impurezas sin cambiar la estructura del producto), quebrantados, triturados,
molidos, pulverizados, levigados, cribados, tamizados, enriquecidos por flotación, separación magnética u otros procedimientos mecánicos o físicos
(excepto la cristalización), pero no los productos tostados, calcinados, los obtenidos por mezcla o los sometidos a un tratamiento que supere  al indicado
en cada partida.
Se puede añadir a los productos de este Capítulo una sustancia antipolvo, siempre que no haga al producto más apto para usos determinados que para
uso general.
2.
Este Capítulo no comprende:
a)
el azufre sublimado o precipitado ni el coloidal (partida 28.02);
b)
las tierras colorantes con un contenido de hierro combinado, expresado en Fe2O3, superior o igual al 70  %  en peso (partida 28.21);
c)
los medicamentos y demás productos del Capítulo 30;
d)
las preparaciones de perfumería, de tocador o de cosmética (Capítulo 33);
e)
el aglomerado de dolomita (partida 38.16);
f)
los adoquines, encintados (bordillos)* y losas para pavimentos (partida 68.01); los cubos, dados y artículos similares para mosaicos (partida', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (26, 9, '26', 'MINERALES METALÍFEROS, ESCORIAS Y CENIZAS', 'Notas.
1.
Este Capítulo no comprende:
a)
las escorias y desechos industriales similares preparados en forma de macadán (partida 25.17);
b)
el carbonato de magnesio natural (magnesita), incluso calcinado (partida 25.19);
c)
los lodos procedentes de los depósitos de almacenamiento de aceites de petróleo constituidos principalmente por estos aceites (partida', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (27, 9, '27', 'COMBUSTIBLES MINERALES, ACEITES MINERALES Y PRODUCTOS DE SU DESTILACIÓN; MATERIAS BITUMINOSAS; CERAS MINERALES', 'Notas.
1.
Este Capítulo no comprende:
a)
los productos orgánicos de constitución química definida presentados aisladamente; esta exclusión no afecta al metano ni al propano puros, que
se clasifican en la partida 27.11;
b)
los medicamentos de las partidas 30.03 o 30.04;
c)
las mezclas de hidrocarburos no saturados, de las partidas 33.01, 33.02 o 38.05.
2.
La expresión aceites de petróleo o de mineral bituminoso, empleada en el texto de la partida 27.10, se aplica, no solo a los aceites de petróleo o de
mineral bituminoso, sino también a los aceites análogos, así como a los constituidos principalmente por mezclas de hidrocarburos no saturados en las que
los constituyentes no aromáticos predominen en peso sobre los aromáticos, cualquiera que sea el procedimiento de obtención.
Sin embargo, dicha expresión no se aplica a las poliolefinas sintéticas líquidas que destilen una proporción inferior al 60  %  en volumen a 300  ° C
referidos a 1.013 milibares cuando se utilice un método de destilación a baja presión (Capítulo 39).
3.
En la partida 27.10, se entiende por desechos de aceites los desechos que contengan principalmente aceites de petróleo o de mineral bituminoso (tal
como se definen en la Nota 2 de este Capítulo), incluso mezclados con agua. Estos desechos incluyen, principalmente:
a)
los aceites impropios para su utilización inicial (por ejemplo: aceites lubricantes, hidráulicos o para transformadores, usados);
b)
los lodos de aceites procedentes de los depósitos de almacenamiento de aceites de petróleo que contengan principalmente aceites de este
tipo y una alta concentración de aditivos (por ejemplo, productos químicos) utilizados en la elaboración de productos primarios;
c)
los aceites que se presenten en emulsión acuosa o mezclados con agua, tales como los resultantes del derrame o lavado de depósitos de
almacenamiento, o del uso de aceites de corte en las operaciones de mecanizado.
Notas de subpartida.
1.
En la subpartida 2701.11, se considera antracita, la hulla con un contenido límite de materias volátiles inferior o igual al 14  % , calculado sobre producto
seco sin materias minerales.
2.
En la subpartida 2701.12, se considera hulla bituminosa, la hulla con un contenido límite de materias volátiles superior al 14  % , calculado sobre producto
seco sin materias minerales, y cuyo valor calorífico límite sea superior o igual a 5.833 kcal/ kg, calculado sobre producto húmedo sin materias minerales.
3.
En las subpartidas 2707.10, 2707.20, 2707.30 y 2707.40, se consideran benzol (benceno), toluol (tolueno), xilol (xilenos) y naftaleno los productos
con un contenido de benceno, tolueno, xilenos o naftaleno, superior al 50 % en peso, respectivamente.
4.
En la subpartida 2710.12, se entiende por aceites livianos (ligeros)* y preparaciones, los aceites y las preparaciones que destilen, incluidas las
pérdidas, una proporción superior o igual al 90  %  en volumen a 210  º C, según el método ISO 3405 (equivalente al método ASTM D 86).
5.
En las subpartidas de la partida 27.10, el término biodiésel designa a los ésteres monoalquílicos de ácidos grasos de los tipos utilizados como
carburantes o combustibles, derivados de grasas y aceites, animales, vegetales o de origen microbiano, incluso usados.
Nota Complementaria (Arancel Externo Común).
1.
La expresión Gasolinas empleada en el texto de la subpartida regional 2710.12.5 comprende toda mezcla de hidrocarburos livianos apta para su utilización
en motores de explosión, denominada «nafta» en Argentina, Paraguay y Uruguay. Estas mezclas no deben confundirse con las Naftas de la subpartida
regional 2710.12.4 que se utilizan generalmente en petroquímica o como disolvente.
Notas Complementarias.
1.
En las Notas Complementarias siguientes, mientras no se indique expresamente, se aplicarán las Normas de la American Society for Testing Materials (ASTM),
sobre definiciones y especificaciones normalizadas para productos petrolíferos y lubricantes.
2.
Para la aplicación de la partida 27.10, se considera:
a)
«Aceites medios», los aceites y preparaciones que destilen en volumen, incluidas las pérdidas, menos del 90%, a 210°C, y 65% o más a 250°C
(Norma ASTM D 86).
b)
«Aceites pesados», los aceites y preparaciones que destilen en volumen, incluidas las pérdidas, menos del 65% a 250°C (Norma ASTM D 86) o en
los cuales el porcentaje de destilación a 250°C no pueda determinarse con dicha Norma.
3.
Se entenderá por Espíritu de petróleo («white spirit»), un aceite liviano, sin aditivos, que destile en volumen, incluidas las pérdidas, un intervalo entre 5% y
90%, a temperatura igual o inferior a 60°C, siempre que su punto de inflamación sea superior a 21°C, según el método Abel Pensky (Norma DIN 51755) o
por el método ASTM D 56.
4.
Sin perjuicio de la aplicación de la Nota Complementaria 2 a), se entiende por «gasolina de aviación», aquella mezcla de hidrocarburos derivados de petróleo,
gasolina natural o mezclas de hidrocarburos sintéticos o aromáticos, o ambos, libre de agua, sedimentos y de materiales sólidos en suspensión apta para ser
utilizada como combustible en aviones con motores de combustión interna de encendido por chispa (motores de explosión) y que posean además las
siguientes características:
a)
Azufre: Contenido máximo 0,05% en peso según Método D-2622 (ASTM);
b) Goma: Contenido  máximo,  luego  de  5 horas  de  oxidación  acelerada: 6 mg/100 ml según Método  D-873 (ASTM).
c)
Indice de antidetonante (Indice de Octano):
Tipo de gasolina
Método D-2700
Método D-909
80-87
80
87
100-130
100
130
115-145
115
*145
(*) Este valor se refiere al índice de operación («Perfomance Number»).
d) Tensión de vapor: Máximo 0,499 Kg/cm² (49 kPa) y mínimo 0,387 Kg/cm² (38 kPa) según Método D-323 (ASTM);
e)
Tetraetilo de plomo: Contenido máximo según Método D-3341 (ASTM).
Tipo de gasolina
Tetraetilo de plomo
(ml/l)
80-87
91-98
0,13
0,85
100-130
1,057
115-145
1,22
5.
Se entenderá por «Queroseno», los aceites medios definidos en la Nota Complementaria 2 a) anterior, cuyo punto de inflamación sea superior a 21°C según
el método «Abel-Pensky» (Norma DIN 51755) o por el método ASTM D 56.
6.
Se entenderá por «gasoil» (Gasóleo), los aceites pesados definidos en la Nota Complementaria 2 b) anterior, que destilen en volumen, incluidas las pérdidas,
el 85% o más a 350°C (Norma ASTM D 86).
7.
Se entenderá por «Fueloils» (Fuel), el aceite pesado (distinto del gasóleo) que destilen en volumen, incluidas las pérdidas, menos del 85% a 350°C o el
25% o más, a 300°C, (Método ASTM D 86).', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (28, 10, '28', 'PRODUCTOS QUÍMICOS INORGÁNICOS; COMPUESTOS INORGÁNICOS U ORGÁNICOS DE METAL PRECIOSO, DE ELEMENTOS RADIACTIVOS, DE METALES DE LAS TIERRAS RARAS O DE ISÓTOPOS', 'Notas.
1.
Salvo disposición en contrario, las partidas de este Capítulo comprenden solamente:
a)
los elementos químicos aislados y los compuestos de constitución química definida presentados aisladamente, aunque contengan impurezas;
b)
las disoluciones acuosas de los productos del apartado a) anterior;
c)
las demás disoluciones de los productos del apartado a) anterior, siempre que constituyan un modo de acondicionamiento usual e indispensable,
exclusivamente motivado por razones de seguridad o por necesidades del transporte y que el disolvente no haga al producto más apto para usos
determinados que para uso general;
d)
los productos de los apartados a), b) o c) anteriores, con adición de un estabilizante (incluido un antiaglomerante) indispensable para su
conservación o transporte;
e)
los productos de los apartados a), b), c) o d) anteriores, con adición de una sustancia antipolvo o de un colorante, para facilitar su identificación o
por razones de seguridad, siempre que estas adiciones no hagan al producto más apto para usos determinados que para uso general.
2.
Además de los ditionitos y sulfoxilatos, estabilizados con sustancias orgánicas (partida 28.31), los carbonatos y peroxocarbonatos de bases inorgánicas
(partida 28.36), los cianuros, oxicianuros y cianuros complejos de bases inorgánicas (partida 28.37), los fulminatos, cianatos y tiocianatos de bases
inorgánicas (partida 28.42), los productos orgánicos comprendidos en las partidas 28.43 a 28.46 y 28.52, y los carburos (partida 28.49), solamente se
clasifican en este Capítulo los compuestos de carbono que se enumeran a continuación:
a)
los óxidos de carbono, el cianuro de hidrógeno, los ácidos fulmínico, isociánico, tiociánico y demás ácidos cianogénicos simples o complejos (partida', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (29, 10, '29', 'PRODUCTOS QUÍMICOS ORGÁNICOS', 'Notas.
1.
Salvo disposición en contrario, las partidas de este Capítulo comprenden solamente:
a)
los compuestos orgánicos de constitución química definida presentados aisladamente, aunque contengan impurezas;
b)
las mezclas de isómeros de un mismo compuesto orgánico (aunque contengan impurezas), excepto las mezclas de isómeros de los hidrocarburos
acíclicos saturados o sin saturar (distintos de los estereoisómeros) (Capítulo 27);
c)
los productos de las partidas 29.36 a 29.39, los éteres, acetales y ésteres de azúcares, y sus sales, de la partida 29.40, y los productos de la
partida 29.41, aunque no sean de constitución química definida;
d)
las disoluciones acuosas de los productos de los apartados a), b) o c) anteriores;
e)
las demás disoluciones de los productos de los apartados a), b) o c) anteriores, siempre que constituyan un modo de acondicionamiento usual e
indispensable, exclusivamente motivado por razones de seguridad o necesidades del transporte y que el disolvente no haga al producto más apto para
usos determinados que para uso general;
f)
los productos de los apartados a), b), c), d) o e) anteriores, con adición de un estabilizante (incluido un antiaglomerante) indispensable para su
conservación o transporte;
g)
los productos de los apartados a), b), c), d), e) o f) anteriores, con adición de una sustancia antipolvo, un colorante o un odorante o un emético, para
facilitar su identificación o por razones de seguridad, siempre que estas adiciones no hagan al producto más apto para usos determinados que para uso
general;
h)
los productos siguientes, normalizados, para la producción de colorantes azoicos: sales de diazonio, copulantes utilizados para estas sales y aminas
diazotables y sus sales.
2.
Este Capítulo no comprende:
a)
los productos de la partida 15.04 y el glicerol en bruto de la partida 15.20;
b)
el alcohol etílico (partidas 22.07 o 22.08);
c)
el metano y el propano (partida 27.11);
d)
los compuestos de carbono mencionados en la Nota 2 del Capítulo 28;
e)
los productos inmunológicos de la partida 30.02;
f)
la urea (partidas 31.02 o 31.05);
g)
las materias colorantes de origen vegetal o animal (partida 32.03), las materias colorantes orgánicas sintéticas, los productos orgánicos sintéticos de los
tipos utilizados como agentes de avivado fluorescente o como luminóforos (partida 32.04), así como los tintes y demás materias colorantes presentados
en formas o en envases para la venta al por menor (partida 32.12);
h)
las enzimas (partida 35.07);
ij)
el metaldehído, la hexametilentetramina y los productos análogos, en tabletas, barritas o formas similares que impliquen su utilización como
combustibles, así como los combustibles líquidos y los gases combustibles licuados, en recipientes de los tipos utilizados para cargar o recargar
encendedores o mecheros, de capacidad inferior o igual a 300 cm3 (partida 36.06);
k)
los productos extintores presentados como cargas para aparatos extintores o en granadas o bombas extintoras de la partida 38.13; los productos
borradores de tinta acondicionados en envases para la venta al por menor, clasificados en la partida 38.24;
l)
los elementos de óptica, por ejemplo, los de tartrato de etilendiamina (partida 90.01).
3.
Cualquier producto que pudiera clasificarse en dos o más partidas de este Capítulo se clasificará en la última de dichas partidas por orden de numeración.
4.
En las partidas 29.04 a 29.06, 29.08 a 29.11 y 29.13 a 29.20, cualquier referencia a los derivados halogenados, sulfonados, nitrados o nitrosados, se aplica
también a los derivados mixtos, tales como los sulfohalogenados, nitrohalogenados, nitrosulfonados o nitrosulfohalogenados.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (30, 10, '30', 'PRODUCTOS FARMACÉUTICOS', 'Notas.
1. Este Capítulo no comprende:
a)
los alimentos dietéticos, alimentos enriquecidos, alimentos para diabéticos, complementos alimenticios, bebidas tónicas y el agua mineral (Sección
IV), excepto las preparaciones nutritivas para administración por vía intravenosa;
b)
los productos, tales como comprimidos, gomas de mascar o parches autoadhesivos (que se administran por vía transdérmica), que contengan
nicotina y destinados para ayudar a dejar de fumar (partida 24.04);
c)
el yeso fraguable especialmente calcinado o finamente molido para uso en odontología (partida 25.20);
d)
los destilados acuosos aromáticos y las disoluciones acuosas de aceites esenciales, medicinales (partida 33.01);
e)
las preparaciones de las partidas 33.03 a 33.07, incluso si tienen propiedades terapéuticas o profilácticas;
f)
el jabón y demás productos de la partida 34.01, con adición de sustancias medicamentosas;
g)
las preparaciones a base de yeso fraguable para uso en odontología (partida 34.07);
h)
la albúmina de la sangre sin preparar para usos terapéuticos o profilácticos (partida 35.02);
ij)
los reactivos de diagnóstico de la partida 38.22.
2. En la partida 30.02 se entiende por productos inmunológicos a los péptidos y proteínas (excepto los productos de la partida 29.37) que participan
directamente en la regulación de los procesos inmunológicos, tales como los anticuerpos monoclonales (MAB), los fragmentos de anticuerpos, los conjugados
de anticuerpos y los conjugados de fragmentos de anticuerpos, las interleucinas, los interferones (IFN), las quimioquinas así como ciertos factores que
provocan la necrosis tumoral (TNF), factores de crecimiento (GF), hematopoyetinas y factores estimulantes de colonias (CSF).', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (31, 10, '31', 'ABONOS', 'Notas.
1. Este Capítulo no comprende:
a)
la sangre animal de la partida 05.11;
b)
los productos de constitución química definida presentados aisladamente, excepto los descritos en las Notas 2 a), 3 a), 4 a) o 5 siguientes;
c)
los cristales cultivados de cloruro de potasio (excepto los elementos de óptica), de peso unitario superior o igual a 2,5 g, de la partida 38.24; los
elementos de óptica de cloruro de potasio (partida 90.01).
2. Salvo que se presenten en las formas previstas en la partida 31.05, la partida 31.02 comprende únicamente:
a)
los productos siguientes:
1)
el nitrato de sodio, incluso puro;
2)
el nitrato de amonio, incluso puro;
3)
las sales dobles de sulfato de amonio y de nitrato de amonio, incluso puras;
4)
el sulfato de amonio, incluso puro;
5)
las sales dobles (incluso puras) o las mezclas entre sí de nitrato de calcio y nitrato de amonio;
6)
las sales dobles (incluso puras) o las mezclas entre sí de nitrato de calcio y nitrato de magnesio;
7)
la cianamida cálcica, incluso pura, aunque esté impregnada con aceite;
8)
la urea, incluso pura;
b)
los abonos que consistan en mezclas entre sí de los productos del apartado a) precedente;
c)
los abonos que consistan en mezclas de cloruro de amonio o de productos de los apartados a) y b) precedentes, con creta, yeso natural u otras
materias inorgánicas sin poder fertilizante;
d)
los abonos líquidos que consistan en disoluciones acuosas o amoniacales de los productos de los apartados a) 2) o a) 8) precedentes, o de una mezcla
de estos productos.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (32, 10, '32', 'EXTRACTOS CURTIENTES O TINTÓREOS; TANINOS Y SUS DERIVADOS; PIGMENTOS Y DEMÁS MATERIAS COLORANTES; PINTURAS Y BARNICES; MÁSTIQUES; TINTAS', 'Notas.
1. Este Capítulo no comprende:
a)
los productos de constitución química definida presentados aisladamente, excepto los que respondan a las especificaciones de las partidas 32.03 o', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (33, 10, '33', 'ACEITES ESENCIALES Y RESINOIDES; PREPARACIONES DE PERFUMERÍA, DE TOCADOR O DE COSMÉTICA', 'Notas.
1.
Este Capítulo no comprende:
a)
las oleorresinas naturales o extractos vegetales de las partidas 13.01 o 13.02;
b)
el jabón y demás productos de la partida 34.01;
c) las esencias de trementina, de madera de pino o de pasta celulósica al sulfato y demás productos de la partida 38.05.
2.
En la partida 33.02, se entiende por sustancias odoríferas únicamente las sustancias de la partida 33.01, los ingredientes odoríferos extraídos de estas
sustancias y los productos aromáticos sintéticos.
3.
Las partidas 33.03 a 33.07 se aplican, entre otros, a los productos, incluso sin mezclar (excepto los destilados acuosos aromáticos y las disoluciones acuosas
de aceites esenciales), aptos para ser utilizados como productos de dichas partidas y acondicionados para la venta al por menor para tales usos.
4.
En la partida 33.07, se consideran preparaciones de perfumería, de tocador o de cosmética, entre otros, los siguientes productos: las bolsitas con partes de
plantas aromáticas; las preparaciones odoríferas que actúan por combustión; los papeles perfumados y los papeles impregnados o recubiertos de
cosméticos; las disoluciones para lentes de contacto o para ojos artificiales; la guata, fieltro y tela sin tejer, impregnados, recubiertos o revestidos de
perfume o de cosméticos; las preparaciones de tocador para animales.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (34, 10, '34', 'JABÓN, AGENTES DE SUPERFICIE ORGÁNICOS, PREPARACIONES PARA LAVAR, PREPARACIONES LUBRICANTES, CERAS ARTIFICIALES, CERAS PREPARADAS, PRODUCTOS DE LIMPIEZA, VELAS Y ARTÍCULOS SIMILARES, PASTAS PARA MODELAR, «CERAS PARA ODONTOLOGÍA» Y PREPARACIONES PARA ODONTOLOGÍA A BASE DE YESO FRAGUABLE', 'Notas.
1.
Este Capítulo no comprende:
a)
las mezclas o preparaciones alimenticias de grasas o de aceites, animales, vegetales o de origen microbiano, de los tipos utilizados como
preparaciones de desmoldeo (partida15.17);
b)
los compuestos aislados de constitución química definida;
c)
los champúes, dentífricos, cremas y espumas de afeitar y las preparaciones para el baño, que contengan jabón u otros agentes de superficie
orgánicos (partidas 33.05, 33.06 o 33.07).
2.
En la partida 34.01, el término jabón solo se aplica al soluble en agua. El jabón y demás productos de esta partida pueden llevar añadidas otras sustancias
(por ejemplo: desinfectantes, polvos abrasivos, cargas, productos medicamentosos). Sin embargo, los que contengan abrasivos solo se clasifican en esta
partida si se presentan en barras, panes, trozos o piezas troqueladas o moldeadas. Si se presentan en otras formas, se clasifican en la partida 34.05 como
pastas y polvos de fregar y preparaciones similares.
3.
En la partida 34.02, los agentes de superficie orgánicos son productos que, al mezclarlos con agua a una concentración del 0,5  %  a 20  ° C  y dejarlos en
reposo durante una hora a la misma temperatura:
a)
producen un líquido trasparente o traslúcido o una emulsión estable sin separación de la materia insoluble; y
b)
reducen la tensión superficial del agua a un valor inferior o igual a 4,5 x 10-2 N/m (45 dinas/cm).
4.
La expresión aceites de petróleo o de mineral bituminoso empleada en el texto de la partida 34.03 se refiere a los productos definidos en la Nota 2 del', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (35, 10, '35', 'MATERIAS ALBUMINOIDEAS; PRODUCTOS A BASE DE ALMIDÓN O DE FÉCULA MODIFICADOS; COLAS; ENZIMAS', 'Notas.
1.
Este Capítulo no comprende:
a)
las levaduras (partida 21.02);
b)
las fracciones de la sangre (excepto la albúmina de la sangre sin preparar para usos terapéuticos o profilácticos), los medicamentos y demás
productos del Capítulo 30;
c) las preparaciones enzimáticas para precurtido (partida 32.02);
d)
las preparaciones enzimáticas para el lavado o prelavado y demás productos del Capítulo 34;
e)
las proteínas endurecidas (partida 39.13);
f)
los productos de las artes gráficas con soporte de gelatina (Capítulo 49).
2.
El término dextrina empleado en la partida 35.05 se aplica a los productos de la degradación de los almidones o féculas, con un contenido de azúcares
reductores, expresado en dextrosa sobre materia seca, inferior o igual al 10  % .
Los productos anteriores con un contenido de azúcares reductores superior al 10  %  se clasifican en la partida 17.02.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (36, 10, '36', 'PÓLVORA Y EXPLOSIVOS; ARTÍCULOS DE PIROTECNIA; FÓSFOROS (CERILLAS); ALEACIONES PIROFÓRICAS; MATERIAS INFLAMABLES', 'Notas.
1.
Este Capítulo no comprende los productos de constitución química definida presentados aisladamente, excepto los citados en las Notas 2 a) o 2 b)
siguientes.
2.
En la partida 36.06, se entiende por artículos de materias inflamables, exclusivamente:
a)
el metaldehído, la hexametilentetramina y productos similares, en tabletas, barritas o formas análogas, que impliquen su utilización como
combustibles, así como los combustibles a base de alcohol y los combustibles preparados similares, sólidos o en pasta;
b)
los combustibles líquidos y los gases combustibles licuados en recipientes de los tipos utilizados para cargar o recargar encendedores o mecheros,
de capacidad inferior o igual a 300 cm3; y
c)           las antorchas y hachos de resina, teas y similares.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (37, 10, '37', 'PRODUCTOS FOTOGRÁFICOS O CINEMATOGRÁFICOS', 'Notas.
1.
Este Capítulo no comprende los desperdicios ni los materiales de desecho.
2.
En este Capítulo, el término fotográfico se refiere al procedimiento mediante el cual se forman imágenes visibles sobre superficies fotosensibles, incluidas
las termosensibles, directa o indirectamente, por la acción de la luz o de otras formas de radiación.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (38, 10, '38', 'PRODUCTOS DIVERSOS DE LAS INDUSTRIAS QUÍMICAS', 'Notas.
1.
Este Capítulo no comprende:
a)
los productos de constitución química definida presentados aisladamente, excepto los siguientes:
1)
el grafito artificial (partida 38.01);
2)
los insecticidas, raticidas y demás antirroedores, fungicidas, herbicidas, inhibidores de germinación y reguladores del crecimiento de las plantas,
desinfectantes y productos similares, presentados en las formas o envases previstos en la partida 38.08;
3)
los productos extintores presentados como cargas para aparatos extintores o en granadas o bombas extintoras (partida 38.13);
4)     los materiales de referencia certificados especificados en la Nota 2 siguiente;
5)
los productos citados en las Notas 3 a) o 3 c) siguientes;
b)
las mezclas de productos químicos con sustancias alimenticias u otras que tengan valor nutritivo, de los tipos utilizados en la preparación de alimentos
para consumo humano (partida 21.06, generalmente);
c)
los productos de la partida 24.04;
d)
las escorias, cenizas y residuos (incluidos los lodos, excepto los lodos de depuración), que contengan metal, arsénico o sus mezclas y cumplan las
condiciones de las Notas 3 a) o 3 b) del Capítulo 26 (partida 26.20);
e)
los medicamentos (partidas 30.03 o 30.04);
f)
los catalizadores agotados de los tipos utilizados para la extracción de metal común o para la fabricación de compuestos químicos a base de metal
común (partida 26.20), los catalizadores agotados de los tipos utilizados principalmente para la recuperación de metal precioso (partida 71.12), así
como los catalizadores constituidos por metales o aleaciones metálicas que se presenten, por ejemplo, en forma de polvo muy fino o de tela metálica
(Secciones XIV o XV).
2.
A)
En la partida 38.22, se entiende por material de referencia certificado  el material de referencia que está acompañado por un certificado que
indica los valores de las propiedades certificadas y los métodos utilizados para determinar estos valores, así como el grado de certeza asociado a
cada valor, el cual es apto para ser utilizado con fines de análisis, calibración o referencia.
B)
Con excepción de los productos de los Capítulos 28 o 29, para la clasificación del material de referencia certificado, la partida 38.22 tiene
prioridad sobre cualquier otra partida de la Nomenclatura.
3.
Se clasifican en la partida 38.24 y no en otra de la Nomenclatura:
a)
los cristales cultivados (excepto los elementos de óptica) de óxido de magnesio o de sales halogenadas de los metales alcalinos o alcalinotérreos, de
peso unitario superior o igual a 2,5 g;
b)
los aceites de fusel; el aceite de Dippel;
c)
los productos borradores de tinta acondicionados en envases para la venta al por menor;
d)
los productos para la corrección de clisés de mimeógrafo («stencils»), los demás correctores líquidos y las cintas correctoras (excepto las de la partida', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (39, 14, '39', 'PLÁSTICO Y SUS MANUFACTURAS', 'Notas.
1.
En la Nomenclatura, se entiende por plástico las materias de las partidas 39.01 a 39.14 que, sometidas a una influencia exterior (generalmente el calor y la
presión y, en su caso, la acción de un disolvente o de un plastificante), son o han sido susceptibles de adquirir una forma por moldeo, colada, extrusión,
laminado o cualquier otro procedimiento, en el momento de la polimerización o en una etapa posterior, forma que conservan cuando esta influencia ha
dejado de ejercerse.
En la Nomenclatura, el término plástico comprende también la fibra vulcanizada. Sin embargo, dicho término no se aplica a las materias textiles de la', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (40, 14, '40', 'CAUCHO Y SUS MANUFACTURAS', 'Notas.
1.
En la Nomenclatura, salvo disposición en contrario, la denominación caucho comprende los productos siguientes, incluso vulcanizados o endurecidos:
caucho natural, balata, gutapercha, guayule, chicle y gomas naturales análogas, caucho sintético, caucho facticio derivado de los aceites y todos estos
productos regenerados.
2.
Este Capítulo no comprende:
a)
los productos de la Sección XI (materias textiles y sus manufacturas);
b)
el calzado y partes del calzado, del Capítulo 64;
c)
los sombreros, demás tocados, y sus partes, incluidos los gorros de baño, del Capítulo 65;
d)
las partes de caucho endurecido para máquinas y aparatos mecánicos o eléctricos, así como todos los objetos o partes de objetos de caucho
endurecido para uso electrotécnico, de la Sección XVI;
e)
los artículos de los Capítulos 90, 92, 94 o 96;
f)
los artículos del Capítulo 95, excepto los guantes, mitones y manoplas de deporte y los artículos comprendidos en las partidas 40.11 a 40.13.
3.
En las partidas 40.01 a 40.03 y 40.05, la expresión formas primarias se aplica únicamente a las formas siguientes:
a)
líquidos y pastas (incluido el látex, aunque esté prevulcanizado, y demás dispersiones y disoluciones);
b)
bloques irregulares, trozos, balas, polvo, gránulos, migas y masas no coherentes similares.
4.
En la Nota 1 de este Capítulo y en la partida 40.02, la denominación caucho sintético se aplica:
a)
a las materias sintéticas no saturadas que puedan transformarse irreversiblemente por vulcanización con azufre en sustancias no termoplásticas
que, a una temperatura comprendida entre 18  ° C  y 29  ° C , puedan alargarse hasta tres veces su longitud primitiva sin romperse y que, después
de alargarse hasta dos veces su longitud primitiva, adquieran en menos de cinco minutos una longitud no mayor de una vez y media su longitud
primitiva. Para este ensayo, pueden añadirse las sustancias necesarias para la reticulación, tales como activadores o aceleradores de vulcanización;', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (41, 7, '41', 'PIELES (EXCEPTO LA PELETERÍA) Y CUEROS', 'Notas.
1.
Este Capítulo no comprende:
a)
los recortes y desperdicios similares de cueros y pieles en bruto (partida 05.11);
b)
las pieles y partes de pieles de ave, con sus plumas o plumón (partidas 05.05 o 67.01, según los casos);
c)
los cueros y pieles en bruto, curtidos o adobados, sin depilar, de animales de pelo (Capítulo 43). Sin embargo, se clasifican en este Capítulo las
pieles en bruto sin depilar de bovino (incluidas las de búfalo), de equino, ovino (excepto las de cordero llamadas astracán, «Breitschwanz»,
«caracul», «persa» o similares y las pieles de cordero de Indias, de China, de Mongolia o del Tíbet), de caprino (excepto las de cabra, cabritilla o
cabrito del Yemen, de Mongolia o del Tíbet), de porcino (incluidas las de pecarí), de gamuza, gacela, camello, dromedario, reno, alce, ciervo, corzo o
perro.
2.
A)
Las partidas 41.04 a 41.06 no comprenden los cueros y pieles que hayan sufrido un proceso de curtido (incluido el precurtido) reversible (partidas', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (42, 7, '42', 'MANUFACTURAS DE CUERO; ARTÍCULOS DE TALABARTERÍA O GUARNICIONERÍA; ARTÍCULOS DE VIAJE, BOLSOS DE MANO (CARTERAS) Y CONTINENTES SIMILARES; MANUFACTURAS DE TRIPA', 'Notas.
1.
En este Capítulo, la expresión cuero natural comprende también los cueros y pieles agamuzados (incluido el agamuzado combinado al aceite), los cueros y
pieles charolados y sus imitaciones de cueros o pieles chapados y los cueros y pieles metalizados.
2.
Este Capítulo no comprende:
a)
los catguts estériles y las ligaduras estériles similares para suturas quirúrgicas (partida 30.06);
b)
las prendas y complementos (accesorios), de vestir (excepto los guantes, mitones y manoplas), de cuero o piel, forrados interiormente con peletería
natural o peletería facticia o artificial, así como las prendas y complementos (accesorios), de vestir, de cuero o piel con partes exteriores de peletería
natural o peletería facticia o artificial, cuando éstas superen el papel de simples guarniciones (partidas 43.03 o 43.04, según los casos);
c)
los artículos confeccionados con redes de la partida 56.08;
d)
los artículos del Capítulo 64;
e)
los sombreros, demás tocados, y sus partes, del Capítulo 65;
f)
los látigos, fustas y demás artículos de la partida 66.02;
g)
los gemelos, pulseras y demás artículos de bisutería (partida 71.17);
h)
los accesorios y guarniciones de talabartería o guarnicionería (por ejemplo: frenos, estribos, hebillas), presentados aisladamente (Sección XV,
generalmente);
ij)
las cuerdas armónicas, parches de tambor o de instrumentos similares y demás partes de instrumentos musicales (partida 92.09);
k)
los artículos del Capítulo 94 (por ejemplo: muebles, luminarias y aparatos de alumbrado);
l)
los artículos del Capítulo 95 (por ejemplo: juguetes, juegos, artefactos deportivos);
m)
los botones, botones de presión, formas para botones y demás partes de botones o de botones de presión y esbozos de botones, de la partida 96.06.
3.
A)
Además de lo dispuesto en la Nota 2 anterior, la partida 42.02 no comprende:
a)
las bolsas de hojas de plástico, con asas, no concebidas para un uso prolongado, incluso impresas (partida 39.23);
b)
los artículos de materia trenzable (partida 46.02).
B)
Las manufacturas comprendidas en las partidas 42.02 y 42.03 con partes de metal precioso o de chapados de metal precioso (plaqué), de perlas
finas (naturales)* o cultivadas o de piedras preciosas o semipreciosas (naturales, sintéticas o reconstituidas) permanecen incluidas en estas partidas,
incluso si dichas partes exceden la función de simples accesorios o adornos de mínima importancia, a condición de que tales partes no confieran a las
manufacturas su carácter esencial. Si, por el contrario, esas partes confieren a las manufacturas su carácter esencial, éstas deben clasificarse en el', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (43, 7, '43', 'PELETERÍA Y CONFECCIONES DE PELETERÍA; PELETERÍA FACTICIA O ARTIFICIAL', 'Notas.
1.
Independientemente de la peletería en bruto de la partida 43.01, en la Nomenclatura, el término peletería abarca las pieles de todos los animales
curtidas o adobadas, sin depilar.
2.
Este Capítulo no comprende:
a)
las pieles y partes de pieles de ave con sus plumas o plumón (partidas 05.05 o 67.01, según los casos);
b)
los cueros y pieles, en bruto, sin depilar, de la naturaleza de los clasificados en el Capítulo 41 en virtud de la Nota 1 c) de dicho Capítulo;
c)
los guantes, mitones y manoplas, confeccionados a la vez con peletería natural o peletería facticia o artificial y con cuero (partida 42.03);
d)
los artículos del Capítulo 64;
e)
los sombreros, demás tocados, y sus partes, del Capítulo 65;
f)
los artículos del Capítulo 95 (por ejemplo: juguetes, juegos, artefactos deportivos).
3.
Se clasifican en la partida 43.03, la peletería y partes de peletería, ensambladas con otras materias, y la peletería y partes de peletería, cosidas formando
prendas, partes de prendas, complementos (accesorios), de vestir u otros artículos.
4.
Se clasifican en las partidas 43.03 o 43.04, según los casos, las prendas y complementos (accesorios), de vestir, de cualquier clase (excepto los excluidos
de este Capítulo por la Nota 2), forrados interiormente con peletería natural o con peletería facticia o artificial, así como las prendas y complementos
(accesorios), de vestir, con partes exteriores de peletería natural o peletería facticia o artificial, cuando dichas partes no sean simples guarniciones.
5.
En la Nomenclatura, se consideran peletería facticia o artificial las imitaciones de peletería obtenidas con lana, pelo u otras fibras, aplicados por pegado o
cosido, sobre cuero, tejido u otras materias, excepto las imitaciones obtenidas por tejido o por punto (partidas 58.01 o 60.01, generalmente).', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (44, 7, '44', 'MADERA, CARBÓN VEGETAL Y MANUFACTURAS DE MADERA', 'Notas.
1.
Este Capítulo no comprende:
a)
las virutas y astillas de madera ni la madera triturada, molida o pulverizada, de las especies utilizadas principalmente en perfumería, en medicina o
para usos insecticidas, parasiticidas o similares (partida 12.11);
b)
el bambú ni demás materias de naturaleza leñosa de las especies utilizadas principalmente en cestería o espartería, en bruto, incluso hendidos,
aserrados longitudinalmente o cortados en longitudes determinadas (partida 14.01);
c)
las virutas y astillas de madera ni la madera molida o pulverizada, de las especies utilizadas principalmente como tintóreas o curtientes (partida', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (45, 8, '45', 'CORCHO Y SUS MANUFACTURAS', 'Nota.
1.
Este Capítulo no comprende:
a)
el calzado y sus partes, del Capítulo 64;
b)
los sombreros, demás tocados, y sus partes, del Capítulo 65;
c)
los artículos del Capítulo 95 (por ejemplo: juguetes, juegos, artefactos deportivos).
d)
los vehículos y las cajas para vehículos, de cestería (Capítulo 87);
e)
los artículos del Capítulo 94 (por ejemplo: muebles, luminarias y aparatos de alumbrado).
3.
En la partida 46.01, se consideran materia trenzable, trenzas y artículos similares de materia trenzable, paralelizados, los artículos constituidos por
materia trenzable, trenzas o artículos similares de materia trenzable, yuxtapuestos formando napas por medio de ligaduras, aunque estas últimas sean de
materia textil hilada.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (46, 8, '46', 'MANUFACTURAS DE ESPARTERÍA O CESTERÍA', 'Notas.
1.
En este Capítulo, la expresión materia trenzable se refiere a materias en un estado o forma tales que puedan trenzarse, entrelazarse o trabajarse de modo
análogo. Se consideran como tales, por ejemplo: la paja, mimbre, sauce, bambú, roten (ratán)*, junco, caña, cintas de madera, tiras de otros vegetales
(por ejemplo: tiras de corteza, hojas estrechas y rafia u otras tiras obtenidas de hojas anchas), fibras textiles naturales sin hilar, monofilamentos, tiras y
formas similares de plástico y tiras de papel, pero no las tiras de cuero o piel preparados o de cuero regenerado, de fieltro o tela sin tejer, ni el cabello,
crin, mechas e hilados de materia textil ni monofilamentos, tiras y formas similares del Capítulo 54.
2.
Este Capítulo no comprende:
a)
los revestimientos de paredes de la partida 48.14;
b)
los cordeles, cuerdas y cordajes, trenzados o no (partida 56.07);
c)
el calzado y los sombreros, demás tocados, y sus partes, de los Capítulos 64 y 65;', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (47, 5, '47', 'PASTA DE MADERA O DE LAS DEMÁS MATERIAS FIBROSAS CELULÓSICAS; PAPEL O CARTÓN PARA RECICLAR (DESPERDICIOS Y DESECHOS)', 'Nota.
1.
En la partida 47.02, se entiende por pasta química de madera para disolver la pasta química cuya fracción de pasta insoluble después de una hora en una
disolución al 18  %  de hidróxido de sodio (NaOH) a 20  ° C , sea superior o igual al 92  %  en peso en la pasta de madera a la sosa (soda) o al sulfato o
superior o igual al 88  %  en peso en la pasta de madera al sulfito, siempre que en este último caso el contenido de cenizas sea inferior o igual al 0,15
%  en peso.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (48, 5, '48', 'PAPEL Y CARTÓN; MANUFACTURAS DE PASTA DE CELULOSA, DE PAPEL O CARTÓN', 'Notas.
1.
En este Capítulo, salvo disposición en contrario, toda referencia a  papel  incluye también al cartón, sin que se tenga en cuenta el espesor o el peso por
m2.
2.
Este Capítulo no comprende:
a)
los artículos del Capítulo 30;
b)
las hojas para el marcado a fuego de la partida 32.12;
c)
los papeles perfumados y los papeles impregnados o recubiertos de cosméticos (Capítulo 33);
d)
el papel y la guata de celulosa impregnados, recubiertos o revestidos de jabón o de detergentes (partida 34.01), o de cremas, encáusticos,
abrillantadores (lustres) o preparaciones similares (partida 34.05);
e)
el papel y cartón sensibilizados de las partidas 37.01 a 37.04;
f)
el papel impregnado con reactivos de diagnóstico o de laboratorio (partida 38.22);
g)
el plástico estratificado con papel o cartón, los productos constituidos por una capa de papel o cartón recubiertos o revestidos de una capa de
plástico cuando el espesor de esta última sea superior a la mitad del espesor total, y las manufacturas de estas materias, excepto los revestimientos
para paredes de la partida 48.14 (Capítulo 39);
h)
los artículos de la partida 42.02 (por ejemplo, artículos de viaje);
ij)
los artículos del Capítulo 46 (manufacturas de espartería o cestería);
k)
los hilados de papel y los artículos textiles de hilados de papel (Sección XI);
l)
los artículos de los Capítulos 64 o 65;
m)
los abrasivos aplicados sobre papel o cartón (partida 68.05) y la mica aplicada sobre papel o cartón (partida 68.14); por el contrario, el papel o
cartón revestidos de polvo de mica se clasifican en este Capítulo;
n)
las hojas y tiras delgadas de metal con soporte de papel o cartón (generalmente Secciones XIV o XV);
o)
los artículos de la partida 92.09;
p)
los artículos del Capítulo 95 (por ejemplo: juguetes, juegos, artefactos deportivos);
q)
los artículos del Capítulo 96 (por ejemplo: botones, compresas y tampones higiénicos, pañales).
3.
Salvo lo dispuesto en la Nota 7, se clasifican en las partidas 48.01 a 48.05 el papel y cartón que, por calandrado u otro modo, se hayan alisado, satinado,
abrillantado, glaseado, pulido o sometido a otras operaciones de acabado similares, o a un falso afiligranado o un aprestado en la superficie, así como el
papel, cartón, guata de celulosa y napa de fibras de celulosa, coloreados o jaspeados en la masa por cualquier procedimiento. Salvo lo dispuesto en la
partida 48.03, estas partidas no se aplican al papel, cartón, guata de celulosa y napa de fibras de celulosa que hayan sido tratados de otro modo.
4.
En este Capítulo, se considera papel prensa el papel sin estucar ni recubrir del tipo utilizado para la impresión de diarios, en el que el contenido de fibras de
madera obtenidas por procedimiento mecánico o químico-mecánico sea superior o igual al 50 % en peso del contenido total de fibra, sin encolar o muy
ligeramente encolado, cuyo índice de rugosidad, medido en el aparato Parker Print Surf (1 MPa) sobre cada una de las caras, sea superior a 2,5
micrómetros (micras, micrones)* y de peso superior o igual a 40 g/m² pero inferior o igual a 65 g/m² y presentado exclusivamente a) en tiras o bobinas
(rollos) de anchura superior a 28 cm; o b) en hojas de forma cuadrada o rectangular en las que sus lados sean superiores a 28 cm y a 15 cm, medidos sin
plegar.
5.
En la partida 48.02, se entiende por papel y cartón de los tipos utilizados para escribir, imprimir u otros fines gráficos y papel y cartón para tarjetas o
cintas para perforar (sin perforar), el papel y cartón fabricados principalmente con pasta blanqueada o con pasta obtenida por procedimiento mecánico
o químico-mecánico que cumplan alguna de las condiciones siguientes:
A)
Para el papel o cartón de peso inferior o igual a 150 g/m2:
a)
un contenido de fibras obtenidas por procedimiento mecánico o químico-mecánico superior o igual al 10  % , y
1)
un peso inferior o igual a 80 g/m2, o
2)
estar coloreado en la masa;
b)
un contenido de cenizas superior al 8 %, y
1) un peso inferior o igual a 80 g/m2, o
2) estar coloreado en la masa;
c)
un contenido de cenizas superior al 3  %  y un grado de blancura (factor de reflectancia) superior o igual al 60  % ;
d)
un contenido de cenizas superior al 3  %  pero  inferior o igual al 8  % , un grado de blancura (factor de reflectancia) inferior al 60  %  y un
índice de resistencia al estallido inferior o igual a 2,5 kPam2/g;
e)
un contenido de cenizas inferior o igual al 3  % , un grado de blancura (factor de reflectancia) superior o igual al 60  %  y un índice de
resistencia al estallido inferior o igual a 2,5 kPam2/g;
B)
Para el papel o cartón de peso superior a 150 g/m2:
a)
estar coloreado en la masa;
b)
un grado de blancura (factor de reflectancia) superior o igual al 60  % , y
1)
un espesor inferior o igual a 225 micrómetros (micras, micrones)*,  o
2)
un espesor superior a 225 micras micrómetros (micras, micrones)* pero inferior o igual a 508 micrómetros (micras, micrones)* y un contenido
de cenizas superior al 3  % ;
Peso
Resistencia mínima al estallido Mullen
g/m²
_______
kPa
___________________________________
115
393
125
417
200
637
300
824
400
961
2.
En las subpartidas 4804.21 y 4804.29, se considera papel Kraft para sacos (bolsas) el papel alisado en ambas caras, presentado en bobinas (rollos), en el
que el contenido de fibras obtenidas por el procedimiento químico al sulfato o a la sosa (soda) sea   superior o igual al 80 %  en peso del contenido total
de fibra, de peso superior o igual a 60 g/m² pero inferior o igual a 115 g/m²,  y que responda a una de las condiciones siguientes:
a)
que tenga un índice de estallido Mullen superior o igual a 3,7 kPam2/g y un alargamiento superior al 4,5  %  en la dirección transversal y al 2  %
en la dirección longitudinal de la máquina;
b)
que tenga la resistencia mínima al desgarre y a la ruptura por tracción indicadas en el cuadro siguiente o sus equivalentes interpolados linealmente
para cualquier otro peso:
Peso
Resistencia mínima
al desgarre
mN
Resistencia mínima a la ruptura
por tracción
kN/m
g/m2
Dirección
longitudinal de
la máquina
Dirección longitudinal de la
máquina más dirección
transversal
Dirección
transversal
Dirección longitudinal de la
máquina más dirección
transversal
60
700
1.510
1,9
6,0
70
830
1.790
2,3
7,2
80
965
2.070
2,8
8,3
100
1.230
2.635
3,7
10,6
115
1.425
3.060
4,4
12,3
c)
un grado de blancura (factor de reflectancia) inferior al 60  % , un espesor inferior o igual a 254 micrómetros (micras, micrones)* y un contenido
de cenizas superior al 8  % .
Sin embargo, la partida 48.02 no comprende el papel y cartón filtro (incluido el papel para bolsitas de té) ni el papel y cartón fieltro.
6.
En este Capítulo, se entiende por papel y cartón Kraft, el papel y cartón con un contenido de fibras obtenidas por procedimiento químico al sulfato o a la
sosa (soda) superior o igual al 80  %  en peso del contenido total de fibra.
7.
Salvo disposición en contrario en los textos de partida, el papel, cartón, guata de celulosa y napa de fibras de celulosa, que puedan clasificarse en dos o
más de las partidas 48.01 a 48.11, se clasifican en la que, de entre ellas, figure en la Nomenclatura en último lugar por orden de numeración.
8.
En las partidas 48.03 a 48.09, se clasifican solamente el papel, cartón, guata de celulosa y napa de fibras de celulosa que se presenten en una de las
formas siguientes:
a)
tiras o bobinas (rollos) de anchura superior a 36 cm; o
b)
hojas en forma cuadrada o rectangular en las que sus lados sean superiores a 36 cm y a 15 cm, medidos sin plegar.
9.
En la partida 48.14, se entiende por papel para decorar y revestimientos similares de paredes o techos:
a)
el papel en bobinas (rollos) de anchura superior o igual a 45 cm pero inferior o igual a 160 cm, adecuado para la decoración de paredes o de techos:
1)
graneado, gofrado, coloreado, impreso con motivos o decorado de otro modo en la superficie (por ejemplo, con tundizno), incluso recubierto o
revestido de un plástico protector transparente; o
2)
con la superficie graneada debido a la presencia de partículas de madera, de paja, etc; o
3)
recubierto o revestido en la cara vista con plástico que esté graneado, gofrado, coloreado, impreso con motivos o decorado de otro modo; o
4)
revestido en la cara vista con materia trenzable, incluso tejida en forma plana o paralelizada;
b)
las cenefas y frisos de papel, tratados como los anteriores, incluso en bobinas (rollos), adecuados para la decoración de paredes o techos;
c)       los revestimientos murales de papel constituidos por varios paneles, en bobinas (rollos) o en hojas, impresos de modo que formen un paisaje, una
figura u otro motivo después de colocados en la pared.
Las manufacturas con soporte de papel o cartón susceptibles de utilizarse como cubresuelos o como revestimientos de paredes se clasifican en la partida', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (49, 5, '49', 'PRODUCTOS EDITORIALES, DE LA PRENSA Y DE LAS DEMÁS INDUSTRIAS GRÁFICAS; TEXTOS MANUSCRITOS O MECANOGRAFIADOS Y PLANOS', 'Notas.
1.
Este Capítulo no comprende:
a)
los negativos y positivos fotográficos con soporte transparente (Capítulo 37);
b)
los mapas, planos y esferas, en relieve, incluso impresos (partida 90.23);
c)
los naipes y demás artículos del Capítulo 95;
d)
los grabados, estampas y litografías originales (partida 97.02), los sellos (estampillas) de correo, timbres fiscales, marcas postales, sobres primer día,
enteros postales, demás artículos franqueados y análogos de la partida 97.04, las antigüedades de más de cien años y demás artículos del Capítulo
97.
2.
En el Capítulo 49, el término impreso significa también reproducido con copiadora, obtenido por un procedimiento controlado por una máquina automática
para tratamiento o procesamiento de datos, por estampado en relieve, fotografía, fotocopia, termocopia o mecanografiado.
3.
Los diarios y publicaciones periódicas encuadernados, así como las colecciones de diarios o de publicaciones periódicas presentadas bajo una misma
cubierta, se clasifican en la partida 49.01, aunque contengan publicidad.
4.
También se clasifican en la partida 49.01:
a)
las colecciones de grabados, de reproducciones de obras de arte, de dibujos, etc., que constituyan obras completas, paginadas y susceptibles de
formar un libro, cuando los grabados estén acompañados de un texto referido a las obras o a sus autores;
b)
las láminas ilustradas que se presenten al mismo tiempo que un libro y como complemento de éste;
c)
los libros presentados en fascículos o en hojas separadas, de cualquier formato, que constituyan una obra completa o parte de una obra para
encuadernar en rústica o de otra forma.
Sin embargo, los grabados e ilustraciones, que no tengan texto y se presenten en hojas separadas de cualquier formato, se clasifican en la partida 49.11.
5.
Salvo lo dispuesto en la Nota 3 de este Capítulo, la partida 49.01 no comprende las publicaciones consagradas fundamentalmente a la publicidad (por
ejemplo: folletos, prospectos, catálogos comerciales, anuarios publicados por asociaciones comerciales, propaganda turística). Estas publicaciones se
clasifican en la partida 49.11.
6.
En la partida 49.03, se consideran álbumes o libros de estampas para niños los álbumes o libros para niños cuyas ilustraciones sean el atractivo principal y
cuyos textos solo tengan un interés secundario.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (50, 6, '50', 'SEDA', '', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (51, 6, '51', 'LANA Y PELO FINO U ORDINARIO; HILADOS Y TEJIDOS DE CRIN', 'Nota.
1. En la Nomenclatura se entiende por:
a)
lana, la fibra natural que recubre los ovinos;
b)
pelo fino, el pelo de alpaca, llama (incluido el guanaco), vicuña, camello, dromedario, yac, cabra de Angora («mohair»), cabra del Tíbet, cabra de
Cachemira o cabras similares (excepto cabras comunes), conejo (incluido el conejo de Angora), liebre, castor, coipo o rata almizclera;
c)
pelo ordinario, el pelo de los animales no citados anteriormente, excepto el pelo y las cerdas de cepillería (partida 05.02) y la crin (partida', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (52, 6, '52', 'ALGODÓN Nota de subpartida. 1. En las subpartidas 5209.42 y 5211.42, se entiende por tejidos de mezclilla («denim») los tejidos con hilados de distintos colores, de ligamento sarga de curso inferior o igual a 4, incluida la sarga quebrada (a veces llamada raso de 4), de efecto por urdimbre, en los que los hilos de urdimbre sean de un solo y mismo color y los de trama, crudos, blanqueados, teñidos de gris o coloreados con un matiz más claro que el utilizado en los hilos de urdimbre.', '', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (53, 6, '53', 'LAS DEMÁS FIBRAS TEXTILES VEGETALES; HILADOS DE PAPEL Y TEJIDOS DE HILADOS DE PAPEL', '', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (54, 6, '54', 'FILAMENTOS SINTÉTICOS O ARTIFICIALES; TIRAS Y FORMAS SIMILARES DE MATERIA TEXTIL SINTÉTICA O ARTIFICIAL', 'Notas.
1.
En la Nomenclatura, las expresiones fibras sintéticas y fibras artificiales se refieren a las fibras discontinuas y a los filamentos de polímeros orgánicos
obtenidos industrialmente:
a)
por polimerización de monómeros orgánicos para obtener polímeros tales como poliamidas, poliésteres, poliolefinas o poliuretanos, o por
modificación química de polímeros obtenidos por este procedimiento (por ejemplo, poli(alcohol vinílico) obtenido por hidrólisis del poli(acetato de
vinilo));
b)
por disolución o tratamiento químico de polímeros orgánicos naturales (por ejemplo, celulosa) para obtener polímeros tales como rayón
cuproamónico (cupro) o rayón viscosa, o por modificación química de polímeros orgánicos naturales (por ejemplo: celulosa, caseína y otras
proteínas, o ácido algínico) para obtener polímeros tales como acetato de celulosa o alginatos.
Se consideran sintéticas las fibras definidas en a) y artificiales las definidas en b).  Las tiras y formas similares de la partida 54.04 o 54.05 no se consideran
fibras sintéticas o artificiales.
Los términos sintético y artificial se aplican también, con el mismo sentido, a la expresión materia textil.
2.
Las partidas 54.02 y 54.03 no comprenden los cables de filamentos sintéticos o artificiales del Capítulo 55.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (55, 6, '55', 'FIBRAS SINTÉTICAS O ARTIFICIALES DISCONTINUAS', 'Nota.
1.
En las partidas 55.01 y 55.02, se entiende por cables de filamentos sintéticos y cables de filamentos artificiales, los cables constituidos por un conjunto de
filamentos paralelos de longitud uniforme e igual a la de los cables, que satisfagan las condiciones siguientes:
a)
longitud del cable superior a 2 m;
b)
torsión del cable inferior a 5 vueltas por metro;
c)
título unitario de los filamentos inferior a 67 decitex;
d)
solamente para los cables de filamentos sintéticos: que hayan sido estirados y, por ello, no puedan alargarse una proporción superior al 100  %
de su longitud;
e)
título total del cable superior a 20.000 decitex.
Los cables de longitud inferior o igual a 2 m se clasifican en las partidas 55.03 o 55.04.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (56, 6, '56', 'GUATA, FIELTRO Y TELA SIN TEJER; HILADOS ESPECIALES; CORDELES, CUERDAS Y CORDAJES; ARTÍCULOS DE CORDELERÍA', 'Notas.
1.
Este Capítulo no comprende:
a)
la guata, fieltro y tela sin tejer, impregnados, recubiertos o revestidos de sustancias o preparaciones (por ejemplo: de perfume o cosméticos del', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (57, 6, '57', 'ALFOMBRAS Y DEMÁS REVESTIMIENTOS PARA EL SUELO, DE MATERIA TEXTIL', 'Notas.
1.
En este Capítulo, se entiende por alfombras y demás revestimientos para el suelo, de materia textil, cualquier revestimiento para el suelo cuya superficie de
materia textil quede al exterior después de colocado. También están comprendidos los artículos que tengan las características de los revestimientos para el
suelo de materia textil pero que se utilicen para otros fines.
2.
Este Capítulo no comprende los productos textiles planos y bastos de protección que se colocan bajo las alfombras y demás revestimientos para el suelo.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (58, 6, '58', 'TEJIDOS ESPECIALES; SUPERFICIES TEXTILES CON MECHÓN INSERTADO; ENCAJES; TAPICERÍA; PASAMANERÍA; BORDADOS', 'Notas.
1.
No se clasifican en este Capítulo los tejidos especificados en la Nota 1 del Capítulo 59, impregnados, recubiertos, revestidos o estratificados ni los demás
productos del Capítulo 59.
2.
Se clasifican también en la partida 58.01 el terciopelo y la felpa por trama sin cortar todavía que no presenten ni pelo ni bucles en la superficie.
3.
En la partida 58.03, se entiende por tejido de gasa de vuelta el tejido en el que la urdimbre esté compuesta en toda o parte de su superficie por hilos
fijos (hilos derechos) y por hilos móviles (hilos de vuelta) que se cruzan con los fijos dando media vuelta, una vuelta completa o más de una vuelta, para
formar un bucle que aprisiona la trama.
4.
No se clasifican en la partida 58.04 las redes de mallas anudadas, en paño o en pieza, fabricadas con cordeles, cuerdas o cordajes, de la partida 56.08.
5.
En la partida 58.06, se entiende por cintas:
a)
- los tejidos (incluido el terciopelo) en tiras de anchura inferior o igual a 30 cm y con orillos verdaderos;
- las tiras de anchura inferior o igual a 30 cm obtenidas por corte de tejido y provistas de falsos orillos tejidos, pegados u obtenidos de otra
forma;
b)
los tejidos tubulares que, aplanados, tengan una anchura inferior o igual a 30 cm;
c)
los tejidos al bies con bordes plegados de anchura inferior o igual a 30 cm una vez desplegados.
Las cintas con flecos obtenidos durante el tejido se clasifican en la partida 58.08.
6.
El término bordados de la partida 58.10 se extiende a las aplicaciones por costura de lentejuelas, cuentas o motivos decorativos de textil u otra materia,
así como a los trabajos realizados con hilos bordadores de metal o fibra de vidrio. Se excluye de la partida 58.10 la tapicería de aguja (partida 58.05).
7.
Además de los productos de la partida 58.09, se clasifican también en las partidas de este Capítulo los productos hechos con hilos de metal, de los tipos
utilizados en prendas de vestir, tapicería o usos similares.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (59, 6, '59', 'TELAS IMPREGNADAS, RECUBIERTAS, REVESTIDAS O ESTRATIFICADAS; ARTÍCULOS TÉCNICOS DE MATERIA TEXTIL', 'Notas.
1.
Salvo disposición en contrario, cuando se utilice en este Capítulo el término tela(s), se refiere a los tejidos de los Capítulos 50 a 55 y de las partidas 58.03
y 58.06, a las trenzas, artículos de pasamanería y artículos ornamentales análogos, en pieza, de la partida 58.08 y a los tejidos de punto de las partidas', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (60, 6, '60', 'TEJIDOS DE PUNTO', 'Notas.
1.
Este Capítulo no comprende:
a)
los encajes de croché o ganchillo de la partida 58.04;
b)
las etiquetas, escudos y artículos similares, de punto, de la partida 58.07;
c)
los tejidos de punto impregnados, recubiertos, revestidos o estratificados, del Capítulo 59. Sin embargo, el terciopelo, la felpa y los tejidos con
bucles, de punto, incluso impregnados, recubiertos, revestidos o estratificados, se clasifican en la partida 60.01.
2.
Este Capítulo comprende también los tejidos de punto fabricados con hilos de metal, de los tipos utilizados en prendas de vestir, tapicería o usos
similares.
3.
En la Nomenclatura, la expresión de punto incluye los productos obtenidos mediante costura por cadeneta en los que las mallas estén constituidas por
hilados textiles.
Nota de subpartida.
1.
La subpartida 6005.35 comprende los tejidos de monofilamentos de polietileno o de multifilamentos de poliéster, con un peso superior o igual a 30 g/m2
pero inferior o igual a 55 g/m2, cuya malla contenga una cantidad superior o igual a 20 perforaciones/cm2 pero inferior o igual a 100 perforaciones/cm2,
impregnados o recubiertos con alfa-cipermetrina (ISO), clorfenapir (ISO), deltametrina (DCI, ISO), lambda-cialotrina (ISO), permetrina (ISO) o pirimifos-
metil (ISO).', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (61, 6, '61', 'PRENDAS Y COMPLEMENTOS (ACCESORIOS), DE VESTIR, DE PUNTO', 'Notas.
1.
Este Capítulo solo comprende artículos de punto confeccionados.
2.
Este Capítulo no comprende:
a)
los artículos de la partida 62.12;
b)
los artículos de prendería de la partida 63.09;
c)
los artículos de ortopedia, tales como bragueros para hernias, fajas medicoquirúrgicas (partida 90.21).
3.
En las partidas 61.03 y 61.04:
a)
se entiende por trajes (ambos o ternos) y trajes sastre los surtidos formados por dos o tres prendas de vestir confeccionadas en su superficie
exterior con la misma tela y compuestos por:
-
una sola chaqueta (saco) que cubra la parte superior del cuerpo, cuyo exterior, excepto las mangas, esté constituido por cuatro o más
piezas, eventualmente acompañada de un solo chaleco sastre en el que su parte delantera esté confeccionada con la misma tela que la
superficie exterior de los demás componentes del surtido y cuya espalda sea de la misma tela que el forro de la chaqueta (saco); y
-
una sola prenda que cubra la parte inferior del cuerpo y que consista en un pantalón largo, un pantalón corto (calzón), un short (excepto de
baño), una falda o una falda pantalón, sin tirantes (tiradores) ni peto.
Todos los componentes del traje (ambo o terno) o del traje sastre deberán confeccionarse con una tela de la misma estructura, color y
composición; además, deberán ser del mismo estilo y de tallas correspondientes o compatibles. Sin embargo, estos componentes pueden
presentar un vivo (tira de tela cosida a las costuras) de una tela diferente.
Si se presentan simultáneamente varias prendas de la parte inferior, por ejemplo: un pantalón largo y un short o dos pantalones largos, o una
falda o falda pantalón y un pantalón, se dará prioridad al pantalón largo o a uno de ellos como parte inferior constitutiva del traje (ambo o terno),
y a la falda o falda pantalón en el caso del traje sastre, clasificándose separadamente las demás prendas.
Aunque no cumplan todas las condiciones antes citadas, la expresión trajes (ambos o ternos) también comprende los trajes de etiqueta o de
noche siguientes:
-
el chaqué, en el que la chaqueta (saco), lisa, presenta faldones redondeados que descienden muy bajo hacia atrás, con un pantalón de
rayas verticales;
-
el frac, hecho generalmente de tela negra, con una chaqueta (saco) relativamente corta por delante, que se mantiene abierta, con los
faldones estrechos, escotados en las caderas y colgantes por detrás;
-
el esmoquin, en el que la chaqueta (saco), aunque quizás permita mayor visibilidad de la pechera, es de corte similar al de la chaqueta
(saco) común y presenta la particularidad de llevar solapas brillantes de seda o de imitación de seda.
b)
Se entiende por conjunto un surtido de prendas de vestir (excepto los artículos de las partidas 61.07, 61.08 o 61.09) que comprenda varias
prendas confeccionadas con una misma tela, acondicionado para la venta al por menor y compuesto por:
-
una sola prenda que cubra la parte superior del cuerpo, excepto el pulóver que puede constituir una segunda prenda exterior solamente en
el caso de los «twinset» o un chaleco que puede constituir una segunda prenda en los demás casos; y
-
una o dos prendas diferentes que cubran la parte inferior del cuerpo y que consistan en un pantalón largo, un pantalón con peto, un
pantalón corto (calzón), un short (excepto de baño), una falda o una falda pantalón.
Todos los componentes del conjunto deben tener la misma estructura, estilo, color y composición; además, deben ser de tallas correspondientes o
compatibles. El término conjunto no comprende los conjuntos de abrigo para entrenamiento o deporte ni los monos (overoles) y conjuntos de
esquí, de la partida 61.12.
4.
Las partidas 61.05 y 61.06 no comprenden las prendas de vestir con bolsillos por debajo de la cintura o con acanalado elástico u otro medio para ceñir el
bajo de la prenda, ni las prendas que tengan una media inferior a 10 puntos por centímetro lineal en cada dirección, contados en una superficie mínima
de 10 cm x 10 cm. La partida 61.05 no comprende las prendas sin mangas.
Las camisas y blusas camiseras son prendas destinadas a cubrir la parte superior del cuerpo y llevan mangas, largas o cortas, así como una abertura,
incluso parcial, a partir del escote. Las blusas son prendas holgadas también destinadas a cubrir la parte superior del cuerpo. Pueden carecer de
mangas y tener o no una abertura en el escote. Las camisas, blusas y blusas camiseras también pueden tener un cuello.
5.
La partida 61.09 no comprende las prendas de vestir con acanalado elástico, cordón corredizo u otro medio para ceñir el bajo.
6.
En la partida 61.11:
a)
la expresión prendas y complementos (accesorios), de vestir, para bebés se refiere a los artículos para niños de corta edad con estatura no
superior a 86 cm;
b)
los artículos susceptibles de clasificarse en la partida 61.11 y en otras partidas de este Capítulo se clasifican en la partida 61.11.
7.
En la partida 61.12, se entiende por monos (overoles) y conjuntos de esquí, las prendas de vestir o surtidos de prendas de vestir que, por su aspecto
general y su textura, sean identificables como destinados principalmente para uso en la práctica del esquí (alpino o de fondo). Se componen de:
a)
un mono (overol) de esquí, es decir, una prenda de una sola pieza que cubre la parte superior y la inferior del cuerpo; además de mangas y cuello,
este artículo puede llevar bolsillos y trabillas; o
b)
un conjunto de esquí, es decir, un surtido de prendas de vestir que comprenda dos o tres prendas, acondicionado para la venta al por menor y
compuesto por:
-
una sola prenda del tipo anorak, cazadora o artículo similar, con cierre de cremallera (cierre relámpago), eventualmente acompañada de un
chaleco; y
-
un solo pantalón, aunque suba por encima de la cintura, un solo pantalón corto (calzón) o un solo pantalón con peto.
El conjunto de esquí puede también estar compuesto por un mono (overol) de esquí del tipo mencionado anteriormente y por una especie de
chaqueta (saco) acolchada sin mangas que se viste sobre el mono (overol).
Todos los componentes del conjunto de esquí deben estar confeccionados con una tela de la misma textura, estilo y composición, del mismo color o
de colores distintos; además, deben ser de tallas correspondientes o compatibles.
8.
Las prendas de vestir susceptibles de clasificarse en la partida 61.13 y en otras partidas de este Capítulo, excepto en la partida 61.11, se clasifican en la
partida 61.13.
9.
Las prendas de vestir de este Capítulo que se cierren por delante de izquierda sobre derecha se consideran como prendas para hombres o niños, y
aquellas que se cierren por delante de derecha sobre izquierda, como prendas para mujeres o niñas. Estas disposiciones no se aplicarán cuando el corte
de la prenda indique manifiestamente que ha sido diseñada para uno u otro sexo.
Las prendas que no sean identificables como prendas para hombres o niños, o como prendas para mujeres o niñas, se clasifican con estas últimas.
10.
Los artículos de este Capítulo pueden confeccionarse con hilos de metal.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (62, 6, '62', 'PRENDAS Y COMPLEMENTOS (ACCESORIOS), DE VESTIR, EXCEPTO LOS DE PUNTO', 'Notas.
1.
Este Capítulo solo se aplica a los artículos confeccionados con cualquier textil, excepto la guata y los artículos de punto distintos de los de la partida', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (63, 6, '63', 'LOS DEMÁS ARTÍCULOS TEXTILES CONFECCIONADOS; JUEGOS; PRENDERÍA Y TRAPOS', 'Notas.
1.
El Subcapítulo I, que comprende artículos de cualquier textil, solo se aplica a los artículos confeccionados.
2.
El Subcapítulo I no comprende:
a)
los productos de los Capítulos 56 a 62;
b)
los artículos de prendería de la partida 63.09.
3.
La partida 63.09 solo comprende los artículos citados limitativamente a continuación:
a)
artículos de materias textiles:
-
prendas y complementos (accesorios), de vestir, y sus partes;
-
mantas;
-
ropa de cama, mesa, tocador o cocina;
-
artículos de tapicería, excepto las alfombras de las partidas 57.01 a 57.05 y la tapicería de la partida 58.05;
b)
calzado, sombreros y demás tocados, de materias distintas del amianto (asbesto).
Para que se clasifiquen en esta partida, los artículos antes citados deben cumplir las dos condiciones siguientes:
-
tener señales apreciables de uso, y
-
presentarse a granel o en balas, sacos (bolsas) o acondicionamientos similares.
Nota de subpartida.
1.
La subpartida 6304.20 comprende los artículos confeccionados a partir de tejidos de punto por urdimbre, impregnados o recubiertos con alfa-cipermetrina
(ISO), clorfenapir (ISO), deltametrina (DCI, ISO), lambda-cialotrina (ISO), permetrina (ISO) o pirimifos-metil (ISO).
Nota Complementaria.
1.
En la supartida 6310.10.00.10, se consideran recortes de la industria de la confección, los retazos de tejidos, nuevos, de forma irregular y dimensiones
reducidas, de un mismo color y de un mismo tejido, definitivamente inservibles como tejidos a consecuencia de roturas, corte o tamaño, procedentes de la
fabricación de confecciones, utilizados exclusivamente para la recuperación de las fibras textiles por deshilachado, destinadas a la fabricación de hilados,
presentados en balas o sacos.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (64, 2, '64', 'CALZADO, POLAINAS Y ARTÍCULOS ANÁLOGOS; PARTES DE ESTOS ARTÍCULOS', 'Notas.
1.
Este Capítulo no comprende:
a)
los artículos desechables para cubrir los pies o el calzado, de materiales livianos o poco resistentes (por ejemplo: papel, hojas de plástico) y sin
suela aplicada (régimen de la materia constitutiva);
b)
el calzado de materia textil, sin suela exterior encolada, cosida o fijada o aplicada de otro modo a la parte superior (Sección XI);
c)
el calzado usado de la partida 63.09;
d)
los artículos de amianto (asbesto) (partida 68.12);
e)
el calzado y aparatos de ortopedia, y sus partes (partida 90.21);
f)
el calzado que tenga el carácter de juguete y el calzado con patines fijos (para hielo o de ruedas); espinilleras (canilleras) y demás artículos de
protección utilizados en la práctica del deporte (Capítulo 95).
2.
En la partida 64.06, no se consideran partes las clavijas (estaquillas), protectores, anillos para ojetes, ganchos, hebillas, galones, borlas, cordones y demás
artículos de ornamentación o de pasamanería, que siguen su propio régimen, ni los botones para el calzado (partida 96.06).
3.
En este Capítulo:
a)
los términos caucho y plástico comprenden los tejidos y demás soportes textiles con una capa exterior de caucho o plástico perceptible a simple
vista; a los efectos de esta disposición, se hará abstracción de los cambios de color producidos por las operaciones de obtención de esta capa
exterior;
b)
la expresión cuero natural se refiere a los productos de las partidas 41.07 y 41.12 a 41.14
4.
Sin perjuicio de lo dispuesto en la Nota 3 de este Capítulo:
a)
la materia de la parte superior será la que constituya la superficie mayor de recubrimiento exterior, sin considerar los accesorios o refuerzos, tales
como ribetes, protectores de tobillos, adornos, hebillas, orejas, anillos para ojetes o dispositivos análogos;
b)
la materia constitutiva de la suela será aquella cuya superficie en contacto con el suelo sea la mayor, sin considerar los accesorios o refuerzos,
tales como puntas, tiras, clavos, protectores o dispositivos análogos.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (65, 2, '65', 'SOMBREROS, DEMÁS TOCADOS, Y SUS PARTES', 'Notas.
1.
Este Capítulo no comprende:
a)
los sombreros y demás tocados usados de la partida 63.09;
b)
los sombreros y demás tocados de amianto (asbesto) (partida 68.12);
c)
los sombreros y demás tocados que tengan el carácter de juguetes, tales como los sombreros para muñecas y los artículos para fiestas (Capítulo
95).
2.
La partida 65.02 no comprende los cascos o formas confeccionados por costura, excepto los que se obtienen por unión de tiras simplemente cosidas en
espiral.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (66, 2, '66', 'PARAGUAS, SOMBRILLAS, QUITASOLES, BASTONES, BASTONES ASIENTO, LÁTIGOS, FUSTAS, Y SUS PARTES', 'Notas.
1.
Este Capítulo no comprende:
a)
los bastones medida y similares (partida 90.17);
b)
los bastones escopeta, bastones estoque, bastones plomados y similares (Capítulo 93);
c)
los artículos del Capítulo 95 (por ejemplo: los paraguas y sombrillas manifiestamente destinados al entretenimiento de los niños).
2.
La partida 66.03 no comprende los accesorios de materia textil, las vainas, fundas, borlas, dragonas y similares, de cualquier materia, para los artículos
de las partidas 66.01 o 66.02. Estos accesorios se clasifican separadamente, incluso cuando se presenten con los artículos a los que se destinen, pero sin
montar en dichos artículos.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (67, 2, '67', 'PLUMAS Y PLUMÓN PREPARADOS Y ARTÍCULOS DE PLUMAS O PLUMÓN; FLORES ARTIFICIALES; MANUFACTURAS DE CABELLO', 'Notas.
1.
Este Capítulo no comprende:
a)
las telas filtrantes y capachos, de cabello (partida 59.11);
b)
los motivos florales de encaje, bordados u otros tejidos (Sección XI);
c)
el calzado (Capítulo 64);
d)
los sombreros y demás tocados y las redecillas para el cabello (Capítulo 65);
e)
los juguetes, artefactos deportivos y artículos para carnaval (Capítulo 95);
f)
los plumeros, borlas y similares para la aplicación de polvos y los cedazos de cabello (Capítulo 96).
2.
La partida 67.01 no comprende:
a)
los artículos en los que las plumas o plumón sean únicamente material de relleno y, en particular, los artículos de cama de la partida 94.04;
b)
las prendas y complementos (accesorios), de vestir, en los que las plumas o plumón sean simples adornos o material de relleno;
c)
las flores, follaje, y sus partes y los artículos confeccionados de la partida 67.02.
3.
La partida 67.02 no comprende:
a)
los artículos de vidrio (Capítulo 70);
b)
las imitaciones de flores, follaje o frutos, de cerámica, piedra, metal, madera, etc., obtenidas en una sola pieza por moldeo, forjado, cincelado,
estampado o por cualquier otro procedimiento, ni las formadas por varias partes unidas por procedimientos distintos del atado, encolado,
encajado o similares.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (68, 3, '68', 'MANUFACTURAS DE PIEDRA, YESO FRAGUABLE, CEMENTO, AMIANTO (ASBESTO), MICA O MATERIAS ANÁLOGAS', 'Notas.
1.
Este Capítulo no comprende:
a)
los artículos del Capítulo 25;
b)
el papel y cartón estucados, recubiertos, impregnados o revestidos de las partidas 48.10 o 48.11 (por ejemplo: los revestidos de polvo de mica o
grafito, el papel y cartón embetunados o asfaltados);
c)
los tejidos y otras superficies textiles recubiertos, impregnados o revestidos de los Capítulos 56 o 59 (por ejemplo: los revestidos de polvo de mica,
de betún, de asfalto);
d)
los artículos del Capítulo 71;
e)
las herramientas y partes de herramientas del Capítulo 82;
f)
las piedras litográficas de la partida 84.42;
g)
los aisladores eléctricos (partida 85.46) y las piezas aislantes de la partida 85.47;
h)
las pequeñas muelas para tornos de dentista (partida 90.18);
ij)
los artículos del Capítulo 91 (por ejemplo: cajas y envolturas similares de relojes u otros aparatos de relojería);
k)
los artículos del Capítulo 94 (por ejemplo: muebles, luminarias y aparatos de alumbrado, construcciones prefabricadas);
l)
los artículos del Capítulo 95 (por ejemplo: juguetes, juegos, artefactos deportivos);
m)
los artículos de la partida 96.02, cuando estén constituidos por las materias mencionadas en la Nota 2 b) del Capítulo 96, los artículos de la partida', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (69, 3, '69', 'PRODUCTOS CERÁMICOS', 'Notas.
1.
Este Capítulo solo comprende los productos cerámicos cocidos después de darles forma:
a)
las partidas 69.04 a 69.14 comprenden exclusivamente los productos que no puedan clasificarse en las partidas 69.01 a 69.03;
b)
no se pueden considerar cocidos los productos que se han calentado a temperaturas inferiores a 800 °C para provocar el endurecimiento de las
resinas que contienen, la aceleración de las reacciones de hidratación o la eliminación de agua o de otras sustancias volátiles eventualmente presentes.
Estos productos están excluidos del Capítulo 69;
c)
los artículos cerámicos se obtienen cociendo materias no metálicas inorgánicas después de haberlas preparado y de darles forma previamente,
normalmente a temperatura ambiente. Las materias primas utilizadas son entre otras la arcilla, materias silíceas (incluida la sílice fundida), materias con
punto de fusión elevado tales como los óxidos, carburos, nitruros, grafito u otros carbonos y, en algunos casos, aglomerantes tales como arcillas
refractarias y fosfatos.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (70, 3, '70', 'VIDRIO Y SUS MANUFACTURAS', 'Notas.
1.
Este Capítulo no comprende:
a)
los artículos de la partida 32.07 (por ejemplo: composiciones vitrificables, frita de vidrio y demás vidrios, en polvo, gránulos, copos o escamillas);
b)
los artículos del Capítulo 71 (por ejemplo, bisutería);
c)
los cables de fibras ópticas de la partida 85.44, los aisladores eléctricos (partida 85.46) y las piezas aislantes de la partida 85.47;
d)
los parabrisas, vidrios traseros (lunetas)* y demás ventanillas, enmarcados, para vehículos de los Capítulos 86 a 88;
e)
los parabrisas, vidrios traseros (lunetas)* y demás ventanillas, incluso enmarcados, que incorporen dispositivos de calefacción u otros
dispositivos eléctricos o electrónicos, para vehículos de los Capítulos 86 a 88;
f)
las fibras ópticas, elementos de óptica trabajados ópticamente, jeringas, ojos artificiales, así como termómetros, barómetros, areómetros,
densímetros y demás artículos e instrumentos del Capítulo 90;
g)
las luminarias y los aparatos de alumbrado, los anuncios, letreros y placas indicadoras, luminosos y artículos similares, con fuente de luz inseparable,
así como sus partes, de la partida 94.05;
h)
los juegos, juguetes y accesorios para árboles de Navidad, así como los demás artículos del Capítulo 95, excepto los ojos sin mecanismo para
muñecas o demás artículos del Capítulo 95;
ij)
los botones, pulverizadores, termos y demás artículos del Capítulo 96.
2.
En las partidas 70.03, 70.04 y 70.05:
a)
el vidrio elaborado antes del recocido no se considera trabajado;
b)
el corte en cualquier forma no afecta la clasificación del vidrio en placas u hojas;
c)
se entiende por capa absorbente, reflectante o antirreflectante, la capa metálica o de compuestos químicos (por ejemplo, óxidos metálicos), de
espesor microscópico que absorbe, en particular, los rayos infrarrojos o mejora las cualidades reflectantes del vidrio sin impedir su transparencia o
translucidez o que impide que la superficie del vidrio refleje la luz.
3.
Los productos de la partida 70.06 permanecen clasificados en dicha partida, aunque tengan ya el carácter de manufacturas.
4.
En la partida 70.19, se entiende por lana de vidrio:
a)
la lana mineral con un contenido de sílice (SiO2) superior o igual al 60  %  en peso;
b)
la lana mineral con un contenido de sílice (SiO2) inferior al 60  %  en peso, pero con un contenido de óxidos alcalinos (K2O u Na2O) superior al 5  %
en peso o con un contenido de anhídrido bórico (B2O3) superior al 2  %  en peso.
Las lanas minerales que no cumplan estas condiciones se clasifican en la partida 68.06.
5.
En la Nomenclatura, el cuarzo y demás sílices, fundidos, se consideran vidrio.
Nota de subpartida.
1.
En las subpartidas 7013.22, 7013.33, 7013.41 y 7013.91, la expresión cristal al plomo solo comprende el vidrio con un contenido de monóxido de plomo
(PbO) superior o igual al 24  %  en peso.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (71, 4, '71', 'PERLAS NATURALES (FINAS)* O CULTIVADAS, PIEDRAS PRECIOSAS O SEMIPRECIOSAS, METALES PRECIOSOS, CHAPADOS DE METAL PRECIOSO (PLAQUÉ) Y MANUFACTURAS DE ESTAS MATERIAS; BISUTERÍA; MONEDAS', 'Notas.
1.
Sin perjuicio de la aplicación de la Nota 1 A) de la Sección VI y de las excepciones previstas a continuación, se incluye en este Capítulo cualquier artículo
compuesto total o parcialmente:
a)
de perlas naturales (finas)* o cultivadas, de piedras preciosas o semipreciosas (naturales, sintéticas o reconstituidas); o
b)
de metal precioso o de chapado de metal precioso (plaqué).
2.
A)
Las partidas 71.13, 71.14 y 71.15 no comprenden los artículos en los que el metal precioso o el chapado de metal precioso (plaqué) sean
únicamente simples accesorios o adornos de mínima importancia (por ejemplo: iniciales, monogramas, virolas, orlas); el apartado b) de la Nota 1
anterior no incluye estos artículos.
B)
En la partida 71.16 solo se clasifican los artículos que no lleven metal precioso ni chapado de metal precioso (plaqué) o que, llevándolos, solo sean
simples accesorios o adornos de mínima importancia.
3.
Este Capítulo no comprende:
a)
las amalgamas de metal precioso y el metal precioso en estado coloidal (partida 28.43);
b)
las ligaduras estériles para suturas quirúrgicas, los productos de obturación dental y demás artículos del Capítulo 30;
c)
los productos del Capítulo 32 (por ejemplo, abrillantadores (lustres) líquidos);
d)
los catalizadores sobre soporte (partida 38.15);
e)
los artículos de las partidas 42.02 y 42.03, a los que se refiere la Nota 3 B) del Capítulo 42;
f)
los artículos de las partidas 43.03 o 43.04;
g)
los productos de la Sección XI (materias textiles y sus manufacturas);
h)
el calzado, los sombreros y demás tocados y otros artículos de los Capítulos 64 o 65;', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (72, 15, '72', 'FUNDICIÓN, HIERRO Y ACERO', 'Notas.
1.
En este Capítulo y, respecto a los apartados d), e) y f) de esta Nota, en toda la Nomenclatura, se consideran:
a)
Fundición en bruto
las aleaciones hierro-carbono que no se presten prácticamente a la deformación plástica, con un contenido de carbono superior al 2  %  en
peso, incluso con otro u otros elementos en las proporciones en peso siguientes:
-
inferior o igual al 10  %  de cromo
-
inferior o igual al 6  %  de manganeso
-
inferior o igual al 3  %  de fósforo
-
inferior o igual al 8  %  de silicio
-
inferior o igual al 10  % , en total, de los demás elementos.
b)
Fundición especular
las aleaciones hierro-carbono con un contenido de manganeso superior al 6  %  pero inferior o igual al 30  % , en peso, siempre que las demás
características respondan a la definición de la Nota 1 a).
c)
Ferroaleaciones
las aleaciones en lingotes, bloques, masas o formas primarias similares, en formas obtenidas por colada continua o en granallas o en polvo,
incluso aglomerados, corrientemente utilizadas en la siderurgia como productos de aporte para la preparación de otras aleaciones, o como
desoxidantes, desulfurantes o en usos similares y que no se presten generalmente a la deformación plástica, con un contenido de hierro
superior o igual al 4  %  en peso y con uno o varios elementos en las proporciones en peso siguientes:
-
superior al 10  %  de cromo
-
superior al 30  %  de manganeso
-
superior al 3  %  de fósforo
-
superior al 8  %  de silicio
-
superior al 10  % , en total, de los demás elementos, excepto el carbono, sin que el porcentaje de cobre sea superior al 10  % .
d)
Acero
las materias férreas, excepto las de la partida 72.03 que, salvo determinados tipos de aceros producidos en forma de piezas moldeadas, se
presten a la deformación plástica y con un contenido de carbono inferior o igual al 2  %  en peso. Sin embargo, los aceros al cromo pueden
tener un contenido de carbono más elevado.
e)
Acero inoxidable
el acero aleado con un contenido de carbono inferior o igual al 1,2  %  en peso y de cromo superior o igual al 10,5  %  en peso, incluso con
otros elementos.
f)
Los demás aceros aleados
los aceros que no respondan a la definición de acero inoxidable y que contengan uno o varios de los elementos indicados a continuación en las
proporciones en peso siguientes:
-
superior o igual al 0,3  %  de aluminio
-
superior o igual al 0,0008  %  de boro
-
superior o igual al 0,3  %  de cromo
-
superior o igual al 0,3  %  de cobalto
-
superior o igual al 0,4  %  de cobre
-
superior o igual al 0,4  %  de plomo
-
superior o igual al 1,65  %  de manganeso
-
superior o igual al 0,08  %  de molibdeno
-
superior o igual al 0,3  %  de níquel
-
superior o igual al 0,06  %  de niobio
-
superior o igual al 0,6  %  de silicio
-
superior o igual al 0,05  %  de titanio
-
superior o igual al 0,3  %  de volframio (tungsteno)
-
superior o igual al 0,1  %  de vanadio
-
superior o igual al 0,05  %  de circonio
-
superior o igual al 0,1  %  de los demás elementos considerados individualmente (excepto el azufre, fósforo, carbono y nitrógeno).
g)
Lingotes de chatarra de hierro o de acero
los productos colados groseramente en forma de lingotes sin mazarotas o de bloques, que presenten defectos profundos en la superficie y no
respondan, en su composición química, a las definiciones de fundición en bruto, de fundición especular o de ferroaleaciones.
8.
En esta Sección, se entiende por:
a) Desperdicios y desechos
1°) todos los desperdicios y desechos metálicos;
2°) las manufacturas de metal definitivamente inservibles como tales a consecuencia de rotura, corte, desgaste u otra causa.
b) Polvos
El producto que pase por un tamiz con abertura de malla de 1 mm en proporción superior o igual al 90 % en peso.
9.
En los Capítulos 74 a 76 y 78 a 81, se entiende por:
a)     Barras
los productos laminados, extrudidos, estirados o forjados, sin enrollar, cuya sección transversal, maciza y constante en toda su longitud, tenga
forma de círculo, óvalo, cuadrado, rectángulo, triángulo equilátero o polígono regular convexo (incluidos los círculos aplanados y los
rectángulos modificados, en los que dos lados opuestos tengan forma de arco convexo y los otros dos sean rectos, iguales y paralelos). Los
productos de sección transversal cuadrada, rectangular, triangular o poligonal, pueden tener las aristas redondeadas en toda su longitud. El
espesor de los productos de sección transversal rectangular (incluidos los de sección rectangular modificada) debe ser superior a la décima
parte de la anchura. También se consideran barras, los productos de las mismas formas y dimensiones, moldeados, colados o sinterizados, que
han recibido, después de su obtención, un trabajo superior a un desbarbado grosero, siempre que este trabajo no confiera a los productos el
carácter de artículos o manufacturas comprendidos en otra parte.
Sin embargo, las barras para alambrón («wire-bars») y los tochos, del Capítulo 74, apuntados o simplemente trabajados de otro modo en sus
extremos, para facilitar su introducción en las máquinas para transformarlos, por ejemplo, en alambrón o en tubos, se consideran cobre en
bruto de la partida 74.03. Esta disposición se aplica mutatis mutandis a los productos del Capítulo 81.
b)     Perfiles
los productos laminados, extrudidos, estirados, forjados u obtenidos por conformado o plegado, enrollados o sin enrollar, de sección transversal
constante en toda su longitud, que no cumplan las definiciones de barras, alambre, chapas, hojas, tiras o tubos. También se consideran perfiles, los
productos de las mismas formas, moldeados, colados o sinterizados, que han recibido, después de su obtención, un trabajo superior a un
desbarbado grosero, siempre que este trabajo no confiera a los productos el carácter de artículos o manufacturas comprendidos en otra parte.
c)     Alambre
el producto laminado, extrudido o trefilado, enrollado, cuya sección transversal maciza y constante en toda su longitud, tenga forma de círculo,
óvalo, cuadrado, rectángulo, triángulo equilátero o polígono regular convexo (incluidos los círculos aplanados y los rectángulos modificados, en los
que dos lados opuestos tengan forma de arco convexo y los otros dos sean rectos, iguales y paralelos). Los productos de sección transversal
cuadrada, rectangular, triangular o poligonal, pueden tener las aristas redondeadas en toda su longitud. El espesor de los productos de sección
transversal rectangular (incluidos los de sección rectangular modificada) debe ser superior a la décima parte de la anchura.
d)     Chapas, hojas y tiras', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (73, 15, '73', 'MANUFACTURAS DE FUNDICIÓN, HIERRO O ACERO', 'Notas.
1.
En este Capítulo, se entiende por fundición el producto obtenido por moldeo que no responda a la composición química del acero definido en la Nota 1 d)
del Capítulo 72, en el que el hierro predomine en peso sobre cada uno de los demás elementos.
2.
En este Capítulo, el término alambre se refiere a los productos obtenidos en caliente o en frío cuya sección transversal, cualquiera que fuese su forma,
sea inferior o igual a 16 mm en su mayor dimensión.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (74, 15, '74', 'COBRE Y SUS MANUFACTURAS', 'Nota.
1.
En este Capítulo, se entiende por:
a)
Cobre refinado
el metal con un contenido de cobre superior o igual al 99,85  %  en peso; o
el metal con un contenido de cobre superior o igual al 97,5  %  en peso, siempre que el contenido de cualquier otro elemento sea inferior o igual a
los límites indicados en el cuadro siguiente:
CUADRO - Otros elementos
Elemento
Contenido límite % en peso
Ag
Plata
0,25
As
Arsénico
0,5
Cd
Cadmio
1,3
Cr
Cromo
1,4
Mg
Magnesio
0,8
Pb
Plomo
1,5
S
Azufre
0,7
Sn
Estaño
0,8
Te
Telurio
0,8
Zn
Cinc
1
Zr
Circonio
0,3
Los demás elementos*, cada uno
0,3
* Los demás elementos, por ejemplo: Al, Be, Co, Fe, Mn, Ni, Si.
b)
Aleaciones de cobre
las materias metálicas, excepto el cobre sin refinar, en las que el cobre predomine en peso sobre cada uno de los demás elementos, siempre que:
1)
el contenido en peso de, al menos, uno de los demás elementos sea superior a los límites indicados en el cuadro anterior; o
2)
el contenido total de los demás elementos sea superior al 2,5  %  en peso.
c)
Aleaciones madre de cobre
las composiciones que contengan cobre en proporción superior al 10  %  en peso y otros elementos, que no se presten a la deformación plástica y
se utilicen como productos de aporte en la preparación de otras aleaciones o como desoxidantes, desulfurantes o usos similares en la metalurgia de
los metales no férreos. Sin embargo, las combinaciones fósforo y cobre (cuprofósforos) con un contenido de fósforo superior al 15  %  en peso, se
clasifican en la partida 28.53.
Nota de subpartida.
1.
En este Capítulo, se entiende por:
a)
Aleaciones a base de cobre-cinc (latón)
las aleaciones de cobre y cinc, incluso con otros elementos. Cuando estén presentes otros elementos:
-
el cinc debe predominar en peso sobre cada uno de los demás elementos;
-
el contenido eventual de níquel debe ser inferior al 5  %  en peso (véanse las aleaciones a base de cobre-níquel-cinc (alpaca));
-
el contenido eventual de estaño debe ser inferior al 3  %  en peso (véanse las aleaciones a base de cobre-estaño (bronce)).
b)
Aleaciones a base de cobre-estaño (bronce)
las aleaciones de cobre y estaño, incluso con otros elementos. Cuando estén presentes otros elementos, el estaño debe predominar en peso sobre
cada uno de estos otros elementos. Sin embargo, cuando el contenido de estaño sea superior o igual al 3  %  en peso, el de cinc puede predominar,
pero debe ser inferior al 10  %  en peso.
c)
Aleaciones a base de cobre-níquel-cinc (alpaca)
las aleaciones de cobre, níquel y cinc, incluso con otros elementos. El contenido de níquel debe ser superior o igual al 5  %  en peso (véanse las
aleaciones a base de cobre-cinc (latón)).
d)
Aleaciones a base de cobre-níquel
las aleaciones de cobre y níquel, incluso con otros elementos, pero que, en ningún caso, el contenido de cinc sea superior al 1  %  en peso. Cuando
estén presentes otros elementos, el níquel debe predominar en peso sobre cada uno de estos otros elementos.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (75, 15, '75', 'NÍQUEL Y SUS MANUFACTURAS Notas de subpartida. 1. En este Capítulo, se entiende por: a) Níquel sin alear el metal con un contenido total de níquel y de cobalto superior o igual al 99  %  en peso, siempre que: 1) el contenido de cobalto sea inferior o igual al 1,5  %  en peso, y 2) el contenido de cualquier otro elemento sea inferior o igual a los límites que figuran en el cuadro siguiente: CUADRO - Otros elementos Elemento Contenido límite % en peso Fe Hierro O Oxígeno Los demás elementos, cada uno 0,5 0,4 0,3 b) Aleaciones de níquel las materias metálicas en las que el níquel predomine en peso sobre cada uno de los demás elementos, siempre que: 1) el contenido de cobalto sea superior al 1,5  %  en peso; 2) el contenido en peso de, al menos, uno de los demás elementos sea superior a los límites indicados en el cuadro anterior; o 3) el contenido total de elementos distintos del níquel y del cobalto sea superior al 1  %  en peso. 2. No obstante lo dispuesto en la Nota 9 c) de la Sección XV, en la subpartida 7508.10, solamente se admite como alambre el producto, enrollado o sin enrollar, cuya sección transversal, de cualquier forma, sea inferior o igual a 6 mm en su mayor dimensión.', '', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (76, 15, '76', 'ALUMINIO Y SUS MANUFACTURAS Notas de subpartida. 1. En este Capítulo, se entiende por: a) Aluminio sin alear el metal con un contenido de aluminio superior o igual al 99  %  en peso, siempre que el contenido en peso de los demás elementos sea inferior o igual a los límites indicados en el cuadro siguiente: CUADRO - Otros elementos Elemento Contenido límite % en peso Fe+Si (total hierro más silicio) Los demás elementos 1), cada uno 1 0,1 2) 1) Los demás elementos, por ejemplo: Cr, Cu, Mg, Mn, Ni, Zn. 2) Se tolera un contenido de cobre superior al 0,1  %  pero inferior o igual al 0,2  % , siempre que ni el contenido de cromo ni el de manganeso sea superior al 0,05  % b) Aleaciones de aluminio las materias metálicas en las que el aluminio predomine en peso sobre cada uno de los demás elementos, siempre que: 1) el contenido en peso de, al menos, uno de los demás elementos o el total hierro más silicio, sea superior a los límites indicados en el cuadro anterior; o 2) el contenido total de los demás elementos sea superior al 1  %  en peso. 2. No obstante lo dispuesto en la Nota 9 c) de la Sección XV, en la subpartida 7616.91, solamente se admite como alambre el producto, enrollado o sin enrollar, cuya sección transversal, de cualquier forma, sea inferior o igual a 6 mm en su mayor dimensión.', '', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (77, 15, '77', '(RESERVADO PARA UNA FUTURA UTILIZACIÓN EN EL SISTEMA ARMONIZADO)', '', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (78, 15, '78', 'PLOMO Y SUS MANUFACTURAS Nota de subpartida. 1. En este Capítulo, se entiende por plomo refinado: el metal con un contenido de plomo superior o igual al 99,9  %  en peso, siempre que el contenido en peso de cualquier otro elemento sea inferior o igual a los límites indicados en el cuadro siguiente:', '', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (79, 15, '79', 'CINC Y SUS MANUFACTURAS Nota de subpartida. 1. En este Capítulo, se entiende por: a) Cinc sin alear el metal con un contenido de cinc superior o igual al 97,5  %  en peso. b) Aleaciones de cinc las materias metálicas en las que el cinc predomine en peso sobre cada uno de los demás elementos, siempre que el contenido total de los demás elementos sea superior al 2,5 %  en peso. c) Polvo de condensación, de cinc el producto obtenido por condensación de vapor de cinc constituido por partículas esféricas más finas que el polvo. Estas partículas deben pasar por un tamiz con abertura de malla de 63 micrómetros (micras, micrones)* en una proporción superior o igual al 80  %  en peso. El contenido de cinc metálico debe ser superior o igual al 85  %  en peso. CUADRO - Otros elementos Elemento Contenido límite % en peso Ag Plata As Arsénico Bi Bismuto Ca Calcio Cd Cadmio Cu Cobre Fe Hierro S Azufre Sb Antimonio Sn Estaño Zn Cinc Los demás (por ejemplo, Te), cada uno 0,02 0,005 0,05 0,002 0,002 0,08 0,002 0,002 0,005 0,005 0,002 0,001', '', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (80, 15, '81', 'LOS DEMÁS METALES COMUNES; CERMETS; MANUFACTURAS DE ESTAS MATERIAS', '', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (81, 15, '80', 'ESTAÑO Y SUS MANUFACTURAS Nota de subpartida. 1. En este Capítulo, se entiende por: a) Estaño sin alear el metal con un contenido de estaño superior o igual al 99  %  en peso, siempre que el contenido de bismuto o de cobre, eventualmente presentes, sea inferior en peso a los límites indicados en el cuadro siguiente: CUADRO - Otros elementos Elemento Contenido límite % en peso Bi Bismuto Cu Cobre 0,1 0,4 b) Aleaciones de estaño las materias metálicas en las que el estaño predomine en peso sobre cada uno de los demás elementos, siempre que: 1) el contenido total de los demás elementos sea superior al 1  %  en peso; o 2) el contenido de bismuto o cobre sea superior o igual en peso a los límites indicados en el cuadro anterior.', '', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (82, 15, '82', 'HERRAMIENTAS Y ÚTILES, ARTÍCULOS DE CUCHILLERÍA Y CUBIERTOS DE MESA, DE METAL COMÚN; PARTES DE ESTOS ARTÍCULOS, DE METAL COMÚN', 'Notas.
1.
Independientemente de las lámparas de soldar, de las fraguas portátiles, de las muelas con bastidor y de los juegos de manicura o pedicuro, así como de
los artículos de la partida 82.09, este Capítulo comprende solamente los artículos provistos de una hoja u otra parte operante:
a)
de metal común;
b)
de carburo metálico o de cermet;
c)
de piedras preciosas o semipreciosas (naturales, sintéticas o reconstituidas), con soporte de metal común, carburo metálico o cermet;
d)
de abrasivos con soporte de metal común, siempre que se trate de útiles cuyos dientes, aristas u otras partes cortantes no hayan perdido su
función propia por la presencia de polvo abrasivo.
2.
Las partes de metal común de los artículos de este Capítulo se clasifican con los mismos, excepto las partes especialmente citadas y los portaútiles para
herramientas de mano de la partida 84.66. Sin embargo, siempre se excluyen de este Capítulo las partes o accesorios de uso general, tal como se
definen en la Nota 2 de esta Sección.
Se excluyen de este Capítulo, las cabezas, peines, contrapeines, hojas y cuchillas de afeitadoras, cortadoras de pelo o esquiladoras, eléctricas (partida', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (83, 15, '83', 'MANUFACTURAS DIVERSAS DE METAL COMÚN', 'Notas.
1.
En este Capítulo, las partes de metal común se clasifican en la partida correspondiente a los artículos a los que pertenecen. Sin embargo, no se
consideran partes de manufacturas de este Capítulo, los artículos de fundición, hierro o acero de las partidas 73.12, 73.15, 73.17, 73.18 o 73.20 ni los
mismos artículos de otro metal común (Capítulos 74 a 76 y 78 a 81).
2.
En la partida 83.02, se consideran ruedas las que tengan un diámetro (incluido el bandaje, en su caso) inferior o igual a 75 mm o las de mayor diámetro
(incluido el bandaje, en su caso) siempre que la anchura de la rueda o del bandaje que se les haya montado sea inferior a 30 mm.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (84, 16, '84', 'REACTORES NUCLEARES, CALDERAS, MÁQUINAS, APARATOS Y ARTEFACTOS MECÁNICOS; PARTES DE ESTAS MÁQUINAS O APARATOS', 'Notas.
1. Este Capítulo no comprende:
a) las muelas y artículos similares para moler y demás artículos del Capítulo 68;
b) las máquinas, aparatos o artefactos (por ejemplo, bombas), de cerámica y las partes de cerámica de las máquinas, aparatos o artefactos de cualquier
materia (Capítulo 69);
c) los artículos de vidrio para laboratorio (partida 70.17); los artículos de vidrio para usos técnicos (partidas 70.19 o 70.20);
d) los artículos de las partidas 73.21 ó 73.22, así como los artículos similares de otros metales comunes (Capítulos 74 a 76 o 78 a 81);
e) las aspiradoras de la partida 85.08;
f)  los aparatos electromecánicos de uso doméstico de la partida 85.09; las cámaras digitales de la partida 85.25;
g) los radiadores para los artículos de la Sección XVII;
h) las escobas mecánicas de uso manual, excepto las de motor (partida 96.03).
2. Salvo lo dispuesto en la Nota 3 de la Sección XVI y la Nota 11 del presente Capítulo, las máquinas y aparatos susceptibles de clasificarse a la vez tanto en las
partidas 84.01 a 84.24 o en la partida 84.86, como en las partidas 84.25 a 84.80, se clasifican en las partidas 84.01 a 84.24 o en la partida 84.86, según el
caso.
Sin embargo,
A) no se clasifican en la partida 84.19:
1°)
las incubadoras y criadoras avícolas y los armarios y estufas de germinación (partida 84.36);
2°)
los aparatos humectadores de granos para la molinería (partida 84.37);
3°)
los difusores para la industria azucarera (partida 84.38);
4°)
las máquinas y aparatos para tratamiento térmico de hilados, tejidos o manufacturas de materia textil (partida 84.51);
5°)
los aparatos, dispositivos o equipos de laboratorio diseñados para realizar una operación mecánica, en los que el cambio de temperatura, aunque
necesario, solo desempeñe una función accesoria.
B) no se clasifican en la partida 84.22:
1°)
las máquinas de coser para cerrar envases (partida 84.52);
2°)
las máquinas y aparatos de oficina de la partida 84.72.
C) no se clasifican en la partida 84.24:
1°)
las máquinas para imprimir por chorro de tinta (partida 84.43);
2°)
las máquinas para cortar por chorro de agua (partida 84.56).
3. Las máquinas herramienta que trabajen por arranque de cualquier materia susceptibles de clasificarse a la vez tanto en la partida 84.56 como en las partidas', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (85, 16, '85', 'MÁQUINAS, APARATOS Y MATERIAL ELÉCTRICO, Y SUS PARTES; APARATOS DE GRABACIÓN O REPRODUCCIÓN DE SONIDO, APARATOS DE GRABACIÓN O REPRODUCCIÓN DE IMAGEN Y SONIDO EN TELEVISIÓN, Y LAS PARTES Y ACCESORIOS DE ESTOS APARATOS', 'Notas.
1. Este Capítulo no comprende:
a) las mantas, cojines, calientapiés y artículos similares, que se calienten eléctricamente; las prendas de vestir, calzado, orejeras y demás artículos que se
lleven sobre la persona, calentados eléctricamente;
b) las manufacturas de vidrio de la partida 70.11;
c) las máquinas y aparatos de la partida 84.86;
d) las aspiradoras de los tipos utilizados en medicina, cirugía, odontología o veterinaria (partida 90.18);
e) los muebles con calentamiento eléctrico del Capítulo 94.
2. Los artículos susceptibles de clasificarse tanto en las partidas 85.01 a 85.04 como en las partidas 85.11, 85.12, 85.40, 85.41 u 85.42 se clasifican en estas cinco
últimas partidas.
Sin embargo, los rectificadores de vapor de mercurio de cubeta metálica permanecen clasificados en la partida 85.04.
3. En la partida 85.07, la expresión acumuladores eléctricos también comprende los acumuladores presentados con elementos auxiliares, que contribuyan a la
función de almacenamiento y suministro de energía del acumulador o destinados a protegerlo de daños, tales como conectores eléctricos, dispositivos de
control de temperatura (por ejemplo, termistores) y dispositivos de protección de circuitos. Pueden también incluir una parte de la carcasa de protección de los
aparatos a los que están destinados.
4. La partida 85.09 comprende, siempre que se trate de aparatos electromecánicos de los tipos normalmente utilizados en usos domésticos:
a) las enceradoras (lustradoras) de pisos, trituradoras y mezcladoras de alimentos y extractoras de jugo de frutos u hortalizas, de cualquier peso;
b) los demás aparatos de peso inferior o igual a 20 kg, excepto los ventiladores y las campanas aspirantes para extracción o reciclado, con ventilador
incorporado, incluso con filtro (partida 84.14), las secadoras centrífugas de ropa (partida 84.21), las máquinas para lavar vajilla (partida 84.22), las
máquinas para lavar ropa (partida 84.50), las máquinas para planchar (partidas 84.20 u 84.51, según se trate de calandrias u otros tipos), las máquinas de
coser (partida 84.52), las tijeras eléctricas (partida 84.67) y los aparatos electrotérmicos (partida 85.16).
5. En la partida 85.17, se entiende por teléfonos inteligentes los teléfonos celulares (móviles)* equipados con un sistema operativo diseñado para realizar las
funciones de una máquina automática para tratamiento o procesamiento de datos, tales como la descarga y el funcionamiento simultáneo de varias
aplicaciones, incluidas las aplicaciones de terceros, e incluso dotados de otras funciones tales como una cámara digital o un sistema de navegación.
6. En la partida 85.23:
a) se consideran dispositivos de almacenamiento permanente de datos a base de semiconductores (por ejemplo, «tarjetas de memoria flash» o «tarjetas
de memoria electrónica flash») los dispositivos de almacenamiento con un conector, que tienen, en la misma envoltura, una o más memorias flash
(por ejemplo, «E2PROM FLASH») en forma de circuitos integrados montados en una tarjeta de circuitos impresos.  Pueden llevar un controlador en
forma de circuito integrado y componentes pasivos discretos, tales como condensadores y resistencias;
b) la expresión tarjetas inteligentes («smart cards») comprende las tarjetas que tienen incluidos uno o más circuitos electrónicos integrados (un
microprocesador, una memoria de acceso aleatorio (RAM) o una memoria de solo lectura (ROM)), en forma de microplaquitas (chips).  Estas tarjetas
pueden llevar contactos, una banda magnética o una antena integrada, pero no tienen ningún otro elemento activo o pasivo, de circuito.
7. En la partida 85.24, se entiende por módulos de visualización («display») de pantalla plana los dispositivos o aparatos destinados a mostrar información,
equipados con al menos una pantalla de visualización, que están diseñados para ser incorporados, antes de su utilización, en artículos comprendidos en
otras partidas. Estas pantallas incluyen sin estar limitadas en su forma, a aquellas que son planas, curvas, flexibles, plegables o expandibles. Los módulos
de visualización de pantalla plana pueden incorporar elementos adicionales, incluidos los necesarios para recibir señales de video y distribuir estas señales
en píxeles en la pantalla. Sin embargo, la partida 85.24 no comprende los módulos de visualización equipados con componentes para convertir señales de
video (por ejemplo: un circuito integrado para escalador, un circuito integrado para un decodificador o un procesador de aplicación) o que hayan obtenido
el carácter de mercancías de otras partidas.
Con el fin de clasificar los módulos de visualización de pantalla plana definidos en esta Nota, la partida 85.24 tiene prioridad sobre cualquier otra partida de
la Nomenclatura.
8. En la partida 85.34, se consideran circuitos impresos los obtenidos disponiendo sobre un soporte aislante, por cualquier procedimiento de impresión (por
ejemplo: incrustación, deposición electrolítica, grabado) o por la técnica de los circuitos de capa, elementos conductores, contactos u otros componentes
impresos (por ejemplo: inductancias, resistencias, capacitancias), solos o combinados entre sí según un esquema preestablecido, excepto cualquier elemento
que pueda producir, rectificar, modular o amplificar una señal eléctrica (por ejemplo, elementos semiconductores).
La expresión circuitos impresos no comprende los circuitos combinados con elementos que no hayan sido obtenidos durante el proceso de impresión ni las
resistencias, condensadores o inductancias discretos. Sin embargo, los circuitos impresos pueden estar provistos con elementos de conexión no impresos.
Los circuitos de capa (delgada o gruesa), con elementos pasivos y activos obtenidos durante el mismo proceso tecnológico, se clasifican en la partida 85.42.
9. En la partida 85.36, se entiende por conectores de fibras ópticas, de haces o cables de fibras ópticas, los conectores que solo sirven para alinear
mecánicamente las fibras ópticas extremo con extremo en un sistema de cable digital. No realizan ninguna otra función, tal como la amplificación,
regeneración o modificación de la señal.
10. La partida 85.37 no comprende los mandos a distancia inalámbricos con dispositivo infrarrojo de los aparatos receptores de televisión u otros aparatos
eléctricos (partida 85.43).
11. En la partida 85.39, la expresión fuentes luminosas de diodos emisores de luz (LED) comprende:
a) Los módulos de diodos emisores de luz (LED) que son fuentes luminosas eléctricas basadas en diodos emisores de luz (LED), dispuestos en circuitos
eléctricos y que contienen otros elementos tales como eléctricos, mecánicos, térmicos u ópticos. También contienen elementos discretos activos o pasivos
o artículos de las partidas 85.36 u 85.42 con el fin de suministrar alimentación eléctrica o controlar la potencia. Los módulos de diodos emisores de luz
(LED) no tienen un casquillo diseñado para permitir su fácil instalación o reemplazo en una luminaria ni para asegurar su contacto eléctrico y fijación
mecánica.
b) Las lámparas y tubos de diodos emisores de luz (LED) que son fuentes luminosas eléctricas constituidas por uno o más módulos de LED, contienen otros
elementos tales como eléctricos, mecánicos, térmicos u ópticos. Se distinguen de los módulos de diodos emisores de luz (LED) porque tienen un casquillo
diseñado para permitir su fácil instalación o reemplazo en una luminaria y para asegurar su contacto eléctrico y fijación mecánica.
12. En las partidas 85.41 y 85.42 se consideran:
a)1°) Dispositivos semiconductores, los dispositivos semiconductores cuyo funcionamiento se basa en la variación de la resistividad por la acción de un
campo eléctrico o los transductores basados en semiconductores.
Los dispositivos semiconductores también pueden comprender el ensamblaje de varios elementos, incluso equipados con dispositivos activos o pasivos
cuyas funciones son auxiliares.
Los transductores basados en semiconductores, a los fines de esta definición, son sensores basados en semiconductores, actuadores basados en
semiconductores, resonadores basados en semiconductores y osciladores basados en semiconductores, que son tipos de dispositivos discretos basados
en semiconductores, que realizan una función intrínseca y son capaces de convertir cualquier tipo de acción o de fenómeno físico o químico, en una
señal eléctrica o convertir una señal eléctrica en una acción o cualquier tipo de fenómeno físico.
Todos los elementos de los transductores basados en semiconductores se combinan indivisiblemente y también pueden incluir los materiales
necesarios, unidos indivisiblemente, que permitan su construcción o funcionamiento.
A los fines de la presente definición:
1)
La expresión basados en semiconductores significa construido o fabricado sobre un sustrato semiconductor o constituido por materiales
semiconductores, fabricado por medio de tecnología de semiconductores, en los cuales el sustrato o material semiconductor desempeña un papel
crítico e insustituible sobre la función y el rendimiento del transductor, y cuyo funcionamiento está basado en las propiedades semiconductoras físicas,
eléctricas, químicas y ópticas.
2)
Los fenómenos físicos o químicos se refieren a fenómenos, tales como la presión, las ondas sonoras, la aceleración, la vibración, el movimiento,
la orientación, la tensión, la intensidad de campo magnético, la intensidad de campo eléctrico, la luz, la radiactividad, la humedad, el flujo, la
concentración de productos químicos, etc.
3)
Los sensores basados en semiconductores son un tipo de dispositivo semiconductor, constituido por estructuras microelectrónicas o mecánicas
que se crean en la masa o en la superficie de un semiconductor y cuya función es detectar cantidades físicas o químicas y convertirlas en señales
eléctricas producidas por variaciones resultantes en las propiedades eléctricas o en la deformación de la estructura mecánica.
4)
Los actuadores basados en semiconductores son un tipo de dispositivo semiconductor, constituido por estructuras microelectrónicas o mecánicas
que se crean en la masa o en la superficie de un semiconductor y cuya función es convertir señales eléctricas en movimiento físico.
5)
Los resonadores basados en semiconductores son un tipo de dispositivo semiconductor, constituido por estructuras microelectrónicas o
mecánicas que se crean en la masa o en la superficie de un semiconductor y cuya función es generar una oscilación mecánica o eléctrica de una
frecuencia predefinida que depende de la geometría física de estas estructuras en respuesta a una señal eléctrica externa.
6)
Los osciladores basados en semiconductores son un tipo de dispositivo semiconductor, constituido por estructuras microelectrónicas o
mecánicas que se crean en la masa o en la superficie de un semiconductor y que tienen la función de generar una oscilación mecánica o eléctrica de
una frecuencia predefinida que depende de la geometría física de estas estructuras.
2°) Diodos emisores de luz (LED), los dispositivos semiconductores basados en materiales semiconductores que transforman la energía eléctrica en
radiaciones visibles, infrarrojas o ultravioletas, incluso conectados eléctricamente entre sí e incluso combinados con diodos de protección. Los diodos
emisores de luz (LED) de la partida 85.41 no incorporan elementos con el fin de suministrar alimentación eléctrica o controlar la potencia;
b) Circuitos electrónicos integrados:
1º) los circuitos integrados monolíticos en los que los elementos del circuito (diodos, transistores, resistencias, condensadores, bobinas de inductancia,
etc.) se crean en la masa (esencialmente) y en la superficie de un material semiconductor (por ejemplo: silicio dopado, arseniuro de galio, silicio-
germanio, fosfuro de indio), formando un todo inseparable;
2º) los circuitos integrados híbridos que reúnan de modo prácticamente inseparable, mediante interconexiones o filamentos conectores, sobre un mismo
sustrato aislante (vidrio, cerámica, etc.), elementos pasivos (resistencias, condensadores, bobinas de inductancia, etc.), obtenidos por la técnica de los
circuitos de capa delgada o gruesa y elementos activos (diodos, transistores, circuitos integrados monolíticos, etc.), obtenidos por la técnica de los
semiconductores.  Estos circuitos también pueden llevar componentes discretos;
3º) los circuitos integrados multichip, formados por dos o más circuitos integrados monolíticos, interconectados de modo prácticamente inseparable,
dispuestos o no sobre uno o más sustratos aislantes, con o sin bastidor de conexión, pero sin ningún otro elemento activo o pasivo, de circuito.
4º) los circuitos integrados de componentes múltiples (MCO), que son combinaciones de uno o más circuitos integrados monolíticos, híbridos o multichip y
que contengan al menos uno de los componentes siguientes: sensores, accionadores, osciladores, resonadores, de silicio, incluso combinados entre sí,
o componentes que realicen las funciones de los artículos susceptibles de clasificarse en las partidas 85.32, 85.33, 85.41, o inductores susceptibles de
clasificarse en la partida 85.04, reunidos de modo prácticamente indivisible en un solo cuerpo como un circuito integrado, para formar un componente
del tipo utilizado para ser montado en una tarjeta de circuito impreso (PCB) u otro soporte, conectados a través de clavijas, cables, rótulas, pastillas,
almohadillas o discos.
A los fines de esta definición:
1. Los componentes pueden ser discretos, fabricados independientemente, luego se ensamblan en un circuito integrado de componentes múltiples
(MCO) o se integran a otros componentes.
2. La expresión de silicio significa que el componente se fabrica sobre un sustrato de silicio o constituido de materias a base de silicio o fabricado en un
chip de circuito integrado.
3.     a) Los sensores de silicio están constituidos por estructuras microelectrónicas o mecánicas, que se crean en la masa o en la superficie de un
semiconductor y cuya función es detectar fenómenos físicos o químicos y convertirlos en señales eléctricas cuando se producen variaciones
de las propiedades eléctricas o una deformación de la estructura mecánica. Los fenómenos físicos o químicos se refieren a fenómenos, tales
como la presión, las ondas sonoras, la aceleración, la vibración, el movimiento, la orientación, la tensión, la intensidad de campo magnético,
la intensidad de campo eléctrico, la luz, la radiactividad, la humedad, el flujo, la concentración de productos químicos, etc.
b) Los accionadores de silicio están constituidos por estructuras microelectrónicas y mecánicas, que se crean en la masa o en la superficie de un
semiconductor y cuya función es convertir las señales eléctricas en movimiento físico.
c) Los resonadores de silicio son componentes constituidos por estructuras microelectrónicas o mecánicas, que se crean en la masa o en la
superficie de un semiconductor y cuya función es generar una oscilación mecánica o eléctrica de una frecuencia predefinida, que depende de la
geometría física de estas estructuras en respuesta a una entrada externa.
d) Los osciladores de silicio son componentes activos constituidos por estructuras microelectrónicas o mecánicas, que se crean en la masa o en la
superficie de un semiconductor y cuya función es generar una oscilación mecánica o eléctrica de una frecuencia predefinida, que depende de la
geometría física de estas estructuras.
Para los artículos definidos en esta Nota, las partidas 85.41 y 85.42 tienen prioridad sobre cualquier otra de la Nomenclatura que pudiera comprenderlos,
especialmente en razón de su función, excepto en el caso de la partida 85.23.
Notas de subpartida.
1. La subpartida 8525.81 comprende únicamente las cámaras de televisión, cámaras digitales y videocámaras, ultrarrápidas, que tienen una o más de las
siguientes características:
-
velocidad de grabación superior a 0,5 mm por microsegundo;
-
resolución temporal inferior o igual a 50 nanosegundos;
-
frecuencia de imagen superior a 225.000 cuadros por segundo.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (86, 17, '86', 'VEHÍCULOS Y MATERIAL PARA VÍAS FÉRREAS O SIMILARES, Y SUS PARTES; APARATOS MECÁNICOS (INCLUSO ELECTROMECÁNICOS) DE SEÑALIZACIÓN PARA VÍAS DE COMUNICACIÓN', 'Notas.
1.
Este Capítulo no comprende:
a)
las traviesas (durmientes) de madera u hormigón para vías férreas o similares y los elementos de hormigón para vías guía de aerotrenes
(partidas 44.06 o 68.10);
b)
los elementos para vías férreas de fundición, hierro o acero de la partida 73.02;
c)
los aparatos eléctricos de señalización, seguridad, control o mando de la partida 85.30.
2.
Se clasifican en la partida 86.07, entre otros:
a)
los ejes, ruedas, ejes montados (trenes de ruedas), llantas, bujes, centros y demás partes de ruedas;
b)
los chasis, bojes y «bissels»;
c)
las cajas de ejes (cajas de grasa o aceite), los dispositivos de freno de cualquier clase;
d)
los topes, ganchos y demás sistemas de enganche, los fuelles de intercomunicación;
e)
los artículos de carrocería.
3.
Salvo lo dispuesto en la Nota 1 anterior, se clasifican en la partida 86.08, entre otros:
a)
las vías ensambladas, placas y puentes giratorios, parachoques y gálibos;
b)
los discos y placas móviles y semáforos, aparatos de mando para pasos a nivel o cambio de agujas, puestos de maniobra a distancia y demás
aparatos mecánicos (incluso electromecánicos) de señalización, seguridad, control o mando, incluso provistos de dispositivos accesorios de
alumbrado eléctrico, para vías férreas o similares, carreteras, vías fluviales, áreas o parques de estacionamiento, instalaciones portuarias o
aeropuertos.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (87, 17, '87', 'VEHÍCULOS AUTOMÓVILES, TRACTORES, VELOCÍPEDOS Y DEMÁS VEHÍCULOS TERRESTRES; SUS PARTES Y ACCESORIOS', 'Notas.
1.
Este Capítulo no comprende los vehículos diseñados para circular solamente sobre carriles (rieles).
2.
En este Capítulo, se entiende por tractores los vehículos con motor esencialmente diseñados para tirar o empujar otros aparatos, vehículos o cargas,
incluso si tienen ciertos acondicionamientos accesorios en relación con su utilización principal, que permitan el transporte de herramientas, semillas,
abonos, etc.
Las máquinas e instrumentos de trabajo diseñados para equipar los tractores de la partida 87.01 como material intercambiable siguen su propio régimen,
aunque se presenten con el tractor, incluso si están montados sobre éste.
3.
Los chasis con cabina incorporada para vehículos automóviles se clasifican en las partidas 87.02 a 87.04 y no en la partida 87.06.
4.
La partida 87.12 comprende todas las bicicletas para niños. Los demás velocípedos para niños se clasifican en la partida 95.03.
Nota de subpartida.
1.
La subpartida 8708.22 comprende:
a) los parabrisas, vidrios traseros (lunetas)* y demás ventanillas, enmarcados;
b) los parabrisas, vidrios traseros (lunetas)* y demás ventanillas, incluso enmarcados, que incorporen dispositivos de calefacción u otros dispositivos
eléctricos o electrónicos, siempre que estén destinados exclusiva o principalmente a vehículos automóviles de las partidas 87.01 a 87.05.
Notas Complementarias.
1.
A los efectos de la importación de vehículos, chasis con motor y carrocería, clasificados en las partidas 87.01, 87.02, 87.03 (excepto: 8703.10.00.00),', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (88, 17, '88', 'AERONAVES, VEHÍCULOS ESPACIALES, Y SUS PARTES', 'Nota.
1.
En este Capítulo, se entiende por aeronave no tripulada cualquier aeronave, distinta de las de la partida 88.01, diseñada para vuelos sin piloto a
bordo. Pueden estar diseñadas para transportar una carga útil o estar equipadas con cámaras digitales u otros dispositivos integrados
permanentemente, para realizar funciones de utilidad durante su vuelo.
Sin embargo, la expresión aeronave no tripulada no comprende los juguetes voladores, diseñados exclusivamente para fines recreativos (partida', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (89, 17, '89', 'BARCOS Y DEMÁS ARTEFACTOS FLOTANTES', 'Nota.
1.
Los barcos incompletos o sin terminar y los cascos de barcos, aunque se presenten desmontados o sin montar, así como los barcos completos
desmontados o sin montar, se clasifican en la partida 89.06 en caso de duda respecto de la clase de barco a que pertenecen.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (90, 18, '90', 'INSTRUMENTOS Y APARATOS DE ÓPTICA, FOTOGRAFÍA O CINEMATOGRAFÍA, DE MEDIDA, CONTROL O PRECISIÓN; INSTRUMENTOS Y APARATOS MEDICOQUIRÚRGICOS; PARTES Y ACCESORIOS DE ESTOS INSTRUMENTOS O APARATOS', 'Notas.
1.
Este Capítulo no comprende:
a)
los artículos para usos técnicos, de caucho vulcanizado sin endurecer (partida 40.16), cuero natural o cuero regenerado (partida 42.05) o materia
textil (partida 59.11);
b)
los cinturones, fajas y demás artículos de materia textil cuyo efecto sea sostener o mantener un órgano como única consecuencia de su elasticidad
(por ejemplo: fajas de maternidad, torácicas o abdominales, vendajes para articulaciones o músculos) (Sección XI);
c)
los productos refractarios de la partida 69.03; los artículos para usos químicos u otros usos técnicos de la partida 69.09;
d)
los espejos de vidrio sin trabajar ópticamente de la partida 70.09 y los espejos de metal común o metal precioso, que no tengan las características
de elementos de óptica (partida 83.06 o Capítulo 71);
e)
los artículos de vidrio de las partidas 70.07, 70.08, 70.11, 70.14, 70.15 o 70.17;
f)
las partes y accesorios de uso general, tal como se definen en la Nota 2 de la Sección XV, de metal común (Sección XV) y artículos similares de
plástico (Capítulo 39); sin embargo, los artículos especialmente diseñados para ser utilizados exclusivamente como implantes de uso médico,
quirúrgico, odontológico o veterinario se clasifican en la partida 90.21;', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (91, 18, '91', 'APARATOS DE RELOJERÍA Y SUS PARTES', 'Notas.
1.
Este Capítulo no comprende:
a)
los cristales para aparatos de relojería y pesas para relojes (régimen de la materia constitutiva);
b)
las cadenas de reloj (partidas 71.13 o 71.17, según los casos);
c)
las partes y accesorios de uso general, tal como se definen en la Nota 2 de la Sección XV, de metal común (Sección XV) y los artículos similares
de plástico (Capítulo 39) o de metal precioso o chapado de metal precioso (plaqué), generalmente de la partida 71.15; los muelles (resortes) de
aparatos de relojería (incluidas las espirales) se clasifican, sin embargo, en la partida 91.14;
d)
las bolas de rodamiento (partidas 73.26 u 84.82, según los casos);
e)
los artículos de la partida 84.12 construidos para funcionar sin escape;
f)
los rodamientos de bolas (partida 84.82);
g)
los artículos del Capítulo 85 sin montar aún entre sí o con otros elementos para formar mecanismos de relojería o partes reconocibles como
destinadas, exclusiva o principalmente, a tales mecanismos (Capítulo 85).
2.
Se clasifican únicamente en la partida 91.01 los relojes con caja totalmente de metal precioso o chapado de metal precioso (plaqué) o de estas materias
combinadas con perlas finas (naturales)* o cultivadas o con piedras preciosas o semipreciosas (naturales, sintéticas o reconstituidas), de las partidas', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (92, 18, '92', 'INSTRUMENTOS MUSICALES; SUS PARTES Y ACCESORIOS', 'Notas.
1.
Este Capítulo no comprende:
a)
las partes y accesorios de uso general, tal como se definen en la Nota 2 de la Sección XV, de metal común (Sección XV) y los artículos similares
de plástico (Capítulo 39);
b)
los micrófonos, amplificadores, altavoces (altoparlantes), auriculares, interruptores, estroboscopios y demás instrumentos, aparatos y equipos
accesorios utilizados con los artículos de este Capítulo, que no estén incorporados en ellos ni alojados en la misma envoltura (Capítulos 85 o 90);', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (93, 19, '93', 'ARMAS, MUNICIONES, Y SUS PARTES Y ACCESORIOS', 'Notas.
1.
Este Capítulo no comprende:
a)
los cebos y cápsulas fulminantes, detonadores, cohetes de señales o granífugos y demás artículos del Capítulo 36;
b)
las partes y accesorios de uso general, tal como se definen en la Nota 2 de la Sección XV, de metal común (Sección XV) y los artículos similares
de plástico (Capítulo 39);
c)
los tanques y demás vehículos automóviles blindados de combate (partida 87.10);
d)
las miras telescópicas y demás dispositivos ópticos, salvo los montados en armas o presentados sin montar con las armas a las cuales se
destinen (Capítulo 90);
e)
las ballestas, arcos y flechas para tiro, armas embotonadas para esgrima y armas que presenten el carácter de juguete (Capítulo 95);
f)
las armas y municiones que presenten el carácter de objetos de colección o antigüedades (partidas 97.05 o 97.06).
2.
En la partida 93.06, el término partes no comprende los aparatos de radio o radar de la partida 85.26.
c)
los instrumentos y aparatos que presenten el carácter de juguete (partida 95.03);
d)
las escobillas y demás artículos de cepillería para limpieza de instrumentos musicales (partida 96.03) y los monopies, bípodes, trípodes y artículos
similares (partida 96.20);
e)
los instrumentos y aparatos que presenten el carácter de objetos de colección o antigüedades (partidas 97.05 o 97.06).
2.
Los arcos, palillos y artículos similares para instrumentos musicales de las partidas 92.02 o 92.06, que se presenten en número correspondiente a los
instrumentos a los cuales se destinen, se clasifican con ellos.
Las tarjetas, discos y rollos de la partida 92.09 se clasifican en esta partida, aunque se presenten con los instrumentos o aparatos a los que estén
destinados.', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (94, 20, '94', 'MUEBLES; MOBILIARIO MEDICOQUIRÚRGICO; ARTÍCULOS DE CAMA Y SIMILARES; LUMINARIAS Y APARATOS DE ALUMBRADO NO EXPRESADOS NI COMPRENDIDOS EN OTRA PARTE; ANUNCIOS, LETREROS Y PLACAS INDICADORAS, LUMINOSOS Y ARTÍCULOS SIMILARES; CONSTRUCCIONES PREFABRICADAS', 'Notas.
1.
Este Capítulo no comprende:
a)
los colchones, almohadas y cojines, neumáticos o de agua, de los Capítulos 39, 40 o 63;
b)
los espejos que se apoyen en el suelo (por ejemplo, espejos de vestir móviles) (partida 70.09);
c)
los artículos del Capítulo 71;
d)
las partes y accesorios de uso general, tal como se definen en la Nota 2 de la Sección XV, de metal común (Sección XV) y los artículos similares de
plástico (Capítulo 39) ni las cajas de caudales de la partida 83.03;
e)
los muebles, incluso sin equipar, que constituyan partes específicas de aparatos para la producción de frío de la partida 84.18; los muebles
especialmente diseñados para máquinas de coser, de la partida 84.52;
f)
las fuentes luminosas y los aparatos de alumbrado, y sus partes del Capítulo 85;
g)
los muebles que constituyan partes específicas de aparatos de las partidas 85.18 (partida 85.18), 85.19 u 85.21 (partida 85.22) o de las partidas', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (95, 20, '95', 'JUGUETES, JUEGOS Y ARTÍCULOS PARA RECREO O DEPORTE; SUS PARTES Y ACCESORIOS', 'Notas.
1. Este Capítulo no comprende:
a) las velas (partida 34.06);
b) los artículos de pirotecnia para diversión de la partida 36.04;
c)
los hilados, monofilamentos, cordones, cuerdas de tripa y similares para la pesca, incluso cortados en longitudes determinadas pero sin montar en sedal
(tanza) con anzuelo, del Capítulo 39, partida 42.06 o Sección XI;
d) las bolsas para artículos de deporte y demás continentes, de las partidas 42.02, 43.03 o 43.04;
e) los disfraces de materia textil, de los Capítulos 61 o 62; las prendas de vestir de deporte y prendas especiales de materia textil, de los Capítulos 61 o 62,
incluso las que incorporen accesoriamente elementos de protección, tales como placas protectoras o acolchado en las partes correspondientes a los codos,
las rodillas o la ingle (por ejemplo: prendas para esgrima o suéteres (jerseys) para porteros (arqueros)* de fútbol);
f)
las banderas y cuerdas de gallardetes, de materia textil, así como las velas para embarcaciones, deslizadores o vehículos terrestres, del Capítulo 63;
g) el calzado (excepto el fijado a patines para hielo o patines de ruedas) del Capítulo 64 y los tocados especiales para la práctica de deportes del Capítulo 65;
h) los bastones, fustas, látigos y artículos similares (partida 66.02), así como sus partes (partida 66.03);
ij) los ojos de vidrio sin montar para muñecas, muñecos u otros juguetes de la partida 70.18;', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (96, 20, '96', 'MANUFACTURAS DIVERSAS', 'Notas.
1.
Este Capítulo no comprende:
a)
los lápices de maquillaje o tocador (Capítulo 33);
b)
los artículos del Capítulo 66 (por ejemplo: partes de paraguas o bastones);
c)
la bisutería (partida 71.17);
d)
las partes y accesorios de uso general, tal como se definen en la Nota 2 de la Sección XV, de metal común (Sección XV) y los artículos similares
de plástico (Capítulo 39);
e)
los artículos del Capítulo 82 (útiles, artículos de cuchillería, cubiertos de mesa) con mangos o partes de materias para tallar o moldear. Cuando
se presenten aisladamente, estos mangos y partes se clasifican en las partidas 96.01 o 96.02;
f)
los artículos del Capítulo 90 (por ejemplo: monturas (armazones) de gafas (anteojos) (partida 90.03), tiralíneas (partida 90.17), artículos de
cepillería de los tipos manifiestamente utilizados en medicina, cirugía, odontología o veterinaria (partida 90.18));
g)
los artículos del Capítulo 91 (por ejemplo: cajas y envolturas similares de relojes o demás aparatos de relojería);
h)
los instrumentos musicales, sus partes y accesorios (Capítulo 92);
ij)
los artículos del Capítulo 93 (armas y sus partes);
k)
los artículos del Capítulo 94 (por ejemplo: muebles, luminarias y aparatos de alumbrado);
l)
los artículos del Capítulo 95 (por ejemplo: juguetes, juegos, artefactos deportivos);
m)
los artículos del Capítulo 97 (objetos de arte o colección y antigüedades).
2.
En la partida 96.02, se entiende por materias vegetales o minerales para tallar:
a)
las semillas duras, pepitas, cáscaras, nueces y materias vegetales similares para tallar (por ejemplo: nuez de corozo, de palmera-dum);
b)
el ámbar (succino) y la espuma de mar, naturales o reconstituidos, así como el azabache y materias minerales análogas al azabache.
3.
En la partida 96.03, se consideran cabezas preparadas los mechones de pelo, fibra vegetal u otra materia, sin montar, listos para su uso en la fabricación
de brochas, pinceles o artículos análogos, sin dividirlos o que solo necesiten un complemento poco importante de mano de obra, tal como el igualado o
acabado de puntas.
4.
Los artículos de este Capítulo, excepto los de las partidas 96.01 a 96.06 o 96.15, constituidos total o parcialmente por metal precioso, chapado de metal
precioso (plaqué), piedras preciosas o semipreciosas (naturales, sintéticas o reconstituidas), o que lleven perlas finas (naturales)* o cultivadas,
permanecen clasificados en este Capítulo. Sin embargo, también están comprendidos en este Capítulo los artículos de las partidas 96.01 a 96.06 o 96.15
con simples guarniciones o accesorios de mínima importancia de metal precioso, chapado de metal precioso (plaqué), de perlas finas (naturales)* o
cultivadas o piedras preciosas o semipreciosas (naturales, sintéticas o reconstituidas).', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (97, 21, '97', 'OBJETOS DE ARTE O COLECCIÓN Y ANTIGÜEDADES', 'Notas.
1.
Este Capítulo no comprende:
a)
los sellos (estampillas) de correo, timbres fiscales, enteros postales, demás artículos franqueados y análogos, sin obliterar, de la partida', '2026-05-09 13:57:11', '2026-05-09 13:57:11');
INSERT INTO capitulo (ID_capitulo, ID_seccion, Numero_de_capitulo, Descripcion_de_capitulo, Nota_legales, Created_at, Updated_at) VALUES (98, 22, '98', 'MERCANCÍAS SOMETIDAS A TRATAMIENTOS ARANCELARIOS ESPECIALES', 'Notas.
1.
Los tratamientos arancelarios especiales establecidos en el presente Capítulo, sólo serán aplicables a las mercancías importadas de acuerdo a los
requisitos y procedimientos que se establezcan en cada caso de conformidad con las normas que dicte el Ejecutivo Nacional.
2.
Las mercancías comprendidas en el presente Capítulo quedarán clasificadas aquí, incluso si se encuentran descritas de manera más precisa o completa
en otro Capítulo de este Arancel.
SUBCAPÍTULO I
PARTES, PIEZAS Y COMPONENTES PARA EL ENSAMBLAJE DE VEHÍCULOS AUTOMOTORES, MOTOCICLETAS, TRACTORES, MOTOCULTORES,
REMOLQUES Y SEMIREMOLQUES
Notas de Subcapítulo:
1.
El Subcapítulo I tiene por objeto, otorgar la clasificación arancelaria y autorizar la importación de partes, piezas y componentes para el ensamblaje de
vehículos automotores, motocicletas, tractores, motocultores, remolques y semiremolques, bajo el régimen “Material de Ensamblaje Importado para
Vehículos (MEIV)”, destinados a la producción nacional, de conformidad con los niveles previstos en las normas para el funcionamiento de la industria
automotriz que a tal efecto haya dictado el Ejecutivo Nacional a través del órgano oficial competente.
2.
A los efectos de la importación del Material de Ensamblaje Importado para Vehículos (MEIV) clasificado en el presente Subcapítulo, sólo podrán ingresar
al Territorio Nacional partes, piezas y componentes nuevas y sin uso.
3.
La clasificación de las mercancías comprendidas en el presente Subcapítulo se efectuará mediante el oficio de autorización bajo el Régimen de
Material de Ensamblaje Importado para Vehículos (MEIV), otorgado por la dependencia competente del Servicio Nacional Integrado de
Administración Aduanera y Tributaria (SENIAT).
No formarán parte del Oficio de Autorización de Material de Ensamblaje Importado para Vehículos y en consecuencia serán excluidos de las listas
presentadas, los repuestos, herramientas, resinas, pegamentos, ceras, aceites, grasas, lubricantes, alfombras y similares.
La autorización bajo el Régimen de Material de Ensamblaje Importado para Vehículos (MEIV), será otorgada bajo las siguientes condiciones:
a)
El ingreso de la totalidad de las partes, piezas y componentes deberá realizarse en la forma y en los términos bajo los cuales se certifica en la
lista correspondiente, la cual estará anexa a la autorización.
b)
La importación de las mercancías solamente podrá efectuarse por la oficina aduanera indicada en la autorización, salvo cuando concurran
razones de fuerza mayor que así lo ameriten.
c)
Durante el lapso de vigencia, la autorización podrá ser objeto de modificaciones que amplíen el alcance de la misma (inclusión de material
inicialmente excluido o de nuevas partes no incorporadas en el oficio original, cambio del número de partes). En ningún caso, las modificaciones
efectuadas a la autorización podrán alterar la clasificación arancelaria inicialmente otorgada o la vigencia de la misma.
d)
No podrá ser transferida a terceros, deberá ser utilizada exclusivamente para los fines bajo los cuales fuera concebida.
El incumplimiento de las condiciones bajo las cuales fuera concedida la autorización bajo el Régimen de Material de Ensamblaje Importado para
Vehículos (MEIV), acarreará la imposición de la multa establecida en el artículo 172 del Decreto Constituyente mediante el cual se dicta la Ley Orgánica
de Aduanas.
4.
La importación de Material de Ensamblaje Importado para Vehículos (MEIV), deberá estar amparada por el Certificado de Emisiones de Fuentes
Móviles, el cual deberá ser presentado junto con la respectiva Declaración de Aduanas, de conformidad con lo establecido en el Decreto N° 2.673 de
fecha 19 de agosto de 1998, publicado en la Gaceta Oficial N° 36.532 en fecha 04 de septiembre de 1998, mediante el cual se establecen las Normas
para el Control de las Emisiones de Escape y de las Emisiones Evaporativas provenientes de las Fuentes Móviles y en Resolución  N° 334 de fecha 30 de
noviembre de 1998, emanada del Ministerio del Ambiente y de los Recursos Naturales Renovables, publicada en la Gaceta Oficial N° 36.594 en fecha 02
de diciembre de 1998, mediante la cual se dictan las Normas relativas a la Certificación de Emisiones Provenientes de Fuentes Móviles.
5.
A efectos de la importación del Material de Ensamblaje Importado para Vehículos (MEIV) clasificado en el presente Subcapítulo, que vengan equipados
con sistemas de aire acondicionado, de enfriamiento o frigorífico (ambos inclusive), sólo podrán ingresar al Territorio Nacional, cuando dichas
mercancías no contengan ni requieran para su funcionamiento productos hidroclorofluorocarbonados de la partida 29.03 o mezclas de estos producos de
la partida 38.27, que estén afectados con Régimen Legal 1 “Importación Prohibida”.
6.
Sin menoscabo de lo establecido en la Nota 3 anterior, las importaciones de mercancías clasificadas en las partidas de este Subcapítulo, realizadas por las
personas jurídicas cuya actividad económica se corresponda con el sector automotriz, podrán ser objeto de exoneración del Arancel Externo Común fijado en la
columna tres (3), así como del Impuesto al Valor Agregado (IVA), en los casos que se indican a continuación:
a)
Cuando el “Oficio de Calificación de Material de Ensamblaje importado para vehículos (MEIV)” emanado del Ministerio del Poder Popular con competencia
en materia de industrias y producción nacional indique expresamente la exoneración del Arancel Externo Común (AEC) y/o del Impuesto al Valor
Agregado (IVA) en el caso de las mercancías clasificadas en las partidas 98.01 a 98.07; o
b)
En los términos y condiciones previstos en el respectivo “Certificado de Exoneración del sector Automotriz” emanado del Ministerio del Poder Popular con
competencia en materia de industrias y producción nacional, en el caso de la partida 98.08.
La duración de la exoneración del impuesto al valor agregado señalada en esta Nota de Subcapítulo estará sujeta a la vigencia de los beneficios tributarios
establecidos en el Decreto de Exoneraciones en Materia Aduanera, conforme a lo dispuesto en el artículo 75 del Decreto Constituyente mediante el cual se dicta e', '2026-05-09 13:57:11', '2026-05-09 13:57:11');

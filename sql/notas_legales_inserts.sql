CREATE TABLE IF NOT EXISTS notas_legales (
    ID_notas_legales INT PRIMARY KEY,
    ID_capitulo INT,
    Texto_nota TEXT,
    Created_at DATETIME,
    Updated_at DATETIME,
    FOREIGN KEY (ID_capitulo) REFERENCES capitulo(ID_capitulo)
);

INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (1, 1, 'Nota.
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
autoridad nacional con competencia en materia de agricultura.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (2, 2, 'Nota.
1.
Este Capítulo no comprende:
a) respecto de las partidas 02.01 a 02.08 y 02.10, los productos impropios para la alimentación humana;
b) los insectos comestibles, sin vida (partida 04.10);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (3, 3, 'Notas.
1.
Este Capítulo no comprende:
a)  los mamíferos de la partida 01.06;
b)  la carne de los mamíferos de la partida 01.06 (partidas 02.08 o 02.10);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (4, 4, 'Notas.
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
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (5, 5, 'Notas.
1.
Este Capítulo no comprende:
a) los productos comestibles, excepto las tripas, vejigas y estómagos de animales, enteros o en trozos, y la sangre animal (líquida o desecada);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (6, 6, 'Notas.
1.
Salvo lo dispuesto en la segunda parte de la partida 06.01, este Capítulo comprende únicamente los productos suministrados habitualmente por los
horticultores, viveristas o floristas para la plantación o la ornamentación. Sin embargo, se excluyen de este Capítulo las papas (patatas)*, cebollas hortenses,
chalotes, ajos y demás productos del Capítulo 7.
2.
Los ramos, cestas, coronas y artículos similares se asimilan a las flores o follajes de las partidas 06.03 o 06.04, sin tener en cuenta los accesorios de otras
materias. Sin embargo, estas partidas no comprenden los collages y cuadros similares de la partida 97.01.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (7, 7, 'Notas.
1.
Este Capítulo no comprende los productos forrajeros de la partida 12.14.
2.
En las partidas 07.09, 07.10, 07.11 y 07.12, la expresión hortalizas alcanza también a los hongos comestibles, trufas, aceitunas, alcaparras, calabacines
(zapallitos), calabazas (zapallos), berenjenas, maíz dulce (Zea mays var. saccharata), frutos de los géneros Capsicum o Pimenta, hinojo y plantas como el
perejil, perifollo, estragón, berro y mejorana cultivada (Majorana hortensis u Origanum majorana).
3.
La partida 07.12 comprende todas las hortalizas secas de las especies clasificadas en las partidas 07.01 a 07.11, excepto:
a) las hortalizas de vaina secas desvainadas (partida 07.13);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (8, 8, 'Notas.
1.
Este Capítulo no comprende los frutos no comestibles.
2.
Las frutas y otros frutos refrigerados se clasifican en las mismas partidas que las frutas y frutos frescos correspondientes.
3.
Las frutas y otros frutos secos de este Capítulo pueden estar parcialmente rehidratados o tratados para los fines siguientes:
a) mejorar su conservación o estabilidad (por ejemplo: mediante tratamiento térmico moderado, sulfurado, adición de ácido sórbico o de sorbato de potasio);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (9, 9, 'Notas.
1.
Las mezclas entre sí de los productos de las partidas 09.04 a 09.10 se clasifican como sigue:
a) las mezclas entre sí de productos de una misma partida se clasifican en dicha partida;
b) las mezclas entre sí de productos de distintas partidas se clasifican en la partida 09.10.
El hecho de que se añadan otras sustancias a los productos comprendidos en las partidas 09.04 a 09.10 (incluidas las mezclas citadas en los apartados a) o b)
anteriores) no influye en su clasificación, siempre que las mezclas así obtenidas conserven el carácter esencial de los productos citados en cada una de estas
partidas. Por el contrario, dichas mezclas se excluyen de este Capítulo y se clasifican en la partida 21.03 si constituyen condimentos o sazonadores
compuestos.
2.
Este Capítulo no comprende la pimienta de Cubeba (Piper cubeba) ni los demás productos de la partida 12.11.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (10, 10, 'Notas.
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
como aquél.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (11, 11, 'Notas.
1.
Este Capítulo no comprende:
a) la malta tostada acondicionada como sucedáneo del café (partidas 09.01 o 21.01, según los casos);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (12, 12, 'Notas.
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
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (13, 13, 'Nota.
1.
La partida 13.02 comprende, entre otros, los extractos de regaliz, piretro (pelitre)*, lúpulo o áloe, y el opio.
Por el contrario, se excluyen:
a)
el extracto de regaliz con un contenido de sacarosa superior al 10  %  en peso o presentado como artículo de confitería (partida 17.04);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (14, 14, 'Notas.
1.
Se excluyen de este Capítulo y se clasifican en la Sección XI, las materias y fibras vegetales de las especies principalmente utilizadas para la fabricación de
textiles, cualquiera que sea su preparación, así como las materias vegetales trabajadas especialmente para su utilización exclusiva como materia textil.
2.
La partida 14.01 comprende, entre otras, el bambú (incluso hendido, aserrado longitudinalmente o cortado en longitudes determinadas, con los extremos
redondeados, blanqueado, ignifugado, pulido o teñido), los trozos de mimbre, de caña y similares, la médula de roten (ratán)* y el roten (ratán)* hilado.
No se clasifican en esta partida las tablillas, láminas o cintas de madera (partida 44.04).
3.
La partida 14.04 no comprende la lana de madera (partida 44.05) ni las cabezas preparadas para artículos de cepillería (partida 96.03).', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (15, 15, 'Notas.
1.
Este Capítulo no comprende:
a)
el tocino y grasa de cerdo o de ave, de la partida 02.09;
b)
la manteca, grasa y aceite de cacao (partida 18.04);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (16, 16, 'Notas.
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
vulgares corresponden a las mismas especies mencionadas en el Capítulo 3 con el mismo nombre.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (17, 17, 'Nota.
1.
Este Capítulo no comprende:
a)
los artículos de confitería que contengan cacao (partida 18.06);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (18, 18, 'Notas.
1.
Este Capítulo no comprende:
a) las preparaciones alimenticias que contengan una proporción superior al 20 % en peso de embutidos, carne, despojos, sangre, insectos, pescado o de
crustáceos, moluscos o demás invertebrados acuáticos, o de una combinación de estos productos (Capítulo 16);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (19, 19, 'Notas.
1.
Este Capítulo no comprende:
a)
las preparaciones alimenticias que contengan una proporción superior al 20  %  en peso de embutidos, carne, despojos, sangre, insectos, pescado o
de crustáceos, moluscos o demás invertebrados acuáticos, o de una combinación de estos productos (Capítulo 16), excepto los productos rellenos de
la partida 19.02;
b)
los productos a base de harina, almidón o fécula (galletas, etc.) especialmente preparados para la alimentación de los animales (partida 23.09);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (20, 20, 'Notas.
1.
Este Capítulo no comprende:
a)
las hortalizas y frutas u otros frutos preparados o conservados por los procedimientos citados en los Capítulos 7, 8 u 11;
b)
las grasas y aceites, vegetales (Capítulo 15);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (21, 21, 'Notas.
1.
Este Capítulo no comprende:
a)
las mezclas de hortalizas de la partida 07.12;
b)
los sucedáneos del café tostados que contengan café en cualquier proporción (partida 09.01);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (22, 22, 'Notas.
1.
Este Capítulo no comprende:
a)
los productos de este Capítulo (excepto los de la partida 22.09) preparados para uso culinario de tal forma que resulten impropios para el
consumo como bebida (generalmente, partida 21.03);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (23, 23, 'Nota.
1.
Se incluyen en la partida 23.09 los productos de los tipos utilizados para la alimentación de los animales, no expresados ni comprendidos en otra parte,
obtenidos por tratamiento de materias vegetales o animales y que, por este hecho, hayan perdido las características esenciales de la materia originaria,
excepto los desperdicios vegetales, residuos y subproductos vegetales procedentes de estos tratamientos.
Nota de subpartida.
1.
En la subpartida 2306.41, se entiende por de semillas de nabo (nabina) o de colza con bajo contenido de ácido erúcico las semillas definidas en la
Nota 1 de subpartida del Capítulo 12.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (24, 24, 'Notas.
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
productos para pipa de agua, que no contengan tabaco, se excluyen de esta subpartida.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (25, 25, 'Notas.
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
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (26, 26, 'Notas.
1.
Este Capítulo no comprende:
a)
las escorias y desechos industriales similares preparados en forma de macadán (partida 25.17);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (27, 27, 'Notas.
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
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (28, 28, 'Notas.
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
los óxidos de carbono, el cianuro de hidrógeno, los ácidos fulmínico, isociánico, tiociánico y demás ácidos cianogénicos simples o complejos (partida', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (29, 29, 'Notas.
1.
Salvo disposición en contrario, las partidas de este Capítulo comprenden solamente:
a)
los compuestos orgánicos de constitución química definida presentados aisladamente, aunque contengan impurezas;
b)
las mezclas de isómeros de un mismo compuesto orgánico (aunque contengan impurezas), excepto las mezclas de isómeros de los hidrocarburos
acíclicos saturados o sin saturar (distintos de los estereoisómeros) (Capítulo 27);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (30, 30, 'Notas.
1. Este Capítulo no comprende:
a)
los alimentos dietéticos, alimentos enriquecidos, alimentos para diabéticos, complementos alimenticios, bebidas tónicas y el agua mineral (Sección
IV), excepto las preparaciones nutritivas para administración por vía intravenosa;
b)
los productos, tales como comprimidos, gomas de mascar o parches autoadhesivos (que se administran por vía transdérmica), que contengan
nicotina y destinados para ayudar a dejar de fumar (partida 24.04);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (31, 31, 'Notas.
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
de estos productos.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (32, 32, 'Notas.
1. Este Capítulo no comprende:
a)
los productos de constitución química definida presentados aisladamente, excepto los que respondan a las especificaciones de las partidas 32.03 o', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (33, 33, 'Notas.
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
perfume o de cosméticos; las preparaciones de tocador para animales.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (34, 34, 'Notas.
1.
Este Capítulo no comprende:
a)
las mezclas o preparaciones alimenticias de grasas o de aceites, animales, vegetales o de origen microbiano, de los tipos utilizados como
preparaciones de desmoldeo (partida15.17);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (35, 35, 'Notas.
1.
Este Capítulo no comprende:
a)
las levaduras (partida 21.02);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (36, 36, 'Notas.
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
c)           las antorchas y hachos de resina, teas y similares.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (37, 37, 'Notas.
1.
Este Capítulo no comprende los desperdicios ni los materiales de desecho.
2.
En este Capítulo, el término fotográfico se refiere al procedimiento mediante el cual se forman imágenes visibles sobre superficies fotosensibles, incluidas
las termosensibles, directa o indirectamente, por la acción de la luz o de otras formas de radiación.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (38, 38, 'Notas.
1.
Este Capítulo no comprende:
a)
los productos de constitución química definida presentados aisladamente, excepto los siguientes:
1)
el grafito artificial (partida 38.01);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (39, 39, 'Notas.
1.
En la Nomenclatura, se entiende por plástico las materias de las partidas 39.01 a 39.14 que, sometidas a una influencia exterior (generalmente el calor y la
presión y, en su caso, la acción de un disolvente o de un plastificante), son o han sido susceptibles de adquirir una forma por moldeo, colada, extrusión,
laminado o cualquier otro procedimiento, en el momento de la polimerización o en una etapa posterior, forma que conservan cuando esta influencia ha
dejado de ejercerse.
En la Nomenclatura, el término plástico comprende también la fibra vulcanizada. Sin embargo, dicho término no se aplica a las materias textiles de la', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (40, 40, 'Notas.
1.
En la Nomenclatura, salvo disposición en contrario, la denominación caucho comprende los productos siguientes, incluso vulcanizados o endurecidos:
caucho natural, balata, gutapercha, guayule, chicle y gomas naturales análogas, caucho sintético, caucho facticio derivado de los aceites y todos estos
productos regenerados.
2.
Este Capítulo no comprende:
a)
los productos de la Sección XI (materias textiles y sus manufacturas);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (41, 41, 'Notas.
1.
Este Capítulo no comprende:
a)
los recortes y desperdicios similares de cueros y pieles en bruto (partida 05.11);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (42, 42, 'Notas.
1.
En este Capítulo, la expresión cuero natural comprende también los cueros y pieles agamuzados (incluido el agamuzado combinado al aceite), los cueros y
pieles charolados y sus imitaciones de cueros o pieles chapados y los cueros y pieles metalizados.
2.
Este Capítulo no comprende:
a)
los catguts estériles y las ligaduras estériles similares para suturas quirúrgicas (partida 30.06);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (43, 43, 'Notas.
1.
Independientemente de la peletería en bruto de la partida 43.01, en la Nomenclatura, el término peletería abarca las pieles de todos los animales
curtidas o adobadas, sin depilar.
2.
Este Capítulo no comprende:
a)
las pieles y partes de pieles de ave con sus plumas o plumón (partidas 05.05 o 67.01, según los casos);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (44, 44, 'Notas.
1.
Este Capítulo no comprende:
a)
las virutas y astillas de madera ni la madera triturada, molida o pulverizada, de las especies utilizadas principalmente en perfumería, en medicina o
para usos insecticidas, parasiticidas o similares (partida 12.11);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (45, 45, 'Nota.
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
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (46, 46, 'Notas.
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
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (47, 47, 'Nota.
1.
En la partida 47.02, se entiende por pasta química de madera para disolver la pasta química cuya fracción de pasta insoluble después de una hora en una
disolución al 18  %  de hidróxido de sodio (NaOH) a 20  ° C , sea superior o igual al 92  %  en peso en la pasta de madera a la sosa (soda) o al sulfato o
superior o igual al 88  %  en peso en la pasta de madera al sulfito, siempre que en este último caso el contenido de cenizas sea inferior o igual al 0,15
%  en peso.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (48, 48, 'Notas.
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
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (49, 49, 'Notas.
1.
Este Capítulo no comprende:
a)
los negativos y positivos fotográficos con soporte transparente (Capítulo 37);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (50, 51, 'Nota.
1. En la Nomenclatura se entiende por:
a)
lana, la fibra natural que recubre los ovinos;
b)
pelo fino, el pelo de alpaca, llama (incluido el guanaco), vicuña, camello, dromedario, yac, cabra de Angora («mohair»), cabra del Tíbet, cabra de
Cachemira o cabras similares (excepto cabras comunes), conejo (incluido el conejo de Angora), liebre, castor, coipo o rata almizclera;
c)
pelo ordinario, el pelo de los animales no citados anteriormente, excepto el pelo y las cerdas de cepillería (partida 05.02) y la crin (partida', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (51, 54, 'Notas.
1.
En la Nomenclatura, las expresiones fibras sintéticas y fibras artificiales se refieren a las fibras discontinuas y a los filamentos de polímeros orgánicos
obtenidos industrialmente:
a)
por polimerización de monómeros orgánicos para obtener polímeros tales como poliamidas, poliésteres, poliolefinas o poliuretanos, o por
modificación química de polímeros obtenidos por este procedimiento (por ejemplo, poli(alcohol vinílico) obtenido por hidrólisis del poli(acetato de
vinilo));
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (52, 55, 'Nota.
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
Los cables de longitud inferior o igual a 2 m se clasifican en las partidas 55.03 o 55.04.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (53, 56, 'Notas.
1.
Este Capítulo no comprende:
a)
la guata, fieltro y tela sin tejer, impregnados, recubiertos o revestidos de sustancias o preparaciones (por ejemplo: de perfume o cosméticos del', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (54, 57, 'Notas.
1.
En este Capítulo, se entiende por alfombras y demás revestimientos para el suelo, de materia textil, cualquier revestimiento para el suelo cuya superficie de
materia textil quede al exterior después de colocado. También están comprendidos los artículos que tengan las características de los revestimientos para el
suelo de materia textil pero que se utilicen para otros fines.
2.
Este Capítulo no comprende los productos textiles planos y bastos de protección que se colocan bajo las alfombras y demás revestimientos para el suelo.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (55, 58, 'Notas.
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
utilizados en prendas de vestir, tapicería o usos similares.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (56, 59, 'Notas.
1.
Salvo disposición en contrario, cuando se utilice en este Capítulo el término tela(s), se refiere a los tejidos de los Capítulos 50 a 55 y de las partidas 58.03
y 58.06, a las trenzas, artículos de pasamanería y artículos ornamentales análogos, en pieza, de la partida 58.08 y a los tejidos de punto de las partidas', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (57, 60, 'Notas.
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
metil (ISO).', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (58, 61, 'Notas.
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
superficie exterior de los demás componentes del surtido y cuya espalda sea de la misma tela que el forro de la chaqueta (saco);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (59, 62, 'Notas.
1.
Este Capítulo solo se aplica a los artículos confeccionados con cualquier textil, excepto la guata y los artículos de punto distintos de los de la partida', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (60, 63, 'Notas.
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
presentados en balas o sacos.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (61, 64, 'Notas.
1.
Este Capítulo no comprende:
a)
los artículos desechables para cubrir los pies o el calzado, de materiales livianos o poco resistentes (por ejemplo: papel, hojas de plástico) y sin
suela aplicada (régimen de la materia constitutiva);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (62, 65, 'Notas.
1.
Este Capítulo no comprende:
a)
los sombreros y demás tocados usados de la partida 63.09;
b)
los sombreros y demás tocados de amianto (asbesto) (partida 68.12);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (63, 66, 'Notas.
1.
Este Capítulo no comprende:
a)
los bastones medida y similares (partida 90.17);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (64, 67, 'Notas.
1.
Este Capítulo no comprende:
a)
las telas filtrantes y capachos, de cabello (partida 59.11);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (65, 68, 'Notas.
1.
Este Capítulo no comprende:
a)
los artículos del Capítulo 25;
b)
el papel y cartón estucados, recubiertos, impregnados o revestidos de las partidas 48.10 o 48.11 (por ejemplo: los revestidos de polvo de mica o
grafito, el papel y cartón embetunados o asfaltados);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (66, 69, 'Notas.
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
refractarias y fosfatos.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (67, 70, 'Notas.
1.
Este Capítulo no comprende:
a)
los artículos de la partida 32.07 (por ejemplo: composiciones vitrificables, frita de vidrio y demás vidrios, en polvo, gránulos, copos o escamillas);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (68, 71, 'Notas.
1.
Sin perjuicio de la aplicación de la Nota 1 A) de la Sección VI y de las excepciones previstas a continuación, se incluye en este Capítulo cualquier artículo
compuesto total o parcialmente:
a)
de perlas naturales (finas)* o cultivadas, de piedras preciosas o semipreciosas (naturales, sintéticas o reconstituidas);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (69, 72, 'Notas.
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
d)     Chapas, hojas y tiras', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (70, 73, 'Notas.
1.
En este Capítulo, se entiende por fundición el producto obtenido por moldeo que no responda a la composición química del acero definido en la Nota 1 d)
del Capítulo 72, en el que el hierro predomine en peso sobre cada uno de los demás elementos.
2.
En este Capítulo, el término alambre se refiere a los productos obtenidos en caliente o en frío cuya sección transversal, cualquiera que fuese su forma,
sea inferior o igual a 16 mm en su mayor dimensión.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (71, 74, 'Nota.
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
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (72, 82, 'Notas.
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
Se excluyen de este Capítulo, las cabezas, peines, contrapeines, hojas y cuchillas de afeitadoras, cortadoras de pelo o esquiladoras, eléctricas (partida', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (73, 83, 'Notas.
1.
En este Capítulo, las partes de metal común se clasifican en la partida correspondiente a los artículos a los que pertenecen. Sin embargo, no se
consideran partes de manufacturas de este Capítulo, los artículos de fundición, hierro o acero de las partidas 73.12, 73.15, 73.17, 73.18 o 73.20 ni los
mismos artículos de otro metal común (Capítulos 74 a 76 y 78 a 81).
2.
En la partida 83.02, se consideran ruedas las que tengan un diámetro (incluido el bandaje, en su caso) inferior o igual a 75 mm o las de mayor diámetro
(incluido el bandaje, en su caso) siempre que la anchura de la rueda o del bandaje que se les haya montado sea inferior a 30 mm.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (74, 84, 'Notas.
1. Este Capítulo no comprende:
a) las muelas y artículos similares para moler y demás artículos del Capítulo 68;
b) las máquinas, aparatos o artefactos (por ejemplo, bombas), de cerámica y las partes de cerámica de las máquinas, aparatos o artefactos de cualquier
materia (Capítulo 69);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (75, 85, 'Notas.
1. Este Capítulo no comprende:
a) las mantas, cojines, calientapiés y artículos similares, que se calienten eléctricamente; las prendas de vestir, calzado, orejeras y demás artículos que se
lleven sobre la persona, calentados eléctricamente;
b) las manufacturas de vidrio de la partida 70.11;
c) las máquinas y aparatos de la partida 84.86;
d) las aspiradoras de los tipos utilizados en medicina, cirugía, odontología o veterinaria (partida 90.18);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (76, 86, 'Notas.
1.
Este Capítulo no comprende:
a)
las traviesas (durmientes) de madera u hormigón para vías férreas o similares y los elementos de hormigón para vías guía de aerotrenes
(partidas 44.06 o 68.10);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (77, 87, 'Notas.
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
A los efectos de la importación de vehículos, chasis con motor y carrocería, clasificados en las partidas 87.01, 87.02, 87.03 (excepto: 8703.10.00.00),', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (78, 88, 'Nota.
1.
En este Capítulo, se entiende por aeronave no tripulada cualquier aeronave, distinta de las de la partida 88.01, diseñada para vuelos sin piloto a
bordo. Pueden estar diseñadas para transportar una carga útil o estar equipadas con cámaras digitales u otros dispositivos integrados
permanentemente, para realizar funciones de utilidad durante su vuelo.
Sin embargo, la expresión aeronave no tripulada no comprende los juguetes voladores, diseñados exclusivamente para fines recreativos (partida', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (79, 89, 'Nota.
1.
Los barcos incompletos o sin terminar y los cascos de barcos, aunque se presenten desmontados o sin montar, así como los barcos completos
desmontados o sin montar, se clasifican en la partida 89.06 en caso de duda respecto de la clase de barco a que pertenecen.', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (80, 90, 'Notas.
1.
Este Capítulo no comprende:
a)
los artículos para usos técnicos, de caucho vulcanizado sin endurecer (partida 40.16), cuero natural o cuero regenerado (partida 42.05) o materia
textil (partida 59.11);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (81, 91, 'Notas.
1.
Este Capítulo no comprende:
a)
los cristales para aparatos de relojería y pesas para relojes (régimen de la materia constitutiva);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (82, 92, 'Notas.
1.
Este Capítulo no comprende:
a)
las partes y accesorios de uso general, tal como se definen en la Nota 2 de la Sección XV, de metal común (Sección XV) y los artículos similares
de plástico (Capítulo 39);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (83, 93, 'Notas.
1.
Este Capítulo no comprende:
a)
los cebos y cápsulas fulminantes, detonadores, cohetes de señales o granífugos y demás artículos del Capítulo 36;
b)
las partes y accesorios de uso general, tal como se definen en la Nota 2 de la Sección XV, de metal común (Sección XV) y los artículos similares
de plástico (Capítulo 39);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (84, 94, 'Notas.
1.
Este Capítulo no comprende:
a)
los colchones, almohadas y cojines, neumáticos o de agua, de los Capítulos 39, 40 o 63;
b)
los espejos que se apoyen en el suelo (por ejemplo, espejos de vestir móviles) (partida 70.09);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (85, 95, 'Notas.
1. Este Capítulo no comprende:
a) las velas (partida 34.06);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (86, 96, 'Notas.
1.
Este Capítulo no comprende:
a)
los lápices de maquillaje o tocador (Capítulo 33);
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (87, 97, 'Notas.
1.
Este Capítulo no comprende:
a)
los sellos (estampillas) de correo, timbres fiscales, enteros postales, demás artículos franqueados y análogos, sin obliterar, de la partida', '2026-05-09 14:13:28', '2026-05-09 14:13:28');
INSERT INTO notas_legales (ID_notas_legales, ID_capitulo, Texto_nota, Created_at, Updated_at) VALUES (88, 98, 'Notas.
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
establecidos en el Decreto de Exoneraciones en Materia Aduanera, conforme a lo dispuesto en el artículo 75 del Decreto Constituyente mediante el cual se dicta e', '2026-05-09 14:13:28', '2026-05-09 14:13:28');

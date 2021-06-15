-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2021 a las 05:33:00
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `store`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nombre_cte` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `categoria` int(2) NOT NULL COMMENT 'Categorias (Oro,Plata,Bronce)',
  `status` int(2) NOT NULL COMMENT 'Activo/Inactivo',
  `comentario` varchar(255) NOT NULL,
  `fecha_add` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id_client`, `nombre_cte`, `direccion`, `email`, `telefono`, `categoria`, `status`, `comentario`, `fecha_add`) VALUES
(1, 'Varios', 'San Miguel', 'sanmiguel@gmail.com', '76734068', 1, 1, 'General', '11/06/2021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasto`
--

CREATE TABLE `gasto` (
  `id_gasto` int(100) NOT NULL,
  `fecha_add` varchar(100) NOT NULL,
  `concepto` varchar(100) NOT NULL,
  `monto` varchar(100) NOT NULL,
  `user_add` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `fecha_add` varchar(25) NOT NULL,
  `hora_add` varchar(25) NOT NULL,
  `client_id` int(11) NOT NULL,
  `total_neto` varchar(255) NOT NULL COMMENT 'total.sin.descuento',
  `descuento` varchar(25) NOT NULL,
  `total` varchar(25) NOT NULL COMMENT 'totalneto.menos.descuento',
  `metodo` int(11) NOT NULL COMMENT 'efectivo/tarjeta',
  `totalProducto` varchar(100) NOT NULL COMMENT 'total.productos.orden',
  `tipo_orden` int(11) NOT NULL COMMENT 'consig/venta',
  `monto` varchar(25) NOT NULL COMMENT 'monto.pagado',
  `saldo` varchar(25) NOT NULL COMMENT 'saldo.por.liquidar',
  `estado` int(11) NOT NULL COMMENT 'liquidada/No_liquidada',
  `fecha_liqui` varchar(25) NOT NULL,
  `user_add_id` int(11) NOT NULL COMMENT 'quien.hace.la.venta'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id_order`, `fecha_add`, `hora_add`, `client_id`, `total_neto`, `descuento`, `total`, `metodo`, `totalProducto`, `tipo_orden`, `monto`, `saldo`, `estado`, `fecha_liqui`, `user_add_id`) VALUES
(100, '11/06/2021', '08:15:05', 1, '13020.00', '0', '13020.00', 1, '45', 1, '0', '13020.00', 2, '08/01/2018', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders_detalle`
--

CREATE TABLE `orders_detalle` (
  `order_detalle_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cantidad` varchar(255) NOT NULL COMMENT 'cantidad.a.comprar',
  `precio` varchar(255) NOT NULL COMMENT 'precio.unitario',
  `total` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orders_detalle`
--

INSERT INTO `orders_detalle` (`order_detalle_id`, `order_id`, `product_id`, `cantidad`, `precio`, `total`) VALUES
(1, 100, 9000152, '5', '250', '1250.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id_product` int(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `imagen` text NOT NULL,
  `costo` varchar(20) NOT NULL COMMENT 'precio.compra',
  `precio` varchar(10) NOT NULL COMMENT 'precio.oro',
  `plata` varchar(100) NOT NULL COMMENT 'precio.plata',
  `bronce` varchar(100) NOT NULL COMMENT 'precio.bronce',
  `marca` varchar(50) NOT NULL,
  `cantidad` int(10) NOT NULL COMMENT 'stock.existencia',
  `genero` int(2) NOT NULL COMMENT 'H/M/Niño/Niña',
  `status` int(5) NOT NULL COMMENT 'Disp/NoDisp',
  `estado` int(2) NOT NULL COMMENT 'Eliminado',
  `fchProd_add` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id_product`, `nombre`, `imagen`, `costo`, `precio`, `plata`, `bronce`, `marca`, `cantidad`, `genero`, `status`, `estado`, `fchProd_add`) VALUES
(9000100, 'PANTALON GABARDINA MUJER', '../assests/images/stock/185585a5197b91702a.jpg', '175', '280', '300', '315', 'GABARDINA ', 26, 2, 1, 2, '11/06/2021'),
(9000101, 'PANTALON GABARDINA ', '../assests/images/stock/291515a5198054f7ea.jpg', '175', '280', '300', '315', 'GABARDINA', 30, 1, 1, 1, '11/06/2021'),
(9000102, ' BLUSA M', '../assests/images/stock/77245a519dcfc889c.jpg', '90', '160', '190', '220', 'LICRA ALGODON', 13, 2, 1, 1, '11/06/2021'),
(9000103, 'SUDADERA ESTAMPADA M', '../assests/images/stock/296985a51a1e9a5264.jpg', '160', '260', '290', '320', 'ESTAMPADA', 23, 2, 1, 1, '11/06/2021'),
(9000104, 'MAYON', '../assests/images/stock/125635a51a3123ce47.jpg', '90', '160', '10', '5', 'MAYON', 25, 2, 1, 1, '11/06/2021'),
(9000105, 'CAMISA HOMBRE', '../assests/images/stock/244005a51a71b034ae.jpg', '115', '220', '10', '5', 'CAMISA, POLO, PLAYERA', 33, 1, 1, 1, '11/06/2021'),
(9000106, 'CAMISA CON DEFECTO H', '../assests/images/stock/95455a51a79aa191b.jpg', '115', '50', '10', '5', 'defecto', 1, 1, 1, 1, '11/06/2021'),
(9000107, 'PANTALON MEZCLILLA H', '../assests/images/stock/200465a51af7f842bf.jpg', '270', '340', '10', '5', 'MEZCLILLA', 10, 1, 1, 1, '11/06/2021'),
(9000108, 'PANTALON MEZCLILLA M', '../assests/images/stock/193115a51afa93db59.jpg', '270', '340', '10', '5', 'MEZCLILLA', 3, 2, 1, 1, '11/06/2021'),
(9000109, 'BLUSA', '../assests/images/stock/202875a52a51d31053.jpg', '120', '220', '10', '5', 'IMPORTADA O NACIONAL', 15, 2, 1, 1, '11/06/2021'),
(9000110, 'BLUSA VARIOS', '../assests/images/stock/82045a52a6ee554d0.jpg', '120', '150', '10', '5', 'IMPORTADA O NACIONAL', 15, 2, 1, 1, '11/06/2021'),
(9000111, 'PANTALON VESTIR STRECH', '../assests/images/stock/320855a52a9366aa40.jpg', '115', '260', '10', '5', 'STRECH', -2, 2, 1, 1, '11/06/2021'),
(9000112, 'VESTIDOS VARIOS', '../assests/images/stock/295465a52ad9bee919.jpg', '150', '220', '10', '5', 'IMPORTADOS O NACIONAL', 8, 2, 1, 1, '11/06/2021'),
(9000113, 'CAMISETA MUJER', '../assests/images/stock/82835a52adc5d584e.jpg', '30', '60', '10', '5', 'LICRA', 2, 2, 1, 1, '11/06/2021'),
(9000114, 'BLUSA CHICS V', '../assests/images/stock/125365a52b3c4c5997.jpg', '50', '70', '10', '5', 'CHICS', 7, 2, 1, 1, '11/06/2021'),
(9000115, 'PLAYERA VARIOS M.', '../assests/images/stock/66095a52b409b1cf5.jpg', '70', '110', '10', '5', 'NACIONAL', 6, 2, 1, 1, '11/06/2021'),
(9000116, 'SUETER HOMBRE', '../assests/images/stock/325215a52dee51d5c2.jpg', '160', '260', '10', '5', 'IMPORTADO O NACIONAL ', 12, 1, 1, 1, '11/06/2021'),
(9000117, 'CHALECO MUJER', '../assests/images/stock/12945a52e0fce4bc9.jpg', '350', '395', '10', '5', 'NACIONAL ', 0, 2, 1, 1, '11/06/2021'),
(9000118, 'FALDA LICRA LARGA ', '../assests/images/stock/69595a52e178f1749.jpg', '150', '250', '10', '5', 'NACIONAL', 5, 2, 1, 1, '11/06/2021'),
(9000119, 'PALAZZO CORTO VARIOS', '../assests/images/stock/54365a52e26fe8356.jpg', '110', '200', '10', '5', 'IMPORTADO', 2, 2, 1, 1, '11/06/2021'),
(9000120, 'CAMISA NIÃ‘O', '../assests/images/stock/7095a52e475346b8.jpg', '90', '160', '10', '5', 'MANGA LARGA O MANGA CORTA ', 0, 3, 1, 1, '11/06/2021'),
(9000121, 'PANTALON NIÃ‘O', '../assests/images/stock/256265a52e543f3c8b.jpg', '90', '250', '10', '5', 'NACIONAL O IMPORTADO', 13, 3, 1, 1, '11/06/2021'),
(9000122, 'CONJUNTO GABARDINA Y GABARDINA', '../assests/images/stock/151795a52e67be49bd.jpg', '150', '300', '10', '5', 'NACIONAL O IMPORTADO', 0, 4, 1, 1, '11/06/2021'),
(9000123, 'CHALECO BOLITAS MUJER VARIOS', '../assests/images/stock/187285a52e82a73b96.jpg', '200', '250', '10', '5', 'IMPORTADO', 4, 2, 1, 1, '11/06/2021'),
(9000124, 'PALAZZO LARGO ESPALDA ABIERTA ', '../assests/images/stock/16015a52e91948ac2.jpg', '150', '270', '10', '5', 'NACIONAL', 2, 2, 1, 1, '11/06/2021'),
(9000125, 'SACO DECO. MUJER', '../assests/images/stock/102145a52ea9b7c354.jpg', '170', '280', '10', '5', 'NACIONAL O IMPORTADO ', 1, 2, 1, 1, '11/06/2021'),
(9000126, 'SACO CORTO MUJER', '../assests/images/stock/166795a52eadab9e1e.jpg', '120', '210', '10', '5', 'IMPORTADO O NACIONAL', 1, 2, 1, 1, '11/06/2021'),
(9000127, 'CHALECO NIÃ‘O', '../assests/images/stock/204365a52ec19526bc.jpg', '190', '300', '10', '5', 'NACIONAL O IMPORTADO', 1, 3, 1, 1, '11/06/2021'),
(9000128, 'CHAMARRA ASTRA HOMBRE', '../assests/images/stock/177895a52ecbaa01ce.jpg', '200', '320', '10', '5', 'NACIONAL', 0, 1, 1, 1, '11/06/2021'),
(9000129, 'CHALECO CORTO PELOS ', '../assests/images/stock/236665a52edc52e28b.jpg', '240', '300', '10', '5', 'NACIONAL O IMPORTADO', 3, 2, 1, 1, '11/06/2021'),
(9000130, 'CHALECO LARGO PELOS VARIOS', '../assests/images/stock/186275a52eea2077eb.jpg', '250', '320', '10', '5', 'IMPORTADO O NACIONAL', 0, 2, 1, 1, '11/06/2021'),
(9000131, 'PONCHO BUFANDA VARIOS', '../assests/images/stock/54405a52f0a94280e.jpg', '250', '320', '10', '5', 'IMPORTADO O NACIONAL ', 1, 2, 1, 1, '11/06/2021'),
(9000132, 'SACO HOMBRE ', '../assests/images/stock/154815a52f0df09a31.jpg', '290', '450', '10', '5', 'NACIONAL O INTERNACIONAL', 2, 2, 1, 1, '11/06/2021'),
(9000133, 'CHAMARRA MUJER A', '../assests/images/stock/134665a52f2633e6be.jpg', '200', '320', '10', '5', 'NACIONAL O IMPORTADO', 0, 2, 1, 1, '11/06/2021'),
(9000134, 'ENSAMBLE MUJER VARIOS', '../assests/images/stock/14795a52f59fd28c5.jpg', '180', '230', '10', '5', 'NACIONAL O IMPORTADA', 3, 2, 1, 1, '11/06/2021'),
(9000135, 'SUETER TEJIDO MUJER VARIOS', '../assests/images/stock/184205a52fb052ebb5.jpg', '130', '170', '10', '5', 'NACIONAL ', 8, 2, 1, 1, '11/06/2021'),
(9000136, 'SUETER MOÃ‘OS VARIOS', '../assests/images/stock/110375a52fc13f0745.jpg', '150', '200', '10', '5', 'NACIONAL ', 1, 2, 1, 1, '11/06/2021'),
(9000137, 'SUETER BUFANDA VARIOS ', '../assests/images/stock/249785a52fce668b8a.jpg', '160', '215', '10', '5', 'IMPORTADO ', 8, 2, 1, 1, '11/06/2021'),
(9000138, 'VESTIDO CUELLO ALTO ', '../assests/images/stock/141795a53034609d45.jpg', '150', '240', '10', '5', 'NACIONAL', 2, 2, 1, 1, '11/06/2021'),
(9000139, 'BLUSA CUELLO ALTO VARIOS', '../assests/images/stock/285125a5303989b451.jpg', '130', '180', '10', '5', 'IMPORTADA', 2, 2, 1, 1, '11/06/2021'),
(9000140, 'SUETER GRUESO CUELLO ', '../assests/images/stock/235775a5305e5ec40d.jpg', '150', '270', '10', '5', 'GALAS WOMAN', 4, 2, 1, 1, '11/06/2021'),
(9000141, 'CHAMARRA TACTO PIEL ', '../assests/images/stock/12465a530645b9584.jpg', '300', '450', '10', '5', 'IMPORTADA', 0, 1, 1, 1, '11/06/2021'),
(9000142, 'CHALECO LARGO TEJIDO PELOS', '../assests/images/stock/263035a53073bd2ff8.jpg', '245', '395', '10', '5', 'LUP-YINS', 2, 2, 1, 1, '11/06/2021'),
(9000143, 'SUETER ELIESER MUJER', '../assests/images/stock/85885a53078e6ddb4.jpg', '150', '250', '10', '5', 'IMPORTADO O NACIONAL', 2, 2, 1, 1, '11/06/2021'),
(9000144, 'SUETER LUP-YINS MUJER', '../assests/images/stock/84055a53086a70af4.jpg', '155', '260', '10', '5', 'LUP-YINS', 4, 2, 1, 1, '11/06/2021'),
(9000145, 'CAZADORA LARGA MUJER', '../assests/images/stock/43305a5308bed4bd8.jpg', '430', '650', '10', '5', 'IMPORTADA O NACIONAL', 0, 2, 1, 1, '11/06/2021'),
(9000146, 'SACO INVIERNO MUJER', '../assests/images/stock/122515a53093c2ccff.jpg', '250', '395', '10', '5', 'YIMAI', 0, 2, 1, 1, '11/06/2021'),
(9000147, 'SUETER KOKKIRI MUJER', '../assests/images/stock/190645a530a36300f3.jpg', '200', '260', '10', '5', 'KOKKIRI', 1, 2, 1, 1, '11/06/2021'),
(9000148, 'SUETER ENCAJE MUJER', '../assests/images/stock/300335a530b1323851.jpg', '150', '250', '10', '5', 'RSHAN', 2, 2, 1, 1, '11/06/2021'),
(9000149, 'VESTIDO DEFECTO', '../assests/images/stock/324115a53186dcb602.jpg', '160', '60', '10', '5', 'EVELYN', 1, 2, 1, 1, '11/06/2021'),
(9000150, 'SACOS OLEC ', '../assests/images/stock/284735a535c626db4e.jpg', '310', '450', '10', '5', 'OLEC', 0, 2, 1, 1, '11/06/2021'),
(9000151, 'ENSAMBLE MIKO', '../assests/images/stock/270065a535de8eeb1f.jpg', '150', '240', '10', '5', 'MIKO', 0, 2, 1, 1, '11/06/2021'),
(9000152, 'SUETER REZAMS TEJIDO ', '../assests/images/stock/324795a535f2be29a7.jpg', '160', '250', '10', '5', 'REZAMS', -1, 2, 1, 1, '11/06/2021'),
(9000153, 'BLUSA HEART HIPS', '../assests/images/stock/195935a5364847cdd5.jpg', '170', '290', '10', '5', 'HEART HIPS', 0, 2, 1, 1, '11/06/2021'),
(9000154, 'VESTIDO INVIERNO ', '../assests/images/stock/11665a5365bda32c5.jpg', '140', '220', '10', '5', 'LUP-YINS', 0, 2, 1, 1, '11/06/2021'),
(9000155, 'SUETER TEJIDO BORDES', '../assests/images/stock/257755a536680ec367.jpg', '165', '250', '10', '5', 'NACIONAL', 1, 2, 1, 1, '11/06/2021'),
(9000156, 'CAPA PELOS', '../assests/images/stock/259745a536e8137579.jpg', '215', '330', '10', '5', 'NACIONAL O IMPORTADA', 0, 2, 1, 1, '11/06/2021'),
(9000157, 'POLO NIÃ‘O', '../assests/images/stock/223915a536f0e13391.jpg', '90', '140', '200', '300', 'NACIONAL O IMPORTADA', 35, 3, 1, 1, '11/06/2021'),
(9000158, 'CHAMARRA MEZCLILLA', '../assests/images/stock/122605a537110e683a.jpg', '260', '395', '10', '5', 'NACIONAL O IMPORTADA', 0, 1, 1, 1, '11/06/2021'),
(9000159, 'CHALECO CORTO PELOS', '../assests/images/stock/31495a537254077c9.jpg', '180', '280', '310', '325', 'NACIONAL O IMPORTADA', -2, 2, 1, 1, '11/06/2021'),
(9000161, 'Pantalon Blanco', '../assests/images/stock/314035a71e24f3e9b8.jpg', '1', '2', '50', '100', 'LEVIS', 5, 1, 1, 2, '11/06/2021'),
(9000162, 'Pantalon Blanco Formal', '../assests/images/stock/213325a71e28b5a732.jpg', '250', '300', '350', '380', 'OGGI ', 4, 1, 1, 1, '11/06/2021'),
(9000163, 'Gabardina ', '../assests/images/stock/220745a7b12a2baea4.jpg', '400', '480', '520', '550', 'Victoria ', 10, 2, 1, 1, '11/06/2021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `rol` int(2) NOT NULL COMMENT 'Admin/Normal',
  `fecha_add` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `nombre`, `username`, `password`, `rol`, `fecha_add`) VALUES
(1, 'Administrador', 'admin', 'admin', 1, '11/06/2021'),
(4, 'Cajero General', 'cajero', '12345', 2, '11/06/2021');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `gasto`
--
ALTER TABLE `gasto`
  ADD PRIMARY KEY (`id_gasto`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`);

--
-- Indices de la tabla `orders_detalle`
--
ALTER TABLE `orders_detalle`
  ADD PRIMARY KEY (`order_detalle_id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `orders_detalle`
--
ALTER TABLE `orders_detalle`
  MODIFY `order_detalle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9000164;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

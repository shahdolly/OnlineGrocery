-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 21, 2020 at 05:06 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Grocerydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `delivery_sent`
--

CREATE TABLE `delivery_sent` (
  `ID` bigint(10) NOT NULL,
  `Couriername` varchar(100) NOT NULL,
  `Awbno` varchar(15) NOT NULL,
  `OrderID` bigint(10) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_sent`
--

INSERT INTO `delivery_sent` (`ID`, `Couriername`, `Awbno`, `OrderID`, `Created_date`) VALUES
(5, 'OnDot Courier', '34542354354354', 120420071535, '2020-04-12 16:22:33');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` bigint(11) NOT NULL,
  `OrderID` bigint(20) NOT NULL,
  `customerid` bigint(11) NOT NULL,
  `Address` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `Pincode` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `Paymenttype` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `OrderTotal` double NOT NULL,
  `CalculateTax` double NOT NULL,
  `DiscountCoupen` double NOT NULL,
  `OrderStatus` varchar(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'P',
  `Created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `OrderID`, `customerid`, `Address`, `Pincode`, `Paymenttype`, `OrderTotal`, `CalculateTax`, `DiscountCoupen`, `OrderStatus`, `Created_date`) VALUES
(16, 120420071535, 1, '59, Link road, Jursey, Canada', '14003', 'CashonDelivery', 2966, 341, 0, 'S', '2020-04-12 13:45:35'),
(17, 200420040438, 1, '59, Link road, Jursey, Canada', '', '', 423, 48, 11, 'P', '2020-04-20 20:04:38'),
(18, 200420043225, 1, '59, Link road, Jursey, Canada', 'l6v2j6', 'CashonDelivery', 99, 11, 2, 'P', '2020-04-20 20:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `ID` bigint(10) NOT NULL,
  `orderid` bigint(10) NOT NULL,
  `productid` bigint(11) NOT NULL,
  `quantity` bigint(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`ID`, `orderid`, `productid`, `quantity`, `price`) VALUES
(17, 120420071535, 2, 7, 375),
(18, 200420040438, 2, 1, 375),
(19, 200420043225, 1, 2, 44);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID` int(11) NOT NULL,
  `Brandname` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `Categoryname` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `Itemname` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `QuantityAvaliable` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(1000) COLLATE latin1_general_ci NOT NULL,
  `price` float NOT NULL,
  `picture` varchar(80) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID`, `Brandname`, `Categoryname`, `Itemname`, `QuantityAvaliable`, `description`, `price`, `picture`) VALUES
(102, 'Lays', 'Lays', 'Magic Masala', '100gms', 'Lays is made with best-quality fresh potatoes, simply sliced and cooked in edible vegetable oils, and then seasoned with delicious flavours!', 2, 'Lays.jpeg'),
(103, 'McVities Original Digestives', 'McVities Original Digestives', 'Cookies', '350gm', 'McVities Original Digestives. Made from a blend of wheat flour and wholemeal, they are a great source of fibre.', 5, 'cookies.jpg'),
(104, 'Great Value Original ', 'Great Value Original ', 'Marshmallows', '350gms', 'Great Value Original Marshmallows. These Marshmallows are light and airy. Dont forget them with your Hot Chocolate or try them roasted by the fire! Or in your favourite recipes', 2, 'Marshmallows.jpg'),
(101, 'Doritos', 'Doritos', 'Nacho Cheese ', '200 gms', 'Bite into the cheesy goodness of Doritos Nacho Cheese flavoured tortilla chips for a tastebud-shattering crunch. With Doritos Nacho Cheese chips every crunchy bite is packed with a burst of bold, cheesy flavour. Turn any event into a bold snacking experience!', 3, 'doritos.jpg'),
(100, 'Great Value ', 'Great Value', 'Sour Cream and Onion', '200gms', 'Game night, movie night or family night - Great Value sour cream & onion chips are the ideal snack for any occasion and are perfect for sharing. Available in a variety of flavours and sizes.', 1, 'Sour.jpg'),
(98, 'Great Value', 'All purpose flour', 'Maida', '5kg', 'Great Value Original All-Purpose Flour is enriched and comes pre-sifted. Made in Canada using wheat grown by Canadian farmers. Excellent for all types of cooking and baking.', 35, 'Maida.jpg'),
(99, 'Great Value', 'Great Value', 'Potato Chips', '200 gms', 'Game night, movie night or family night - Great Value potato chips are the ideal snack for any occasion and are perfect for sharing. Available in a variety of flavours and sizes.', 1, 'Potato.jpg'),
(95, 'Maggie', 'Maggie', 'Maggie Noodles', '420 gms', 'Maggi 2-Minute Noodles Masala Spicy Noodles Fast Delivery. Ready in 2 minutes, perfect meal for a hang out or house party. Need a quick meal on the go? Reach for Maggi Masala Noodles!', 2, 'Maggie.jpg'),
(96, 'Diamond G Brown Rice', 'Diamond G Brown Rice', 'Brown Rice', '6.8kg', 'Diamond G Brown Rice is a nutritious whole grain brown rice that is grown in the fertile soils of Northern California. It can be used for a wide variety of cuisines, including sushi, poke or teriyaki bowls, or even as a simple side dish.', 22, 'BrownRice.webp'),
(97, 'Deep', 'Gram Flour', 'Besan ', '1.85 kg', 'Besan or gram flour, also known as chickpea flour, is obtained from chickpea or Bengal gram and easily available in the markets. ... Besan is also a common ingredient used in making Indian street food and sweets - halwa, laddoo, barfi,etc. ', 25, 'Besan.jpg'),
(105, 'Aashirvaad Whole Wheat Atta', 'Aashirvaad Whole Wheat Atta', 'Wheat Flour', '5kgs', 'Aashirvaad Atta is made from the choicest grains heavy on the palm, golden amber in colour and hard in bite.The dough made from Aashirvaad Atta absorbs more water, hence rotis remain softer for longer.', 10, 'aata.jpg'),
(106, 'Great Value Cheddar Cheese Marble', 'Great Value Cheddar Cheese Marble', 'Cheddar Cheese', '450 gms', 'Great Value Marble Cheddar Cheese in a 450-gram package is a fast, easy and delicious way to add flavour to your familys daily diet. Perfect for slicing on sandwiches, enjoying with crackers or incorporating into your favourite recipes, this marble cheddar is a real crowd pleaser.', 6, 'cheese.jpg'),
(107, 'Sealtest Partly Skimmed ', 'Sealtest Partly Skimmed ', ' Milk', '4 lb', 'Nothing compares to a cold glass of fresh Sealtest Milk. A light, refreshing and natural taste with immense nutritional value. Sealtest offers you quality milk in all varieties. Whether its Homogenized skim milk, Sealtest Milk provides an excellent source of calcium and vitamin D.', 5, 'milk.jpg'),
(108, 'Kelloggs Corn Flakes Cereal', 'Kelloggs Corn Flakes Cereal', 'Corn Flakes Cereal', '750 gms', 'Kelloggs Corn Flakes cereal simple crispy flakes of corn are great on their own or with your favourite fruits and nuts. Each serving of Kelloggs Corn Flakes cereal is a source of 7 essential nutrients and no has artificial flavours or colours. These crunchy flakes are a great start to your day.', 6, 'corn flakes.jpg'),
(109, 'Royale Tissue Paper', 'Royale Tissue Paper', 'Tissue Paper', '2 ply', 'Velvety Soft, Plush and Thick Royale Velour bathroom tissue offers an experience totally unlike any other Royale product.This premium bathroom tissue also comes in Triple Rolls for fewer roll changes.', 25, 'Tissue.jpg'),
(110, 'Canada Dry Ginger Ale ', 'Canada Dry Ginger Ale ', 'Ginger Ale ', '12 cans', 'Canada Dry Ginger Ale is a genuine Canadian sparkling favourite with a crisp, clean light and refreshing taste that is perfect to relax and unwind with.', 2, 'cans.jpg'),
(111, 'Dempster White Bread', 'Dempster White Bread', 'White Bread', '650 gms', 'We bake fresh daily from coast to coast the Canadian way, with dedicated bakers choosing Canadian wheat flour and quality ingredients. Our bakers are proud to bring you the soft and nourishing bread you love, with our simplest recipe yet!', 3, 'bread.jpg'),
(112, 'Your Fresh Market Medium Ground Beef', 'Your Fresh Market Medium Ground Beef', 'Ground Beef', '2 kgs', 'Your Fresh Market Medium Ground Beef\r\n', 15, 'beef.jpg'),
(113, 'Haiku Asian Style Noodles', 'Haiku Asian Style Noodles', 'Noodles', '400gms', 'Our most popular product! Haiku Asian noodles have won over consumers with their superior quality combined with a cooking time of only 3 minutes. Extremely practical when preparing weekday family meals, each package contains 6 individual portions for simple and mess-proof portion sizing', 3, 'noodles.jpg'),
(114, 'Green Cabbage', 'Green Cabbage', 'Green Cabbage', '2kgs', 'Sliced thinly, green cabbage can be eaten raw or it can go into stir-fries, soups, and braises. The whole leaves can also be used to make cabbage rolls. Raw leaves are somewhat peppery in flavor, but the cabbage gets sweeter as it cooks.', 4, 'cabbage.jpg'),
(115, 'Huy Fong Foods Sriracha Chili Sauce', 'Huy Fong Foods Sriracha Chili Sauce', 'Sriracha Chili Sauce', '740ml', 'H-Fong Sriracha Chili Sauce\r\n', 4, 'hot sauce.jpg'),
(116, 'Coconut Brown', 'Coconut Brown', 'Coconut Brown', '2', 'When drained, coconut water can be reserved for drinking. The white meat inside can be grated for fruit salad or baking.\r\nFRESHNESS GUARANTEED\r\nYou want the freshest for your family and so do we. We trained our Associates\r\nto pick the best and freshest products to meet your expectations.\r\n', 3, 'coconut.jpg'),
(117, 'Kraft Dinner Original Macaron Cheese', 'Kraft Dinner Original Macaroni Cheese', 'Kraft Dinner Original Macaroni Cheese', '250gms', 'The classic blue box that started it all. When you see the familiar, cheesy KD on the package you know that this traditional macaroni & cheese classic is sure to smileify your familys faces. Dont miss out on this iconic cheesy flavour!\r\n\r\n', 1, 'kd.jpg'),
(118, 'Ding Dong Mixed Nuts', 'Ding Dong Mixed Nuts', 'Nuts', '100 gms', 'Ding Dong Mixed Nuts A fun medley of peanuts, corn bits, green peas, corn chips and curls.\r\n\r\n', 1, 'nuts.jpg'),
(119, 'Great Value Lasagna Pasta', 'Great Value Lasagna Pasta', 'Lasagna Pasta', '500 gms', 'Great Value Pastas are convenient, affordable, tasty and versatile. Our Great Value Lasagna is made with semolina. Not sure how to make a lasagna Try the recipe printed on the package for your next family gathering. For that traditional baked pasta recipe that everyone loves at a Great Value.\r\n', 2, 'pastaa.jpg'),
(120, 'Great Value Dry Pasta Spaghetti', 'Great Value Dry Pasta Spaghetti', ' Pasta Spaghetti', '900gms', 'When you have kids, keeping a steady stock of budget-friendly Great Value Spaghetti on your shelf is a must. Great Value Spaghetti lets you make quick and easy pasta dinners on those nights when you want to connect around the table, but time is limited.\r\n', 2, 'Spaghetti .jpg'),
(121, 'Oreo Original Sandwich Cookies', 'Oreo Original Sandwich Cookies', 'Original', '285 gms', 'Nothing compares to the iconic OREO. The classic combo of cream sandwiched between two chocolate cookies has been winning hearts for over 100 years.', 3, 'original oreo.jpg'),
(122, 'Great Value Almond Milk Chocolate', 'Great Value Almond Milk Chocolate', ' Almond Milk Chocolate', '100gms', 'Great Value Almond Milk Chocolate\r\n', 1, 'choclate.jpg'),
(123, 'SMARTIES  Candy Coated Chocolates', 'SMARTIES Candy Coated Chocolates', ' Candy Coated Chocolates', '1000 gms', 'Make your day more colourful with SMARTIES Minis Colourful candy-coated chocolate in a smaller sized carton.\r\n', 3, 'smarties.jpg'),
(124, 'Redpath Granulated White Sugar', 'Redpath Granulated White Sugar', 'White Sugar', '2kgs', 'Redpath Granulated White Sugar 2 kg.\r\n', 2, 'sugar.jpg'),
(125, 'Windsor Table Salt', 'Windsor Table Salt', ' Table Salt', '1kg ', 'Windsor Table Salt is a kitchen essential thats been trusted for generations. You can use it for baking, cooking and seasoning. This well-known Windsor product is one of the reasons the Windsor brand is so trusted. Offering a consistent quality that you can rely on.\r\n\r\n', 4, 'salt.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `ID` bigint(20) NOT NULL,
  `UserFullname` varchar(50) NOT NULL,
  `Designation` varchar(50) NOT NULL,
  `EmailID` varchar(50) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`ID`, `UserFullname`, `Designation`, `EmailID`, `Password`, `Created_date`) VALUES
(1, 'Jeevan Sharma', 'Administrator', 'admin@gmail.com', '1', '2018-02-24 05:36:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_register`
--

CREATE TABLE `tbl_register` (
  `ID` int(11) NOT NULL,
  `Fullname` varchar(100) NOT NULL,
  `EmailID` varchar(100) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Contactno` varchar(20) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_register`
--

INSERT INTO `tbl_register` (`ID`, `Fullname`, `EmailID`, `Password`, `Contactno`, `Address`, `Created_date`) VALUES
(1, 'Jeevan Sharma', 'jeevansharma@gmail.com', '123456', '9815427833', '59, Link road, Jursey, Canada', '2020-04-12 07:13:45'),
(3, 'Kajal', 'sharma28kajal@gmail.com', '1234', '4372376933', 'Toronto', '2020-04-20 23:53:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `delivery_sent`
--
ALTER TABLE `delivery_sent`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EmailID` (`EmailID`);

--
-- Indexes for table `tbl_register`
--
ALTER TABLE `tbl_register`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Contactno` (`Contactno`),
  ADD UNIQUE KEY `EmailID` (`EmailID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery_sent`
--
ALTER TABLE `delivery_sent`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_register`
--
ALTER TABLE `tbl_register`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

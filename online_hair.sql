-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2023 at 01:07 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_hair`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(3) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'L\'Oreal Professionnel'),
(2, 'Lisap Milano'),
(3, 'Matrix'),
(4, 'Joanna'),
(5, 'Wella');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `client_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`) VALUES
(1, 4),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `cart_product`
--

CREATE TABLE `cart_product` (
  `id` int(10) NOT NULL,
  `product_id` int(4) NOT NULL,
  `amount` int(3) NOT NULL,
  `cart_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(2) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Shampoos'),
(2, 'Conditioners'),
(3, 'Hair Masks'),
(4, 'Hair Oils'),
(5, 'Sprays');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(5) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `email`, `password`) VALUES
(1, 'alice.smith@gmail.com', 'abcdefg1234567'),
(2, '123dfg@gmail.com', '$2b$05$6K9.YKOGeva5V'),
(3, '678dfg@gmail.com', '$2b$05$oMjTriA95QohRUbGxnny4ucRHqBBhKigB/pgW54bV5xSL2eu8vzJG'),
(4, 'tetiana.bragina@gmail.com', '$2b$05$FzNFxmTjQj50ojscmAcvS.PPmg.w2sGfFGvsR2IAmkCWeSKi3ZJZ2'),
(5, 'tet.control@gmail.com', '$2b$05$2NHngKJI7DXwWkCDFQBetOaP.lESOYywR.GF81a4rOMz3K3o0TZgS');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `amount` int(3) NOT NULL,
  `rating` int(2) DEFAULT NULL,
  `img` varchar(100) NOT NULL,
  `category_id` int(2) NOT NULL,
  `brand_id` int(3) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `amount`, `rating`, `img`, `category_id`, `brand_id`, `description`) VALUES
(1, 'Keratin Hair Conditioner, 1000ml', 10.79, 30, 0, 'joanna-professional-keratin-conditioner.jpg', 2, 4, 'Joanna Keratin Conditioner – recommended for use after hair treatments and on brittle, weak, and difficult-to-style hair, the conditioner contains keratin complex, which rebuilds and strengthens the hair, giving it flexibility, elasticity and strength. It leaves hair nourished, regenerated and with a lovely sheen.'),
(2, 'Matrix Total Results Food For Soft shampoo (1000ml)', 23.6, 12, 0, 'matrix-total-results-food-for-soft-shampoo-1000ml.jpg', 1, 3, 'Matrix Food For Soft moisturizing shampoo with avocado oil and hyaluronic acid nourishes and cleanses the hair without depriving dry hair of the necessary moisture. The Food For Soft moisturizing system makes hair 7 times softer! Suitable for all types of dry hair, as well as for daily use. The aroma reveals sweet notes of toffee, jasmine, freesia and vanilla.'),
(3, 'Matrix Total Results Keep Me Vivid spray, 200ml', 15.86, 30, 0, 'matrix-total-results-keep-me-vivid-sprejs.jpg', 5, 3, 'Keep me Vivid Color Lamination spray is a professional product that gives hair a stunning shine. This spray restores the pH level and maintains the brightness and color saturation of dyed hair for a much longer time. It also smoothes out the scales of damaged hair and enhances shine of the hair.'),
(4, 'Matrix Total Results InstaCure conditioner (1000ml)', 23.6, 19, 0, 'matrix-total-results-instacure-conditioner-1000ml.jpg', 2, 3, 'Matrix InstaCure anti-breakage conditioner is enriched with liquid protein and helps restore strength and reduce breakage in dry and damaged hair. A restorative system consisting of shampoo, conditioner, anti-fragility and anti-porosity spray fills porosity, creating an even and smooth surface of the hair. The aroma of the series reveals notes of fresh ginger, green tea, lemongrass, freesia, May rose, and cedar.'),
(6, 'Matrix Total Results Food For Soft conditioner (1000ml)', 23.6, 8, 0, 'matrix-total-results-food-for-soft-conditioner-1000ml.jpg', 2, 3, 'Matrix Food For Soft moisturizing conditioner with avocado oil and hyaluronic acid makes combing a lot easier. It nourishes, moisturizes and makes hair softer. The Food For Soft moisturizing system makes hair 7 times softer! Suitable for all types of dry hair, as well as for daily use. The aroma reveals sweet notes of toffee, jasmine, freesia and vanilla.'),
(7, 'Matrix Total Results InstaCure shampoo (1000ml)\r\n ', 23.6, 5, 0, 'matrix-total-results-instacure-shampoo-1000ml.jpg', 1, 3, 'Matrix InstaCure anti-breakage shampoo, enriched with liquid protein, helps restore strength and reduce breakage in dry and damaged hair. A restorative system consisting of shampoo, conditioner, anti-fragility and anti-porosity spray fills porosity, creating an even and smooth surface of the hair. The aroma of the series reveals notes of fresh ginger, green tea, lemongrass, freesia, May rose, and cedar.'),
(8, 'L\'Oreal Professionnel Serie Expert Curl Expression Cleansing shampoo (500ml)', 32.1, 46, 0, 'l-oreal-professionnel-serie-expert-curl-expression-cleansing-shampoo-500ml.jpg', 1, 1, 'L\'Oreal Professionnel Curl Expression professional cleansing shampoo gently removes impurities and provides hydration without itching or damaging hair. The formula is enriched with glycerin, Urea H and hibiscus seed extract. Removes 2x more impurities than classic shampoo*. Light soft texture. Easy penetration of the product to the scalp, even in the case of very curly hair. Foams quickly and rinses off easily. No sulfates, no silicones, no parabens.'),
(9, 'L\'Oreal Professionnel Serie Expert Chroma Crème Purple shampoo (500ml)', 32.1, 5, 0, 'l-oreal-professionnel-serie-expert-chroma-creme-purple-shampoo-500ml.jpg', 1, 1, 'When coloring or balayaging blonde hair, the color may gradually fade, showing unwanted warm yellow undertones. To maintain a beautiful, uniform and cool shade, a neutralizing shampoo is needed, depending on the coloring tone. L\'Oreal Professionnel Chroma Crème shampoo with purple pigments is perfect for neutralizing yellow undertones in blonde shades. The creamy formula of the shampoo combines the neutralizing effect of the shampoo and the caring properties of the conditioner, it evens out the color without overdrying the hair and provides a pleasant sensual experience when applied.'),
(10, 'L\'Oreal Professionnel Serie Expert Scalp Advanced Anti-Oiliness shampoo (500ml)', 32.1, 15, 0, 'l-oreal-professionnel-serie-expert-scalp-advanced-anti-oiliness-shampoo-500ml.jpg', 1, 1, 'L\'Oreal Professionnel Scalp Advanced Anti-Oiliness shampoo for oily hair. Formula contains 3% AHA. The light gel texture of the product cleanses the scalp of the remnants of dirt and sebum, leaving a feeling of lightness and cleanliness. Shampoo restores radiance and regulates sebum production. Right after the first application: 78% less oil on scalp and 93% more nourishment for the hair*. Free of dye, silicones and alcohol.'),
(11, 'L\'Oreal Professionnel Serie Expert Curl Expression Density serum-spray, 90ml', 49.3, 5, 0, 'l-oreal-professionnel-serie-expert-curl-expression-density-serum-spray.jpg', 5, 1, 'L\'Oreal Professionnel Curl Expression density stimulator is specially formulated for curly, wavy and coily textures. It is enriched with Stemoxydine 5% and Hibiscus Seed Extract that stimulates the roots of the hair to reveal a thicker and fuller appearance in just 3 months.'),
(12, 'L\'Oreal Professionnel Serie Expert Volumetry spray, 125ml', 24.1, 7, 0, 'l-oreal-professionnel-serie-expert-volumetry-spray.jpg', 5, 1, 'L\'Oreal Volumetry leave-In spray for fine hair helps create extra volume by lifting hair at the very roots. The spray is included in the top products for hair volume, as the effect is visible even on very thin hair and is prone to oil build-up. The formula contains salicylic acid, which has antiseptic and anti-inflammatory properties and provides effective fixation of the strands. The result: a visible volume that extends from the very roots and lasts all day.'),
(13, 'Joanna Professional Ceramides conditioner (1000ml)', 8.45, 7, 0, 'joanna-professional-ceramides-conditioner-1000ml.jpg', 2, 4, 'Joanna Ceramides Conditioner – contains carefully selected ingredients that nourish the hair after chemical treatments. It thoroughly cleanses all types of hair, with a lovely, fresh scent that will give your female clients a unique sense of pleasure and relaxation during hair care.'),
(14, 'Joanna Professional Volume\'Up Complex spray, 300ml', 8.85, 3, 0, 'joanna-professional-volume-up-complex-spray.jpg', 5, 4, 'Joanna Volume’Up Spray – recommended especially for hair care of thin, flat and delicate hair. Thanks to the Volume\'Up complex, these cosmetics visibly boost the volume of your hairstyle, elevating it from the roots and marine collagen moisturizes and strengthens it without weighing it down. Your hairstyle gets a full shape and healthy look and your hair is full of vigor.'),
(15, 'Joanna Professional Silk shampoo (1000ml)', 7.54, 11, 0, 'joanna-professional-silk-shampoo-1000ml.jpg', 1, 4, 'Joanna Silk Shampoo – advanced formulas of the product from this line contain hydrolyzed silk proteins, which provide your hair with the proper level of moisturization. They ensure extensive hair care, smoothness, softness and easy combing. They effectively improve the condition of your hair and provide gloss and a healthy, well-kept look.'),
(16, 'Joanna Professional AcidPRO Complex shampoo (1000ml)', 7.54, 29, 0, 'joanna-professional-acidpro-complex-shampoo-1000ml.jpg', 1, 4, 'Every day, external factors negatively affect the condition of the hair: they deform the structure of the hair, cause brittleness and thinning; hair becomes weak and lifeless, split hair ends start to appear. All these problems can be solved with Joanna AcidPRO shampoo.'),
(17, 'Lisap Milano TCR Elixir Care oil (150ml)', 22.55, 3, 0, 'lisap-milano-tcr-elixir-care-oil-150ml.jpg', 4, 2, 'Lisap TCR Elixir Care moisturizing oil will be suitable for all hair types bur especially for chemically treated and damaged hair. This oil helps maintain the necessary moisture levels of the hair, allowing for it to remain smooth and soft for a much longer time. Doesn’t make the hair heavy or greasy. Makes hair drying and styling easier and at the same time makes hair stronger.'),
(18, 'Lisap Milano Fashion Silky Feel, 50ml', 17.88, 11, 0, 'lisap-milano-fashion-silky-feel.jpg', 4, 2, 'Lisap Fashion Silky Feel is a protective treatment for the hair. It protects the outer layer of the hair and leaves the hair feeling silky soft again. There is no question of split ends, after applying the Fashion Silky Feel. Finally, the Fashion Silky Feel makes the hair fluff free.'),
(19, 'Lisap Milano Keep Control spray, 250ml', 12.87, 13, 0, 'lisap-milano-keep-control-spray.jpg', 5, 2, 'Lisap Keep Control leave-in spray is used to smooth the porosity of the hair. It has excellent nourishing and protective properties. Fills in damaged areas and pores on the surface of the hair. Makes the hair structure denser and uniform, preparing them for the perming procedure. KC Porosity Equalizer spray contains heat-protective silicones, baobab seed oil, black cumin seed oil, desert rose extract, AC Vegan Keratin complex, shea butter, jojoba oil, linoleic acid, wheat bran extract and UV filter as main care ingredients.'),
(20, 'Lisap Milano Light Scale Anti-Yellow spray, 125 ml', 12.87, 14, 0, 'lisap-milano-light-scale-anti-yellow-spray.jpg', 5, 2, 'Light-colored and gray hair requires special carefully selected care. To protect their color from unwanted yellow tones, Lisap\'s Light Scale thermal protection spray with purple pigments will help with this problem. In addition to acting as a thermal protector, this product also enhances the glossy shine of the hair thanks to the presence of hydrolyzed pearls and real diamond dust in the formula, and neutralizes unwanted yellow tones.'),
(21, 'Wella Professionals Invigo Volume Boost uplifting care spray, 150ml', 17.28, 17, 0, 'wella-professionals-invigo-volume-boost-uplifting-care-spray.jpg', 5, 5, 'Wella Invigo Volume Boost uplifting care spray gives lightweight fullness, care, shine and gentle control to the hair. Your hair will get a newfound volume and shine, looking the best it ever has.'),
(22, 'Wella Professionals Oil Reflections light oil (100ml)', 22.28, 16, 0, 'wella-professionals-oil-reflections-light-oil-100ml.jpg', 4, 5, 'The main indicator of healthy hair is a healthy shine. What better way to achieve this shine than with Wella Oil Reflections light oil?  We can’t all be perfect and our hair can’t be all perfect too. It’s dry, it’s fragile and it’s dehydrated. Don’t blame us, we just have more important things to do. Now that you’ve remembered about your hair though, it’s time to make it healthy again and you can start it by using this magnificent oil!'),
(23, 'Wella Professionals Invigo Volume Boost crystal mask (500ml)', 38.24, 9, 0, 'wella-professionals-invigo-volume-boost-crystal-mask-500ml.jpg', 3, 5, 'Wella Invigo Volume Boost mask is a translucent treatment that transforms thin hair in almost an instant, making it denser, bulkier and more elastic. Makes hair styling and combing a lot easier.'),
(24, 'L\'Oreal Professionnel Serie Expert Vitamino Color mask (500ml)', 36.65, 10, 0, 'l-oreal-professionnel-serie-expert-vitamino-color-mask-500ml.jpg', 3, 1, 'L\'Oreal Vitamino Color mask is an absolute bestseller in colored hair home care. In just a couple of minutes, it nourishes the hair, makes it stronger and softer, and enhances its shine. The formula contains resveratrol – a natural antioxidant from grape berries that protects pigments from leaching out. The result is a long-lasting color up to 8 weeks after dyeing the hair.');

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

CREATE TABLE `product_review` (
  `id` int(7) NOT NULL,
  `client_id` int(6) NOT NULL,
  `product_id` int(4) NOT NULL,
  `rate` int(2) NOT NULL,
  `review` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_r_id` (`product_id`),
  ADD KEY `client_r_id` (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart_product`
--
ALTER TABLE `cart_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product_review`
--
ALTER TABLE `product_review`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
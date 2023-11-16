-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2023 at 01:38 PM
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
(5, 'Wella'),
(11, 'Schwarzkopf Professional'),
(12, 'GOLDWELL'),
(13, 'Helen Seward'),
(14, 'LAKME'),
(15, 'INSIGHT'),
(16, 'KEEN STROK');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `client_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(5, 'Sprays'),
(7, 'Serums'),
(8, 'Concentrate');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(5) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `first_name`, `last_name`, `email`, `password`, `address`) VALUES
(1, 'Alice ', 'Smith', 'alice.smith@gmail.com', 'abcdefg1234567', 'Riga, Terbatas iela 32/12, LV-1010'),
(2, 'Arturs', 'Kors', '123dfg@gmail.com', '$2b$05$6K9.YKOGeva5V', 'Riga, Hella iela, 34/18'),
(3, 'Andrejs', 'Lobs', '678dfg@gmail.com', '$2b$05$oMjTriA95QohRUbGxnny4ucRHqBBhKigB/pgW54bV5xSL2eu8vzJG', 'Riga, Benza iela, 30/12');

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
(1, 'Keratin Hair Conditioner, 1000ml', 10.79, 30, 5, 'joanna-professional-keratin-conditioner.jpg', 2, 4, 'Joanna Keratin Conditioner – recommended for use after hair treatments and on brittle, weak, and difficult-to-style hair, the conditioner contains keratin complex, which rebuilds and strengthens the hair, giving it flexibility, elasticity and strength. It leaves hair nourished, regenerated and with a lovely sheen.'),
(2, 'Matrix Total Results Food For Soft shampoo (1000ml)', 23.6, 12, 5, 'matrix-total-results-food-for-soft-shampoo-1000ml.jpg', 1, 3, 'Matrix Food For Soft moisturizing shampoo with avocado oil and hyaluronic acid nourishes and cleanses the hair without depriving dry hair of the necessary moisture. The Food For Soft moisturizing system makes hair 7 times softer! Suitable for all types of dry hair, as well as for daily use. The aroma reveals sweet notes of toffee, jasmine, freesia and vanilla.'),
(3, 'Matrix Total Results Keep Me Vivid spray, 200ml', 15.86, 30, 4, 'matrix-total-results-keep-me-vivid-sprejs.jpg', 5, 3, 'Keep me Vivid Color Lamination spray is a professional product that gives hair a stunning shine. This spray restores the pH level and maintains the brightness and color saturation of dyed hair for a much longer time. It also smoothes out the scales of damaged hair and enhances shine of the hair.'),
(4, 'Matrix Total Results InstaCure conditioner (1000ml)', 23.6, 19, 4, 'matrix-total-results-instacure-conditioner-1000ml.jpg', 2, 3, 'Matrix InstaCure anti-breakage conditioner is enriched with liquid protein and helps restore strength and reduce breakage in dry and damaged hair. A restorative system consisting of shampoo, conditioner, anti-fragility and anti-porosity spray fills porosity, creating an even and smooth surface of the hair. The aroma of the series reveals notes of fresh ginger, green tea, lemongrass, freesia, May rose, and cedar.'),
(6, 'Matrix Total Results Food For Soft conditioner (1000ml)', 23.6, 8, 5, 'matrix-total-results-food-for-soft-conditioner-1000ml.jpg', 2, 3, 'Matrix Food For Soft moisturizing conditioner with avocado oil and hyaluronic acid makes combing a lot easier. It nourishes, moisturizes and makes hair softer. The Food For Soft moisturizing system makes hair 7 times softer! Suitable for all types of dry hair, as well as for daily use. The aroma reveals sweet notes of toffee, jasmine, freesia and vanilla.'),
(7, 'Matrix Total Results InstaCure shampoo (1000ml)\r\n ', 23.6, 5, 4, 'matrix-total-results-instacure-shampoo-1000ml.jpg', 1, 3, 'Matrix InstaCure anti-breakage shampoo, enriched with liquid protein, helps restore strength and reduce breakage in dry and damaged hair. A restorative system consisting of shampoo, conditioner, anti-fragility and anti-porosity spray fills porosity, creating an even and smooth surface of the hair. The aroma of the series reveals notes of fresh ginger, green tea, lemongrass, freesia, May rose, and cedar.'),
(8, 'L\'Oreal Professionnel Serie Expert Curl Expression Cleansing shampoo (500ml)', 32.1, 46, 5, 'l-oreal-professionnel-serie-expert-curl-expression-cleansing-shampoo-500ml.jpg', 1, 1, 'L\'Oreal Professionnel Curl Expression professional cleansing shampoo gently removes impurities and provides hydration without itching or damaging hair. The formula is enriched with glycerin, Urea H and hibiscus seed extract. Removes 2x more impurities than classic shampoo*. Light soft texture. Easy penetration of the product to the scalp, even in the case of very curly hair. Foams quickly and rinses off easily. No sulfates, no silicones, no parabens.'),
(9, 'L\'Oreal Professionnel Serie Expert Chroma Crème Purple shampoo (500ml)', 32.1, 5, 4, 'l-oreal-professionnel-serie-expert-chroma-creme-purple-shampoo-500ml.jpg', 1, 1, 'When coloring or balayaging blonde hair, the color may gradually fade, showing unwanted warm yellow undertones. To maintain a beautiful, uniform and cool shade, a neutralizing shampoo is needed, depending on the coloring tone. L\'Oreal Professionnel Chroma Crème shampoo with purple pigments is perfect for neutralizing yellow undertones in blonde shades. The creamy formula of the shampoo combines the neutralizing effect of the shampoo and the caring properties of the conditioner, it evens out the color without overdrying the hair and provides a pleasant sensual experience when applied.'),
(10, 'L\'Oreal Professionnel Serie Expert Scalp Advanced Anti-Oiliness shampoo (500ml)', 32.1, 15, 5, 'l-oreal-professionnel-serie-expert-scalp-advanced-anti-oiliness-shampoo-500ml.jpg', 1, 1, 'L\'Oreal Professionnel Scalp Advanced Anti-Oiliness shampoo for oily hair. Formula contains 3% AHA. The light gel texture of the product cleanses the scalp of the remnants of dirt and sebum, leaving a feeling of lightness and cleanliness. Shampoo restores radiance and regulates sebum production. Right after the first application: 78% less oil on scalp and 93% more nourishment for the hair*. Free of dye, silicones and alcohol.'),
(11, 'L\'Oreal Professionnel Serie Expert Curl Expression Density serum-spray, 90ml', 49.3, 5, 4, 'l-oreal-professionnel-serie-expert-curl-expression-density-serum-spray.jpg', 5, 1, 'L\'Oreal Professionnel Curl Expression density stimulator is specially formulated for curly, wavy and coily textures. It is enriched with Stemoxydine 5% and Hibiscus Seed Extract that stimulates the roots of the hair to reveal a thicker and fuller appearance in just 3 months.'),
(12, 'L\'Oreal Professionnel Serie Expert Volumetry spray, 125ml', 24.1, 7, 5, 'l-oreal-professionnel-serie-expert-volumetry-spray.jpg', 5, 1, 'L\'Oreal Volumetry leave-In spray for fine hair helps create extra volume by lifting hair at the very roots. The spray is included in the top products for hair volume, as the effect is visible even on very thin hair and is prone to oil build-up. The formula contains salicylic acid, which has antiseptic and anti-inflammatory properties and provides effective fixation of the strands. The result: a visible volume that extends from the very roots and lasts all day.'),
(13, 'Joanna Professional Ceramides conditioner (1000ml)', 8.45, 7, 4, 'joanna-professional-ceramides-conditioner-1000ml.jpg', 2, 4, 'Joanna Ceramides Conditioner – contains carefully selected ingredients that nourish the hair after chemical treatments. It thoroughly cleanses all types of hair, with a lovely, fresh scent that will give your female clients a unique sense of pleasure and relaxation during hair care.'),
(14, 'Joanna Professional Volume\'Up Complex spray, 300ml', 8.85, 3, 5, 'joanna-professional-volume-up-complex-spray.jpg', 5, 4, 'Joanna Volume’Up Spray – recommended especially for hair care of thin, flat and delicate hair. Thanks to the Volume\'Up complex, these cosmetics visibly boost the volume of your hairstyle, elevating it from the roots and marine collagen moisturizes and strengthens it without weighing it down. Your hairstyle gets a full shape and healthy look and your hair is full of vigor.'),
(15, 'Joanna Professional Silk shampoo (1000ml)', 7.54, 11, 4, 'joanna-professional-silk-shampoo-1000ml.jpg', 1, 4, 'Joanna Silk Shampoo – advanced formulas of the product from this line contain hydrolyzed silk proteins, which provide your hair with the proper level of moisturization. They ensure extensive hair care, smoothness, softness and easy combing. They effectively improve the condition of your hair and provide gloss and a healthy, well-kept look.'),
(16, 'Joanna Professional AcidPRO Complex shampoo (1000ml)', 7.54, 29, 5, 'joanna-professional-acidpro-complex-shampoo-1000ml.jpg', 1, 4, 'Every day, external factors negatively affect the condition of the hair: they deform the structure of the hair, cause brittleness and thinning; hair becomes weak and lifeless, split hair ends start to appear. All these problems can be solved with Joanna AcidPRO shampoo.'),
(17, 'Lisap Milano TCR Elixir Care oil (150ml)', 22.55, 3, 5, 'lisap-milano-tcr-elixir-care-oil-150ml.jpg', 4, 2, 'Lisap TCR Elixir Care moisturizing oil will be suitable for all hair types bur especially for chemically treated and damaged hair. This oil helps maintain the necessary moisture levels of the hair, allowing for it to remain smooth and soft for a much longer time. Doesn’t make the hair heavy or greasy. Makes hair drying and styling easier and at the same time makes hair stronger.'),
(18, 'Lisap Milano Fashion Silky Feel, 50ml', 17.88, 11, 4, 'lisap-milano-fashion-silky-feel.jpg', 4, 2, 'Lisap Fashion Silky Feel is a protective treatment for the hair. It protects the outer layer of the hair and leaves the hair feeling silky soft again. There is no question of split ends, after applying the Fashion Silky Feel. Finally, the Fashion Silky Feel makes the hair fluff free.'),
(19, 'Lisap Milano Keep Control spray, 250ml', 12.87, 13, 4, 'lisap-milano-keep-control-spray.jpg', 5, 2, 'Lisap Keep Control leave-in spray is used to smooth the porosity of the hair. It has excellent nourishing and protective properties. Fills in damaged areas and pores on the surface of the hair. Makes the hair structure denser and uniform, preparing them for the perming procedure. KC Porosity Equalizer spray contains heat-protective silicones, baobab seed oil, black cumin seed oil, desert rose extract, AC Vegan Keratin complex, shea butter, jojoba oil, linoleic acid, wheat bran extract and UV filter as main care ingredients.'),
(20, 'Lisap Milano Light Scale Anti-Yellow spray, 125 ml', 12.87, 14, 5, 'lisap-milano-light-scale-anti-yellow-spray.jpg', 5, 2, 'Light-colored and gray hair requires special carefully selected care. To protect their color from unwanted yellow tones, Lisap\'s Light Scale thermal protection spray with purple pigments will help with this problem. In addition to acting as a thermal protector, this product also enhances the glossy shine of the hair thanks to the presence of hydrolyzed pearls and real diamond dust in the formula, and neutralizes unwanted yellow tones.'),
(21, 'Wella Professionals Invigo Volume Boost uplifting care spray, 150ml', 17.28, 17, 4, 'wella-professionals-invigo-volume-boost-uplifting-care-spray.jpg', 5, 5, 'Wella Invigo Volume Boost uplifting care spray gives lightweight fullness, care, shine and gentle control to the hair. Your hair will get a newfound volume and shine, looking the best it ever has.'),
(22, 'Wella Professionals Oil Reflections light oil (100ml)', 22.28, 16, 5, 'wella-professionals-oil-reflections-light-oil-100ml.jpg', 4, 5, 'The main indicator of healthy hair is a healthy shine. What better way to achieve this shine than with Wella Oil Reflections light oil?  We can’t all be perfect and our hair can’t be all perfect too. It’s dry, it’s fragile and it’s dehydrated. Don’t blame us, we just have more important things to do. Now that you’ve remembered about your hair though, it’s time to make it healthy again and you can start it by using this magnificent oil!'),
(23, 'Wella Professionals Invigo Volume Boost crystal mask (500ml)', 38.24, 9, 5, 'wella-professionals-invigo-volume-boost-crystal-mask-500ml.jpg', 3, 5, 'Wella Invigo Volume Boost mask is a translucent treatment that transforms thin hair in almost an instant, making it denser, bulkier and more elastic. Makes hair styling and combing a lot easier.'),
(24, 'L\'Oreal Professionnel Serie Expert Vitamino Color mask (500ml)', 36.65, 10, 5, 'l-oreal-professionnel-serie-expert-vitamino-color-mask-500ml.jpg', 3, 1, 'L\'Oreal Vitamino Color mask is an absolute bestseller in colored hair home care. In just a couple of minutes, it nourishes the hair, makes it stronger and softer, and enhances its shine. The formula contains resveratrol – a natural antioxidant from grape berries that protects pigments from leaching out. The result is a long-lasting color up to 8 weeks after dyeing the hair.'),
(25, 'Goldwell Dualsenses Just Smooth serum, 100ml', 21.45, 7, 5, 'goldwell-dualsenses-just-smooth-serum.jpg', 7, 12, 'Goldwell Just Smooth 6 effects serum for unruly hair contains microPROtec complex and kukui nut oil. Instantly performs 6 smoothing actions: controls frizz, protects against moisture, soothes, manages, provides smoothness and natural shine.'),
(26, 'Goldwell Dualsenses Color Brilliance serum spray, 150ml', 16.9, 5, 4, 'goldwell-dualsenses-color-brilliance-serum-spray.jpg', 7, 12, 'Everyone needs an everyday refreshment, even normal and fine hair. Goldwell Color series serum-spray can take care of your hair like nothing else can. With its unique series formula of microPROtec and Luminescine technologies, the results are always consistent and you can expect a perfect look each and every time. Not only will this serum give your and intense shine but it also will protect it from heat, thanks to the thermal protection. And we all know that heat is the worst for the hair.'),
(27, 'Insight Styling liquid crystals, 100ml', 22.3, 7, 5, 'insight-styling-liquid-crystals.jpg', 7, 15, 'Quick solutions to make your hair more manageable come in a lot of forms and shapes. Why not try Insight Styling liquid crystals then? It will help with untangling hair, making it easier to comb and style, but at the same time will make it shinier and take care of the split ends. Brings brightness and hydration to all types of hair, thanks to its nourishing properties. Protects the hair, making it less sensitive to external aggressions and to humidity. It’s just the perfect quick remedy for beautiful hair in just a few minutes.'),
(28, 'Helen Seward Synebi Shaping serum, 150ml', 17, 10, 4, 'helen-seward-synebi-shaping-serum.jpg', 7, 13, 'Synebi Shaping – a mini-series designed for frizzy and wavy hair. The products are enriched with elderflower and orange leaf extracts and contain special polymers that enhance the look of the waves and curls.\r\n\r\nHelen Seward Shaping fluid is a styling fluid with organic elderberry extracts and orange leaf. Forms a natural curl, emphasizing its dynamic look and elasticity.'),
(29, 'Helen Seward Synebi Restructuring serum, 150ml', 21.01, 18, 4, 'helen-seward-synebi-restructuring-serum.jpg', 7, 13, 'Synebi Restructuring – a line of products designed to care for damaged hair. It is based on hydrolyzed keratin and mallow extract - two components that will easily help transform tired and weakened hair strands.\r\n\r\nHelen Seward Restructuring serum perfectly compacts damaged hair strands, making them denser and stronger. Its components fill the voids in the structure of the hair, providing integrity and smoothness to the hair. Also, the serum has excellent protective properties, so it can be safely used before styling as a light thermal protective agent.'),
(30, 'Joanna Professional Style Smoothing serum, 125ml', 12.35, 8, 5, 'joanna-professional-style-smoothing-serum.jpg', 7, 4, 'Joanna Style Smoothing Serum – gives softness and healthy, beautiful appearance even to damaged hair. Formula contains vitamin E and proven silicone components that allow you to achieve a stylish hairstyle. Prevents undesirable frizzing and curling under the influence of moisture. After using the product, hair becomes shiny and soft to the touch.'),
(31, 'Joanna Professional Argan oil serum, 125ml', 13.65, 2, 4, 'joanna-professional-argan-oil-serum.jpg', 7, 4, 'Joanna Argan Oil Serum – recommended for hair weakened by hairdressing tratments, which is prone to frizz and requires special care. It substencially smoothen hair fibers, facilitate combing and make your hair look healthy and silky soft.\r\n\r\nARGAN OIL series products are designed for deep action, revitalizing and strengthening dry, damaged hair, that is in need of special care. The line contains one of the most valuable essential oils in the world – argan oil – with unique regenerative properties. The products smooth the hair fiber and facilitate combing, making the hair look healthy, soft and smooth.'),
(32, 'KEEN STROK Repair serum, 100ml', 29.99, 7, 5, 'keen-strok-repair-serum.jpg', 7, 16, 'KEEN STROK Repair leave-in serum for instant repair of hair ends. Formulated with collagen, macadamia oil, keratin, and hyaluronic acid that provide a powerful restorative effect and instantly repairs hair fiber and restores its elasticity. The serum nourishes the hair from the inside and seals the cuticle. Makes hair shiny and healthy, provides anti-frizz effect and thermal protection.'),
(33, 'L\'Oreal Professionnel Serie Expert Liss Unlimited serum, 125ml', 24.1, 12, 5, 'l-oreal-professionnel-serie-expert-liss-unlimited-serum.jpg', 7, 1, 'L\'Oreal Liss Unlimited serum is meant for those who want to discipline unruly hair and give it lovely smoothness. The serum protects against humidity for up to 24 hours and provides thermal protection. The formula contains Pro-Keratin complex which improves the structure of the hair, providing the necessary nourishment and hydration, so hair looks denser and split ends smoother. Also contains Evening Primrose oil which enhances the shine, provides discipline, and tames frizzy hair. The serum has a pleasant floral scent.'),
(34, 'Lakme TEKNIA Full Defense serum, 100ml', 17.94, 20, 5, 'lakme-teknia-full-defense-serum.jpg', 7, 14, 'Lakme TEKNIA Full Defense serum repairs and softens hair fiber and increases its defense against atmospheric and domestic pollution and UV rays. All-day protection.Intense shine and silkiness.'),
(35, 'Schwarzkopf Professional Bonacure pH 4.5 Color Freeze serum, 150ml', 22.18, 23, 4, 'schwarzkopf-professional-bonacure-ph-45-color-freeze-serum.jpg', 7, 11, 'Schwarzkopf Professional Bonacure pH 4.5 Shine Savior serum is a leave-in, shine-enhancing serum specialty formulated for color-treated hair types.\r\n\r\nThis new, vegan formula helps to strengthen the hair, by building on its internal and external structures. Following frequent use, this serum improves the overall condition of the hair, improving manageability, reducing frizz, and promoting renewed vibrancy. Its unique pH-balanced formula returns the hair and scalp to its optimum pH value of 4.5, improving the structure of hair both inside and out whilst retaining 90% of the color pigments inside the hair’s matrix, preventing premature fading for long-lasting, vibrant color for up to 30 uses. Can be applied prior to heat styling to provide thermal protection.'),
(36, 'Schwarzkopf Professional Bonacure Scalp Genesis Root Activating serum (100ml)', 28.73, 11, 5, 'schwarzkopf-professional-bonacure-scalp-genesis-root-activating-serum-100ml.jpg', 7, 11, 'Thinning hair. We can talk and talk about it but does talking really help? Time to take some action and fight with the constant hair on your pillow, floor and food. Try out BC Root Activating serum. It’s something that can fight hair loss, as long as it’s non-pathological. This serum helps properly stimulate the scalp and hair follicles, making hair much stronger and less prone to falling out. With constant use, you’ll notice a significant difference in appearance and feel of your hair in just 6 weeks.'),
(37, 'Schwarzkopf Professional Bonacure Fibre Force infusion serum (10ml)', 2.63, 60, 5, 'schwarzkopf-professional-bonacure-fibre-force-infusion-serum-10ml.jpg', 7, 11, 'When used in combination, BC Fibre Force Bond Connector Infusion and BC Fibre Force Bonding Cream deliver a highly efficient concentration of Bond Connector Technology. This intensive reconstructing formula recreates missing bonds in the inner hair matrix to recover the hair integrity long-lastingly.'),
(38, 'Wella Professionals Elements Calming serum, 100ml', 39.33, 3, 5, 'wella-professionals-elements-calming-serum.jpg', 7, 5, 'Wella Elements Calming moisturizing serum with Vegetable Glycerin, hydrates and soothes a dry or delicate scalp. It helps restore scalp comfort, without impacting hair volume.'),
(39, 'L\'Oreal Professionnel Serie Expert Pro Longer concentrate (400ml)', 43.89, 7, 5, 'l-oreal-professionnel-serie-expert-pro-longer-concentrate-400ml.jpg', 8, 1, 'L\'Oreal Pro Longer filler concentrate is a unique remedy for long hair. The high concentration of the special component Filler A-100 instantly fills up the ends of the hair, protecting them from breakage and splitting. The effect is noticeable instantly: hair is incredibly smooth, more manageable, and plumper, like after going to the salon.'),
(40, 'L\'Oreal Professionnel Serie Expert Blondifier concentrate, 400ml', 43.89, 10, 5, 'l-oreal-professionnel-serie-expert-blondifier-concentrate.jpg', 8, 1, 'L\'Oreal Blondifier concentrate is formulated for express restoration of bleached hair with increased sensitivity. Result: the hair is more resistant to damage and breakage, the hair looks shinier, smoother, and stronger. Acai berry polyphenols in the formula moisturize and restore the hair.'),
(41, 'Lakme K.Therapy Active Shock concentrate (6ml)', 6.13, 12, 5, 'lakme-ktherapy-active-shock-concentrate-6ml.jpg', 8, 14, 'An active concentrate which acts intensively to prevent hair loss. Stops hair loss and increases density of hair. Stimulates cell dynamism to delay hair loss. Olive leaf extract: regulates and normalises the scalp\'s sebaceous secretions. Bioactive peptides: regulates the correct development of the hair cycle, vitalises scalp and hair cells and hair.'),
(42, 'Lakme TEKNIA Argan Oil shampoo (1000ml)', 41.9, 6, 4, 'lakme-teknia-argan-oil-shampoo-1000ml.jpg', 1, 14, 'Lakme TEKNIA Argan Oil is a sulfate-free, hydrating shampoo for normal and dry hair. The shampoo provides optimal hydration to the hair and prevents dehydration. Suitable for colored hair protects the color from overly washing out. This product gently cleanses the hair and makes it easier to comb and untangle.'),
(43, 'Lakme TEKNIA White Silver mask (250ml)', 29.29, 21, 5, 'lakme-teknia-white-silver-mask-250ml.jpg', 3, 14, 'Lakme TEKNIA White Silver mask repairs and protects all types of blonde hair. Blonde and white hair recovers its natural shine and luminosity.'),
(44, 'Lakme TEKNIA Color Stay conditioner (1000ml)', 44.55, 3, 4, 'lakme-teknia-color-stay-conditioner-1000ml.jpg', 2, 14, 'Lakme TEKNIA Color Stay conditioner conditions and moisturizes the hair fiber. Its acidic pH closes hair cuticles. Prolongs the qualities of the color and delays the loss of pigments.50% more color protection.'),
(45, 'Goldwell Dualsenses Silver conditioner, 200ml', 15.6, 5, 3, 'goldwell-dualsenses-silver-conditioner.jpg', 2, 12, 'Goldwell Silver conditioner effectively eliminates yellow undertones and adds a cool tone to gray and blonde hair. At the same time, the hair will be perfectly nourished and detangled. The result: irresistibly shiny hair that feels incredibly light. For especially healthy and shiny blonde hair!'),
(46, 'Goldwell Dualsenses Bond Pro spray, 150ml', 16.9, 4, 4, 'goldwell-dualsenses-bond-pro-spray.jpg', 5, 12, 'Nourish and condition damaged hair with Goldwell Bond Pro restorative and structuring spray. This spray contains a microPROtec complex that strengthens the hair from the inside out by forming new ionic and hydrogen bonds. These innovative hair care technologies allow you to care for your hair while maintaining its natural structure. Suitable for thin, brittle hair, the formula is designed to protect the hair cuticle while strengthening it against environmental stressors. The leave-in spray makes hair styling easier and also provides thermal protection.');

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
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_product`
--
ALTER TABLE `cart_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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

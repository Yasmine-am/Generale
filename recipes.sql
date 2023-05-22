-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 08 mei 2023 om 14:41
-- Serverversie: 10.4.28-MariaDB
-- PHP-versie: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `griller`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `recipes`
--

CREATE TABLE `recipes` (
  `RecipeID` bigint(20) NOT NULL,
  `RecipeTitle` varchar(255) DEFAULT NULL,
  `UserId` bigint(20) DEFAULT NULL,
  `PrepTime` bigint(20) DEFAULT NULL,
  `PrepText` varchar(255) DEFAULT NULL,
  `CookAttireId` bigint(20) DEFAULT NULL,
  `BBQId` bigint(20) DEFAULT NULL,
  `Rating` bigint(20) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `Intro` varchar(255) DEFAULT NULL,
  `Diet` enum('Dessert','vis','vlees') DEFAULT NULL,
  `DateCreate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `recipes`
--

INSERT INTO `recipes` (`RecipeID`, `RecipeTitle`, `UserId`, `PrepTime`, `PrepText`, `CookAttireId`, `BBQId`, `Rating`, `Foto`, `Intro`, `Diet`, `DateCreate`) VALUES
(1, 'Simple BBQ Ribs', 0, 0, '\"Gather all ingredients.Place ribs in a large pot and cover with water. Stir in kosher salt@ garlic powder@ and pepper@ and bring water to a boil over medium heat. Continue to boil until ribs are tender@ 40 to 45 minutes.While the ribs are boiling@ prehea', 1, 1, 5, '\"https://www.allrecipes.com/thmb/bcm81s6NUyIo7ENmN597buv4MVA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/16448-simple-bbq-ribs-DDMFS-4x3-6c6ec5c3ddda485fbc8c855520ae8fc9.jpg\"', '\"This BBQ ribs recipe may be different than others you$ve tried@ but for super tender ribs@ give it a try! Lean@ country-style pork ribs are boiled first@ then baked.\"', 'vlees', '2023-05-08 14:00:28'),
(2, 'Oven BBQ Chicken Drumsticks', 0, 0, '\"Assemble ingredients@ preheat oven to 400 degrees F (200 degrees C)@ and place drumsticks in a 7x11-inch baking dish.Whisk ketchup@ vinegar@ water@ brown sugar@ butter@ salt@ Worcestershire sauce@ mustard@ and chili powder together in a bowl; pour mixtur', 1, 1, 4, '\"https://www.allrecipes.com/thmb/RaIHJubbj5HrmHkyAjINJrA-Lt0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/222932-oven-bbq-chicken-drumsticks-DDMFS-4x3-b168af4d8e2e4d5c833448a9b0edfbe0.jpg\"', '\"Baked BBQ chicken legs are tender and juicy@ with a crispy skin. A homemade BBQ sauce adds sticky goodness to these meaty drumsticks that are oven-baked instead of grilled.\"', 'vlees', '2023-05-08 14:00:28'),
(3, 'Korean BBQ Sauce', 0, 0, '\"Stir soy sauce@ brown sugar@ garlic@ rice wine vinegar@ chile-garlic sauce@ pepper@ ginger@ and sesame oil together in a saucepan; bring to a boil.Whisk cornstarch and water together in a small bowl until the cornstarch dissolves; pour into boiling soy s', 1, 1, 5, '\"https://www.allrecipes.com/thmb/x2jF5FWem9lK3Rp2TBApVReX_v8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/6355848-c322df6b91594f3f9d9e93f0b9fe042d.jpg\"', '\"A homemade Korean BBQ sauce that$s quick and easy to make with brown sugar@ vinegar@ soy sauce@ and ginger. Add chile-garlic sauce for a fiery kick!\"', 'vlees', '2023-05-08 14:00:28'),
(4, 'Oven-Baked BBQ Ribs', 0, 0, '\"Preheat the oven to 350 degrees F (175 degrees C). Split ribs down the center between the bones.Mix onions@ ketchup@ water@ vinegar@ brown sugar@ Worcestershire sauce@ mustard powder@ and salt together in a bowl. Set aside 1/2 of the sauce for basting.He', 1, 1, 5, '\"https://www.allrecipes.com/thmb/5HD3NW54YiZ4VUtxuSZZC4-CMDg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2143920-oven-baked-bbq-ribs-Dan-DangerMan-Resch-1x1-1-8b4fdb531c144b4987a6a1863a2ffb7b.jpg\"', '\"These baked ribs are tender and full of flavor! They$re baked in the oven for three hours and basted continually with a tangy homemade BBQ sauce.\"', 'vlees', '2023-05-08 14:00:28'),
(5, 'BBQ Chicken Calzones', 0, 0, '\"Preheat the oven to 400 degrees F (200 degrees C).Place bacon in a large skillet and cook over medium-high heat@ turning occasionally@ until evenly browned@ about 10 minutes. Drain bacon slices on paper towels; crumble.Add shredded chicken and onion to h', 1, 1, 4, '\"https://www.allrecipes.com/thmb/hraponsPSEHujS53iyPqhtRx6Sg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/421698-bbq-chicken-calzones-txwife-4x3-1-5573c5ba93bc4e319a0c185ed024c7f0.jpg\"', '\"If you like BBQ Chicken Pizza@ you$ll like this easy-to-make bbq chicken calzone!\"', 'vlees', '2023-05-08 14:00:28'),
(6, 'Bourbon Whiskey BBQ Sauce', 0, 0, '\"Combine whiskey@ garlic@ and onion in a large skillet over medium heat; simmer until onion is translucent@ about 10 minutes.Stir in ketchup@ brown sugar@ vinegar@ tomato paste@ Worcestershire sauce@ liquid smoke@ salt@ black pepper@ and hot pepper sauce;', 1, 1, 5, '\"https://www.allrecipes.com/thmb/lyvP2czJauLrKSXWh_toi-MHmkQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/1980404-bourbon-whiskey-bbq-sauce-catherinedrew-1x1-1-9334a43e41454577804e02b9a4f25c66.jpg\"', '\"This terrific bourbon BBQ sauce has generous amounts of bourbon whiskey@ brown sugar@ ketchup@ and garlic. The ribs won$t know what hit them!\"', 'vlees', '2023-05-08 14:00:28'),
(7, 'Kalbi (Korean BBQ Short Ribs)', 0, 0, '\"Stir together soy sauce@ brown sugar@ water@ green onions@ garlic@ and sesame oil in a bowl until sugar has dissolved.Place ribs in a large resealable plastic bag. Pour marinade over ribs. Seal the bag and refrigerate for 3 hours to overnight.Preheat an ', 1, 1, 5, '\"https://www.allrecipes.com/thmb/T7QAOoH79zR90S3G8xn28qIs8aM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/716493-dda5939236484c4e9ed123d2b4bbdc37.jpg\"', '\"Kalbi is a traditional Korean BBQ beef short rib dish marinated in a sweet soy mixture with garlic and green onion@ grilled to caramelized perfection.\"', 'vlees', '2023-05-08 14:00:28'),
(8, 'Easy Slow Cooker BBQ', 0, 0, '\"Place pork shoulder in the slow cooker. Pour vinegar over pork@ coating all sides; season with salt and pepper.Cook on Low for 10 to 12 hours.Transfer pork to a platter. Drain and discard juices from the slow cooker. Chop pork and return to the slow cook', 1, 1, 5, '\"https://www.allrecipes.com/thmb/K1putPdcOXd9B9v456MOLQLDOYM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2057200-a9e23a186ef744eb9d5c789d1ace4646.jpg\"', '\"Your favorite barbeque sauce tops tender slow cooked pork in this Boston butt BBQ crockpot recipe@ perfect for sandwiches.\"', 'vlees', '2023-05-08 14:00:28'),
(9, 'Krystal$s Perfect Marinade for BBQ or Grilled Chicken', 0, 0, '\"Whisk brown sugar@ vinegar@ soy sauce@ olive oil@ Worcestershire sauce@ sesame oil@ garlic@ and pepper together in a large bowl until sugar has dissolved.\"', 1, 1, 5, '\"https://www.allrecipes.com/thmb/vuXH192VLAtCgFmBFhc-n9fJn9U=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/1017353-51230e2fef23407ba779ea35b85fe278.jpg\"', '\"This BBQ chicken marinade made with balsamic@ brown sugar@ Worcestershire sauce@ sesame oil@ and garlic adds a wonderful flavor to any cut of chicken.\"', 'vlees', '2023-05-08 14:00:28'),
(10, 'BBQ Spice Rub', 0, 0, '\"Mix brown sugar@ paprika@ chili powder@ garlic powder@ onion powder@ salt@ black pepper@ and cayenne in a bowl. Store in an airtight container or keep in the freezer in a resealable plastic bag.\"', 1, 1, 5, '\"https://www.allrecipes.com/thmb/F2Jpryp4dOPtFS1W9vOnMxOPero=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/3851555-bbq-spice-rub-SunnyDaysNora-1x1-1-96bb11c7582c4b67bb974c5e297172cb.jpg\"', '\"This go-to bbq rub is ideal for all your grilling@ smoking@ and broiling needs. Whip it up in less than 5 minutes with pantry and spice-shelf staples.\"', 'vlees', '2023-05-08 14:00:28'),
(11, 'Absolutely Awesome BBQ Sauce', 0, 0, '\"In a saucepan over low heat@ mix the brown sugar@ chile sauce@ rum@ soy sauce@ ketchup@ Worcestershire sauce@ garlic@ dry mustard@ and pepper. Simmer 30 minutes@ stirring occasionally. Cool@ and refrigerate until ready to use.\"', 1, 1, 5, '\"https://www.allrecipes.com/thmb/edHQZxu3S0bJ_VNmpw650zgjYEQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8260609-a15115abfa5547f686e64d2c89c984ad.jpg\"', '\"I have tried many@ many BBQ sauces@ but I always come back to this one! Using chile sauce in addition to a little ketchup give this sauce extra flavors to tantalize everyone$s taste buds!\"', 'vlees', '2023-05-08 14:00:28'),
(12, 'Best Carolina BBQ Meat Sauce', 0, 0, '\"Stir together mustard@ vinegar@ beer@ and brown sugar in a heavy non-reactive saucepan. Season with chili powder and black@ white@ and cayenne peppers. Bring to a simmer over medium-low heat and cook for about 20 minutes. Do not boil@ or you will scorch ', 1, 1, 5, '\"https://www.allrecipes.com/thmb/YPjHrNh0hOSnSYVjpmH1KC0gXl0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/234442-2e14efc88cf749779a58b7a1a4259358.jpg\"', '\"I can$t take all the credit for this Carolina-style BBQ sauce recipe. I had to search@ snoop@ and experiment to get it right. (Thanks Big Daddy$s!) I$ve had barbeque in some of the best little places in the Carolinas@ and this stuff rules there! It$s fan', 'vlees', '2023-05-08 14:00:28'),
(13, 'Scott$s Savory BBQ Sauce', 0, 0, '\"In a large container@ mix together the apple cider vinegar@ ketchup@ paprika@ brown sugar@ salt@ pepper@ red pepper flakes@ garlic powder@ Worcestershire sauce and lemon juice. Pour into an empty vinegar bottle@ ketchup bottle or other container and stor', 1, 1, 4, '\"https://www.allrecipes.com/thmb/uGuyhyhUFLcP2jqe6AnpJ9sY7iw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/4536731-c3a57a2993024c4f842a054c26693964.jpg\"', '\"This is a very simple Carolina style vinegar based BBQ sauce. A friend of the family gave us this recipe several years ago and after a few tweaks and additions@ this is the best BBQ sauce that I$ve ever had. You combine all of the ingredients and then en', 'vlees', '2023-05-08 14:00:28'),
(14, 'Vinegar-Based BBQ Sauce', 0, 0, '\"Stir together vinegar@ brown sugar@ kosher salt@ red pepper flakes@ and cayenne pepper in a small bowl until combined. Allow to sit at room temperature until flavors meld@ 4 to 8 hours.\"', 1, 1, 5, '\"https://www.allrecipes.com/thmb/4k9vSFqT30LIb83S_rGLP1gqwtA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/4203028-6f9349d2d3234dfe8d60cdda150e0e20.jpg\"', '\"This vinegar-based BBQ sauce made with brown sugar and hot pepper can be used to baste meat while grilling or add moisture and flavor to cooked meat.\"', 'vlees', '2023-05-08 14:00:28'),
(15, 'Italian BBQ Pork Chops', 0, 0, '\"Stir together vinegar@ ketchup@ brown sugar@ Worcestershire sauce@ Dijon mustard@ garlic@ 1/2 teaspoon salt@ and 1/2 teaspoon black pepper in a saucepan over medium-low heat; simmer sauce for 20 minutes. Remove from heat and allow to sit for 5 minutes.Pr', 1, 1, 5, '\"https://www.allrecipes.com/thmb/hhe9RrOWfb22yEFlyiIo_gvp2o4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/659267-italian-bbq-pork-chops-Rebekah-Rose-HIlls-4x3-1-3b7909b4e4de473faabeb0d8247a009b.jpg\"', '\"Pork chops with a quick homemade BBQ sauce made with balsamic vinegar@ ketchup@ and brown sugar have just the right amount of sweetness to become addictive.\"', 'vlees', '2023-05-08 14:00:28'),
(16, 'BBQ Chicken Pizza', 0, 0, '\"Preheat the oven to 350 degrees F (175 degrees C).Place pizza crust on a baking sheet. Spread barbeque sauce on crust. Top with chicken@ pepperoncini peppers@ onion@ and cilantro. Cover with Colby-Jack cheese.Bake in the preheated oven until cheese is me', 1, 1, 5, '\"https://www.allrecipes.com/thmb/7VF4PrIhJGse9B-Qoa0SgqOq2U0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/58411-8a92c002662b483984bb8a690ea51763.jpg\"', '\"This BBQ chicken pizza is loaded with diced chicken@ spicy barbecue sauce@ pepperoncini peppers@ onion@ and cilantro@ topped with Colby-Jack cheese.\"', 'vlees', '2023-05-08 14:00:28'),
(17, 'Honey Garlic BBQ Sauce', 0, 0, '\"Mix together ketchup@ garlic@ 1 cup water@ hot sauce@ honey@ molasses@ brown sugar@ Worcestershire sauce@ soy sauce@ salt@ Cajun seasoning@ paprika@ red pepper@ white pepper@ and black pepper in a large saucepan over medium-low heat. Allow mixture to sim', 1, 1, 5, '\"https://www.allrecipes.com/thmb/utOq3aiSjD2exhPZP8t-VTaSapk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/996504-fd110fdb4b6a45338688a7b2e91664b6.jpg\"', '\"This is my favorite homemade garlic BBQ sauce. It uses a whole bulb of garlic and lots of honey.\"', 'vlees', '2023-05-08 14:00:28'),
(18, 'Eastern North Carolina BBQ Sauce', 0, 0, '\"Combine white vinegar@ cider vinegar@ brown sugar@ cayenne pepper@ hot pepper sauce@ salt@ and pepper in a jar or bottle with a tight-fitting lid; shake well.Refrigerate sauce@ shaking occasionally@ until flavors blend@ 1 to 2 days. Store in the refriger', 1, 1, 5, '\"https://www.allrecipes.com/thmb/eqQu0WajFyFJzQvLTzgvMAxlXVU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Eastern-North-Carolina-BBQ-Sauce-2000-4b143643c69641b4a3e6989eeae9d474.jpg\"', '\"This Carolina vinegar BBQ sauce requires no cooking and is simple to make with cider vinegar@ white vinegar@ brown sugar@ cayenne@ and hot sauce.\"', 'vlees', '2023-05-08 14:00:28'),
(19, 'Southern Yank Pulled Pork BBQ', 0, 0, '\"Mix together onion@ barbecue sauce@ celery@ water@ ketchup@ honey@ brown sugar@ Worcestershire sauce@ garlic@ hot pepper sauce@ chili powder@ salt@ and pepper in a slow cooker until thoroughly combined. Place pork roast in the center of the cooker and sp', 1, 1, 5, '\"https://www.allrecipes.com/thmb/3tp5JY7XekxTVbr_tWD3OE8aA6s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/1116073-7bccac19a0e24874ba1434cfdef2e291.jpg\"', '\"Try this easy pork BBQ recipe for boneless pork steeped in a slow cooker with sauces and seasonings. It$s sweet and savory with just a hint of heat.\"', 'vlees', '2023-05-08 14:00:28');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`RecipeID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `recipes`
--
ALTER TABLE `recipes`
  MODIFY `RecipeID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

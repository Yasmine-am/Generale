-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 10 mei 2023 om 13:27
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
-- Tabelstructuur voor tabel `ingredients`
--

CREATE TABLE `ingredients` (
  `IngredientID` bigint(20) NOT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `ingredients`
--

INSERT INTO `ingredients` (`IngredientID`, `Name`) VALUES
(1, 'wine'),
(2, 'onions'),
(3, 'carrots'),
(4, 'brandy'),
(5, 'garlic'),
(6, 'peppercorns'),
(7, 'salt'),
(8, 'parsley'),
(9, 'leaf'),
(10, 'roast'),
(11, 'oil'),
(12, 'bacon'),
(13, 'flour'),
(14, 'paste'),
(15, 'broth'),
(16, 'taste'),
(17, 'butter'),
(18, 'mushrooms'),
(19, 'sauce'),
(20, 'smoke'),
(21, 'sugar'),
(22, 'pepper'),
(23, 'tenderizer'),
(24, 'powder'),
(25, 'paprika'),
(26, 'steak'),
(27, 'onion'),
(28, 'potatoes'),
(29, 'carrot'),
(30, 'beef'),
(31, 'leaves'),
(32, 'packet'),
(33, 'cabbage'),
(34, 'water'),
(35, 'beer'),
(36, 'chuck'),
(37, 'Guinness®)'),
(38, 'celery'),
(39, 'thyme'),
(40, 'stock'),
(41, 'meat'),
(42, 'soup'),
(43, 'chives'),
(44, 'bouillon'),
(45, 'cornstarch'),
(46, 'cream'),
(47, 'cheese'),
(48, 'seeds'),
(49, 'milk'),
(50, 'bread'),
(51, 'brisket'),
(52, 'Bouquet®)'),
(53, 'round'),
(54, 'mustard'),
(55, 'spears'),
(56, 'sirloin'),
(57, 'florets'),
(58, 'vinegar'),
(59, 'juice'),
(60, 'cumin'),
(61, 'oregano'),
(62, 'cloves'),
(63, 'noodles'),
(64, 'drippings'),
(65, 'basil'),
(66, 'flakes'),
(67, 'tenderloin'),
(68, 'pate'),
(69, 'pastry'),
(70, 'yolk'),
(71, 'shank'),
(72, 'rosemary'),
(73, 'barley'),
(74, 'horseradish'),
(75, 'ribs'),
(76, 'drumsticks'),
(77, 'ketchup'),
(78, 'Sriracha®)'),
(79, 'ginger'),
(80, 'spareribs'),
(81, 'shredded'),
(82, 'dough'),
(83, 'cilantro'),
(84, 'whiskey'),
(85, 'flavoring'),
(86, 'clove'),
(87, 'flanken'),
(88, 'rum'),
(89, 'spray'),
(90, 'chops'),
(91, 'crust'),
(92, 'halves'),
(93, 'peppers'),
(94, 'honey'),
(95, 'molasses'),
(96, 'seasoning'),
(97, 'Tabasco™)'),
(98, 'Tabasco®)');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `recipes`
--

CREATE TABLE `recipes` (
  `RecipeID` bigint(20) NOT NULL,
  `RecipeTitle` varchar(255) DEFAULT NULL,
  `UserId` bigint(20) DEFAULT NULL,
  `PrepTime` varchar(255) DEFAULT NULL,
  `PrepText` varchar(255) DEFAULT NULL,
  `CookAttireId` bigint(20) DEFAULT NULL,
  `BBQId` bigint(20) DEFAULT NULL,
  `Rating` double DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `Intro` varchar(255) DEFAULT NULL,
  `Diet` enum('Dessert','vis','vlees') DEFAULT NULL,
  `DateCreate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `recipes`
--

INSERT INTO `recipes` (`RecipeID`, `RecipeTitle`, `UserId`, `PrepTime`, `PrepText`, `CookAttireId`, `BBQId`, `Rating`, `Foto`, `Intro`, `Diet`, `DateCreate`) VALUES
(1, 'Beef Bourguignon', 0, 'PT3090M', '\"For the marinade: Mix wine@ sliced onions@ carrots@ brandy@ garlic@ peppercorns@ salt@ parsley@ and bay leaf in a large glass or ceramic bowl. Add beef and toss to evenly coat; cover the bowl with plastic wrap and marinate in the refrigerator for 2 days.', 1, 1, 4.6, '\"https://www.allrecipes.com/thmb/983oIiEwpSyR8zESxC-DobjdY0A=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/1188118-60bd7f2343b04865ae29b56e2b806305.jpg\"', '\"This beef bourguignon features Burgundy red wine@ brandy@ bacon@ and mushrooms for a rich@ hearty beef stew that$s elegant enough for a dinner party!\"', 'vlees', '2023-05-10 13:24:01'),
(2, 'Doc$s Best Beef Jerky', 0, 'PT740M', '\"Gather all ingredients.Prepare the marinade: Combine soy sauce@ Worcestershire sauce@ liquid smoke@ brown sugar@ salt@ pepper@ meat tenderizer@ garlic powder@ onion powder@ and paprika in a glass bowl.Place beef strips in a 9x13-inch glass baking dish. P', 1, 1, 4.7, '\"https://www.allrecipes.com/thmb/1G4zcBjIINU4cTpXogVDBsV-FA4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/142948-docs-best-beef-jerky-DDMFS-4x3-1e55e285782844cd82756628d579a6dd.jpg\"', '\"An easy@ homemade beef jerky marinade@ made with soy sauce@ liquid smoke@ brown sugar@ and spices@ makes the most flavorful beef jerky ever — maybe even the best you$d ever had!\"', 'vlees', '2023-05-10 13:24:02'),
(3, 'Deluxe Corned Beef Hash', 0, 'PT50M', '\"Melt butter with olive oil in a large skillet over medium heat. Cook and stir onion until lightly browned@ about 8 minutes. Stir in potatoes and carrot; cook@ stirring occasionally@ until tender@ about 15 minutes.Stir in corned beef@ parsley@ pepper@ thy', 1, 1, 4.7, '\"https://www.allrecipes.com/thmb/k_jUuYiUFeENf0f3vMBzihWb-1Q=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/808820-e4ac0dcef1e2473db3df5b8730e14267.jpg\"', '\"This corned beef hash combines cooked corned beef with crispy potatoes and onions for a delicious way to use up leftover St. Paddy$s Day corned beef.\"', 'vlees', '2023-05-10 13:24:02'),
(4, 'Corned Beef and Cabbage', 0, 'PT150M', '\"Gather all ingredients.Place corned beef in a Dutch oven and cover with water. Add spice packet@ cover@ and bring to a boil. Reduce heat and simmer until corned beef is just about fork-tender@ about 2 hours.While the corned beef is simmering@ cut potatoe', 1, 1, 4.7, '\"https://www.allrecipes.com/thmb/xPSGbNV0amXHKsAG6sU4zgE8mf4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/16310-corned-beef-and-cabbage-i-DDMFS-4x3-19a894131bbf4ecea8a539a2e53f17ab.jpg\"', '\"Corned beef and cabbage simmer with potatoes and carrots for a traditional Irish meal that$s the perfect centerpiece for St. Patrick$s Day.\"', 'vlees', '2023-05-10 13:24:03'),
(5, 'Instant Pot Corned Beef', 0, 'PT120M', '\"Gather all ingredients.Combine water@ beer@ and garlic in a multi-functional pressure cooker (such as Instant Pot).Place trivet inside. Place brisket on the trivet and sprinkle spice packet on top. Close and lock the lid. Select high pressure according t', 1, 1, 4.6, '\"https://www.allrecipes.com/thmb/ehBuJRHNQq_ssdfMJhZAtaXm_pI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/268026-instant-pot-corned-beef-DDMFS-4x3-fde0b6fb178b40789dc7d10b66e24425.jpg\"', '\"Instant Pot corned beef with all the fixings is ready in just 2 hours with an electric pressure cooker. Guaranteed juicy@ tender corned beef every time.\"', 'vlees', '2023-05-10 13:24:04'),
(6, 'Beef and Guinness Stew', 0, 'PT180M', '\"Cook and stir bacon in a heavy skillet over medium-high heat until bacon is browned and crisp@ 3 to 4 minutes. Turn off the heat and transfer bacon into a large stew pot@ reserving bacon fat in the skillet.Season beef chuck cubes generously with 1 teaspo', 1, 1, 4.9, '\"https://www.allrecipes.com/thmb/Wvjb_Zi6IHCEx53Mzsw4KLckhTo=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8200823-d7e9b21c7a1c4c00b3d46be658bd79c6.jpg\"', '\"This Guinness beef stew from Chef John is a very simple Irish dish with a deep@ complex@ rich flavor. Dark beer does amazing things for the gravy.\"', 'vlees', '2023-05-10 13:24:04'),
(7, 'Easy Slow Cooker Beef Stroganoff', 0, 'PT375M', '\"Spread beef stew meat into bottom of slow cooker crock; season with salt and pepper. Layer onion over the beef. Pour mushroom soup and water over the beef; add chives@ garlic@ Worcestershire sauce@ and beef bouillon.Whisk red wine@ cornstarch@ and flour ', 1, 1, 4.7, '\"https://www.allrecipes.com/thmb/5qKQniPfHQixCKbCjV2w6poY1QQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/236867-SuperDuperSlowCookerBeefStroganoff-mfs-4X3-0145-4e491cda89b848ec8090a29d75312f67.jpg\"', '\"This easy beef stroganoff is made in the slow cooker with fresh mushrooms@ red wine@ and sour cream for a deliciously rich and creamy dish with little-to-no fuss!\"', 'vlees', '2023-05-10 13:24:04'),
(8, 'Beef Bulgogi', 0, 'PT75M', '\"Gather all ingredients.Whisk soy sauce@ green onion@ sugar@ garlic@ sesame seeds@ sesame oil@ and pepper together in a bowl.Place flank steak slices in a shallow dish. Pour marinade over top. Cover and refrigerate for at least 1 hour or overnight.Preheat', 1, 1, 4.8, '\"https://www.allrecipes.com/thmb/pM4n3JuDs_hWZ9GeFBpsvBe4eC4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/100606-beef-bulgogi-DDMFS-4x3-b59a31e8b94f4c7091e333847bf0c406.jpg\"', '\"Our best bulgogi recipe uses a sweet soy and sesame marinade. Also known as Korean BBQ beef@ this thinly sliced grilled steak is easy to make at home.\"', 'vlees', '2023-05-10 13:24:05'),
(9, 'Creamed Chipped Beef on Toast', 0, 'PT20M', '\"Melt butter in a medium saucepan over low heat. Add flour and whisk until smooth. Add milk a little at a time@ whisking well after each addition. Bring to a boil over medium-high heat and cook@ stirring@ until thickened.Stir in beef and cayenne; cook unt', 1, 1, 4.5, '\"https://www.allrecipes.com/thmb/93EJo2mhCjz6i40x6rmYD0zDdoE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/creamed-chipped-beef-on-toast-9b16b9f6d10b4a0fa78b42e321c46ab1.jpg\"', '\"Chipped beef is a classic military dish made with dried beef in a thick and creamy white sauce seasoned with cayenne pepper that$s served over toast.\"', 'vlees', '2023-05-10 13:24:06'),
(10, 'Braised Corned Beef Brisket', 0, 'PT390M', '\"Preheat oven to 275 degrees F (135 degrees C).Discard any flavoring packet from corned beef. Brush brisket with browning sauce on both sides.Heat vegetable oil in a large skillet over medium-high heat and brown brisket on both sides in the hot oil@ 5 to ', 1, 1, 4.8, '\"https://www.allrecipes.com/thmb/bvb-Fj10puIQ0fFpFXJVGbHbvGI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/231030-BraisedCornedBeefBrisket-is-4X3-3420-49128ae2ffc4497c9b8920b0715d0ebd.jpg\"', '\"A seared corned beef brisket is braised in the oven with sliced onions and garlic for an incredibly tender and juicy brisket that$s well worth the wait!\"', 'vlees', '2023-05-10 13:24:06'),
(11, 'Best Roast Beef', 0, 'PT80M', '\"Gather all ingredients.Preheat oven to 375 degrees F (190 degrees C).Make sure roast is at room temperature. Tie roast at 3-inch intervals with cotton twine; this helps it from drying out and allows it to cook more evenly. Place roast on a rack in a baki', 1, 1, 4.6, '\"https://www.allrecipes.com/thmb/AM0n7t4dfeebHBSsDgJtqp51GPU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/42176-all-american-roast-beef-DDMFS-4x3-88f7f283e7814478bae7612f947faebb.jpg\"', '\"Learn how to cook a roast beef without drying it out with this easy method! Tender@ juicy@ melt-in-your-mouth roast beef is perfect for holidays or special family dinners.\"', 'vlees', '2023-05-10 13:24:07'),
(12, 'Chef John$s Beef Rouladen', 0, 'PT110M', '\"Place slices of beef on a work surface@ Season both sides with kosher salt and pepper. Spread one side with mustard. Place bacon strips on the mustard and sprinkle with paprika. Arrange onion slices cross-wise on the beef. Then evenly space 3 pickle slic', 1, 1, 4.6, '\"https://www.allrecipes.com/thmb/Qvk4pMdQwDw3Quf8SL49VeNkV7M=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/7709567-chef-johns-beef-rouladen-lutzflcat-1x1-1-e98a030b38ba4a878bdff7a350b27bb3.jpg\"', '\"Chef John uses thin slices of beef round to make beef rouladen@ classic German comfort food. Topped with mustard@ onions@ bacon@ and pickles the beef is rolled up and braised until fork tender.\"', 'vlees', '2023-05-10 13:24:07'),
(13, 'Quick Beef Stir-Fry', 0, 'PT25M', '\"Gather all ingredients.Heat vegetable oil in a large wok or skillet over medium-high heat; cook and stir beef until browned@ 3 to 4 minutes.Move beef to the side of the wok and add broccoli@ bell pepper@ carrots@ green onion@ and garlic to the center of ', 1, 1, 4.4, '\"https://www.allrecipes.com/thmb/7N-Xq1XMMJw8G0KJv2e0ETUYB2I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/228823-quick-beef-stir-fry-DDMFS-4x3-1f79b031d3134f02ac27d79e967dfef5.jpg\"', '\"This beef stir-fry is quick and easy for busy weeknights. Thin slices of beef sirloin are stir-fried with colorful vegetables and soy sauce.\"', 'vlees', '2023-05-10 13:24:08'),
(14, 'Barbacoa-Style Shredded Beef', 0, 'PT535M', '\"Season beef chunks with salt and pepper on all sides.Heat oil in a large skillet over medium-high heat. Working in batches@ cook and stir beef until browned@ 4 to 5 minutes per batch. Transfer browned beef to a slow cooker.Mix broth@ vinegar@ lime juice@', 1, 1, 4.7, '\"https://www.allrecipes.com/thmb/WGIhbIlnys3Okf3DhUuCseL5wKs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/246835-barbacoa-style-shredded-beef-ddmfs-4x3-0966-4d2ace2554044992b4236fdef1e256f4.jpg\"', '\"This barbacoa recipe makes tender@ shredded beef in a spicy barbacoa sauce@ and it$s super easy to make with this slow cooker recipe. Great for tacos!\"', 'vlees', '2023-05-10 13:24:08'),
(15, 'Slow Cooker Beef Stew', 0, 'PT260M', '\"Gather ingredients.Place meat in slow cooker.Mix flour@ salt@ and pepper together in a small bowl. Pour over meat@ and stir until meat is coated.Add beef broth@ carrots@ potatoes@ onion@ celery@ Worcestershire sauce@ paprika@ garlic@ and bay leave; stir ', 1, 1, 4.5, '\"https://www.allrecipes.com/thmb/K8WfLq0Eqi7vSPXyzAXUC_Karfo=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/14685-slow-cooker-beef-stew-i-DDMFS-4x3-6f0208563f4c43d6a80fdb077c19fe4e.jpg\"', '\"This easy slow cooker beef stew recipe made with potatoes@ carrots@ celery@ broth@ herbs@ and spices is hearty and comforting.\"', 'vlees', '2023-05-10 13:24:09'),
(16, 'Grandma$s Ground Beef Casserole', 0, 'PT60M', '\"Heat a large skillet over medium-high heat. Cook and stir ground beef in the hot skillet until browned and crumbly@ 5 to 7 minutes; drain and discard grease.Mix tomato sauce@ sugar@ garlic salt@ and salt into the ground beef; simmer until flavors blend@ ', 1, 1, 4.4, '\"https://www.allrecipes.com/thmb/sCQS2DuqlgZ5r5hqTwm7hB-lagk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/231808_GrandmasGroundBeefCasserole_MFS-WD1-a0626af0a5d9468985d12f83d40800f2.jpg\"', '\"My grandmother$s old-fashioned hamburger casserole is comfort food at its best! Featuring ground beef@ noodles@ and a cheesy sauce@ this recipe dates back to the 1940$s.\"', 'vlees', '2023-05-10 13:24:09'),
(17, 'Beef Au Jus', 0, 'PT15M', '\"Melt drippings in a skillet over medium-high heat. Whisk in flour and cook@ whisking constantly@ until the mixture thickens@ about 3 minutes.Add beef broth gradually@ whisking constantly@ then increase heat to high and bring to a boil; season with salt a', 1, 1, 4.6, '\"https://www.allrecipes.com/thmb/yHscNc1UMmlYbBNj4QbiyJkceCM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/221957-beef-au-jus-mfs431-1-70ee1eb79c084c7db5e605da1f23f114.jpg\"', '\"This au jus recipe from Chef John uses beef drippings and broth to make a flavorsome au jus. No prime rib or beef roast would be complete without it!\"', 'vlees', '2023-05-10 13:24:10'),
(18, 'Slow Simmer Beef Stew', 0, 'PT230M', '\"Combine beef stew meat and flour in a resealable plastic bag; seal bag and shake to coat beef.Melt butter with olive oil in a large pot over high heat; add beef and season with seasoned salt. Cook and stir beef until seared on all sides 5 to 7 minutes. S', 1, 1, 4.7, '\"https://www.allrecipes.com/thmb/PRIUXdgRcGKaaeK6lsusOBwMLqs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/1109306-slow-simmer-beef-stew-npoirier-4x3-1-1d89c11f3ab444019cf70d121f30d99b.jpg\"', '\"This beef stew is cooked slowly in a large pot over low heat on the stove after searing the beef to seal in its juicy flavor.\"', 'vlees', '2023-05-10 13:24:10'),
(19, 'Rich and Creamy Beef Stroganoff', 0, 'PT110M', '\"Place beef into a large bowl. Stir in red wine@ salt@ and black pepper. Marinate for 10 minutes@ then remove beef and pat dry with a paper towel. Reserve remaining marinade.Heat olive oil in a large skillet over medium heat. Stir in beef; cook and stir u', 1, 1, 4.7, '\"https://www.allrecipes.com/thmb/KB5Xsh5r0GA-naCqlwStb_-N3qA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/219046-Rich-and-Creamy-Stroganoff-ddmfs-094-4x3-1-406eeee525b147b583aab0b7cb431086.jpg\"', '\"This beef stroganoff recipe with sour cream and cream cheese is a cozy dish of tender beef and mushrooms in a thick gravy seasoned with red pepper.\"', 'vlees', '2023-05-10 13:24:11'),
(20, 'Simple Beef Stroganoff', 0, 'PT20M', '\"Gather all ingredients.Sauté ground beef in a large skillet over medium heat until browned and crumbly; 5 to 10 minutes.At the same time@ fill a large pot with lightly salted water and bring to a rapid boil. Cook egg noodles at a boil until tender yet fi', 1, 1, 4.1, '\"https://www.allrecipes.com/thmb/Rh2NialypvMY-ory6lY4_6cFPvE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/16311-simple-beef-stroganoff-DDMFS-4x3-1e966286eef54c0f96c882e569926eb3.jpg\"', '\"This ground beef stroganoff recipe made with basic pantry items is rich and creamy@ super simple to prepare@ and ready to serve in under 30 minutes.\"', 'vlees', '2023-05-10 13:24:11'),
(21, 'Beef Wellington', 0, 'PT70M', '\"Preheat the oven to 425 degrees F (220 degrees C).Place beef tenderloin in a small baking dish. Spread 2 tablespoons softened butter over beef.Bake in the preheated oven until browned@ 10 to 15 minutes. Remove beef from the pan and reserve pan juices; al', 1, 1, 4.5, '\"https://www.allrecipes.com/thmb/rKQ3OS0mTdFG66mu-3X4vP_AmG0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/16899-beef-wellington-DDMFS-4x3-84b7691972174478bfb16b465cdaf0d2.jpg\"', '\"This beef Wellington recipe features a filet of beef tenderloin topped with liver paté and mushrooms wrapped in puff pastry. Guaranteed to impress!\"', 'vlees', '2023-05-10 13:24:12'),
(22, 'Chef John$s Beef and Barley Stew', 0, 'PT230M', '\"Season beef all over with kosher salt and black pepper.Heat oil in a large pot over high heat. Cook beef in hot oil until browned on all sides@ about 10 minutes. Transfer beef to a plate; set aside.Reduce heat to medium and stir onion into the same pot w', 1, 1, 4.9, '\"https://www.allrecipes.com/thmb/WRJoP54RSO5xKVSgU8SE-WOPNj0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2940043-8dec1a4d8efd44a99a2b1c7f489f6c43.jpg\"', '\"Chef John$s old-fashioned beef barley soup features shank simmered for hours with vegetables until meltingly tender for a hearty@ cold-weather meal.\"', 'vlees', '2023-05-10 13:24:12'),
(23, 'Simple BBQ Ribs', 0, 'PT110M', '\"Gather all ingredients.Place ribs in a large pot and cover with water. Stir in kosher salt@ garlic powder@ and pepper@ and bring water to a boil over medium heat. Continue to boil until ribs are tender@ 40 to 45 minutes.While the ribs are boiling@ prehea', 1, 1, 4.8, '\"https://www.allrecipes.com/thmb/bcm81s6NUyIo7ENmN597buv4MVA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/16448-simple-bbq-ribs-DDMFS-4x3-6c6ec5c3ddda485fbc8c855520ae8fc9.jpg\"', '\"This BBQ ribs recipe may be different than others you$ve tried@ but for super tender ribs@ give it a try! Lean@ country-style pork ribs are boiled first@ then baked.\"', 'vlees', '2023-05-10 13:25:56'),
(24, 'Oven BBQ Chicken Drumsticks', 0, 'PT65M', '\"Assemble ingredients@ preheat oven to 400 degrees F (200 degrees C)@ and place drumsticks in a 7x11-inch baking dish.Whisk ketchup@ vinegar@ water@ brown sugar@ butter@ salt@ Worcestershire sauce@ mustard@ and chili powder together in a bowl; pour mixtur', 1, 1, 4.2, '\"https://www.allrecipes.com/thmb/RaIHJubbj5HrmHkyAjINJrA-Lt0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/222932-oven-bbq-chicken-drumsticks-DDMFS-4x3-b168af4d8e2e4d5c833448a9b0edfbe0.jpg\"', '\"Baked BBQ chicken legs are tender and juicy@ with a crispy skin. A homemade BBQ sauce adds sticky goodness to these meaty drumsticks that are oven-baked instead of grilled.\"', 'vlees', '2023-05-10 13:25:57'),
(25, 'Korean BBQ Sauce', 0, 'PT10M', '\"Stir soy sauce@ brown sugar@ garlic@ rice wine vinegar@ chile-garlic sauce@ pepper@ ginger@ and sesame oil together in a saucepan; bring to a boil.Whisk cornstarch and water together in a small bowl until the cornstarch dissolves; pour into boiling soy s', 1, 1, 4.7, '\"https://www.allrecipes.com/thmb/x2jF5FWem9lK3Rp2TBApVReX_v8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/6355848-c322df6b91594f3f9d9e93f0b9fe042d.jpg\"', '\"A homemade Korean BBQ sauce that$s quick and easy to make with brown sugar@ vinegar@ soy sauce@ and ginger. Add chile-garlic sauce for a fiery kick!\"', 'vlees', '2023-05-10 13:25:57'),
(26, 'Oven-Baked BBQ Ribs', 0, 'PT210M', '\"Preheat the oven to 350 degrees F (175 degrees C). Split ribs down the center between the bones.Mix onions@ ketchup@ water@ vinegar@ brown sugar@ Worcestershire sauce@ mustard powder@ and salt together in a bowl. Set aside 1/2 of the sauce for basting.He', 1, 1, 4.6, '\"https://www.allrecipes.com/thmb/5HD3NW54YiZ4VUtxuSZZC4-CMDg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2143920-oven-baked-bbq-ribs-Dan-DangerMan-Resch-1x1-1-8b4fdb531c144b4987a6a1863a2ffb7b.jpg\"', '\"These baked ribs are tender and full of flavor! They$re baked in the oven for three hours and basted continually with a tangy homemade BBQ sauce.\"', 'vlees', '2023-05-10 13:25:58'),
(27, 'BBQ Chicken Calzones', 0, 'PT60M', '\"Preheat the oven to 400 degrees F (200 degrees C).Place bacon in a large skillet and cook over medium-high heat@ turning occasionally@ until evenly browned@ about 10 minutes. Drain bacon slices on paper towels; crumble.Add shredded chicken and onion to h', 1, 1, 4.4, '\"https://www.allrecipes.com/thmb/hraponsPSEHujS53iyPqhtRx6Sg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/421698-bbq-chicken-calzones-txwife-4x3-1-5573c5ba93bc4e319a0c185ed024c7f0.jpg\"', '\"If you like BBQ Chicken Pizza@ you$ll like this easy-to-make bbq chicken calzone!\"', 'vlees', '2023-05-10 13:25:59'),
(28, 'Bourbon Whiskey BBQ Sauce', 0, 'PT45M', '\"Combine whiskey@ garlic@ and onion in a large skillet over medium heat; simmer until onion is translucent@ about 10 minutes.Stir in ketchup@ brown sugar@ vinegar@ tomato paste@ Worcestershire sauce@ liquid smoke@ salt@ black pepper@ and hot pepper sauce;', 1, 1, 4.8, '\"https://www.allrecipes.com/thmb/lyvP2czJauLrKSXWh_toi-MHmkQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/1980404-bourbon-whiskey-bbq-sauce-catherinedrew-1x1-1-9334a43e41454577804e02b9a4f25c66.jpg\"', '\"This terrific bourbon BBQ sauce has generous amounts of bourbon whiskey@ brown sugar@ ketchup@ and garlic. The ribs won$t know what hit them!\"', 'vlees', '2023-05-10 13:25:59'),
(29, 'Kalbi (Korean BBQ Short Ribs)', 0, 'PT210M', '\"Stir together soy sauce@ brown sugar@ water@ green onions@ garlic@ and sesame oil in a bowl until sugar has dissolved.Place ribs in a large resealable plastic bag. Pour marinade over ribs. Seal the bag and refrigerate for 3 hours to overnight.Preheat an ', 1, 1, 4.8, '\"https://www.allrecipes.com/thmb/T7QAOoH79zR90S3G8xn28qIs8aM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/716493-dda5939236484c4e9ed123d2b4bbdc37.jpg\"', '\"Kalbi is a traditional Korean BBQ beef short rib dish marinated in a sweet soy mixture with garlic and green onion@ grilled to caramelized perfection.\"', 'vlees', '2023-05-10 13:26:00'),
(30, 'Easy Slow Cooker BBQ', 0, 'PT640M', '\"Place pork shoulder in the slow cooker. Pour vinegar over pork@ coating all sides; season with salt and pepper.Cook on Low for 10 to 12 hours.Transfer pork to a platter. Drain and discard juices from the slow cooker. Chop pork and return to the slow cook', 1, 1, 4.7, '\"https://www.allrecipes.com/thmb/K1putPdcOXd9B9v456MOLQLDOYM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2057200-a9e23a186ef744eb9d5c789d1ace4646.jpg\"', '\"Your favorite barbeque sauce tops tender slow cooked pork in this Boston butt BBQ crockpot recipe@ perfect for sandwiches.\"', 'vlees', '2023-05-10 13:26:00'),
(31, 'Krystal$s Perfect Marinade for BBQ or Grilled Chicken', 0, 'PT10M', '\"Whisk brown sugar@ vinegar@ soy sauce@ olive oil@ Worcestershire sauce@ sesame oil@ garlic@ and pepper together in a large bowl until sugar has dissolved.\"', 1, 1, 4.7, '\"https://www.allrecipes.com/thmb/vuXH192VLAtCgFmBFhc-n9fJn9U=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/1017353-51230e2fef23407ba779ea35b85fe278.jpg\"', '\"This BBQ chicken marinade made with balsamic@ brown sugar@ Worcestershire sauce@ sesame oil@ and garlic adds a wonderful flavor to any cut of chicken.\"', 'vlees', '2023-05-10 13:26:01'),
(32, 'BBQ Spice Rub', 0, 'PT5M', '\"Mix brown sugar@ paprika@ chili powder@ garlic powder@ onion powder@ salt@ black pepper@ and cayenne in a bowl. Store in an airtight container or keep in the freezer in a resealable plastic bag.\"', 1, 1, 4.7, '\"https://www.allrecipes.com/thmb/F2Jpryp4dOPtFS1W9vOnMxOPero=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/3851555-bbq-spice-rub-SunnyDaysNora-1x1-1-96bb11c7582c4b67bb974c5e297172cb.jpg\"', '\"This go-to bbq rub is ideal for all your grilling@ smoking@ and broiling needs. Whip it up in less than 5 minutes with pantry and spice-shelf staples.\"', 'vlees', '2023-05-10 13:26:01'),
(33, 'Absolutely Awesome BBQ Sauce', 0, 'PT55M', '\"In a saucepan over low heat@ mix the brown sugar@ chile sauce@ rum@ soy sauce@ ketchup@ Worcestershire sauce@ garlic@ dry mustard@ and pepper. Simmer 30 minutes@ stirring occasionally. Cool@ and refrigerate until ready to use.\"', 1, 1, 4.7, '\"https://www.allrecipes.com/thmb/edHQZxu3S0bJ_VNmpw650zgjYEQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8260609-a15115abfa5547f686e64d2c89c984ad.jpg\"', '\"I have tried many@ many BBQ sauces@ but I always come back to this one! Using chile sauce in addition to a little ketchup give this sauce extra flavors to tantalize everyone$s taste buds!\"', 'vlees', '2023-05-10 13:26:01'),
(34, 'Best Carolina BBQ Meat Sauce', 0, 'PT525M', '\"Stir together mustard@ vinegar@ beer@ and brown sugar in a heavy non-reactive saucepan. Season with chili powder and black@ white@ and cayenne peppers. Bring to a simmer over medium-low heat and cook for about 20 minutes. Do not boil@ or you will scorch ', 1, 1, 4.6, '\"https://www.allrecipes.com/thmb/YPjHrNh0hOSnSYVjpmH1KC0gXl0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/234442-2e14efc88cf749779a58b7a1a4259358.jpg\"', '\"I can$t take all the credit for this Carolina-style BBQ sauce recipe. I had to search@ snoop@ and experiment to get it right. (Thanks Big Daddy$s!) I$ve had barbeque in some of the best little places in the Carolinas@ and this stuff rules there! It$s fan', 'vlees', '2023-05-10 13:26:02'),
(35, 'Scott$s Savory BBQ Sauce', 0, 'PT10M', '\"In a large container@ mix together the apple cider vinegar@ ketchup@ paprika@ brown sugar@ salt@ pepper@ red pepper flakes@ garlic powder@ Worcestershire sauce and lemon juice. Pour into an empty vinegar bottle@ ketchup bottle or other container and stor', 1, 1, 4.4, '\"https://www.allrecipes.com/thmb/uGuyhyhUFLcP2jqe6AnpJ9sY7iw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/4536731-c3a57a2993024c4f842a054c26693964.jpg\"', '\"This is a very simple Carolina style vinegar based BBQ sauce. A friend of the family gave us this recipe several years ago and after a few tweaks and additions@ this is the best BBQ sauce that I$ve ever had. You combine all of the ingredients and then en', 'vlees', '2023-05-10 13:26:02'),
(36, 'Vinegar-Based BBQ Sauce', 0, 'PT245M', '\"Stir together vinegar@ brown sugar@ kosher salt@ red pepper flakes@ and cayenne pepper in a small bowl until combined. Allow to sit at room temperature until flavors meld@ 4 to 8 hours.\"', 1, 1, 4.6, '\"https://www.allrecipes.com/thmb/4k9vSFqT30LIb83S_rGLP1gqwtA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/4203028-6f9349d2d3234dfe8d60cdda150e0e20.jpg\"', '\"This vinegar-based BBQ sauce made with brown sugar and hot pepper can be used to baste meat while grilling or add moisture and flavor to cooked meat.\"', 'vlees', '2023-05-10 13:26:03'),
(37, 'Italian BBQ Pork Chops', 0, 'PT50M', '\"Stir together vinegar@ ketchup@ brown sugar@ Worcestershire sauce@ Dijon mustard@ garlic@ 1/2 teaspoon salt@ and 1/2 teaspoon black pepper in a saucepan over medium-low heat; simmer sauce for 20 minutes. Remove from heat and allow to sit for 5 minutes.Pr', 1, 1, 4.5, '\"https://www.allrecipes.com/thmb/hhe9RrOWfb22yEFlyiIo_gvp2o4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/659267-italian-bbq-pork-chops-Rebekah-Rose-HIlls-4x3-1-3b7909b4e4de473faabeb0d8247a009b.jpg\"', '\"Pork chops with a quick homemade BBQ sauce made with balsamic vinegar@ ketchup@ and brown sugar have just the right amount of sweetness to become addictive.\"', 'vlees', '2023-05-10 13:26:03'),
(38, 'BBQ Chicken Pizza', 0, 'PT35M', '\"Preheat the oven to 350 degrees F (175 degrees C).Place pizza crust on a baking sheet. Spread barbeque sauce on crust. Top with chicken@ pepperoncini peppers@ onion@ and cilantro. Cover with Colby-Jack cheese.Bake in the preheated oven until cheese is me', 1, 1, 4.5, '\"https://www.allrecipes.com/thmb/7VF4PrIhJGse9B-Qoa0SgqOq2U0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/58411-8a92c002662b483984bb8a690ea51763.jpg\"', '\"This BBQ chicken pizza is loaded with diced chicken@ spicy barbecue sauce@ pepperoncini peppers@ onion@ and cilantro@ topped with Colby-Jack cheese.\"', 'vlees', '2023-05-10 13:26:04'),
(39, 'Honey Garlic BBQ Sauce', 0, 'PT80M', '\"Mix together ketchup@ garlic@ 1 cup water@ hot sauce@ honey@ molasses@ brown sugar@ Worcestershire sauce@ soy sauce@ salt@ Cajun seasoning@ paprika@ red pepper@ white pepper@ and black pepper in a large saucepan over medium-low heat. Allow mixture to sim', 1, 1, 4.5, '\"https://www.allrecipes.com/thmb/utOq3aiSjD2exhPZP8t-VTaSapk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/996504-fd110fdb4b6a45338688a7b2e91664b6.jpg\"', '\"This is my favorite homemade garlic BBQ sauce. It uses a whole bulb of garlic and lots of honey.\"', 'vlees', '2023-05-10 13:26:04'),
(40, 'Eastern North Carolina BBQ Sauce', 0, 'PT1445M', '\"Combine white vinegar@ cider vinegar@ brown sugar@ cayenne pepper@ hot pepper sauce@ salt@ and pepper in a jar or bottle with a tight-fitting lid; shake well.Refrigerate sauce@ shaking occasionally@ until flavors blend@ 1 to 2 days. Store in the refriger', 1, 1, 4.5, '\"https://www.allrecipes.com/thmb/eqQu0WajFyFJzQvLTzgvMAxlXVU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Eastern-North-Carolina-BBQ-Sauce-2000-4b143643c69641b4a3e6989eeae9d474.jpg\"', '\"This Carolina vinegar BBQ sauce requires no cooking and is simple to make with cider vinegar@ white vinegar@ brown sugar@ cayenne@ and hot sauce.\"', 'vlees', '2023-05-10 13:26:05'),
(41, 'Southern Yank Pulled Pork BBQ', 0, 'PT440M', '\"Mix together onion@ barbecue sauce@ celery@ water@ ketchup@ honey@ brown sugar@ Worcestershire sauce@ garlic@ hot pepper sauce@ chili powder@ salt@ and pepper in a slow cooker until thoroughly combined. Place pork roast in the center of the cooker and sp', 1, 1, 4.5, '\"https://www.allrecipes.com/thmb/3tp5JY7XekxTVbr_tWD3OE8aA6s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/1116073-7bccac19a0e24874ba1434cfdef2e291.jpg\"', '\"Try this easy pork BBQ recipe for boneless pork steeped in a slow cooker with sauces and seasonings. It$s sweet and savory with just a hint of heat.\"', 'vlees', '2023-05-10 13:26:05');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`IngredientID`);

--
-- Indexen voor tabel `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`RecipeID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `IngredientID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT voor een tabel `recipes`
--
ALTER TABLE `recipes`
  MODIFY `RecipeID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

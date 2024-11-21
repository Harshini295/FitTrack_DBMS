create database miniproject_trial;
use miniproject_trial;
CREATE TABLE region(region_id INTEGER NOT NULL primary key, region_name VARCHAR(10) NOT NULL);
INSERT INTO region VALUES (1, 'Italy'), (2, 'Thailand'), (3, 'Lebanon'), (4, 'India'), (5, 'Mexico');
DESC region;
CREATE TABLE food_planner(food_region_id INTEGER, food_id INTEGER, PRIMARY KEY ( food_region_id,food_id ), food_name VARCHAR (100), food_description VARCHAR(255), nutrient_value VARCHAR (255), calories INTEGER, prevent_if_allergy JSON, image_url VARCHAR(255), foreign key (food_region_id) references region(region_id));

CREATE TABLE allergies (allergy_id INTEGER PRIMARY KEY, allergy_name VARCHAR(30));
INSERT INTO allergies VALUES (1,'Gluten intolerance'), (2, 'Nut allergy'), (3, 'Lactose intolerance'), (4, 'Vegan');

INSERT INTO food_planner VALUES (1, 1, 'Agilo e Olio', 'A simple pasta dish made with olive oil, garlic, red pepper flakes, and parsley.', 'Carbohydrates, fat, fiber, vitamins (A, C), minerals (calcium, potassium)', 500, NULL, 'https://i0.wp.com/walkingthroughlavenderfields.com/wp-content/uploads/2022/09/aglio-e-olio-e-peperoncino-01.jpeg?w=1280&ssl=1');

INSERT INTO food_planner VALUES (1,2,'Arancini','Fried rice balls filled with a variety of ingredients, such as meat sauce, cheese, or vegetables.','Carbohydrates, protein, fat, fiber, vitamins (B vitamins), minerals (iron)', 300, '[1,2]', 'https://www.themediterraneandish.com/wp-content/uploads/2023/04/Fried-Arancini-recipe-15-768x1152.jpg'),
(1,3,'Bruschetta','Grilled bread slices topped with olive oil, garlic, and often tomatoes, basil, or other ingredients.', 'Carbohydrates, fat, fiber, vitamins (A, C), minerals (calcium, potassium)', 200, '[1]', 'https://www.allrecipes.com/thmb/VXmSudy-Lx7RxPLFDna7zk-5GrY=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/866248-balsamic-bruschetta-photo-by-molly-1-fb947cc37e6e4e82b20ce143551cb12f.jpg'),
(1,4,'Burrata', ' A fresh cheese made from mozzarella and cream, with a soft, creamy interior.', 'Protein, fat, calcium, vitamins (A, D), minerals (zinc)', 500, '[3]', 'https://www.recipetineats.com/tachyon/2023/07/Burrata-roasted-tomatoes-pesto_6.jpg?resize=900%2C1260&zoom=1'),
(1,5,'Caponata', 'A Sicilian eggplant dish made with tomatoes, olives, capers, and vinegar.', 'Carbohydrates, protein, fat, fiber, vitamins (A, C, K), minerals (calcium, potassium, iron)', 300, NULL, 'https://www.themediterraneandish.com/wp-content/uploads/2020/07/caponata-recipe-11.jpg');

INSERT INTO food_planner VALUES (1,6, 'Caprese Salad', 'A simple salad made with fresh mozzarella cheese, tomatoes, basil, and olive oil.', 'Protein, fat, fiber, vitamins (A, C), minerals (calcium, potassium)', 300, '[2]', 'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2019/07/Caprese-Salad-2-2.jpg'),
(1,7,'Ciabatta', ' A rustic bread with a chewy crust and a soft interior.', 'Carbohydrates, fiber, vitamins (B vitamins), minerals (iron)', 300, '[1]', 'https://www.browneyedbaker.com/wp-content/uploads/2024/01/ciabatta-25-1200.jpg'),
(1,8, 'Focaccia', 'A flatbread made with flour, water, yeast, olive oil, and often herbs or vegetables.', 'Carbohydrates, fat, fiber, vitamins (B vitamins), minerals (iron)', 300, '[1]', 'https://alexandracooks.com/wp-content/uploads/2021/09/focacciavertical_alexandraskitchen.jpg'),
(1,9, 'Gelato', 'A frozen dessert made with milk, cream, sugar, and flavorings.', ' Fat, protein, sugar, vitamins (A, D), minerals (calcium)', 300, '[3, 4]', 'https://www.saveur.com/uploads/2019/02/08/RSQCZRUP32T6N4BOZJSCSQHTCI.jpg?auto=webp&auto=webp&optimize=high&quality=70&width=720&dpr=1.5'),
(1,10, 'Gorgonzola', 'A blue cheese with a creamy texture and a strong, pungent flavor.', 'Protein, fat, calcium, vitamins (A, D), minerals (zinc)', 500, '[3, 4]', 'https://www.cheese.com/media/uploads/blog/2023/05/versions/gorgonzola-w1200.webp');

INSERT INTO food_planner VALUES (1,11, 'Lasagna', 'A layered pasta dish made with lasagna sheets, meat sauce (often beef or pork), tomato sauce, ricotta cheese, and Parmesan cheese.', 'Carbohydrates, protein, fat, fiber, vitamins (A, C, B vitamins), minerals (calcium, iron)', 500,'[1]', 'https://thecozycook.com/wp-content/uploads/2022/04/Lasagna-Recipe.jpg'),
(1,12, 'Minestrone soup', 'A hearty vegetable soup made with beans, pasta, and vegetables.', 'Carbohydrates, protein, fat, fiber, vitamins (A, C, K), minerals (calcium, potassium, iron)', 300, NULL, 'https://www.dinneratthezoo.com/wp-content/uploads/2018/07/olive-garden-minestrone-soup-4.jpg'),
(1,13, 'Ossobuco', 'A braised veal shank with a bone marrow center, often served with a gremolata (a mixture of herbs and citrus zest).','Protein, fat, iron, vitamins (B vitamins)', 500, NULL, 'https://cristinaskitchen.com/wp-content/uploads/2023/12/ossobucco-alla-milanese-with-risotto-vertical.jpg'),
(1,14, 'Panna Cotta', 'A creamy dessert made with cream, sugar, and often flavored with vanilla or fruit.', 'Fat, protein, vitamins (A, D), minerals (calcium)', 300, '[3, 4]', 'https://www.allrecipes.com/thmb/E2ohV8nTL32hi7GcE7Lkekdx-lw=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/AR-72567-Panna-cotta-ddmfs-4x3-14ae724a2a8e4ca3a79c5e27b2b61994.jpg'),
(1,15, 'Parmigiano Reggiano', ' A hard, granular cheese with a nutty flavor.', 'Protein, fat, calcium, vitamins (A, D), minerals (zinc)', 500, '[3, 4]', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Parmigiano_Reggiano%2C_Italien%2C_Europ%C3%A4ische_Union.jpg/330px-Parmigiano_Reggiano%2C_Italien%2C_Europ%C3%A4ische_Union.jpg');

INSERT INTO food_planner VALUES (1,16, 'Pesto Genovese', 'A creamy green sauce made with basil, pine nuts, Parmesan cheese, garlic, and olive oil, often served with pasta.', 'Carbohydrates, protein, fat, fiber, vitamins (A, C, K), minerals (calcium, potassium, iron)', 600, '[2]', 'https://www.sipandfeast.com/wp-content/uploads/2023/07/pesto-alla-genovese-recipe-7.jpg'),
(1,17, 'Pizza Margherita', 'A classic Italian pizza with a thin, crispy crust topped with tomato sauce, mozzarella cheese, fresh basil, and a drizzle of olive oil.', 'Carbohydrates, protein, fat, fiber, vitamins (A, C, K), minerals (calcium, potassium, iron)', 1000, '[1]', 'https://cdn.shopify.com/s/files/1/0274/9503/9079/files/20220211142754-margherita-9920_5a73220e-4a1a-4d33-b38f-26e98e3cd986.jpg?v=1723650067?w=1024'),
(1,18, 'Polenta', 'A cornmeal porridge that can be served creamy or firm. It is often served with a variety of toppings, such as mushrooms, sausage, or cheese.', 'Carbohydrates, protein, fiber, vitamins (B vitamins), minerals (iron)', 300, '[1]', 'https://www.budgetbytes.com/wp-content/uploads/2024/01/Polenta-V2-1152x1536.jpg'),
(1,19, 'Polenta e funghi','Polenta served with a creamy mushroom sauce.', 'Carbohydrates, protein, fat, fiber, vitamins (B vitamins), minerals (iron)', 500, NULL, 'https://blog.giallozafferano.it/allacciateilgrembiule/wp-content/uploads/2020/10/polenta-e-funghi.jpg'),
(1,20, 'Prosciutto', 'Cured ham, often served thinly sliced.', 'Protein, fat, iron, vitamins (B vitamins)', 200, '[4]', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Prosciutto_di_Parma%2C_Tagliere%2C_Italia.jpg/330px-Prosciutto_di_Parma%2C_Tagliere%2C_Italia.jpg');

INSERT INTO food_planner VALUES (1,21, 'Risotto alla Milanese', 'A creamy rice dish made with Arborio rice, saffron, broth, butter, Parmesan cheese, and white wine.', 'Carbohydrates, protein, fat, fiber, vitamins (B vitamins), minerals (calcium, iron)', 500, '[1]', 'https://safrescobaldistatic.blob.core.windows.net/media/2022/11/RISOTTO-ALLA-MILANESE.jpg'),
(1,22, 'Saltimbocca ala Romana', 'Veal scallopini wrapped in prosciutto and sage, often served with a white wine sauce.', 'Protein, fat, iron, vitamins (B vitamins)', 400, NULL, 'https://flavorofitaly.com/wp-content/uploads/2022/03/SaltimboccaAllaRomana-edited-2048x1152.jpg'),
(1,23, 'Spaghetti alla Carbonara', 'A creamy pasta dish made with spaghetti, eggs, pecorino Romano cheese, guanciale (cured pork cheek), and black pepper.', 'Carbohydrates, protein, fat, fiber, vitamins (B vitamins), minerals (calcium, potassium)', 700, '[1]', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2009/6/12/2/FO1D41_23785_s4x3.jpg.rend.hgtvcom.1280.720.suffix/1431766590243.webp'),
(1,24, 'Tiramisu', 'A layered dessert made with ladyfingers dipped in coffee, layered with mascarpone cheese, cocoa powder, and sometimes chocolate.', 'Carbohydrates, fat, protein, vitamins (B vitamins), minerals (calcium)', 400, '[3, 1, 2, 4]', 'https://www.culinaryhill.com/wp-content/uploads/2020/09/Tiramisu-Recipe-Culinary-Hill-LR-03.jpg'),
(1,25, '4 carbonara', 'A creamy pasta dish made with spaghetti, 4 eggs, nutritional yeast, and black pepper.', 'Carbohydrates, protein, fat, fiber, vitamins (B vitamins), minerals (calcium, potassium)', 700, NULL, 'https://4huggs.com/wp-content/uploads/2022/04/4-Carbonara-bowl.jpg'),
(1,26, 'Vegetable Ratatouille', 'A stewed dish of vegetables, often including eggplant, zucchini, tomatoes, bell peppers, and onions.', 'Carbohydrates, protein, fat, fiber, vitamins (A, C, K), minerals (calcium, potassium, iron)', 300, NULL, 'https://www.onceuponachef.com/images/2024/05/ratatouille-1200x1787.jpg');
ALTER TABLE food_planner MODIFY food_description VARCHAR(500); 
ALTER TABLE food_planner MODIFY  image_url VARCHAR(500); 
INSERT INTO food_planner VALUES
(2,1,'Gaeng Daeng (Red Curry)', 'A mildly spicy curry made with red curry paste, coconut milk, and your choice of protein such as chicken or tofu. This dish is rich and aromatic, with flavors of lemongrass, galangal, and kaffir lime leaves, balanced by creamy coconut milk and vegetables.', 'Protein (meat/tofu), fats (coconut milk), vitamins (vegetables)', 500, NULL, 'https://hungryinthailand.com/wp-content/uploads/2023/09/gaeng-daeng-curry-768x1024.webp'),
(2,2,'Gaeng Kua Kling', 'A dry curry dish from Southern Thailand made with minced meat, kaffir lime leaves, and aromatic southern spices. It’s spicy and flavorful, served without coconut milk, unlike most other Thai curries, making it a lighter yet fiery option.', 'Protein (meat), antioxidants (spices), fats', 300, NULL, 'https://www.messy4cook.com/wp-content/uploads/2018/07/2018-07-541.jpg' ),
(2,3,'Gaeng Phet Pet Yang', 'A luxurious Thai curry made with roasted duck, coconut milk, red curry paste, and pineapple. The sweetness of the fruit balances the savory and spicy flavors of the duck and curry paste, offering a perfect blend of rich and fresh flavors.','Protein (duck), fats (coconut milk), vitamins (pineapple, tomatoes)',600, NULL, 'https://www.eatingthaifood.com/wp-content/uploads/2015/06/thai-gaeng-som-recipe-26.jpg'),
(2,4,'Gaeng Som (Sour Curry Soup)', 'A sour, spicy fish soup made with tamarind, turmeric, and vegetables. Known for its tangy flavor, Gaeng Som is light yet flavorful, often containing shrimp or fish, with a base of sour tamarind broth to give it a refreshing taste.','Protein (fish), vitamins (vegetables), antioxidants (tamarind)', 200, NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Kaeng_tai_pla34.JPG/345px-Kaeng_tai_pla34.JPG'),
(2,5,'Gaeng Tai Pla (Fermented Fish Curry)', 'A robust and intensely flavored curry from Southern Thailand made with fermented fish entrails, vegetables, and curry paste. It is known for its complex, spicy, and salty flavor, not for the faint-hearted, but deeply rooted in traditional southern cuisine.','Protein (fish), vitamins (vegetables), minerals', 350, NULL, 'https://rachelcooksthai.com/wp-content/uploads/2021/07/Chicken1.jpg'),
(2,6,'Gai Tod (Fried Chicken)', 'Thai-style fried chicken marinated in garlic, coriander root, and pepper, then deep-fried to crispy perfection. It’s typically served with sticky rice and a tangy dipping sauce made from fish sauce, lime, and chili.','Protein (chicken), fats (oil), carbohydrates (breading)', 400, '[4]', 'https://hot-thai-kitchen.com/wp-content/uploads/2022/05/green-curry-new-sq-2.jpg'),
(2,7,'Green Curry', 'A vibrant and aromatic curry made with green curry paste, coconut milk, and vegetables. Usually prepared with chicken, beef, or tofu, it has a sweet and spicy flavor profile and is often served with rice or rice noodles.','Protein (meat/tofu), fats (coconut milk), vitamins (vegetables)', 500, NULL, 'https://hungryinthailand.com/wp-content/uploads/2024/01/hor-mok-pla-768x1024.webp'),
(2,8,'Hor Mok Pla (Steamed Fish Custard)', 'A delicate dish of steamed fish curry custard made with coconut milk, red curry paste, and fish fillets wrapped in banana leaves. The texture is creamy and smooth, with the rich flavors of the curry complementing the fish.','Protein (fish), fats (coconut milk), vitamins (banana leaves)', 350, NULL, 'https://upload.wikimedia.org/wikipedia/commons/f/fa/%E0%B9%81%E0%B8%81%E0%B8%87%E0%B8%AE%E0%B8%B1%E0%B8%87%E0%B9%80%E0%B8%A5_%E0%B8%97%E0%B8%B5%E0%B9%88_%E0%B8%AB%E0%B8%A5%E0%B8%B9%E0%B9%89%E0%B8%A5%E0%B8%B3.jpg'),
(2,9,'Kaeng Hang Lei (Northern Thai Pork Curry)', 'A slow-cooked pork curry with Burmese origins, flavored with tamarind, garlic, and ginger. It’s milder and sweeter than most Thai curries and does not contain coconut milk, making it unique to Northern Thai cuisine.','Protein (pork), vitamins (tamarind), minerals (spices)', 550, NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Kaeng_phak_wan.JPG/330px-Kaeng_phak_wan.JPG'),
(2,10,'Kaeng Pa (Jungle Curry)', 'A spicy, broth-like curry made without coconut milk, originally from the forests of Northern Thailand. The curry is packed with wild vegetables, meats, and fresh herbs, offering a bold, fiery flavor typical of jungle cuisine.','Protein (meat), vitamins (vegetables), antioxidants', 300, NULL, 'https://www.simplyrecipes.com/thmb/vmiWqDVs_0yRzIiezSJE2FC6m-o=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Simply-Recipes-Thai-Omelette-LEAD-5-5b849cc6d653475f950a4c0f4dcae8fb.jpg'),
(2,11,'Kai Jeow (Thai Omelette)', 'A simple yet flavorful omelette made with eggs, fish sauce, and sometimes minced pork. It’s crispy on the outside and fluffy on the inside, often served with rice and chili sauce.','Protein (eggs), fats, carbohydrates (rice)',250, NULL, 'https://hungryinthailand.com/wp-content/uploads/2023/03/gai-pad-med-mamuang-768x1024.webp'), 
(2,12,'Kai Med Ma Muang','Stir-fried chicken with cashew nuts, chilies, and vegetables, creating a perfect balance of savory, sweet, and slightly spicy flavors. It’s a popular dish known for its delightful crunch and flavor from the cashews.','Protein (chicken), fats (cashews), vitamins (vegetables)', 450, '[2, 4]', 'https://www.seriouseats.com/thmb/PrK8gle5KCs6wwafYy1VQz14mxM=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/20210609-southern-thai-fish-curry-rice-noodles-KanomJeenNamYaGati-vicky-wasik-seriouseats-24-103e63c6d619403b8c1d6b11245ad851.jpg'),
(2,13,'Kanom Jeen Nam Ya', 'A light dish made with fermented rice noodles topped with a savory fish-based curry sauce. The noodles are soft and tender, while the curry adds a rich, flavorful punch to the dish.','Protein (fish), carbohydrates (noodles), vitamins', 350, NULL, 'https://asianinspirations.com.au/wp-content/uploads/2023/10/KB-18-940x627.jpg'),
(2,14,'Khanom Buang', 'Thin, crispy crepe-like pancakes filled with either sweet or savory toppings such as coconut cream, shrimp, or egg yolks. These popular street snacks have contrasting textures and are deliciously light.','Carbohydrates (pancake), fats (coconut cream), protein (shrimp)', 200, NULL, 'https://cdn-abndc.nitrocdn.com/KidXqHvkFKIabnNEJOITpLSJJqajraJA/assets/images/optimized/rev-5519a31/zestysouthindiankitchen.com/wp-content/uploads/2012/11/Thai-coconut-rice-pancake-2.jpg'),
(2,15,'Khanom Krok', 'Small, round, sweet coconut pancakes made from rice flour and coconut milk, often served as a dessert. They are crispy on the outside and soft and creamy on the inside.','Carbohydrates (rice flour), fats (coconut milk), sugars', 150, NULL, 'https://www.allrecipes.com/thmb/PJxGRVnTfMAGPiUhQkHL5bky4wA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/3572007-5ab08518c35e464bb04fd7dfc535ee47.jpg'),
(2,16,'Khao Man Gai', 'A simple and flavorful dish of poached chicken served over rice cooked in chicken broth, accompanied by a side of ginger sauce and cucumber. It’s a Thai take on the famous Hainanese chicken rice.','Protein (chicken), carbohydrates (rice), fats', 600, '[4]', 'https://thatspicychick.com/wp-content/uploads/2023/06/Thai-Fried-Rice-Khao-Pad-plate-front-1024x1536.jpg'),
(2,17,'Khao Pad', 'A staple in Thai cuisine, fried rice made with jasmine rice, eggs, and a variety of proteins like chicken, shrimp, or tofu, stir-fried with vegetables and soy sauce.','Carbohydrates (rice), protein (meat/eggs), fats, vitamins', 450, '[2]', 'https://www.tastythais.com/wp-content/uploads/2020/04/Awesome-Khao-Soi-Chiang-Mai-Curry-e1588818524756.jpg'),
(2,18,'Khao Soi', 'A Northern Thai dish of egg noodles in a rich coconut milk and curry broth, typically topped with crispy fried noodles, chicken or beef, and served with pickled mustard greens and lime.','Carbohydrates (noodles), protein (chicken/beef), fats (coconut milk)',550, NULL, 'https://www.tastythais.com/wp-content/uploads/2020/04/Awesome-Khao-Soi-Chiang-Mai-Curry-e1588818524756.jpg'),
(2,19,'Khao Tom', 'A comforting rice soup made with jasmine rice, boiled in a savory broth with garlic, ginger, and either pork, chicken, or shrimp. Often eaten for breakfast or when feeling unwell','Carbohydrates (rice), protein (meat/shrimp), vitamins', 200, NULL, 'https://www.foodandwine.com/thmb/5RNFB7Okiwh1iQFXHYx8HBLtZ6A=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/khao-tom-thai-breakfast-porridge-with-bacon-FT-RECIPE0221-2ed14a3f80d544f7ae1c8e8d81ecbd4c.jpg'),
(2,20,'Kuay Teow Nam Tok', 'A flavorful noodle soup made with rice noodles, pork or beef, and a rich, dark broth seasoned with blood, spices, and herbs. It’s savory and slightly spicy, a popular street food in Thailand.','Protein (pork/beef), carbohydrates (noodles), vitamins', 400, NULL, 'https://hot-thai-kitchen.com/wp-content/uploads/2014/09/boat-noodles-new-sq.jpg'),
(2,21,'Laab', 'A spicy, tangy minced meat salad typically made with pork, chicken, or beef. It’s flavored with lime juice, fish sauce, herbs, and roasted rice powder, making it a refreshing yet hearty dish. Often served with sticky rice.', 'Protein (meat), vitamins (herbs), antioxidants (spices)', 300, NULL, 'https://www.seriouseats.com/thmb/wMVTF4sph7fOdFN_mRbVuVXczO8=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/20210928-Laab-Moo-thai-pork-laab-vicky-wasik-21-c44ca48b8a544addba2fe747b0ba4fef.jpg'),
(2,22,'Massaman Curry', 'A mild yet rich curry with Persian influence, made with tender chunks of beef or chicken, coconut milk, potatoes, peanuts, and a variety of spices like cinnamon, cardamom, and cloves. It’s one of Thailand''s most famous curries.', 'Protein (meat), fats (coconut milk, peanuts), carbohydrates (potatoes)', 550, NULL, 'https://thewoolfskitchen.com/wp-content/uploads/FullSizeRender-2-edited-1170x1170.jpg'),
(2,23,'Mee Krob', 'Crispy, fried vermicelli noodles tossed in a sweet and tangy tamarind sauce with shrimp, chicken, or tofu. The combination of crunchy noodles and flavorful sauce makes it a unique dish with delightful textures.', 'Carbohydrates (noodles), protein (shrimp/tofu), vitamins (vegetables)', 400, '[1,2]', 'https://www.lionbrand.com.au/wp-content/uploads/2022/07/Feature-Image-Crisp-Fried-Noodle.jpg'),
(2,24,'Moo Ping', 'A popular Thai street food, these skewers of marinated pork are grilled over charcoal and served with a side of sticky rice. The marinade typically includes garlic, soy sauce, and coconut milk, making it both savory and slightly sweet.', 'Protein (pork), fats, vitamins (garlic, herbs)', 300, NULL, 'https://www.marionskitchen.com/wp-content/uploads/2023/05/Thai-Moo-Ping-2.jpg'),
(2,25,'Nam Prik Ong', 'A Northern Thai chili dip made with minced pork, tomatoes, and dried chilies. It’s spicy and slightly tangy, served as a dip for fresh vegetables or sticky rice.', 'Protein (pork), vitamins (tomatoes), antioxidants (chilies)', 250, NULL, 'https://www.seriouseats.com/thmb/WZaDnuiR0WfVTT0AqsSgWwcVDrk=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__2020__10__20201002-nam-prik-ong-derek-lucci-c59798d53272440ea15c1cdf0b196af8.jpg'),
(2,26,'Nam Tok Moo', 'A spicy grilled pork salad with lime juice, fish sauce, and herbs. It’s similar to Laab but includes slices of grilled pork, giving it a smoky flavor, often served with sticky rice.', 'Protein (pork), vitamins (herbs), antioxidants', 280, NULL, 'https://asianinspirations.com.au/wp-content/uploads/2019/01/R01712_Spicy_Thai_Pork_Salad.jpg'),
(2,27,'Nam Tok Neua', 'A spicy and tangy beef salad made with grilled beef slices, lime juice, fish sauce, chili, and fresh herbs. It’s refreshing yet flavorful, typically enjoyed with sticky rice.', 'Protein (beef), vitamins (herbs), antioxidants (spices)', 300, NULL, 'https://hot-thai-kitchen.com/wp-content/uploads/2022/06/nam-tok-beef-horz-4x5-1.jpg'),
(2,28,'Pad Kee Mao', 'A spicy stir-fried noodle dish made with wide rice noodles, meat (often chicken or beef), and plenty of basil and chili. The name suggests it is a popular late-night snack after drinking, thanks to its bold, spicy flavors.', 'Carbohydrates (noodles), protein (meat), fats, vitamins (vegetables)', 450, '[1]', 'https://www.recipetineats.com/tachyon/2014/07/Thai-Drunken-Noodles-on-Plate.jpg?resize=900%2C1260&zoom=1'),
(2,29,'Pad Kra Pao', 'A popular Thai dish made with minced pork, chicken, or beef stir-fried with garlic, chili, and Thai holy basil. It is typically served over rice with a fried egg on top, making it a go-to comfort food in Thailand.', 'Protein (meat), vitamins (basil, chili), fats', 400, NULL, 'https://hot-thai-kitchen.com/wp-content/uploads/2022/10/gaprao-beef-4x5-vert-2.jpg'),
(2,30,'Pad See Ew', 'A stir-fried noodle dish made with wide rice noodles, soy sauce, garlic, and a choice of meat or tofu. It’s sweet, savory, and slightly smoky from the stir-frying process, often compared to a Thai version of chow fun.', 'Carbohydrates (noodles), protein (meat/tofu), fats, vitamins', 450, '[1]', 'https://www.recipetineats.com/tachyon/2016/03/Pad-See-Ew_2.jpg?resize=1200%2C1680&zoom=1'),
(2,31,'Pad Thai', 'Thailand most famous dish, Pad Thai consists of stir-fried rice noodles with eggs, tofu, shrimp or chicken, and a variety of vegetables, all tossed in a tangy tamarind sauce. It is typically garnished with crushed peanuts and lime.', 'Carbohydrates (noodles), protein (shrimp/chicken), fats, vitamins', 500, '[1, 2, 4]', 'https://www.onceuponachef.com/images/2016/03/pad-thai-1120x1384.jpg'),
(2,32,'Pla Kapong Neung Manao', 'A refreshing and light dish made with steamed sea bass, flavored with lime, garlic, and chili. The citrusy sauce perfectly complements the tender, mild fish, making it a popular seafood dish.', 'Protein (fish), vitamins (lime), antioxidants (garlic, chili)', 250, NULL, 'https://www.mythaicooking.com/wp-content/uploads/2020/01/lime-fish.jpg'),
(2,33,'Pla Tod', 'A crispy and flavorful whole fish, typically tilapia or sea bass, deep-fried and served with a tangy dipping sauce. The fish is golden and crispy on the outside while staying tender and moist on the inside.', 'Protein (fish), fats (oil)', 400, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ400jdl6h7j9eo0BnIfA-YyS0X0S01tMl7xA&s'),
(2,34,'Sai Oua', 'A spicy Northern Thai sausage made with pork, lemongrass, galangal, and herbs. It’s grilled and often served with sticky rice and fresh vegetables, offering a burst of aromatic and spicy flavors in each bite.', 'Protein (pork), fats, antioxidants (herbs)', 350, NULL, 'https://ianbenites.com/wp-content/uploads/2021/07/20210718_143425.jpg'),
(2,35,'Som Tam', 'A fresh and zesty salad made with shredded green papaya, lime, peanuts, chilies, and fish sauce. It’s crunchy, tangy, and spicy, often eaten as a side dish or a light meal.', 'Vitamins (papaya), antioxidants (chilies, lime), fats (peanuts)', 150, '[2]', 'https://www.allrecipes.com/thmb/c5lGrN2OiPiZU97T2XZ0Rw1xopY=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Som-Tam-Malakor-Green-Papaya-Salad-2000-ec87b4dcd85041c991d11ec6a1ab5f30.jpg'),
(2,36,'Tod Mun Pla', 'Spicy, chewy fish cakes made with ground fish, red curry paste, and kaffir lime leaves, deep-fried until golden brown. Often served with a sweet chili dipping sauce, they make for a popular snack or appetizer.', 'Protein (fish), fats, antioxidants (lime leaves)', 300, NULL, 'https://allwaysdelicious.com/wp-content/uploads/2021/01/fish-cakes-fried-horiz-1.jpg'),
(2,37,'Tom Yum Goong', 'A hot and sour soup made with shrimp, lemongrass, kaffir lime leaves, and galangal, simmered in a broth of chili, lime, and fish sauce. It’s light, spicy, and tangy, considered one of Thailand’s most famous soups.', 'Protein (shrimp), vitamins (herbs), antioxidants (spices)', 150, '[4]', 'https://hot-thai-kitchen.com/wp-content/uploads/2013/03/tom-yum-goong-blog.jpg'),
(2,38,'Yam Talay', 'A refreshing seafood salad made with shrimp, squid, and mussels, mixed with lime juice, fish sauce, and fresh herbs. It’s light yet packed with flavor, perfect for a warm day.', 'Protein (seafood), vitamins (herbs), antioxidants (lime)', 200, '[4]', 'https://hungryinthailand.com/wp-content/uploads/2023/08/yum-talay-salad-768x1024.webp'),
(2,39,'Yam Woon Sen', 'A light and flavorful salad made with glass noodles, minced pork, shrimp, and fresh herbs, tossed in a tangy dressing of lime juice, fish sauce, and chilies. It’s a refreshing and healthy option, often served chilled.', 'Carbohydrates (noodles), protein (pork/shrimp), vitamins (herbs)', 250, '[2]', 'https://hot-thai-kitchen.com/wp-content/uploads/2017/01/yum-woon-sen-blog.jpg'),
(2,40,'Yum Nua', 'A tangy and spicy beef salad made with thinly sliced grilled beef, fresh herbs, and a spicy lime dressing. It’s refreshing yet hearty, often served with sticky rice or as a light meal on its own.', 'Protein (beef), vitamins (herbs), antioxidants', 300, NULL, 'https://basilandbubbly.com/wp-content/uploads/2020/03/thai-beef-salad-4.webp');

INSERT INTO food_planner VALUES (3,1, 'Aish el Saraya', 'A Lebanese dessert made of bread soaked in syrup and topped with cream and pistachios. It is sweet, creamy, and often served cold.', 'Carbohydrates, fats, protein', 400, NULL, 'https://www.fufuskitchen.com/wp-content/uploads/2022/03/aish-el-saraya-scaled.webp'),
(3,2, 'Atayef', 'A mini-pancake dessert stuffed with sweet cheese or nuts and soaked in syrup. It’s typically served during Ramadan', 'Carbohydrates, fats, sugar', 250, '[1]', 'https://littlesunnykitchen.com/wp-content/uploads/2014/07/Atayef-2-1024x1536.jpg'),
(3,3, 'Baba Ghanoush', 'A smoky eggplant dip made with roasted eggplant, tahini, lemon juice, and garlic. It’s a smooth, creamy dip, often eaten as a mezze or spread for pita bread.', 'Fiber, vitamins C, K, B6, potassium', 130, NULL, 'https://falasteenifoodie.com/wp-content/uploads/2023/02/baba-ghanoush-2.jpeg'),
(3,4, 'Baklava', 'A sweet pastry made from layers of filo dough, chopped nuts, and syrup or honey. Its flaky texture and sweetness make it a popular Lebanese dessert.', 'Carbohydrates, fats, protein, fiber', 300, '[1, 2]', 'https://cleobuttera.com/wp-content/uploads/2018/03/lifted-baklava-720x540.jpg'),
(3,5, 'Beetroot Salad', 'A refreshing salad made from boiled beets, olive oil, garlic, and lemon juice. It is earthy, tangy, and vibrant.', 'Fiber, folate, potassium', 80, NULL, 'https://images.themodernproper.com/billowy-turkey/production/posts/2019/Moroccan-Beet-Salad-7.jpg?w=800&q=82&auto=format&fit=crop&dm=1599769045&s=847dc654bf1f80ba3a6feb91fabe03ff'),
(3,6, 'Bulgur', 'A quick-cooking cracked wheat used in salads like tabbouleh or as a side dish. Bulgur is a healthy, whole grain alternative to rice.', 'Fiber, protein, manganese, iron', 110, NULL, 'https://monkeyandmekitchenadventures.com/wp-content/uploads/2022/10/Middle-Eastern-Bulgur-Pilaf_10.jpg'),
(3,7, 'Falafel', 'Deep-fried balls of ground chickpeas, fava beans, or both, seasoned with herbs and spices. Typically served with tahini or stuffed into pita bread. A common street food in Lebanon.', 'Protein, fiber, vitamins A and C, iron, potassium', 333, NULL, 'https://tastythriftytimely.com/wp-content/uploads/2023/06/Falafel-5.jpg'),
(3,8, 'Fatayer', 'Small pastries stuffed with spinach, cheese, or meat. They’re baked and often served as an appetizer or snack.', 'Protein, carbohydrates, iron', 180, '[1]', 'https://www.themediterraneandish.com/wp-content/uploads/2023/12/Fatayer_20.jpg'),
(3,9, 'Fattoush', 'A Lebanese bread salad made from toasted or fried pita bread pieces mixed with fresh vegetables and dressed with olive oil and sumac. A zesty and tangy appetizer.', 'Fiber, vitamins A, C, K', 180, NULL, 'https://i0.wp.com/www.thedishonhealthy.com/wp-content/uploads/2021/05/Best-Fattoush-Recipe-.jpg?resize=982%2C982&ssl=1'),
(3,10, 'Foul Moudammas', 'A dish made from cooked fava beans, flavored with lemon, garlic, and olive oil. It’s often eaten for breakfast in Lebanon.', 'Fiber, protein, iron, magnesium', 180, NULL, 'https://www.themediterraneandish.com/wp-content/uploads/2020/01/foul-mudammas-recipe-10.jpg'),
(3,11, 'Freekeh', 'A roasted green wheat grain, cooked like rice, with a nutty flavor and chewy texture. Often served with vegetables, chicken, or meat.', 'Protein, fiber, magnesium, iron', 120, '[2]', 'https://www.themediterraneandish.com/wp-content/uploads/2022/06/how-to-cook-freekeh-5.jpg'),
(3,12, 'Ghorayebah', 'A shortbread-like Lebanese cookie made with butter, sugar, and flour. It’s crumbly, rich, and lightly sweetened.', 'Fats, carbohydrates', 150, '[1]', 'https://www.themediterraneandish.com/wp-content/uploads/2019/04/Butter-Cookie-Egyptian-Ghorayebah-10.jpg'),
(3,13, 'Green Beans with Garlic', 'Stewed green beans sautéed with garlic and olive oil, often served as a side dish. It’s light, flavorful, and nutritious.', 'Fiber, vitamins C, K', 60, NULL, 'https://www.inspiredtaste.net/wp-content/uploads/2021/10/Sauteed-Green-Beans-2-1200.jpg'),
(3,14, 'Halawet al Jibn', 'A dessert made from thin rolls of sweet cheese dough, filled with clotted cream and topped with syrup and pistachios.', 'Carbohydrates, protein, fats', 300, '[3, 4]', 'https://wheelofbaking.com/wp-content/uploads/halawet-el-jibn-1-20.jpg'),
(3,15, 'Halwa', 'A dense, sweet confection made from sesame paste and sugar, often flavored with pistachios or vanilla. It’s crumbly and rich.', 'Healthy fats, protein, fiber', 300, NULL, 'https://www.cookwithmanali.com/wp-content/uploads/2016/10/Karachi-Halwa-Bombay-Halwa-1014x1536.jpg'),
(3,16, 'Hummus', 'Creamy dip made from mashed chickpeas, tahini, olive oil, lemon juice, and garlic. It’s rich, nutty, and smooth, typically served as a mezze or with pita bread. Popular for its simple yet delicious flavor.',' Protein, fiber, healthy fats, vitamin B6, folate, iron', 170, NULL, 'https://www.twopeasandtheirpod.com/wp-content/uploads/2023/10/Hummus-8.jpg'),
(3,17, 'Kibbeh', 'A blend of ground meat (lamb or beef) mixed with bulgur wheat and spices, often shaped into balls or patties. Can be baked, fried, or served raw as a Lebanese delicacy.', 'Protein, carbohydrates, iron, zinc', 225, '[3, 1, 4]', 'https://feelgoodfoodie.net/wp-content/uploads/2020/10/Kibbeh-Balls-7.jpg'),
(3,18, 'Knafeh', 'A dessert made from thin noodle-like pastry soaked in sugar syrup, filled with cheese, and topped with crushed pistachios. Rich and sweet.', 'Carbohydrates, protein, fats, sugar', 450, '[3, 1, 2, 4]', 'https://cleobuttera.com/wp-content/uploads/2018/05/cheese-pull-knafeh.jpg'),
(3,19, 'Kofta', 'Grilled or baked minced meat mixed with spices, parsley, and onions, often shaped into skewers. Commonly served with rice, pita, or salad.', 'Protein, iron, zinc, vitamin B12', 280, '[4]', 'https://www.recipetineats.com/tachyon/2014/11/Lamb-Koftas_7.jpg?resize=900%2C1125&zoom=1'),
(3,20, 'Kousa Mahshi', 'Zucchini stuffed with rice and meat, cooked in tomato sauce. It’s a comforting and wholesome Lebanese dish.', 'Protein, fiber, vitamin C', 200, NULL, 'https://silkroadrecipes.com/wp-content/uploads/2022/03/Stuffed-Zucchini-Kousa-Mahshi-square.jpg');

INSERT INTO food_planner VALUES (4,1,'Aloo Gobi', 'A vegetarian curry made with potatoes and cauliflower, cooked with turmeric, cumin, and other spices. It’s wholesome and flavorful.', 'Carbohydrates, fiber, vitamin C', 150, NULL, 'https://www.cookingandme.com/wp-content/uploads/2014/07/14523274883_3b6177e82b_z.webp'),
(4,2,'Bhindi Masala', 'Stir-fried okra cooked with onions, tomatoes, and Indian spices. It’s light, healthy, and packed with nutrients.', 'Fiber, vitamin C, potassium', 120, NULL, 'https://mygoodfoodworld.com/wp-content/uploads/2023/01/bhindi-masala-served.jpg'),
(4,3,'Biryani', 'A flavorful rice dish made with basmati rice, aromatic spices, and either chicken, lamb, or vegetables. Served with yogurt or raita.', 'Carbohydrates, protein, fats', 360, NULL, 'https://ministryofcurry.com/wp-content/uploads/2024/06/chicken-biryani.jpg'),
(4,4,'Butter Chicken', 'A rich, creamy curry made with marinated chicken cooked in a spiced tomato-based sauce, popular in North Indian cuisine.', 'Protein, fats, carbohydrates', 490, '[3]', 'https://www.samaheats.com/wp-content/uploads/2024/03/Untitled-design-15-1152x1536.png'),
(4,5,'Chole Bhature', 'A dish from North India featuring spicy chickpea curry (chole) served with deep-fried bread (bhature). It’s hearty and satisfying.', 'Protein, carbohydrates, fiber', 450, '[1]', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Chole_Bhature_At_Local_Street.jpg/450px-Chole_Bhature_At_Local_Street.jpg'),
(4,6,'Dal Tadka', 'A simple, yet flavorful lentil dish prepared with yellow lentils (toor dal) and a tempering of spices. It’s a staple in Indian households.', 'Protein, fiber, iron', 180, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3oziLwg_SiqLHz2z2v7tbC8ipXkuqSS9jBw&s'),
(4,7,'Dhokla', 'A steamed savory cake made from fermented rice and chickpea batter, often served with chutney. It’s light and spongy.', 'Protein, fiber, carbohydrates', 150, NULL, 'https://rakskitchen.net/wp-content/uploads/2011/09/khaman-besan.jpg'),
(4,8,'Gulab Jamun', 'Deep-fried dough balls soaked in a sugar syrup flavored with cardamom or rose water. It’s rich and indulgent.', 'Carbohydrates, fats', 150, '[3]', 'https://bakewithzoha.com/wp-content/uploads/2023/04/gulab-jamun-2-scaled.jpg'),
(4,9,'Idli', 'A soft, steamed rice cake typically served with sambar and coconut chutney, common in South Indian breakfasts.', 'Carbohydrates, fiber, protein', 50, '[1]', 'https://www.ohmyveg.co.uk/wp-content/uploads/2023/07/Idli-1-scaled-e1722868852202-720x720.jpg'),
(4,10,'Masala Dosa', 'A thin, crispy rice crepe filled with a spiced potato filling, served with chutneys and sambar (lentil soup). A popular South Indian breakfast.', 'Carbohydrates, fiber, potassium', 160, '[1]', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1gPSMIK3sUiRUDNve5tgZh2FrCEAgpxb-tw&s'),
(4,11,'Palak Paneer', 'A vegetarian dish made from paneer (Indian cottage cheese) cooked in a smooth spinach gravy with spices, offering a healthy and nutritious meal.', 'Protein, calcium, iron, fiber', 190, '[3]', 'https://www.indianveggiedelight.com/wp-content/uploads/2023/02/palak-paneer-recipe.jpg'),
(4,12,'Paneer Tikka', 'Marinated cubes of paneer skewered and grilled, served as a vegetarian appetizer. It’s packed with flavor and nutrition.', 'Protein, calcium, fats', 280, '[3]', 'https://www.cookwithmanali.com/wp-content/uploads/2015/07/Restaurant-Style-Recipe-Paneer-Tikka.jpg'),
(4,13,'Pani Puri', 'A street food snack made from crispy puris filled with spiced water, tamarind chutney, and mashed potatoes or chickpeas.', 'Carbohydrates, fiber, vitamin C', 100, '[1]', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGc0xdwc2jMueJUdxuxSn6gnmM4oAukY1X3w&s'),
(4,14,'Pav Bhaji', 'A popular street food consisting of a spiced vegetable mash served with buttered bread rolls (pav). It’s indulgent and delicious.', 'Carbohydrates, fiber, fats', 400, '[1]', 'https://www.cookwithmanali.com/wp-content/uploads/2018/05/Best-Pav-Bhaji-Recipe.jpg'),
(4,15,'Pesarattu', 'A crepe made from green gram (moong dal) batter, often filled with onions and chilies, popular in Andhra Pradesh.', 'Protein, fiber, iron', 130, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9gtIlXWjURLFe-3q8r1aFZrCWaRkFh9Rjcw&s'),
(4,16,'Rajma (Kidney Bean Curry)', 'A North Indian dish made with kidney beans simmered in a spiced tomato gravy, usually served with rice.', 'Protein, fiber, iron', 220, NULL, 'https://www.indianhealthyrecipes.com/wp-content/uploads/2022/05/rajma-recipe-rajma-masala.jpg'),
(4,17,'Rasgulla', 'A Bengali dessert made from paneer, shaped into balls and soaked in sugar syrup. It’s soft, spongy, and sweet.', 'Carbohydrates, calcium', 140, '[3]', 'https://www.palatesdesire.com/wp-content/uploads/2015/08/Rasgulla_recipe@Palates_desire-scaled.jpg'),
(4,18,'Rogan Josh', 'A slow-cooked Kashmiri curry made with tender lamb, yogurt, and a blend of spices. It’s aromatic and flavorful.', 'Protein, fats, carbohydrates', 460, NULL, 'https://www.yummytummyaarthi.com/wp-content/uploads/2014/10/1-13.jpg'),
(4,19,'Samosa', 'A popular Indian snack made from a crispy pastry filled with spiced potatoes, peas, and sometimes meat. Served with chutneys.', 'Carbohydrates, fats', 150, '[1]', 'https://stewwithsaba.com/wp-content/uploads/2024/02/IMG_3902-edited.jpg'),
(4,20,'Tandoori Chicken', 'Chicken marinated in yogurt and spices, then roasted in a tandoor (clay oven), creating a smoky and spicy flavor.', 'Protein, fats, calcium', 260, '[3]', 'https://forkandtwist.com/wp-content/uploads/2021/07/barbequed_tandoori_chicken_3.jpg');

INSERT INTO food_planner VALUES (5,1,'Caldo de Res', 'A hearty beef and vegetable soup made with corn, carrots, potatoes, and zucchini. A comforting dish.', 'Protein, fiber, vitamins A and C, iron', 350, NULL, 'https://www.isabeleats.com/wp-content/uploads/2022/12/caldo-de-res-2-small-9.jpg'),
(5,2,'Carnitas', 'Slow-cooked, shredded pork, typically served with tortillas, salsa, and lime. Juicy and flavorful.','Protein, fat, iron', 400, NULL, 'https://www.allrecipes.com/thmb/kPCpDhyAub-NJoPEa7fqkyMhM7k=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/219048-pork-carnitas-DDMFS-4x3-71cbeba756924694b7af3f402342c9d7.jpg'),
(5,3,'Chilaquiles', 'Fried tortilla chips simmered in green or red salsa, topped with cheese, sour cream, and sometimes a fried egg.','Protein, calcium, carbs, vitamin C', 500, '[3, 1]', 'https://assets.epicurious.com/photos/62c4b089bfd689c61cf0ac8c/4:3/w_5013,h_3759,c_limit/Chilaquiles_RECIPE_062922_36571.jpg'),
(5,4,'Chiles en Nogada', 'A traditional dish featuring poblano chiles stuffed with meat, fruits, and spices, topped with walnut sauce and pomegranate seeds.', 'Protein, vitamins A and C, fiber, calcium', 500 , NULL, 'https://www.aceitesdeolivadeespana.com/wp-content/uploads/2019/05/receta_de_chiles_en_nogada-1000x768.jpeg'),
(5,5,'Elote', 'Grilled corn on the cob, topped with mayo, cheese, chili powder, and lime. Popular as a street snack.', 'Fiber, carbs, protein, calcium', 250, NULL, 'https://cdn.loveandlemons.com/wp-content/uploads/2023/06/elote-751x1024.jpg'),
(5,6,'Enchiladas', 'Corn tortillas filled with meat, cheese, or beans, rolled up and baked with chili sauce and cheese on top.', 'Protein, calcium, vitamin A, fiber', 400, '[3, 1]', 'https://www.recipetineats.com/tachyon/2020/03/Chicken-Enchiladas_1.jpg'),
(5,7,'Flautas', 'Rolled-up tortillas filled with chicken or beef, fried until crispy, and served with salsa and sour cream.', 'Protein, carbs, fiber, calcium', 300, NULL, 'https://lilluna.com/wp-content/uploads/2024/01/chicken-flautas-resize-7.jpg'),
(5,8,'Gorditas', 'Thick tortillas stuffed with various fillings, such as cheese, meat, or beans, and fried or grilled.', 'Carbs, protein, fiber, iron', 300, '[3, 1]', 'https://www.allrecipes.com/thmb/sxjKsgt2g2ZRNoUW0UUprTioAvY=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/78174-gorditas-DDMFS-014-4x3-053f8ba0a56843c6ba854301c88298f9.jpg'),
(5,9,'Guacamole', 'A creamy dip made from mashed avocado, lime, onions, tomatoes, and cilantro. Often served with tortilla chips.', 'Healthy fats (from avocado), fiber, vitamin E, potassium', 200, NULL, 'https://www.simplyrecipes.com/thmb/f0MLqxRI9Sv62wG3JO5MKoh1L-w=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Guacamole-LEAD-6-2-64cfcca253c8421dad4e3fad830219f6.jpg'),
(5,10,'Mole Poblano', 'A rich sauce made from chili peppers, chocolate, nuts, and spices, typically served over chicken or turkey.', 'Protein, fat, fiber, iron, magnesium', 600, '[2, 4]', 'https://assets.elgourmet.com/wp-content/uploads/2023/03/mole-_9IMJjkql3RCWT1eg6AHUD8PKyZLh7o-1024x683.png.webp'),
(5,11,'Pozole', 'A hominy-based soup made with pork or chicken, seasoned with garlic and chili, and garnished with radishes, lettuce, and lime.', 'Protein, fiber, vitamin C, iron', 350, NULL, 'https://media.admagazine.com/photos/618a62f751755659575563e0/master/w_1600,c_limit/76336.jpg'),
(5,12,'Quesadillas', 'Grilled tortillas filled with cheese, meat, or vegetables. Served with salsa, guacamole, or sour cream.', 'Protein, calcium, carbs, fiber', 300, '[3, 1]', 'https://www.simplyrecipes.com/thmb/YXIrmsOBXh5Cc5MAiBJgTaYO_0I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Simply-Recipes-Quesadilla-LEAD-1-b8e325610a7c46e1b6b6c2208d7ed4ee.jpg'),
(5,13,'Sopes', 'Thick corn tortillas topped with refried beans, meat, cheese, lettuce, and salsa. A popular street food in Mexico.', 'Carbs, protein, fiber, vitamins A and C', 200, '[3, 1]', 'https://www.muydelish.com/wp-content/uploads/2024/04/sope.jpg'),
(5,14,'Sopa de Lima', 'A tangy soup made with chicken, lime, and tortilla strips, often garnished with avocado and cilantro.', 'Protein, fiber, vitamin C', 250, NULL, 'https://mujer.com.mx/cdn/recipes/IRecipes_025887500157600729758_orig.jpg'),
(5,15,'Tacos al Pastor', 'Tacos al Pastor are made with marinated pork, pineapple, onions, cilantro, and salsa, served on corn tortillas. The pork is cooked on a vertical spit, similar to shawarma.', 'Protein, fat, fiber, vitamin C (from the salsa), carbs (tortilla)', 200, '[3, 1]', 'https://thecommunalfeast.com/wp-content/uploads/2021/09/2A94FB4E-8797-4BBA-9192-478DB91729F0-scaled.jpeg'),
(5,16,'Tacos de Pescado (Fish Tacos)', 'Soft tortillas filled with grilled or fried fish, topped with cabbage, salsa, and a squeeze of lime.', 'Protein, omega-3 fatty acids, fiber, vitamin C', 200, NULL,'https://www.196flavors.com/wp-content/uploads/2014/09/Fish-Tacos-3-FP.jpg'),
(5,17,'Tamales', 'Masa (corn dough) filled with meat, cheese, or vegetables, wrapped in corn husks, and steamed. It’s a common street food in Mexico.', 'Carbs, protein, fiber, iron', 300, '[3, 4]', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Chicken-Tamales_EXPS_TOHAM25_50905_P2_MD_04_17_3b.jpg'),
(5,18,'Tlayudas', 'Large, crispy tortillas topped with beans, cheese, avocado, and meat, like a Mexican pizza. A specialty from Oaxaca.', 'Protein, fiber, healthy fats, calcium', 400, NULL, 'https://www.feastingathome.com/wp-content/uploads/2017/04/Tlayluda-2.jpg'),
(5,19,'Torta', 'A Mexican sandwich made with a variety of fillings such as meats, beans, cheese, and avocado on a soft roll.', 'Protein, fiber, fat, carbs', 500, NULL, 'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/62FAD752-6853-4822-956D-C77F6F96D4E6/Derivates/92BABE34-B56B-42AC-A347-ACE3376EA303.jpg'),
(5,20,'Tostadas', 'Fried or baked tortillas topped with beans, meat, lettuce, cheese, and salsa. Crispy and versatile.', 'Protein, fiber, carbs, vitamin C', 250, NULL, 'https://guerrerotortillas.com/wp-content/uploads/2021/04/beef-tostadas.webp');

create table exercises (workout_id INT primary key NOT NULL, workout_name varchar(30), workout_desc varchar(100), cal_burned_per_hour int, video varchar(100));
insert into exercises (workout_id, workout_name, workout_desc, cal_burned_per_hour, video)
values 
(1, 'Burpees', 'Full-body exercise combining a squat, plank, and jump.', 550 ,'https://iconscout.com/lottie-animation/woman-doing-burpees-8161443'),
(2, 'Jump Squats', 'Explosive squat with a jump at the end.', 500, 'https://iconscout.com/lottie-animation/woman-doing-squat-jumps-8161437'),
(3, 'Jump Roping', 'Cardio exercise using a jump rope.', 600 , 'https://iconscout.com/lottie-animation/running-in-place-exercise-girl-8078308'),
(4, 'Running', 'Cardiovascular exercise involving sustained running',600, 'https://iconscout.com/lottie-animation/running-in-place-exercise-girl-8078308'),
(5, 'Mountain Climbers', 'Dynamic core exercise in a plank position.', 600,'https://iconscout.com/lottie-animation/mountain-climber-exercise-6255014'),

(6, 'Walking', 'Low-impact cardio exercise.', 250 ,'https://iconscout.com/lottie-animation/running-in-place-exercise-girl-8078308'),
(7, 'Knee Push Ups', 'Modified push ups with knees on the ground.', 250 , 'https://iconscout.com/lottie-animation/woman-doing-knee-push-ups-5080444'),
(8, 'Push Ups', 'Upper body strength exercise in a plank position', 400, 'https://iconscout.com/lottie-animation/woman-doing-push-ups-5080447'),
(9, 'Decline Push Ups', 'Push ups with feet elevated.', 450, 'https://iconscout.com/lottie-animation/woman-doing-decline-push-up-exercise-9439596'),
(10, 'Pike Push Up', 'Push up variant with hips in the air.', 400, 'https://iconscout.com/lottie-animation/girl-doing-pike-push-up-exercise-8121964'),

(11, 'Shoulder Taps', 'Core stabilization exercise from a plank, tapping shoulders.', 300, 'https://iconscout.com/lottie-animation/girl-doing-plank-shoulder-tap-exercise-8121968'),
(12, 'One Arm Row', 'Upper body strength exercise using one arm.', 350, 'https://iconscout.com/lottie-animation/aged-woman-doing-one-arm-dumbbell-rows-exercise-12566375'),
(13, 'Two Arm Row', 'Upper body strength exercise using both arms simultaneously.', 400, 'https://iconscout.com/lottie-animation/man-doing-barbell-pendlay-row-exercise-for-back-11095297'),
(14, 'Pull Ups', 'Upper body pulling exercise using a bar.', 600, 'https://iconscout.com/lottie-animation/female-doing-pullups-11966200'),
(15, 'Squats', 'Lower body strength exercise bending knees and hips.', 400, 'https://iconscout.com/lottie-animation/woman-doing-squats-8161438'),

(16, 'Forward Lunge', 'Lower body exercise stepping forward into a lunge.', 350,'https://iconscout.com/lottie-animation/woman-doing-left-leg-forward-lunge-exercise-8845343'),
(17, 'Backward Lunge', 'Lower body exercise stepping backward into a lunge.',350, 'https://iconscout.com/lottie-animation/woman-doing-left-leg-reverse-lunge-exercise-8845344'),
(18, 'Bulgarian Split Squat', 'Lower body exercise with one foot elevated.', 400,'https://iconscout.com/lottie-animation/woman-doing-bulgarian-split-squat-exercise-8845338'),
(19, 'Planks', 'Core exercise holding a plank position.', 250 ,'https://iconscout.com/lottie-animation/aged-woman-doing-plank-exercise-12566383'),
(20, 'Side Plank', 'Core exercise in a sideways plank position.', 250,'https://iconscout.com/lottie-animation/side-plank-exercise-6255035'),

(21, 'Crunches', 'Core exercise involving curling the upper body.', 300, 'https://iconscout.com/lottie-animation/aged-woman-doing-crunches-exercise-12566379'),
(22, 'Leg Raise', 'Core exercise lifting legs while lying down.', 250,'https://iconscout.com/lottie-animation/lying-leg-raise-exercise-girl-8160923'),
(23, 'Sit Ups', 'Core exercise lifting upper body from a supine position.', 300, 'https://iconscout.com/lottie-animation/woman-doing-crunches-8161445'),
(24, 'Bridges', 'Lower body and core exercise lifting hips off the ground.', 250 ,'https://iconscout.com/lottie-animation/aged-woman-doing-back-bridge-exercise-12566377'),
(25, 'Single Leg Bridges', 'Variation of bridge exercise using one leg.', 300,'https://iconscout.com/lottie-animation/woman-doing-single-leg-glute-bridge-exercise-9439552'),

(26, 'V-ups','Lie on your back and simultaneously lift your legs and upper body to form a "V" shape,', 200,'https://iconscout.com/lottie-animation/fitness-woman-doing-v-up-exercise-10067370'),
(27, 'Supermans','Lie face down and lift your arms and legs off the ground, mimicking a flying "Superman" ',100,'https://iconscout.com/lottie-animation/the-superman-exercise-girl-8146420'),
(28, 'Russian Twists',' Sit with your legs elevated, twist your torso side to side',450,'https://iconscout.com/lottie-animation/russian-twist-10112725'),
(29, 'jumping jacks',' Jump while spreading your legs and raising your arms overhead',500,'https://iconscout.com/lottie-animation/jumping-jack-exercise-girl-8160916'),
(30, 'sumo squats',' Perform a squat with your feet placed wider than shoulder-width',400,'https://iconscout.com/lottie-animation/sumo-squat-exercise-8018809');

create table goals (goal_id INTEGER primary key, goal_name VARCHAR(40));
insert into goals values (1, 'weight gain'),(2, 'weight loss'),(3, 'maintain');

create table users (u_id INTEGER PRIMARY KEY AUTO_INCREMENT, u_name VARCHAR(255), u_age INTEGER, u_gender VARCHAR(10), u_height FLOAT, u_weight FLOAT, u_region INTEGER, u_allergies INTEGER, goal INTEGER, foreign key (u_region) references region(region_id), foreign key (goal) references goals(goal_id), foreign key (u_allergies) references allergies(allergy_id));

CREATE TABLE user_calories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    calories_needed DECIMAL(6,2) NOT NULL,
    date_calculated DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(u_id) ON DELETE CASCADE
);


DELIMITER $$

-- calculate calories
CREATE FUNCTION calculate_calories(age INT, height FLOAT, weight FLOAT, gender CHAR(1))
RETURNS FLOAT
DETERMINISTIC  
BEGIN
    DECLARE calories FLOAT;

    IF gender = 'M' THEN
        SET calories = 10 * weight + 6.25 * height - 5 * age + 5;  -- Mifflin-St Jeor Equation for men
    ELSE
        SET calories = 10 * weight + 6.25 * height - 5 * age - 161; -- Mifflin-St Jeor Equation for women
    END IF;

    RETURN calories;
END$$

DELIMITER ;

 DELIMITER //
-- recommendations of food and exercise
CREATE PROCEDURE GetRecommendations(IN user_id INT)
 BEGIN
     DECLARE user_calories DECIMAL(6,2);
     DECLARE user_goal INT;
     DECLARE user_region INT;
     DECLARE user_allergy INT;
     DECLARE calorie_status VARCHAR(20);

     -- Get user's required calories, goal, region, and allergies
     SELECT 
         uc.calories_needed,
         u.goal,
         u.u_region,
         u.u_allergies
     INTO 
         user_calories,
         user_goal,
         user_region,
         user_allergy
     FROM user_calories uc
     JOIN users u ON u.u_id = uc.user_id
     WHERE uc.user_id = user_id
     AND uc.date_calculated = CURDATE();

     -- Check if user data was found
     IF user_calories IS NULL THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User data not found for provided user_id.';
     END IF;

     -- Determine calorie status
     SET calorie_status = CASE 
         WHEN user_calories > 2500 THEN 'high'
         WHEN user_calories < 1500 THEN 'low'
         ELSE 'moderate'
     END;

     -- Food Recommendations with Random Selection
     SELECT 
         f.food_name,
         f.food_description,
         f.calories,
         f.nutrient_value,
         f.image_url
     FROM food_planner f
     WHERE f.food_region_id = user_region
     AND JSON_CONTAINS(f.prevent_if_allergy, CAST(user_allergy AS CHAR)) = 0
     AND (
         SELECT SUM(f2.calories)
         FROM food_planner f2
         WHERE f2.food_region_id = user_region
         AND JSON_CONTAINS(f2.prevent_if_allergy, CAST(user_allergy AS CHAR)) = 0
     ) <= user_calories + 500
     GROUP BY f.food_name, f.food_description, f.calories, f.nutrient_value, f.image_url
     ORDER BY RAND(DAYOFYEAR(CURDATE())) -- Randomize recommendations based on current date
     LIMIT 5;

     -- Exercise Recommendations 
     SELECT 
         e.workout_name,
         e.workout_desc,
         e.cal_burned_per_hour,
         e.video,
         CASE 
             WHEN calorie_status = 'high' THEN 'Recommended duration: 45-60 minutes'
             WHEN calorie_status = 'low' THEN 'Recommended duration: 20-30 minutes'
             ELSE 'Recommended duration: 30-45 minutes'
         END AS recommended_duration
     FROM exercises e
     WHERE CASE 
         WHEN user_goal = 1 AND calorie_status = 'high' THEN e.cal_burned_per_hour >= 500
         WHEN user_goal = 1 AND calorie_status = 'moderate' THEN e.cal_burned_per_hour BETWEEN 300 AND 500
         WHEN user_goal = 1 AND calorie_status = 'low' THEN e.cal_burned_per_hour BETWEEN 200 AND 300
         WHEN user_goal = 2 AND calorie_status = 'high' THEN e.cal_burned_per_hour BETWEEN 200 AND 300
         WHEN user_goal = 2 AND calorie_status = 'moderate' THEN e.cal_burned_per_hour BETWEEN 300 AND 400
         WHEN user_goal = 2 AND calorie_status = 'low' THEN e.cal_burned_per_hour >= 400
         ELSE e.cal_burned_per_hour BETWEEN 200 AND 400
     END
     GROUP BY e.workout_name, e.workout_desc, e.cal_burned_per_hour, e.video
     LIMIT 3;
     
     -- Insert recommendations into daily_recommendations table
     INSERT INTO daily_recommendations (user_id, recommendation_date, food_recommendations, exercise_recommendations)
     VALUES (user_id, CURDATE(), food_recommendations, exercise_recommendations)
     ON DUPLICATE KEY UPDATE
         food_recommendations = VALUES(food_recommendations),
         exercise_recommendations = VALUES(exercise_recommendations);

 END //

 DELIMITER ; 


-- reminders
CREATE TABLE user_reminder (
	r_id INT AUTO_INCREMENT,
    r_user_id INT ,
    PRIMARY KEY(r_id, r_user_id),
    frequency_minutes INT NOT NULL,
    last_reminder TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_id FOREIGN KEY (r_user_id) REFERENCES users(u_id) 
);


DELIMITER //

CREATE FUNCTION provide_reminder(r_user_id INT) RETURNS VARCHAR(255)
deterministic
BEGIN
    DECLARE time_elapsed INT;
    DECLARE reminder_message VARCHAR(255);

    -- Calculate the time difference in minutes since the last reminder
    SELECT TIMESTAMPDIFF(MINUTE, last_reminder, NOW())
    INTO time_elapsed
    FROM user_reminder
    WHERE r_user_id = r_user_id;

    -- Check if the elapsed time meets or exceeds the frequency
    IF time_elapsed >= (SELECT frequency_minutes FROM user_reminder WHERE r_user_id = r_user_id) THEN
        -- Update the last reminder timestamp
        UPDATE user_reminder
        SET last_reminder = NOW()
        WHERE r_user_id = r_user_id;

        -- Set reminder message
        SET reminder_message = CONCAT("Reminder sent to user with ID ", r_user_id, " at ", NOW());
    ELSE
        -- No reminder needed
        SET reminder_message = CONCAT("No reminder sent. Only ", time_elapsed, " minutes since last reminder.");
    END IF;

    RETURN reminder_message;
END //

DELIMITER ;

DELIMITER //

-- admin
CREATE TABLE admin_fittrack (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    admin_password VARCHAR(128) NOT NULL
);

INSERT INTO admin_fittrack (username, email, admin_password)
VALUES ('fittrack', 'fittrack@gmail.com', 'fittrack_admin');

CREATE USER 'fittrack'@'localhost' IDENTIFIED BY 'fittrack_admin';
GRANT ALL PRIVILEGES ON miniproject_trial.* TO 'fittrack'@'localhost';


CREATE VIEW user_region_statistics AS
SELECT u_region, COUNT(*) AS user_count
FROM users  
GROUP BY u_region;


DELIMITER $$

CREATE PROCEDURE add_food_item(
    IN region_id_param INT,
    IN food_name_param VARCHAR(255),
    IN food_description_param VARCHAR(500),
    IN nutrient_value_param VARCHAR(255),
    IN calories_param INT,
    IN prevent_if_allergy_param JSON,  
    IN image_url_param VARCHAR(255)
)
BEGIN
    DECLARE food_id_var INT;

    -- Calculate the next food_id for this region
    SELECT (count(food_region_id) + 1) INTO food_id_var
    FROM food_planner
    WHERE food_region_id = region_id_param;

    -- Insert the new food item into the food_planner table
    INSERT INTO food_planner (
        food_region_id, food_id, food_name, food_description, nutrient_value, calories, prevent_if_allergy, image_url
    )
    VALUES (
        region_id_param, food_id_var, food_name_param, food_description_param, nutrient_value_param, calories_param, prevent_if_allergy_param, image_url_param
    );
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE edit_food_item(
    IN region_id_param INT,
    IN food_name_param VARCHAR(255),
    IN field VARCHAR(255),  
    IN new_value TEXT 
)
BEGIN
    IF field = 'food_description' THEN
        UPDATE food_planner
        SET food_description = new_value
        WHERE food_region_id = region_id_param AND food_name = food_name_param;
    ELSEIF field = 'nutrient_value' THEN
        UPDATE food_planner
        SET nutrient_value = new_value
        WHERE food_region_id = region_id_param AND food_name = food_name_param;
    ELSEIF field = 'calories' THEN
        UPDATE food_planner
        SET calories = CAST(new_value AS UNSIGNED)
        WHERE food_region_id = region_id_param AND food_name = food_name_param;
    ELSEIF field = 'prevent_if_allergy' THEN
        UPDATE food_planner
        SET prevent_if_allergy = CAST(new_value AS JSON)
        WHERE food_region_id = region_id_param AND food_name = food_name_param;
    ELSEIF field = 'image_url' THEN
        UPDATE food_planner
        SET image_url = new_value
        WHERE food_region_id = region_id_param AND food_name = food_name_param;
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE delete_food_item(
    IN region_id_param INT,
    IN food_name_param VARCHAR(100)
)
BEGIN
    DELETE FROM food_planner
    WHERE food_region_id = region_id_param AND food_name = food_name_param;
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE add_exercise(
    -- IN workout_id_param INT,
    IN workout_name_param VARCHAR(30),
    IN workout_desc_param VARCHAR(100),
    IN cal_burned_per_hour_param INT,
    IN video_param VARCHAR(100)
)
BEGIN
    DECLARE workout_id_param INT;

    -- Calculate the next workout_id
    SELECT (count(workout_id) + 1) INTO workout_id_param
    FROM exercises;

    -- Insert the new exercise in the exercise table
    INSERT INTO exercises (
					workout_id, workout_name, workout_desc, cal_burned_per_hour, video
	)
    VALUES (
		workout_id_param, workout_name_param, workout_desc_param, cal_burned_per_hour_param, video_param 
	);
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE edit_exercises(
    IN workout_name_param VARCHAR(255),
    IN field VARCHAR(255),  
    IN new_value TEXT  
)
BEGIN
    IF field = 'workout_desc' THEN
        UPDATE exercises
        SET workout_desc = new_value
        WHERE workout_name= workout_name_param;
    ELSEIF field = 'cal_burned_per_hour' THEN
        UPDATE exercises
        SET cal_burned_per_hour = CAST(new_value AS UNSIGNED)
        WHERE workout_name= workout_name_param;
    ELSEIF field = 'video' THEN
        UPDATE exercises
        SET video = new_value
        WHERE workout_name= workout_name_param;
    END IF;
END$$


DELIMITER ;


DELIMITER $$

CREATE PROCEDURE delete_exercises(
    IN workout_name_param VARCHAR(100)
)
BEGIN
    DELETE FROM exercises
    WHERE workout_name= workout_name_param;
END$$

DELIMITER ;


create table weekly_report(id INT PRIMARY KEY auto_increment, user_id INT, FOREIGN KEY(user_id) references users(u_id), start_date Date, end_date Date, food_recommendations JSON, exercise_recommendations JSON);

DELIMITER //


DELIMITER //

CREATE PROCEDURE GenerateWeeklyReport(IN user_id INT)
BEGIN
    DECLARE start_date DATE;
    DECLARE end_date DATE;
    DECLARE curr_date DATE;

    -- Define date range for the current week
    SET start_date = CURDATE() - INTERVAL (DAYOFWEEK(CURDATE()) - 1) DAY;
    SET end_date = start_date + INTERVAL 6 DAY;
    SET curr_date = CURDATE();

    -- Ensure recommendations for the current day are generated
    CALL GetRecommendations(user_id);

    -- Mark unpopulated days as "Not yet recommended"
    INSERT INTO weekly_report (user_id, start_date, end_date, recommendation_date, food_recommendations, exercise_recommendations)
    SELECT 
        user_id,
        start_date,
        end_date,
        day_date,
        JSON_ARRAY('Not yet recommended'),
        JSON_ARRAY('Not yet recommended')
    FROM (
        SELECT start_date + INTERVAL day_num DAY AS day_date
        FROM (
            SELECT 0 AS day_num UNION ALL SELECT 1 UNION ALL SELECT 2 
            UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
        ) AS days
    ) AS week_dates
    WHERE day_date BETWEEN start_date AND end_date
    AND NOT EXISTS (
        SELECT 1 
        FROM weekly_report 
        WHERE user_id = user_id 
        AND recommendation_date = day_date
    );

END //

DELIMITER ;












alter table weekly_report modify id INT auto_increment;

select u_id from users;

CREATE TABLE daily_recommendations (
    user_id INT,
    recommendation_date DATE,
    food_recommendations JSON,
    exercise_recommendations JSON,
    PRIMARY KEY (user_id, recommendation_date),
    FOREIGN KEY (user_id) REFERENCES users(u_id) 
        ON DELETE CASCADE  -- or ON DELETE SET NULL if you want to keep the recommendations
        ON UPDATE CASCADE
);


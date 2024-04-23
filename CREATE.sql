/*
SQLyog - Free MySQL GUI v5.02
Host - 5.5.27 : Database - venkat
*********************************************************************
Server version : 5.5.27
*/


create database if not exists `venkat`;

USE `venkat`;

SET FOREIGN_KEY_CHECKS=0;

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TITLE_UNIQUE` (`title`),
  KEY `FK_INSTRUCTOR_idx` (`instructor_id`),
  CONSTRAINT `FK_INSTRUCTOR` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `course` */

insert into `course` values (10,'java',1);
insert into `course` values (11,'phython',2);
insert into `course` values (12,'dev ops',3);

/*Table structure for table `course_student` */

DROP TABLE IF EXISTS `course_student`;

CREATE TABLE `course_student` (
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`student_id`),
  KEY `FK_STUDENT_idx` (`student_id`),
  CONSTRAINT `FK_COURSE_05` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_STUDENT` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `course_student` */

insert into `course_student` values (10,1);
insert into `course_student` values (11,1);
insert into `course_student` values (12,1);
insert into `course_student` values (10,2);
insert into `course_student` values (12,2);
insert into `course_student` values (12,3);

/*Table structure for table `instructor` */

DROP TABLE IF EXISTS `instructor`;

CREATE TABLE `instructor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `instructor_detail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DETAIL_idx` (`instructor_detail_id`),
  CONSTRAINT `FK_DETAIL` FOREIGN KEY (`instructor_detail_id`) REFERENCES `instructor_detail` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `instructor` */

insert into `instructor` values (1,'John','Doe','john.doe@example.com',1);
insert into `instructor` values (2,'Jane','Smith','jane.smith@example.com',2);
insert into `instructor` values (3,'Michael','Johnson','michael.johnson@example.com',3);

/*Table structure for table `instructor_detail` */

DROP TABLE IF EXISTS `instructor_detail`;

CREATE TABLE `instructor_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `youtube_channel` varchar(128) DEFAULT NULL,
  `hobby` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `instructor_detail` */

insert into `instructor_detail` values (1,'www.luv2code.com','hobby_1');
insert into `instructor_detail` values (2,'www.telusuko.com','hobby_2');
insert into `instructor_detail` values (3,'www.cglia.com','hobby_3');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_quantity` int(11) DEFAULT NULL,
  `ordered_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `product_id_idx` (`product_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

/*Data for the table `orders` */

insert into `orders` values (41,1,1,2,'2023-05-30');
insert into `orders` values (42,1,1,2,'2023-05-30');
insert into `orders` values (43,2,1,1,'2023-05-30');
insert into `orders` values (44,4,1,1,'2023-05-30');
insert into `orders` values (45,8,1,1,'2023-05-30');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `category` varchar(500) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `image` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert into `products` values (1,'New Arrival Femal Shoes','Female Shoes',120.00,'female-shoes.jpg');
insert into `products` values (2,'Ladies Pure PU Shoulder Bag','Ladis Bag',69.99,'ladis-bag.jpg');
insert into `products` values (3,'Stylish Men Office Suits','Men Clothes',169.00,'men-suits.jpg');
insert into `products` values (4,'Jaeger-LeCoultre Men Watch','Men Watch',2500.99,'men-watch.jpg');
insert into `products` values (5,'red color saree','women saree',310.00,'saree-orange-color.jpg');
insert into `products` values (6,'nykaa stunning look red lipstick','beauty lipstick',555.50,'red-color-lipstick.jpg');
insert into `products` values (7,'Stunning Look For Boys','Male Shoes',500.60,'boys-shoes-white.jpg');
insert into `products` values (8,'Ladies Pure PU Shoulder Bag','Ladies Bag',120.99,'ladies-bag-pink.jpg');
insert into `products` values (9,'Ladies Traditional Wear Yellow Saree','Women Clothes',1239.23,'yellow-saree.jpg');
insert into `products` values (10,'Fasttrack Stylish Men Watch','Men Watch',2500.99,'fasttrack-watch.jpg');
insert into `products` values (11,'Latest black dress Trending','Women Clothes',12.39,'black-dress.jpg');
insert into `products` values (12,'Party Wear for Hot and Slim Girls','Women Clothes',1.36,'party-wear.jpg');
insert into `products` values (15,'Nike Mens Running Shoes','Running Shoes',9.99,'Nike-Mens-Running-Shoes.jpg');
insert into `products` values (16,'Levis Womens Skinny Jeans','Skinny Jeans',19.99,'Levis-Womens-Skinny-Jeans.jpg');
insert into `products` values (17,'Adidas Unisex Sports T-shirt','Sports T-shirt',14.99,'Adidas-Unisex-Sports-T-shirt.jpg');
insert into `products` values (18,'Puma Mens Casual Sneakers','Casual Sneakers',24.99,'Puma-Mens-Casual-Sneakers.jpg');
insert into `products` values (19,'Vero Moda Womens Floral Dress','Floral Dress',11.99,'Vero-Moda-Womens-Floral-Dress.jpg');
insert into `products` values (20,'Reebok Mens Training Shorts','Training Shorts',9.99,'Reebok-Mens-Training-Shorts.jpg');
insert into `products` values (21,'U.S. Polo Assn. Mens Polo Shirt','Polo Shirt',19.99,'U.S.Polo-Assn.Mens-Polo-Shirt.jpg');
insert into `products` values (22,'Forever 21 Womens Crop Top','Crop Top',14.99,'Forever-21-Womens-Crop-Top.jpg');
insert into `products` values (23,'Tommy Hilfiger Mens Watch','Watch',24.99,'Tommy-Hilfiger-Mens-Watch.jpg');
insert into `products` values (24,'H&M Womens Denim Jacket','Denim Jacket',11.99,'H&M-Womens-Denim-Jacket.jpg');
insert into `products` values (25,'Allen Solly Mens Formal Shirt','Formal Shirt',9.99,'Allen-Solly-Mens-Formal-Shirt.jpg');
insert into `products` values (26,'Mango Womens Printed Skirt','Printed Skirt',19.99,'Mango-Womens-Printed-Skirt.jpg');
insert into `products` values (27,'Van Heusen Mens Slim Fit Trousers','Slim Fit Trousers',14.99,'Van-Heusen-Mens-Slim-Fit-Trousers.jpg');
insert into `products` values (28,'Zara Womens Leather Boots','Leather Boots',24.99,'Zara-Womens-Leather-Boots.jpg');
insert into `products` values (29,'Jack & Jones Mens Hoodie','Hoodie',11.99,'Jack&Jones-Mens-Hoodie.jpg');
insert into `products` values (30,'Only Womens Striped Top','Striped Top',9.99,'Only-Womens-Striped-Top.jpg');
insert into `products` values (31,'Woodland Mens Outdoor Sandals','Outdoor Sandals',19.99,'Woodland-Mens-Outdoor-Sandals.jpg');
insert into `products` values (32,'Biba Womens Ethnic Kurti','Ethnic Kurti',14.99,'Biba-Womens-Ethnic-Kurti.jpg');
insert into `products` values (33,'Raymond Mens Suit','Suit',24.99,'Raymond-Mens-Suit.jpg');
insert into `products` values (34,'United Colors of Benetton Womens Sweater','Sweater',11.99,'United-Colors-of-Benetton-Womens-Sweater.jpg');
insert into `products` values (35,'Hush Puppies Mens Formal Shoes','Formal Shoes',9.99,'Hush-Puppies-Mens-Formal-Shoes.jpg');
insert into `products` values (36,'Dorothy Perkins Womens Lace Dress','Lace Dress',19.99,'Dorothy-Perkins-Womens-Lace-Dress.jpg');
insert into `products` values (37,'Arrow Mens Checkered Shirt','Checkered Shirt',14.99,'Arrow-Mens-Checkered-Shirt.jpg');
insert into `products` values (38,'Mango Womens High-Waisted Jeans','High-Waisted Jeans',24.99,'Mango-Womens-High-Waisted-Jeans.jpg');
insert into `products` values (39,'Puma Unisex Backpack','Backpack',11.99,'Puma-Unisex-Backpack.jpg');
insert into `products` values (40,'Levis Mens Denim Jacket','Denim Jacket',9.99,'Levis-Mens-Denim-Jacket.jpg');
insert into `products` values (41,'Adidas Womens Running Shoes','Running Shoes',19.99,'Adidas-Womens-Running-Shoes.jpg');
insert into `products` values (42,'Reebok Mens Track Pants','Track Pants',14.99,'Reebok-Mens-Track-Pants.jpg');
insert into `products` values (43,'Vero Moda Womens Blouse','Blouse',24.99,'Vero-Moda-Womens-Blouse.jpg');
insert into `products` values (44,'Nike Mens Basketball Shorts','Basketball Shorts',9.99,'Nike-Mens-Basketball-Shorts.jpg');
insert into `products` values (45,'Only Womens Jumpsuit','Jumpsuit',19.99,'Only-Womens-Jumpsuit.jpg');
insert into `products` values (46,'Van Heusen Mens Formal Trousers','Formal Trousers',14.99,'Van-Heusen-Mens-Formal-Trousers.jpg');
insert into `products` values (47,'Tommy Hilfiger Womens Crossbody Bag','Crossbody Bag',24.99,'Tommy-Hilfiger-Womens-Crossbody-Bag.jpg');
insert into `products` values (48,'Woodland Mens Leather Belt','Leather Belt',11.99,'Woodland-Mens-Leather-Belt.jpg');
insert into `products` values (49,'H&M Mens Casual Shirt','Casual Shirt',9.99,'H&M-Mens-Casual-Shirt.jpg');
insert into `products` values (50,'Biba Womens Anarkali Suit','Anarkali Suit',19.99,'Biba-Womens-Anarkali-Suit.jpg');
insert into `products` values (51,'United Colors of Benetton Mens Polo T-shirt','Polo T-shirt',14.99,'United-Colors-of-Benetton-Mens-Polo-T-shirt.jpg');
insert into `products` values (52,'Jack & Jones Mens Slim Fit Jeans','Slim Fit Jeans',24.99,'Jack&Jones-Mens-Slim-Fit-Jeans.jpg');
insert into `products` values (53,'Allen Solly Womens Printed Top','Printed Top',11.99,'Allen-Solly-Womens-Printed-Top.jpg');
insert into `products` values (54,'Raymond Mens Ethnic Sherwani','Ethnic Sherwani',9.99,'Raymond-Mens-Ethnic-Sherwani.jpg');
insert into `products` values (55,'Nike Womens Running Shorts','Running Shorts',19.99,'Nike-Womens-Running-Shorts.jpg');
insert into `products` values (56,'Levis Mens Straight Fit Jeans','Straight Fit Jeans',14.99,'Levis-Mens-Straight-Fit-Jeans.jpg');
insert into `products` values (57,'Adidas Mens Sports Jacket','Sports Jacket',24.99,'Adidas-Mens-Sports-Jacket.jpg');
insert into `products` values (58,'Puma Womens Training Leggings','Training Leggings',11.99,'Puma-Womens-Training-Leggings.jpg');
insert into `products` values (59,'Vero Moda Womens Maxi Dress','Maxi Dress',9.99,'Vero-Moda-Womens-Maxi-Dress.jpg');
insert into `products` values (60,'Reebok Mens Workout T-shirt','Workout T-shirt',19.99,'Reebok-Mens-Workout-T-shirt.jpg');
insert into `products` values (61,'U.S. Polo Assn. Womens Polo Shirt','Polo Shirt',14.99,'U.S.Polo-Assn.Womens-Polo-Shirt.jpg');
insert into `products` values (62,'Forever 21 Womens Denim Shorts','Denim Shorts',24.99,'Forever-21-Womens-Denim-Shorts.jpg');
insert into `products` values (63,'Tommy Hilfiger Mens Leather Wallet','Leather Wallet',11.99,'Tommy-Hilfiger-Mens-Leather-Wallet.jpg');
insert into `products` values (64,'H&M Mens Chino Pants','Chino Pants',9.99,'H&M-Mens-Chino-Pants.jpg');
insert into `products` values (65,'Allen Solly Womens Blazer','Womens Blazer',19.99,'Allen-Solly-Womens-Blazer.jpg');
insert into `products` values (66,'Mango Mens Printed Shirt','Printed Shirt',14.99,'Mango-Mens-Printed-Shirt.jpg');
insert into `products` values (67,'Van Heusen Womens Formal Trousers','Formal Trousers',24.99,'Van-Heusen-Womens-Formal-Trousers.jpg');
insert into `products` values (68,'Zara Mens Sneakers','Sneakers',11.99,'Zara-Mens-Sneakers.jpg');
insert into `products` values (69,'Jack & Jones Mens Graphic T-shirt','Graphic T-shirt',19.99,'Jack&Jones-Mens-Graphic-T-shirt.jpg');
insert into `products` values (70,'Only Womens Ruffled Skirt','Ruffled Skirt',14.99,'Only-Womens-Ruffled-Skirt.jpg');
insert into `products` values (71,'Woodland Mens Hiking Boots','Hiking Boots',24.99,'Woodland-Mens-Hiking-Boots.jpg');
insert into `products` values (72,'Biba Womens Palazzo Pants','Palazzo Pants',11.99,'Biba-Womens-Palazzo-Pants.jpg');
insert into `products` values (73,'Raymond Mens Formal Blazer','Formal Blazer',9.99,'Raymond-Mens-Formal-Blazer.jpg');
insert into `products` values (74,'United Colors of Benetton Womens Trench Coat','Womens Trench Coat',19.99,'United-Colors-of-Benetton-Womens-Trench-Coat.jpg');
insert into `products` values (75,'Nike Mens Basketball Shoes','Basketball Shoes',14.99,'Nike-Mens-Basketball-Shoes.jpg');
insert into `products` values (76,'Levis Womens Bootcut Jeans','Bootcut Jeans',24.99,'Levis-Womens-Bootcut-Jeans.jpg');
insert into `products` values (77,'Adidas Unisex Cap','Cap',11.99,'Adidas-Unisex-Cap.jpg');
insert into `products` values (78,'Puma Mens Track Jacket','Track Jacket',9.99,'Puma-Mens-Track-Jacket.jpg');
insert into `products` values (79,'Vero Moda Womens Knit Sweater','Knit Sweater',19.99,'Vero-Moda-Womens-Knit-Sweater.jpg');
insert into `products` values (80,'Reebok Womens Sports Bra','Sports Bra',14.99,'Reebok-Womens-Sports-Bra.jpg');
insert into `products` values (81,'U.S. Polo Assn. Mens Casual Shirt','Casual Shirt',24.99,'U.S.Polo-Assn.Mens-Casual-Shirt.jpg');
insert into `products` values (82,'Forever 21 Womens Pleated Skirt','Pleated Skirt',11.99,'Forever-21-Womens-Pleated-Skirt.jpg');
insert into `products` values (83,'Tommy Hilfiger Mens Polo T-shirt','Polo T-shirt',9.99,'Tommy-Hilfiger-Mens-Polo-T-shirt.jpg');
insert into `products` values (84,'H&M Womens Wide-Leg Pants','Wide-Leg Pants',19.99,'H&M-Womens-Wide-Leg-Pants.jpg');
insert into `products` values (85,'Allen Solly Mens Casual Trousers','Casual Trousers',14.99,'Allen-Solly-Mens-Casual-Trousers.jpg');
insert into `products` values (86,'Mango Womens Striped Blouse','Striped Blouse',24.99,'Mango-Womens-Striped-Blouse.jpg');
insert into `products` values (87,'Van Heusen Mens Dress Shoes','Dress Shoes',11.99,'Van-Heusen-Mens-Dress-Shoes.jpg');
insert into `products` values (88,'Zara Womens Tote Bag','Tote Bag',9.99,'Zara-Womens-Tote-Bag.jpg');
insert into `products` values (89,'Jack & Jones Mens Denim Shorts','Denim Shorts',19.99,'Jack&Jones-Mens-Denim-Shorts.jpg');
insert into `products` values (90,'Only Womens Floral Jumpsuit','Floral Jumpsuit',14.99,'Only-Womens-Floral-Jumpsuit.jpg');
insert into `products` values (91,'Woodland Mens Outdoor Jacket','Outdoor Jacket',24.99,'Woodland-Mens-Outdoor-Jacket.jpg');
insert into `products` values (92,'Biba Womens Cotton Kurti','Cotton Kurti',11.99,'Biba-Womens-Cotton-Kurti.jpg');
insert into `products` values (93,'Raymond Mens Casual T-shirt','Casual T-shirt',9.99,'Raymond-Mens-Casual-T-shirt.jpg');
insert into `products` values (94,'United Colors of Benetton Womens Cardigan','Cardigan',19.99,'United-Colors-of-Benetton-Womens-Cardigan.jpg');
insert into `products` values (95,'Nike Womens Tennis Shoes','Tennis Shoes',14.99,'Nike-Womens-Tennis-Shoes.jpg');
insert into `products` values (96,'Levis Mens Slim Fit T-shirt','Slim Fit T-shirt',24.99,'Levis-Mens-Slim-Fit-T-shirt.jpg');
insert into `products` values (97,'Adidas Mens Soccer Cleats','Soccer Cleats',11.99,'Adidas-Mens-Soccer-Cleats.jpg');
insert into `products` values (98,'Puma Womens Training Tank Top','Training Tank Top',9.99,'Puma-Womens-Training-Tank-Top.jpg');
insert into `products` values (99,'Vero Moda Womens Wrap Dress','Wrap Dress',19.99,'Vero-Moda-Womens-Wrap-Dress.jpg');
insert into `products` values (100,'Reebok Mens Running Shorts','Running Shorts',14.99,'Reebok-Mens-Running-Shorts.jpg');
insert into `products` values (101,'U.S. Polo Assn. Womens V-neck Sweater','V-neck Sweater',24.99,'U.S.Polo-Assn.Womens-V-neck-Sweater.jpg');
insert into `products` values (102,'Forever 21 Womens Skinny Jeans','Skinny Jeans',11.99,'Forever-21-Womens-Skinny-Jeans.jpg');
insert into `products` values (103,'Tommy Hilfiger Mens Casual Sneakers','Casual Sneakers',9.99,'Tommy-Hilfiger-Mens-Casual-Sneakers.jpg');
insert into `products` values (104,'H&M Mens Crew Neck Sweater','Crew Neck Sweater',19.99,'H&M-Mens-Crew-Neck-Sweater.jpg');
insert into `products` values (105,'Allen Solly Womens Shift Dress','Shift Dress',14.99,'Allen-Solly-Womens-Shift-Dress.jpg');
insert into `products` values (106,'Mango Mens Cargo Pants','Cargo Pants',24.99,'Mango-Mens-Cargo-Pants.jpg');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(256) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_COURSE_ID_idx` (`course_id`),
  CONSTRAINT `FK_COURSE` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `review` */

insert into `review` values (10,'Good course easy understanding',10);
insert into `review` values (11,'dont buy the course waste!',11);
insert into `review` values (12,'Easy learning',10);
insert into `review` values (13,'i am not satisfied',11);
insert into `review` values (14,'too much theory no practical exposure',11);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert into `student` values (1,'Alice','Johnson','alice.johnson@example.com','2000-07-01');
insert into `student` values (2,'Bob','Smith','bob.smith@example.com','1999-01-20');
insert into `student` values (3,'Eve','Davis','eve.davis@example.com','1969-11-29');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert into `users` values (1,'venkat','venkatthekiller@gmail.com','5b9c7396d59c7a05f9c8');
insert into `users` values (2,'Almamun','almamun@mail.com','5b9c7396d59c7a05f9c8');
insert into `users` values (4,'Marni','gmail@fom','5b9c7396d59c7a05f9c8');
insert into `users` values (6,'Marni','panduranga@gmail','5b9c7396d59c7a05f9c8');
insert into `users` values (7,'Marni','venkatthekiller@gmail.co','5b9c7396d59c7a05f9c8');
insert into `users` values (8,'21','venkatthekiller@gmail.com123',' ');
insert into `users` values (9,'venkatesh babu','venkatthekiller@gmail.com74','5b9c7396d59c7a05f9c8');

SET FOREIGN_KEY_CHECKS=1;

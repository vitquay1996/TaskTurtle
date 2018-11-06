CREATE TABLE users (
    email             VARCHAR(63) PRIMARY KEY,
    full_name         VARCHAR(63) NOT NULL,
    salted_password   VARCHAR(255) NOT NULL,
    photo_file_path   VARCHAR(255),
    address           VARCHAR(255),
    phone             VARCHAR(31),
    introduction      VARCHAR(1023),
    is_admin          BOOLEAN  NOT NULL,
    rating_tasker     NUMERIC,
    rating_requester  NUMERIC,
    CONSTRAINT check_tasker_email CHECK ( email LIKE '%_@__%.__%' )
);

CREATE TABLE task_category (
    title         VARCHAR(63) NOT NULL PRIMARY KEY
);

CREATE TABLE tasks (
    id                 CHAR(36) PRIMARY KEY,
    requester_email        VARCHAR(63) NOT NULL
        REFERENCES users( email ),
    tasker_email       VARCHAR(63)
        REFERENCES users( email ),
    category   VARCHAR(63)
        REFERENCES task_category ( title ),
    date               DATE NOT NULL,
    time_start         TIME NOT NULL,
    time_end           TIME NOT NULL,
    address            VARCHAR(255) NOT NULL,
    description        VARCHAR(1023),
    is_finished        INT NOT NULL CHECK ( is_finished BETWEEN 0 AND 1 ),
    is_paid            INT NOT NULL CHECK ( is_paid BETWEEN 0 AND 1 ),
    CONSTRAINT check_task_conditions CHECK ( is_finished >= is_paid ),
    CONSTRAINT check_end_after_start_date CHECK (time_end > time_start),
    CONSTRAINT check_datetime_after_localtime CHECK (time_start > localtime AND date > current_date)
);

CREATE TABLE bids (
    tasker_email VARCHAR(63) REFERENCES users(email),
    task_id VARCHAR(63) REFERENCES tasks(id),
    price NUMERIC NOT NULL,
    is_accepted INT NOT NULL CHECK ( is_accepted BETWEEN 0 and 1 ),
    PRIMARY KEY (tasker_email, task_id)
);

CREATE TYPE role as ENUM ('requester', 'tasker');

CREATE TABLE reviews (
    task_id VARCHAR(63) REFERENCES tasks(id),
    reviewer_email VARCHAR(63) REFERENCES users(email),
    receiver_email VARCHAR(63) REFERENCES users(email),
    receiver_role role NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 0 AND 5),
    review_content VARCHAR(1023),
    PRIMARY KEY (task_id, reviewer_email, receiver_email)
);

INSERT INTO users VALUES ('huiying@gmail.com','GOH HUI YING', 'f0578f1e7174b1a41c4ea8c6e17f7a8a3b88c92a', NULL,'Kent Ridge','90610624','Hi I am Hui Ying!', false, NULL, NULL);
INSERT INTO users VALUES ('kahhong@hotmail.com','ONG KAH HONG', '8be52126a6fde450a7162a3651d589bb51e9579d', NULL,'Clementi','97320661','Hi I am Kah Hong!', false, NULL, NULL);
INSERT INTO users VALUES ('huangzhanpeng@gmail.com','HUANG ZHANPENG','de2a4d5751ab06dc4f987142db57c26d50925c8a', NULL,'Pioneer','92045854','Hi I am Huang Zhanpeng!', false, NULL, NULL);
INSERT INTO users VALUES ('weixiang@gmail.com','CHOY WEI XIANG','2db4c1811f424582a90f8d7ee77995cf018d9443', NULL,'Pasir Ris','97509473','Hi I am Wei Xiang!', false, NULL, NULL);
INSERT INTO users VALUES ('pohhuiling@hotmail.com','POH HUI LING','9e5ca6b0ffb417997ffb844c76f9c24bbc20fe88', NULL,'Tampines','91421303','Hi I am Poh Hui Ling!', false, NULL, NULL);
INSERT INTO users VALUES ('aneja@gmail.com','VARGHESE ANEJA','b8de6df1561cd7ab6af36d0cb706b2168b4f4c69', NULL,'Chinatown','97091471','Hi I am Aneja!', false, NULL, NULL);
INSERT INTO users VALUES ('zengyihui@yahoo.com','ZENG YIHUI','8a337f7233833c6cd96370d64adbd55f49b30db2', NULL,'Bayfront','91434209','Hi I am Zeng Yihui!', false, NULL, NULL);
INSERT INTO users VALUES ('zhanghan@gmail.com','ZHANG HAN','2c186a6f0dda5aa237254943899d4fee0ab15dd0', NULL,'Bedok','95085929','Hi I am Zhang Han!', false, NULL, NULL);
INSERT INTO users VALUES ('chenghan@yahoo.com','TAN CHENG HAN','e74e5641aa1bea180e9a50cf7f269e6f0e28e341', NULL,'Clementi','91076562','Hi I am Cheng Han!', false, NULL, NULL);
INSERT INTO users VALUES ('huajun@gmail.com','XU HUAJUN','17005c1048dda67c3f735014f33625dfd0c89d32', NULL,'HarbourFront','95224422','Hi I am Huajun!', false, NULL, NULL);
INSERT INTO users VALUES ('liuyihui@gmail.com','LIU YIHUI','0808f4f387948ca6e398f4030e8ee19d74c5883e', NULL,'Clarke Quay','98237391','Hi I am Liu Yihui!', false, NULL, NULL);
INSERT INTO users VALUES ('jiahao@gmail.com','YEO JIA HAO','4e05d4fa6439a3daf2b853e3df1858d42e861df1', NULL,'Orchar','94042473','Hi I am Jia Hao!', false, NULL, NULL);
INSERT INTO users VALUES ('jerrybrown@gmail.com','JERRY BROWN','e23e98b3ba8e88821c3d15d8584656069e220db8', NULL,'Newton','93931425','Hi I am Jerry Brown!', false, NULL, NULL);
INSERT INTO users VALUES ('jianmin@gmail.com','CHOY JIAN MIN','55e28fa0e928e7427b2d45301b1953655ec8587d', NULL,'Jurong East','90950647','Hi I am Jian Min!', false, NULL, NULL);
INSERT INTO users VALUES ('chhuiling@hotmail.com','CHING HUI LING','9974f6dca69a8f974864ba5d1b7ad655ff6db74c', NULL,'Pioneer','93731774','Hi I am Ching Hui Ling!', false, NULL, NULL);
INSERT INTO users VALUES ('weisheng@hotmail.com','TAN WEI SHENG','48dba552b48a80df8bfa91f877bcfa029133cdec', NULL,'Bishan','93238093','Hi I am Wei Shend !', false, NULL, NULL);
INSERT INTO users VALUES ('lienler@yahoo.com','LIEW LIEN LER','c08f0699e04675a0f6d9738502060e5a3e0510e6', NULL,'Boon Keng','92561787','Hi I am Lien Ler!', false, NULL, NULL);
INSERT INTO users VALUES ('kaiting@yahoo.com','NGOO KAI TING','5a032830ea6db6e3f7117e2661968e74331f4f3a', NULL,'Kent Ridge','98373284','Hi I am Kai Ting!', false, NULL, NULL);
INSERT INTO users VALUES ('yiyang@gmail.com','LIU YIYANG','7c816708ff015453787c83c4d0c00ddf93357fd3', NULL,'Boon Lay','96444786','Hi I am Yiyanh!', false, NULL, NULL);
INSERT INTO users VALUES ('zhencai@gmail.com','LIU ZHENCAI','afbeceb482e29420c3149552ba94d7ccfa1f058b', NULL,'Bugis','96405102','Hi I am Zhencai!', false, NULL, NULL);
INSERT INTO users VALUES ('teckkee@gmail.com','SEAH TECK KEE','a15e28d7c372427140476d1df3dc4ba09c249107', NULL,'City Hall','97642801','Hi I am Teck Kee!', false, NULL, NULL);
INSERT INTO users VALUES ('geraldinelee@gmail.com','GERALDINE LEE','a5836b5921235c50e4e152b9274e9f4fb10905e1', NULL,'Kent Ridge','92667554','Hi I am Geraldine Lee!', false, NULL, NULL);
INSERT INTO users VALUES ('adelinewong@yahoo.com','ADELINE WONG','830407804e21a4b5d526ecf452ed4c3d2949f8ec', NULL,'Chinatown','90721775','Hi I am Adeline Wong!', false, NULL, NULL);
INSERT INTO users VALUES ('tangcheeyong@gmail.com','TANG CHEE YONG','8c82853fb79f2a3c53d43d6e82b7e5137679a3a2', NULL,'Dhoby Ghaut','95948552','Hi I am Chee Yong!', false, NULL, NULL);
INSERT INTO users VALUES ('liujun@yahoo.com','LIU JUN','f78eca20109796e5c2598dac799a7b666e27e36e', NULL,'Bugis','94242987','Hi I am Liu Jun!', false, NULL, NULL);
INSERT INTO users VALUES ('zhangzhanpeng@hotmail.com','ZHANG ZHANPENG','475b3681bf2492c2f172940145f06a49204b7556', NULL,'Fareer Road','90589462','Hi I am Zhang Zhanpeng!', false, NULL, NULL);

INSERT INTO task_category VALUES ('Furniture Assembly');
INSERT INTO task_category VALUES ('Help Moving');
INSERT INTO task_category VALUES ('Minor Home Repairs');
INSERT INTO task_category VALUES ('Mounting');
INSERT INTO task_category VALUES ('Yard Work & Removal');
INSERT INTO task_category VALUES ('Lift & Shift Furniture');
INSERT INTO task_category VALUES ('Shopping');
INSERT INTO task_category VALUES ('Writing & Editing');
INSERT INTO task_category VALUES ('Delivery');
INSERT INTO task_category VALUES ('Packing & Shipping');
INSERT INTO task_category VALUES ('Cleaning');
INSERT INTO task_category VALUES ('Arts / Crafts');
INSERT INTO task_category VALUES ('Pet Sitting');
INSERT INTO task_category VALUES ('Computer Help');
INSERT INTO task_category VALUES ('Research');
INSERT INTO task_category VALUES ('Office Administration');
INSERT INTO task_category VALUES ('Cooking');
INSERT INTO task_category VALUES ('Child Care');
INSERT INTO task_category VALUES ('Graphic Design');
INSERT INTO task_category VALUES ('Web Design & Development');
INSERT INTO task_category VALUES ('Electrician');
INSERT INTO task_category VALUES ('Carpentry');
INSERT INTO task_category VALUES ('Sewing');
INSERT INTO task_category VALUES ('Plumbing');
INSERT INTO task_category VALUES ('Photography');
INSERT INTO task_category VALUES ('Laundry & Ironing');
INSERT INTO task_category VALUES ('Accounting');
INSERT INTO task_category VALUES ('Painting');
INSERT INTO task_category VALUES ('Selling Online');
INSERT INTO task_category VALUES ('Decoration');
INSERT INTO task_category VALUES ('Event Planning');
INSERT INTO task_category VALUES ('Event Staffing');
INSERT INTO task_category VALUES ('Waiting in Line');
INSERT INTO task_category VALUES ('Usability Testing');
INSERT INTO task_category VALUES ('Disabled Care');

INSERT INTO tasks VALUES ('0de03e5b-34ea-4297-875e-7eb0b13eefb6', 'huiying@gmail.com', 'kahhong@hotmail.com', 'Web Design & Development' , '2019-10-25','08:05','17:09','Kent Ridge','Web Design & Development',1,1);
INSERT INTO tasks VALUES ('4dc35b1d-a5f6-4352-acf4-93a6edc7b940', 'pohhuiling@hotmail.com', 'weixiang@gmail.com', 'Help Moving','2019-11-10','08:06','17:11','Clementi','Help Moving',1,1);
INSERT INTO tasks VALUES ('2cd41a02-ce55-4e8b-bfdb-626b6a307a85', 'aneja@gmail.com', 'huiying@gmail.com', 'Pet Sitting' ,'2019-11-24','08:15','17:16','Kent Ridge','Pet Sitting',1,0);
INSERT INTO tasks VALUES ('29cf7448-3ecb-4fb4-bbba-324db1ad770f', 'weixiang@gmail.com', 'zengyihui@yahoo.com', 'Lift & Shift Furniture', '2019-12-21','08:23','17:23','Pasir Ris','Lift & Shift Furniture',0,0);
INSERT INTO tasks VALUES ('828f8cb4-7850-43dd-af2b-8111ca2e2948', 'huiying@gmail.com', 'zengyihui@yahoo.com', 'Cooking', '2019-11-22','08:24','17:24','Jurong East','Cooking',0,0);
INSERT INTO tasks VALUES ('76a105c9-633b-4c06-82df-6448fc540c6f', 'zhanghan@gmail.com', 'huangzhanpeng@gmail.com', 'Furniture Assembly', '2019-12-17','08:26','17:29','Chinatown','Furniture Assembly',1,1);
INSERT INTO tasks VALUES ('d4e71b1e-5a3b-4e53-9221-5da2b83eefe2', 'chenghan@yahoo.com', 'huiying@gmail.com', 'Child Care', '2019-12-15','08:28','17:30','Dover','Child Care',0,0);
INSERT INTO tasks VALUES ('db970acf-84ce-447a-a393-f8165e2cb403', 'huajun@gmail.com', 'pohhuiling@hotmail.com', 'Laundry & Ironing', '2019-11-10','08:30','17:33','Kent Ridge','Laundry & Ironing',1,0);
INSERT INTO tasks VALUES ('9605a708-9a9b-4995-ad07-6d47dc8881b1', 'jianmin@gmail.com', 'huajun@gmail.com','Laundry & Ironing', '2019-11-24','08:31:00','17:35:00','Outram Park','Laundry & Ironing',1,0);
INSERT INTO tasks VALUES ('272737c3-a7f0-4d49-aa84-5d58459203fc', 'huiying@gmail.com', 'huangzhanpeng@gmail.com', 'Web Design & Development', '2019-11-28','08:34:00','17:36:00','Boon Keng','Web Design & Development',1,1);
INSERT INTO tasks VALUES ('1839d04f-d688-4ebb-b8bb-947eee5fd761', 'zhanghan@gmail.com', 'jianmin@gmail.com', 'Graphic Design', '2019-10-27','08:41:00','17:38:00','Dhoby Ghaut','Graphic Design',0,0);
INSERT INTO tasks VALUES ('3aae12fe-fec8-4a5b-b421-fcbe5a5624b3', 'chhuiling@hotmail.com', 'chenghan@yahoo.com', 'Delivery', '2019-11-28','08:42:00','17:39:00','Buona Vista','Delivery',0,0);
INSERT INTO tasks VALUES ('12bd5b0f-84f0-445b-a033-c92eec5c1ae1', 'weisheng@hotmail.com', 'zhanghan@gmail.com', 'Delivery', '2019-12-17','08:49:00','17:48:00','Marina Bay','Delivery',0,0);
INSERT INTO tasks VALUES ('46186675-241d-40ce-91ea-353f30b8e062', 'huangzhanpeng@gmail.com', 'chhuiling@hotmail.com', 'Furniture Assembly', '2019-12-15','08:50:00','17:49:00','Bishan','Furniture Assembly',1,1);
INSERT INTO tasks VALUES ('9fef9717-5bb2-4114-9d5c-c42746449701', 'jerrybrown@gmail.com', 'weisheng@hotmail.com', 'Writing & Editing', '2019-11-07','08:51:00','17:52:00','Farrer Road','Writing & Editing',0,0);
INSERT INTO tasks VALUES ('65d37a53-c4f3-4820-a3a1-489e1e99378e', 'lienler@yahoo.com', 'kaiting@yahoo.com', 'Yard Work & Removal', '2019-12-07','08:57:00','17:57:00','Woodlands','Yard Work & Removal',0,0);
INSERT INTO tasks VALUES ('b207464c-2269-4f50-a348-82d245b730ef', 'weixiang@gmail.com', 'lienler@yahoo.com', 'Event Planning', '2019-12-19','08:59:00','18:02:00','Kent Ridge','Event Planning',1,1);
INSERT INTO tasks VALUES ('4b1daf84-4b6f-4851-9c8d-ae297e8b2641', 'jiahao@gmail.com', 'yiyang@gmail.com', 'Painting', '2019-12-12','09:02:00','18:05:00','Redhill','ainting',0,0);
INSERT INTO tasks VALUES ('8e113ea3-b135-46bb-a27f-70b234ba50a8', 'zhangzhanpeng@hotmail.com', 'jiahao@gmail.com', 'Electrician','2019-11-03','09:05:00','18:09:00','Clarke Quay','Electrician',0,0);
INSERT INTO tasks VALUES ('1682a317-0811-4fff-bd84-7a02308ff541', 'huajun@gmail.com', 'kahhong@hotmail.com', 'Painting', '2019-10-30','09:08:00','18:10:00','Bedok','Painting',1,0);
INSERT INTO tasks VALUES ('428543a1-4129-4a97-9ff7-a71b7349e197', 'yiyang@gmail.com', 'zhencai@gmail.com', 'Sewing', '2019-12-19','09:09:00','18:15:00','Marina Bay','Sewing',1,1);
INSERT INTO tasks VALUES ('387cf2b7-e3b4-4856-8b26-616a1156e05b', 'kahhong@hotmail.com', 'teckkee@gmail.com', 'Cooking', '2019-11-22','09:15:00','18:17:00','Orchard','Cooking',0,0);
INSERT INTO tasks VALUES ('8979eb86-551d-4f54-a9b7-0d4481093df7', 'yiyang@gmail.com', 'geraldinelee@gmail.com', 'Computer Help', '2019-11-15','09:19:00','18:27:00','Punggol','Comupter Help',0,0);
INSERT INTO tasks VALUES ('99bba215-d537-408c-aad4-d220f718a192', 'kahhong@hotmail.com', 'yiyang@gmail.com', 'Arts / Crafts', '2019-11-15','09:20:00','18:28:00','Orchard','Arts / Crafts',1,1);
INSERT INTO tasks VALUES ('561ebf06-43eb-4f95-9ca6-3b69aac62d2a', 'aneja@gmail.com', 'adelinewong@yahoo.com', 'Mounting', '2019-11-19','09:23:00','18:29:00','Clementi','Mounting',0,0);
INSERT INTO tasks VALUES ('80089145-bf38-4def-9bea-444f0cd0997a', 'geraldinelee@gmail.com', 'liujun@yahoo.com', 'Carpentry', '2019-12-29','09:25:00','18:30:00','Clarke Quay','Carpentry',1,1);
INSERT INTO tasks VALUES ('641466a9-e723-4771-87e6-561e023648c2', 'pohhuiling@hotmail.com', 'jiahao@gmail.com', 'Waiting in Line', '2019-12-21','09:35:00','18:32:00','City Hall','Waiting in Line',0,0);
INSERT INTO tasks VALUES ('02bae7f9-412c-4b47-b6c5-806abcf61a47', 'geraldinelee@gmail.com', 'adelinewong@yahoo.com', 'Event Planning','2019-12-12','09:40:00','18:33:00','Newton','Event Planning',1,1);
INSERT INTO tasks VALUES ('268e18fd-e2b5-4d8f-8696-4385f004ffda', 'zhencai@gmail.com', 'aneja@gmail.com', 'Electrician', '2018-12-24','09:43:00','18:43:00','Dhoby Ghaut','Electrician',0,0);
INSERT INTO tasks VALUES ('2e5c9fc9-8885-4913-a14c-e5b7440b6082', 'zengyihui@yahoo.com', 'lienler@yahoo.com', 'Packing & Shipping',  '2018-11-23','09:47:00','18:44:00','Rochor','Packing & Shipping',0,0);
INSERT INTO tasks VALUES ('3266a6e9-9260-4ab4-a50d-b986c37d516b', 'liuyihui@gmail.com', 'tangcheeyong@gmail.com', 'Minor Home Repairs', '2018-12-07','09:49:00','18:46:00','Punggol','Minor Home Repairs',1,0);
INSERT INTO tasks VALUES ('dd8c8fed-89b1-40bd-bd98-3c7d83d55a1f', 'adelinewong@yahoo.com', 'liuyihui@gmail.com', 'Photography', '2018-12-24','09:53:00','18:52:00','Clementi','Photography',0,0);
INSERT INTO tasks VALUES ('d9eafe21-07ee-4869-90ec-e8096728288e', 'liujun@yahoo.com', 'zhangzhanpeng@hotmail.com', 'Accounting', '2018-12-10','09:56:00','18:56:00','Bedok','Accounting',1,1);
INSERT INTO tasks VALUES ('cd723d16-ecee-4b10-9ad4-eff55f1e8874', 'teckkee@gmail.com', 'jerrybrown@gmail.com', 'Plumbing',  '2018-12-10','09:57:00','18:58:00','Dhoby Ghaut','Plumbing',1,0);
INSERT INTO tasks VALUES ('6b5efe3f-e639-4c7f-99f4-dd1c62e63218', 'tangcheeyong@gmail.com', 'zhangzhanpeng@hotmail.com', 'Graphic Design','2018-12-29','09:59:00','19:00:00','Clementi','Graphic Design',0,0);

INSERT INTO bids VALUES ('huiying@gmail.com','0de03e5b-34ea-4297-875e-7eb0b13eefb6',71,1);
INSERT INTO bids VALUES ('kahhong@hotmail.com','4dc35b1d-a5f6-4352-acf4-93a6edc7b940',61,0);
INSERT INTO bids VALUES ('huangzhanpeng@gmail.com','6b5efe3f-e639-4c7f-99f4-dd1c62e63218',57,0);
INSERT INTO bids VALUES ('weixiang@gmail.com','29cf7448-3ecb-4fb4-bbba-324db1ad770f',86,1);
INSERT INTO bids VALUES ('pohhuiling@hotmail.com','828f8cb4-7850-43dd-af2b-8111ca2e2948',59,1);
INSERT INTO bids VALUES ('aneja@gmail.com','76a105c9-633b-4c06-82df-6448fc540c6f',194,0);
INSERT INTO bids VALUES ('zengyihui@yahoo.com','d4e71b1e-5a3b-4e53-9221-5da2b83eefe2',154,1);
INSERT INTO bids VALUES ('zhanghan@gmail.com','db970acf-84ce-447a-a393-f8165e2cb403',145,1);
INSERT INTO bids VALUES ('chenghan@yahoo.com','9605a708-9a9b-4995-ad07-6d47dc8881b1',154,0);
INSERT INTO bids VALUES ('huajun@gmail.com','272737c3-a7f0-4d49-aa84-5d58459203fc',51,0);
INSERT INTO bids VALUES ('liuyihui@gmail.com','1839d04f-d688-4ebb-b8bb-947eee5fd761',116,1);
INSERT INTO bids VALUES ('jiahao@gmail.com','3aae12fe-fec8-4a5b-b421-fcbe5a5624b3',83,0);
INSERT INTO bids VALUES ('jerrybrown@gmail.com','12bd5b0f-84f0-445b-a033-c92eec5c1ae1',59,0);
INSERT INTO bids VALUES ('jianmin@gmail.com','46186675-241d-40ce-91ea-353f30b8e062',112,1);
INSERT INTO bids VALUES ('chhuiling@hotmail.com','9fef9717-5bb2-4114-9d5c-c42746449701',107,1);
INSERT INTO bids VALUES ('weisheng@hotmail.com','641466a9-e723-4771-87e6-561e023648c2',87,0);
INSERT INTO bids VALUES ('lienler@yahoo.com','02bae7f9-412c-4b47-b6c5-806abcf61a47',60,1);
INSERT INTO bids VALUES ('kaiting@yahoo.com','268e18fd-e2b5-4d8f-8696-4385f004ffda',105,1);
INSERT INTO bids VALUES ('yiyang@gmail.com','2e5c9fc9-8885-4913-a14c-e5b7440b6082',127,1);
INSERT INTO bids VALUES ('zhencai@gmail.com','3266a6e9-9260-4ab4-a50d-b986c37d516b',89,0);
INSERT INTO bids VALUES ('teckkee@gmail.com','dd8c8fed-89b1-40bd-bd98-3c7d83d55a1f',155,0);
INSERT INTO bids VALUES ('geraldinelee@gmail.com','d9eafe21-07ee-4869-90ec-e8096728288e',170,0);
INSERT INTO bids VALUES ('adelinewong@yahoo.com','cd723d16-ecee-4b10-9ad4-eff55f1e8874',79,1);
INSERT INTO bids VALUES ('tangcheeyong@gmail.com','6b5efe3f-e639-4c7f-99f4-dd1c62e63218',81,0);
INSERT INTO bids VALUES ('liujun@yahoo.com','80089145-bf38-4def-9bea-444f0cd0997a',156,1);
INSERT INTO bids VALUES ('zhencai@gmail.com','561ebf06-43eb-4f95-9ca6-3b69aac62d2a',156,0);
INSERT INTO bids VALUES ('zengyihui@yahoo.com','99bba215-d537-408c-aad4-d220f718a192',137,1);
INSERT INTO bids VALUES ('zhanghan@gmail.com','8979eb86-551d-4f54-a9b7-0d4481093df7',54,0);
INSERT INTO bids VALUES ('kahhong@hotmail.com','387cf2b7-e3b4-4856-8b26-616a1156e05b',56,0);
INSERT INTO bids VALUES ('huangzhanpeng@gmail.com','428543a1-4129-4a97-9ff7-a71b7349e197',155,1);

INSERT INTO reviews VALUES ('0de03e5b-34ea-4297-875e-7eb0b13eefb6','huiying@gmail.com','kahhong@hotmail.com','requester',3,'Good');
INSERT INTO reviews VALUES ('4dc35b1d-a5f6-4352-acf4-93a6edc7b940','pohhuiling@hotmail.com','weixiang@gmail.com','requester',5,'Excellent');
INSERT INTO reviews VALUES ('2cd41a02-ce55-4e8b-bfdb-626b6a307a85','huiying@gmail.com','aneja@gmail.com','tasker',2,'Average');
INSERT INTO reviews VALUES ('29cf7448-3ecb-4fb4-bbba-324db1ad770f','weixiang@gmail.com','zengyihui@yahoo.com','requester',4,'Very Good');
INSERT INTO reviews VALUES ('828f8cb4-7850-43dd-af2b-8111ca2e2948','zengyihui@yahoo.com','huiying@gmail.com','tasker',1,'Bad');
INSERT INTO reviews VALUES ('76a105c9-633b-4c06-82df-6448fc540c6f','huangzhanpeng@gmail.com','zhanghan@gmail.com','tasker',0,'Very Bad');
INSERT INTO reviews VALUES ('d4e71b1e-5a3b-4e53-9221-5da2b83eefe2','huiying@gmail.com','chenghan@yahoo.com','tasker',4,'Very Good');
INSERT INTO reviews VALUES ('db970acf-84ce-447a-a393-f8165e2cb403','huajun@gmail.com','pohhuiling@hotmail.com','requester',2,'Average');
INSERT INTO reviews VALUES ('9605a708-9a9b-4995-ad07-6d47dc8881b1','jianmin@gmail.com','huajun@gmail.com','requester',1,'Bad');
INSERT INTO reviews VALUES ('272737c3-a7f0-4d49-aa84-5d58459203fc','huiying@gmail.com','huangzhanpeng@gmail.com','requester',3,'Good');
INSERT INTO reviews VALUES ('1839d04f-d688-4ebb-b8bb-947eee5fd761','jianmin@gmail.com','zhanghan@gmail.com','tasker',0,'Very Bad');
INSERT INTO reviews VALUES ('3aae12fe-fec8-4a5b-b421-fcbe5a5624b3','chenghan@yahoo.com','chhuiling@hotmail.com','tasker',4,'Very Good');
INSERT INTO reviews VALUES ('12bd5b0f-84f0-445b-a033-c92eec5c1ae1','weisheng@hotmail.com','zhanghan@gmail.com','requester',2,'Average');
INSERT INTO reviews VALUES ('46186675-241d-40ce-91ea-353f30b8e062','huangzhanpeng@gmail.com','chhuiling@hotmail.com','requester',0,'Very Bad');
INSERT INTO reviews VALUES ('9fef9717-5bb2-4114-9d5c-c42746449701','weisheng@hotmail.com','jerrybrown@gmail.com','tasker',0,'Very Bad');
INSERT INTO reviews VALUES ('65d37a53-c4f3-4820-a3a1-489e1e99378e','kaiting@yahoo.com','lienler@yahoo.com','tasker',0,'Very Bad');
INSERT INTO reviews VALUES ('b207464c-2269-4f50-a348-82d245b730ef','weixiang@gmail.com','lienler@yahoo.com','requester',3,'Good');
INSERT INTO reviews VALUES ('4b1daf84-4b6f-4851-9c8d-ae297e8b2641','yiyang@gmail.com','jiahao@gmail.com','tasker',1,'Bad');
INSERT INTO reviews VALUES ('8e113ea3-b135-46bb-a27f-70b234ba50a8','jiahao@gmail.com','zhangzhanpeng@hotmail.com','tasker',5,'Excellent');
INSERT INTO reviews VALUES ('1682a317-0811-4fff-bd84-7a02308ff541','kahhong@hotmail.com','huajun@gmail.com','tasker',2,'Average');
INSERT INTO reviews VALUES ('428543a1-4129-4a97-9ff7-a71b7349e197','yiyang@gmail.com','zhencai@gmail.com','requester',5,'Excellent');
INSERT INTO reviews VALUES ('387cf2b7-e3b4-4856-8b26-616a1156e05b','kahhong@hotmail.com','teckkee@gmail.com','requester',0,'Very Bad');
INSERT INTO reviews VALUES ('8979eb86-551d-4f54-a9b7-0d4481093df7','geraldinelee@gmail.com','yiyang@gmail.com','tasker',4,'Very Good');
INSERT INTO reviews VALUES ('99bba215-d537-408c-aad4-d220f718a192','kahhong@hotmail.com','yiyang@gmail.com','requester',5,'Excellent');
INSERT INTO reviews VALUES ('561ebf06-43eb-4f95-9ca6-3b69aac62d2a','aneja@gmail.com','adelinewong@yahoo.com','requester',2,'Average');
INSERT INTO reviews VALUES ('80089145-bf38-4def-9bea-444f0cd0997a','liujun@yahoo.com','geraldinelee@gmail.com','tasker',2,'Average');
INSERT INTO reviews VALUES ('641466a9-e723-4771-87e6-561e023648c2','pohhuiling@hotmail.com','jiahao@gmail.com','requester',3,'Good');
INSERT INTO reviews VALUES ('02bae7f9-412c-4b47-b6c5-806abcf61a47','geraldinelee@gmail.com','adelinewong@yahoo.com','requester',2,'Average');
INSERT INTO reviews VALUES ('268e18fd-e2b5-4d8f-8696-4385f004ffda','aneja@gmail.com','zhencai@gmail.com','tasker',3,'Good');
INSERT INTO reviews VALUES ('2e5c9fc9-8885-4913-a14c-e5b7440b6082','zengyihui@yahoo.com','lienler@yahoo.com','requester',3,'Good');
INSERT INTO reviews VALUES ('3266a6e9-9260-4ab4-a50d-b986c37d516b','liuyihui@gmail.com','tangcheeyong@gmail.com','requester',5,'Excellent');
INSERT INTO reviews VALUES ('dd8c8fed-89b1-40bd-bd98-3c7d83d55a1f','liuyihui@gmail.com','adelinewong@yahoo.com','tasker',3,'Good');
INSERT INTO reviews VALUES ('d9eafe21-07ee-4869-90ec-e8096728288e','zhangzhanpeng@hotmail.com','liujun@yahoo.com','tasker',2,'Average');
INSERT INTO reviews VALUES ('cd723d16-ecee-4b10-9ad4-eff55f1e8874','teckkee@gmail.com','jerrybrown@gmail.com','requester',1,'Bad');
INSERT INTO reviews VALUES ('6b5efe3f-e639-4c7f-99f4-dd1c62e63218','tangcheeyong@gmail.com','zhangzhanpeng@hotmail.com','requester',4,'Very Good');

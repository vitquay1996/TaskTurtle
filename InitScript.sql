CREATE TABLE users (
    email             VARCHAR(63) PRIMARY KEY,
    full_name         VARCHAR(63) NOT NULL,
    salted_password   VARCHAR(255) NOT NULL,
    photo_file_path   VARCHAR(255),
    address           VARCHAR(255),
    phone             VARCHAR(31),
    introduction      VARCHAR(1023),
    CONSTRAINT check_tasker_email CHECK ( email LIKE '%_@__%.__%' )
);

CREATE TABLE task_category (
    id            CHAR(36) PRIMARY KEY,
    title         VARCHAR(63) NOT NULL,
    description   VARCHAR(1023)
);

CREATE TABLE tasks (
    id                 CHAR(36) PRIMARY KEY,
    owner_email        VARCHAR(63) NOT NULL
        REFERENCES users( email ),
    tasker_email       VARCHAR(63) 
        REFERENCES users( email ),
    task_category_id   CHAR(36) NOT NULL
        REFERENCES task_category ( id ),
    date_time          DATE NOT NULL,
    address            VARCHAR(255) NOT NULL,
    description        VARCHAR(1023),
    est_hours          INT NOT NULL CHECK ( est_hours BETWEEN 1 AND 8 ),
    is_finished        INT NOT NULL CHECK ( is_finished BETWEEN 0 AND 1 ),
    is_paid            INT NOT NULL CHECK ( is_paid BETWEEN 0 AND 1 ),
    CONSTRAINT check_task_conditions CHECK ( is_finished >= is_paid )
);

CREATE TABLE bids (
tasker_email VARCHAR(63) REFERENCES users(email),
task_id VARCHAR(63) REFERENCES tasks(id),
price NUMERIC NOT NULL, 
is_accepted INT NOT NULL CHECK ( is_accepted BETWEEN 0 and 1 )
PRIMARY KEY (tasker_email, task_id)
); 

INSERT INTO users VALUES ( 'november@gmail.com', 'November', '9DE6FE1D', NULL, 'Nancy', '94406541', 'Hello, I am November!' );
INSERT INTO users VALUES ( 'oscar@gmail.com', 'Oscar', 'CA66A852', NULL, 'Ostend', '91095881', 'Hello, I am Oscar!' );
INSERT INTO users VALUES ( 'papa@gmail.com', 'Papa', '4959DE6E', NULL, 'Paris', '95876445', 'Hello, I am Papa!' );
INSERT INTO users VALUES ( 'quebec@gmail.com', 'Quebec', '5E3BD1AF', NULL, 'Quebec', '93287602', 'Hello, I am Quebec!' );
INSERT INTO users VALUES ( 'romeo@gmail.com', 'Romeo', '8B66AB55', NULL, 'Rome', '98266841', 'Hello, I am Romeo!' );
INSERT INTO users VALUES ( 'sierra@gmail.com', 'Sierra', 'D5EEF8AD', NULL, 'Sardinia', '98353884', 'Hello, I am Sierra!' );
INSERT INTO users VALUES ( 'tango@gmail.com', 'Tango', '88387EA8', NULL, 'Tokio', '99645295', 'Hello, I am Tango!' );
INSERT INTO users VALUES ( 'uniform@gmail.com', 'Uniform', '6A22B156', NULL, 'Uruguay', '96378495', 'Hello, I am Uniform!' );
INSERT INTO users VALUES ( 'victor@gmail.com', 'Victor', '6C00E6FF', NULL, 'Victoria', '92966022', 'Hello, I am Victor!' );
INSERT INTO users VALUES ( 'whiskey@gmail.com', 'Whiskey', '239AD976', NULL, 'Washington', '93733422', 'Hello, I am Whiskey!' );
INSERT INTO users VALUES ( 'x-ray@gmail.com', 'X-ray', 'E0AB46DB', NULL, 'Xaintrie', '92594640', 'Hello, I am X-ray!' );
INSERT INTO users VALUES ( 'yankee@gmail.com', 'Yankee', '9D108880', NULL, 'Yokohama', '94798269', 'Hello, I am Yankee!' );
INSERT INTO users VALUES ( 'zulu@gmail.com', 'Zulu', '5CD8645E', NULL, 'Zanzibar', '89455271', 'Hello, I am Zulu!' );

INSERT INTO task_category VALUES ( '0de03e5b-34ea-4297-875e-7eb0b13eefb6', 'Furniture Assembly', 'Furniture Assembly, Furniture Assembly');
INSERT INTO task_category VALUES ( '4dc35b1d-a5f6-4352-acf4-93a6edc7b940', 'Help Moving', 'Help Moving, Help Moving');
INSERT INTO task_category VALUES ( '2cd41a02-ce55-4e8b-bfdb-626b6a307a85', 'Minor Home Repairs', 'Minor Home Repairs, Minor Home Repairs');
INSERT INTO task_category VALUES ( '29cf7448-3ecb-4fb4-bbba-324db1ad770f', 'Mounting', 'Mounting, Mounting');
INSERT INTO task_category VALUES ( '828f8cb4-7850-43dd-af2b-8111ca2e2948', 'Yard Work & Removal', 'Yard Work & Removal, Yard Work & Removal');
INSERT INTO task_category VALUES ( '76a105c9-633b-4c06-82df-6448fc540c6f', 'Lift & Shift Furniture', 'Lift & Shift Furniture, Lift & Shift Furniture');
INSERT INTO task_category VALUES ( 'd4e71b1e-5a3b-4e53-9221-5da2b83eefe2', 'Shopping', 'Shopping, Shopping');
INSERT INTO task_category VALUES ( 'db970acf-84ce-447a-a393-f8165e2cb403', 'Writing & Editing', 'Writing & Editing, Writing & Editing');
INSERT INTO task_category VALUES ( '9605a708-9a9b-4995-ad07-6d47dc8881b1', 'Delivery', 'Delivery, Delivery');
INSERT INTO task_category VALUES ( '272737c3-a7f0-4d49-aa84-5d58459203fc', 'Packing & Shipping', 'Packing & Shipping, Packing & Shipping');
INSERT INTO task_category VALUES ( '1839d04f-d688-4ebb-b8bb-947eee5fd761', 'Cleaning', 'Cleaning, Cleaning');
INSERT INTO task_category VALUES ( '3aae12fe-fec8-4a5b-b421-fcbe5a5624b3', 'Arts / Crafts', 'Arts / Crafts, Arts / Crafts');
INSERT INTO task_category VALUES ( '12bd5b0f-84f0-445b-a033-c92eec5c1ae1', 'Pet Sitting', 'Pet Sitting, Pet Sitting');
INSERT INTO task_category VALUES ( '46186675-241d-40ce-91ea-353f30b8e062', 'Computer Help', 'Computer Help, Computer Help');
INSERT INTO task_category VALUES ( '9fef9717-5bb2-4114-9d5c-c42746449701', 'Research', 'Research, Research');
INSERT INTO task_category VALUES ( '65d37a53-c4f3-4820-a3a1-489e1e99378e', 'Office Administration', 'Office Administration, Office Administration');
INSERT INTO task_category VALUES ( 'b207464c-2269-4f50-a348-82d245b730ef', 'Cooking / Baking', 'Cooking / Baking, Cooking / Baking');
INSERT INTO task_category VALUES ( '4b1daf84-4b6f-4851-9c8d-ae297e8b2641', 'Child Care', 'Child Care, Child Care');
INSERT INTO task_category VALUES ( '8e113ea3-b135-46bb-a27f-70b234ba50a8', 'Graphic Design', 'Graphic Design, Graphic Design');
INSERT INTO task_category VALUES ( '1682a317-0811-4fff-bd84-7a02308ff541', 'Web Design & Development', 'Web Design & Development, Web Design & Development');
INSERT INTO task_category VALUES ( '428543a1-4129-4a97-9ff7-a71b7349e197', 'Electrician', 'Electrician, Electrician');
INSERT INTO task_category VALUES ( '387cf2b7-e3b4-4856-8b26-616a1156e05b', 'Carpentry & Construction', 'Carpentry & Construction, Carpentry & Construction');
INSERT INTO task_category VALUES ( '8979eb86-551d-4f54-a9b7-0d4481093df7', 'Sewing', 'Sewing, Sewing');
INSERT INTO task_category VALUES ( '99bba215-d537-408c-aad4-d220f718a192', 'Plumbing', 'Plumbing, Plumbing');
INSERT INTO task_category VALUES ( '561ebf06-43eb-4f95-9ca6-3b69aac62d2a', 'Photography', 'Photography, Photography');
INSERT INTO task_category VALUES ( '80089145-bf38-4def-9bea-444f0cd0997a', 'Laundry and Ironing', 'Laundry and Ironing, Laundry and Ironing');
INSERT INTO task_category VALUES ( '641466a9-e723-4771-87e6-561e023648c2', 'Organization', 'Organization, Organization');
INSERT INTO task_category VALUES ( '02bae7f9-412c-4b47-b6c5-806abcf61a47', 'Automotive', 'Automotive, Automotive');
INSERT INTO task_category VALUES ( '268e18fd-e2b5-4d8f-8696-4385f004ffda', 'Videography', 'Videography, Videography');
INSERT INTO task_category VALUES ( '2e5c9fc9-8885-4913-a14c-e5b7440b6082', 'Accounting', 'Accounting, Accounting');
INSERT INTO task_category VALUES ( '3266a6e9-9260-4ab4-a50d-b986c37d516b', 'Painting', 'Painting, Painting');
INSERT INTO task_category VALUES ( 'dd8c8fed-89b1-40bd-bd98-3c7d83d55a1f', 'Data Entry', 'Data Entry, Data Entry');
INSERT INTO task_category VALUES ( 'd9eafe21-07ee-4869-90ec-e8096728288e', 'Marketing', 'Marketing, Marketing');
INSERT INTO task_category VALUES ( 'cd723d16-ecee-4b10-9ad4-eff55f1e8874', 'Selling Online', 'Selling Online, Selling Online');
INSERT INTO task_category VALUES ( '6b5efe3f-e639-4c7f-99f4-dd1c62e63218', 'Usability Testing', 'Usability Testing, Usability Testing');
INSERT INTO task_category VALUES ( 'c4425c18-9d42-4351-9a4a-d36e07a08036', 'Senior & Disabled Care', 'Senior & Disabled Care, Senior & Disabled Care');
INSERT INTO task_category VALUES ( '7902e225-b3cb-4d96-b9f5-06d7802ab678', 'Event Planning', 'Event Planning, Event Planning');
INSERT INTO task_category VALUES ( '450d2a7d-a0d2-4402-88b3-b54e083510df', 'Event Staffing', 'Event Staffing, Event Staffing');
INSERT INTO task_category VALUES ( 'a40aac8b-52e9-4c1d-8869-f7809f6ad9c8', 'Executive Assistant', 'Executive Assistant, Executive Assistant');
INSERT INTO task_category VALUES ( '7e165556-7ec6-4ede-aa60-b10af7bf289b', 'Deep Clean', 'Deep Clean, Deep Clean');
INSERT INTO task_category VALUES ( '9ecf0e55-b065-4e25-8a5b-f4edba7371e4', 'Decoration', 'Decoration, Decoration');
INSERT INTO task_category VALUES ( '2ce0c7ea-0f9a-4652-9f75-060ecc8afa99', 'Errands', 'Errands, Errands');
INSERT INTO task_category VALUES ( 'b9de6f8a-c2e2-4a59-8b6e-1e1dae4d2363', 'Waiting in Line', 'Waiting in Line, Waiting in Line');
INSERT INTO task_category VALUES ( '68189c23-ff12-488f-8294-73ccbd0a005f', 'Window Cleaning', 'Window Cleaning, Window Cleaning');
INSERT INTO task_category VALUES ( '93b7a614-9f4f-4371-a2bd-d7d305d15a90', 'Entertainment', 'Entertainment, Entertainment');

INSERT INTO tasks VALUES ('d60cee5c-699d-4744-93f4-5021874e6caa', 'romeo@gmail.com', NULL, '46186675-241d-40ce-91ea-353f30b8e062', '2018-10-29', 'Prince Georges Park', 'Computer Help', 6, 0, 0);
INSERT INTO tasks VALUES ('82b6d122-439b-4d64-b375-130497ebd6d0', 'whiskey@gmail.com', NULL, '2e5c9fc9-8885-4913-a14c-e5b7440b6082', '2018-10-21', 'Prince Georges Park', 'Accounting', 1, 0, 0);
INSERT INTO tasks VALUES ('176aa009-6178-45d1-86c5-9f15a44f430c', 'quebec@gmail.com', NULL, '29cf7448-3ecb-4fb4-bbba-324db1ad770f', '2018-10-26', 'Prince Georges Park', 'Mounting', 7, 0, 0);
INSERT INTO tasks VALUES ('19dad008-6662-400d-9003-eed3c5f73004', 'tango@gmail.com', NULL, '80089145-bf38-4def-9bea-444f0cd0997a', '2018-12-15', 'Prince Georges Park', 'Laundry and Ironing', 5, 0, 0);
INSERT INTO tasks VALUES ('be3707ac-1a72-443a-b5ab-2d79e0ffa515', 'november@gmail.com', NULL, 'd9eafe21-07ee-4869-90ec-e8096728288e', '2018-11-16', 'Prince Georges Park', 'Marketing', 5, 0, 0);
INSERT INTO tasks VALUES ('2dca2717-323e-437f-b39a-750415c875a1', 'papa@gmail.com', NULL, '65d37a53-c4f3-4820-a3a1-489e1e99378e', '2018-10-16', 'Prince Georges Park', 'Office Administration', 5, 0, 0);
INSERT INTO tasks VALUES ('893a2c8e-5004-4c6e-81c4-d03413b38634', 'zulu@gmail.com', NULL, '80089145-bf38-4def-9bea-444f0cd0997a', '2018-10-24', 'Prince Georges Park', 'Laundry and Ironing', 7, 0, 0);
INSERT INTO tasks VALUES ('7fe5e3bc-6116-40a5-b64c-afc9de16f385', 'november@gmail.com', NULL, '3266a6e9-9260-4ab4-a50d-b986c37d516b', '2018-12-11', 'Prince Georges Park', 'Painting', 6, 0, 0);
INSERT INTO tasks VALUES ('6e8ca4c2-385e-4336-90ea-a05984335ba4', 'zulu@gmail.com', NULL, '80089145-bf38-4def-9bea-444f0cd0997a', '2018-12-27', 'Prince Georges Park', 'Laundry and Ironing', 7, 0, 0);
INSERT INTO tasks VALUES ('6a1281f2-fea5-4e1a-a077-be4cac94160b', 'zulu@gmail.com', NULL, '6b5efe3f-e639-4c7f-99f4-dd1c62e63218', '2018-12-27', 'Prince Georges Park', 'Usability Testing', 5, 0, 0);
INSERT INTO tasks VALUES ('230ef96a-dd1b-4042-9305-ae00b30a17ac', 'papa@gmail.com', NULL, '2cd41a02-ce55-4e8b-bfdb-626b6a307a85', '2018-11-29', 'Prince Georges Park', 'Minor Home Repairs', 5, 0, 0);
INSERT INTO tasks VALUES ('0da08662-3690-4dfb-9723-e142fedafcb7', 'victor@gmail.com', NULL, '29cf7448-3ecb-4fb4-bbba-324db1ad770f', '2018-10-22', 'Prince Georges Park', 'Mounting', 6, 0, 0);
INSERT INTO tasks VALUES ('be189272-71aa-4130-994f-b6b46918afde', 'quebec@gmail.com', NULL, '65d37a53-c4f3-4820-a3a1-489e1e99378e', '2018-11-20', 'Prince Georges Park', 'Office Administration', 1, 0, 0);
INSERT INTO tasks VALUES ('90f0653f-8bd3-4b0a-866e-4c9da10e3f1f', 'romeo@gmail.com', NULL, '428543a1-4129-4a97-9ff7-a71b7349e197', '2018-11-21', 'Prince Georges Park', 'Electrician', 5, 0, 0);
INSERT INTO tasks VALUES ('0ef5ca98-b239-4233-8112-3c73b630af4d', 'sierra@gmail.com', NULL, '76a105c9-633b-4c06-82df-6448fc540c6f', '2018-12-21', 'Prince Georges Park', 'Lift & Shift Furniture', 5, 0, 0);
INSERT INTO tasks VALUES ('5b638a01-6740-4a38-9c06-35d8837af7d0', 'yankee@gmail.com', NULL, '3aae12fe-fec8-4a5b-b421-fcbe5a5624b3', '2018-10-14', 'Prince Georges Park', 'Arts / Crafts', 6, 0, 0);
INSERT INTO tasks VALUES ('ac8e7f6f-8407-4c76-8fe8-c470a134d82c', 'yankee@gmail.com', NULL, '3aae12fe-fec8-4a5b-b421-fcbe5a5624b3', '2018-11-18', 'Prince Georges Park', 'Arts / Crafts', 2, 0, 0);
INSERT INTO tasks VALUES ('ca83bab9-e855-4784-bedb-07671f970329', 'uniform@gmail.com', NULL, '428543a1-4129-4a97-9ff7-a71b7349e197', '2018-11-16', 'Prince Georges Park', 'Electrician', 8, 0, 0);
INSERT INTO tasks VALUES ('2a70dc8c-0d39-486c-87c7-e42cf9bab128', 'quebec@gmail.com', NULL, '8979eb86-551d-4f54-a9b7-0d4481093df7', '2018-11-28', 'Prince Georges Park', 'Sewing', 3, 0, 0);
INSERT INTO tasks VALUES ('78e4bbf6-ee5a-4973-aea1-107017e169b7', 'sierra@gmail.com', NULL, '80089145-bf38-4def-9bea-444f0cd0997a', '2018-10-11', 'Prince Georges Park', 'Laundry and Ironing', 8, 0, 0);
INSERT INTO tasks VALUES ('cdeda4b6-7956-431d-876b-985c2fd5f414', 'uniform@gmail.com', NULL, 'c4425c18-9d42-4351-9a4a-d36e07a08036', '2018-10-28', 'Prince Georges Park', 'Senior & Disabled Care', 5, 0, 0);
INSERT INTO tasks VALUES ('ad0927ab-17fd-4a93-b46f-7776fa38f27d', 'uniform@gmail.com', NULL, '46186675-241d-40ce-91ea-353f30b8e062', '2018-11-12', 'Prince Georges Park', 'Computer Help', 2, 0, 0);
INSERT INTO tasks VALUES ('36399553-db56-4d05-b0ca-8e76b098f7a6', 'november@gmail.com', NULL, '7e165556-7ec6-4ede-aa60-b10af7bf289b', '2018-11-11', 'Prince Georges Park', 'Deep Clean', 7, 0, 0);
INSERT INTO tasks VALUES ('a44f3518-643e-409c-8b2d-2ceb9cf98ca5', 'whiskey@gmail.com', NULL, '93b7a614-9f4f-4371-a2bd-d7d305d15a90', '2018-10-26', 'Prince Georges Park', 'Entertainment', 1, 0, 0);
INSERT INTO tasks VALUES ('47abc093-f651-4b87-8736-302895c1a762', 'tango@gmail.com', NULL, '2cd41a02-ce55-4e8b-bfdb-626b6a307a85', '2018-12-20', 'Prince Georges Park', 'Minor Home Repairs', 3, 0, 0);
INSERT INTO tasks VALUES ('38a07d70-c413-451d-901c-be4e24a60241', 'whiskey@gmail.com', NULL, '450d2a7d-a0d2-4402-88b3-b54e083510df', '2018-12-29', 'Prince Georges Park', 'Event Staffing', 8, 0, 0);
INSERT INTO tasks VALUES ('41b948ca-ab05-4e4f-af63-e4df8bf4375d', 'november@gmail.com', NULL, '2ce0c7ea-0f9a-4652-9f75-060ecc8afa99', '2018-12-22', 'Prince Georges Park', 'Errands', 6, 0, 0);
INSERT INTO tasks VALUES ('db96e1f8-d1ba-45fe-af08-ef73eec838c9', 'romeo@gmail.com', NULL, '268e18fd-e2b5-4d8f-8696-4385f004ffda', '2018-11-10', 'Prince Georges Park', 'Videography', 1, 0, 0);
INSERT INTO tasks VALUES ('9b85cabc-f62b-4ee9-8358-48389a22adaa', 'quebec@gmail.com', NULL, '2cd41a02-ce55-4e8b-bfdb-626b6a307a85', '2018-12-24', 'Prince Georges Park', 'Minor Home Repairs', 1, 0, 0);
INSERT INTO tasks VALUES ('fda66b2c-fa4b-491d-ad34-4de4702642b1', 'x-ray@gmail.com', NULL, '4b1daf84-4b6f-4851-9c8d-ae297e8b2641', '2018-11-12', 'Prince Georges Park', 'Child Care', 5, 0, 0);
INSERT INTO tasks VALUES ('d8750d07-6fd8-487d-99d8-42a988ed8ea3', 'tango@gmail.com', NULL, '4b1daf84-4b6f-4851-9c8d-ae297e8b2641', '2018-11-25', 'Prince Georges Park', 'Child Care', 3, 0, 0);
INSERT INTO tasks VALUES ('e925dede-a2aa-4e40-83fa-29bce92c63c2', 'quebec@gmail.com', NULL, '1682a317-0811-4fff-bd84-7a02308ff541', '2018-12-11', 'Prince Georges Park', 'Web Design & Development', 7, 0, 0);
INSERT INTO tasks VALUES ('74567529-0938-4e01-8234-bbbc0775dd47', 'zulu@gmail.com', NULL, '9ecf0e55-b065-4e25-8a5b-f4edba7371e4', '2018-11-22', 'Prince Georges Park', 'Decoration', 7, 0, 0);
INSERT INTO tasks VALUES ('31ad6e0f-6164-4794-b824-ecb47d491db1', 'whiskey@gmail.com', NULL, '2ce0c7ea-0f9a-4652-9f75-060ecc8afa99', '2018-10-13', 'Prince Georges Park', 'Errands', 4, 0, 0);
INSERT INTO tasks VALUES ('027d5b00-8f4e-4a5f-8973-7533fda95baf', 'yankee@gmail.com', NULL, '6b5efe3f-e639-4c7f-99f4-dd1c62e63218', '2018-12-26', 'Prince Georges Park', 'Usability Testing', 8, 0, 0);
INSERT INTO tasks VALUES ('01f00de7-3b40-49f0-a594-f374a87183ac', 'yankee@gmail.com', NULL, '1682a317-0811-4fff-bd84-7a02308ff541', '2018-12-29', 'Prince Georges Park', 'Web Design & Development', 7, 0, 0);
INSERT INTO tasks VALUES ('30445467-f0e0-4d77-b937-998cba5b64a3', 'papa@gmail.com', NULL, 'd9eafe21-07ee-4869-90ec-e8096728288e', '2018-11-26', 'Prince Georges Park', 'Marketing', 7, 0, 0);
INSERT INTO tasks VALUES ('6abd7ed0-4880-481b-a277-4a5105e7b94c', 'november@gmail.com', NULL, '7902e225-b3cb-4d96-b9f5-06d7802ab678', '2018-12-11', 'Prince Georges Park', 'Event Planning', 8, 0, 0);
INSERT INTO tasks VALUES ('8272b473-0f64-4645-bb6f-3ee0c4ee85a2', 'zulu@gmail.com', NULL, '7e165556-7ec6-4ede-aa60-b10af7bf289b', '2018-12-17', 'Prince Georges Park', 'Deep Clean', 3, 0, 0);
INSERT INTO tasks VALUES ('7a1229b1-48bc-43da-85e7-7ed282c44ed5', 'oscar@gmail.com', NULL, 'dd8c8fed-89b1-40bd-bd98-3c7d83d55a1f', '2018-11-29', 'Prince Georges Park', 'Data Entry', 2, 0, 0);
INSERT INTO tasks VALUES ('455c31a4-97d0-445e-9b9e-831c17c6567b', 'x-ray@gmail.com', NULL, '80089145-bf38-4def-9bea-444f0cd0997a', '2018-12-29', 'Prince Georges Park', 'Laundry and Ironing', 3, 0, 0);
INSERT INTO tasks VALUES ('72319cfc-1ec8-4801-834b-f6aa14722530', 'november@gmail.com', NULL, '1682a317-0811-4fff-bd84-7a02308ff541', '2018-12-18', 'Prince Georges Park', 'Web Design & Development', 2, 0, 0);
INSERT INTO tasks VALUES ('eab6e89c-e59d-4c1d-aa0b-def346aba3bc', 'papa@gmail.com', NULL, '3aae12fe-fec8-4a5b-b421-fcbe5a5624b3', '2018-10-29', 'Prince Georges Park', 'Arts / Crafts', 2, 0, 0);
INSERT INTO tasks VALUES ('3ff3622a-7158-4f0f-81bc-3615cf11f7a6', 'november@gmail.com', NULL, '93b7a614-9f4f-4371-a2bd-d7d305d15a90', '2018-12-24', 'Prince Georges Park', 'Entertainment', 8, 0, 0);
INSERT INTO tasks VALUES ('bde63977-f2e3-414b-912b-21be2867e886', 'zulu@gmail.com', NULL, '2ce0c7ea-0f9a-4652-9f75-060ecc8afa99', '2018-12-24', 'Prince Georges Park', 'Errands', 8, 0, 0);
INSERT INTO tasks VALUES ('14978f91-26f0-401f-9c41-9abb1d013a35', 'romeo@gmail.com', NULL, 'a40aac8b-52e9-4c1d-8869-f7809f6ad9c8', '2018-10-11', 'Prince Georges Park', 'Executive Assistant', 5, 0, 0);
INSERT INTO tasks VALUES ('baab4bdc-c992-4b75-8328-e06ef2dec164', 'sierra@gmail.com', NULL, '2ce0c7ea-0f9a-4652-9f75-060ecc8afa99', '2018-10-29', 'Prince Georges Park', 'Errands', 7, 0, 0);
INSERT INTO tasks VALUES ('a8a7e29e-767c-480a-8418-23aac0943a45', 'november@gmail.com', NULL, '9ecf0e55-b065-4e25-8a5b-f4edba7371e4', '2018-10-24', 'Prince Georges Park', 'Decoration', 5, 0, 0);
INSERT INTO tasks VALUES ('3d05b826-82f9-4f7b-a478-df50fda0a491', 'x-ray@gmail.com', NULL, '29cf7448-3ecb-4fb4-bbba-324db1ad770f', '2018-10-23', 'Prince Georges Park', 'Mounting', 6, 0, 0);
INSERT INTO tasks VALUES ('fa9d009d-3bcf-4908-a653-e0d6d657f44b', 'sierra@gmail.com', NULL, 'db970acf-84ce-447a-a393-f8165e2cb403', '2018-12-16', 'Prince Georges Park', 'Writing & Editing', 2, 0, 0);
INSERT INTO tasks VALUES ('48858eaa-d1f0-481a-9a05-1f8fa327eff7', 'november@gmail.com', NULL, '1682a317-0811-4fff-bd84-7a02308ff541', '2018-11-26', 'Prince Georges Park', 'Web Design & Development', 2, 0, 0);
INSERT INTO tasks VALUES ('c3ae7c51-6786-4756-8c1a-2a1eb38d9ee5', 'x-ray@gmail.com', NULL, '2ce0c7ea-0f9a-4652-9f75-060ecc8afa99', '2018-11-19', 'Prince Georges Park', 'Errands', 4, 0, 0);
INSERT INTO tasks VALUES ('198c8ac0-9202-4e79-8f5b-3b2b434b4037', 'tango@gmail.com', NULL, '641466a9-e723-4771-87e6-561e023648c2', '2018-11-13', 'Prince Georges Park', 'Organization', 5, 0, 0);
INSERT INTO tasks VALUES ('6ea31acc-3cee-402d-9d9b-b2992d0a7100', 'yankee@gmail.com', NULL, '6b5efe3f-e639-4c7f-99f4-dd1c62e63218', '2018-12-16', 'Prince Georges Park', 'Usability Testing', 8, 0, 0);
INSERT INTO tasks VALUES ('01deb8ec-ba2a-45c3-993a-b12ea5cc1cda', 'romeo@gmail.com', NULL, '387cf2b7-e3b4-4856-8b26-616a1156e05b', '2018-11-26', 'Prince Georges Park', 'Carpentry & Construction', 8, 0, 0);
INSERT INTO tasks VALUES ('1b60786f-a3f3-47c8-b07c-012cbe6f05f3', 'november@gmail.com', NULL, '9ecf0e55-b065-4e25-8a5b-f4edba7371e4', '2018-12-23', 'Prince Georges Park', 'Decoration', 6, 0, 0);
INSERT INTO tasks VALUES ('1541059f-3aa6-41c6-b809-6898acf2c0fc', 'quebec@gmail.com', NULL, '641466a9-e723-4771-87e6-561e023648c2', '2018-12-29', 'Prince Georges Park', 'Organization', 4, 0, 0);
INSERT INTO tasks VALUES ('06e94567-0548-44f0-80bf-3d7d7e87fb9a', 'quebec@gmail.com', NULL, '6b5efe3f-e639-4c7f-99f4-dd1c62e63218', '2018-10-12', 'Prince Georges Park', 'Usability Testing', 2, 0, 0);
INSERT INTO tasks VALUES ('60b96c13-b0d4-4174-b2b1-f4063bad1a9d', 'uniform@gmail.com', NULL, 'cd723d16-ecee-4b10-9ad4-eff55f1e8874', '2018-11-11', 'Prince Georges Park', 'Selling Online', 3, 0, 0);
INSERT INTO tasks VALUES ('4303a95c-6b8b-4f87-94d6-4d16ec03744a', 'oscar@gmail.com', NULL, '1839d04f-d688-4ebb-b8bb-947eee5fd761', '2018-11-22', 'Prince Georges Park', 'Cleaning', 1, 0, 0);
INSERT INTO tasks VALUES ('90895c10-d17e-4298-bede-daa4aebdb0e2', 'uniform@gmail.com', NULL, '1682a317-0811-4fff-bd84-7a02308ff541', '2018-10-16', 'Prince Georges Park', 'Web Design & Development', 3, 0, 0);
INSERT INTO tasks VALUES ('c7dfabef-e09a-4e18-8ab1-a8be563f6672', 'papa@gmail.com', NULL, 'd4e71b1e-5a3b-4e53-9221-5da2b83eefe2', '2018-12-10', 'Prince Georges Park', 'Shopping', 2, 0, 0);
INSERT INTO tasks VALUES ('31b35cc4-2a75-42d7-bfca-adc370bd89fc', 'yankee@gmail.com', NULL, '02bae7f9-412c-4b47-b6c5-806abcf61a47', '2018-12-17', 'Prince Georges Park', 'Automotive', 3, 0, 0);
INSERT INTO tasks VALUES ('d80cff19-92a6-4f17-8f28-b214d6f3da6d', 'uniform@gmail.com', NULL, 'd4e71b1e-5a3b-4e53-9221-5da2b83eefe2', '2018-10-24', 'Prince Georges Park', 'Shopping', 1, 0, 0);
INSERT INTO tasks VALUES ('c8e48af4-2307-4798-907d-417dbfacf617', 'tango@gmail.com', NULL, '99bba215-d537-408c-aad4-d220f718a192', '2018-12-26', 'Prince Georges Park', 'Plumbing', 6, 0, 0);
INSERT INTO tasks VALUES ('28c75a45-d7d2-4cd8-8f3d-a56033cab3d6', 'zulu@gmail.com', NULL, '7902e225-b3cb-4d96-b9f5-06d7802ab678', '2018-12-27', 'Prince Georges Park', 'Event Planning', 5, 0, 0);
INSERT INTO tasks VALUES ('c5ffccad-63ad-40c1-81be-daf026b0b3d2', 'victor@gmail.com', NULL, '268e18fd-e2b5-4d8f-8696-4385f004ffda', '2018-10-14', 'Prince Georges Park', 'Videography', 5, 0, 0);
INSERT INTO tasks VALUES ('4ded5822-6173-48ce-8b86-7af92cf5c8ca', 'yankee@gmail.com', NULL, '65d37a53-c4f3-4820-a3a1-489e1e99378e', '2018-10-27', 'Prince Georges Park', 'Office Administration', 3, 0, 0);
INSERT INTO tasks VALUES ('d4097a40-d734-4940-87ef-796e675fc719', 'quebec@gmail.com', NULL, '7902e225-b3cb-4d96-b9f5-06d7802ab678', '2018-10-10', 'Prince Georges Park', 'Event Planning', 2, 0, 0);
INSERT INTO tasks VALUES ('5689a0a8-634f-4380-917b-9c8d0dfea7ec', 'quebec@gmail.com', NULL, '8979eb86-551d-4f54-a9b7-0d4481093df7', '2018-10-10', 'Prince Georges Park', 'Sewing', 4, 0, 0);
INSERT INTO tasks VALUES ('4334c42e-53fd-4be4-9368-4a216f26e7d1', 'quebec@gmail.com', NULL, '641466a9-e723-4771-87e6-561e023648c2', '2018-12-14', 'Prince Georges Park', 'Organization', 3, 0, 0);
INSERT INTO tasks VALUES ('0d0586f7-f7d7-49e6-8716-bdb703ebde8b', 'november@gmail.com', NULL, '2ce0c7ea-0f9a-4652-9f75-060ecc8afa99', '2018-12-23', 'Prince Georges Park', 'Errands', 2, 0, 0);
INSERT INTO tasks VALUES ('392fa554-7d42-4b37-b9f2-210ba90607a7', 'whiskey@gmail.com', NULL, '9fef9717-5bb2-4114-9d5c-c42746449701', '2018-11-11', 'Prince Georges Park', 'Research', 4, 0, 0);
INSERT INTO tasks VALUES ('1d410e1f-47ad-4e5c-9c18-4d96f3ea7563', 'whiskey@gmail.com', NULL, 'cd723d16-ecee-4b10-9ad4-eff55f1e8874', '2018-10-18', 'Prince Georges Park', 'Selling Online', 3, 0, 0);
INSERT INTO tasks VALUES ('23369834-7509-4910-ac8f-cae4439cb4b7', 'tango@gmail.com', NULL, 'cd723d16-ecee-4b10-9ad4-eff55f1e8874', '2018-10-19', 'Prince Georges Park', 'Selling Online', 7, 0, 0);
INSERT INTO tasks VALUES ('f6ed1929-823b-4510-a24f-abfda644ca13', 'uniform@gmail.com', NULL, '4dc35b1d-a5f6-4352-acf4-93a6edc7b940', '2018-12-13', 'Prince Georges Park', 'Help Moving', 5, 0, 0);
INSERT INTO tasks VALUES ('f4965e6b-9bd0-4dbc-926d-65702737f893', 'papa@gmail.com', NULL, 'a40aac8b-52e9-4c1d-8869-f7809f6ad9c8', '2018-11-20', 'Prince Georges Park', 'Executive Assistant', 4, 0, 0);
INSERT INTO tasks VALUES ('c67bb75c-e174-4bb0-8d9f-3cb5f5ac511a', 'x-ray@gmail.com', NULL, '12bd5b0f-84f0-445b-a033-c92eec5c1ae1', '2018-11-25', 'Prince Georges Park', 'Pet Sitting', 1, 0, 0);
INSERT INTO tasks VALUES ('3744e100-f591-4b00-bb6a-7350ad5ca0b7', 'quebec@gmail.com', NULL, '68189c23-ff12-488f-8294-73ccbd0a005f', '2018-12-10', 'Prince Georges Park', 'Window Cleaning', 7, 0, 0);
INSERT INTO tasks VALUES ('6da54354-cefe-44c1-ac9e-373460999483', 'romeo@gmail.com', NULL, 'd9eafe21-07ee-4869-90ec-e8096728288e', '2018-12-26', 'Prince Georges Park', 'Marketing', 8, 0, 0);
INSERT INTO tasks VALUES ('3313fc92-014d-4722-9408-815877b64927', 'yankee@gmail.com', NULL, '450d2a7d-a0d2-4402-88b3-b54e083510df', '2018-11-15', 'Prince Georges Park', 'Event Staffing', 6, 0, 0);
INSERT INTO tasks VALUES ('eaacb2ea-54dc-4aed-bd20-1f2ff0431882', 'sierra@gmail.com', NULL, '2cd41a02-ce55-4e8b-bfdb-626b6a307a85', '2018-11-27', 'Prince Georges Park', 'Minor Home Repairs', 7, 0, 0);
INSERT INTO tasks VALUES ('06342aab-5974-4a05-810b-a4b2a7ac1013', 'x-ray@gmail.com', NULL, 'cd723d16-ecee-4b10-9ad4-eff55f1e8874', '2018-10-28', 'Prince Georges Park', 'Selling Online', 3, 0, 0);
INSERT INTO tasks VALUES ('8464b7a7-de90-4292-9154-64852b5dea4d', 'romeo@gmail.com', NULL, '272737c3-a7f0-4d49-aa84-5d58459203fc', '2018-10-22', 'Prince Georges Park', 'Packing & Shipping', 4, 0, 0);
INSERT INTO tasks VALUES ('a7c9a3c1-aa63-4d5f-b4a4-b747537dcf8d', 'yankee@gmail.com', NULL, '2cd41a02-ce55-4e8b-bfdb-626b6a307a85', '2018-11-21', 'Prince Georges Park', 'Minor Home Repairs', 3, 0, 0);
INSERT INTO tasks VALUES ('4fc2f98b-9e9c-4ec7-9144-e8b09cb07bf7', 'tango@gmail.com', NULL, '9ecf0e55-b065-4e25-8a5b-f4edba7371e4', '2018-11-22', 'Prince Georges Park', 'Decoration', 5, 0, 0);
INSERT INTO tasks VALUES ('a775327c-831f-4d22-99ad-f64f389690f5', 'tango@gmail.com', NULL, '4dc35b1d-a5f6-4352-acf4-93a6edc7b940', '2018-11-19', 'Prince Georges Park', 'Help Moving', 1, 0, 0);
INSERT INTO tasks VALUES ('40b240f1-a2ca-45b2-ab2f-e3676198913a', 'papa@gmail.com', NULL, 'b9de6f8a-c2e2-4a59-8b6e-1e1dae4d2363', '2018-11-21', 'Prince Georges Park', 'Waiting in Line', 2, 0, 0);
INSERT INTO tasks VALUES ('7ed17f3c-876c-496b-b223-5c9c05385dff', 'quebec@gmail.com', NULL, '641466a9-e723-4771-87e6-561e023648c2', '2018-12-24', 'Prince Georges Park', 'Organization', 6, 0, 0);
INSERT INTO tasks VALUES ('0c25e962-d8cf-4fea-83df-ee71f48c8310', 'uniform@gmail.com', NULL, '8e113ea3-b135-46bb-a27f-70b234ba50a8', '2018-10-24', 'Prince Georges Park', 'Graphic Design', 8, 0, 0);
INSERT INTO tasks VALUES ('6638d9e6-f4fa-4b6e-b531-8d1442c04601', 'tango@gmail.com', NULL, 'db970acf-84ce-447a-a393-f8165e2cb403', '2018-11-20', 'Prince Georges Park', 'Writing & Editing', 1, 0, 0);
INSERT INTO tasks VALUES ('f1520658-3285-4b67-91d6-2e76ece08853', 'oscar@gmail.com', NULL, '272737c3-a7f0-4d49-aa84-5d58459203fc', '2018-11-18', 'Prince Georges Park', 'Packing & Shipping', 4, 0, 0);
INSERT INTO tasks VALUES ('0237abe6-e49c-4751-af00-f59c1172b9d6', 'romeo@gmail.com', NULL, '387cf2b7-e3b4-4856-8b26-616a1156e05b', '2018-11-17', 'Prince Georges Park', 'Carpentry & Construction', 1, 0, 0);
INSERT INTO tasks VALUES ('b030f487-3cdc-4b14-bca4-e2861df8a343', 'november@gmail.com', NULL, '93b7a614-9f4f-4371-a2bd-d7d305d15a90', '2018-11-26', 'Prince Georges Park', 'Entertainment', 1, 0, 0);
INSERT INTO tasks VALUES ('b7622fcb-2527-409c-8f66-17c46561961a', 'oscar@gmail.com', NULL, 'd9eafe21-07ee-4869-90ec-e8096728288e', '2018-10-10', 'Prince Georges Park', 'Marketing', 3, 0, 0);
INSERT INTO tasks VALUES ('0600a994-2be4-4bf2-9108-cb0cb4146f9b', 'november@gmail.com', NULL, '99bba215-d537-408c-aad4-d220f718a192', '2018-11-24', 'Prince Georges Park', 'Plumbing', 1, 0, 0);
INSERT INTO tasks VALUES ('2937bbd7-5cde-43d2-906d-07ac3c9a6075', 'quebec@gmail.com', NULL, '0de03e5b-34ea-4297-875e-7eb0b13eefb6', '2018-12-17', 'Prince Georges Park', 'Furniture Assembly', 4, 0, 0);
INSERT INTO tasks VALUES ('7b7d4ac0-f7c1-4593-847e-c3ac7a1da125', 'papa@gmail.com', NULL, '0de03e5b-34ea-4297-875e-7eb0b13eefb6', '2018-10-14', 'Prince Georges Park', 'Furniture Assembly', 7, 0, 0);
INSERT INTO tasks VALUES ('7c06d024-db90-49e0-ae8f-c69c8699fac4', 'zulu@gmail.com', NULL, '46186675-241d-40ce-91ea-353f30b8e062', '2018-11-27', 'Prince Georges Park', 'Computer Help', 1, 0, 0);
INSERT INTO tasks VALUES ('26ac562d-67f5-4a52-b9ce-9ebe6c72081e', 'quebec@gmail.com', NULL, '29cf7448-3ecb-4fb4-bbba-324db1ad770f', '2018-12-10', 'Prince Georges Park', 'Mounting', 5, 0, 0);


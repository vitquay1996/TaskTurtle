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
    custom_catergory   VARCHAR(63),
    date               DATE NOT NULL,
    time_start         TIME NOT NULL CHECK (time_start > localtime),
    time_end           TIME NOT NULL,
    address            VARCHAR(255) NOT NULL,
    description        VARCHAR(1023),
    is_finished        INT NOT NULL CHECK ( is_finished BETWEEN 0 AND 1 ),
    is_paid            INT NOT NULL CHECK ( is_paid BETWEEN 0 AND 1 ),
    CONSTRAINT check_task_conditions CHECK ( is_finished >= is_paid ),
    CONSTRAINT check_end_after_start_date CHECK (time_end > time_start),
    CONSTRAINT either_custom_or_system_category CHECK ((category IS NULL AND custom_catergory IS NOT NULL) OR (category IS NULL AND custom_catergory IS NOT NULL))
);

CREATE TABLE bids (
    tasker_email VARCHAR(63) REFERENCES users(email),
    task_id VARCHAR(63) REFERENCES tasks(id),
    price NUMERIC NOT NULL, 
    is_accepted INT NOT NULL CHECK ( is_accepted BETWEEN -1 and 1 ),
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

CREATE TABLE review_photos (
    task_id VARCHAR(63) REFERENCES tasks(id),
    reviewer_email VARCHAR(63) REFERENCES users(email),
    receiver_email VARCHAR(63) REFERENCES users(email),
    receiver_role role NOT NULL,
    review_photo_path VARCHAR(63),
    caption VARCHAR(63)
);
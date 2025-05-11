CREATE TABLE booking
(
    booking_id             BIGINT AUTO_INCREMENT NOT NULL,
    booking_date           datetime NULL,
    is_booking_confirmed   BIT(1) NOT NULL,
    number_of_tickets      INT    NOT NULL,
    payment_status         ENUM NULL,
    payment_transaction_id VARCHAR(255) NULL,
    total_price DOUBLE NULL,
    user_id                INT    NOT NULL,
    tour_id                BIGINT NOT NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (booking_id)
);

CREATE TABLE bookings
(
    id              BIGINT AUTO_INCREMENT NOT NULL,
    booking_date    date         NOT NULL,
    payment_status  VARCHAR(255) NOT NULL,
    status          VARCHAR(255) NOT NULL,
    tour_package_id BIGINT       NOT NULL,
    user_id         BIGINT       NOT NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE customer
(
    id         INT NOT NULL,
    city       VARCHAR(255) NULL,
    name       VARCHAR(255) NULL,
    first_name VARCHAR(255) NULL,
    last_name  VARCHAR(255) NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE customer_seq
(
    next_val BIGINT NULL
);

CREATE TABLE locations
(
    id                    BIGINT AUTO_INCREMENT NOT NULL,
    country               VARCHAR(255) NULL,
    distance DOUBLE NULL,
    estimated_travel_time VARCHAR(255) NULL,
    from_location         VARCHAR(255) NULL,
    location_description  VARCHAR(255) NULL,
    to_location           VARCHAR(255) NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE lodgings
(
    id                  BIGINT AUTO_INCREMENT NOT NULL,
    address             VARCHAR(255) NULL,
    lodging_description VARCHAR(255) NULL,
    lodging_name        VARCHAR(255) NULL,
    lodging_type        VARCHAR(255) NULL,
    rating DOUBLE NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE payments
(
    id                  BIGINT AUTO_INCREMENT NOT NULL,
    amount              DECIMAL(38, 2) NOT NULL,
    paid_at             datetime NULL,
    payment_provider_id VARCHAR(255) NULL,
    status              VARCHAR(255)   NOT NULL,
    booking_id          BIGINT         NOT NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE product
(
    id                INT AUTO_INCREMENT NOT NULL,
    brand             VARCHAR(255) NULL,
    category          VARCHAR(255) NULL,
    `description`     VARCHAR(255) NULL,
    image_data        BLOB NULL,
    image_name        VARCHAR(255) NULL,
    image_type        VARCHAR(255) NULL,
    name              VARCHAR(255) NULL,
    price             DECIMAL(38, 2) NULL,
    product_available BIT(1) NOT NULL,
    release_date      datetime NULL,
    stock_quantity    INT    NOT NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE reviews
(
    id              BIGINT AUTO_INCREMENT NOT NULL,
    comment         LONGTEXT NOT NULL,
    created_at      datetime NULL,
    rating          INT      NOT NULL,
    tour_package_id BIGINT   NOT NULL,
    user_id         BIGINT   NOT NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE tour
(
    id                BIGINT AUTO_INCREMENT NOT NULL,
    end_date          date NULL,
    price DOUBLE NULL,
    start_date        date NULL,
    tickets_available INT NULL,
    tour_description  VARCHAR(255) NULL,
    tour_guide        VARCHAR(255) NULL,
    tour_name         VARCHAR(255) NULL,
    location_id       BIGINT NULL,
    lodging_id        BIGINT NULL,
    transport_id      BIGINT NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE tour_activities
(
    tour_id  BIGINT NOT NULL,
    activity VARCHAR(255) NULL
);

CREATE TABLE tour_images
(
    tour_id BIGINT NOT NULL,
    image   VARCHAR(255) NULL
);

CREATE TABLE tour_meals
(
    tour_id BIGINT NOT NULL,
    meal    VARCHAR(255) NULL
);

CREATE TABLE tour_packages
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    created_at    datetime NULL,
    `description` LONGTEXT       NOT NULL,
    duration      INT            NOT NULL,
    image_url     VARCHAR(255)   NOT NULL,
    itinerary     LONGTEXT NULL,
    location      VARCHAR(255)   NOT NULL,
    price         DECIMAL(38, 2) NOT NULL,
    title         VARCHAR(255)   NOT NULL,
    created_by    BIGINT         NOT NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE transports
(
    id                    BIGINT AUTO_INCREMENT NOT NULL,
    estimated_travel_time VARCHAR(255) NULL,
    transport_description VARCHAR(255) NULL,
    transport_name        VARCHAR(255) NULL,
    transport_type        VARCHAR(255) NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE users
(
    id             BIGINT AUTO_INCREMENT NOT NULL,
    created_at     datetime NULL,
    email          VARCHAR(255) NOT NULL,
    name           VARCHAR(20)  NOT NULL,
    password       VARCHAR(255) NOT NULL,
    `role`         VARCHAR(255) NOT NULL,
    contact_number VARCHAR(255) NULL,
    enabled        BIT(1)       NOT NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE users_seq
(
    next_val BIGINT NULL
);

CREATE TABLE vaccine
(
    id                  INT AUTO_INCREMENT NOT NULL,
    vaccine_company     VARCHAR(255) NULL,
    vaccine_description VARCHAR(255) NULL,
    vaccine_name        VARCHAR(255) NULL,
    vaccine_type        VARCHAR(255) NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE vaccine_seq
(
    next_val BIGINT NULL
);

ALTER TABLE users
    ADD CONSTRAINT UK_6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);

ALTER TABLE payments
    ADD CONSTRAINT UK_nuscjm6x127hkb15kcb8n56wo UNIQUE (booking_id);

ALTER TABLE tour
    ADD CONSTRAINT UKcrk40suxr2mny3dla0bwko4i3 UNIQUE (transport_id);

ALTER TABLE tour
    ADD CONSTRAINT UKjco2c7q23geii9l3blmxc4bsq UNIQUE (lodging_id);

ALTER TABLE tour
    ADD CONSTRAINT UKkk5j474loyaafhawbt20bdbea UNIQUE (location_id);

ALTER TABLE users
    ADD CONSTRAINT UKn14mnjfh0j5psw8omlegp1d68 UNIQUE (contact_number);

ALTER TABLE bookings
    ADD CONSTRAINT FK1r6he0afbpy7nlj42jekk3thb FOREIGN KEY (tour_package_id) REFERENCES tour_packages (id) ON DELETE NO ACTION;

CREATE INDEX FK1r6he0afbpy7nlj42jekk3thb ON bookings (tour_package_id);

ALTER TABLE tour_activities
    ADD CONSTRAINT FK4x1m1h6kesksq9eo4ctdvc2bg FOREIGN KEY (tour_id) REFERENCES tour (id) ON DELETE NO ACTION;

CREATE INDEX FK4x1m1h6kesksq9eo4ctdvc2bg ON tour_activities (tour_id);

ALTER TABLE tour
    ADD CONSTRAINT FKamtjpulsbi9yu1kx9x74soosp FOREIGN KEY (lodging_id) REFERENCES lodgings (id) ON DELETE NO ACTION;

ALTER TABLE tour
    ADD CONSTRAINT FKb1bjmetjxov9vbwlljncd2jio FOREIGN KEY (transport_id) REFERENCES transports (id) ON DELETE NO ACTION;

ALTER TABLE payments
    ADD CONSTRAINT FKc52o2b1jkxttngufqp3t7jr3h FOREIGN KEY (booking_id) REFERENCES bookings (id) ON DELETE NO ACTION;

ALTER TABLE reviews
    ADD CONSTRAINT FKcgy7qjc1r99dp117y9en6lxye FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;

CREATE INDEX FKcgy7qjc1r99dp117y9en6lxye ON reviews (user_id);

ALTER TABLE tour_meals
    ADD CONSTRAINT FKdc6lc5rwsw0ycaxxy3wtwmimm FOREIGN KEY (tour_id) REFERENCES tour (id) ON DELETE NO ACTION;

CREATE INDEX FKdc6lc5rwsw0ycaxxy3wtwmimm ON tour_meals (tour_id);

ALTER TABLE bookings
    ADD CONSTRAINT FKeyog2oic85xg7hsu2je2lx3s6 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;

CREATE INDEX FKeyog2oic85xg7hsu2je2lx3s6 ON bookings (user_id);

ALTER TABLE tour_packages
    ADD CONSTRAINT FKfu6qp0n1idhqmg2h4errfc881 FOREIGN KEY (created_by) REFERENCES users (id) ON DELETE NO ACTION;

CREATE INDEX FKfu6qp0n1idhqmg2h4errfc881 ON tour_packages (created_by);

ALTER TABLE tour
    ADD CONSTRAINT FKi3i6tpw6btqxatokfuwn3ts6m FOREIGN KEY (location_id) REFERENCES locations (id) ON DELETE NO ACTION;

ALTER TABLE reviews
    ADD CONSTRAINT FKkrvvcaaoq8ie3v96ktg8elty9 FOREIGN KEY (tour_package_id) REFERENCES tour_packages (id) ON DELETE NO ACTION;

CREATE INDEX FKkrvvcaaoq8ie3v96ktg8elty9 ON reviews (tour_package_id);

ALTER TABLE booking
    ADD CONSTRAINT FKlc7bhi14w8e558dt15eofelm4 FOREIGN KEY (tour_id) REFERENCES tour (id) ON DELETE NO ACTION;

CREATE INDEX FKlc7bhi14w8e558dt15eofelm4 ON booking (tour_id);

ALTER TABLE tour_images
    ADD CONSTRAINT FKsr8u6cqvu0fxqst45pkhjnljw FOREIGN KEY (tour_id) REFERENCES tour (id) ON DELETE NO ACTION;

CREATE INDEX FKsr8u6cqvu0fxqst45pkhjnljw ON tour_images (tour_id);
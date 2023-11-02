DROP DATABASE IF EXISTS giftune_db;
CREATE DATABASE giftune_db;
\c giftune_db 

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    friends_list_id INTEGER REFERENCES friends_list(id),
    wishlist_id INTEGER REFERENCES wishlist_list(id),
    notification_id INTEGER REFERENCES notification_list(id)
);
INSERT INTO users(user_name, dob, email, friends_list_id, wishlist_id, notification_id) VALUES
('Akira', '1998-12-21', 'akira@email.com', 1, 1, 1),
('Chantal', '1999-05-13', 'chantal@email.com', 2, 2, 4),
('Onyx', '1997-01-06', 'onyx@email.com', 3, 3, 3),
('Naomi', '1994-09-10', 'naomi@email.com', 4, 4, 2),
('Mussie', '1989-02-27', 'mussie@email.com', 5, 5, 5);


DROP TABLE IF EXISTS friends_list;
CREATE TABLE friends_list (
    id SERIAL PRIMARY KEY NOT NULL,
    user_id INTEGER REFERENCES users(id),
    friends_id INTEGER REFERENCES users(id)
);
INSERT INTO friends_list(user_id, friends_id) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(3, 4),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 5),
(5, 1),
(5, 2),
(5, 3),
(5, 4);


DROP TABLE IF EXISTS wishlist;
CREATE TABLE wishlist (
    id SERIAL PRIMARY KEY NOT NULL,
    user_id INTEGER REFERENCES users(id),
    item_name VARCHAR(255),
    link VARCHAR(255)
);
INSERT INTO wishlist(user_id, item_name, link) VALUES
(1, 'keyboard', 'https://www.amazon.com/Computer-Keyboard-Indicators-Spill-Resistant-Anti-Wear/dp/B09NLS9TK4/ref=sr_1_3?keywords=keyboard&qid=1698683098&sr=8-3'),
(1, 'watch', 'https://www.amazon.com/Casio-F108WH-Illuminator-Collection-Digital/dp/B0053HBJBE/ref=sr_1_2?crid=2ZSOX1A7Q9BR8&keywords=watch&qid=1698683161&sprefix=watch%2Caps%2C67&sr=8-2'),
(2, 'ipad pro', 'https://www.amazon.com/Apple-12-9-inch-iPad-Pro-Wi-Fi-256GB/dp/B0BJLFC67L/ref=sr_1_3?crid=YC0HIFYXGDV7&keywords=ipad+pro&qid=1698683221&sprefix=ipad+pro%2Caps%2C74&sr=8-3&ufe=app_do%3Aamzn1.fos.765d4786-5719-48b9-b588-eab9385652d5'),
(3, 'legos', 'https://www.amazon.com/LEGO-6386348-TBD-Ideas-21333/dp/B09SM828FD/ref=sr_1_5?crid=1T3E00D7AGANB&keywords=legos&qid=1698683290&sprefix=legos%2Caps%2C103&sr=8-5&ufe=app_do%3Aamzn1.fos.f5122f16-c3e8-4386-bf32-63e904010ad0'),
(4, 'dress', 'https://www.etsy.com/listing/221130185/hooded-tunic-dress-with-thumb-hole?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=&ref=sr_gallery-1-26&frs=1&bes=1&referrer_page_guid=f730e328f6f.139127ed5b393d61b485.00&organic_search_click=1'),
(5, 'headphones', 'https://www.ebay.com/p/19051992378?iid=394850116603');


DROP TABLE IF EXISTS notifications;
CREATE TABLE notifications (
    id SERIAL PRIMARY KEY NOT NULL,
    user_id INTEGER REFERENCES users(id),
    messages TEXT
);
INSERT INTO notifications(user_id, messages) VALUES
(1, "Hello world!"),
(2, "Hey fam!"),
(3, "You're my best friend!"),
(4, "I am groot!"),
(5, "Hi");
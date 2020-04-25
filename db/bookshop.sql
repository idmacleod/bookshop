DROP TABLE books;
DROP TABLE authors;
DROP TABLE publishers;

CREATE TABLE publishers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(255)
);

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    author_id INT REFERENCES authors(id) ON DELETE CASCADE,
    publisher_id INT REFERENCES publishers(id) ON DELETE CASCADE,
    description TEXT,
    genre VARCHAR(255),
    buy_cost INT,
    sell_price INT,
    stock_count INT,
    copies_sold INT
);
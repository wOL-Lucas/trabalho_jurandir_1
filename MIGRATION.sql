CREATE TABLE tb_manufacturer(
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(13) NOT NULL UNIQUE
);

CREATE TABLE tb_products(
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price NUMERIC(38, 2) NOT NULL,
    manufacturer_id BIGSERIAL NOT NULL,
    FOREIGN KEY (manufacturer_id) REFERENCES tb_manufacturer(id) ON DELETE CASCADE
);

CREATE TABLE tb_categories(
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE tb_products_categories(
    product_id BIGSERIAL,
    category_id BIGSERIAL,
    FOREIGN KEY (product_id) REFERENCES tb_products(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES tb_categories(id) ON DELETE CASCADE,
    PRIMARY KEY (product_id, category_id)
);

CREATE TABLE tb_users(
     id BIGSERIAL PRIMARY KEY,
     first_name VARCHAR(100) NOT NULL,
     last_name VARCHAR(100) NOT NULL,
     cpf VARCHAR(11) NOT NULL UNIQUE,
     email VARCHAR(100) NOT NULL UNIQUE,
     created_at TIMESTAMP(6) NOT NULL,
     password VARCHAR(300) NOT NULL,
     role VARCHAR(6) NOT NULL
);

CREATE TABLE tb_address (
    id BIGSERIAL PRIMARY KEY,
    zip_code VARCHAR(8) NOT NULL,
    street VARCHAR(255) NOT NULL,
    complement VARCHAR(255),
    neighborhood VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    user_id BIGSERIAL,
    FOREIGN KEY (user_id) REFERENCES tb_users(id) ON DELETE CASCADE
);

CREATE TABLE tb_orders (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGSERIAL NOT NULL,
    delivery_address BIGSERIAL NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES tb_user(id) ON DELETE CASCADE,
    FOREIGN KEY (delivery_address) REFERENCES tb_address(id) ON DELETE CASCADE
);

CREATE TABLE tb_order_product (
    order_id BIGSERIAL NOT NULL,
    product_id BIGSERIAL NOT NULL,
    FOREIGN KEY (order_id) REFERENCES tb_orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES tb_products(id) ON DELETE CASCADE,
    PRIMARY KEY (order_id, product_id)
    
);

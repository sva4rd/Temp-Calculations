-- PostgreSQL script for database and tables creation

-- Создание базы данных
CREATE DATABASE calculator_db;

-- Подключение к базе данных
\c calculator_db;

-- Таблица examples
DROP TABLE IF EXISTS examples;

CREATE TABLE examples (
    example_id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    content TEXT NOT NULL,
    result TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- Таблица messages
DROP TABLE IF EXISTS messages;

CREATE TABLE messages (
    message_id BIGSERIAL PRIMARY KEY,
    sender_id BIGINT NOT NULL,
    receiver_id BIGINT,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sender FOREIGN KEY (sender_id) REFERENCES users (user_id),
    CONSTRAINT fk_receiver FOREIGN KEY (receiver_id) REFERENCES users (user_id)
);

-- Таблица users
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id BIGSERIAL PRIMARY KEY,
    login VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    user_password VARCHAR(255) NOT NULL,
    username VARCHAR(255),
    gender VARCHAR(255),
    about TEXT,
    solved_tasks INT DEFAULT 0,
    photo BYTEA,
    last_activity TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_admin BOOLEAN NOT NULL DEFAULT FALSE,
    is_blocked BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

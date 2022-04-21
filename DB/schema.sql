DROP DATABASE if EXISTS reviewsData;

CREATE DATABASE reviewsData;

\c reviewsData;

DROP TABLE IF EXISTS characteristics, characteristicReviews, reviews, photos;

CREATE TABLE characteristics(
  id BIGSERIAL PRIMARY KEY,
  product_id  INT NOT NULL,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE characteristicReviews(
  id BIGSERIAL PRIMARY KEY,
  characteristic_id INT NOT NULL,
  review_id INT NOT NULL,
  value INT NOT NULL
);

CREATE TABLE reviews(
  id BIGSERIAL PRIMARY KEY,
  product_id INT NOT NULL,
  rating INT NOT NULL,
  date TIMESTAMPTZ DEFAULT Now(),
  summary TEXT NOT NULL,
  body TEXT NOT NULL,
  recommend BOOLEAN DEFAULT false,
  reported BOOLEAN DEFAULT false,
  reviewer_name VARCHAR(50) NOT NULL,
  reviewer_email VARCHAR(50) NOT NULL,
  response TEXT NOT NULL,
  helpfulness INT DEFAULT 0
);

CREATE TABLE photos(
  id BIGSERIAL PRIMARY KEY,
  review_id INT NOT NULL,
  photo_url VARCHAR(150) NOT NULL
);
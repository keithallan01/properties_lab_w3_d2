DROP TABLE IF EXISTS properties;

CREATE TABLE properties (
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  value VARCHAR(255),
  bedrooms VARCHAR(255),
  year_built INT2
);

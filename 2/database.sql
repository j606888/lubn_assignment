CREATE DATABASE lubn_assignment_2;
\c lubn_assignment_2;

CREATE TABLE factory(
  id SERIAL PRIMARY KEY,
  code VARCHAR(255) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
  location TEXT,
  country TEXT,
  zipcode TEXT,
  city TEXT,
  street TEXT,
  created_at TIMESTAMPTZ NOT NULL default NOW(),
  updated_at TIMESTAMPTZ
);

CREATE TABLE device(
  id SERIAL PRIMARY KEY,
  code VARCHAR(255) NOT NULL UNIQUE,
  factory_code VARCHAR(255) NOT NULL,
  category VARCHAR(255) NOT NULL,
  created_at TIMESTAMPTZ NOT NULL default NOW(),
  updated_at TIMESTAMPTZ
);

CREATE TABLE sensor_data(
  id SERIAL PRIMARY KEY,
  device_code VARCHAR(255) NOT NULL,
  sensed_at TIMESTAMPTZ NOT NULL,
  sense_value FLOAT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL default NOW()
);

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_factory_modtime BEFORE UPDATE ON factory FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();
CREATE TRIGGER update_device_modtime BEFORE UPDATE ON device FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();
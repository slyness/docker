CREATE TABLE costs (
    id char(5) CONSTRAINT firstkey PRIMARY KEY,
    time TIME NOT NULL,
    service varchar(10),
    total decimal 
);

COPY costs(id,time,service,total) FROM '/data/costs.csv' DELIMITER ',' CSV HEADER;
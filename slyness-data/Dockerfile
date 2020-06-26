FROM postgres:12

COPY docker-entrypoint-initdb.d/initialize.sql /docker-entrypoint-initdb.d/initialize.sql

RUN mkdir /data
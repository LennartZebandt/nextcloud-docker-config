FROM postgres:12.2-alpine
COPY ./create-documentserver-db.sql /docker-entrypoint-initdb.d
RUN chmod a+r /docker-entrypoint-initdb.d/*
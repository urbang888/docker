#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username postgres --dbname postgres <<-EOSQL
	CREATE USER demo
	  WITH CREATEDB
	       PASSWORD 'demo';
	CREATE DATABASE demo
	  WITH OWNER=demo
	       TEMPLATE=template0
	       ENCODING='UTF-8'
		   LC_COLLATE = 'sk_SK.UTF-8'
		   LC_CTYPE = 'sk_SK.UTF-8';
	GRANT ALL PRIVILEGES ON DATABASE demo TO demo;
EOSQL

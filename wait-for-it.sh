#!/bin/sh
set -e

until pg_isready -h "$DATABASE_HOST" -p "$DATABASE_PORT" -U "$DATABASE_USER"; do
  echo "Ожидание PostgreSQL..."
  sleep 1
done

exec "$@"

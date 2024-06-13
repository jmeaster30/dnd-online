#!/bin/bash
START_LOCATION="$(pwd)"

cd app
elm-spa build
if [ $? -eq 0 ]; then
  mkdir -p $START_LOCATION/priv/static
  cp -r public/* $START_LOCATION/priv/static

  cd $START_LOCATION

  docker compose -f database/dev-postgres-compose.yml up -d
  START_TIME=0
  until pg_isready -h localhost -U postgres 
  do
    echo "Waiting for PostgreSQL..."
    sleep 1
    if [ START_TIME -eq 60 ]; then
      echo "PostgreSQL took too long to start :("
      exit 1
    fi
    ((START_TIME++))
  done

  mix run --no-halt
else
  echo "Elm build failed. Aborting build"
  cd $START_LOCATION
fi



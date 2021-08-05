#!/bin/bash

echo $EMAIL

sudo docker build --build-arg EMAIL=$EMAIL -t worker .

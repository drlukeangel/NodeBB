#!/bin/bash
service ssh start
cd /usr/src/app
node app --setup && npm start

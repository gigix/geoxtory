#!/bin/bash

echo "Tip: Please make sure you have commited your latest code before you deploy to heroku."
echo "Before using this script, you need to install heroku client in your dev machine."
echo "and then you need to login with our shared accout(ask Pengfei for its)"
git push heroku master

echo "reset heroku database"
heroku pg:reset DATABASE --confirm geoxtorydev

echo "migrate heroku database"
heroku run rake db:migrate

echo "insert seed data to heroku database"
heroku run rake db:seed
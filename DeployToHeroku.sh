#!/bin/bash

echo "Tip: Please make sure you have commited your latest code before you deploy to heroku."
git push heroku master

echo "reset heroku database"
heroku pg:reset DATABASE --confirm powerful-shore-6235

echo "migrate heroku database"
heroku run rake db:migrate

echo "insert seed data to heroku database"
heroku run rake db:seed
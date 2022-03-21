# README
This is a Contacts API that does CRUD, written in Ruby, Ruby on Rails language.

# Live API endpoint link, deployed on Heroku:
https://contacts-api-challenge.herokuapp.com/
(add "/contacts" for contacts table or "/edits" for modifications table).

# Useful information on how to run:
* Ruby version: ruby 3.1.1p18
* Rails version: Rails 7.0.2.3
* Database initialization:
1. Install corresponding PostgreSQL for your OS and create a database (can use PGadmin for database creation).
2. Modify "/config/database.yml" to your machine settings (database name that you chose, username, password, host, port)
3. In project root folder run: rails db:migrate
4. In project root folder run: rails s -p portnumber (replace portnumber with number of your choosing, probably 8000)

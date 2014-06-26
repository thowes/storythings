# README

This README for Storythings web app. Very early version available in storythings.herokuapps.com.

Things you may want to cover:

* Ruby version 1.9.3 (started with that, going to try 1.9.2 and 2.0.0 later on).
* Rails version 4.0.2 (started with 4.0.1 and going to try 4.05 at some point).

* System dependencies: just check the Gemfile and do "bundle install".

* Configuration: you are going to need to create your own database.yml.

* Database using postgresql, do "bundle exec rake db:migrate". Originally started dveleopment with sqlite 3. Just do the normal postgresql stuff to create the database, then 'bundle exec rake db:migrate and bundle exec rake test:prepare'.

* How to run the test suite: tests are based on rspec and cucumber, with some capybara and factorygirl in it. Just try "bundle exec rspec spec/" and "bundle exec cucumber features/".

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions: using Heroku for deployment. Check heroku instructions.

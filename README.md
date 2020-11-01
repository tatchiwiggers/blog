# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# INSTALLING POSTRGRESQL

* Should already be there from the first day setup. If not, in the terminal, you can run:
MACOS: 
brew install postgresql
brew services start postgresql

LINUX:
https://github.com/lewagon/setup/blob/master/UBUNTU.md#postgresql

* Generate a rails app with the --database flag:
rails new blog --database=postgresql

* Create the database on PostgreSQL:
rails db:create

Init and push your git repo.

* # Gemfile NOW HAS:
gem 'pg'  # No more `gem 'sqlite'` thanks to `--database=postgresql`

## QUICK WAGON SETUP

# Terminal
yarn add bootstrap jquery popper.js

# Gemfile
gem 'simple_form'
bundle install

rails generate simple_form:install --bootstrap
rm app/assets/stylesheets/application.css
touch app/assets/stylesheets/application.scss

@import "bootstrap/scss/bootstrap"; => onto /* app/assets/stylesheets/application.scss */

## HEROKU ##
SIGN UP
https://id.heroku.com/signup

INSTALL ON OS X
brew tap heroku/brew && brew install heroku

INSTALL ON UBUNTU
curl https://cli-assets.heroku.com/install.sh | sh

## THE HEROKU ERROR! ##
Remember to run heroku run rails db:migrate

## CLOUDINARY ##
WHERE DO WE PUT OUR SECRET KEYS?
We don't want to share those secret keys on Github, we can use the dotenv gem for security.

# Gemfile
gem 'dotenv-rails', groups: [:development, :test]
bundle install
touch .env
add the .env* file to .gitignore
git status # .env should not be there, we don't want to push it to Github.
git add .
git commit -m "Add dotenv - Protect my secret data in .env file"

## ENVIRONMENT
# Gemfile
gem 'cloudinary', '~> 1.16.0'
bundle install
# .env
CLOUDINARY_URL=cloudinary://298522699261255:Qa1ZfO4syfbOC-***********************8

## UPLOAD PICS
* to machine
curl https://c1.staticflickr.com/3/2889/33773377295_3614b9db80_b.jpg > san_francisco.jpg
curl https://pbs.twimg.com/media/DC1Xyz3XoAAv7zB.jpg > boris_retreat_2017.jpg

* to CL
# rails c
Cloudinary::Uploader.upload("san_francisco.jpg")
Cloudinary::Uploader.upload("boris_retreat_2017.jpg")

* remove them from machine
rm san_francisco.jpg boris_retreat_2017.jpg

## LET'S DISPLAY THEM
<!-- app/views/articles/index.html.erb -->
<%= cl_image_tag("THE_IMAGE_ID_FROM_CL_LIBRARY",
      width: 400, height: 300, crop: :fill) %>

<!-- for face detection -->
<%= cl_image_tag("IMAGE_WITH_FACE_ID",
      width: 150, height: 150, crop: :thumb, gravity: :face) %>

## WE CAN ALSO UPLOAD PDF FILES WITH CL!!

## ACTIVE STORAGE
- it can conenct our images on CL to the Models that we have in our app;

## SETUP
rails active_storage:install
rails db:migrate

* CONFIG
<!-- config/storage.yml -->
cloudinary:
  service: Cloudinary

* Then Replace :local by :cloudinary in the config:
<!-- config/environments/development.rb -->
config.active_storage.service = :cloudinary

* REMEMBER TO ADD THIS TO THE MODEL:
class Article < ApplicationRecord
  has_one_attached :photo
end

* VIEW & CONTROLLER
<!-- app/views/articles/_form.html.erb -->
<%= simple_form_for(article) do |f| %>
  <!-- [...] -->
  <%= f.input :photo, as: :file %>
  <!-- [...] -->
<% end %>

<!-- app/controllers/articles_controller.rb -->
def article_params
  params.require(:article).permit(:title, :body, :photo)
end

## SHOW PAGE:
- attachement is nil error:
@article.photo.attached?
restart server...

## BACKGROUND IMAGE
* goes on index page
cl_image_path @article.photo.key

## SEED
You can upload from a URL.

`require "open-uri"`

`file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')`
`article = Article.new(title: 'NES', body: "A great console")`
`article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')`

## HELPFUL ACTIVE STORAGE METHODS
@article.photo.attached? #=> true/false
@article.photo.purge #=> Destroy the photo

Doc -> https://guides.rubyonrails.org/v5.2.2/active_storage_overview.html

## PRODUCTION
* Replace :local by :cloudinary in the config:

<!-- config/environments/production.rb -->
config.active_storage.service = :cloudinary
Make sure to push your CLOUDINARY_URL env variable to Heroku:

heroku config:set CLOUDINARY_URL=cloudinary://166....
Check with:

heroku config
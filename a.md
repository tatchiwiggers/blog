# intro
hosting is where we put our web app online
image upload allows the user of your app to upload images

# ENVIRONMENT
lets talk about envs

# DEVELOPMENT
So far we have been working in development mode
We have our local DB, our local server running, and in the browser we have our localhost

# PRODUCTION
but at some point we want to have a URL we people can actually go and visit our web app
this is where the production env comes in

# PRODUCTION 2
so we will have our DB and our rails server somewhere online -> and for this we will need a 
service 

# PRODUCTION 3
and the service we are going to use is HEROKU - heroku will wrap around the DB and the server
host our web app online so other ppl can visit our app

# NO MORE SQLITE. SAY HELLO TO
SO no more sqlite, it doenst work well with heroku and it is not a very
robust DB. it consists of one file and it suited us well when we were working
with small tasks back when we were learning AR. Now we are grown ups!! so we will
be using POSTGRESQL - a robust much more advanced AND open source database

# Look at your Gemfile -read

# QUICK WAGON SETUP - read

# SCAFFOLD A POST MODEL
explain why we need to comment out jbuilder
***Then generate a scaffold of Article.***
CHANGE EVERYTHING TO ROOT
root to: 'articles#index'

# HEROKU

# PRODUCTION
as i said before, heroku Will handle our rails server and our DB in the cloud

# SIGN UP
if you havent already, sign up

# HELP - read

# LOGIN
you can login from the terminal or you can simply run heroku login and it will open the browser
for you to link you account

# CREATE AN HEROKU APP - read
for a free plan the only region u can choose is eu

# WHAT HAPPENED?
explain git remote -v

GIT - HEROKU - ORIGIN  - HEROKU
so we have a new remote: locally on our laptop we have our repo where we will
have a local DB and a local server. so we are gonna have repos on heroku and github
the good thing is that heroku also uses git - so what we are gonna do is just
change the command from origin to master.

# LET'S DEPLOY - read

# DONE!
Explain the syntax
EXPLAIN ABOUT HEROKU RUN RAILS DB MIGRATE

# IMAGE UPLOAD
at some point you wanna have user side updaload on your app - just like airbnb
for example where the user, the host uploads photos of their apartments.. and
so on... whenever we push to heroku it wipes everything clean... so
if you save these photos inside you assets folder it'll wipe everything
clean eveythime you push to heroku - and that happens bc herokus dynos are ephemeral,
that is temporary... O que são DYNOS? All Heroku applications run in a collection 
of lightweight Linux containers that are called dynos, and these dynos are temp. 
But if you wanna know more, basta ler esse artigo sobre heroku dynos.
after class ok? AND - besides if you have thousands of users
you have thousands of pics inside of assets folder and your app will take
forever to load- and we dont want that.

# UPLOADING / STORING TO HEROKU? - read

# We need an external service

# CLOUDINARY

# CREATE A CLOUDINARY ACCOUNT
go on my account and show them

# WHERE DO WE PUT OUR SECRET KEYS? - read
explain what each line of the code does

# CLOUDINARY & ENVIRONMENT - read
always remember to restart de server after any config changes

# LET'S UPLOAD TWO PICTURES - read
upload in my console
show them in localhost

# LET'S DISPLAY THEM
<!-- app/views/articles/index.html.erb -->

# TRANSFORMATION REFERENCE - read explain

# You can upload also other file formats (PDFs, etc.)

# ACTIVE STORAGE
so we uploaded to pics manually but we want id for the user to
use a form to upload an image by selecting it from their HD
and for this we are gonna use active storage - it used to be
a gem but now its included in rails v 5.2 and above reason why
we has to do skip active storage....
so what it does is, it magicaly connects our images on CL 
to the models we have in our application

# SETUP
show them that it creates 2 tables: attachments and blobs
blobs are the files that we upload and the attachements
are the join table between our model and those files (blobs)
it references thos 2 tables.

# CONFIG - read

# MODEL - read show on code

# VIEW & CONTROLLER

# DISPLAYING THE IMAGE
<!-- app/views/articles/show.html.erb -->

# USAGE IN BACKGROUND-IMAGE
if you wanna use an image as background...

# SEED - show them my seeds

# HELPFUL ACTIVE STORAGE METHODS
show them in the view HOW to do a conditional for photo.attached?
or not.

SHOW PAGE!!!!

<%# as an image %>

<% if @article.photo.attached? %>
  <%# @article.photo.purge %>
  <%= cl_image_tag @article.photo.key, height: 250, width: 260, crop: :fill %>
<% else %>
<%# raise %>
  <h5>You have not added any pics to your article :(</h5>
<% end %>

# MULTIPLE IMAGES - from here on read everything

# VIEW & CONTROLLER

# BEHIND THE SCENES (DB SCHEMA)

# PRODUCTION
make sure you add the correct CL config for production as well

# GOING FURTHER - read
# README

Versions

Ruby: 3.3.5
PostgreSQL: 14

Local Setup Guide

SOME OF THIS ASSUMES LINUX OR UNIX, IF RUNNING WINDOWS LET ME KNOW
Install ruby 3.3.5, I prefer using RVM to do this but use whatever method you like
Install PostgreSQL version 14
On Mac OS use
`brew install PostgreSQL@14`
On Windows use 
`winget install --id=PostgreSQL.PostgreSQL.14  -e`
For Linux
use your favourite package manager

IF YOU DONT WANT TO USE THE COMMAND LINE GOTO https://www.postgresql.org/download/

Once those are installed navigate to the root directory of this app (the one with this readme) and run
`bundle install`
This installs all the gems in the gemfile including the correct rails version

Next setup a psql database
Run `psql`
then `CREATE DATABASE crashcon;` The name doesnt have to be crashcon but thats whats expected in this example you can change this in database.yml
Then you must create a user role for the rails app to use in this example thats crashcon
run `CREATE ROLE crashcon LOGIN PASSWORD 'ConceptualContinuity';` Note the role name and password can be anything but the example expects crashcon and ConceptualContinuity. Look in config/database.yml to change this but id reccomend using the same name as your rails app for the role name.

edit your /etc/hosts file to have the line after the normal localhost entry DO NOT DELETE OR REPLACE ANYTHING.
`127.0.0.1       reg.localhost`
`127.0.0.1       admin.localhost`
This needs doing for any extra subdomains you create, this allows you to access them when runnng the site locally for dev purposes.

the site should be accessed at http://localhost:3000
or http://reg.localhost:3000

use ruby console to give your user admin and bypass email confimation

user = User.find_by(email: 'test@email.com')
user.update(confirmed_at: Time.now)
user.update_attribute :admin, true

as an admin when logged in you see entire list of registrations in index view, with database id and user_id
you can edit any reg and edit anything except for the database id (unsure on if user_id edits work)
creating a new reg acts as normal, you currently cannot assign it to another user cos of how its handled, I will add this

Glossary
gems - Ruby Packages
rvm - Ruby Version Manager used so you can have multiple ruby versions on your pc at once
brew - A Mac OS package manager called homebrew, can be found here https://brew.sh
winget - The Microsoft Windows Package Manager more info is here https://learn.microsoft.com/en-us/windows/package-manager/winget/

IMPORTANT NOTES
Follow GDPR rules about how long to store data, what data to store and who has access. if you get more staff with admin access you should restrict what data they have access to based on what they need. for instance coms staff may not need access to medical info but med staff do.

When setting up the PSQL DB on whatever hosting service you use for production ENCRYPT IT. Thats a MUST not a should or could.

Rails follows the MVC pattern (Model View Controller)

TODO: Add Deploy Instructions, Extra info and more
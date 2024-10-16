# README

# Versions

Ruby: 3.3.5
PostgreSQL: 14

# Local Setup Guide

## Install ruby 3.3.5

I prefer using RVM to do this for UNIX like systems but use whatever method you like
### On Windows use
`winget install RubyInstallerTeam.Ruby.3.2`
or visit https://rubyinstaller.org and download the ruby installer for windows ensure its 3.3.5
check its installed by running `ruby --version`
install bundler by running `gem update --system`

## Install PostgreSQL version 14
### On Mac OS use
`brew install PostgreSQL@14`
### On Windows use 
`winget install --id=PostgreSQL.PostgreSQL.14  -e`
### On UNIX Like Systems
use your favourite package manager

IF YOU DONT WANT TO USE THE COMMAND LINE GOTO https://www.postgresql.org/download/

## Install Gems

Once those are installed navigate to the root directory of this app (the one with this readme) and run
`bundle install`
This installs all the gems in the gemfile including the correct rails version

## PostgreSQL Database Setup

Next setup a psql database
Run `psql`
then `CREATE DATABASE crashcon;` The name doesnt have to be crashcon but thats whats expected in this example you can change this in database.yml
Then you must create a user role for the rails app to use in this example thats crashcon
run `CREATE ROLE crashcon LOGIN PASSWORD 'ConceptualContinuity';` Note the role name and password can be anything but the example expects crashcon and ConceptualContinuity. Look in config/database.yml to change this but id reccomend using the same name as your rails app for the role name.

## Hosts Update

### On UNIX Like Systems use
edit your /etc/hosts file to have the line after the normal localhost entry DO NOT DELETE OR REPLACE ANYTHING.
`127.0.0.1       reg.localhost`
`127.0.0.1       admin.localhost`

### On Windows use
open your text editor as administrator (right click then click run as administrator)
open the hosts file found here C:\Windows\System32\drivers\etc\hosts you may need to change the file type in the open window from Text Documents to all Files
DO NOT DELETE OR REPLACE ANYTHING
add the lines
`127.0.0.1       reg.localhost`
`127.0.0.1       admin.localhost`
below the lines already in the file

### On Windows NO COMMANDLINE/EASIER VER
install Microsoft PowerToys either from store here https://apps.microsoft.com/detail/xp89dcgq3k6vld?hl=en-gb&gl=GB or from github here https://aka.ms/installpowertoys
open the powertoys application
navigate to Hosts File Editor on the side bar   (if you cant find it make sure Hosts File Editor is set to on in powertoy settings)
click launch hosts file editor
click new entry
for address use `127.0.0.1`
then for hosts use `reg.localhost`
make sure active toggle is on then click add
repeat but use
address `127.0.0.1`
hosts `admin.localhost`

The above hosts changes allow for you to navigate to the subdomains of the app when running locally, the steps must be repeated for any new subdomains.

# USAGE

the site should be accessed at http://localhost:3000
or http://reg.localhost:3000
or http://admin.localhost:3000

use ruby console to give your user admin and bypass email confimation

run
`bundle exec rails console`

`user = User.find_by(email: 'test@email.com')`
`user.update(confirmed_at: Time.now)`
`user.update_attribute :admin, true`

as an admin when logged in you see entire list of registrations on normal reg view index view, with database id and user_id
you can edit any reg and edit anything except for the database id (unsure on if user_id edits work)
you can create new registrations and assign them 

on admin site you can search equal to or contains per attribute and also a global search and filter based on if the reg is not accepted


# Glossary
gems - Ruby Packages
rvm - Ruby Version Manager used so you can have multiple ruby versions on your pc at once
brew - A Mac OS package manager called homebrew, can be found here https://brew.sh
winget - The Microsoft Windows Package Manager more info is here https://learn.microsoft.com/en-us/windows/package-manager/winget/

# IMPORTANT NOTES
Follow GDPR rules about how long to store data, what data to store and who has access. if you get more staff with admin access you should restrict what data they have access to based on what they need. for instance coms staff may not need access to medical info but med staff do.

When setting up the PSQL DB on whatever hosting service you use for production ENCRYPT IT. Thats a MUST not a should or could.

Rails follows the MVC pattern (Model View Controller) directories follow this concept.
Actions in controllers follow REST as best as possible

Avoid the use of magic numbers for example
`ConRegistrations.limit(1)` is bad practice, it makes it harder to read and maintain your app as when you need to update that number you wont be able to find it and may have to edit it in many locations
Instead at the top of the method define a constant, to do this make the variable name in all caps like this
`MAX_NUMBER_OF_REG_PER_CON = 1`
`ConRegistrations.limit(MAX_NUMBER_OF_REG_PER_CON)`
Now you can use that constant multiple times and edit just one thing to change it for all instances where its used
It must be all caps and a constant as that means the value is unable to be changed whilst the app is running, this is more safe and best practice



TODO: Add Deploy Instructions, Extra info and more
TODO: the reg creation magic numbers (except max reg per con) need moving into a database entry that is queried. also need to add reg open boolean
TODO: Rename accepted to approved and add some flavour text about approval
TODO: Setup mass mailer
TODO: Add extra admin features (statistics,see all pending approval, set con dates and deadlines and update some)

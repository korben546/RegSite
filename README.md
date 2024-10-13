# README

Versions

Ruby: 3.3.5
PostgreSQL: 14

Local Setup Guide

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


Glossary
gems - Ruby Packages
rvm - Ruby Version Manager used so you can have multiple ruby versions on your pc at once
brew - A Mac OS package manager called homebrew, can be found here https://brew.sh
winget - The Microsoft Windows Package Manager more info is here https://learn.microsoft.com/en-us/windows/package-manager/winget/

TODO: Add Deploy Instructions, Extra info and more
# Programming tips and info

## routes

### Viewing Routes

To see all routes run.

`bundle exec rails routes`

If in tutorials it tells you to run `rake routes` run the above command instead, rake routes got replaced years ago.

What that will do is show all types of routes formatted like this

Prefix    Verb     URI Pattern           Controller#Action


### Understanding Routes
The prefix is the name in rails/ruby for the request so you can do something like .
`<%= link_to “Make A Registration”, new_con_registration %>`

The new_con_registration is the prefix and that will route to the correct controller action when called inside your rails app.
Using prefixes means if you change the url to that action it should work without having to alter your links.

The verb is the HTTP Request Method which roughly follows CRUD.
A HTTP request will always have a verb.
For example
GET requests a page or data
POST submits data
PUT replaces or updates data
DELETE destroys data
There are more but that’s the main ones

So to go to the home page of the app it does a GET request at /

The URI Pattern is where it expects the request, the home page route expects the request to be done at / but the con registrations route expects it at /con_registrations with an id on the end which is passed as a parameter to the controller action.

The controller action is the location of the controller and what action in the controller that the request should be processed by.
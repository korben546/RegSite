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

## Using the Rails Console
there’s a console you can either use when the app is running or not with a different terminal window it lets you run commands on the fly and get their results.
I’ll document it better but you can do something like create a user manually and update the contents of their table in the console or edit some functions and variables.

What I tend to do with it is use it to check the state of things and what instructions return to debug them and to understand the data structure. For instance there’s a scope that makes only the last reg they made visible to the user and only their own reg. that returns the reg as a data structure when it’s passed in the user so
If you have a variable like this
var_1 = “super cool string”
Typing
var_1 in the terminal will give the output
“super cool string”

If the variable is an object or hash it will return something that looks like this <#user 28373837286>
To display the info in that object append .inspect to it

A more complex example I did is

I set a user variable based on a query to pull a user based on email address then put that into the scope rather than current_user as that doesn’t work from command line.
Then it returned the con_registrations that the user could see
That way I verified that the instruction worked
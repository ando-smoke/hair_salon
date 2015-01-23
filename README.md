Hair Salon
======================

Manages a collection of hair stylists and their respective clients.

Installation
------------

To run the primary application and/or any of the included RSpec files for
testing, run either the included Gemfile or manually
install the following gems:

```ruby
rspec
sinatra
sinatra-contrib
pg
```

If you want to run the included Gemfile, enter the following statements into
the command line:
```ruby
gem install bundler
bundle
```

Before the application can run, the user must have a version of
a Postgres database installed on their system. At the time of
creation of this application, Postgres 9.4 was used. Once within
a running session of Postgres PSQL, run the following commands
to create the necessary database schema for the application:
``` psql
CREATE DATABASE hair_salon;
\c hair_salon

CREATE TABLE clients (id serial PRIMARY KEY, first_name varchar, last_name varchar, stylist_id int);
CREATE TABLE stylists (id serial PRIMARY KEY, first_name varchar, last_name varchar);

CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
```

At the time of initial creation of this application, Ruby
version 2.1.5 was used.

Usage
-----

Upon completion of the above steps in the Installation section, open
up your preferred web browser and enter the following address:

```url
localhost:4567/
```

Initially populate the hair salon app with one or more hair stylists
via data entry fields for first and last name. As they are entered,
the current list of stylists is displayed in alphabetical order at the
bottom of the main html page. Clicking on any of the stylists takes the
end user to an additional html page listing the current list of clients
for that stylist, a data entry form to enter additional clients, and a
link back to the home page.

Known Bugs
----------

None as of 2015-01-23.

Author
------

Andy Uppendahl

License
-------

MIT license.

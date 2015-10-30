# Joerator

##### _A Rails Yelp Clone for Coffeeshops_

#### By **Tim Kellogg**

## Description

_Joerator is a Yelp clone written in Ruby on Rails 4.2 that focuses on Coffeeshops. Users can sign up, create coffeeshops, add reviews, search for their favorite shops, add menus, and find the best shops based on different ratings._

##  Setup

* `git clone` this file
* `cd` into the root of the app
* `bundle install` to install gem dependencies
* You may have to install imagemagick using `brew install` or `sudo-apt-get`
* `rake db:create` to create db
* `rake db:migrate` to build the tables
* `rake db:seed` to seed the db
* `rails s` to start the server
* `rspec` to test both integration and libraries

### Technologies Used

* Language: Ruby
* Stack: Rails
* Database: postgresql
* ORM: ActiveRecord
* Middleware: Rack/Railties
* Testing: Rspec/Capybara/Shoulda-matchers/FactoryGirl/Poltergiest
* Server: Puma
* Other Dependencies: listed in Gemfile.lock
* Front-End: Bootstrap/jQuery

### Features to Add

* Allow users the ability to delete their own reviews, or update coffeeshops that they added (possibly add email for the coffeeshop to apply to)
* Send email when coffeeshop that the user added has been approved
* instagram / facebook social plugins
* add diff levels of authentication for owners
* look up bulk upload for pictures / drag and drop
* Add order by menu items (do the same thing that you did with reviews by incremented with cofeeshops stuff)
* Send email when users account has been removed by admin 


### Legal

Copyright (c) 2015 **_Tim Kellogg_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# active_sinatra
Demonstrates Sinatra web framework with ActiveRecord, including test fixtures

To set up the database:

    rake db:migrate
    rake db:fixtures:load

To run the web server:

    ruby app.rb

Then hit the server in your browser at these addresses:

* [http://localhost:4567](http://localhost:4567)
* [http://localhost:4567/blogs](http://localhost:4567/blogs)
* [http://localhost:4567/blogs/413685242](http://localhost:4567/blogs/413685242)
* [http://localhost:4567/blogs/413685242/posts](http://localhost:4567/blogs/413685242/posts)
* [http://localhost:4567/posts/807550412](http://localhost:4567/posts/807550412)

To set up the tests:

    rake db:test:prepare

To run the tests:

    rake

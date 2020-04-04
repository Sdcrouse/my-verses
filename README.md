# MyVerses

Welcome to MyVerses! This is a Rails app that I built as my third Flatiron School project. It allows you to write your favorite Bible verses, and check out other people's favorites as well. My hope is that whoever uses this app will gain a better understanding and appreciation of God's Word.

## Features

This app allows you to:

* Create an account, either manually or through Facebook.

* Log in and log out.

* Create, read, update and delete your favorite Bible verses (or MyVerses).

* View a list of everyone's MyVerses.

* Search for MyVerses by book.

* View other people's profiles and individual MyVerses.

* View a list of Verse References (book, chapter, and verse) that have (or have had) at least one MyVerse created with them.
  * Note: Every time you create a new MyVerse, a new Verse Reference is added to this list, unless it is already there. It is not possible at this time to delete a Verse Reference.

* View a list of MyVerses with a specific Verse Reference.

* Create a new MyVerse with one of the listed Verse References.

## Installation

Since this app is not yet publicly available, you will need to fork and clone it onto your own computer. After that, you can install it with the following steps:

1. Run ```bundle install``` to install the gems.
2. Run ```rails db:migrate``` to set up the database.
3. Optionally, seed the database with ```rails db:seed```.

## Usage

To start the MyVerses app, run ```rails s``` in your terminal, and then navigate to http://localhost:3000. To exit the app, hit Ctrl-C or Cmd-C.

If you wish to play around with the (SQLite) database, run ```rails c``` in your terminal (or ```rails c -s``` if you don't want to save any changes to it). To exit, type in ```exit``` or hit Ctrl-D or Cmd-D.
  * Note: Be careful with ```rails c -s```. If you run ```reload!``` at any point to restart your console, your changes will in fact be saved upon exiting. This appears to be a bug.

You can also run the Rspec test suite. First, migrate the test database with ```rails db:migrate RAILS_ENV=test```. Then, run the tests with ```rspec```.

If you would like to see a demo of this app, go to https://www.loom.com/share/1a1cfaaba80e4f86af2298bc4170c8db.

There is also a walk-through of this app at https://www.youtube.com/watch?v=nFCklCUEjuE&feature=youtu.be.

## Development notes

* Ruby version: 2.6.1

* Rails version: 5.2.4.1

* In addition to Ruby and Rails, MyVerses makes use of the following gems:
  * Omniauth
  * Omniauth-facebook
  * Dotenv-rails
  * SQLite
  * Bcrypt
  * Rspec-rails
  * Pry

* I used Figma to help design my web pages. You can view those designs here: https://www.figma.com/file/ZVn3NeqHjnaxdM7MqjAjz1/Web-Pages?node-id=0%3A1.

## Contributing

Please feel free to raise a new Issue on my repository if you have any problems with my app (installation, usage, bugs, etc), or you have suggestions for a new feature. Pull requests are also welcome.

Contributors are expected to follow the project's code of conduct. This can be viewed in the CODE_OF_CONDUCT.md file.

## License

The MyVerses app is available as open source under the terms of the MIT License, which can be viewed in the LICENSE file.
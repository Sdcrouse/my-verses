# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project - I used `rails new` to create this project and used the Ruby on Rails framework to build the entire project.

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - A User has_many MyVerses and a VerseReference has_many MyVerses.
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) - A MyVerse belongs_to a User and a VerseReference
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) - A User has_many VerseReferences through MyVerses, and a VerseReference has_many Users through MyVerses.
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) - There is a many-to-many relationship between Users and VerseReferences, with MyVerse being the JOIN model.
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - A MyVerse (the JOIN model/ "through" part) has the following User-submittable attributes: version, verse_text, and reason_liked.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - 

  User model validations:
  - User has a secure password
  - User has a username
  - User has a unique, properly-formatted email

  VerseReference validations:
  - VerseReference has a book
  - VerseReference has a chapter that is a number between 1 and 150 (the min and max number of chapters in a book of the Bible)
  - VerseReference has a verse_start that:
    - Is optional unless the user writes a verse_end
    - If given, is a number between 1 and 176 (the min and max number of verses in a book of the Bible)
  - VerseReference has a verse_end that, if given:
    - Is a number that is higher than verse_start
    - Is <= 176

  MyVerse validations:
  - MyVerse belongs to a User (has a user_id)
  - MyVerse belongs to a VerseReference (has a verse_reference_id)
  - MyVerse has a version
  - MyVerse has a verse_text

  Note: These validations have been tested out in the Rspec files.

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - 
  MyVerse.in_book(book_title) URL: /my_verses/books/:book (e.g. /my_verses/books/Genesis)

  For the fun of it, I also added default scopes to the VerseReference and MyVerse model.
  By default, VerseReferences are sorted by book, chapter, verse_start, and verse_end.
  By default, MyVerses are sorted by verse_reference and version. In some cases, they are additionally sorted by username.
  The intent was to make it easier for users to find a MyVerse and/or VerseReference.

  Users can fill out a search form to find all MyVerses with a given book;
  that search form will return an error unless the user writes a valid book title.
- [x] Include signup (how e.g. Devise) - I wrote a signup page with a form and a corresponding route, UsersController action, and link. Users can only see and access this page when logged out.
- [x] Include login (how e.g. Devise) - I wrote a login page with a form and a corresponding route, SessionsController action, and link. Like the signup page, users can only use this page when logged out. Users can only login if they provide a valid email and password.
- [x] Include logout (how e.g. Devise) - I made a logout link and a corresponding route and SessionsController action. This link (which goes to SessionsController#destroy) can only be used and seen when the user is logged in.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - I used OmniAuth to allow users to sign up and login through Facebook.
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
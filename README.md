# Json Translations

This gem aims to store translations in a JSON field on the parent model.
It is designed to show all translations on one form, the idea is for an administrator to see and change all translations on a single form.
Also designed to have very little overhead in terms of effects on the database and parent model.

## Features

-  Stores translations in a single json field on the parent
-  Translates back to original column by default
-  Adds decorator to load these translations on form

## Installation

Add gem to your `Gemfile`.

```ruby
gem 'json_translations'
```

Generate a migration which will add a translation column to the object. In our example we will translate title on a Post

    $ rails g migration adding_title_translations_to_posts title_translations:jsonb

Run the migration(s).

    $ rake db:migrate

Then in your model add `has_translations(:title)`

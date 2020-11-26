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

Be sure in this migration file to add

    null: true, default: {}

Run the migration(s).

    $ rake db:migrate

Then in your model add `has_translations(:title)`

In your application.rb file be sure to have set

    config.i18n.available_locales = %i[en fr nl sv kr]

To whatever locales you have in your app

The gem comes with a handy form helper which can be used like

```
<%= form_with(model: todo_list, local: true) do |form| %>

  <%= form.label :description %>
  <%= form.text_area :description %>

  <%= form.fields_for JsonTranslations::TranslationsFormDecorator.new(@todo_list.description_translations) do |translations_form| %>
    <% JsonTranslations::TranslationsFormDecorator.available_locales.each do |locale| %>
      <%= form.label locale %>
      <%= translations_form.text_area locale %>
    <% end %>
  <% end %>

<% end %>
```

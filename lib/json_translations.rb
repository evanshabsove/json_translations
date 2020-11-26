require 'json_translations/translations_form_decorator'
require 'json_translations/model'
require 'json_translations/version'
require 'json_translations/translation_helper'

module JsonTranslations
end


# Inject `Draftsman::Model` into ActiveRecord classes.
ActiveSupport.on_load(:active_record) do
  include JsonTranslations::Model
end

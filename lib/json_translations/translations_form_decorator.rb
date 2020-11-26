# frozen_string_literal: true

module JsonTranslations
  class TranslationsFormDecorator
    # @see http://api.rubyonrails.org/classes/ActiveModel/Naming.html
    MODEL_NAME = ActiveModel::Name.new(self.class, nil, 'description_translations')

    def model_name
      MODEL_NAME
    end

    def initialize(hash)
      @object = hash.symbolize_keys
    end

    # Delegates to the wrapped object
    def method_missing(method, *args, &block)
      if @object.key? method
        @object[method]
      elsif @object.respond_to? method
        @object.send(method, *args, &block)
      end
    end

    def has_attribute?(attr)
      @object.key? attr
    end

    def self.available_locales
      I18n.available_locales - [I18n.default_locale]
    end
  end
end

module JsonTranslations
  module Model

    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods

      def has_translations(options = {})
        options.each do |attribute|
          create_methods(attribute)
        end
      end

      def create_methods(attribute)
        define_method :"translate_#{attribute}" do |locale|
          translation = send("#{attribute}has_translations")[locale]
          return translation if translation.present?

          send(attribute)
        end
      end
    end
  end
end

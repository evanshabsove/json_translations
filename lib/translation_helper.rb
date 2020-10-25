module TranslationHelper
  def tr(resource, field)
    translation = resource.send("#{field}_translations")[locale]
    return translation if translation.present?

    resource.send(field)
  end
end

ActionView::Base.send :include, TranslationHelper

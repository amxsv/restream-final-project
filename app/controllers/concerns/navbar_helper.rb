module NavbarHelper
  def languages
    return [] if request.path.empty?

    path_parts = request.path[1..request.path.length].split('/')
    path_parts.shift if I18n.available_locales.include? path_parts.first.to_sym

    languages = {}
    path = path_parts.join('/')

    I18n.available_locales.each do |locale|
      locale_path = (I18n.default_locale == locale) ? '/' + path : '/' + locale.to_s + '/' + path
      languages[locale.to_s.capitalize] = locale_path
    end

    languages
  end
end

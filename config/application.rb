require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TaskManager
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone users to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The users locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    #config.i18n.load_path += Dir[Rails.root.join('app', 'locales', '*.{rb,yml}').to_s]
    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.yml').to_s]

    locale_files = Dir["#{Rails.root}/config/locales/??.yml"]

    config.i18n.available_locales = locale_files.map do |d|
      d.split('/').last.split('.').first
    end

    config.i18n.default_locale = :en

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.autoload_paths += [Rails.root.join('app', 'validators').to_s]
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
  end
end

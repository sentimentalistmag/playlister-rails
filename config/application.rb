require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Playlister
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
      config.generators do |g|
        # config.test_framework...   #for example ise a different framework
          g.test_framework :rspec,
            :view_specs => false,
            :helper_specs => false
          g.fixtures :factory_girl, :dir=>'spec/factories'
          g.jbuilder  false
          g.coffee false
          g.view_specs false        #testing views, disabling as this may be weird, but also it maybe be useful
          g.helper false
          g.helper_specs false
          
      end
  end
end

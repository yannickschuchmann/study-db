require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Studydb
  class Application < Rails::Application
  	config.sass.preferred_syntax = :scss
  	config.sass.line_comments = false
  	config.sass.cache = false

		config.i18n.default_locale = :'de'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

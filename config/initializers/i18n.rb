# frozen_string_literal: true

# Permitted locales available for the application
I18n.available_locales = %i[en ru]

# Set default locale to something other than :en
I18n.default_locale = :ru

# Add attributes folder for models
I18n.load_path += Dir[Rails.root.join('config/locales/attributes/*.{rb,yml}')]

Scrivito.configure do |config|
  config.editing_auth { |env| env['warden'].user.try(:to_scrivito_user) }
  config.find_user { |email| User.find_by(email: email).try(:to_scrivito_user) }
end

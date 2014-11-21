Scrivito.configure do |config|
  config.editing_auth { |env| User.find(env['rack.session'][:email]).try(:to_scrivito_user) }
  config.find_user { |id| User.find(id).try(:to_scrivito_user) }
end

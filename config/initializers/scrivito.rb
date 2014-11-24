Scrivito.configure do |config|
  config.editing_auth do |env|
    Scrivito::User.system_user
  end
end

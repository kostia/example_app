Scrivito.configure do |config|
  config.editing_auth do |env|
    User.find_by(email: 'alice@scrivito.com').try(:to_scrivito_user)
  end

  config.find_user do |id|
    User.find(id).try(:to_scrivito_user)
  end
end

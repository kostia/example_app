Scrivito.configure do |config|
  config.editing_auth do |env|
    User.find_by(email: 'alice@scrivito.com').try(:to_scrivito_user)
  end

  config.find_user do |email|
    User.find_by(email: email).try(:to_scrivito_user)
  end
end

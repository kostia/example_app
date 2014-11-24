Scrivito.configure do |config|
  config.editing_auth do |env|
    if user = env['warden'].user
      user.to_scrivito_user
    end
  end

  config.find_user do |email|
    if user = User.find_by(email: email)
      user.to_scrivito_user
    end
  end
end

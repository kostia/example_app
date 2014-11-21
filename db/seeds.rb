%w[alice bob eve].each do |name|
  email = "#{name}@scrivito.com"
  next if User.find_by(email: email)

  User.new(email: email).tap do |user|
    user.password = 'testtest'
    user.password_confirmation = 'testtest'
    user.save!
  end
end

User.find_by(email: 'alice@scrivito.com').update_attributes(admin: true)

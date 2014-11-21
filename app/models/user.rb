require 'csv'

class User < Struct.new(:email, :role)
  class << self
    def find(id)
      users.find { |user| user.email == id }
    end

    def search(input)
      users.select { |user| user.email.include?(input) }
    end

    private

    def users
      CSV.new(open(Rails.root + 'users.csv')).map { |args| new(*args) }
    end
  end

  def to_scrivito_user
    Scrivito::User.define(email) do |scrivito_user|
      scrivito_user.description("User with E-Mail #{email}")
      scrivito_user.is_admin! if role == 'admin'
      scrivito_user.suggest_users { |input| User.search(input).map(&:to_scrivito_user) }
      scrivito_user.restrict_obj_publish(using: :path) do |path|
        return 'You can not publish the homepage' if path == '/' && role != 'admin'
      end
    end
  end
end

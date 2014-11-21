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
end

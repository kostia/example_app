# Encoding: utf-8

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  searchkick

  def to_scrivito_user
    Scrivito::User.define(email) do |scrivito_user|
      scrivito_user.is_admin!

      scrivito_user.suggest_users do |input|
        self.class.search(input).map(&:to_scrivito_user)
      end
    end
  end
end

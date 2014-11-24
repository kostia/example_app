# Encoding: utf-8

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  searchkick

  def to_scrivito_user
    Scrivito::User.define(email) do |scrivito_user|
      scrivito_user.suggest_users { |input| User.search(input).map(&:to_scrivito_user) }
      scrivito_user.restrict_obj_publish(using: :_path) do |path|
        'Sie dürfen die Homepage nicht veröffentlichen.' if path == '/' && !admin?
      end
      scrivito_user.is_admin! if admin?
    end
  end
end

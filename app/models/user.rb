class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  searchkick

  def to_scrivito_user
    Scrivito::User.define(email) do |scrivito_user|
      scrivito_user.is_admin! if admin?
      scrivito_user.suggest_users { |input| User.search(input).map(&:to_scrivito_user) }
      scrivito_user.restrict_obj_publish(using: :path) do |path|
        'You can not publish the homepage' if path == '/' && !admin?
      end
    end
  end
end

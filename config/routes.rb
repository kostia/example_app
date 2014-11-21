Rails.application.routes.draw do
  post   'users', to: 'users#login',  as: :login
  delete 'users', to: 'users#logout', as: :logout
end

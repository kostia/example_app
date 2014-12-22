class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Scrivito::ResourceNotFound do
    render '404'
  end

  private

  def homepage
    Obj.homepage
  end
  helper_method :homepage
end

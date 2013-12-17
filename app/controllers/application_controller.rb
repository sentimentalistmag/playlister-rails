class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_something, :is_logged_in , :authenticate_user!

  def is_logged_in
    false
  end

  def set_something
    session[:thing] = "you did it"
  end

  def current_user
    "Dmitri of course"
  end

  helper_method :current_user
end

class ApplicationController < ActionController::Base
  before_action :are_you_in
  protect_from_forgery with: :exception
   helper_method 'connected?'

  def connected?
    !session[:user].nil?
  end
end

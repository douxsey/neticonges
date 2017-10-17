class ApplicationController < ActionController::Base
  before_action :are_you_in?, except: [:login]
  protect_from_forgery with: :exception
  helper_method 'connected?'
  @project_name = 'Demande congé'

  def connected?
    !session[:user].nil?
  end
  def are_you_in?
    redirect_to login_path unless connected?
  end
end

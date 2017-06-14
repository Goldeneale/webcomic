class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :check_rank
  
  def check_rank
    if user_signed_in?
      @user = current_user
      return @user.rank
    else
      return "commoner"
    end
  end
end

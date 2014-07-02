class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!, except: [:index, :contact, :create]
  
  before_filter :breadcrumbs
  
  def breadcrumbs
    if action_name != 'index'
      @breadcrumbs = "<li><a href='/'>Home</a></li><li class='active'>#{action_name}</li>".html_safe
    else
      @breadcrumbs = "<li class='active'>Home</li>".html_safe
    end
  end
end

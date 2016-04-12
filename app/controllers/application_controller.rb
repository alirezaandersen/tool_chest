class ApplicationController < ActionController::Base
  helper_method :most_recent_tool
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def most_recent_tool
    if Tool.exists?(session[:most_recent_tool_id])
      Tool.find(session[:most_recent_tool_id])
    end
  end

end

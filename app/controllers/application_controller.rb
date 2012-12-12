class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  before_filter :authorize_mini_profiler

protected

  def authorize_mini_profiler
    if current_user.admin?
      Rack::MiniProfiler.authorize_request
    end
  end

end

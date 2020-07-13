require 'openstax/auth/strategy_2'

class ApplicationController < ActionController::API
  def error_404
    render json: "Bad Request", status: 404
  end
end

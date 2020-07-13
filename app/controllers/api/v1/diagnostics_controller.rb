class Api::V1::DiagnosticsController < Api::V1::BaseController
  before_action :validate_current_user_authorized_as_admin

  # Forcing an exception
  def exception
    raise "An exception for diagnostic purposes"
  end

  # Forcing a status code response
  def status_code
    head params[:status_code]
  end

end

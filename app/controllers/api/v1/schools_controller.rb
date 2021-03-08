class Api::V1::SchoolsController < Api::V1::BaseController
  before_action -> { verify_sso_cookie }

  # GET /schools?name=school-name
  def index
    if params['name'].present?
        @schools = School.where(name: params['name'])
        if @schools.blank?
          render json: {
              name: params['name'],
              error: 'School not found'
          }, status: :not_found and return
        end
    else
      @schools = School.paginate(page: params[:page], per_page: 20)
    end
    render json: @schools
  end

  # GET /schools/:id
  def show
    begin
      @school = School.find(params[:id])
      render json: @school, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: {
          error: e.to_s
      }, status: :not_found
    end
  end
end

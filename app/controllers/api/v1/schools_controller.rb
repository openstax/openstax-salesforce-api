# The primary controller for this API that implements CRUD for highlights
#
# See Api::V0::HighlightsSwagger for documentation
class Api::V1::SchoolsController < Api::V1::BaseController

  def index
    inbound_binding, error = bind(query_parameters, Api::V1::Bindings::GetSchoolssParameters)
    render(json: error, status: error.status_code) and return if error

    response_binding = Api::V1::Bindings::Schools.create_from_query_result(query_result)
    render json: response_binding, status: :ok
  end

  def summary
    inbound_binding, error = bind(query_parameters, Api::V1::Bindings::GetSchoolsSummaryParameters)
    render(json: error, status: error.status_code) and return if error

    response_binding = Api::V1::Bindings::SchoolsSummary.create_from_summary_result(summary_result)
    render json: response_binding, status: :ok
  end

  private

  def query_parameters
    request.query_parameters.tap do |parameters|
      # Swagger-codegen clients can't make the x[]=entry1&x[]=entry2 query parameter array
      # syntax, which means we have to use an alternate serialization of an array.  For
      # source_ids and colors we use CSV; here we do the comma splitting.
      parameters["salesforce_id"] = parameters["salesforce_id"].split(',') if parameters["salesforce_id"].is_a?(String)
      parameters["name"] = parameters["name"].split(',') if parameters["name"].is_a?(String)
    end
  end
end

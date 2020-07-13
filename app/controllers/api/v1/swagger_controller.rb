require 'uri'

class Api::V1::SwaggerController < ApplicationController
  include ::Swagger::Blocks

  ACCEPT_HEADER = 'application/json'
  BASE_PATH = '/api/v1'

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '0.1.0'
      key :title, 'OpenStax Salesforce API'
      key :description, <<~DESC
        The Salesforce API for OpenStax.

        Requests to this API should include `#{ACCEPT_HEADER}` in the `Accept` header.

        The desired API version is specified in the request URL, e.g. `[domain]#{BASE_PATH}/`. \
        While the API does support a default version, that version will change over \
        time and therefore should not be used in production code!
      DESC
      key :termsOfService, 'https://openstax.org/tos'
      contact do
        key :name, 'support@openstax.org'
      end
      license do
        key :name, 'MIT'
      end
    end
    tag do
      key :name, 'Salesforce'
      key :description, 'Salesforce endpoints'
    end
    key :basePath, BASE_PATH
    key :consumes, [ACCEPT_HEADER]
    key :produces, ['application/json']
  end

  SWAGGERED_CLASSES = [
      Api::V1::SchoolsSwagger,
      self,
  ].freeze

  def json
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end

class Api::V1::SchoolsSwagger < Api::V1::BaseController
  include Swagger::Blocks
  include OpenStax::Swagger::SwaggerBlocksExtensions


  swagger_schema :Schools do
    # organization from https://jsonapi.org/
    property :meta do
      property :name do
        key :type, :integer
        key :description, 'School name'
      end
      property :salesforce_id do
        key :type, :string
        key :description, 'Internal Salesforce ID for the school'
      end
      property :school_type do
        key :type, :string
        key :description, 'The type of school'
      end
      property :location do
        key :type, :string
        key :description, 'The location of the school'
      end
    end
  end


  swagger_path '/schools/{id}' do
    operation :get do
      key :summary, 'Find School by ID'
      key :description, 'Returns a single school if user has access'
      key :operationId, 'findSchoolById'
      key :tags, [
          'school'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of school to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      response 200 do
        key :description, 'school response'
        schema do
          key :'ref', :School
        end
      end
      response :default do
        key :description, 'unexpected error'
        schema do
          key :'ref', :ErrorModel
        end
      end
    end
  end

  swagger_path '/schools' do
    operation :get do
      key :summary, 'All Schools'
      key :description, 'Returns all schools from Salesforce'
      key :operationId, 'getSchools'
      key :produces, [
          'application/json'
      ]
      key :tags, [
          'schools'
      ]
    end
    response 200 do
      key :description, 'school response'
      schema do
        key :'$ref', :Schools
      end
    end
    response :default do
      key :description, 'unexpected error'
      schema do
        key :'$ref', :ErrorModel
      end
    end
  end
end
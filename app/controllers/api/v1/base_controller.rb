class Api::V1::BaseController < ApplicationController
  include Swagger::Blocks
  include OpenStax::Swagger::Bind

  protected

  def binding_error(status_code:, messages:)
    Api::V1::Bindings::Error.new(status_code: status_code, messages: messages)
  end
end

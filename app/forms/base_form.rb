# frozen_string_literal: true

class BaseForm
  include ActiveModel::Model
  attr_accessor :object, :params

  def initialize(object, params:)
    @object = object
    @params = params
  end

  def require_params(key)
    params[key] ? params.require(key) : params
  end
end

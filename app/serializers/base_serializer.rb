# frozen_string_literal: true

class BaseSerializer < Blueprinter::Base
  identifier :id

  field :created_at, datetime_format: '%Y-%m-%d %H:%M:%S'
  field :updated_at, datetime_format: '%Y-%m-%d %H:%M:%S'

  association :errors, blueprint: ErrorSerializer

  view :excludes_base do
    excludes :errors, :created_at, :updated_at
  end
end

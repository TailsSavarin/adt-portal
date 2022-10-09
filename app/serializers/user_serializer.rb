# frozen_string_literal: true

class UserSerializer < BaseSerializer
  field :bio
  field :login
  field :email
  field :phone
  field :location
  field :telegram
  field :position
  field :last_name
  field :first_name
  field :middle_name
  field :birthday, datetime_format: '%d.%m.%Y'
end

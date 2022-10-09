# frozen_string_literal: true

class ErrorSerializer < Blueprinter::Base
  field :messages
  field :full_messages
end

# frozen_string_literal: true

class FileSerializer < Blueprinter::Base
  identifier :id

  field :url do |obj|
    Rails.application.routes.url_helpers.rails_blob_url(obj)
  end
  field :name do |obj|
    obj.blob&.filename&.to_s
  end
  field :created_at do |obj|
    obj.blob&.created_at&.strftime('%Y-%m-%d %H:%M')
  end
  field :extension do |obj|
    obj.blob&.filename&.to_s&.split('.')&.last
  end

  view :url do
    excludes :name, :created_at, :extension
  end
end

# frozen_string_literal: true

class UserQuery < BaseQuery
  SEARCH_PARAMS = %i[email login first_name last_name middle_name].freeze
  FILTER_PARAMS = %i[id].freeze

  private

  def search(scope, query)
    search_with_ilike_text(scope, query, 'users', params_list: SEARCH_PARAMS)
  end

  def filter(scope, params)
    filter_by_params(scope, params, params_list: FILTER_PARAMS)
  end
end

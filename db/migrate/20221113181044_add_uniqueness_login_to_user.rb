# frozen_string_literal: true

class AddUniquenessLoginToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :login, false
    add_index :users, :login, unique: true
  end
end

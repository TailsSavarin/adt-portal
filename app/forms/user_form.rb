# frozen_string_literal: true

class UserForm < BaseForm
  def save
    object.update(user_params)
    object.errors.blank?
  end

  private

  def user_params
    require_params(:user).permit(
      :login,
      :password,
      :email,
      :first_name,
      :last_name,
      :middle_name,
      :location,
      :phone,
      :telegram,
      :birthday,
      :position,
      :bio,
      avatar: {}
    )
  end
end

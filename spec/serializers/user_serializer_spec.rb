# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSerializer do
  let(:user) { build(:user) }

  it 'correct default format' do
    expect(described_class.render_as_hash(user)).to match(
      {
        id: user.id,
        bio: user.bio,
        email: user.email,
        login: user.login,
        phone: user.phone,
        errors: kind_of(Hash),
        location: user.location,
        telegram: user.telegram,
        position: user.position,
        last_name: user.last_name,
        created_at: user.created_at,
        updated_at: user.updated_at,
        first_name: user.first_name,
        middle_name: user.middle_name,
        birthday: user.birthday.strftime('%d.%m.%Y')
      }
    )
  end
end

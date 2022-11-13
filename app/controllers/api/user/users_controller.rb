# frozen_string_literal: true

module Api
  module User
    class UsersController < BaseController
      before_action :find_user, only: %i[show update destroy]

      def index
        scope = ::User.all
        @pagy, users = pagy(UserQuery.new(scope).call(params))
        render json: UserSerializer.render(users)
      end

      def show
        render json: UserSerializer.render(@user)
      end

      def create
        form = UserForm.new(::User.new, params:)
        status = form.save ? :created : :unprocessable_entity
        render json: UserSerializer.render(form.object), status:
      end

      def update
        form = UserForm.new(@user, params:)
        status = form.save ? :ok : :unprocessable_entity
        render json: UserSerializer.render(form.object), status:
      end

      def destroy
        return render_error(I18n.t('api.users.errors.destroy')) unless @user.destroy

        head :no_content
      end

      private

      def find_user
        @user = ::User.find_by(id:)
        render_error(I18n.t('api.users.errors.not_found'), status: :not_found) unless @user
      end
    end
  end
end

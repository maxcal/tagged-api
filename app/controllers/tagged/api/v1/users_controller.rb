
module Tagged
  class Api::V1::UsersController < Api::V1::APIController

    respond_to :json

    before_action :set_user, only: INDIVIDUAL_ACTIONS
    before_action :validate_params!, only: [:update, :create]

    def show
      respond_with @user
    end

    def index
      @users = Tagged::User.all
      respond_with @users
    end

    def create
      @user = Tagged::User.create(user_params)
      respond_with @user, location: -> { api_v1_user_url(@user) }
    end

    def update
      @user.update(user_params)
      respond_with @user
    end

    def destroy
      @user.destroy
      respond_with @user
    end

    private

    def set_user
      @user = Tagged::User.find(params[:id])
    end

    private

    def validate_params!
      unless params[:data].try(:[], :type) == 'tagged_users'
        raise ActionController::ParameterMissing, "data[:type] must be 'tagged_users'"
        return
      end
    end

    def user_params
      params.require(:data)
            .require(:attributes)
            .permit(:email)
    end
  end
end

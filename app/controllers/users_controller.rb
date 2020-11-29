class UsersController < ApplicationController
  before_action :authenticator

  def create
    if @authenticator.valid_credentials?(user_params[:google_id_token])
      payload = @authenticator.payload
      @user = User.create(email: payload["email"], google_account_id: payload["sub"], given_name: payload["given_name"], family_name: payload["family_name"])
      if @user.valid?
        # token = encode_token(user_id: @user.google_account_id)
        # render json: {user: @user, token: token}
        render json: {user: @user}
      else
        render json: {error: "Invalid username or password"}
      end
    else 
      render json: {error: "Invalid id token received"}
    end
  end

  def login
    if @authenticator.valid_credentials?(user_params[:google_id_token])
      payload = @authenticator.payload
      @user = User.find_by(google_account_id: payload["sub"])
      if @user 
        # token = encode_token(user_id: @user.google_account_id)
        # render json: {user: @user, token: token}
        render json: {user: @user}
      else 
        render json: {error: "User not found"}
      end
    else
      render json: {error: "Invalid id token received"}
    end
  end

  private

  # Should this be private? 
  def authenticator
    @authenticator = Authenticator.new(Rails.application.credentials.google_client_id)
  end

  def user_params 
    params.require(:user).permit(:google_id_token)
  end
end

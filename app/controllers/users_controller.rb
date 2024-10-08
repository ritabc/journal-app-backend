require "securerandom"

class UsersController < ApplicationController
  include SeedUserData
  # In general, every action should first call authorized method (as defined by app_controller)
  # Skip it before create and login here
  skip_before_action :authorized, only: [:create, :login]
  
  def create
    puts "create"
    begin
      payload = Google::Auth::IDTokens.verify_oidc user_params[:google_id_token], aud: Rails.application.credentials.google_client_id
    rescue => exception
      puts exception.backtrace
      render json: {error: "Invalid id token received: " + exception.backtrace}
    else
      @user = User.create(id: SecureRandom.uuid, email: payload["email"], google_account_id: payload["sub"], given_name: payload["given_name"], family_name: payload["family_name"])
      if @user.valid?
        seed_initial_user_data @user.id
        token = encode_token(account_id: @user.google_account_id)
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end
  end

  def login
    puts user_params[:google_id_token]
    user_params[:google_id_token]
    begin
      payload = Google::Auth::IDTokens.verify_oidc user_params[:google_id_token], aud: Rails.application.credentials.google_client_id
    rescue => exception
      puts exception.backtrace
    # puts payload
    # if payload.nil?
      render json: {error: "Invalid id token received: " + exception.full_message}
    else
      @user = User.find_by(google_account_id: payload["sub"])
      if @user 
        token = encode_token(account_id: @user.google_account_id)
        render json: {user: @user, token: token}
      else
        render json: {error: "User not found"}
      end
    end
  end

  def auto_login
    render json: @user
  end

  def wipe_seeded
    wipe_seeds @user.id
  end

  private
  # def authenticator
  #   @authenticator ||= Authenticator.new(Rails.application.credentials.google_client_id)
  # end

  def user_params 
    params.require(:user).permit(:google_id_token)
  end
end

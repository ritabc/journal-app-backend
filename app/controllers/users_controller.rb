class UsersController < ApplicationController

  def login 

    authenticator = Authenticator.new(Rails.application.credentials.google_client_id)
    if authenticator.valid_credentials?(user_params[:google_id_token])
      byebug
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:google_id_token)
  end
end

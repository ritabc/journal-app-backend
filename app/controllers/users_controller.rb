class UsersController < ApplicationController

  def login 

    # TODO: Secure with strong params
    id_token = params[:id_token]

    authenticator = Authenticator.new(Rails.application.credentials.google_client_id)
    if authenticator.valid_credentials?(id_token)
      byebug
    end
  end

  private
  
  # def id_token
  #   params.require(:user).permit(:id_token)
  # end
end

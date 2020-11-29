class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end
  
  # private

  def auth_header
    if request.headers["Authorization"].present?
      request.headers["Authorization"]
    end
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ').last
      begin
        JWT.decode(token, Rails.application.credentials.secret_key_base, true, {algorithm: 'HS256'})
      rescue JWT::DecodeError => e
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      account_id = decoded_token[0]['account_id']
      @user = User.find_by(google_account_id: account_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    unless logged_in? 
      render json: {message: "Please log in"}, status: :unauthorized 
    end
  end
end

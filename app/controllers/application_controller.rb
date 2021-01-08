class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    exp = Time.now.to_i + 4 * 3600
    exp_payload = { data: payload, exp: exp }
    JWT.encode(exp_payload, Rails.application.credentials.secret_key_base)
  end
  
  # private

  def auth_header
    if request.headers["Authorization"].present?
      request.headers["Authorization"]
    end
  end

  # Get the token from the Authorization header and decode it with JWT gem
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

  # Upon receiving decoded token, find the user given the decoded data
  # All actions calling authorized before they execute will then have access to this user
  def logged_in_user
    if decoded_token
      account_id = decoded_token[0]['data']['account_id']
      @user ||= User.find_by(google_account_id: account_id)
    end
  end

  # Return true if there's a user logged in
  def logged_in?
    !!logged_in_user
  end


  # Before every action except /login and /signup
  def authorized
    unless logged_in? 
      render json: {message: "Please log in"}, status: :unauthorized 
    end
  end
end

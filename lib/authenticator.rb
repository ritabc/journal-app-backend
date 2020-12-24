class Authenticator
  attr_reader :payload

  def initialize(google_client_id)
    @google_client_id = google_client_id
  end

  def valid_credentials?(token)
    validator = GoogleIDToken::Validator.new
    begin
      @payload = validator.check(token, Rails.application.credentials.google_client_id)
      puts "payload"
      puts @payload
      puts JWT.decode(token, nil, false)[0]['aud']
      true
    rescue GoogleIDToken::ValidationError => e
      puts "error"
      puts e
      puts JWT.decode(token, nil, false)[0]['aud']
      puts Rails.application.credentials.google_client_id
      false
    end
  end
end
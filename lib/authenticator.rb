class Authenticator
  attr_reader :payload

  def initialize(google_client_id)
    @google_client_id = google_client_id
  end

  def valid_credentials?(token)
    byebug
    validator = GoogleIDToken::Validator.new
    begin
      @payload = validator.check(token, Rails.application.credentials.google_client_id)
      puts "payload"
      puts @payload
      true
    rescue GoogleIDToken::ValidationError => e
      puts "error"
      puts e
      false
    end
  end
end
class Authenticator
  attr_reader :payload

  def initialize(google_client_id)
    @google_client_id = google_client_id
  end

  def valid_credentials?(token)
    validator = GoogleIDToken::Validator.new
    begin
      @payload = validator.check(token, Rails.application.credentials.google_client_id)
      true
    rescue GoogleIDToken::ValidationError => e
      false
    end
  end
end
require 'rails_helper'

describe "verification of google id token" do
  it "does not verify a nonsense token" do
    google_id_token = "abc"
    authenticator = Authenticator.new(Rails.application.credentials.google_client_id)
    expect(authenticator.valid_credentials?(google_id_token)).to be(false)
  end
end
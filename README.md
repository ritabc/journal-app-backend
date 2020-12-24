# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version: 2.7.2

- Dependencies
  -- Postgres

- Gems Added
  -- jwt
  -- google-id-token

- Database creation
  `$ rails db:create` to create databases in Postgres (journal_backend_development and journal_backend_test)

- How to run the test suite

- Deployment instructions
  -- `$ rails db:migrate db:test:prepare`

- Resources/Tutorials Referenced
  -- https://medium.com/better-programming/build-a-rails-api-with-jwt-61fb8a52d833
  -- https://medium.com/compiling/how-to-implement-google-sign-in-for-a-ruby-web-app-b8b1e50a3a51
  -- https://www.pluralsight.com/guides/token-based-authentication-with-ruby-on-rails-5-api

- To access user's own journals:
  - Use Google Signin on an app like [this](https://github.com/ritabc/journal-app-frontend) one, and Sign In.
  - Copy the 'Token ID', and add it to the 'Authorization' header on the request: GET .../journals

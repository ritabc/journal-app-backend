# Backend API for Journal Recorder

An API with Google Sign In authentication and JWT authorization. The backend for the [Journal Recorder](https://github.com/ritabc/journal-app-frontend) application.

## Models and Associations

The main models are users, journals, and notes. Notes belong to a journal, and journals belong to a user.

## Uses

- Ruby version: 3.3.5
- Postgres
- jwt gem
- google-id-token gem

## Resources/Tutorials Referenced

- https://medium.com/better-programming/build-a-rails-api-with-jwt-61fb8a52d833
- https://medium.com/compiling/how-to-implement-google-sign-in-for-a-ruby-web-app-b8b1e50a3a51
- https://www.pluralsight.com/guides/token-based-authentication-with-ruby-on-rails-5-api

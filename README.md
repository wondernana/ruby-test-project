# README

## Example test automation project for a demo Ruby on Rails application. ##
Application code is under `app/` directory, test code under `test/`.

Includes different level tests:

- system / e2e tests are run with `rails test test/system/`
- functional / API tests are run with `rails test test/controllers`
- integration tests are run with `rails test test/integration`
- unit tests are run with `rails test test/models`

To run all tests use:
`rails test`

To start the app use:
`rails s`

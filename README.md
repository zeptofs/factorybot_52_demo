# Description

There is an issue of upgrading the app to FactoryBot 5.2 and I am trying to reproduce the error in a greenfield app
with similar models to see if it is an issue with FactoryBot. So far, I think it is also compounded with RSpec being
our test suite (something about `let` memoising stuff "too early").

# To Run

1. `bundle install`
2. `bundle exec rspec spec`

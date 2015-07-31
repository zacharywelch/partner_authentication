# PartnerAuthentication

Partner ID Authentication for rails api

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'partner_authentication', git: 'git@cagit.careerbuilder.com:zwelch/partner_authentication.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install 'partner_authentication', git: 'git@cagit.careerbuilder.com:zwelch/partner_authentication.git'

Run the install generator.

    $ rails g partner_authentication:install

This generates an `ApiKey` model and executes `rake db:migrate` with the new migration.

## Usage

Each `ApiKey` is mapped to a partner ID token in the `partners` table.

An authentication filter is automatically included in `ActionController::Base` or `ActionController::API` if you're using [rails-api](https://github.com/rails-api/rails-api). 

Authorization headers are expected in the following format:

    Authorization: Partner <partner id>:<partner password>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add tests for your feature.
4. Add your feature.
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new Pull Request
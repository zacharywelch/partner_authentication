# PartnerAuthentication

Partner ID Authentication for rails api

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'partner_authentication', git: 'git@cagit.careerbuilder.com:zwelch/partner_authentication.git'
```

And then execute:

    $ bundle

Run the install generator.

    $ rails g partner_authentication:install

Run the migrations.

    $ rake db:migrate

Run the authentication task.

    $ rake db:authentication

## Usage

After installing the gem two models are added to your `app/models` directory.

[ApiKey](https://cagit.careerbuilder.com/zwelch/partner_authentication/blob/master/lib/generators/partner_authentication/templates/api_key.rb) represents an api token and is mapped to the `partners` table. [AuthorizedIp](https://cagit.careerbuilder.com/zwelch/partner_authentication/blob/master/lib/generators/partner_authentication/templates/authorized_ip.rb) maintains a list of trusted IPs, which can be static or ranges.

An authentication filter is automatically included in `ActionController::Base` or `ActionController::API` if you're using [rails-api](https://github.com/rails-api/rails-api). 

Authorization headers are expected in the following format:

    Authorization: Partner <partner id>:<partner password>

After running the authentication task a sample partner of `foo:bar` was created for you in development.

    Authorization: Partner foo:bar

## Testing

The partner authentication gem provides rspec support for authorization in requests.

First include the `:authorization` shared context at the top of your spec.

```ruby
describe 'Users API' do

  include_context :authorization

  # ...
end
```

Then with each request pass `auth_token` in the headers.

```ruby
get "/users", {}, auth_token
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add tests for your feature.
4. Add your feature.
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new Pull Request
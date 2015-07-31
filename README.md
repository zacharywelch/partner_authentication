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

This generates migrations and models for partner authentication.

## Usage

After installing the gem two models are added to your `app/models` directory.

[ApiKey](https://cagit.careerbuilder.com/zwelch/partner_authentication/blob/master/test/dummy/app/models/api_key.rb) represents an api token and is mapped to the `partners` table. [AuthorizedIp](https://cagit.careerbuilder.com/zwelch/partner_authentication/blob/master/test/dummy/app/models/authorized_ip.rb) maintains a list of trusted IPs, which can be static or ranges.

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
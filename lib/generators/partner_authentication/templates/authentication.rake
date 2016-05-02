namespace :db do
  desc "Fill database with sample partner authentication"
  task authentication: :environment do
    key = ApiKey.find_or_create_by! key: 'foo', token: 'bar'
    key.authorized_ips.find_or_create_by! ip_address: "::1"
  end
end

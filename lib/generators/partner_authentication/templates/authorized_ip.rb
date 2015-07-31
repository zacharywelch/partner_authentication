class AuthorizedIp < ActiveRecord::Base
  self.table_name = "ip_addresses"

  belongs_to :api_key, foreign_key: :partner_id

  def pattern
    Regexp.new ip_address.gsub('.', '\\.').gsub('*', '\\d{1,3}')
  end
end

class AuthorizedIp < ActiveRecord::Base
  self.table_name = "cbpartneripaddress"

  alias_attribute :ip_address, :IPAddress
  
  belongs_to :api_key, primary_key: :PartnerID, foreign_key: :PartnerID

  def pattern
    Regexp.new ip_address.gsub('.', '\\.').gsub('*', '\\d{1,3}')
  end
end

class ApiKey < ActiveRecord::Base
  self.table_name = "partners"

  alias_attribute :key, :partner_id
  alias_attribute :token, :partner_password

  def self.authenticate(key, token)
    find_by(key: key, token: token)
  end
end

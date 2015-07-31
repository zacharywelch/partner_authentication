class ApiKey < ActiveRecord::Base
  self.table_name = "partners"

  alias_attribute :key, :partner_id
  alias_attribute :token, :partner_password

  has_many :authorized_ips, foreign_key: :partner_id, dependent: :destroy

  def authorized?(ip)
    authorized_ips.map(&:pattern).any? { |pattern| pattern.match(ip) }
  end

  def self.authenticate(key, token)
    find_by(key: key, token: token)
  end
end

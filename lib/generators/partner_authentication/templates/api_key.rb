class ApiKey < ActiveRecord::Base
  self.table_name = "cbpartner"

  alias_attribute :key, :PartnerID
  alias_attribute :token, :PartnerPassword

  has_many :authorized_ips, foreign_key: :PartnerID, dependent: :destroy

  def authorized?(ip)
    authorized_ips.map(&:pattern).any? { |pattern| pattern.match(ip) }
  end

  def self.authenticate(key, token)
    find_by(key: key, token: token)
  end
end
